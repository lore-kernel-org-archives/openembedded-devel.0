Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701C6CD1292
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 08:24:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12658.1712823862138199568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 01:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cM+pKOkh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48310121fe=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43B5PUBH024159;
	Thu, 11 Apr 2024 08:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=LLEYt
	mpvorRmQf2PwryeU7cuBCfkcnFNhl4a1uS/uQ0=; b=cM+pKOkhjajTPqKLNityn
	HerR1eJIurWVzE9sH5iOLAafq2qEv924F7Zq0Dt1mz0U4hm08qERdn8KpqGRV4OV
	HvXm3vappb57ygTwzY5Qwvk2dzGSB4JjteOpz/AhK7Q+Ba/5MlvZJ0psJgJN1ikt
	L+lr8pNFC2VtC22H9Nm1wrWecaQbBayPR9NAMJRoDLN80IowCWY4c1QtQ8UproIp
	Es2SJ8UyNJoR3Wlp/Rrb4JbEqObBWMvSY/5JBpFtQwEc7q8ruUL64DS+AVvbYlhb
	N5K7ZMeAsKWewyXGvbsJZrBBqsnXhQgdzg93TYWptmbS3+/24il3H3fb1kjtQm73
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xaukxx3ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 11 Apr 2024 08:24:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 11 Apr 2024 01:24:18 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Thu, 11 Apr 2024 01:24:17 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] nodejs: don't always disable io_uring
Date: Thu, 11 Apr 2024 16:24:16 +0800
Message-ID: <20240411082416.1732666-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: FrqN_vmRWpEZQmFD5lefFHjlVn-7g9bX
X-Proofpoint-ORIG-GUID: FrqN_vmRWpEZQmFD5lefFHjlVn-7g9bX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 08:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109917

From: Changqing Li <changqing.li@windriver.com>

The original idea was always disable io_uring to avoid follwing failure
even when UV_USE_IO_URING is set to true, refer [1][2]:
     0608:                    try:
 *** 0609:                        update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
     0610:                        update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
     0611:                    except KeyError as e:
     0612:                        msg = ("KeyError: %s\nPath %s is owned by uid %d, gid %d, which doesn't match "
     0613:                            "any user/group on target. This may be due to host contamination." %
Exception: Exception: KeyError: 'getpwuid(): uid not found: 20561'

But since 20.11.1, for fix CVE-2024-22017, io_uring is disabled by
default, refer [3]. So maybe patch
0001-deps-disable-io_uring-support-in-libuv.patch is not needed.

For case UV_USE_IO_URING is set to true, user can fix above failure
by "chown root:root -R ${D}" in do_install.

[1] https://lists.openembedded.org/g/openembedded-devel/message/105583
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15244
[3] https://github.com/nodejs/node/commit/686da19abbb83b7e01d48be19f832ab081b87084
[4] https://nvd.nist.gov/vuln/detail/CVE-2024-22017

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ps-disable-io_uring-support-in-libuv.patch | 35 -------------------
 .../recipes-devtools/nodejs/nodejs_20.11.1.bb |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
deleted file mode 100644
index f11cd08cb..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9838be9c710ab4249df86726fa390232a3b6a6e7 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 1 Mar 2024 15:46:11 +0800
-Subject: [PATCH] deps: disable io_uring support in libuv
-
-Refer [1], Pseudo fails to intercept some of the syscalls when io_uring
-enabled. Refer [2], always disable io_uring support in libuv to fix
-issue in [1].
-
-[1] https://git.openembedded.org/meta-openembedded/commit/?id=d08453978c31ee41d28206c6ff198d7d9d701d88
-[2] https://github.com/nodejs/node/commit/686da19abb
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- deps/uv/src/unix/linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/uv/src/unix/linux.c b/deps/uv/src/unix/linux.c
-index 0c997185..7508409d 100644
---- a/deps/uv/src/unix/linux.c
-+++ b/deps/uv/src/unix/linux.c
-@@ -433,7 +433,7 @@ static int uv__use_io_uring(void) {
-   if (use == 0) {
-     /* Disable io_uring by default due to CVE-2024-22017. */
-     val = getenv("UV_USE_IO_URING");
--    use = val != NULL && atoi(val) ? 1 : -1;
-+    use = 0;
-     atomic_store_explicit(&use_io_uring, use, memory_order_relaxed);
-   }
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb
index e2e2f5ae8..9a61cfcf7 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb
@@ -24,7 +24,6 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
-           file://0001-deps-disable-io_uring-support-in-libuv.patch \
            file://run-ptest \
            "
 
-- 
2.25.1


