Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1DDD58CCA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:55:36 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18979.1774356929049683110
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=WTnof0bp;
 spf=pass (domain: prevas.dk, ip: 40.107.162.17, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s596HxAS5xVwVOJAONNowGYJNqZjsZ8Qsguw/4gSFdhHUTk6vVss2M7iqD+H2zneq1lcNeBQDNdqsZavnEOthB7Bbc9tFvHoiMHlzOGJnbsH1BEkKOZAjKNIfn+QYipjoD5BrBi2kRFcxIrOVlVhVSa00zAda8S+uvZtZH3+7nbFdA/6BvpRSuSJGbhaZG1YT3BKQDfcBEyMmx70HL1hN4x5gMR57w/1cvZiyPC4ipd79jwBUkPXxN+wjWnU060k6YYkPqC143MlTh654JEjqz7gLghBmTOA4nwV3RQmDVGCqYdbXIXDus7+6ZrheQ1q2y0ptpxDnm4PDmFuGvMkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHgrlaKX65L+e2CgvnfjU+dPc7dJbRTFF2r1nyePdwM=;
 b=xX0HAYbP7nwrx7oJ/5YtmNualBWWa1ZWzWVmOdNxBQLfdSOMpQ0GP4/yXB8BUVsiP8gQzc2qpfJWfCJuICUom5qBPsBAd/T6TMlRIpqmZzPvckZIuGRnuEUQgrv9A+mUaRb1u2w9LhRQRo0OnYfitXXpiYaSK89CzYJiJK3oj3OsrWxwcuWhjb4h7btrRgzD1wbAKYQuFIKWIzX3I7tODRcIqYEueMscinCXe95fDstIxpZ4szI/ngoM2z7ErPMlfeutPUrIiqilDqwtdaVb8BkPFOnx6QomVEw42Y4PucWg4lDk6G8/XvmvFK940yGaS9mPeoAXqAGkKuC6SkIHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHgrlaKX65L+e2CgvnfjU+dPc7dJbRTFF2r1nyePdwM=;
 b=WTnof0bp/gMhRB/3yDOFK0AEllANYZbtRNW0g62K9l3AnJNqok5+8s9Dwh9PiKHSS1qAs5AhBIt2mZRHzgVihaB525QLYFEyrBHPVzE9zsQERfJN4r41Z4/NFAP1OdgTfU+7v/7GjgIYtHoN1knGRb1EmoHK0P3Z+Sc5XVW7klU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by VI1PR10MB8232.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:55:22 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:55:22 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-devel@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] pcp: use HOSTTOOLS_DIR variable instead of TMPDIR/hosttools
Date: Tue, 24 Mar 2026 13:55:18 +0100
Message-ID: <20260324125518.3316021-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0098.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::30) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|VI1PR10MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 9beb7f68-d6e7-4667-602e-08de89a49bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	tBKW8rDeHQYm1W3V5EM3st5HzAgZK6/D42V0tuCPBP8OWJRfO+ySQWFXxyCW6LTvsF8yc9mgbpergsooXjkV9bVncelZxfJwW0DtsXTUGvFE03I8M5+RiSmQpBxc26te4cKk7gUTWSwkczzrfD2e/+f3BHZYVfPd/7aBwPKkLCdsQCnzkzG1uLjreUEHBPVVGmuilv7lF+mz0OhYoJ28LlsX8hxHXFxCDELbfcEs3mPFMkenc970g28+KSTmF0gNa0q0rJ7fxu+GNp0Td5va4CWXOOEDvPtFpowIn+/Cecwld26cglYwfmq7d7Lb8+CWywIwHy/kbGpvrnVd+LSi3zaEKP6cYe1E3kpL9ktC6BNCiWCWJjFivsLJ8RdQCUQ+pQGBApr9+oZcmjkx8x7RJXctx/aGEm9iO35gdQD0yiE+I7sjYvhWYu3yBcvyck/m+2OzJvdrjC/BA1zAgFPl+oBVx2/UN8Hy0/OTPbGcxULR3K66XziE7tAQ5AfMWhwIeXCTMpYwlewAStPvsi5wbv0E+/EaJvfSyT+NbQ+KwR1utzmL4s+/PgHBeShZ3GJeeTlYZrKODO57eKVjKOjbTIYFt0VKxm3VuWkpTo3Y7yt8tGNxz2smKFuwFK5j07MVufs6EFgSAa4p6kWDz73A9rAITKC+gRJIHl9BaRpgpiQA5x0zLkzwn4gHndOyvBihmDdavUrz2YRZea7IJmt7e+5Xy0n/36EFtJR+LG/Izs53Wj0IpQNKk059jPqWY6A+IXEp/srYWN5xhTIM1AwMbn8wmL19Y56+D+HPljT2XOE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JcRSUXqvqvsnpdJzjYqe574y6UtXguAEZ9YK6Y1CSBRK3PKpV6y9ti/ARqMJ?=
 =?us-ascii?Q?mVx3u3BkPRkXCYl4RRthatTl7IYn0WV4vQ3uuzJdWyl0uZZ0zcZtrofNgdaS?=
 =?us-ascii?Q?lvZh5VZI8Ves80h9LNjbM2kOI9o9YUYJSNAZNyRSwCrsZOdk/g47GjPA3o+l?=
 =?us-ascii?Q?Mb1gdcCWygtrWZvsCcQmKTdmDE3Zlo7fQcxmFZMeaht/aPxCR1Z4zk1AV1Ui?=
 =?us-ascii?Q?qNHcflzu4KWY6dpnbseimEI7CughO/r1Sr0fPbtPsdB3mLTz+u0mMnRxcoW7?=
 =?us-ascii?Q?cx7cQP+ouTASvHNtdOLv2CCL3WkVgRb1HdonfyqZR6beJ4KiK8er62gkXBC1?=
 =?us-ascii?Q?6KzBrNc4Gh5H0UAnt3JUNbKo1prjQXHur30xULKQYodKzqznClv/1udhglz7?=
 =?us-ascii?Q?trl3KkQ2lhcUs8DMQM7VppJLr5VpAI5Q234bvzkrP5q7Mnj94o1zpy9nD824?=
 =?us-ascii?Q?OMs/SVQN1dcu+2MQi0HxrwOODsT3jOEIePA5juDb/GmtMACT39azBijPe6Al?=
 =?us-ascii?Q?mOee20jQYU3uLxtsbVWFfo7iFidx4+xOjKyL3/ueFsfsRt9aSvvop1hnUmEj?=
 =?us-ascii?Q?aDgUrsF9Rl9gUn6W6OR3TWxvlRnXhEFq6+ZvXi1L1sbvloticdDxGYCwvwnP?=
 =?us-ascii?Q?UvXsHBiUb/9MDo/MHH1xHwmmfsUYvBs2eEfNLDk9VdCCX9yOABcTTAgW+aFA?=
 =?us-ascii?Q?EFUAcHru1Gb2UuQnysZ2GUCxYW2qR8I4uHkIqEwczJjzcPzplV+q++TAEFb6?=
 =?us-ascii?Q?L0eyRfNJ7P9j6KzgOIBQ/On+1TR1qaCpx708YAXox6Z0/GHY34oU1LWsN418?=
 =?us-ascii?Q?MNk28HMbTZez5h7HEB4LvcQjADabYFg3MZQO/LHLikkWq2toW//cc6eOBUz4?=
 =?us-ascii?Q?VPRmORgtp0uh+M9Rz+mbJxfkgU4xbCOgKMkONEUGQ6w1oXsHIhBbdeiS8x3h?=
 =?us-ascii?Q?NmIddPucNCud9pn65GJ+yKU+MZ9i3+w1yO2njGltLunaUOKmz5W+uA04tQak?=
 =?us-ascii?Q?gs0Jy3jnmde7zDVWCvKRMtOKf1r/zbvA3uZgK93Yv6bAQbp4dUkQz9YmZVJX?=
 =?us-ascii?Q?mOwX0xX10tZs+HQDqayldsHqpUX0JJfgNat81OGL++b1edzON+tciQwlA+wv?=
 =?us-ascii?Q?EqcpTmPno8I+2v+gmLAXCNlsR7cmGBWyrQZHUSIZ855wb43QT1vHQBlokRWc?=
 =?us-ascii?Q?DnDch+qJ2WtaV0aFbKld+HP7mMbbMfVr9SKoyEhSgKG6+xGe2IVz0d8WLZ6k?=
 =?us-ascii?Q?LEXOInvZ6PEk4Wf5sAZoOMoYVYbLMpUCHavD/n2ZMuwA4aBnPZqbqYRi5llC?=
 =?us-ascii?Q?GFtmHRQs/22pzBsxbE78zomeTaG8rQML0cvK8X/Ivvq8dzI9AgQOe85gfM2o?=
 =?us-ascii?Q?ESOUib34owOeNX1m1ceGPIROSrQXeWL2oTGtd8ojjWu4Sl8OmSr+2lnsakkr?=
 =?us-ascii?Q?77GpeE1BKK0mHxS0gXwjQyYmCeiOJG7FmHqvowmi5Xj9NDvWrdX68RY/Apax?=
 =?us-ascii?Q?Hkwk7asDIQ8219U7wvNTnlmn0LzMY1JfR1sSUYrONzYeEVCtS8WNXK1h9v4x?=
 =?us-ascii?Q?8JgbqxxGD97brlKNhsFKGbd6341KOdJXfrXbjDaH0luTSSpTNf9eRBJkkJQH?=
 =?us-ascii?Q?S306GO3tB4RfzpUzX/WVkPnFKZRfpThNlYgcuwnSNSPou+KH8nqpvRr7XF8K?=
 =?us-ascii?Q?QW/q3haVB/+ofu07u3a+uDn3vcmmkE7KH/erdfH+IBQSMplSv9slcwXTVWnf?=
 =?us-ascii?Q?kv4jIgCHUZPMMQ3oUqCsyeQmF5RejBk=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 9beb7f68-d6e7-4667-602e-08de89a49bed
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:55:22.0168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CfonW+j9VswD5mO679GgNmGzQwLPLZLdAB1L4RlvAZEsPg59BV5r+hr+AZC9K+jmIvQWV8ai0xh6cd4gHspQi9bA2Sqwl3BbgmabXjnds4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8232
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125558

From: Rasmus Villemoes <ravi@prevas.dk>

This is a bit cleaner, and means a few less places that would need
updating in case the TMPDIR bitbake variable gets renamed at some
point in the future:

https://lore.kernel.org/openembedded-core/6aba349f497903351a0cd8d06708e9411=
9bd5d05.camel@pbarker.dev/
Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb | 6 +++---
 meta-oe/recipes-support/pcp/pcp_6.3.8.bb        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb b/meta-oe/reci=
pes-support/pcp/pcp-native_6.3.8.bb
index e90efea9cb..c4064d8330 100644
--- a/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
+++ b/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
@@ -10,8 +10,8 @@ export PCP_BIN_DIR =3D "${D}/usr/bin"
 B =3D "${S}"
=20
 do_configure:prepend() {
-    export SED=3D${TMPDIR}/hosttools/sed
-    export AR=3D${TMPDIR}/hosttools/ar
+    export SED=3D${HOSTTOOLS_DIR}/sed
+    export AR=3D${HOSTTOOLS_DIR}/ar
 #    export PYTHON=3Dpython3
    =20
     rm -rf ${S}/include/pcp/configsz.h
@@ -25,7 +25,7 @@ do_compile:prepend() {
            -e "s,#undef PM_SIZEOF_TIME_T,,g" \
            ${S}/src/include/pcp/config.h.in
=20
-    export AR=3D${TMPDIR}/hosttools/ar
+    export AR=3D${HOSTTOOLS_DIR}/ar
 #    export PYTHON=3Dpython3
 }
=20
diff --git a/meta-oe/recipes-support/pcp/pcp_6.3.8.bb b/meta-oe/recipes-sup=
port/pcp/pcp_6.3.8.bb
index 65efac06be..bf1d728b7c 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.3.8.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.3.8.bb
@@ -61,7 +61,7 @@ do_configure:prepend () {
     cp ${UNPACKDIR}/config.linux ${B}
     rm -rf ${S}/include/pcp/configsz.h
     rm -rf ${S}/include/pcp/platformsz.h
-    export SED=3D${TMPDIR}/hosttools/sed
+    export SED=3D${HOSTTOOLS_DIR}/sed
     export PYTHON=3Dpython3
 }
=20
--=20
2.53.0


