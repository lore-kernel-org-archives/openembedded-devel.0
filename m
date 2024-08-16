Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA18C531DC
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 10:17:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.124])
 by mx.groups.io with SMTP id smtpd.web11.144967.1723803460276523476
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Aug 2024 03:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=gUvAUtr+;
 spf=pass (domain: navimatix.de, ip: 52.101.70.124, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdGypmIyMU+oNcetepdCMoogDaEt3lEAR5tQ8UpVesM91vpv0g0jE3HbrHD4OML/Ee07RGiqzckVHZXpFD7xFKJoXqvCInTHOwliFCrhs4TA9R080iJPf5FaSMeaN/YGYs7A+eqctosWcZXT1KF9wdOEeUb7pml4bcCqFuV5kAhWLmuoRo9PpHd8ycF2jISRvxnlSvn6mNeHkysrUie5/g46SiDl5QlahBnTiMdTMB0tSHzI83KuaMFy8tmUtno28/2SZ6UToJt8mUxoHTMp/5fo0XzH6nYhAI2qm7J1zdL+I2LccrtvpFJrMRePWFj2MWo1ZZ9YFlpWCwwR2BHc5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCYQpgtvg+yiZEbwFIuwx6jGevpwdxZq2moa6PKj7yk=;
 b=S0elbI3VxPeFb5aZRTfNnSOI/InbZ/kRnRUZ4bWWJ1jDg8xEf2kxA1XzJ7BUVOxmcWFRWJYuVbK9yG9g9snuhiud+JwKl4AoAzmTKPo/ZE18e1ueqKuPjxscFJHY+dYuYOsvUf18pGAAb4jg9YRc3rDfPZzlVFIzfDueu5wIsbc4brl+pmbAqUSXyzy9SIUEh6RtnHOekbgHDS8O6XKUQ9v3bPEbS/Wo42SEPG3uQBtzWf11+16tSyEqtko5Yk7Q8PmPQpIziroFadNPBEpueTs9wjJLRZliFJHioufQr7Wp06ISGoV61kYHVmiL3wJIkkCmwxDxy9KiZV0//+Qy8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCYQpgtvg+yiZEbwFIuwx6jGevpwdxZq2moa6PKj7yk=;
 b=gUvAUtr+ffq1mGaOgJuZ+PV/Mld7p9b4zPxP0RQGSHO93MvGQxZmev1GgAcytggRL+Y6kj1ChF/kad43P2pdcQiPYN56+R/UeyvM3zqg8WxjWO5BWyVm72bx5b2jl1UF9R4/+gyAH/z6XgAoKm2n5LZYYtTjdy/FTdBydenxf9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by GVXPR01MB10671.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:157::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 10:17:36 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 10:17:36 +0000
Date: Fri, 16 Aug 2024 12:17:35 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 2/2] dnsmasq: set config dhcp6, broken-rtc by FEATURES
Message-ID: <b8186e721d67ecd786e60137dad30c112ad7e959.1723803452.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
References: <dd85bccd49b78f9ae2cc37edcc7a722484cad4f2.1723803452.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dd85bccd49b78f9ae2cc37edcc7a722484cad4f2.1723803452.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::10) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|GVXPR01MB10671:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf4fcf2-1f4e-4861-46e9-08dcbddca6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OP8rjesEMflC1vkSGkNqF/4/tOoU8yV/i0ANWiz6F11jZwg6NXGxv+Rdfmtr?=
 =?us-ascii?Q?L9NIY0Yzwas6RROJmAsnYrV9cDduOv9fHg838f29agFLdf3JikwrwMDf3VFN?=
 =?us-ascii?Q?XwpHdDtZPlTTcBrpxRKmZbL+C4RRzGEY6PyT5tXr4B59is8l0V1KoPh1o58x?=
 =?us-ascii?Q?txXTWPrdp75TTzqxGrHq8cDxHO20AdJ4cpGf50aSEsF4G/KeiyeQVebjIbVZ?=
 =?us-ascii?Q?UJOh/T5qLJpR/AaFOYmVW7GZs/lUPd+Dx9nMF212kCY95u6OdaAWCRk/WS8l?=
 =?us-ascii?Q?MGgNptkwRQWUdaD7PeSe0CA1jMXY7qSrueC2/h9LNINYJxU4j2A7JmObO/tc?=
 =?us-ascii?Q?O4XTdMyTvH7Wmo0P8ABSHxiC9TlCYObpJdkl+xKW5zxBp9CjVphWaOjgyAak?=
 =?us-ascii?Q?8NjGUOuJ4ryCjh13i0HooZY6Lxny7FDBFz0MMksgSqI5EVQuSxdInNhPdYHk?=
 =?us-ascii?Q?drO8V+kue/5oINRtg5Q+UCGBx2CEwon5whs/X4XAqYkQYmsa3njJztGTYGwh?=
 =?us-ascii?Q?+pu9sI8Y0prOdWQyk8aL+to0UJx1U7e171jroc4XKkOUT8pMQS5PCdOOG7ou?=
 =?us-ascii?Q?2junI4ogfKPlTSKd+gRv8VlBpjW/FTtSzNBH4CnSz0Vjk4nTPtOkLxDFFfp6?=
 =?us-ascii?Q?0jvelY90BgP46vQOPvDSXZUxzAKHwcawkUjW0fvVcqJ/UVUYdsnE3gTELLTB?=
 =?us-ascii?Q?rR322gqRlNZiDWny2TYDj7QfrJeiS0MEz90oXQGnQswK8U/PFNc0CfxjREeZ?=
 =?us-ascii?Q?CoBJROdKvXKOUhB1m7bTIcYOCoCpdXlW9cuPrE92RVwWQUG8Ur+BoFsz2tnf?=
 =?us-ascii?Q?MEb53yRB4IXJPvCiIyTIKB0joZa97MW/EOvkb/PdDkCSSyyQRvnryLuHA9OO?=
 =?us-ascii?Q?Ef5s+/F1APUAs9ohWCOh2iI6E0xKc1Ov1JNcaMavN94GHyaHRqBLl2z4FRcN?=
 =?us-ascii?Q?Ppz2j2Us4SokistUWaLXJ+pWcW9DyaT4lHKrpYqtpKhsMzm8oMOKFvT8wmMn?=
 =?us-ascii?Q?EcWIkMJeZoO0iqc/Pa7kcplkaFS534WhnRMMHSsAgoH0ExdVAT7GU20vzKyR?=
 =?us-ascii?Q?vMxWd4nPciEZz0p8dcm1UV9HadTI+GBPveLhdLj8TkYSghEhan0yKzSYyWFv?=
 =?us-ascii?Q?uHEnTNLEeJEuV6YjFemmlCsbWlseHfvrbQCoI3Gf3BAaMBcfwwIYcjdXyEn2?=
 =?us-ascii?Q?fuezkqFFKdtUijvzgkMWy3sVYFpOL7fJwCkX8WfOzqcFrzX+RN29uCd0Tz01?=
 =?us-ascii?Q?Y/4crPSwrRREB6oLMBmFLykjC0f1v0VYB48UhZiaS5bE3eKikW5MkLPKq7Wz?=
 =?us-ascii?Q?Fr5RlM4HJFVUD0MmYrF/eix0vu8oGbkRcM9PDC1FcCZuTA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?awM2GXEoF5HTlK5rXybrZmU43mkuZ+2uEE+eLYdIP98PxCqgBWRcb+cTrBh4?=
 =?us-ascii?Q?K3gKpfQ9OFJUp0HhrtOoheAz4uxnuBShz2ap/jVqzaj57pzsTYSJBodBUCzl?=
 =?us-ascii?Q?X46FiNaKqxY5yRl309KdTRRD5TaOv9iimeBsp0bGA1+NsXBw8dZxKCybHQB6?=
 =?us-ascii?Q?MXyjUlHGaOEUXhgYXZysfYnYX2nSsCP2k+Es2McAwlwAGotw+MoeYOZSWs8x?=
 =?us-ascii?Q?enyFu+zY8qPTC0hqyoVBX1jiybq/VFRIUeBC+dgVxMCM6XE0vNmtkNO+7rYG?=
 =?us-ascii?Q?BXXbwv8HXVmElJT+xP/LIQtlTfXhG/03lhTp4fvm2yxNlrr9niW5XAvQuif3?=
 =?us-ascii?Q?QIEsyGPGY9A+QfDzJGsrMt3yvasTOfid8RnbfVZCXrCLkuv0FnS9aM1xcqQQ?=
 =?us-ascii?Q?bdEgjCDz1pg3PnSKa+3PpCZaU7zIVD2SmAoSgRpXbV6jbb0XWdJQBz9RKnlQ?=
 =?us-ascii?Q?Il16IK/zsc6D3tD52tX06UHQT01u2Q25KYR4xPhoNkitz/xOs20ISmaAfXIG?=
 =?us-ascii?Q?5QmaseVSMRJ8+6akna1hCX1AtqY2sANQgPmTTqw2Pn7OMJDsGY4p/5r43PGX?=
 =?us-ascii?Q?7dyD/AjLXJei3uVGDH11fataSKLbKjuVJGkmWbIIXmsqTbHPleMv0ZTKX0aA?=
 =?us-ascii?Q?8dTQin5gMBfxfCKjBaNKZfVwXmJ8CWEsvc5eOQ91tXwffLasM8tQmrLd0paA?=
 =?us-ascii?Q?0A9tFWaoHRn8z/MIADIv3zuDUZWOKlXb4kb5ec4OaGSaFCN0imBQhavdeilM?=
 =?us-ascii?Q?2rYX57RZi9DlrQxQolyJfqhLo6jpQM4G2gZJuzP5wA3911nn2IyFS6Z1gema?=
 =?us-ascii?Q?KRBo+6gg1p8lBwBU/32oON7tsC4RzKB4c8wu2NCeCDfp8YXGpeAcILo5B7nt?=
 =?us-ascii?Q?kOtdVsTv55d6Jg9nZqL9fe67PvttZl9W1lSvyJzWORiumGLaT8a8QZxuGV9x?=
 =?us-ascii?Q?cr7FBDSM+7jE7YWmURoUjU9pwcvWWK09Hqz7XC6f2yxo6FQazsRcQ++57pdQ?=
 =?us-ascii?Q?aiQ0xg9qQv26xP9KK2bWvw+C615WJjrI7P43tK8ybg+Iw8xphBKpSiDNa5fP?=
 =?us-ascii?Q?25TnlbN3CC/PTcfCUmQdslYDTJSCs4MF5rHDIeTYvb6lW8yGhvUYaJ/Owt/b?=
 =?us-ascii?Q?oi/WkjlffOZ6/0wcOohgL6U8pZUxHNc7M95VYDnLWlu0oTgTeUQSnF//FEIp?=
 =?us-ascii?Q?1t8yaucollNalBznmKgIdpYnjkeMlnTxsclGgN6fk+eMOKNI3fBrWhHxDZ4I?=
 =?us-ascii?Q?BN+6Z14k3e4TB0d17KbGvI4TN989+OU0upYtGcqsc7DQN/cVGc2rMbpMv/kg?=
 =?us-ascii?Q?mjdkshG0MPCt8/OTTrlf2XhpUu6Hvb9MR0ZyB6Dk+MEIKaSIJGdPx30I10+K?=
 =?us-ascii?Q?wGWycffSJWBdCRwJ/DnbYo8DUvJ+byJiDRnyKWo9OmK/i/PtRdMQZ0LU2KxZ?=
 =?us-ascii?Q?SuZZoQFIdw4ZtG7U4jnlw9tHK2wfs2eVg49jSe7kFloytgEjGGCeV4sM7rg5?=
 =?us-ascii?Q?qMMerHLDZbbYvRYTlhWCheqj3U4LhpaZYL6SEuGkM+MmC2RAOGLzSGgEa9v3?=
 =?us-ascii?Q?nejdi3RXu8sKd9XeSmc0h7opkzPhibGl1nZpflAIFNHJsFfL6VGSa6zUgFlq?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf4fcf2-1f4e-4861-46e9-08dcbddca6ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 10:17:36.9156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSNt7WjfLKdBq0yFQkF9shCQi5q7jlC5zYQ906o1SFQ49HhytvpO2z3ogl/mKDBRqnhj7ckgz5QLmoK5XVlT9AHHYkbobwcsnHEb9UtnlAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB10671
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Aug 2024 10:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111836

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Some of the PACKAGECONFIG can be derived from the DISTRO_FEATURES and
MACHINE_FEATURES.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta=
-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index 30ed463ee..ba783d03f 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -24,8 +24,13 @@ INITSCRIPT_NAME =3D "dnsmasq"
 INITSCRIPT_PARAMS =3D "defaults"
=20
 # dnsmasq defaults
-PACKAGECONFIG ?=3D "auth dhcp dhcp6 dumpfile inotify ipset loop script tft=
p"
+PACKAGECONFIG ?=3D "\
+    auth dhcp dumpfile inotify ipset loop script tftp \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'dhcp6', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'rtc', '', 'broken-rtc', d)} =
\
+"
=20
+# see src/config.h
 PACKAGECONFIG[auth] =3D "-DHAVE_AUTH,-DNO_AUTH"
 PACKAGECONFIG[broken-rtc] =3D "-DHAVE_BROKEN_RTC,"
 PACKAGECONFIG[conntrack] =3D "-DHAVE_CONNTRACK,,libnetfilter-conntrack"
--=20
2.34.1


