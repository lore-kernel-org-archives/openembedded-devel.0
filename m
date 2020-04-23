Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2981.1587633724914960382
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 02:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03N9Lhwd028798
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2020 02:21:53 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Apr 2020 02:21:13 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] xfce4-panel-profiles: not create link to /usr/share/locale
Date: Thu, 23 Apr 2020 17:21:10 +0800
Message-ID: <20200423092110.30305-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It is useless to create a link to $(PREFIX)/share/locale that there is
no reference to $(PREFIX)/share/$(APPNAME)/locale in source code.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../not-create-link-to-locale.patch           | 22 +++++++++++++++++++
 .../xfce4-panel-profiles_1.0.10.bb            |  4 +++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
new file mode 100644
index 000000000..80cdfb903
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/not-create-link-to-locale.patch
@@ -0,0 +1,22 @@
+It is useless to create a link to $(PREFIX)/share/locale that there is no
+reference to $(PREFIX)/share/$(APPNAME)/locale in source code.
+
+Upstream-Status: Submitted [https://bugzilla.xfce.org/show_bug.cgi?id=16693]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ Makefile.in.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.in.in b/Makefile.in.in
+index c0ce866..c2f26fe 100644
+--- a/Makefile.in.in
++++ b/Makefile.in.in
+@@ -61,7 +61,6 @@ install: all xfce4-panel-profiles.1.gz
+ 	install data/metainfo/*.xml $(DESTDIR)/$(PREFIX)/share/metainfo
+ 
+ 	cp -rf locale $(DESTDIR)/$(PREFIX)/share
+-	ln -sf $(PREFIX)/share/locale $(DESTDIR)/$(PREFIX)/share/$(APPNAME)/locale
+ 
+ 	install -d $(DESTDIR)/$(PREFIX)/share/man/man1
+ 	install xfce4-panel-profiles.1.gz $(DESTDIR)/$(PREFIX)/share/man/man1
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
index 5b5a286a4..7226b1a03 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.10.bb
@@ -9,7 +9,9 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "intltool-native"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2"
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2 \
+           file://not-create-link-to-locale.patch \
+           "
 SRC_URI[md5sum] = "6190678bc701c197babcb2389ba46182"
 SRC_URI[sha256sum] = "a84d5e748d53bc5da269954cc3ad7f5ac0c4f5813acfd3892ea6f9064f17fb68"
 
-- 
2.17.1

