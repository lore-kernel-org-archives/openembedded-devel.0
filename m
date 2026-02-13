Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05F8ECD6F0
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 02:32:48 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62500.1770949955864754403
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 18:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EAz+jIiM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770949959; x=1802485959;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OYnzxuu7gE9YjW55Fn1mYqENZDPp47Cs7uV6ybQE5u8=;
  b=EAz+jIiMKrMcQnuqVkU762EMBV0B+KxsirsBNTQhyUY2l1ipHF/suhEO
   hiojbHUENqHfmR7a5n+5KVjToqFbJaFOra8bLg+ZyGj641besHbtev9e4
   1TCShwkk9+jAdloDRx2NwwaF08nwodYCZUlMzR9qlANYGTunneknSM6F9
   BU/afNwxvNX40AzMmh68RHoV3USLC70WBdVToI1fimCvF1h4iY6IgPbpf
   F9/YBoAfJXuM40dOdoF5PHkW4FB7BWIoG5/slyE8LnaHQL2gvKiXX907b
   p/3AtrEJ5rIkzZqZomqh2PLsSIgT1LQKtsDB5RklSIGWS3PIoPtEuQpMd
   A==;
X-CSE-ConnectionGUID: 8Dyw63xlSBW+Jb2I7Bb2Sw==
X-CSE-MsgGUID: fnCNj5QXT8uS3+N3cx6G+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="228858427"
X-IronPort-AV: E=Sophos;i="6.21,287,1763391600"; 
   d="scan'208";a="228858427"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 6F8F5ADB9
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:38 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 266DFC026D2
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:38 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id E1E43200023F
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:35 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 4/5] python3-dbus-deviation: Add new recipe
Date: Fri, 13 Feb 2026 10:32:16 +0800
Message-ID: <20260213023217.19706-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213023217.19706-1-liuyd.fnst@fujitsu.com>
References: <20260213023217.19706-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 02:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124369

Add this new recipe for runtime dependence of hotdoc.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...o-donwload-requierment-which-will-ca.patch | 27 +++++++++++++++++++
 .../python/python3-dbus-deviation_0.6.1.bb    | 20 ++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch b/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch
new file mode 100644
index 0000000000..b163db772c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch
@@ -0,0 +1,27 @@
+Subject: [PATCH] Prevent trying to donwload requierment which will cause
+ network error.
+
+'NewConnectionError('<pip._vendor.urllib3.connection.HTTPSConnection object at 0x7f1e83062ad0>: Failed to establish a new connection: [Errno -3] Temporary failure in name resolution')': /simple/setuptools-git/
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com> 
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 245193f..d899e4c 100755
+--- a/setup.py
++++ b/setup.py
+@@ -92,7 +92,6 @@ setuptools.setup(
+     exclude_package_data={'': ['.gitignore']},
+     zip_safe=True,
+     setup_requires=[
+-        'setuptools_git >= 0.3',
+         'sphinx',
+     ],
+     install_requires=['lxml'],
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb b/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb
new file mode 100644
index 0000000000..e969e85465
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dbus-deviation_0.6.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "dbus-deviation is a project for parsing D-Bus introspection XML and processing it in various ways"
+HOMEPAGE = "https://tecnocode.co.uk/dbus-deviation/"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=90263a49bc1d9a204656fec4d5616c66"
+
+SRC_URI[sha256sum] = "e06b88efe223885d2725df51cf7c9b7b463d1c6f04ea49d4690874318d0eb7a3"
+
+inherit pypi setuptools3
+
+SRC_URI += "file://0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch"
+
+DEPENDS += "python3-sphinx-native"
+
+do_install:append() {
+    for ss in $(find ${D}${PYTHON_SITEPACKAGES_DIR} -type f -name "*.py"); do
+        sed -i 's,/usr/bin/python$,/usr/bin/env python3,' "$ss"
+    done
+}
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


