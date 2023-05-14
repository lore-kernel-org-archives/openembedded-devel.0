Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C1EC77B7D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 22:13:48 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.43])
 by mx.groups.io with SMTP id smtpd.web11.75974.1684102421791437506
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 15:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=TLWbB1ke;
 spf=pass (domain: advantech.cz, ip: 40.107.255.43, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMD6D1dWni+H8vJD1HS/+HQCpd8FczCv9Xc49Y3aecXvRMpmfnGMfhv0ukDEMLy6C3Br2k/7EAwSAMwEBRvARy+F8+cwNUrO47bMuDzj63rx9awtCVOezzTQUcakS9Cxoez4CRG4oeWpnCfvXcxrm++3nrcqnJUlHtgB+RNEA1H+LUhYBj+FX1h+NbSiYtnP8feinJ0p11gFlEJl6oVR+g5V54vrhtU/qPIK8ofmp22uJJLQJyLCjCu1U4O8R30oxG6+EppE4L+13BoOr0m/JTpTZQhkyIMRpHgnonpeDJpWZZe9rom6O9ydmm9G0GdamO9XPd7BDBMWu95loynuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42DNvjUFxw2fAh7EAXjhVFgK21LNgfQ0Ft/Zps6q0wA=;
 b=ZtQdYbWJYUAlwPMbFD4U+PYtr1Qm3xZQQFDqU0HGVLKxRNWRkTR9EmpAJz8SX2orIvm6mKaLsYuOKZphblDPlkkZYGEIiUkR7DiJop5fS1fLzS6iOGRLvkhNxdI/L+AJkor5DhjH09U+ISAkpREAZIqh8isfjCBI3lFx1a0ET8dDbYLOekdtBBMPcwdSMREU1nWz8FbgOLpVhrAAGGO0T8tFKKYnDeq/5BZbuL4YUVQ+gtg9XFnmloYF400kuhJ0WWGQSGsfLca9MRmxofWEyWWAzMLaS6p0Jh+4rDz+l7z5eY8vg67l7rJXw/QZokXgQfJUFqLWZ6FYfzqncnts1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42DNvjUFxw2fAh7EAXjhVFgK21LNgfQ0Ft/Zps6q0wA=;
 b=TLWbB1keFdiS/cp4KdTW3pc9E1g+o6cEHVFPUauZ5dmRn+Ntxym60oubdFtfUG1iHh7vQl2WRosZ7BVktlCCFSxgksp1qqebxIsEIpeDPBmdJJZ+gtoiZUM3AW0/FM3LL/SFs3YKFg+5wid9DJNC+wH+3iIGr+9DIgoILpyZerdMzCt6Fj5ZQHNOkFnjf/dp05f2yR5bORxruPj+hPg15IjsOkYb6MlW/cFXo3zKklqYnebJmc5nTWoohZxd/RevoUnNuP+4BRmTBxIB3CpDjzBdILACPz8EFPE1qqvJor6r4Dq/U1FuIs8GYT5nzfqP0bAbLU8GptNasCYarPqUBQ==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by PSBPR02MB4376.apcprd02.prod.outlook.com (2603:1096:301:a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.14; Sun, 14 May
 2023 22:13:37 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598%5]) with mapi id 15.20.6411.014; Sun, 14 May 2023
 22:13:37 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-networking][PATCH] networkmanager-openconnect: add new
 recipe
Thread-Topic: [meta-networking][PATCH] networkmanager-openconnect: add new
 recipe
Thread-Index: AdmEJJQdrfH5UqZDQDS9jCHz7v/L5QCis0GQ
Date: Sun, 14 May 2023 22:13:36 +0000
Message-ID: 
 <TY2PR02MB3678530BE6F0335EDB587A14817B9@TY2PR02MB3678.apcprd02.prod.outlook.com>
References: 
 <TY2PR02MB367872AE3A1AA146901FF92881749@TY2PR02MB3678.apcprd02.prod.outlook.com>
In-Reply-To: 
 <TY2PR02MB367872AE3A1AA146901FF92881749@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|PSBPR02MB4376:EE_
x-ms-office365-filtering-correlation-id: ce36148b-759f-47ba-0789-08db54c876d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ofAU3cUqIUXwyXtyzPsHCR0EgyysD0GSkB6X8f+96qQrtYBTPa7vrD64FZJmk49kUgLSTZVaFt8GW4o8LSDDPUQeV1H/dYNnSCSVFMUXeullsVb3wwGa3FPk8CBzQHDzCq/yT2ApHlkSRmwo17sS27JyF2enteDEGB7sDTxXRqkM5vripgJmxx/dY9ayl9RaFpOEl4qty+DJevKuaKm5fPqrM11BV9zZGEjwRK7bSnfSv1ivIH5fSt+vdhjAqwfljDyKmAzUyODXNmOhswUMBooq7uIIPXSSPY7E/hp+aBsN6wZyi/DPDaLFhjSu2H+2SwLNytFPH7cQelvXtzyVWDMIoe0mCK1+B3XPwCEeF/C4/v5gldkoi0sUNzvsMrTZwBq+DS47kEasg98R8Qwns0e+RcnvK0EY+CTdbAJLGMLzpDvqVUfPdlFkfallwoeJ2LemnN551QMj3jG6deuUIFWTtXkANuFVtJFTIXYJY/PfEctXrNmYveJsyCwLxl04xGtREKWJLF295hVu4rZkbiw+iMkpyk7ZFKTETcTcsMbYw0rNzt/mOLu10N++6C/6bagQxIRSm7y/KJ+syYNfpoMoTHFC/fFXYBCjW7ubIuY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(451199021)(83380400001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(55016003)(7696005)(26005)(53546011)(9686003)(6506007)(966005)(478600001)(186003)(71200400001)(44832011)(52536014)(5660300002)(86362001)(8676002)(8936002)(33656002)(2906002)(38070700005)(6916009)(41300700001)(316002)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NlpiQUI2c2JuNEhXUEIra2I0OC9uQnNQcmp6bUV4WUM5UWlKWngxMDZGSUhP?=
 =?utf-8?B?SjV6VGpuUVNqNFRWQUlVeVk4TlllS3hSNW15ZGcxWU1veEJ2S3VLZURsU2oz?=
 =?utf-8?B?Rk5iVXZpN3dERlNxMjViYk96ajk2bm9jWjN0TlB6bllDeVREY2Z0RTJrY0ZG?=
 =?utf-8?B?aTBaQnMrNHNJUlZzU2R3YjVkN3RlK2RQT0E1QkxVa0NLMW5ZMVl1S2xRMlYw?=
 =?utf-8?B?bVpGNE5EUWhoQkw1MkpHUUdlSVFjeDU4cmhYc3ZkL04wK1BucFZ2aEVQdkxk?=
 =?utf-8?B?NEpZaVg0V3hhUlFPSHNSNjNlSzU1V3RmeVB5MW9qNHFZRWI4clViWldXd09U?=
 =?utf-8?B?TTJMSk56WjErUTRyNjluYW5NQzlEcm9QRTgxYmdoVkR1djA5NlJKQ3lFSGdM?=
 =?utf-8?B?R2hMKzQ2MENkK09DMVdPY3UvdFNtZEVBVGtGRE1RZHZKMmxVSFFIODdydkt1?=
 =?utf-8?B?UmhQZ0w2aU1QTE9uNFdJU2xhNzBTa3dKRjMza3JLZHpIdWs3WnpRT2wyVFJ4?=
 =?utf-8?B?WTBMTkZRWU8xWnJKQ3JrQk5QSGtiY09RMmx2SFIrU0VRR0l2RGkwVlhnZE1a?=
 =?utf-8?B?VmUzNThwQ3JkamRPMDFRWkhzTURXRk9YM0Y1c1QxKy84RUd6N01nMW9GbmQr?=
 =?utf-8?B?RDlOZWpUMlk4VlRsMVc3eHE0TEcrZnZpcUdndXZTTW1aeXhhRHRLNXN5MFVM?=
 =?utf-8?B?Yk1rMDMreWtDaUJ6b2R4Z1lpaVBJYjlBMHdwK3BsNFJ5RnlXbjRnYlpjSFNB?=
 =?utf-8?B?TzRhcjlNcVRkOFhXZDhqa05PVXI0ek9jWVhzQmQ5MS9Dc3ZvNGMvNUxjMzBm?=
 =?utf-8?B?MitMTHFUQlhDN0tUT2p1MXlEVnoyUkNBMlBVa3VxNDBxUkVYTmxBbU9DSHdQ?=
 =?utf-8?B?bnE3TmxrZ0lLaTVZTXJka2ZDTXZ6NnhKUTYydmwvbnBkQUZWSDF0QkE4MVV2?=
 =?utf-8?B?d2E3NlhDaGQ3TENqV2NaSHpDYjA4ekppQ3l2WGR5WGdaQ1l1UU9XMUNtMGpB?=
 =?utf-8?B?Ry9SMjFWbjVsWDUvUGI1S1JaYnRLUkVQbUtQQVMxV01uZVlETGJZOWR4MXJT?=
 =?utf-8?B?VUpDOGhpQnFkd0t4eVpJWlFBR3U1bnZSYW1DdjdaclFKVzFTNEdUVWZTdGdK?=
 =?utf-8?B?Mm16cHBhK0prK2wyTnd6Y1NGQUxKd3ppZlZOaE9zd2lNOTFXTmE0YXRSNkNU?=
 =?utf-8?B?Z2w4K3RmRjFFL1RNY1BuWldRd1lhUXh0YkJRN3hJeUJ5MjNTc2lZZEtmOHpH?=
 =?utf-8?B?U0V6Yzh0emNacEZmZHNoYzl4eDV2c1oyZWYzdERXRlRDMXFvNVphZjF4Z1Jj?=
 =?utf-8?B?UWljZ3RxVTVWQWE4aC9EOEpMR0pPRHFaTWZ4aGsweUZMajFzM1BCT1V0QWNJ?=
 =?utf-8?B?VDE5akhlTFF2eElLWFdidHZFMUFrRkhVOWcrdVQyNDc1Q3Z4VTdGaGZZeEhW?=
 =?utf-8?B?THgrdkszVWxIMThVOHFHTnVRTUkraGcrY3F3ZEd1d3M4S0VLY0VyR3ZVN3l5?=
 =?utf-8?B?ZEJmNzdpQkJrK2ZDRVJHUzJsTkNvV2dMeDJPS2pNK203QzBsbzBiTHF4eDJj?=
 =?utf-8?B?R2s2Q2pmcWUwc1krcjJtbFBNWDJUMW5tU056UmVONnRIOVQxN0drUHIvR3ZR?=
 =?utf-8?B?VEw2R1hsZkw4N21qNk82VktHbDIwTlo1cGRidDIrTFZOeTBmN0pxOFVxR0Er?=
 =?utf-8?B?bGdWNUtWNUk2aTZ4Yi92ZXRiTU4yc3U1SFlrY0V2M0Nqa1hPNjdoRWM5bXVH?=
 =?utf-8?B?Ykp4M3lGcXJNcHQ5SzRFNlhUM2xiU3h0OXBFN2lmNVQzTmo3aCtmNTlxMk4w?=
 =?utf-8?B?aXlJVjRMcDRuaW05YWNDMjVyY1I4eGk3a0wzQXhsclVWMXdHb0M5dDRqc0VY?=
 =?utf-8?B?SGhXOFFXS25QMnBleCt1UUt5TmZqc1BwMjd0dnVRZm1jN2RIZ01tc2dCZUFv?=
 =?utf-8?B?R0pUeEFTMmFKMlNIZmtRazV0T0VUdElZNm1lTTNTN01kcU53TU5lOGtXRzlZ?=
 =?utf-8?B?bEZsRVFTSjFzSWloSERZeVZJM3M3aVpMTEg3SU9ZSGVMamZTcDlsNkt3YWU3?=
 =?utf-8?B?dXNlV1ZBQjNYdzFUSkdPQTd4aTl1a1UrTHI2VXJscVZqeC9NRExidzNDK2Jz?=
 =?utf-8?B?NzVWa0VVdTk4eEpWcjhneWExZ0tNb3owNWc3eTh5NkFHTU1hdGE2NnJWMTNv?=
 =?utf-8?B?M0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce36148b-759f-47ba-0789-08db54c876d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2023 22:13:36.6241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K5nvXF7xDMuREU3FOt4pJK8P3yCGX7YG6VSpGhwoEwElLkEAAMYxnuZx7TtfgqXl6CuqHb7zwKmPaRMhnKQ6hh8BjsLXOv6KQRT0Ntnu6xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR02MB4376
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 22:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102588

UGluZy4gQ291bGQgeW91IHBsZWFzZSBoYXZlIGEgbG9vayBvbiB0aGlzIHBhdGNoPyBJdCB3YXMg
bGlrZWx5IG1pc3NlZCBkdWUgdG8gZXJyb3JzIGluIG15IG90aGVyIE5ldHdvcmtNYW5hZ2VyIHJl
bGF0ZWQgcGF0Y2hlcywgYnV0IEkgZG91YmxlIGNoZWNrZWQgdGhpcyBvbmUgaXMgY29ycmVjdC4N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBldHIgR290dGhhcmQgDQpTZW50
OiBUaHVyc2RheSwgTWF5IDExLCAyMDIzIDY6MzMgUE0NClRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogW21ldGEtbmV0d29ya2luZ11bUEFUQ0hd
IG5ldHdvcmttYW5hZ2VyLW9wZW5jb25uZWN0OiBhZGQgbmV3IHJlY2lwZQ0KDQpJbnRlZ3JhdGlv
biBvZiB0aGUgT3BlbkNvbm5lY3QgVlBOIGNsaWVudCB0byB0aGUgTmV0d29ya01hbmFnZXIgaHR0
cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL05ldHdvcmtNYW5hZ2VyLW9wZW5jb25uZWN0DQoN
ClNpZ25lZC1vZmYtYnk6IFBldHIgR290dGhhcmQgPHBldHIuZ290dGhhcmRAYWR2YW50ZWNoLmN6
Pg0KLS0tDQogLi4uL25ldHdvcmttYW5hZ2VyLW9wZW5jb25uZWN0XzEuMi44LmJiICAgICAgIHwg
NDYgKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCsp
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9uZXR3b3JrbWFuYWdlci9uZXR3b3JrbWFuYWdlci1vcGVuY29ubmVjdF8xLjIuOC5iYg0KDQpk
aWZmIC0tZ2l0IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L25ldHdvcmtt
YW5hZ2VyL25ldHdvcmttYW5hZ2VyLW9wZW5jb25uZWN0XzEuMi44LmJiIGIvbWV0YS1uZXR3b3Jr
aW5nL3JlY2lwZXMtY29ubmVjdGl2aXR5L25ldHdvcmttYW5hZ2VyL25ldHdvcmttYW5hZ2VyLW9w
ZW5jb25uZWN0XzEuMi44LmJiDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAw
MC4uYzk3OGRlZmJiZg0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0YS1uZXR3b3JraW5nL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L25ldHdvcmttYW5hZ2VyL25ldHdvcmttYW5hZ2VyDQorKysgLW9wZW5j
b25uZWN0XzEuMi44LmJiDQpAQCAtMCwwICsxLDQ2IEBADQorU1VNTUFSWSA9ICJPcGVuQ29ubmVj
dCBWUE4gY2xpZW50IGZvciBOZXR3b3JrTWFuYWdlciINCitTRUNUSU9OID0gIm5ldC9taXNjIg0K
Kw0KK0xJQ0VOU0UgPSAiR1BMLTIuMC1vci1sYXRlciINCitMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT0xODZlOGI1NDM0MmRhNGY3NTNhNjJiNzc0OGM5NDdkYiINCisNCitE
RVBFTkRTID0gImdsaWItMi4wLW5hdGl2ZSBpbnRsdG9vbC1uYXRpdmUgbGlieG1sMiBuZXR3b3Jr
bWFuYWdlciBvcGVuY29ubmVjdCINCisNCitpbmhlcml0IGdub21lYmFzZSB1c2VyYWRkDQorDQor
U1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vTmV0d29ya01hbmFnZXItb3BlbmNvbm5lY3QvJHtA
Z25vbWVfdmVyZGlyKCIke1BWfSIpfS9OZXR3b3JrTWFuYWdlci1vcGVuY29ubmVjdC0ke1BWfS50
YXIueHoiDQorDQorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVkZWRhYTc4NWQ4MmQ4ZTIzOWRkZDA4
MmJmYWM1MjUwYzY5MWU5NjQ0NjRiZTE4MDdiNjgyNzI2MzYzM2NkY2MiDQorDQorUyA9ICIke1dP
UktESVJ9L05ldHdvcmtNYW5hZ2VyLW9wZW5jb25uZWN0LSR7UFZ9Ig0KKw0KKyMgbWV0YS1nbm9t
ZSBpbiBsYXllcnMgaXMgcmVxdWlyZWQgdXNpbmcgZ25vbWU6DQorUEFDS0FHRUNPTkZJR1tnbm9t
ZV0gPSAiLS13aXRoLWdub21lLC0td2l0aG91dC1nbm9tZSxndGsrMyBnY3IzIGxpYm5tYSBsaWJz
ZWNyZXQsIg0KK1BBQ0tBR0VDT05GSUdbZ3RrNF0gPSAiLS13aXRoLWd0azQsLS13aXRob3V0LWd0
azQsZ3RrNCwiDQorDQorZG9fY29uZmlndXJlOmFwcGVuZCgpIHsNCisgICAgIyBuZXR3b3JrLW1h
bmFnZXItb3BlbmNvbm5lY3QubWV0YWluZm8ueG1sIGlzIGNyZWF0ZWQgaW4gc291cmNlIGZvbGRl
ciBidXQNCisgICAgIyBjb21waWxlIGV4cGVjdHMgaXQgaW4gYnVpbGQgZm9sZGVyLiBBcyBsb25n
IGFzIG5vYm9keSBjb21lcyB1cCB3aXRoIGENCisgICAgIyBiZXR0ZXIgc29sdXRpb24ganVzdCBz
dXBwb3J0IGJ1aWxkOg0KKyAgICBpZiBbIC1lICR7U30vYXBwZGF0YS9uZXR3b3JrLW1hbmFnZXIt
b3BlbmNvbm5lY3QubWV0YWluZm8ueG1sIF07IHRoZW4NCisgICAgICAgIG1rZGlyIC1wICR7Qn0v
YXBwZGF0YQ0KKyAgICAgICAgY3AgLWYgJHtTfS9hcHBkYXRhL25ldHdvcmstbWFuYWdlci1vcGVu
Y29ubmVjdC5tZXRhaW5mby54bWwgJHtCfS9hcHBkYXRhLw0KKyAgICBmaQ0KK30NCisNCitVU0VS
QUREX1BBQ0tBR0VTID0gIiR7UE59Ig0KK1VTRVJBRERfUEFSQU06JHtQTn0gPSAiLS1zeXN0ZW0g
bm0tb3BlbmNvbm5lY3QiDQorDQorRklMRVM6JHtQTn0gKz0gIiBcDQorICAgICR7bGliZGlyfS9O
ZXR3b3JrTWFuYWdlci8qLnNvIFwNCisgICAgJHtub25hcmNoX2xpYmRpcn0vTmV0d29ya01hbmFn
ZXIvVlBOL25tLW9wZW5jb25uZWN0LXNlcnZpY2UubmFtZSBcIA0KKyINCisNCitGSUxFUzoke1BO
fS1zdGF0aWNkZXYgKz0gIiBcDQorICAgICR7bGliZGlyfS9OZXR3b3JrTWFuYWdlci8qLmEgXA0K
KyINCisNCitSREVQRU5EUzoke1BOfSA9ICIgXA0KKyAgICBuZXR3b3JrbWFuYWdlciBcDQorICAg
IG9wZW5jb25uZWN0IFwNCisiDQotLQ0KMi4zNC4xDQoNCg==

