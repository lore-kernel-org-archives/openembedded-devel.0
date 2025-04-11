Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC493C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 09:19:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21600.1744363150860138080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 02:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6196f9f2c6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B8S2oU026718
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 02:19:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m7m0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 02:19:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 11 Apr 2025 02:19:09 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 11 Apr 2025 02:19:08 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-django: Upgrade 5.0.13 -> 5.2
Date: Fri, 11 Apr 2025 17:19:07 +0800
Message-ID: <20250411091907.274898-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ki9qzDhACwdZHLZkNhRZ1QTAIPL5Se_W
X-Proofpoint-ORIG-GUID: Ki9qzDhACwdZHLZkNhRZ1QTAIPL5Se_W
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f8de8e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=ArP49Si0AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=lWX2f3XPAAAA:8 a=INQit2kyDGHmmJisLkIA:9
 a=glZLBWN_5F3qvmUqPDV8:22 a=FdTzh2GWekK77mhwV6Dw:22 a=JNcmbD5CRP_GvhbQn_Yr:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504110057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 09:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116798

From: Mingli Yu <mingli.yu@windriver.com>

Release note:
https://docs.djangoproject.com/en/5.2/releases/5.2/

Backport a patch [1] to fix the below build failure:
 | ERROR Missing dependencies:
 | 	setuptools<69.3.0,>=61.0.0

[1] https://github.com/django/django/commit/3ae049b26b995c650c41ef918d5f60beed52b4ba

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ated-setuptools-to-normalize-package.patch | 27 +++++++++++++++++++
 .../python/python3-django_5.0.13.bb           |  9 -------
 .../python/python3-django_5.2.bb              | 13 +++++++++
 3 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_5.0.13.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch
new file mode 100644
index 0000000000..4e28f59d8a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch
@@ -0,0 +1,27 @@
+From 3ae049b26b995c650c41ef918d5f60beed52b4ba Mon Sep 17 00:00:00 2001
+From: Nick Pope <nick@nickpope.me.uk>
+Date: Fri, 6 Dec 2024 18:32:39 +0000
+Subject: [PATCH] Fixed #35980 -- Updated setuptools to normalize package names
+ in built artifacts.
+
+Upstream-Status: Backport [https://github.com/django/django/commit/3ae049b26b995c650c41ef918d5f60beed52b4ba]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index f10d15d20d..b9e82334cd 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=61.0.0,<69.3.0"]
++requires = ["setuptools>=75.8.1"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.13.bb b/meta-python/recipes-devtools/python/python3-django_5.0.13.bb
deleted file mode 100644
index 801083833c..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_5.0.13.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python3-django.inc
-inherit python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "f9d4b7b87a9dae248d5f20cec940cf7290e07d508d6d8432e3c2cabf09b3b0ff"
-
-RDEPENDS:${PN} += "\
-    python3-sqlparse \
-    python3-asgiref \
-"
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.bb b/meta-python/recipes-devtools/python/python3-django_5.2.bb
new file mode 100644
index 0000000000..8a20448e22
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.bb
@@ -0,0 +1,13 @@
+require python3-django.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "1a47f7a7a3d43ce64570d350e008d2949abe8c7e21737b351b6a1611277c6d89"
+
+SRC_URI += "\
+           file://0001-Fixed-35980-Updated-setuptools-to-normalize-package.patch \
+"
+
+RDEPENDS:${PN} += "\
+    python3-sqlparse \
+    python3-asgiref \
+"
-- 
2.34.1


