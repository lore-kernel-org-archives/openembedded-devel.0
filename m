Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web10.14625.1616976098645583725
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 17:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=etBKNcWZ;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104]) by mx-outbound42-72.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 00:01:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnQYVsCXWnQQUDnWTsqwKL2ccetnGNAnKUPORUxParuoTy7gpvqgzsgsdT7u6OEIWkqK3889fDyFnUPlh6sgOH6O4Gl8KPomBN9Z0IWPhEFgWQFQq3PZQ452pIN+6jS6TzY3tqjtVllxYjwZV8ELU1/UgzpQF2ByQrIgR2dqnFp5osBNQVhQnsykQH0kC9wEGTUQ+kUjViVbXykXbqRG0SHLcxXTcP//ehEbr9YYnFLEyZYkHK7Vs6KZvOfjmQA5G+zlky0wkdG1ctt/fM9C3SWhC/NIzUt0UTvc4szg5Xop4NO3d08ZF6sXy29ViCTiS6se6PbKbD9pPcIBOko/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZNunpE6kpIE+mlPCbXsX/0s+6CAGHZcNc/0p9mp+Ho=;
 b=U2hwd0Wl23nlROARBdodmmejq6v5a5AjVpIOfej7sVIkdZYoHUUFxvg4yzT6sMFgZ1xfNdAqqmIJGosAf1eikxmA6/3CzDlqpWoPPtuwrfnt9M3yBZ7u/3bAofGyWC9ptur3/VGF6R4askxBzuHkxN/CIcNcsXmZw+cIvgBOyPUIgdNB+m+SbyLbFzGwfMILiOYfbKOXsehNzmnQwCOdjylCD41xUHXr1MevZVFaSXqtgt4UwN75yz3P1HioJ9biiBugUwGjnV4livQgqNqDFpTiMwBYYpMupCQv6sfSyHogUqZRf2Sehdl4qnKu3CaywxqsGaPZo+43ai52sXzmsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZNunpE6kpIE+mlPCbXsX/0s+6CAGHZcNc/0p9mp+Ho=;
 b=etBKNcWZMI6vAYXk0aDTiX4LOKiayqTqEbaDptJ5OEJIdwIjdiXlm2mZJeWKY/6RJHhM87iSNELKmPdthmcKNGX9rYpS/adE1b6MPggnBoyZWQ6ocZWyuI8KBHhcnzUcGjYpOgJ+07ceK0N12boqLGJ3ne59tOY4bhUYTblKBWo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BY5PR10MB3890.namprd10.prod.outlook.com (2603:10b6:a03:1f5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 00:01:35 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 00:01:35 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH] python3-uvloop: new package
Date: Mon, 29 Mar 2021 10:00:56 +1000
Message-Id: <20210329000056.2567688-1-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYXPR01CA0079.ausprd01.prod.outlook.com
 (2603:10c6:0:2e::12) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYXPR01CA0079.ausprd01.prod.outlook.com (2603:10c6:0:2e::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 00:01:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e24787d0-9197-4355-189c-08d8f245d10b
X-MS-TrafficTypeDiagnostic: BY5PR10MB3890:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB3890465FD77933063413076B8F7E9@BY5PR10MB3890.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NS7RfjPS4PhXUMmshZ23ONQ3LloFxiBvG2fzSOFXA265rCXg0/oVFPwja68HAQHGtWyCbyCypDmL/G+FlJdBj57ICFLPw6eyMpCmZlyh6V6KDZlLXMiFBQ3OqeQqfvOICVEpkmFLE4+eL4e6lidlrAbb1hKolijFto+qDQto+JaHw7u+DvgJPH3idPAuUYWKR2es3MsBqkdaHQc3qlWgct3eTx8qTYNuq08YtOzdgSOO9Fm6eG+jvwsYer0FhlpwZznu+Mpj/kP79G1pLeeOw7THEo7BaJNVCSjyhnOwTYnP78XAbzw2T/4O2paRUvUr/oLju0z1k4y+M7iRwKBdtZjDKJvjpRwu3PTjHPezhj/l9Qt+aGFXKFtCrVPv3YLv85IyJCu64XsLkoePFvvdNbmCJiy9At1dF0AKje1PDhQNh3ecfp/VG27gEnMENdNOp2bZazX9FGXvRXCfjdVm3o3nW/8/Z99FYXrK2foq/Y82dA0w8WoX69aPzUnEwa2+Dp+X5UruZ60ssGls1uv4P5pFY7BPzQ7LjzkxStMUD8Sxy8e9kp4wdLbgpQ+UvqBUOMFYhx6ruko2AjxlmXkYZH0vngONFNmy1Yrb9eo7fwltJWNPj+RuPdwaKGOR0GJusl1JeVhY7YcNw7s48RSdV+VYtwuP5vx53i2EooPOv1LV3hpEQcfseEXsAXRqHYj+c0G4PG/whHMMxUJe1OdTC9YwgKhuMsQZoShUVmDDaFc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39840400004)(396003)(956004)(38100700001)(4326008)(2906002)(2616005)(6506007)(8676002)(6512007)(66476007)(6486002)(6916009)(478600001)(16526019)(107886003)(36756003)(26005)(66946007)(5660300002)(186003)(52116002)(8936002)(316002)(66556008)(6666004)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?peXrymY0PfwK4mVrAJldF/FTgUSp1+1G9ubRUiqWdXta8RHElcwhG3wPUoMO?=
 =?us-ascii?Q?Ugtz8kgKhnvED/S/L+Q7oO4Kc+gmCZhvYFfne7ncM+T+aad//mFJ+nUScy7T?=
 =?us-ascii?Q?4IrnjB6kqNYahTzfOX49iPk72INaZHTSm4ipYqgRQfUajYPXJIg15mcBHz8M?=
 =?us-ascii?Q?/yHZA3o9oSEuH/zcszV2MI5TvFiMtfzIiiTD9msGyiW7rdr4KLT82jy+qZ4r?=
 =?us-ascii?Q?tKTn5k5l+VoQ0CT6MgmYsXyxkXc/xZLfHhLOzKLDdfGcykT0q81e7rFbPBG0?=
 =?us-ascii?Q?GQn8zgf2j7jbOnxnEKBl5MMECvY6vVhZGy86CoVs4m0qHHXgf9hwG8kyrbgn?=
 =?us-ascii?Q?ZnpiQRJCfzl9shN0C4b3FxN8PAJLxbswI0+RJLorhJL1eF9vIR3FhmyjTdoq?=
 =?us-ascii?Q?Zs8MT8qUYEIC2mojfZL7gfbxgt3KwzyRBrc4LwrnSG4pUPEBqUP1vedJbxEX?=
 =?us-ascii?Q?TP0IWTsUuIxOxty/Xn/4Uh838FKwg1bbWWSukfFPUKiPaJnAy6b5Yw7pJd46?=
 =?us-ascii?Q?Ly0YB0asOkifY+0Y747V+/E+B34L0dSHBIE22mx8Ce1k8aPlchP2vqGmROYu?=
 =?us-ascii?Q?Dh+OsVOxyLHWZCNlNBHUIx0gDZwK6/7f4KlbZYIuMz8S5j5usWVENmUP7Y4s?=
 =?us-ascii?Q?DnXiGpGucijH06O5shVJQHfHa4rXOJNKIPTmb1kD5pRL6BrZDNMa1x0KJuFZ?=
 =?us-ascii?Q?WUf6FBhMFKCP7bDQox9jHV/f5VoCIocCM9felEnrO8FLmPc3zzz8xkzBIpVj?=
 =?us-ascii?Q?uXCJHnaAcQ4UTfZ5oheWh0Am65Z1gXCTJA6arRnCEpBvvpyGP3gVXhJ8gLbb?=
 =?us-ascii?Q?jwoy+l4ns7WQqvU8Bd4kYM3IhUSUu9IzDDceBgFDAcsWGpEfF94mD7Z1Yfla?=
 =?us-ascii?Q?II48cNUUibYmhNNHQTPXa1+vgInQ1O1N0E+ha9979Pzn1oo471ueGCcXPbOw?=
 =?us-ascii?Q?2qCO9NlS2YrOq5IN9bzZ+qTjSX401Xp9rYAFgate56922nf4i31No6Jmjiq0?=
 =?us-ascii?Q?I5/IY3493BqH6xYWEydcOV9qqJ54/+7qH5+3+1J46zZS4F6f3sq0NYTWAfT3?=
 =?us-ascii?Q?eibfUV9DZ2PyfI3BxuilxtRT2pbDEgM+JJJh4+6oF4+Ur96J5x5xrhQswAxc?=
 =?us-ascii?Q?YaKNScpr7ZBD/hGg9gBGSJKspgfGASMBHcxrBKBUYTgsBve0t1xuoedNTJEr?=
 =?us-ascii?Q?xddI6AGhJJWS01ZEGd9Qn9jPacWfk7/K5YjuIDXy8u1jA9rcPFEaJ3oQYG+1?=
 =?us-ascii?Q?CA31V0MQfH4RTNuTNGBrRLpa6PMwcx69HR5J84Ap50clXN4oWV2V6ILSpZjn?=
 =?us-ascii?Q?pXGLceKQ2YfSLdW+bSa8ngYk?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24787d0-9197-4355-189c-08d8f245d10b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 00:01:34.9304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvAajshWa5TQnHrOO0n8mYdQoNIV72iXJqGFbIPiERY5pRotRpeI36TE4UbYcTDs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3890
X-BESS-ID: 1616976096-110824-5437-18313-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.58.104
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231163 [from 
	cloudscan19-201.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND, MSGID_FROM_MTA_HEADER
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add a recipe for python3-uvloop: a fast implementation of asyncio
event loop on top of libuv
---
 .../python/python3-uvloop_0.15.2.bb           | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb b/meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb
new file mode 100644
index 000000000..4fa151e6a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Fast implementation of asyncio event loop on top of libuv"
+HOMEPAGE = "http://github.com/MagicStack/uvloop"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=3bd0b2e751776b370b2151ac508af939"
+
+inherit setuptools3
+inherit pypi
+
+SRCNAME = "uvloop"
+
+DEPENDS = "${PYTHON_PN}-cython-native"
+
+BBCLASSEXTEND = "native"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+do_compile_prepend() {
+    export LIBUV_CONFIGURE_HOST=${HOST_SYS}
+}
+
+do_install_prepend() {
+    export LIBUV_CONFIGURE_HOST=${HOST_SYS}
+}
+
+SRC_URI[sha256sum] = "2bb0624a8a70834e54dde8feed62ed63b50bad7a1265c40d6403a2ac447bce01"
-- 
2.25.1

