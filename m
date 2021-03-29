Received: from outbound-ip24b.ess.barracuda.com (outbound-ip24b.ess.barracuda.com [209.222.82.221])
 by mx.groups.io with SMTP id smtpd.web09.15630.1616980951090305266
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 18:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=W3/MOlX9;
 spf=pass (domain: digi.com, ip: 209.222.82.221, mailfrom: ben.gampe@digi.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104]) by mx-outbound42-231.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 01:22:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsN2LGfINI3D/6qNAScthBuwVSyYVXGa8vzCilxXCnj67JfNRQGek60kD4itSbUaeaeOo6ZMaJnRbMwCoa0qvsfwYK2WM6bbdYdYGdPNOkXVr2C61BN3Ek7QkX+9k9huSOW0MynXqjNU3rykDpjtmtTDMzhiSFmOOQPUpx/QgTR3JfZQWFIhX+hkbHYzx87I29P4yNKuhIVVRMMqebyAP5n7HKS0nxBO/w3pEvjUcWJHY2cybat9lm+uhFlkM2yRP/9t9qEUzuTrQ+Hk/3k/V/B90H+P6nRgR6eioD9l3XK4EaUV16ogvGp0HIPZVp7xNv1OODHxSVl3Ea1u3T9hmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUvmm8VPzliSYJpedLMM6Lv4Y+i8yhDFaKD1HC7AJek=;
 b=annmphWCO2JvcDJjHsMQUhBePiy9I0CC0LXvpzbxjdC6DOuUlfkblO6H77FgmImeDK5EF9BwGOzcvbz3p8aG6APAskRAby0g4qnMrOg4dCojyr3Gex1xNSV27Mx9mupOURVLYhJQdxYzER4jWKoduLtR3lx966fSNKHFGHKa4FhyNEKZbpmY9nFey6PVefT5ETSpDgU4WR5fhTQS1BN+Ww3JXX+a3Es0wfzdUlm7Trx/hP/HrAPLqS9mAggqpDzq6sX7Fk3gVR1gzpH51RR/RN0+4wc5uPbW11qPzNHZPhEUShoPTJ1gJOncalyjq2DALX1JlA/Fdsu0ILt1ca7EiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUvmm8VPzliSYJpedLMM6Lv4Y+i8yhDFaKD1HC7AJek=;
 b=W3/MOlX95n7h7n4lW7VOfN721BmuBVOy/cUfwDsKNTZQj70vMf57vSKjgFht8lYkSX+50BpTW1gQFgtzJdeTAjf/LWSUZ2CRvL4VTGUuXEgs05PYW6iZBmEVZOaQaRpqJRSPiP4v/BpPUsDwcMnPhOec1vhRLsYRExtVI++515k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB3703.namprd10.prod.outlook.com (2603:10b6:a03:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 01:22:28 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:22:28 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v2 3/5] python3-uvloop: new package
Date: Mon, 29 Mar 2021 11:21:41 +1000
Message-Id: <20210329012143.2580564-3-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329012143.2580564-1-bgampe@digi.com>
References: <20210329012143.2580564-1-bgampe@digi.com>
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYBPR01CA0170.ausprd01.prod.outlook.com
 (2603:10c6:10:52::14) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYBPR01CA0170.ausprd01.prod.outlook.com (2603:10c6:10:52::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 01:22:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9ecb097-fdfc-45e3-8a1d-08d8f2511dc9
X-MS-TrafficTypeDiagnostic: BYAPR10MB3703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB370311946658AE15EA1D4B868F7E9@BYAPR10MB3703.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zh/yXd9FVBirDtQEpNcYZeJS4JNHPjnLSoMfGoO8xVlx4x10uh+0pyVrAVfSeGH9ZTzZDqgKyzLL3o2YuhOghEYLxDLEvaV3RWlg0f7NH05awjqva27XR1q8Rq6u5nvQcVcjVcDuEq3N6pQIwMuvby+D9EQUXhpZ7pZCiRK+m/qCph4W3ETkmyIVCyS13ob1XUHx6JFHr10m8qtZnBtx4pji5CASBs50CsuCCAUFK0q2Ca8CQOKMKbnYD/5n41OvuMgQsvHz5d/uEqFfVr4D7J2DYxI2EwtVJGY8rYavIQwcUSwHO2VMGbVVqatXFRK96h5j4PD9hxzqw+RsHmQWk21RlUnxTu+s5f+Jxx8OBi1OvlpKoSCWP1FVa93uVLK4MhUUJmjsJWkvJKmyrXBxZFlGR/g7iWiiprVNTLVkwzu7LMGXQxPM5qnGkRnDTasgayNyv9BaBtxNkR+YtLw0gD8e+ZW1p9q+KVJNM2O8Ofl6aMCiTSSkXNJx9iQM0QTijtWlJ9VN9UogsNH3IWx9hF0XpGWaJiGJJK7UusYYhfewZHQmpSWcgyuPuaHQf2t0F0julOvs9NDrqRxJx1SfhzVzwGGXke3HL1g8hsRdCH8U6V8t2R2E60MsAEBd/mpejJkDWt43PjOpyFoaulwNgMqmxpfJiT2J0Q7K6hHlj+TSWWW1Msz7t0r5L1d13ewEW1pTmKEM4HWW0+q6eywkwrlvlPZkkoYIlAEumt5hWOM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39840400004)(136003)(6506007)(1076003)(8936002)(956004)(2616005)(38100700001)(5660300002)(6666004)(66556008)(26005)(6512007)(66946007)(316002)(186003)(36756003)(66476007)(2906002)(16526019)(107886003)(52116002)(6916009)(6486002)(8676002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ufHDcyDb95WaNkbcv91JcVPvbUMq7dMT9+GA7MPcT3L/RWr5WjQ9whUIR+mg?=
 =?us-ascii?Q?kUVQO+NowxZoSw1ORjtHs7NrJFhwSZscKOyjmiMO7k0JRo+ctTrba0OiZJy1?=
 =?us-ascii?Q?DWY3QOAGAG0HjmALcCUOGxTYTbPrCVzUOpMojEIe1gO/4q/fqpTZBQKZB3BY?=
 =?us-ascii?Q?dki94MWSDKmMr6OwWfeMqX83pvvkX6GnkxbaqgqiLWrRg3IiEvVW2rxTusqV?=
 =?us-ascii?Q?WARk+6oLDC1065JOzof3lJAly0i9sXla/oTMi8jZaqwHq6DVkiYMZN7qD0/Z?=
 =?us-ascii?Q?P1SqQXe32cQFjg2v21dS09gq11jxhLnJVTkYFhVPOM1LqeOgZA17ZCrdk3Fp?=
 =?us-ascii?Q?n7xxN9lsGb8hQEjZgkUzDHS2jciAjgPOe6Gu3coWwrOb7IZ8JwimW7ffIiKC?=
 =?us-ascii?Q?B3ROswP6GZVB3SO9WtxR+kRZ9Fa9eOTcSd4BH085R0KmcLjM//MHesYHfvvI?=
 =?us-ascii?Q?clM7YGp9CtyUlNT711Kr8HcYo3qJxioRtYQ7JjdyvAdNosYnDgGbL9SwY1tG?=
 =?us-ascii?Q?D9oMLKb46pnR7mflHHmbk3u7yyNIu/ZcJedkMN+UUv6CkTp/CZ6M6D2OA6x/?=
 =?us-ascii?Q?08xItZyTPEwO4s0BIGd4U2BgoU94ZTgDDSkvX6wYNduSYuf2gHkt+v+qM/9n?=
 =?us-ascii?Q?dnzqfbOukuMicUL0UUwm+a0rQa+aqjJlm/mAlZIPL8A8FfUqud6p2QN1wGxo?=
 =?us-ascii?Q?906aik5fLHteK9VsAMEEmv9OjPmrCD9PJKwb7Xa4mCXHr9rA7pHZkbdPQIXe?=
 =?us-ascii?Q?32Lthjtl2Ic7WJGQztQcWMJFRaInNdPKaeHZNBSKD50LLvU7UZQATg2BRn2Y?=
 =?us-ascii?Q?dbTM4H/XHjbdXywB/aCIbkYmalCokQEV8uogtXG90LWtzwL/8pSicHUPIpq9?=
 =?us-ascii?Q?nqus3bwZYMdInoE+jQCInXQPa9XkFziiIiuGWgnx0rl+kuudg6nSFjNcdCxJ?=
 =?us-ascii?Q?OVvVzwJOlxa2LatAMkKfND9WLh0hlOPi+GRGYsKN2KTD0hBc3rfgxEUYNToK?=
 =?us-ascii?Q?bybzHELBns0roqlVlKW9lBtiRAcak5AezKiJHV8efWhY3NvLBCyKVTN8LAFp?=
 =?us-ascii?Q?oALAoL+FCBeAZaxdgKLaCYzsXv+yATAWFPlHSlrNRYysH6fncguaIDNYOjFX?=
 =?us-ascii?Q?tFyrG9RsyDxfItBeedrFdFIwd2Mizu2dHOLtSdc0DW8/xWJdD1HdL9xF0R5L?=
 =?us-ascii?Q?P1hgBlb4zLlfZw7mz5vQGB3h/ppdnkdW7SBPNhYd1v1T31smqPKkr/KUdJ2V?=
 =?us-ascii?Q?Gj7w9xZca6e9wHCQN/iY2r60+8pI6YsZ6N0Nhbisvbd/U8BxI0vj2YTs1zAU?=
 =?us-ascii?Q?AzqIsbPMKUwb66yCys2NCppJ?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ecb097-fdfc-45e3-8a1d-08d8f2511dc9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:22:28.0184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjWg5c9yLVjk6khRHWWcVLXmO/2rYi4vKctoC0WU+ANvzhX+/6p+o+4lhJMbUxi1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3703
X-BESS-ID: 1616980948-110983-5606-23484-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.104
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231164 [from 
	cloudscan8-113.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add a recipe for python3-uvloop: a fast implementation of asyncio
event loop on top of libuv

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-uvloop_0.15.2.bb           | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 30e90dcd7..5440bf571 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -427,6 +427,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-unidiff \
     python3-uritemplate \
     python3-urllib3 \
+    python3-uvloop \
     python3-vcversioner \
     python3-versiontools \
     python3-visitor \
diff --git a/meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb b/meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb
new file mode 100644
index 000000000..5a59a75eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Fast implementation of asyncio event loop on top of libuv"
+HOMEPAGE = "http://github.com/MagicStack/uvloop";
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

