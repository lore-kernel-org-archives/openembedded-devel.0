Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96985C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 18:25:41 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.60])
 by mx.groups.io with SMTP id smtpd.web11.18842.1677176734359331258
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 10:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=CbmjSvMe;
 spf=pass (domain: advantech.cz, ip: 40.107.255.60, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krgD2xk4etVfH32OcTqVlCNaUpQc7Y3Cw5CHPfw/WaXeYOvRbHYcoqBHJNKm3Lvmrp14IfspCvhVBJ0SM8wwZKzg7jjKQ0ouRFBSY3TVhPc6zB0WbwKrWbt8b08/UYSCRqay3jII5GIEpIImhhKem26XlSP0S0B+e21Q/tb7yAGPeOLCxDVNJdz0dVAKhbtvbFq4sg/rGVnlPxhLanVDmHscgUui0xf2qEmfgBg9OyI0aJ0Qx4Xzfl8Aag4rLQRmAFJNzXt1Rr+YVtUY5whddzcG2cpyR+BZuIhgKlMhm2Vpkq/VDiCizOgy0ZFhWZk9Plyx/T3862lQC99yQksbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLd5WLq+F+Pg0Z6hv8dU7KUlUude0Vr38awft8A3G2s=;
 b=Quyw6yh2Y2L2QBlALz0KAwyiG3mrVnyUXBOsS0wMzRNEeafNNaHyIDrzCQXSwOd61EGEndPKM97cbAWG+eDIud2rmZqn8xmgZDtr/+w8jTQcCVjj52ghZ4fuglGRyDenxygJyvKPtClugyN/O2TKKXzFbZ1QAB8KwwldZN4Az8SRB86EPxa4+PFkxFrNKUd/p7Yi9QYinmTlwziw3C+OaBaP8gSo+0SLS4Cfk/qv0DxIoSQRIqtXfYxwa3B6bgQablPjHQy7opz8yNebskLo9VB+PXkIaO254s2H7/9WLcztCEG7LSwpGIbVj58Vwbt34lp/V0P7LgQL319OTg0kzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLd5WLq+F+Pg0Z6hv8dU7KUlUude0Vr38awft8A3G2s=;
 b=CbmjSvMerqApEjgmtg2tne2REjQxp++7F+2O9SgfXvE1dvA7r4bMt1OD988bTN3dqSYz7qTSWYkinrTPTD9czUruTmRmSUKZxVUmBaN3lUD6lzuPKlUBbaYp1J/lhrBEBn5D5ABY2pnb0OmiXO6Mu8uEFPbw93v2h4Qx2ParI5FArSGkcoznvkqF8bGlADPnE1p7WR6Se6FmJLRQ8efNTSLBmHJRXVkM0mZg0xvNi+gRAawz8PrOhoCBg5KnojCkL6AvQPqr+l97ypvUS3Cp2z9tTJzZ24Yi818Hu02HlNFBo2r01fotwlioH7UuNHaC+Xbi/Qp2ssgvC+A9nccxdQ==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by TY0PR02MB5623.apcprd02.prod.outlook.com (2603:1096:400:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 18:25:27 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::e2f4:d03b:1736:e417]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::e2f4:d03b:1736:e417%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 18:25:27 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] openvpn: upgrade 2.5.8 -> 2.6.0
Thread-Topic: [meta-networking][PATCH] openvpn: upgrade 2.5.8 -> 2.6.0
Thread-Index: AdlHs5gmRk8xdYuhQJuyqMp40aYvww==
Date: Thu, 23 Feb 2023 18:25:27 +0000
Message-ID: 
 <TY2PR02MB3678B3B8ADDF63EA58DCFD1081AB9@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|TY0PR02MB5623:EE_
x-ms-office365-filtering-correlation-id: 5010f266-9dbd-446c-38e1-08db15cb5630
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KlqS1w8rAWEpGVFpESFh+r4ewavbQEGoFIME05sno0H5HEIPp5XiCFnrahsJlGdV/vu/UXrurXjhVRTLc8tx+xUCryr4AAZSKzaudQUrQ2EiPIxMLaCBWc1dNf86J2MSy7IU8orQIc7Y14T4NvOmDv83ZVhpRnqyvD3+K2Nj/g2n3Di9b+F+ewb9gc/6W2clOf7h9Fd+sQ9U4AHaglR7MdctnLAY4zNpZKzFdNYRZ74W6b0aDozzRHn+IwfA3D+GyW+oZVKEse84J/nv0lOdII6iPoqhbK1DcGDRRLQbkhGxmZnp4EjrKOCCqhCaL3nNI59ZUCF7rfwz+rdAnH24HmrzOtQDgXaUn31LygTEaJC4XpTmZUTjNNJ0Gq+3DG539qmEOFBhdxR8UBeltEzMsiMKXio2iXHqE55HnmIloJ0CMlbjKudtecH6MMIGU+1q0dZcHqywY0VO6fsXeYfjGLeHU6ExASPimmwcIZ5v7BvhLWAZnAwQXNuqLw7wAVNdHCTaOc2XG51aHkQG8i/CCf9FGGul+d5s41cmJENBaTwrHqlyv4nzyg/u/eqAxVu2GCxlSbngFSwxWWUc4sgslnjStpgnCYYN5pxfXkY0j6hL/tES9TBhuINdST0s7UoPAm4Wx1AGJ7xl1/+vi7RQbCZrgRfhJmhdBaUWtApETnidYTln1VGoZ9c5uVtYH5Qq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199018)(52536014)(83380400001)(8936002)(41300700001)(71200400001)(44832011)(5660300002)(7696005)(316002)(55016003)(66946007)(64756008)(66556008)(66476007)(6916009)(8676002)(76116006)(66446008)(6506007)(38070700005)(186003)(26005)(9686003)(478600001)(122000001)(33656002)(2906002)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SEMzUkt3dXZTZklQb3BVUy9ZUi9Nam1UZFlkT1ZMUWx5T0pSbDhjdGlGd09N?=
 =?utf-8?B?dHRtdEdRaXV0Qk5KRkRNc1JaWnlCTDdKNktSVjZrcnFGUlVFNW1Sbkc4SUQv?=
 =?utf-8?B?MzIyU3drcWJKQzFPUHJFTDZLenRNbUFiL3kzU1ZXckZOa2xadEY3RjhEV3gv?=
 =?utf-8?B?STlRRjFMb1k0aUxtbkhZZWQ5dUpoV0x4VXpVdExzdjJBelFjQVFKUTNGcGZk?=
 =?utf-8?B?ME9xNXRQL2Q5THN6b3NHbUMzNEpzcGNaWTBjY21ld1BJRXJUWmMyREwxVjI4?=
 =?utf-8?B?Si9mUWhiWUdtVnNrVUFWclNZNTZDRXhlV09TbmZEZTNkZFVBbFlnRFBxRXRC?=
 =?utf-8?B?TmhRSExzUFJTcWt0cmZCdTdQWmxBMEZwY1llOVdWcXBQNE9WTU82ejN6SGhz?=
 =?utf-8?B?SENTOXRBWHNsTmVBNVE5dVFyOFdWTGZlL3BGNTdFd0E2ZzVlbGpya1g5NWRX?=
 =?utf-8?B?d0VRSDdYS3g0ano0ZE90RHBFZUVMZXpnbTc4RThVU2ZiMFI5dW16YXlBYmdl?=
 =?utf-8?B?d2ZrM1RjQjJSYnN5UHp3MTRmb3ZjVi9TM1ZLWkR0MnQxWHhwN1ErdGNBSTk4?=
 =?utf-8?B?blRDd0lGV0lLMm5haGQ4bGtKVUdxbko3V2M4L0NIM0ZOZHBwdThnYWhzWnFm?=
 =?utf-8?B?eXczSVFNZ2V4dXZzcmhBZUl5MFNWVkJ1OWhKWVJaaTZYU3hvYnJHdVJVVXIw?=
 =?utf-8?B?cUt6VlR3alRLTzIxZVhVQ1JLKzNBZjk2TTdoV2JuSi9DYndlbi9FMWZWOWJ6?=
 =?utf-8?B?WG5hdExRVm80RmcveXMvVkJQVEVZNWNIUWhsdUZFQ0dVc3FNZ2RPdTFYZytT?=
 =?utf-8?B?SEZhVXMxOVVmN3NUeCt6QVRXY0QwOE1XR0tBRWl6SDIrNWRoWXJ4VWJXQnlD?=
 =?utf-8?B?SnRVWklURnZqeE91dTZ4eVliNGY5MVZ0Mm0wZDZXUWwvU3Rkc1JLWkNySkUz?=
 =?utf-8?B?QXFFTm9tTXhnbUt5NnNCcGJ1dFE1bGpSVERYQnlMeUo0S3dHZ2JLS3d2R09n?=
 =?utf-8?B?ejRPa0VrYXB4ZEQrdytlYWJya2pnbzdLei9IeTVxWFVtdHpiYkNnRTFnZmkw?=
 =?utf-8?B?emJ6YmljRWEyenJKR2VFVWh6U2lOVUorREk5TmRYdnZUZVpDV3RsWUVtdzRC?=
 =?utf-8?B?bEZ2UUViT0xZR2pPcFhEUnRFdEFBQ0hpeXVtejA1RmhZeXM1NWUxcm8xeDFV?=
 =?utf-8?B?TjBVZTNDRGNIMGVwM3FsTmRwVi9JeFU0bGJMNSttMnduZERVcjNXenp0dzVH?=
 =?utf-8?B?ZXdUWmFMelRlR1NsR3Z3ay8rWHlUVGtFczB6bzhnVlpPS0hyZjVrZ1RaakRy?=
 =?utf-8?B?bXg4Y25nTzYvTWczSXo3alZMck5EL2NtbnlGQVQwcExSSHpadG82MVhvRjRo?=
 =?utf-8?B?ZXlIYTd6NW9relp6QXJIMkVzdmdud1RjdFVIZTVnNjlXMVIzd0NFb1VvZmVC?=
 =?utf-8?B?KzRtSUErVWNDZ1o3dkhSNUIxR1hIdmlSNE9lNTNrT3JadnJINFRzWFEvNG9J?=
 =?utf-8?B?K0FoVkZIZEYveGQvQXYxcEZhMnl0Z0xFR1ZxcWJ4OEx4dWxoOGtlTG1lSVA2?=
 =?utf-8?B?L1AvR0wvOWpWeGJZK1o5N1BpTERnRUErV1NaQ3JwU3FsWFBpK0w5U2w3Vjh3?=
 =?utf-8?B?QlAvVFJQdFZjYUFjdDJSa3lKZFlFMTBES3NQalJKbHVvZlU2bE5la1o4S0JL?=
 =?utf-8?B?WEZGTEF0WWZCcFRCQitLUHJVYzd3dUl3R1owWis4S24ySjRtR1ExcnBydEVw?=
 =?utf-8?B?MDEycTJ5dlpTWEZvSk9ldllUV2pRcEN4Sk5JdGZwQXphN2p0YzJSZmdYNXFa?=
 =?utf-8?B?RVE5WkMwTzliVThmb1BBUk1NZVFsRmVJeVN1ZTJJZ1ZzQ0RrVVFGLzhiREdn?=
 =?utf-8?B?TVpGSmV4L2JNOVVQZ0lvWlVTUU9uc2pFZ0pjNDlxTmVVU0E2SFJwQmFZOUlU?=
 =?utf-8?B?MmI2RHhRSkw3cUFqVS9zZjBTUyszallUa1hEK2tuYUxrSkZPYlRjRkQ5ckk5?=
 =?utf-8?B?STFhcWlZTHJVRzVObThUVzU3L2M5elZNVzhTSlRKNTJycEk2eTBRVVNuK0dl?=
 =?utf-8?B?WG9LL2Y3L0NZUHV0OTNURHZkclo4YmNvS2dZRFZHTlFUZENOdFIrUGw2ODFS?=
 =?utf-8?B?WnFzZHkxTFFYMTdpNHRlZ0NQa25NZU1lRDBXTFFHVHNQVkNMSTFFZ3JtVmhZ?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5010f266-9dbd-446c-38e1-08db15cb5630
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 18:25:27.1133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C2iQ55UQZUTVurPYD5RU5vm8xW7Y8IQkUy0XS5k2lf/FFH4Rt+Cm0lCRIr4fim7o7fqc3fjv850N19oyHuDdZ1OLrQJWFH8VSLNRGA43KgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5623
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 18:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101237

TmV3IGZlYXR1cmVzIGFuZCBpbXByb3ZlbWVudHMgaW4gMi42LjAgY29tcGFyZWQgdG8gMi41Ljg6
DQogLSBEYXRhIENoYW5uZWwgT2ZmbG9hZCAoRENPKSBrZXJuZWwgYWNjZWxlcmF0aW9uIHN1cHBv
cnQgZm9yIFdpbmRvd3MsDQogICBMaW51eCwgYW5kIEZyZWVCU0QuDQogLSBPcGVuU1NMIDMgc3Vw
cG9ydC4NCiAtIEltcHJvdmVkIGhhbmRsaW5nIG9mIHR1bm5lbCBNVFUsIGluY2x1ZGluZyBzdXBw
b3J0IGZvciBwdXNoYWJsZSBNVFUuDQogLSBPdXRkYXRlZCBjcnlwdG9ncmFwaGljIGFsZ29yaXRo
bXMgZGlzYWJsZWQgYnkgZGVmYXVsdCwgYnV0IHRoZXJlIGFyZQ0KICAgb3B0aW9ucyB0byBvdmVy
cmlkZSBpZiBuZWNlc3NhcnkuDQogLSBSZXdvcmtlZCBUTFMgaGFuZHNoYWtlLCBtYWtpbmcgT3Bl
blZQTiBpbW11bmUgdG8gcmVwbGF5LXBhY2tldCBzdGF0ZQ0KICAgZXhoYXVzdGlvbiBhdHRhY2tz
Lg0KIC0gQWRkZWQgLS1wZWVyLWZpbmdlcnByaW50IG1vZGUgZm9yIGEgbW9yZSBzaW1wbGlzdGlj
IGNlcnRpZmljYXRlIHNldHVwDQogICBhbmQgdmVyaWZpY2F0aW9uLg0KIC0gQWRkZWQgUHJlLUxv
Z29uIEFjY2VzcyBQcm92aWRlciBzdXBwb3J0IHRvIE9wZW5WUE4gR1VJIGZvciBXaW5kb3dzLg0K
IC0gSW1wcm92ZWQgcHJvdG9jb2wgbmVnb3RpYXRpb24sIGxlYWRpbmcgdG8gZmFzdGVyIGNvbm5l
Y3Rpb24gc2V0dXAuDQoNClNpZ25lZC1vZmYtYnk6IFBldHIgR290dGhhcmQgPHBldHIuZ290dGhh
cmRAYWR2YW50ZWNoLmN6Pg0KLS0tDQogLi4uL29wZW52cG4ve29wZW52cG5fMi41LjguYmIgPT4g
b3BlbnZwbl8yLjYuMC5iYn0gICAgICAgICAgfCA2ICsrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQogcmVuYW1lIG1ldGEtbmV0d29ya2luZy9y
ZWNpcGVzLXN1cHBvcnQvb3BlbnZwbi97b3BlbnZwbl8yLjUuOC5iYiA9PiBvcGVudnBuXzIuNi4w
LmJifSAoOTElKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9y
dC9vcGVudnBuL29wZW52cG5fMi41LjguYmIgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBw
b3J0L29wZW52cG4vb3BlbnZwbl8yLjYuMC5iYg0Kc2ltaWxhcml0eSBpbmRleCA5MSUNCnJlbmFt
ZSBmcm9tIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvb3BlbnZwbi9vcGVudnBuXzIu
NS44LmJiDQpyZW5hbWUgdG8gbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9vcGVudnBu
L29wZW52cG5fMi42LjAuYmINCmluZGV4IGIyNzgzZDk5Mi4uYzhhYjZjYjQ2IDEwMDY0NA0KLS0t
IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9vcGVudnBuL29wZW52cG5fMi41Ljgu
YmINCisrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvb3BlbnZwbi9vcGVudnBu
XzIuNi4wLmJiDQpAQCAtMiw4ICsyLDggQEAgU1VNTUFSWSA9ICJBIGZ1bGwtZmVhdHVyZWQgU1NM
IFZQTiBzb2x1dGlvbiB2aWEgdHVuIGRldmljZS4iDQogSE9NRVBBR0UgPSAiaHR0cHM6Ly9vcGVu
dnBuLm5ldC8iDQogU0VDVElPTiA9ICJuZXQiDQogTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkiDQot
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Yjc2YWJkODJjMTRlZTAxY2Mz
NGM0ZmY1ZTM2MjdiODkiDQotREVQRU5EUyA9ICJsem8gb3BlbnNzbCBpcHJvdXRlMiAke0BiYi51
dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3BhbScsICdsaWJwYW0nLCAnJywgZCl9
Ig0KK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTMxNzBlOTgyYmFhZTYx
ZGJiOGRlOTYzMzE3ZDFhYzk0Ig0KK0RFUEVORFMgPSAibHpvIGx6NCBvcGVuc3NsIGlwcm91dGUy
IGxpYmNhcC1uZyAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3BhbScs
ICdsaWJwYW0nLCAnJywgZCl9Ig0KIA0KIGluaGVyaXQgYXV0b3Rvb2xzIHN5c3RlbWQgdXBkYXRl
LXJjLmQgcGtnY29uZmlnDQogDQpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly9z
d3VwZGF0ZS5vcGVudnBuLm9yZy9jb21tdW5pdHkvcmVsZWFzZXMvJHtCUH0udGFyLmd6IFwNCiAN
CiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9vcGVudnBuLm5ldC9jb21tdW5pdHktZG93
bmxvYWRzIg0KIA0KLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhNmYzMTViNzIzMWQ0NDUyN2U2NTkw
MWZmNjQ2Zjg3ZDdmMDc4NjJjODdmMzM1MzFkYWExMDlmYjQ4YzUzZGIyIg0KK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJlYmVjOTMzMjYzYzk4NTBlZjZmN2NlMTI1ZTJmMjIyMTRiZTYwYjFjYmI4Y2Nm
ZjE4ODkyNjQzZmUwODNhZThmIg0KIA0KICMgQ1ZFLTIwMjAtNzIyNCBhbmQgQ1ZFLTIwMjAtMjc1
NjkgYXJlIGZvciBBdmlhdHJpeCBPcGVuVlBOIGNsaWVudCwgbm90IGZvciBvcGVudnBuLg0KIENW
RV9DSEVDS19JR05PUkUgKz0gIkNWRS0yMDIwLTcyMjQgQ1ZFLTIwMjAtMjc1NjkiDQotLSANCjIu
MzQuMQ0KDQo=

