Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017D3C77B7D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:01:04 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.94021.1683496854506371602
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=ArWpvGjr;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683496854;
  x=1715032854;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mGuUN8rGVN+gUX4vziTiXWYkyo9KUeaz0y/5PknN57k=;
  b=ArWpvGjrVAvFyQWCBl3x9Gq+VclSB6F8dr95gHT6KzENiEETolP5NS/I
   WeIsmCKI2AeFIpWBEcxFiiwTp7wi1bcstallFzKd4hS9ZDNmEe6U/a+dD
   8UberVuF3U66j5Oia++rgsvFP8mROUTC4tRyayeQKAqY0ayRkEIegxS9F
   5foqDJ2GYdC0GFmRRVFo1+t+jhERJYAVyRyUt+Re5JcnRnTViPumh7C24
   xRY2mTG7Nlqlk9ia3jwoczv6M6XfMz7gXuIKvHpzPj32qsKI10o9+NysL
   sTMIdd+KoFgOU2oaSbwWlcX16YdjZ2SZmO5f3v1aATeOCvuNSqtaeFzVl
   A==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdBBGFsV0+6AsOvD1D9NYXIhB5xKnuE9OQ/ra9ZSubxplONpDm2xAYhfh5E0gtov/TBJchl82Er7r4dXmuLB6oh7R/K+9PlU9X/XdFR5fScEfYx9u5M9T6j7OX7ofecMujeCOY2J4YBkDnGNKbSr4qrmWJauWL+WIyLVwjmA6xCAZRaiqo7L8sEuGRGIlLSXJQhhIOIsFOBJgGEczLFxU74E38N7AIM9BIFnUEALB6h7ju57I/zPOxx/Kdc5BdNRA9Q+jigR62SftT7Sayw3LWx9op3t+aG6GWSM5kcsF10KpaBj4s2MSXxLAE6xkNSNnca+duNX9yWh9nw8k4+5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGuUN8rGVN+gUX4vziTiXWYkyo9KUeaz0y/5PknN57k=;
 b=bOYymefv/7zVs5pku1fM1sWUQdL+WcI/siZdlVVHqKlH4F0LqlTpi+gupjQTI6C27LBkIMqVVUuOio6xC3LODIeOTO+lX7AhsXgXm9/4RAei6SpoQcDAnZRGOILJhrQ3MvcWXof8bYCa2sYDPSwbt2qycmxqTWNE/1UpFBAweULcdfcvu/y8T4QIVeJxGxynzd2RVLAmfBKKGAuoGPvrL/iP6r1QpBjXcnvgEYKzutOM0/sL7t8WvN+ns7TjmDGQTOPoQCyK5FE/B4BfyxnH5GpCpr0jvkj2AqTBoUk8Iwjqu/ZoGXv4bE9divEkH9nJ49YOFQre1Y7dcbDfZ3TIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGuUN8rGVN+gUX4vziTiXWYkyo9KUeaz0y/5PknN57k=;
 b=pouz1VXf25fMHCtLJa8zaycI9SOkZsF63UTN8oapz1ZzkaRNn2VU6OaStidhNgSGzE/b7E3y7F2TIVzBU+W4Cwl4EadRs6HX4juZqkfWKKDBFFXweAtvzFcylWAXvvBZkj8owZR4BAhx2CggNj3sE/i6b7qQNVixwSiFDduEeLc=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Zoltan Boszormenyi <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 3/3] meta-oe/conf/layer.conf: Add
 PREFERRED_[R]PROVIDER_virtual/opencl-icd
Thread-Topic: [oe] [meta-oe][PATCH 3/3] meta-oe/conf/layer.conf: Add
 PREFERRED_[R]PROVIDER_virtual/opencl-icd
Thread-Index: AQHZUl65fBREvOqcJEWTWmDZUN51ta8+IheAgBGXjPA=
Date: Sun, 7 May 2023 22:00:49 +0000
Message-ID: <DB5PR02MB10213C16BF98794992DCBBF5CEF709@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230309081036.3179583-1-zboszor@gmail.com>
 <20230309081036.3179583-3-zboszor@gmail.com>
 <17598C4BA0EB1CF8.17444@lists.openembedded.org>
In-Reply-To: <17598C4BA0EB1CF8.17444@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PR3PR02MB6140:EE_
x-ms-office365-filtering-correlation-id: 6b389194-36d8-4380-b258-08db4f46849d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EH0qPG9uBTIE9oi05YGQG7ONKJp8nc4pkB/A5AoCEMaJA+r//+/9D22k01t/5lD80WUWwjm9N5expWyET4FtTT4/ZoZCex53frSOy9UbgYXyhMAwInzNxuG3mJw6lVRXZelTdw4nYaG/IL7pqFXSfUyBZrSRMSWIshPzCF+SLsuFjMkVv/APoTPx7hLwRVfV//o1AeeGlgBUOXDVCiGxcz7FgHdprgkeiUgLRx9SN0GldKMVCLrwTHIXkZBIJzskPlSMv4s4YPOrLbKbtexnGl98aYVqeuK9ZOxh0iQBsPKLXfGjRc1ehqmyvi+XztowRrtdENeN8TCFqypRnIXCnD6Qjwpc+CZll75571Bb4lKrC15IMm6BzRMl1hn+Ckv5TOYK3nr4qJvdH1d6uDKzffYc1S6sgYXvyJaIxRm6u/7VHwR2P6MA/UcN2VPTq1bSW4CjAb/P4/QQ0XhnlUxN2Uz2VX/yj2z8BF8NKGZwJM2FuKDZXJ1WInZ3f2Dp68noYZ7lusQozRx9G3baGfaiczIX5F3TL1davdZA5wZbVA3jZp72YazsJpACEoDRB7KSxvj/L6RXEfEXUwmvKxe672UmGkKKYEhe3Zf9HAARR+16gbgdE8blWbvg7SzvQ3dK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(376002)(346002)(366004)(396003)(451199021)(83380400001)(478600001)(7696005)(71200400001)(9686003)(6506007)(26005)(53546011)(186003)(44832011)(2906002)(33656002)(52536014)(38100700002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(6916009)(122000001)(4326008)(41300700001)(5660300002)(8676002)(8936002)(38070700005)(86362001)(55016003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTIrYXY5a3hQeDlBSlY5di9rMlNBTmpiZU9Ic2M4dkkrdFFwWVp6UUJKTGta?=
 =?utf-8?B?SlFJdEs3Rm5QRHN0TEpQZldqRkZOVXZTbFVodTE3UmdmMEhzcEZTTDQrcXd1?=
 =?utf-8?B?MVo0R0RvQXYyakNnRlNyVmJ2SVU2ZFB1VEt2dW5HRlZNbllSSWgwT1U1V2c2?=
 =?utf-8?B?bmpRc1FkRVNYUW13VUpObGg1M1dtWml4dGFSRTF6NkhFNENhVm55OHpCdGlR?=
 =?utf-8?B?M1FteGU2VzBsc3JYSmdudUJGekpOUTV5Ti9RYjZPNk11Yi8vOUYrbGJJcndI?=
 =?utf-8?B?WTNVSHluNldiSFluVDl5eHhlVGhaNXJjd2pJY1JCazZ4VmNSbGFzcVdQNzRh?=
 =?utf-8?B?aDhxbVJGcVBoUVJrU01rTkJJNVFhK21vcURzdUhpN0pvYndFVCtEbnhEVERT?=
 =?utf-8?B?SVNFWEFteFZRaXNCUnBBOVpydDRxdkFRbEZYRlZEWDNySS9MVFIzMW1wanB1?=
 =?utf-8?B?NEVyKzZPTWlQVEpsZWVHQ0MrbHVvbWpEV04zWmhFQnA4dUpuOEdPUWJiczBC?=
 =?utf-8?B?S3NSUUhOOHo2Z2FjTjBQMTgvek50N1RRQ0J6Vm1HOXBrQWtzZjlFNUxXL3Zz?=
 =?utf-8?B?UUo3ZnVldkZ5ZzUzV3NTOUVIcjB0MXFMR3NkL2dvYUp3VDBac1ZjR3dta2ND?=
 =?utf-8?B?SzQxbm40ckJURldKU3UwNTVETzUvZ01XZlkzd01tUHZWdzVzUVNsZ0N5M3A5?=
 =?utf-8?B?YWt4Yi96UDNlNFlFaElQcVB4elg5ajFrYzVtRFZGRHBmZGhpbWdrdHFEaEFv?=
 =?utf-8?B?QnJaNWorYWMvNmd5RktRcmMzcmdCZGM0V1ZyT2lXczRlenZmSzhpNndtaGFw?=
 =?utf-8?B?RnkrMENDb0xOeHdSYXNuS3VTTGlicG5zWFFlUWptUVJSaFZCTVkrM1NWU3VC?=
 =?utf-8?B?ZGxEbU80VFNuZG0zcStQczJTdW8vSEJqRFd0TFNNdmdZMlVlSXdPTTFvcG5k?=
 =?utf-8?B?V3JBL25RSE90ZVIzN0hHci9qVlN0VmZPUDhBeU1SeEtWeWNaTTl0bktiU3dT?=
 =?utf-8?B?Tk1XZ25hS21sWGd6MUM3VkhlVGExdmxqbkJmOGNnNjlFTmNmbWo3cm15cWRI?=
 =?utf-8?B?VTdta2hTWVhoRGpuSm8vdzhIRndvZWtmazBDdHNYaFh3OW5aQ244YzB5bjJD?=
 =?utf-8?B?anBmVjV3VVF2NTBHbFJVNk5OMkdKeWtCNnlhRXhPZXR2MXZYd3pERjJqMEJo?=
 =?utf-8?B?M2hwYVVISG9tZWQycm9oWkcvbnZPMENVZ21VTjhIVjV2MjZtOXlKUEJSNitC?=
 =?utf-8?B?blByVkdQVnp3czhVVEVMa21ub00yaHBWVDQ4bHIwTVdlZ1lUYUtkU3lMZHZv?=
 =?utf-8?B?UURuM2J1UjUramQ3Y0RJZHh1TzN5L1k3bkhDZGd2OU8xdTlsVUFyRFZqOWta?=
 =?utf-8?B?cGtZQktpdEdVS2pBeFM2NUN0NDBXZ01KTkRTeGdxM0xxWXhGMlpYMTVETXNF?=
 =?utf-8?B?UEh1Z0ZnWkR4MVBuZnlUamRMT3BNa3RHVjI3cWI0eG9RWk1wem5MMWR6bGo5?=
 =?utf-8?B?Z2o0eTYxdXZVc0FwVlNBZXlRZTlyUHIwQjNhaXVaQ3NMSjViWUNhUWNPTXMv?=
 =?utf-8?B?MXA0VHVmdm5qa1dCQmc1L0hWZjNsRUlsODZZc2dELzU4RVd0Sk9zaHJHeHVS?=
 =?utf-8?B?bmlzVmRFaFlDeHB1bFI3ZHp2THNrcWJzN2tySzY5V0tPUkFhQm13TlFxUnh4?=
 =?utf-8?B?Vm1WK3FEM2RSK2VsWDE0TjRiUlgzZWpmd2F3NDhoZVJEY0c1R01pK1czb3M2?=
 =?utf-8?B?U01mOHpsejVQOEZXT3d2dzlETVF4Qjh4RVY4d1Z4THd3OUJRUUFTTDdaY0Rj?=
 =?utf-8?B?WEd4R2g0SlpmRkY4b0U2TVd0UUxmdlhRVFc2S3lxTWRXYUhTcnVWelgwbXhw?=
 =?utf-8?B?aDB5am5CN1NWTmdRbURLdDNHcUdYcjlGaitQQ1N4TmZobjdSVUF4bTl6YkZW?=
 =?utf-8?B?VVdaR1drVzBpZ0hVNS81ZkFkdFhzTWJKckg1RS9PK1ZxNW1PL2FSak04NjNt?=
 =?utf-8?B?dnU3b2V1d2taaDJHYlFjenBwTzkwTVp5QjRndFBUZVF2ZjNIQUU3OVVNNHI3?=
 =?utf-8?B?NW1Gb1J4RnFlYkZ4YUNQaWpYZ3RSR3RweTFRKzAyemF5Q1lyZk9VVkFUZ0E5?=
 =?utf-8?Q?gamQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b389194-36d8-4380-b258-08db4f46849d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2023 22:00:49.4148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YUukGBcO/IqFWYabH+B7GwJoO84TFJBxlAEaf0r4CLUbc7dzMLIeNYcOJ9eZ3YlB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6140
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102362

Wm9sdGFuOiBBbnkgY29tbWVudHMgdG8gbXkgcXVlc3Rpb24gYmVsb3c/DQoNCi8vUGV0ZXINCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBQZXRlciBLamVsbGVyc3RlZHQNCj4gU2VudDogZGVuIDI2
IGFwcmlsIDIwMjMgMTk6MzANCj4gVG86IFpvbHRhbiBCb3N6b3JtZW55aSA8emJvc3pvckBnbWFp
bC5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFUQ0ggMy8zXSBtZXRhLW9lL2NvbmYvbGF5
ZXIuY29uZjogQWRkIFBSRUZFUlJFRF9bUl1QUk9WSURFUl92aXJ0dWFsL29wZW5jbC1pY2QNCj4g
DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBvcGVuZW1iZWRkZWQt
ZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBab2x0YW4gQm9zem9ybWVueWkNCj4gPiBTZW50
OiBkZW4gOSBtYXJzIDIwMjMgMDk6MTENCj4gPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBDYzogWm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pv
ckBnbWFpbC5jb20+DQo+ID4gU3ViamVjdDogW29lXSBbbWV0YS1vZV1bUEFUQ0ggMy8zXSBtZXRh
LW9lL2NvbmYvbGF5ZXIuY29uZjogQWRkIFBSRUZFUlJFRF9bUl1QUk9WSURFUl92aXJ0dWFsL29w
ZW5jbC1pY2QNCj4gPg0KPiA+IFNlbGVjdCBvcGVuY2wtaWNkLWxvYWRlciBhcyB0aGUgcHJlZmVy
cmVkIHByb3ZpZGVyIGZvciBib3RoDQo+ID4gYnVpbGQgYW5kIHJ1bnRpbWUuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBab2x0w6FuIELDtnN6w7ZybcOpbnlpIDx6Ym9zem9yQGdtYWlsLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgbWV0YS1vZS9jb25mL2xheWVyLmNvbmYgfCAyICsrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhLW9l
L2NvbmYvbGF5ZXIuY29uZiBiL21ldGEtb2UvY29uZi9sYXllci5jb25mDQo+ID4gaW5kZXggYTFm
NTA4NzllLi5hZWUxZmE3ODYgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9jb25mL2xheWVyLmNv
bmYNCj4gPiArKysgYi9tZXRhLW9lL2NvbmYvbGF5ZXIuY29uZg0KPiA+IEBAIC01MCw2ICs1MCw4
IEBAIFBSRUZFUlJFRF9SUFJPVklERVJfbGliZGV2bWFwcGVyID0gImx2bTIiDQo+ID4gIFBSRUZF
UlJFRF9QUk9WSURFUl9hbmRyb2lkLXRvb2xzLWNvbmYgPz0gImFuZHJvaWQtdG9vbHMtY29uZiIN
Cj4gPiAgIyBDb25maWd1cmVzIHdoZXRoZXIgY29yZXV0aWxzIG9yIHV1dGlscy1jb3JldXRpbHMg
aXMgdXNlZC4NCj4gPiAgUFJFRkVSUkVEX1BST1ZJREVSX2NvcmV1dGlscyA9ICJjb3JldXRpbHMi
DQo+ID4gK1BSRUZFUlJFRF9QUk9WSURFUl92aXJ0dWFsL29wZW5jbC1pY2QgPz0gIm9wZW5jbC1p
Y2QtbG9hZGVyIg0KPiA+ICtQUkVGRVJSRURfUlBST1ZJREVSX3ZpcnR1YWwvb3BlbmNsLWljZCA/
PSAib3BlbmNsLWljZC1sb2FkZXIiDQo+IA0KPiBUaGVyZSBhcmUgbm8gcnVudGltZSBkZXBlbmRl
bmNpZXMgb24gdmlydHVhbC9vcGVuY2wtaWNkIGluIG1ldGEtb3BlbmVtYmVkZGVkLg0KPiBSdW50
aW1lIGRlcGVuZGVuY2llcyBvbiB2aXJ0dWFsLy4uLiBhcmUgYWxzbyBjb25zaWRlcmVkIHdyb25n
IGFzIHRoZXkNCj4gZG8gbm90IHdvcmsgYXMgZXhwZWN0ZWQgKHRoZXkgb25seSB3b3JrIGFzIGxv
bmcgYXMgeW91IGRvIG5vdCB0cnkgdG8NCj4gY3JlYXRlIGEgcGFja2FnZSBmZWVkIEFGQUlVSSwg
d2hpY2ggaXMgd2h5IE9FLUNvcmUgdXNlcyBWSVJUVUFMLVJVTlRJTUVfLi4uDQo+IGluc3RlYWQp
LiBTbyB3aHkgZG8geW91IG5lZWQgdG8gc2V0IFBSRUZFUlJFRF9SUFJPVklERVJfdmlydHVhbC9v
cGVuY2wtaWNkDQo+IChhbmQgYWRkIHRoZSBjb3JyZXNwb25kaW5nIFJQUk9WSURFUzoke1BOfSB0
byBvY2wtaWNkIGFuZCBvcGVuY2wtaWNkLWxvYWRlcik/DQo+IA0KPiA+DQo+ID4gIFNJR0dFTl9F
WENMVURFUkVDSVBFU19BQklTQUZFICs9ICIgXA0KPiA+ICAgIGZic2V0LW1vZGVzIFwNCj4gPiAt
LQ0KPiA+IDIuMzkuMg0KPiANCj4gLy9QZXRlcg0KDQo=

