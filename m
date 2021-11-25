Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D6FC433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 02:45:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.7492.1637808304496566371
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kiDJDS4n;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6963faa46c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AP2fh1I009587
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=t+Locyl2TA5MJvVu8PRIoJFFZo/REuv3SM5LjYc2mt0=;
 b=kiDJDS4nsX1XVjNS71wPAZiuDt+I7dkZJZlOHV7r7PrSWoXFS9l7WIg87R2DPdM1h3/V
 zcfAXbMSuFlQOSyrWpS8E5tXtV5HJIn3f4btCLA7bLBcx1j8RsxW/1+IEYaI52KY4Q7g
 hqOgzG0KycZSnzyJO3w4OvO1ATDfS9IhhPJ0nyjKciH6txMPB/y1TLkangX+WAbetwCC
 6IGyi7AweNWurzmtRAeIWglQqoWqgT3Pva6I2WkZAozy5eBhRgi4qsJ0i/Gu27h1BjDz
 YLGnqaAUHO1pFEoaw1RkatsGDiPSEPttb1T9EwybWhL0rM19vE+QkqTzL0ZTg9uzpwcT bg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chce58yxf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VD8ByV97UXvx5VT/QaKsOftYuP7/BxC1xAIH75YTSbqLNqCqCm/CCtisX4cLVc/jJCJGXuovEV88ZpR0SWQsgCMSviLXlaXWpky32OKA4pxXy/W09Xz+lu4j16nL111wP9lfU751ERp+h+sznyQV+kpkU/8DhjOh4VzP2/7F8+AiPrHY+DyJaIItu4KQquenLMwC3jnbL4HTx5Oi7gROspET0a5NiALKrFxqIV55ziy3IDusbKF3eO3Oi41fwSj7GpDTGS+u8ZoAfuGRlJUExIDlGArdeSeFaSiXpJWeFd0sZ6Zt3n9XbWlXPGYWsYMebg75ZhuCc/gJKwQGlMXpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+Locyl2TA5MJvVu8PRIoJFFZo/REuv3SM5LjYc2mt0=;
 b=iCuvrQ8p64iYbV6d8B9rD9w2mGPEPNw7eZab84hQ3gavh7LY+wfqLW8tOBV4X8SD/F/ewmC20gVhP7OtoUPvHII0/r50J9d4b82UgDvEPIas1CFL1v63YRT86S4OUdhb32atG6MYzzBQDLXSGZiWM1QSxLbwhjnD+FhGYRgQUWSaL4mub3R0kFADp0b3qJUWCfFYPoKq3zyzSgLcs5rGFVwXJMO6i42NcPiDpzle2Sm743T6uS9yDGLic4YBa+u7pWAETPn21l9Gi4LzABTy6ZA3j47/ZOBtp4WJ/53CiiuH9bTJYIbCyuOsTzppBGOss+opJo45YTJRnISwQsQqlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 25 Nov
 2021 02:45:02 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Thu, 25 Nov 2021
 02:45:02 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/7] libtdb: fix pyext_PATTERN for cross
 compilation
Date: Thu, 25 Nov 2021 10:44:45 +0800
Message-Id: <20211125024450.143364-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125024450.143364-1-yi.zhao@windriver.com>
References: <20211125024450.143364-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 02:45:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9c44877-a9a2-4151-7465-08d9afbd9409
X-MS-TrafficTypeDiagnostic: CO1PR11MB4803:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48037419AF6C81FD6960B66BF9629@CO1PR11MB4803.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g1i1XbYtnwUCuSOI03MN8IlpCl5LyrM7uUf9srNp/2vn/2Fx4k9xUIqYjJg3NpCXtQ1A2BaZVtpQGpQYi0bZkL0G5vVD8D2DVGEUxqBDjAsgtuGS6bRlVZ6Y2QTgCATCSHA04j/buHMXC251MSqlZtzUyGWlmLwpZFp3CahC8C0Q9OeOg4WyQ6rhOUBZqWBFfHEghnQZFEr7HaLQwwyfImnJQ1689eZ+HEmr17DfeZvSxAKIyO6OUn43pqwX3nLqLwpukZpFJdn+U2HEXY+ZbkemAmNFBjGmzvqmuwd6CDYhq24bLQQIinyhioeNL33beuLEA6ZWhzj/vgDSyWPg7/VJ/DSOpFT0v4ugdE7oraD79LyE4t8KhT43aJMdwFNicMvOsYQyDRp1qAv0eg+6ioovDPAhhh6KAcrPp4lsr1AbNkl6uNeqIegCbiUPUY8b+q6nuv8D+8STyYWPTTLG/nMgDlf9HmzILzKAh16TZ5vrb5QAklwbxRXJoOsThPtjQA5QeBWFeQ8rjYDIF65eyQNixJv2DRiFpoBYLYAqlCjIvaG+DhbHT6nw3tY9qYsdlddMUY74pJ9jh8V4CJjno9AtMyWEsuE6QmHthjam+MMYnxXRgdRrALwcx4QH1/prWJ8R+DZQFdlvOEzEU3Lcd4DLnTFytzQIH5skZGQMa6ac5uVR0UrmPLcqdDgsBGIY3VIr3zerLo+Mrr7ixgJpbc+zzMqOb8P9zgn6VzMRdz5Drf71knD38wgvTl9g/RGerY5dGKXc7VBd4peM7q1um4YSuSIDqKUaa7vVIpqOTmI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(186003)(6916009)(52116002)(26005)(6512007)(2906002)(5660300002)(6666004)(2616005)(956004)(6506007)(508600001)(66946007)(36756003)(1076003)(66556008)(8676002)(86362001)(38350700002)(38100700002)(66476007)(316002)(6486002)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dyXpIFnhxGUZ4zaUyRS5/+Y+6GPbqPcSCsxcA0wSypjjFGFBHSGLkyqdbFfx?=
 =?us-ascii?Q?/JM/1yoWtfmyHjKPyk+oqLNOzxTABN4W3g7v9mLCNU9R3NIMzl5dRPhfRVKt?=
 =?us-ascii?Q?+RN4ll7iVFKHIbtws4AiPlWL8A8IlwtRNaAQM6xsbg3bEC6/4JLmavx5HHMK?=
 =?us-ascii?Q?JrELtMl3/ci7esoOGfx5Q+2MbO+LQ1u5IhznuTNyEtocLhg5BlZygXYaKqzA?=
 =?us-ascii?Q?I0nSSwkgfWn8vJZ8gGAa/3NfnEsqWagIORjrgwy0vsG9QXEWX2Xc4zilnJCA?=
 =?us-ascii?Q?LMCQz4r5nOv1Kl7ptmeO7b5xFGe/+ut7jP9gjdDR67bBJxgqV7qw27CMo0mR?=
 =?us-ascii?Q?5EPyAEUOT37KT6auZpZ8rJAP024BrV8LD2XEKTKG/DEqe4vRO6oz/r0/XtPt?=
 =?us-ascii?Q?D+ie1c1wZhROfJARM/eIDwAERN2ellM4OEfGG4W3PSUJbbVk3otQ5wxv1++d?=
 =?us-ascii?Q?Rlz+sZGJLFAT6vUadO2N52l9pS14Crvy9ZzhXauNyeVWYiN7SgZwQZSPeE2s?=
 =?us-ascii?Q?bSMB3mlQxzBGNX6WNgyF7F7eOxfPESSixXbFiY0aU+fdnHQV5b+Ke4qMR2lm?=
 =?us-ascii?Q?ISYiQ8VyAyhdJaSyznOWkM2pvZ4CWeIAuUnVziDfgh+qpFwfLUt5hZ9SsMKD?=
 =?us-ascii?Q?bce9GRfbj4R50e3YzfHhAK32P3G21Fnj2AT8pOyCAXZJ0nN9+ESpRkY0qQo5?=
 =?us-ascii?Q?ISChDIiFXt1tv18/iqlIxmHaL6xBCkmGJSZH2RCg9gAAEsuS4Y46GNSz7m2H?=
 =?us-ascii?Q?PqU3c9CBeVhBksnVJJ1bNiFhmebyS9yycl8nFuH12IcwFzoDKu9TKyeNBg1V?=
 =?us-ascii?Q?MqZclkCOcJRFY9h/GLANb7wuR4wJ+OSEVcckFnrzLxqIkoR987QIXaPGe8T/?=
 =?us-ascii?Q?NONbbawD/FyxCa4aNqytAijHw6PJOw4MMIALmTzNvuOt8S7gYQpGPNtnjEay?=
 =?us-ascii?Q?4/WULnwU3G/oO/jNzuBIt85RFM04hjVB1Qvl0hFft+PwaneqzqCZlR/c0kjc?=
 =?us-ascii?Q?Z2J/LY0VGDWw1jMFOYMwz7f+GXLlrooh1jFHTXwFcvVI6AZJvaeSf8caKU5v?=
 =?us-ascii?Q?UDuE/hBhz5NYc1+AE8A+2ciySjC1DXkNEPDxTVIGJqlyj5imPcpGfGkYN5MR?=
 =?us-ascii?Q?vzlBGf2Kny8UngBdX4u1Y3QDqTVGhpRqAA1rBqhpCTmLcEKxppU+kHXOuJxi?=
 =?us-ascii?Q?1cR6sDSev099trCl0JAGhWn4Fz8MQtUf/H4t48n8TrnjUf+ikyYZ7zXpJHgO?=
 =?us-ascii?Q?2Evq4w2ZAAl85j5DCJF6miHVY7Y5e7A6ZrC/VAA6S2blsDHkL1eJfXZHG0I6?=
 =?us-ascii?Q?s7Yb2GGiuG4AhpTpc3mmUcyZuBv7ItcaqobYDLl48o/kb5c+YZDpl5rR+8Mw?=
 =?us-ascii?Q?FNzasENIOJqc0EzR9MB3goUABUiCiMQ8NEcqDZIAFLxq1X4OSIjli+gX9kDJ?=
 =?us-ascii?Q?ZD3OeCqh7G++RVaQviLviI1vsP40e6w5vlFA7UrMkOFkD3EHblqkY7FOaIzo?=
 =?us-ascii?Q?2siSIcWB9VIwFEzMRZcYxmcm6V731+QhLvImEwpsVkz/OVypXX+9wZTRo64U?=
 =?us-ascii?Q?RcYR1qq3GTgx784yRd2KfiUWqk1RKFzLaN0Qlcd+QJ1jz5AZir5UuoZikaJg?=
 =?us-ascii?Q?hXctXS+xB31y/MRrWBjIJjQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f9c44877-a9a2-4151-7465-08d9afbd9409
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 02:45:01.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uiVxgsHg7BunxqgDVKm85/EorxrJxyGvRoRGeY2GDtJ4YY03gsvNSfwsTzYdzqAz4ba0smQgB6FgK13TZAW5AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
X-Proofpoint-GUID: wpNpwC6yhTODY8mQ_nHbzzAZy_CLdDUc
X-Proofpoint-ORIG-GUID: wpNpwC6yhTODY8mQ_nHbzzAZy_CLdDUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Nov 2021 02:45:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94117

The pyext_PATTERN will add native arch as suffix when cross compiling.
For example, on qemuarm64, it is expanded to:
pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
which will result in the incorrect library name.

root@qemuarm64:~# find /usr/lib/python3.10/ -name tdb\*
/usr/lib/python3.10/site-packages/tdb.so
/usr/lib/python3.10/site-packages/tdb.cpython-310-x86_64-linux-gnu.so

Set pyext_PATTERN to '%s.so' to remove the suffix.
After the patch:
root@qemuarm64:~# find /usr/lib/python3.10/ -name tdb\*
/usr/lib/python3.10/site-packages/tdb.so

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-pyext_PATTERN-for-cross-compilation.patch | 42 +++++++++++++++++++
 .../recipes-support/libtdb/libtdb_1.4.3.bb    |  7 +---
 2 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-support/libtdb/libtdb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch

diff --git a/meta-networking/recipes-support/libtdb/libtdb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtdb/libtdb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
new file mode 100644
index 000000000..6f221989f
--- /dev/null
+++ b/meta-networking/recipes-support/libtdb/libtdb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -0,0 +1,42 @@
+From 00bd6680ad38c20c95a35c963d7077269f3a3aa2 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 24 Nov 2021 13:33:35 +0800
+Subject: [PATCH] Fix pyext_PATTERN for cross compilation
+
+The pyext_PATTERN will add native arch as suffix when cross compiling.
+For example, on qemuarm64, it is expanded to:
+pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
+which will result in the incorrect library name.
+
+root@qemuarm64:~# find /usr/lib/python3.10/ -name tdb\*
+/usr/lib/python3.10/site-packages/tdb.so
+/usr/lib/python3.10/site-packages/tdb.cpython-310-x86_64-linux-gnu.so
+
+Set pyext_PATTERN to '%s.so' to remove the suffix.
+After the patch:
+root@qemuarm64:~# find /usr/lib/python3.10/ -name tdb\*
+/usr/lib/python3.10/site-packages/tdb.so
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ third_party/waf/waflib/Tools/python.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
+index 7c45a76..c9a90f7 100644
+--- a/third_party/waf/waflib/Tools/python.py
++++ b/third_party/waf/waflib/Tools/python.py
+@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
+ 	x = 'MACOSX_DEPLOYMENT_TARGET'
+ 	if dct[x]:
+ 		env[x] = conf.environ[x] = dct[x]
+-	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
++	env.pyext_PATTERN = '%s.so'
+ 
+ 
+ 	# Try to get pythonX.Y-config
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
index ad8459389..e7f738402 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c
 
 SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://tdb-Add-configure-options-for-packages.patch \
+           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
 "
 
 SRC_URI[md5sum] = "e638e8890f743624a754304b3f994f4d"
@@ -39,12 +40,6 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
 
-do_install:append() {
-     # add this link for cross check python module existence. eg: on x86-64 host, check python module
-     # under recipe-sysroot which is mips64.
-     cd ${D}${PYTHON_SITEPACKAGES_DIR}; ln -s tdb.*.so tdb.so
-}
-
 PACKAGES += "tdb-tools python3-tdb"
 
 RPROVIDES:${PN}-dbg += "python3-tdb-dbg"
-- 
2.25.1


