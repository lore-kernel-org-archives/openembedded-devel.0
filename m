Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEACAC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 20:46:19 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.80])
 by mx.groups.io with SMTP id smtpd.web11.11.1685565972104481737
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 13:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=B5ag7kf6;
 spf=pass (domain: advantech.cz, ip: 40.107.215.80, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWSXQpu3blAat/5LzDtEMUxg0aOCiaQJxKPUdaU8svPc5OXeT/EAF29N2hApzutIH7SKyN6J6S4RaxlZhW02Anj3x+ezXksse7hYeaG+nyAn8rWu8vE8dFz73YxQ37YcKAChA5ytX3/NKuoFQCn+ARbsLTnXIxzTDinMXk0hNkBZEfQlSv1lsWcW0PYWbi4zryux6HjKKBQck2XrmGexozDgxyfacVjJxEfyiPwGuACu6mXHGsjIyl+BLp0i6JKgYJF2E/gqva7FvHx/rxwVb8qm5bgR71C4xAfMFsjf46RrTucOeDwo1i6sCNm/c/A9xwPxfCbdnANKU53YBIT6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=la4poRu1sekfNz7b+NfRiE6hidmeROCXYTb2r42Yrd0=;
 b=IYIWWVzoRSCtjXDN94DaHeS93J7zYeqZ3F971r/Z1XZZu6p/aHxD2JMFAD/RO7hWOkm88PxiIxdHPI0UxQSG4m26+dUBX6HX5yJG1VAAIbRuDzDF8SeiOzB2yUHVMbJsnYn1PPRHS6xggcx9ZYNJ+ekKiv1/fJJhfnlpHVtg4i8Weo+88MEKqlbx1LteaNZI/5rvcy4UOCkGnhfVOeZKFe1bAE/A5pdrGbc8n76f+u+PLMuneS0XvdgaUqQrYp+JYAuZbp3bqyLbRZIwZFqSFADY8smnV2OjJGnYDma5is8GSJYtsZa5hR//5Mz+BKF+roxXOI+5SCn3YnqmNHDfeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=la4poRu1sekfNz7b+NfRiE6hidmeROCXYTb2r42Yrd0=;
 b=B5ag7kf6YTci7ZP+ny2N0eeXma6sGqRD5Ebizw0GEADfKNJCoAF/0r5Tc/Vgps5uYuBaYx7qv3er/DQ45t1/BBFW9BJCbs6Q33ppRh6JMY94lFPyPxdC3VNHhowunXnAREup2oxFO0tohIY96KkhW9fZ5ooazdFeTBkkqePS3pjfoEeph3qHobkINjqCOVsjPvxdIjZ1UFLusORdm2WjMElx+RevRA4nnBUKmf83Wi9a8QIEGM6lSRhUOeY/3VSBRKLsimC20q7mdaEGqcMWcRMLtoHhK8BVWjVTR07Jgqloup3cTsX86jfpbfDeTB/jfeik38CPFBH2cR/2d3oapg==
Received: from SL2PR02MB3676.apcprd02.prod.outlook.com (2603:1096:100:47::18)
 by SI2PR02MB4730.apcprd02.prod.outlook.com (2603:1096:4:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 20:46:08 +0000
Received: from SL2PR02MB3676.apcprd02.prod.outlook.com
 ([fe80::2dcf:3f1b:7609:d74e]) by SL2PR02MB3676.apcprd02.prod.outlook.com
 ([fe80::2dcf:3f1b:7609:d74e%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 20:46:08 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] firewalld: fix REQUIRED_DISTRO_FEATURES
 gobject-introspection-data
Thread-Topic: [meta-networking][PATCH] firewalld: fix REQUIRED_DISTRO_FEATURES
 gobject-introspection-data
Thread-Index: AdmT/7bft2qlz1DpTwGBlb7gXnc3aQ==
Date: Wed, 31 May 2023 20:46:07 +0000
Message-ID: 
 <SL2PR02MB3676D733E0A29D2B4261AA0281489@SL2PR02MB3676.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR02MB3676:EE_|SI2PR02MB4730:EE_
x-ms-office365-filtering-correlation-id: 98ca3710-914a-4fc8-03c8-08db62180f5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 U7U13usx59FAM/LTVyD1+cPYqxERoSChWxnVw4V+qmS/jEOa4vABnyFpg+5PjbRZ6XkD54ElPOpwUIOHIGTd7Z2z2/69+SGQk5bAzcZMbNj+Tu2/rBEtK4KKhUG9EmxPSzNJGvIkdB6bkq+FWJbIkBccu5cgBbRFogDGY7YRFGEC5bePi72gF1eCFbYptOdARGTA3+lQGm75iPoZJ7KQa0Weq5dFJKb9ZJRA+gsno0DQZVFu+Udp/UaOw/WmdgGfja7NxrH7UeWq4YSAw++dhxzewzjdpv9yUbSV3jTUUYl3fkP/VRwb0jYBX+9ruehTuCCaBnxSB1hXNDvqiiTJjF5HK1VdDW04Au91xzbCvl9lxOq0AshTLT8FkKt7P++0oExjf2ydGMIXEtMCNy2YPoxRJ3VA5bz/H4ZGTEiIBTlAsLTF39xHoPFJeMe1dJrW4pjxgO9AQco8rQtLsQUWhAYBdNWmTS7rxIphPKvcnmY2Q3l2sbXKptkokyvh9mR3anqMIS4KzlF8iYEaLWOhG/ZXlC/vaSS1SYsH29DCGPlqivdksyxdk7XlIb0A5D7MiPwEYGHEduppXstgEV+3RNaJARUkgsASF99ASTtREDeH9Z/LybJN6bj/i0i3GS6k
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR02MB3676.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199021)(2906002)(186003)(55016003)(83380400001)(38070700005)(122000001)(38100700002)(41300700001)(316002)(7696005)(71200400001)(5660300002)(86362001)(8936002)(8676002)(478600001)(33656002)(52536014)(66556008)(76116006)(66476007)(66446008)(64756008)(44832011)(6506007)(26005)(9686003)(6916009)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Qlo2OTIwK0l5eWVwVkdqdzJ6bkZESUFKS2FHTDR1TDN3NWd6bVY5M05VVUVo?=
 =?utf-8?B?NzRESnBzNHpvQXB6cDZkQTRqRXJGRlJnaXhLMlQycnI1akgrbkFCSFAzZEJG?=
 =?utf-8?B?WENPVnhXRE02cWVwakxIV2xqNHlCVUsrT0cvWWRBM0tOOVM1bFQ1Nlp5UUFl?=
 =?utf-8?B?T1JwYndwU1VYdThMWnJ3NWUzdUhvZGFDaFdKUFlKWGNhdnlLcE9YU1JmaW1B?=
 =?utf-8?B?Zk9sWWRoVEJhT2J2UXJMSHNqZUNTalJSUEIraUNjMTZTN3V5MnFkcUxBOTJj?=
 =?utf-8?B?VUZtT09ybjcyMUxBYm5jUXRuOVFrbWlNZlNmRGlQMjJHaHhESStocHB3VFRj?=
 =?utf-8?B?a1haTjhwSGEwZ3NhVWR3R1dOaWY5K21Ra2RFanFHNUYybHB1TGpYaEtmMjZF?=
 =?utf-8?B?UWM0bkZSeWRsM1JZMG9SU3hvSHNHcEo4OGZNeXBFaDlCOWRaV3lnL3BXT2JS?=
 =?utf-8?B?MkMyOEJqL0NTNmVEbDliTVUxR0xXZ0pFc3BIQXNKRnNDdFhmUmFkeUx5cmdr?=
 =?utf-8?B?a0pNNnhxcER2RGE1R3hFK0xOQ2VIUkpYSW05ditGUVhPSFZXTG1TTUx4MlUy?=
 =?utf-8?B?NXNZNWpzM3lGOEpESVZWWitTbGlVWjI1MkJjR04vVk5BTmFaVEVZRzdLRnpp?=
 =?utf-8?B?ejdNSDhiSGxGb0VrWTFXT0VJNlJ6cnR6MVNxTDlscVVhVGtMem1tSnQxZUVW?=
 =?utf-8?B?Nmdma3dMY2xXMDJoajZyUmVITzVZMWo0aVZYbmtBdHdxS2FPN0ZCbHFQbXM2?=
 =?utf-8?B?WHlSU1p1Z2FuaU9PcE8wUWZsd0YzNGxXYkRHZmF6VDZQeHE0azkwakpON0tj?=
 =?utf-8?B?MVhZV1VSNFA2Vnlta0REMjJ1NEdicW02dDJidmM0MEswZDJYWFliOFJRZVU4?=
 =?utf-8?B?L010cEJqaGM3OEJxVVU1OUJjSUw2M0w3ajJmV2p6Tk5XZ2FVNnVMdVJ5a0k1?=
 =?utf-8?B?Z3hEK2xRNDdOMGhDSmw2ajBxckNScmhBN0FldjlnOURPa0JDLzJ5NUlnU0Rs?=
 =?utf-8?B?a3RUQ2J4aEdXZUE4cHBoMHZNa0JMdVg3NUhBUXJvVCtHcnh4QUNwMUpLQm5y?=
 =?utf-8?B?M3N1OTZiVndKTWxzUHF4bStCeElobk1xOFM3Z21mV3lLZzFCTGdZT3pjYUlt?=
 =?utf-8?B?UVpHU25kS3VtbkNoaGV2TlBLL1Bqd2Mzai9kL1ltM0JOTHU5ODRvMkF2dTF2?=
 =?utf-8?B?d0NJVHFiYUFoWGhEeXRmZGhIdm95c0JVRkhjemJjMy9nSVFDcEtQNk1QSGFo?=
 =?utf-8?B?K1hjU3J3S0tqd1ZHUm50STZidXQ4Snl3VWdQckVYWU5BVzd6WVBpa0hjQzdB?=
 =?utf-8?B?RE43UlpYYkpUMWFxU3FCYUFrdlE4M2xNNnNyY1NLV2NqQWxWVUtUem9TTFdq?=
 =?utf-8?B?QmlHVlR2eDY4STlmNVdFdjA4UVY1NjRUcWVwaVdpV3VTSk00bE5ldXFiWDJ2?=
 =?utf-8?B?VUNLbGliMi9iSE5Td1VGSk96V0hucThsZ0F0SGIwSjU2NndkZVFRRXNRVDhL?=
 =?utf-8?B?RmRSTks2bHU4MWl6ZVBJcHJIQmdWN0JweEVXUkJTWUVVcVltZlUzTTJMamFx?=
 =?utf-8?B?ZksrVVJ4dU1MdXNkblZaK1grcjhackE4NnNkaFQ2VGlpQXpINWNZbllPc0l2?=
 =?utf-8?B?V0FEczF4Z2RmL0psUUJxSDZ0VG00R3ZpYzdKVWdHSGJsa3JJbk5sT2pacU1v?=
 =?utf-8?B?cUNnWFVCeDVJWEZOTUpXWFIrZlpJVjZHekRaVmxnRmpIbWlOMnUrakFRNGVX?=
 =?utf-8?B?dUs0eXVZOTZhd2xrNXpHWGdmNGZ1UjBZMUxCLzJFY1FjRloyQWpRSUlaWkwz?=
 =?utf-8?B?UURLZWpXSi9wSklJMG1IeGFtbFNyWFBxMkY0ZzVwUWt3NlgzQXVIZDlsNS9S?=
 =?utf-8?B?anJRNFk1cFNvWExjeEdIRGh1MGlFS29GcmxmaWhoR3drYnRYTmlVVWlCMjJv?=
 =?utf-8?B?TzFCQTYraWwwTDRPZDJTZjlUV2hnSHhsU01iZkh0TUdta0FYaEpFRkQzVmtq?=
 =?utf-8?B?M05hbGRHVjJXRlNpZUFCakFMZXpnMHF6YUtKWHhGdnRwMzRHUEE5cmR1alo5?=
 =?utf-8?B?MzQ0R0x4NStad1V2TWtmTnp6aUtaYUVJckRvM3B1bEhFL1VlbXZMUXlUcXpl?=
 =?utf-8?B?Q3hXcXZ0RldvaVdyWUd3UTRWYnRtZ040YTZuQTBTb1RGTWVCdFZKNXhzbnNx?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR02MB3676.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ca3710-914a-4fc8-03c8-08db62180f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 20:46:07.9269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SsQEeEMM/B1KXz8g6LRNuPNX3n7K+tZOfQRsrwRHgnFQ/BYnjDF4C0xSRpCkqf5q/CSxUu/ylY6Brw9GEmchJUmwLA+v/I6ky3myUZtQLyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB4730
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 20:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103073

VGhpcyBmaXhlcyB0aGUgY29tbWl0IDA0NmVlNGJiMzA2MTIxNGE3OTRkN2JlNmQzMjRhNzlkOTIw
NTNkZmEuDQpUaGUgY29ycmVjdCBESVNUUk9fRkVBVFVSRSBpcyBnb2JqZWN0LWludHJvc3BlY3Rp
b24tZGF0YS4NCg0KU2lnbmVkLW9mZi1ieTogUGV0ciBHb3R0aGFyZCA8cGV0ci5nb3R0aGFyZEBh
ZHZhbnRlY2guY3o+DQotLS0NCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkvZmlyZXdhbGxkL2Zp
cmV3YWxsZF8xLjIuMC5iYiAgICAgICAgICAgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcv
ZHluYW1pYy1sYXllcnMvbWV0YS1weXRob24vcmVjaXBlcy1jb25uZWN0aXZpdHkvZmlyZXdhbGxk
L2ZpcmV3YWxsZF8xLjIuMC5iYiBiL21ldGEtbmV0d29ya2luZy9keW5hbWljLWxheWVycy9tZXRh
LXB5dGhvbi9yZWNpcGVzLWNvbm5lY3Rpdml0eS9maXJld2FsbGQvZmlyZXdhbGxkXzEuMi4wLmJi
DQppbmRleCA4ZWZiZDM5Zjc0Li45MTBkODJmY2Q4IDEwMDY0NA0KLS0tIGEvbWV0YS1uZXR3b3Jr
aW5nL2R5bmFtaWMtbGF5ZXJzL21ldGEtcHl0aG9uL3JlY2lwZXMtY29ubmVjdGl2aXR5L2ZpcmV3
YWxsZC9maXJld2FsbGRfMS4yLjAuYmINCisrKyBiL21ldGEtbmV0d29ya2luZy9keW5hbWljLWxh
eWVycy9tZXRhLXB5dGhvbi9yZWNpcGVzLWNvbm5lY3Rpdml0eS9maXJld2FsbGQvZmlyZXdhbGxk
XzEuMi4wLmJiDQpAQCAtMTcsNyArMTcsNyBAQCBERVBFTkRTID0gImludGx0b29sLW5hdGl2ZSBn
bGliLTIuMC1uYXRpdmUgbmZ0YWJsZXMiDQogDQogaW5oZXJpdCBnZXR0ZXh0IGF1dG90b29scy1i
cm9rZW5zZXAgYmFzaC1jb21wbGV0aW9uIHBrZ2NvbmZpZyBweXRob24zbmF0aXZlIHB5dGhvbjMt
ZGlyIGdzZXR0aW5ncyBzeXN0ZW1kIHVwZGF0ZS1yYy5kIHB0ZXN0IGZlYXR1cmVzX2NoZWNrDQog
DQotUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gImdvYmplY3QtaW50cm9zcGVjdGlvbiINCitS
RVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAiZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEiDQog
DQogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVT
JywgJ3N5c3RlbWQnLCBkKX0iDQogUEFDS0FHRUNPTkZJR1tzeXN0ZW1kXSA9ICItLXdpdGgtc3lz
dGVtZC11bml0ZGlyPSR7c3lzdGVtZF9zeXN0ZW1fdW5pdGRpcn0sLS1kaXNhYmxlLXN5c3RlbWQi
DQotLSANCjIuMzQuMQ0KDQo=

