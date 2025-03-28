Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EAAC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 05:11:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4676.1743138687300030292
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 22:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5182b00a2a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S3un1S025484
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 22:11:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45n7v7gur1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 22:11:26 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 27 Mar 2025 22:11:26 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 27 Mar 2025 22:11:25 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-m2crypto: Upgrade 0.42.0 -> 0.44.0
Date: Fri, 28 Mar 2025 13:11:24 +0800
Message-ID: <20250328051124.629224-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=bsdMBFai c=1 sm=1 tr=0 ts=67e62f7e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=8ZSCHA5o6wx2R0btI14A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: A9OjwqsPK8aS76Pm17VDLwIztW94Qza-
X-Proofpoint-GUID: A9OjwqsPK8aS76Pm17VDLwIztW94Qza-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 05:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116343

From: Mingli Yu <mingli.yu@windriver.com>

Changelog: https://gitlab.com/m2crypto/m2crypto/-/tags

The cmd will be None after introduced the commit [1] in the new
version and result the below do_compile error.
 DEBUG: Executing shell function do_compile
 * Getting build dependencies for wheel...
 [snip]
 TypeError: expected str, bytes or os.PathLike object, not NoneType
 ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel

So make the cmd available to fix the above issue.

[1] https://gitlab.com/m2crypto/m2crypto/-/commit/4d7880b019a67e24458b1c9a50331c18c9eec827

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...0001-setup.py-Make-the-cmd-available.patch | 40 +++++++++++++++++++
 ...o_0.42.0.bb => python3-m2crypto_0.44.0.bb} |  6 ++-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.42.0.bb => python3-m2crypto_0.44.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
new file mode 100644
index 0000000000..819ecabf6c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-Make-the-cmd-available.patch
@@ -0,0 +1,40 @@
+From b14664fdab286485c5cbc0fbe5b0ff13f062edd8 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 28 Mar 2025 12:13:26 +0800
+Subject: [PATCH] setup.py: Make the cmd available
+
+The cmd will be None in OE environment as below.
+ >>> import os
+ >>> os.environ.get('CC', 'gcc')
+'x86_64-wrs-linux-gcc  -m64 -march=nehalem -mtune=generic -mfpmath=sse -msse4.2 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/buildarea/tmp/work/corei7-64-wrs-linux/python3-m2crypto/0.44.0/recipe-sysroot'
+ >>> import shutil
+ >>> shutil.which(os.environ.get('CC', 'gcc'))
+ >>> cmd = [shutil.which(os.environ.get('CC', 'gcc'))]
+ >>> print(cmd)
+[None]
+
+So change the check logic to get the expected cmd.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7e295f3..cc414c9 100644
+--- a/setup.py
++++ b/setup.py
+@@ -221,7 +221,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+             with open(
+                 "src/SWIG/x509_v_flag.h", "w", encoding="utf-8"
+             ) as x509_v_h:
+-                cmd = [shutil.which(os.environ.get('CC', 'gcc'))]
++                cmd = os.environ.get('CC', 'gcc').split()
+                 cflags = os.environ.get("CFLAGS")
+                 if cflags is not None:
+                     cmd += cflags.split()
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
index b50ae31e4c..5201e704ea 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.42.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
@@ -4,7 +4,11 @@ HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
-SRC_URI[sha256sum] = "42b62df2caf623161b1d643a7235464c2fe2a3105049ebc498a6d47dc08f64b4"
+SRC_URI[sha256sum] = "384bb4cbd178ee0e74015311b7b1f9f2c377e3686e03fa070b3ec2f494671c0f"
+
+SRC_URI += " \
+           file://0001-setup.py-Make-the-cmd-available.patch \
+"
 
 inherit pypi siteinfo python_setuptools_build_meta
 
-- 
2.34.1


