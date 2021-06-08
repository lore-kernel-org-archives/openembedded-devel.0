Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.8717.1623132136729558707
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nD4V35+c;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179390addc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1585x8O7028410
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jun 2021 23:02:16 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 391qkqgdgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:02:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnW6GSndzo1MAazWI/A1Zz2Z7A5ArmRNL1s1UL4ky8ZtxQT1PBzuAfp5fHZmPXnhhknLBGNLH59P4QYoGfPT2OKP6KJoXc15zrTIl5ralwYYTkYQF4HLu6xMQ0tB6SyFfQttTEqgjtU0RKbAkoj658UOgDAUtl8DF5Y48A4Ftwc0nK7uuF6YMUX+LamRiL2sid86LdN+uPH29274BGuSFulQBclFu/7s9ru5nPgOUZUsKnsHHMIbnGrOAXTMmYogvT2Yvy3Cg1iivabnNTW3gpNnv3oga/9tDcgc2y6aJebzV/lfwVnPAcP7BFiS4a4/NpU5GO7celyla57qC985cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2EcZDXA8q2/amlS/iziOAL9ZDeuBND/79BUNzq0tjI=;
 b=hZC59PZiM2JOsDJweoXRbX19iNIdRwfhgKfYzS1nzVozj75n/v4/6svExxHapS1V5qIGJX4J1HazEHA4L+7SECrr1wDe9o7Uzk5rXxH4E4idEiFzQxlMsVRRc3ZzBFsge9fXBQvvTez9ocLUkcBDXo+dnYrPT2W8AK+tGcOaQyiTRFzG2ep1tpnlbQSnFXwc6zHqr/2YFO5JqlgjCY+Y7C2q1rM/TdVhC5IT5s1XREalyIVXTPxJRO8j/yQsi8H7tf/szzg+SvG4u6q68BIqH0wZQv8LP/UrSQc7GfvIKguCqSId75Errd6eR+3RVknOHZGm3Y/XQy4jbKDSyKlD9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2EcZDXA8q2/amlS/iziOAL9ZDeuBND/79BUNzq0tjI=;
 b=nD4V35+cUmB+vCvr984ayhCKLlAxleMkbC+3auQHo5ibv6mWM2FqDN+MQ22QRqBToky5W7+aFx/ZFBuo6jvngwanh882c+vrpN4vtZwfoHoFd7xnt7qvxO/ZWy2+T89njaiibPIWF8oMmMjaciCpX3SN0fjKtMn+xMDUifBob/s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 06:02:14 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 06:02:14 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/4] dhcp-relay: update bundled bind to 9.11.32
Date: Tue,  8 Jun 2021 14:02:01 +0800
Message-Id: <20210608060204.38115-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BY3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:254::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.10 via Frontend Transport; Tue, 8 Jun 2021 06:02:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e27d8c2f-ee4a-472a-5bd7-08d92a42f695
X-MS-TrafficTypeDiagnostic: MW3PR11MB4698:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB46985323B0D372260BF899F9F9379@MW3PR11MB4698.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7VHDTfnyqa+qDGzZDyYWEt5At98kjR5k0I6TN7vl+Q0FZQxlhkXUqJzDp5pZPMqX0/EZ/p7oZba4CoYf0jfqmSR5Pn7daPNJv2OtR5PbRMdINykUqp6ZTZ2457SlyTsuGb/hgvvFshLeJHo5QCSgrm2PDQTW464cbQx/LWCyQ2MeFxLq/H1RQklkjshyuo3sQW/2Cv2S5NlyXYMCGhj3mCpxhzfQprSIoawgeasf7XTNN72+QXWUiBAa+3tobqF9NzKXGsPEpPm1qLybHRJSxxIPtOCnDDrsmtRAveju0yl2yT4/dU6OGWoBJL1iznuPLcu3wn27nVInXY5+mPPm7FctllNQ5y54DXQcfUoUSvAMyqwxvVjTADw7qKvqBBh/3qejJCKMoyxwUw+G7HYDz0kNsT9XsiAb+Oy03FKk6zW/0OGY5E00Q5y/JwAS+6vAaOtqyNimo0oorSoWX0i6KcgHvdLmTs8J7m3GKdQLb8ySByt3JZ5SAjq/VF7DtzvTYnTJKTE/kNn/76mg2zuWITpFdR8tjQPaYZrlOM7LzTIWYjRnl2xaqjdSXXNYBIms99mhi1CTIFpe8QhVMmBMchG9k3QRqnFFUBiR7ugQ7bc5D4rYMh+Mya2EJIfp7iXyLJWmn1Z+orjmRtSyMozqSO4Vv0aXyO1XgvsNnFNq6mLhRAweQWTPEnGx5AigEYS5PR/i4l5ic+o9H4jH6puQN2SWeHCew6SYIodhWuDTbhAYdtN6QxiFcnW1Xwxedov/VRheuj7MPTx+q0tAuIZ17IJSvSDzw6MDpC+7nNjUCimYW8jbNygUEyRSypskps8q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39850400004)(83380400001)(6666004)(6512007)(316002)(38350700002)(186003)(1076003)(16526019)(86362001)(38100700002)(5660300002)(66556008)(66946007)(2616005)(956004)(36756003)(8936002)(52116002)(6916009)(44832011)(8676002)(6506007)(6486002)(2906002)(26005)(15650500001)(966005)(478600001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z2MkGrV9g0KsYiM5iOmW4qWCQG2xJssDSujyj+YKxJemfBTp+KiKf/FJCASx?=
 =?us-ascii?Q?w03iNpM/1/0SoVNvP8KLDFMINN/w5qswmtoq2wV5tBDWT5YdCYGqYwyMXFVR?=
 =?us-ascii?Q?VZpvvTaRUYhNcgA1s64QpOY4ewDk6tZK7d2d0HsRx8yv0J//xEtR5hZ5YJEm?=
 =?us-ascii?Q?RCL79Z3lX4ZWRvlBpRBwLyqV3hqkdDemKTGBGZKzfCqG/anhIqGahQISa5rq?=
 =?us-ascii?Q?pKwC0swWF5ARYwY/TP6hYxhh0isnnssqsOtIHwkbA7JkM0lJRTBUl8t6zVss?=
 =?us-ascii?Q?37Xr7cAQSxyx71b1BL2jbFSgY4vP5zp0MnxuVBsqtS410QaQskbLn8CCalID?=
 =?us-ascii?Q?S9qdM0Mw6Q/E42dnQOI5MToYrz1Ym1X52hZWN41EvgHXd7d+BoA4fpqdg8n7?=
 =?us-ascii?Q?F321lmYIdT7u6uzSda5El4P0S+qqRNR1oWPjMaFz9gm/R4n4xwdfWTRzdsK7?=
 =?us-ascii?Q?dtUnB/w3CwGiXQzanz1jrOIGGR5dWX4PaigDaRvcBlhl8DzdBXv32iDIRxry?=
 =?us-ascii?Q?2Xrhc/GLkJwe2l3V/a1n8PZenjXhu42fHZRan4EY0DKahBQDn74GJbNd9I0Q?=
 =?us-ascii?Q?VjFTf3IkEAFv/jNd/2n0OE7KWOXQX4vWR8WsfDjKTh/zoO0rxiv+4NWEjLyV?=
 =?us-ascii?Q?9s2aL8WFHSjsK2WiYG54PZo9205kF1JOwHGtZe0wYvOMvUuQf9JsNWTAzkae?=
 =?us-ascii?Q?i81n/lmMqan5qkD492YP4v4enMZPT/MnjHjp0z8B1UeTzIe3t3VG0PA5/hH4?=
 =?us-ascii?Q?GvMMfUFVuKF1xwZMcOWfppk1PEpXd4i34agZiNI8nof1i+0mn71+bSUzsEFJ?=
 =?us-ascii?Q?1iKQcG6j61T8I/Uk+5K6Tr6OT0hH5jmt0bY30x1/DbRDgTgazkGA4YIMHiv8?=
 =?us-ascii?Q?aUtQQdBfonN+0u8jSaHH2AUFGRudnsyrR6d2t5uKXJwUySpqxWKxsOrCYWsV?=
 =?us-ascii?Q?1aNv02rK6q2eK4lbxs95dfw7SxVpFn4DMJNodnaoIDxVcXm41b9WJeYDa/Pc?=
 =?us-ascii?Q?9Zy+Ff5SYpJXH+uvwoxrK3k/cxpxfwX7XZiie8p6R7fG2Xh1Wn09MNqYX9OU?=
 =?us-ascii?Q?2/B1Zil8Rn/aYNursPDX7NLO2ilwOn7xnETBJDPr9iHD5xP2O7+d1y6QJwuA?=
 =?us-ascii?Q?btZE7/AbI1V7sGLLNl0p3tNCtizzdV2BJGqWTjj94MBt2p4Qnpobs8loWbSM?=
 =?us-ascii?Q?LoQN5w4a0KmAhA7IqT55f4Z2UYqV9JWIsl1X2bRR07pYX5WO+dV724AsQh64?=
 =?us-ascii?Q?22HzcnvKlq74sBws2nT3irdR1WCOOTjB/94UBMU1casOGrpqleURe/FkTuOK?=
 =?us-ascii?Q?A3nJ7xeq0tuJ0uweEBi42j10?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27d8c2f-ee4a-472a-5bd7-08d92a42f695
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 06:02:14.5426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jM9nLde/iXuhlhZxdVMNBQZz6FnMg8WPcCxmrCm81J9uCp/m7w+lUtfLFEmh9H6FLZYK7ZNaF0JwtmgJxi8uKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
X-Proofpoint-GUID: NR4VfQXWGmUNjD1FzEZADd5HbTkZDe4z
X-Proofpoint-ORIG-GUID: NR4VfQXWGmUNjD1FzEZADd5HbTkZDe4z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-08_05:2021-06-04,2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080041
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update the bundled bind from 9.11.14 to 9.11.32.

Fixes build error on qemuarmv5:
stats.c: In function 'setcounter':
stats.c:300:36: error: 'val' undeclared (first use in this function); did you mean 'value'?
  300 |         stats->counters[counter] = val;
      |                                    ^~~
      |                                    value

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcp/dhcp-relay_4.4.2.bb                  | 19 ++++++++----
 ...ind-version-update-to-latest-version.patch | 30 +++++++++++++++++++
 2 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0002-bind-version-update-to-latest-version.patch

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
index b178180ec..671fbf054 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
@@ -11,14 +11,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747
 DEPENDS = "openssl libcap zlib"
 
 SRC_URI = "https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
+           https://ftp.isc.org/isc/bind9/9.11.32/bind-9.11.32.tar.gz;name=bind;downloadfilename=bind.tar.gz;unpack=0 \
            file://default-relay \
            file://init-relay \
            file://dhcrelay.service \
            file://0001-Makefile.am-only-build-dhcrelay.patch \
+           file://0002-bind-version-update-to-latest-version.patch \
            "
 
 SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
 SRC_URI[sha256sum] = "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521"
+SRC_URI[bind.md5sum] = "0d029dd06ca60c6739c3189c999ef757"
+SRC_URI[bind.sha256sum] = "cbf8cb4b74dd1452d97c3a2a8c625ea346df8516b4b3508ef07443121a591342"
 
 UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
@@ -43,15 +47,18 @@ EXTRA_OEMAKE += "LIBTOOL='${S}/${HOST_SYS}-libtool'"
 # Enable shared libs per dhcp README
 do_configure_prepend () {
     cp configure.ac+lt configure.ac
+    rm ${S}/bind/bind.tar.gz
+    mv ${WORKDIR}/bind.tar.gz ${S}/bind/
 }
+
 do_compile_prepend() {
-    rm -rf ${S}/bind/bind-9.11.14/
+    rm -rf ${S}/bind/bind-9.11.32/
     tar xf ${S}/bind/bind.tar.gz -C ${S}/bind
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/bind/bind-9.11.14/
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/bind/bind-9.11.14/
-    cp -fpR ${S}/m4/*.m4 ${S}/bind/bind-9.11.14/libtool.m4/
-    rm -rf ${S}/bind/bind-9.11.14/libtool
-    install -m 0755 ${S}/${HOST_SYS}-libtool ${S}/bind/bind-9.11.14/
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/bind/bind-9.11.32/
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/bind/bind-9.11.32/
+    cp -fpR ${S}/m4/*.m4 ${S}/bind/bind-9.11.32/libtool.m4/
+    rm -rf ${S}/bind/bind-9.11.32/libtool
+    install -m 0755 ${S}/${HOST_SYS}-libtool ${S}/bind/bind-9.11.32/
 }
 
 do_install_append () {
diff --git a/meta-networking/recipes-connectivity/dhcp/files/0002-bind-version-update-to-latest-version.patch b/meta-networking/recipes-connectivity/dhcp/files/0002-bind-version-update-to-latest-version.patch
new file mode 100644
index 000000000..5c7a5f058
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/0002-bind-version-update-to-latest-version.patch
@@ -0,0 +1,30 @@
+From edb68972f8dc636e6208e78f02dec6f9805e4c0b Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 26 May 2021 11:39:00 +0800
+Subject: [PATCH] bind/version: update to latest version
+
+Update the bundled bind from 9.11.14 to 9.11.32.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bind/version.tmp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bind/version.tmp b/bind/version.tmp
+index cf52f1b..4cc538e 100644
+--- a/bind/version.tmp
++++ b/bind/version.tmp
+@@ -5,7 +5,7 @@ PRODUCT=BIND
+ DESCRIPTION="(Extended Support Version)"
+ MAJORVER=9
+ MINORVER=11
+-PATCHVER=14
++PATCHVER=32
+ RELEASETYPE=
+ RELEASEVER=
+ EXTENSIONS=
+-- 
+2.17.1
+
-- 
2.25.1

