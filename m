Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A470D2503D
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 07:11:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28230.1768201892964755919
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 23:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HILGOVaL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54729221db=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C66ENC4014295
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 07:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=UTbLJ9KoW7EqGpBOExUC
	1nGHRXEEAzRlg06uv5JIncU=; b=HILGOVaL2sw8DuT47bhQgm1xwWscFYV7p5qM
	qwqkd1IFyaKPDV143OhEupuzvEztO2ycmH5m4F08zdzDYSJFuD131B43E8pL5K4b
	MrQYZr9dUdragu2+GW5dylTRexkEJpB15EhbXgmDtER/ipQINPu0nMCOTya6DTtL
	Wf8h3h//oMw1gCFEQmK9KRT8LoS98gLsSZMKUfG18wCFvW3zeCg6AAIgp/oaRad/
	fSlnLF6SH9XBD3IBoGlwWhDs7u2kmtqj8nylD8on0DGot7dhwmAeR70r/hyoewOl
	+PYCBKvdae32qTfWzTbamkeoTRn89MdywXIq4EmG0tD4/H2zqg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbythgax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 07:11:31 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 11 Jan 2026 23:11:30 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 11 Jan 2026 23:11:29 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] menulibre: fix do_install failed
Date: Mon, 12 Jan 2026 15:11:28 +0800
Message-ID: <20260112071128.1670836-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VPknPv8e7TdZaxVhNJKVeZ9oCeTzRiSv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1NCBTYWx0ZWRfXzNTGDStg1Kkp
 1H29rue6aFs+jpLFIulaansDedwxLEbxEu85KpA+ghTV+yWqgxwxcl6QQLaVR3RedL+Z/2JxdUK
 2c+oZb3k/PlOPMQ32F7DnizXs8jJESkemPcIPtQWFCcU0fXFdoi8m//IIB//A2pzV0jOkuKJ3m/
 XQIEy3/Y0iw9uyNsT65QayvJVcpoRSLc+w4rWYOQhddrl5mKLhjlRDBGm4w4rCunDdP1Tu+Z8rw
 NwmNEdsN7SvjI5th9Qq6IneT0ZYF8Saunt8IUP9ZVwdiEfGcN2rtDdZjSnyL+1Ppa/4TE6Xge1N
 lIzegq1KH5h7zDcOmhWi0Puo5tWNwEwN4KitiY2104KamO+3jkLmLKqk+h4SoT96SkHv1aZvi/0
 v45R8ACqWXmLZHOmSTnTSiNbutnjslzgI1KFS9YWQFYHarB1RhTosGqL8P1VobKNt+PzVuBo5W4
 XNWbVT3Ww0KKButXTFA==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69649ea3 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=1MBuXwGXAAAA:8 a=yRDHvOOrD21pkbyOLcUA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=YwQ85sQbqJR2Y2DDiIFu:22
X-Proofpoint-ORIG-GUID: VPknPv8e7TdZaxVhNJKVeZ9oCeTzRiSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 07:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123358

Use pip 25.3 to install failed
...
Traceback (most recent call last):
  File "menulibre-2.4.0/setup.py", line 245, in <module>
    DistUtilsExtra.auto.setup(
    ~~~~~~~~~~~~~~~~~~~~~~~~~^
        name='menulibre',
        ^^^^^^^^^^^^^^^^^
    ...<12 lines>...
        cmdclass={'install': InstallAndUpdateDataDirectory}
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    )
    ^
  File "recipe-sysroot-native/usr/lib/python3.13/site-packages/DistUtilsExtra/auto.py", line 98, in setup
    __requires(attrs, src_all)
    ~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "recipe-sysroot-native/usr/lib/python3.13/site-packages/DistUtilsExtra/auto.py", line 471, in __requires
    __add_imports(imports, s, attrs)
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^
  File "recipe-sysroot-native/usr/lib/python3.13/site-packages/DistUtilsExtra/auto.py", line 405, in __add_imports
    if alias.name and __external_mod(cur_module, alias.name, attrs):
                      ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "recipe-sysroot-native/usr/lib/python3.13/site-packages/DistUtilsExtra/auto.py", line 377, in __external_mod
    return 'dist-packages' in mod.__file__ or 'site-packages' in mod.__file__ or \
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: argument of type 'NoneType' is not iterable
...

Refer [1] to correct one line in setup.py

[1] https://github.com/epoptes/epoptes/commit/81be63961a428728601df6f442490638df3bd263

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-setup.py-fix-install-failed.patch    | 59 +++++++++++++++++++
 .../recipes-apps/menulibre/menulibre_2.4.0.bb |  4 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-apps/menulibre/files/0001-setup.py-fix-install-failed.patch

diff --git a/meta-xfce/recipes-apps/menulibre/files/0001-setup.py-fix-install-failed.patch b/meta-xfce/recipes-apps/menulibre/files/0001-setup.py-fix-install-failed.patch
new file mode 100644
index 0000000000..751b77e3b2
--- /dev/null
+++ b/meta-xfce/recipes-apps/menulibre/files/0001-setup.py-fix-install-failed.patch
@@ -0,0 +1,59 @@
+From 671fba096962a24c9dd71b5c995399984ec2ef60 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 12 Jan 2026 15:01:00 +0800
+Subject: [PATCH] setup.py: fix install failed
+
+Use pip 25.3 to install failed
+...
+Traceback (most recent call last):
+  File "menulibre-2.4.0/setup.py", line 245, in <module>
+    DistUtilsExtra.auto.setup(
+    ~~~~~~~~~~~~~~~~~~~~~~~~~^
+        name='menulibre',
+        ^^^^^^^^^^^^^^^^^
+    ...<12 lines>...
+        cmdclass={'install': InstallAndUpdateDataDirectory}
+        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+    )
+    ^
+  File "recipe-sysroot-native/usr/lib/python3.13/site-packages/DistUtilsExtra/auto.py", line 98, in setup
+    __requires(attrs, src_all)
+    ~~~~~~~~~~^^^^^^^^^^^^^^^^
+  File "recipe-sysroot-native/usr/lib/python3.13/site-packages/DistUtilsExtra/auto.py", line 471, in __requires
+    __add_imports(imports, s, attrs)
+    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^
+  File "recipe-sysroot-native/usr/lib/python3.13/site-packages/DistUtilsExtra/auto.py", line 405, in __add_imports
+    if alias.name and __external_mod(cur_module, alias.name, attrs):
+                      ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+  File "recipe-sysroot-native/usr/lib/python3.13/site-packages/DistUtilsExtra/auto.py", line 377, in __external_mod
+    return 'dist-packages' in mod.__file__ or 'site-packages' in mod.__file__ or \
+           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+TypeError: argument of type 'NoneType' is not iterable
+...
+
+Refer [1] to correct one line in setup.py
+
+[1] https://github.com/epoptes/epoptes/commit/81be63961a428728601df6f442490638df3bd263
+
+Upstream-Status: Submitted [https://github.com/bluesabre/menulibre/pull/233]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ setup.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/setup.py b/setup.py
+index 4aec9fd..649f5f7 100644
+--- a/setup.py
++++ b/setup.py
+@@ -248,6 +248,7 @@ DistUtilsExtra.auto.setup(
+     license='GPL-3',
+     author='Sean Davis',
+     author_email='sean@bluesabre.org',
++    requires='',
+     description='advanced menu editor with support for Unity actions',
+     long_description='An advanced menu editor that provides modern features '
+                      'and full Unity action support. Suitable for lightweight '
+-- 
+2.34.1
+
diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
index 4c52249fed..1a5fcbc767 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
@@ -12,7 +12,9 @@ DEPENDS = " \
 inherit setuptools3_legacy gtk-icon-cache features_check
 REQUIRED_DISTRO_FEATURES = "x11 gobject-introspection-data"
 
-SRC_URI = "https://github.com/bluesabre/${BPN}/releases/download/${BP}/${BP}.tar.gz"
+SRC_URI = "https://github.com/bluesabre/${BPN}/releases/download/${BP}/${BP}.tar.gz \
+           file://0001-setup.py-fix-install-failed.patch \
+"
 SRC_URI[sha256sum] = "d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c42f5d5f465f593c9f"
 
 UPSTREAM_CHECK_URI = "https://github.com/bluesabre/menulibre/releases"
-- 
2.34.1


