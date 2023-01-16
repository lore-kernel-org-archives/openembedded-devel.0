Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B5FC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 11:53:47 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.60])
 by mx.groups.io with SMTP id smtpd.web10.164566.1673870026103186793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 03:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=V9VQF5T3;
 spf=pass (domain: siemens.com, ip: 40.107.20.60, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTlXU2rPPXBb4gwuF7NvOnzHCWzUKY9cQXZUZixMOv7rUR+nKtrA58fWCRq+neZbmdVVANdqwoQzzlN2FBa8P1dQOm6Kk6rBZGZl7S5JADEDJll92bWAQZXlOQr4muYzwF/885Nzc4R6FqGOSZq7ihu8c6i7c550+dNi46nHlcV4uMJO3+01MclT/Kaea7M9Fwe/DtIpUzMUr4zpYOAUFaWCnOBECbRbEOJJKQ3ZHx+pHa81S4YE0U47XNgUYEP3lJ1my6hUEsmSlxS2tggYPcqSmnnU+eqrcLPrv424KEjxmsaZBSfFNPf8nTZLv6QeCXIrVi7swRf0vmg1lfj1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcToMG4RzsatrXR5mRarnCNso2iDpQjJcKa6XC4KoQ0=;
 b=ChLeFWWH/eCOBFj4/CeTq0n1UgOGN7nuHU2wpRH5kqY4+CRxJcs1P156mDUZQNTOKAQJXSa46eH1xFeiG6uDTszoJPHH6B6pt3n96LPc2z0BDpohW9n1Qx8HYu6gH6lQaRILqsoRvSQDbRE8zxx6e6GetWFCKIMa7Hp0uFFHoR9x50xIklZ0ajtACpL82b1VYHryjIQfiI03JyztvM6OocOwPvK3ntlzEdcKWNFKrw4zvbGAqye/eVeQiOEo2dyEQKjfYXgeLO1TFe5zw/liTcAJ9HFvXyrm70tW2SvqymzH24K9OErmxOGgE/Uh/cmmtgtRYD/OfJnPpEC9/S+SmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcToMG4RzsatrXR5mRarnCNso2iDpQjJcKa6XC4KoQ0=;
 b=V9VQF5T3XmIt6/fiQdg9eeU2HnDLK+QzfhjTk9OypiGQnPiAbydyILuOFGa9cUR2mEwwBFczxVrSOWvtaB18KvpVaCzwhweDlugZmHnJVkCezYnCB1Qe64czbxiBI/PxM6fIacvYVcjZim+fCm8/DVaHYpdJSaSWMMBtUuZB23s1QKa3lRtgT2/Q5edcavhhxF8dt+h5BY9rN9JfpLV9GUxkdgwVQ5nK3r2QW3HOjcZW8u3bHEFoSdibjtnWCEJ7id1whzXFakKYW0Mk1cd+yD1QbAgp6loocPSLVhhvOnW5mu48J5sR9EAntZCs5bxOl73cGR8JGb2nw1/G/9DMUQ==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by AM0PR10MB3155.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Mon, 16 Jan
 2023 11:53:43 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b1b4:7747:54f9:cfd5]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b1b4:7747:54f9:cfd5%6]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 11:53:43 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>, "randy.macleod@windriver.com"
	<randy.macleod@windriver.com>, "akuster808@gmail.com" <akuster808@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] gRPC
Thread-Topic: [oe] gRPC
Thread-Index: AQHZJY60vfVbk9eiN0axk2UE/bSI3q6ZhA0AgAAFbgCAAIWBAIAG6EIA
Date: Mon, 16 Jan 2023 11:53:43 +0000
Message-ID: <355cb47d9174b4186a381fa04c957b6a4e46eb90.camel@siemens.com>
References: <7b00f80d33fc4d77eafcddb8ba46b992d713df25.camel@siemens.com>
	 <CAOSpxdapG_z_H0DrcRc=N6AczcPykLLBd+zfHbLCqTFGvOC0Lw@mail.gmail.com>
	 <CAMKF1so06NJLbWAY-XnCQSNoksGOHZ=3XhT+Mbqzz7tJ6FdA_Q@mail.gmail.com>
	 <39bd49a5-910a-6f48-0bb9-d59424b2bb46@windriver.com>
In-Reply-To: <39bd49a5-910a-6f48-0bb9-d59424b2bb46@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|AM0PR10MB3155:EE_
x-ms-office365-filtering-correlation-id: 90e52ac1-6303-4476-8c77-08daf7b85111
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sxSRHNwfEYtgVeNuwgk2OVEOBLzdBurFRRNVpzfhXA1V3dF3NLB3csQ4577RMk0V4xZ3TV0RPmk1ZlU+3RnUjs0FZC9XkNzncXDUoA00fdN7FWyXnF6KlkIVDdshLqBKt3ThWmvMU9ksxCNK5cyoenrvFcu/okEAH0ZM7JyxXOnK42D5nfnKcxLLEc/mTzSN9mSXl7aei0bnAy238QzsjhI6ET4w/c6Ofkl4PhTNF177fzBOuuv6Vu+/6xMxBJ9p4BULWk9c6aamW7MgA7ix/xyC6QF6VkZ4uJLnVDAtlk1mrNo3Xed721dxuK9emPo9ET7C86QItDim5RMv9D3ngMC5RoIpIVq7wwLbGvYruGyjM+1lzAFMRO04nCVj9Jhi2rj2xB3VeGL1ISzPrwbPanFWerUZRXPvXIrmUFxdlYC16RMuNJfnNLuSzrwNF8vGyAXCwL+GhNuuXEXyfQsA6J38Z+/Yu3tFeEtXLtMoLMEJ8c1qhGLyRQfWreB3MTJy1zLRjglpC9baJE3A6FzCPH9or5qqpOYfkXKym03GNQF46BOfVA9tOnsl4iVtLIG3QwR3TpGw20EnP8nC70s+xSXjo/FltLNSl93ITwxLgCdTpkgj3tv+e33JMhclF++p+hehfqJI6cft2f74iu8P1k1Pf03YYMYvn7QMaonHZczXcOv5qTPAWyQe3/S4IpEMCNtpfa3V+6BiBP+K75akbGEzRxSIXCe7j4C9Kz3CM0chi08c72ELiqEg2ixi1IzFGDsg4ZQ3M7EWBZIU5Uqt5w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199015)(6512007)(38070700005)(122000001)(71200400001)(82960400001)(478600001)(36756003)(38100700002)(53546011)(55236004)(6486002)(966005)(6506007)(186003)(86362001)(66946007)(8936002)(41300700001)(5660300002)(26005)(4326008)(66446008)(66556008)(8676002)(66476007)(76116006)(64756008)(83380400001)(91956017)(316002)(2616005)(110136005)(66899015)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MnhVVDI1NHp1OXJWcW80d1FHc1ZyMmk1TGFFZExZUkhvWEtmSmgwZElwVGhy?=
 =?utf-8?B?ZzRQNjJLMnBZRXluMnQxK09BZk02cWNHL2VzOHFReWJvQUJ5TUJWZWd0QUNG?=
 =?utf-8?B?c2NLbXNPNkVLK3pObm5OUk0rSHFmY3RtMExJMmc2T0k5aTlWdnJlbWtiWTZF?=
 =?utf-8?B?Smh0NUJxKzZYbUdNRW1jMTd2S1ptY2RGdzF5U0JOT0JtYTZ0dnZYRkg5dURr?=
 =?utf-8?B?b2Y0bFFsbDlmZDRNRHA4eEVHMEZKUG93R0xQaWE5cnZjYzEvMTcvUFdWVWov?=
 =?utf-8?B?TGp4THhid1BwMmYzcmFKZ0l5UllrdzM2Z2JHSHliV2Y0eWUyRHRvcVVkdU94?=
 =?utf-8?B?SXpmM0h1VTV4L29DWWJaZWVkUW1waWpjRVY4cHBYZU5FUm5XS2NDYTllamVv?=
 =?utf-8?B?bTF4eDFpMUxkMmIrdzc0VnpQTHl3anBLRDlzTHRtNExzU0h6RTBuUnFieWtv?=
 =?utf-8?B?YVNJMkk4ZGIrc3JrRGc0SjZNVG9ub3BkeWIyanIxWFdSbGFGcVJsV291YU5n?=
 =?utf-8?B?NzEyQm1MNFBveitETUt5Y1ZwVHk3bHcyMGhvWjJlWVVCL1FQK3VXSmJPbktn?=
 =?utf-8?B?djF2OUpXS0tXWjhZR3YvUlp6MnJJZ1hpVXNhL3BET3A4QmNObEcwc0xzcy9O?=
 =?utf-8?B?OVJLUkVhT0I3V1pyRnhaTlZwNjZUd0diZGlNSnhzaGpydnB4RC9iMnNoTTlH?=
 =?utf-8?B?U3hBTG9vY1pLaTExSjJvOFdXa2dmZDBldmw2UVpBWW00aUtRajBsL2x6ems1?=
 =?utf-8?B?N29TbU5iV0ZuZC9IWDZSWVp2R1d3VmZua0o3bTFCaWVFYWt2ZndhUXRGcWM3?=
 =?utf-8?B?cnd5R3ZzcGsxTEFaMFNoQkdGTE9XWXNuSitqWGh3YzBKMGFDeUQ1OGl3cGha?=
 =?utf-8?B?c2JOdi9HTzVLUlNGeXpIcWNydmg4QXN0NEU4dFdZQStINjdtS01SWkxOYVRk?=
 =?utf-8?B?N05kMzFjSHRVdlYzUGZOVFdxbEw5SVdnYkI4U1FVK0d5SDRSQjUxa01EMTFD?=
 =?utf-8?B?V2ZBS1VBVFdCaVdEdGt4ME1hajQ5ckFsbGhpZlBBS1ZCek9IZ3FLckowclNW?=
 =?utf-8?B?dkpHb0pjUFdvVG9oZ213bWhVNVNCNnRqVDFwRTkxRDlta1h1b1c4WWNPdWl2?=
 =?utf-8?B?VWFsMjVkbUNQMjU2RzJjdmVHWlduZ1k5d3JpMFpYbGdQbFZDd1hnMFhTMHdI?=
 =?utf-8?B?U0JXNHB2K05xSUNlTnhLOXRGUDBvN01QZUNOaENabExWSlNPU3JMc2pXMm9k?=
 =?utf-8?B?TGtkQlJ5MnBtMzRkc1RVbWJ1bFVoc2ZiazhXMWsyQmplZnNxUUJ4Lyt4Wito?=
 =?utf-8?B?NDUycWVMbFd2RHVYSXh0NUpadG50U2VQMGFtQ0N3NXZKSmUyem00VEJGZHN4?=
 =?utf-8?B?SkNHT2tZa1FyZlV1cGwyb2grUS9vQUVZZkZRVG5KMFBValpPNzdWV0JiL0NP?=
 =?utf-8?B?ZTNIeHBsTlozTmNGSEtJVStlWE9Gb0NHdUdrL2J2ZWFyZ1AxOGV4MkJNbmFC?=
 =?utf-8?B?VzRTV2ptN0g3TzdENVRqei8rSk80ajdpanY1TG1uRVdWQ0F5QnZ5QzU5RFZQ?=
 =?utf-8?B?Wk1tOXAwVEhJM1I5T1cwenNyZUVlaW5UdEQ3REhoaXJMaSt0eTFPTTA1ajFJ?=
 =?utf-8?B?dDlSejUvK3lIZ2lEendZdHRqQTExK1Q3SVU2TlAyNXhTaTlxbTBScnJaa3lp?=
 =?utf-8?B?dmQwOEx2MjNpdDV0ZEdyZEhaeWtCRlJ5S3hWZVlsaVphS3NCWGNNNnEwa3FH?=
 =?utf-8?B?Y3dTbDVMYmxQSUxlTmhqVUM2Q3ZYajFkZTZDV25COUF6emdFMzNUZ0JjNWdY?=
 =?utf-8?B?UURPRTUxRE1lbmlaKzAxQjAyanM5dVNOK29ucm1HSDFIeVVpWG8yL2Nud2J4?=
 =?utf-8?B?NVpEVS9ENUxXT3E0R0lKMVk2SEduVmJJYjJpeTMvM2RwclBGUW9lanlCdVhZ?=
 =?utf-8?B?NEF6WlNRckdSN3pLTFJHemwyK1ExWlBpNWJHUnRtL0hjVEIzU2tvRDhHNGRp?=
 =?utf-8?B?UUkyV0ptSDBLTHNreTRFbEdzeE81a29SSUN5RmJtczNxM2hrK1hSd2NPdGxu?=
 =?utf-8?B?K2hId282TktHTUdDNTRNN29idHJ1V2pzdkJNb3RaZU0ySlhaVHYzOTBYcGhN?=
 =?utf-8?B?Q2hCeHFiblNES2d2eXU1dU83dGpOYnJrN3dXS1cwVmxLczlweTVNV2tFRUMz?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBD1BD16D1A3D74F90E8C74599AA245A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e52ac1-6303-4476-8c77-08daf7b85111
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 11:53:43.2338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52JQqLL8G4xAG4vCFOLM7qg/HI+LD2NjYP8kAdqQFuMJCZpz5a8WT+LNaeZxUG9bayhTzUC0K4N9qxcuDg+E7PLEKBlKukL0XAAr8yaulmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3155
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 11:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100580

SGkgYWxsLA0KDQpUaGUgcmVhc29uLCB3aHkgSSdtIGFza2luZyBlc3BlY2lhbGx5IGxpa2UgdGhp
cywgaXMgdGhhdCB0aGUgcHJvYmxlbSBpcw0KaW5zaWRlIHRoZSBidW5kbGVkIHpsaWIgbGlicmFy
eS4gVGhlICJvZmZpY2lhbCIgc29sdXRpb24gZm9yIGZpeGluZw0KKGh0dHBzOi8vbnZkLm5pc3Qu
Z292L3Z1bG4vZGV0YWlsL0NWRS0yMDIyLTM3NDM0KSBpcyB0byB1cGRhdGUgdGhlDQpidW5kbGVk
IHpsaWIgKGh0dHBzOi8vZ2l0aHViLmNvbS9ncnBjL2dycGMvcHVsbC8zMTU5NSkgbGlicmFyeSwg
d2hpY2gNCnNob3VsZG4ndCBiZSBkb25lIHdpdGggZWFzeSBwYXRjaCwgSSBndWVzcy4NCg0KU28g
aG93IHRvIHByb2NlZWQgd2l0aCB0aGF0Pw0KDQpSZWdhcmRzLA0KQW5kcmVqDQoNCk9uIFdlZCwg
MjAyMy0wMS0xMSBhdCAyMToyNCAtMDUwMCwgUmFuZHkgTWFjTGVvZCB2aWENCmxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgd3JvdGU6DQo+IE9uIDIwMjMtMDEtMTEgMTM6MjcsIEtoZW0gUmFqIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IE9uIFdlZCwgSmFuIDExLCAyMDIzIGF0
IDEwOjA3IEFNIFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNha29tYW4uY29tPg0KPiA+IHdyb3RlOg0K
PiA+ID4gDQo+ID4gPiBIaSBBbmRyZWosDQo+ID4gPiANCj4gPiA+IEknbSB0aGUgbWFpbnRhaW5l
ciBmb3Igb3BlbmVtYmVkZGVkLWNvcmUsIGFuZCBnUlBDIGlzIGluDQo+ID4gPiBtZXRhLW9wZW5t
ZWJlZGRlZC4gU28gdGhpcyBpc24ndCBteSBjYWxsIHRvIG1ha2UuDQo+ID4gPiANCj4gPiA+IEhv
d2V2ZXIgd2UgdHlwaWNhbGx5IG9ubHkgdGFrZSB2ZXJzaW9uIGJ1bXBzIGlmIHRoZXkgYXJlDQo+
ID4gPiBzZWN1cml0eS9idWcNCj4gPiA+IGZpeCBvbmx5IHJlbGVhc2VzLsKgIFNvIGlmIHRoaXMg
aXMgdGhlIGNhc2UsIHlvdSBjYW4gc3VibWl0IGEgcGF0Y2guDQo+ID4gPiBCdXQgcGxlYXNlIGJl
IHN1cmUgdG8gaW5jbHVkZSBlaXRoZXIgcmVsZWFzZSBub3RlcyBvciBjaGFuZ2UgbG9nIHNvDQo+
ID4gPiB0aGUgbWV0YS1vcGVuZW1iZWRkZWQgbWFpbnRhaW5lciBjYW4gdmVyaWZ5IHRoYXQgaXQg
aXMgc3VpdGFibGUgZm9yDQo+ID4gPiBhDQo+ID4gPiBzdGFibGUgcmVsZWFzZS4NCj4gPiANCj4g
PiBUaGFua3MgU3RldmUsIHBvbGljeSBpcyBzYW1lIGZvciBhbGwgT0UgbGF5ZXJzLiBJIHdpbGwg
d2FpdCBmb3IgQXJtaW4NCj4gPiAoIFJlbGVhc2UgTWFpbnRhaW5lciBmb3IgbWV0YS1vcGVuZW1i
ZWRkZWQgKQ0KPiA+IHRha2UgdGhlIGZpbmFsIGNhbGwuDQo+IA0KPiANCj4gSSB2b3RlIGZvciBu
byB1cGRhdGUgYmFzZWQgb24gYSBxdWlja2lzaCBsb29rLg0KPiANCj4gQXJtaW4sDQo+IA0KPiBU
byBzYXZlIHlvdSBzb21lIHJldmlldywgc2VlIHRoZSBkYXRhIGJlbG93IHRoYXQgaW5kaWNhdGVz
IHRoYXQgdGhlcmUncw0KPiBhbiBhcHBhcnRseSBzdGFibGUgcmVsZWFzZSBtYWludGVuYW5jZSBz
Y2hlbWUgYW5kDQo+IDEuNTAueCBpcyA+IDEyMDAgY29tbWl0cyBhaGVhZCBhbmQgKmxpa2VseSog
YnJlYWtzIEFCSS4NCj4gDQo+IEFuZHJlaSwNCj4gDQo+IElzIHlvdXIgQ1ZFIGNvdmVyZWQgYnkg
YW55IGZpeGVzIG9uIHRoZSBzdGFibGUgcmVsZWFzZT8NCj4gSWYgbm90LCBiZXN0IHRvIGdldCBp
dCBtZXJnZWQgdXBzdHJlYW0gaW4gYWRkaXRpb24gdG8gYmFja3BvcnRpbmcNCj4gdGhlIGZpeCBh
cyBhIHBhdGNoIGluIG1ldGEtb2UuDQo+IA0KPiAuLi9SYW5keQ0KPiANCj4gDQo+ICQgZ2l0IGNs
b25lIGh0dHBzOi8vZ2l0aHViLmNvbS9ncnBjL2dycGMuZ2l0DQo+ICQgY2QgZ3ByYw0KPiANCj4g
JCBnaXQgbG9nIC0tb25lbGluZSB2MS40NS4yLi52MS41MC4xIHwgd2MgLWwNCj4gMTI1OQ0KPiAN
Cj4gJCBnaXQgZGlmZiB2MS40NS4yLi52MS41MC4xIHzCoCBkaWZmc3RhdCB8IHRhaWwgLTENCj4g
wqAgMzc2MyBmaWxlcyBjaGFuZ2VkLCAxOTgwMDcgaW5zZXJ0aW9ucygrKSwgMjEzNzYyIGRlbGV0
aW9ucygtKQ0KPiANCj4gJCBnaXQgY2hlY2tvdXQgdjEuNDUueA0KPiAuLi4NCj4gDQo+ICMgb2gs
IEkgZm9yZ290IHRvIHNob3cgdGhlIHN0YWJsZSBicmFuY2hlczoNCj4gJCBnaXQgYnJhbmNoIC1h
IHwgcmcgdjEuWzQ1XVswLTldDQo+ICogdjEuNDUueA0KPiDCoMKgIHJlbW90ZXMvb3JpZ2luL3Yx
LjQwLngNCj4gwqDCoCByZW1vdGVzL29yaWdpbi92MS40MS54DQo+IMKgwqAgcmVtb3Rlcy9vcmln
aW4vdjEuNDIueA0KPiDCoMKgIHJlbW90ZXMvb3JpZ2luL3YxLjQzLngNCj4gwqDCoCByZW1vdGVz
L29yaWdpbi92MS40NC54DQo+IMKgwqAgcmVtb3Rlcy9vcmlnaW4vdjEuNDUueA0KPiDCoMKgIHJl
bW90ZXMvb3JpZ2luL3YxLjQ2LngNCj4gwqDCoCByZW1vdGVzL29yaWdpbi92MS40Ny54DQo+IMKg
wqAgcmVtb3Rlcy9vcmlnaW4vdjEuNDgueA0KPiDCoMKgIHJlbW90ZXMvb3JpZ2luL3YxLjQ5LngN
Cj4gwqDCoCByZW1vdGVzL29yaWdpbi92MS41MC54DQo+IMKgwqAgcmVtb3Rlcy9vcmlnaW4vdjEu
NTEueA0KPiANCj4gDQo+ICMgV2hhdCdzIG5vdCBpbmNsdWRlZCBpbiBvdXIgMS40NS4yPw0KPiAk
wqBnaXQgbG9nIC0tb25lbGluZSB2MS40NS4yLi4uDQo+IDRhZjFmZTE3M2QgKEhFQUQgLT4gdjEu
NDUueCwgb3JpZ2luL3YxLjQ1LngpIHhEUyBpbnRlcm9wOiByZXN1bWUgDQo+IGNpcmN1aXRfYnJl
YWtpbmcgdGVzdCAoIzMyMDM4KSAoIzMyMDU2KQ0KPiA2MDg2M2I2MzNlIFtDUFBdIHhEUyBpbnRl
cm9wIEdDRSBmcmFtZXdvcms6IHBpbiBncnBjaW8tdG9vbHMgdG8gdXNlIA0KPiBwcm90b2J1ZiAz
LnggKCMzMTIxNCkgKCMzMTIyMSkNCj4gMGExYzhkM2M1YyB4RFMgaW50ZXJvcCBHQ0UgZnJhbWV3
b3JrOiBwaW4gZ3JwY2lvLXRvb2xzIHRvIHVzZSBwcm90b2J1ZiANCj4gMy54ICgjMzExOTEpICgj
MzEyMDEpDQo+IDEyOWRkMjVjMzMgeERTIGludGVyb3A6IGJ1aWxkc2NyaXB0czogZml4IHJ1bl90
ZXN0IHJldHVybiBzdGF0dXMgDQo+ICgjMzA3NjgpICgjMzA4NzkpDQo+ICgjMzA3MzUpICgjMzA4
NjApDQo+IGQxOWE0Mzk1NzcgeERTIGludGVyb3A6IFB5dGhvbiBMQiB0ZXN0cyBidWlsZCBhbmQg
dXNlIHRoZSBweXRob24gc2VydmVyDQo+ICgjMzA2MzcpICgjMzA2NTgpDQo+ICgjMzA1MjApICgj
MzA1MzIpDQo+IDEyZGYzODhlOGIgeGRzIGludGVyb3A6IGNob29zZSBjb3JyZWN0IGNsdXN0ZXIg
aW4gDQo+IGdycGNfeGRzX2s4c19sYl9weXRob24uc2ggKCMzMDMwOSkgKCMzMDMzMikNCj4gZWEw
ZjliMjlmNyB4ZHMtazhzIGpvYnM6IHN0YW5kYXJkaXplIFRFU1RJTkdfVkVSU0lPTiAoIzMwMDI3
KSAoIzMwMDUwKQ0KPiAxNGFmYjNhM2VhIERpc2FibGUgbGF5ZXJpbmcgY2hlY2sgZm9yIE9iamVj
dGl2ZS1DICgjMjkzNzUpDQo+IA0KPiANCj4gIyBXaGVuIHdlcmUgdGhvc2UgY29tbWl0cyBtYWRl
Pw0KPiAkIGdpdCBsb2cgdjEuNDUuMi4uLiB8IHJnIERhdGU6DQo+IERhdGU6wqDCoCBUdWUgSmFu
IDEwIDEzOjM1OjQyIDIwMjMNCj4gRGF0ZTrCoMKgIE1vbiBPY3QgMyAxNToyMzowNiAyMDIyDQo+
IERhdGU6wqDCoCBNb24gT2N0IDMgMTM6MzU6MDIgMjAyMg0KPiBEYXRlOsKgwqAgVGh1IFNlcCA4
IDE2OjU3OjI0IDIwMjINCj4gRGF0ZTrCoMKgIFR1ZSBTZXAgNiAyMDo0NzoxOCAyMDIyDQo+IERh
dGU6wqDCoCBGcmkgQXVnIDE5IDE3OjIyOjIxIDIwMjINCj4gRGF0ZTrCoMKgIE1vbiBBdWcgOCAy
MTozMzo1OSAyMDIyDQo+IERhdGU6wqDCoCBUdWUgSnVsIDE5IDE3OjMxOjA5IDIwMjINCj4gRGF0
ZTrCoMKgIEZyaSBKdW4gMTcgMTg6Mzc6NTYgMjAyMg0KPiBEYXRlOsKgwqAgVHVlIEFwciAxOSAx
NDo0NTozMCAyMDIyDQo+IA0KPiANCj4gc28gaXQgbG9va3MgbGlrZSB0aGVyZSdzIGEgc3RhYmxl
IGJyYW5jaGluZyBzdHJhdGVneS4NCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAu
DQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTAwNTU5KToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTAwNTU5DQo+IE11dGUgVGhp
cyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzk2MTk1Njc5LzM2MTk4
NzYNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWLCoFsNCj4gYW5kcmVqLnZhbGVrQHNpZW1lbnMu
Y29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

