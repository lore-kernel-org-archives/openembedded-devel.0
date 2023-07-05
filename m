Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A91EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 10:58:05 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.75])
 by mx.groups.io with SMTP id smtpd.web10.13966.1688554678009771909
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 03:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=hfR5Z6Bt;
 spf=pass (domain: advantech.cz, ip: 40.107.255.75, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCkMs/P9EdGvozzRkYOJPtiWobTsojUmtUJhl0RHFfpXjZiySZPs9HGKDiMeqEiblZZbnsP76PDfLOEIG91ix+cHxKzRZ7ZqQOGfsjxoUKYQ6BqsRZdYBOjWn/0BKmU04YGK6BdeosmTsUDbBg1FTSdJu2WzjXNoLS8Xxhn5CJXyGmVQs0omi5BRiC35nS3JXAo8xFEtbBkZ6kqhe8hQwnrNC+axG+sydHapdmtxpE5s7nKfOk6gzG9b8Jya9r3Etq523k0UELtl3JRITwyCCunJQ/ZPmmA2TTzZ1ngZxlf4T2T2f8oihM/jKP457pxLJSWur63JI6isUpm+Rlt9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4seuOze60t42VuYjxsp33ZelNU+TsB7ySvQfoJHiuA=;
 b=Y2OUWie1MmIv7ARHleT/a21BIQxDP10bg2XPeS0ojBKvd/83+zpQ+0LINTAFTVdUsfSnNwIqOib1df9kmJq29GHh/mv7XkV1MZxZ0/aA41i/8qTop9QFHheSkilI+RJ4VuBFL99mA8KZ+2PdCIhawPYtIxopmx65ZF3HPBrWL6HfzApk32uxXc2+CXyCzPCjNJNM25aRfUayBQUGoFo/TjmgbtqP/W6rfobbEcSsY2VsXD3khjdEvjXkbOzGaYrqa+25HjU0vnPf3QgacQt9OLs/woU3IA5MoWM26CK1qcraKZ21b4T2h7Z9B3/iXpi0CgiRY9X5XejG24ii/kcVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4seuOze60t42VuYjxsp33ZelNU+TsB7ySvQfoJHiuA=;
 b=hfR5Z6BtYgeF5avf+E20r9YlajW1nS2/i2732bNN87RshIwXgNs3gvsAdUZKDtYHg0c+t/TlbQFQOOsJUwGoz1xW+0xoYFs9QtyAeuFholtA2RCW7PuyldijTRlK7VW9+wcgrCDIfP4wVcTtRWEUXtD6+bns50NW0ynnBIz64PA6BibqunAy5xbmM3bqbqEoYSjzw7jMDhcmh86y9gjuCGeWeboQsoNqBL/8G4GYQODTbWBSbnyva+oaUpn4a50LHc9SKljObPEUzg/+UkkEBxR1Ut2BUZ94tcUOfyiiPpDmkauf6DjPXvcb/Lr4Bcm09anZN1g73NlXNb+V6XQpCg==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SI2PR02MB5209.apcprd02.prod.outlook.com (2603:1096:4:157::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 10:57:53 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::30ff:d406:2573:5667]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::30ff:d406:2573:5667%5]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 10:57:53 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] networkmanager: upgrade 1.42.6 -> 1.42.8
Thread-Topic: [meta-networking][PATCH] networkmanager: upgrade 1.42.6 ->
 1.42.8
Thread-Index: AdmvL09LQ1P3P61qTWOTQwoqS4hSFA==
Date: Wed, 5 Jul 2023 10:57:53 +0000
Message-ID: 
 <TY2PR02MB3678C2B2BCB55864A4C7917E812FA@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SI2PR02MB5209:EE_
x-ms-office365-filtering-correlation-id: b95108d4-2490-4bdf-8c36-08db7d46ae92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UXRQBO+njvFk1o/1uUg+ld6K/RT43M8/ApwXZO+xcwbihnMCAmXG7p4OSDIxZAARh94mAt6ikhV+tyqqrn4hV4RIfGxL1rcG9CZrkV1fi/LPCszcxyzyyFp+nyvzq4lXyBsptV8Qy++OvGRDjNTeF8H9w84n3Nw+5CgL3TfiYu2qT2c60MPACoVC0EyeCnXCOjZY24GnLWIveVYVxSUXcJiSyJJ7lpT8mHv0MzaewYsUL/7TQKnd/xSp9WM8DvzUfskjmwkeNYt85VkSrxqcrrDJUodLws1LkY2WGxWqXIFjrZ4lmlNmyqyV84DnAyB3Uq0Xa/57fz5Ry44id+OI7ZBEu5iqqVJt+HgSlx0r6S0E8Z0K8nrHhWgnBgm4+JS5AawVj2ntOwtmgnRb+nsIx5mLs+M4qYOIty2hW3Wvw1+VpAGHTCV+ZyTGfbSNciLgxGQYeLUx7vo88AVWTfEleLXptBzWi7uqgC4wTISo6b0C6uEOyj2k7ajKlrtDc4MegYOPqq1Ve2Ol0l74K5Hw/3RzpnHpG4kr6u6dddqp6cFaKaHRYmpyxP7m+QjvKSA8exU+80FtfReganw5J2LmtSoKzn2OQYQwvLsKNl2XCh7EX9yLLTsYCg/Ps5J9jZfO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(8936002)(8676002)(2906002)(55016003)(76116006)(52536014)(5660300002)(6506007)(44832011)(186003)(41300700001)(122000001)(7696005)(71200400001)(66946007)(33656002)(66556008)(66476007)(66446008)(64756008)(316002)(83380400001)(6916009)(38070700005)(478600001)(9686003)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZzkwS21UMnNGZnRTcDJkUkhnYUFmYmVld2lIakw3THFzUEFGdTRSTkU4RE9w?=
 =?utf-8?B?TnhtQWZzK0pJVlZGMkdUWC9sZU9jT053U29DdmZzL1JabE9EOTdyeUJxcnB2?=
 =?utf-8?B?blpONzhDbTA1U0NVejRNVE50azlWZk1pRXRpRnNjSEYxYUE3REUwSTVISGN5?=
 =?utf-8?B?eDcvTTYxUTVsVWcxRm5UUmRNNmI5NlpRb1REVEE1QUtQaWZZUXlRSUtUREJH?=
 =?utf-8?B?aVhLdm43MjZWWHJtSk9GRkFjYmMrL3cxUlNyK3h2WU4wNWRCVG14di9wOGtG?=
 =?utf-8?B?aS9WNSs3RFBlWVhPNnJYR3NOMFZNTlhSQ1pnVmNFbmszQnFpV2lKdkNqTWov?=
 =?utf-8?B?U1Nrd3Qrd1lCZkwyNDZQSld4Q2M3Wks0dFlKdkp2azdCWkZqcEMwUkgrNG9P?=
 =?utf-8?B?TGF0R28relY3QWdVMElTQno3TWpNK1RWOHc4bytNTWJzN1k2YllZL0pzQWVH?=
 =?utf-8?B?Y0VnZDFaa1JYL3FKZU9IQXYzWnhZYW9JVmZwekxXVTFqRVZXSGdDMk1sbnBD?=
 =?utf-8?B?Z2k3RUl1NTRFbk5Ra0xaTGJBd2RkYUJNK0U4YmZkVElJeE04ZkE2anZxZUxv?=
 =?utf-8?B?eGVPNnh5anFWS1BwcVFJUllpU0taN0xKMkdJRGdEU2NwVWQwdjBqOXBHVjcz?=
 =?utf-8?B?K3RIUUpJUGtqRTloaGVYSjhsVDZSdmxNWTZWMThvczZoYzlqbmxHaFd4ZjBH?=
 =?utf-8?B?bFBTZExPRGpndVlGRkx4VmFjL0U4YUJqc3dJL3NtNmhncGdXODNjaHZWS2gv?=
 =?utf-8?B?VWQzcU5URkFTcHU3TUh1d3JqNEEyY1FqYlNHenIvQzdVUzZ5dExHTlJWREsw?=
 =?utf-8?B?bzI3SGg4cmFWNFFnWlRCUVVLLzB6YjhwenY2aUhUTnJsRzJsU2JYWjl5T1Nx?=
 =?utf-8?B?NDc5azNiTUs2LzU0cUc0TTVuNnIvWXBlbW1yWWI5Wk5YUjlSS0dLR0NpVVhT?=
 =?utf-8?B?N2Fkb0dhMzRUeEdmY0RKNlBWNHoxcEhJRDhMWWlwNzI4U1NBTjV1UlBZYzJ4?=
 =?utf-8?B?YW1sL0VpTy9Xb1FpaThPWFppNXphMndWcVA3Vy95NWVvUTBLVnNKV1pTQjhn?=
 =?utf-8?B?QkRndVlkN3J2aW5KclRxbis0WWlobDdlZ1UwWVpLQ3NaUFJBY3ZZOFJaR29n?=
 =?utf-8?B?L2VKV3MrSlg4a29XVjhHVWxpMFRRWHQ3OXBKNnlVREwzZUlQMnRhNm42K29p?=
 =?utf-8?B?U1ZYeENUNEg3SXF5WEQ2M1BKQkgyTVJCcWtWYXJBQ0lCQ016aVQxSTBBKzJZ?=
 =?utf-8?B?eC9Vd2hmSlNVWkZmcm15STBaUXgvQmlKZ3VvdVNXd0VkbzlOS244YnZXTjZn?=
 =?utf-8?B?RlEwZjZ3OXBIZEFMYTRRcTVBL0JhN3FFMmhTQjgrL0ZTTnkzbGNnczdKTlho?=
 =?utf-8?B?QnJXbGdaVEN5NVRZRGFVQi9waGE1OTlxNUFodlNFUmYvSGR0ZW15NFo4Yk90?=
 =?utf-8?B?emtHR0tHR3h4RE9JMXI5em0zYW05RnRrWnROSFJKWVZKeHhRd1hqdWs2Szll?=
 =?utf-8?B?ekhpN3BuUzBRMGJXQzRzckZUeGhkNjhMdEtFSWRvejBVdE9pa0FnMjJMbTE2?=
 =?utf-8?B?ODNmOWx2YXVxMHZSZ3V5R3FGK0hSdlUxWnY4TGpNUHFBaGhOSG90TkxnT0o5?=
 =?utf-8?B?OHEyRDJPTjZZaDNJc0JaK1ZPa3dUZFNEWThib1NsQUh4MlArTHZGMzdRaXp3?=
 =?utf-8?B?L1lLSmptU0xidzFDcUoyRnFZd2s0QjZ0OEpBU0I4RFFzZ1B0WjZSTHJybzUy?=
 =?utf-8?B?VmdCRThlcy9mUnRDNC85MDNEL1lRVTdTNUMzMUlSbFZMdU1aZnpadGViaHJa?=
 =?utf-8?B?WnFqaTBVckZqSFhNRjhLOGZBYjZhcmVsMkNUQnlCdzVHaXMzcHFIVkdDa0JL?=
 =?utf-8?B?d1F1Yk1LZXJMVWFjdlBHYnRGejdmY1k5Y3dreUhYZ3lvbGF3MDJ5Ym8zV3J6?=
 =?utf-8?B?REVBWWNXUEl3bGIyOVo0UGpvV0lVZXFZNlpZdkNPd1VaRTJ6aDd1ZWVTZkpw?=
 =?utf-8?B?dXlpVXhRZUp1VkJ5WHZkYlJIeG0xTThVYjlOc2xWTmNhUCthSTl3cVdVdCto?=
 =?utf-8?B?VHJuekRFMkx6bXIydVVFRmhGMUNCTEhidm1SZTYvRjI1NzNrdnBoNUkwT0wy?=
 =?utf-8?Q?ICLo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95108d4-2490-4bdf-8c36-08db7d46ae92
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 10:57:53.2910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fwhm8UNBJKE4svH4jZYpnA8PgesDK+PComFWGrIn9TG4TKgBDubWBuzznsZvKfwH7SfuH8ZJRFXBJsSEcVR28dbfm1BMInh2uDN9YE+s+wU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5209
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 10:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103667

Q2hhbmdlbG9nOg0KPT09PT09PT09PQ0KKiBBZGQgc3VwcG9ydCBmb3IgcHBwIDIuNS4wLg0KKiBG
aXggbmZ0IHJ1bGVzIGZvciBiYWxhbmNlLXNsYiBib25kaW5nLg0KKiBTdXBwb3J0IHBvcnQgcHJp
b3JpdHkgZm9yIGJvbmRpbmcuDQoqIEZpeCByZWdyZXNzaW9uIGhhbmRsaW5nIHRoZSBQS0VZX0lE
IGZvciBpbmZpbmliYW5kIHByb2ZpbGVzDQogIGluIGlmY2ZnLXJoIGZvcm1hdC4NCiogRml4IHJh
Y2UgaW4gbm0tY2xvdWQtc2V0dXAgdGhhdCBjYXVzZWQgcGFydGlhbCBjb25maWd1cmF0aW9uDQog
IGFuZCBsb3NzIG9mIGNvbm5lY3Rpdml0eSB3aXRoIG11bHRpcGxlIGludGVyZmFjZXMuDQoqIERv
bid0IHRvdWNoICJuZXQuaXB2Ni5jb25mLiRJRkFDRS5mb3J3YXJkaW5nIiB1bmxlc3MgZXhwbGlj
aXRseQ0KICByZXF1aXJlZCBmb3IgSVB2NiBzaGFyaW5nLg0KKiBWYXJpb3VzIGJ1Z2ZpeGVzIHJl
bGF0ZWQgdG8gdGVhbSwgV2ktRmkgUDJQLCBJUHY2TEwuDQoqIEF1dG9tYXRpY2FsbHkgdW5ibG9j
ayBhdXRvY29ubmVjdCBvZiBwcm9maWxlcyBkdXJpbmcgcmVhcHBseS4NCg0KU2lnbmVkLW9mZi1i
eTogUGV0ciBHb3R0aGFyZCA8cGV0ci5nb3R0aGFyZEBhZHZhbnRlY2guY3o+DQotLS0NCiAuLi4v
e25ldHdvcmttYW5hZ2VyXzEuNDIuNi5iYiA9PiBuZXR3b3JrbWFuYWdlcl8xLjQyLjguYmJ9ICAg
ICAgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQogcmVuYW1lIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZXR3b3JrbWFu
YWdlci97bmV0d29ya21hbmFnZXJfMS40Mi42LmJiID0+IG5ldHdvcmttYW5hZ2VyXzEuNDIuOC5i
Yn0gKDk5JSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9uZXR3b3JrbWFuYWdlci9uZXR3b3JrbWFuYWdlcl8xLjQyLjYuYmIgYi9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXJf
MS40Mi44LmJiDQpzaW1pbGFyaXR5IGluZGV4IDk5JQ0KcmVuYW1lIGZyb20gbWV0YS1uZXR3b3Jr
aW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L25ldHdvcmttYW5hZ2VyL25ldHdvcmttYW5hZ2VyXzEu
NDIuNi5iYg0KcmVuYW1lIHRvIG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9u
ZXR3b3JrbWFuYWdlci9uZXR3b3JrbWFuYWdlcl8xLjQyLjguYmINCmluZGV4IDMxOTZiMGMyNDQu
LjVkOWM2ZjQyNzQgMTAwNjQ0DQotLS0gYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0
aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXJfMS40Mi42LmJiDQorKysgYi9tZXRh
LW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21h
bmFnZXJfMS40Mi44LmJiDQpAQCAtMzIsNyArMzIsNyBAQCBTUkNfVVJJID0gIiBcDQogICAgIGZp
bGU6Ly9lbmFibGUtaXdkLmNvbmYgXA0KICINCiANCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGMz
ODhhYzM3NzVhYzZiY2ViNjA1ZmFlMjFiZTJjM2UyNjFjYWZlNjA2Nzk5NGE4OWYwZGZhNDYxMGVk
MDI3OSINCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDMzN2U3NTgzZDJlYzVhZGUyYmEyZThjNjI1
ZDJmMDllZWNjZGExZDIyODM2ZWUyOWFhNzI5MjVkMzk5YzM1MyINCiANCiBTID0gIiR7V09SS0RJ
Un0vTmV0d29ya01hbmFnZXItJHtQVn0iDQogDQotLSANCjIuMzQuMQ0KDQo=

