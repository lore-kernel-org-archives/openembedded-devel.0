Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A9A7F746D1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:38:00 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f125so16784006wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=aGItN1BloGQoKSpbU5E7EdiWRRV0Gcm7z2iYmlSnNCA=;
	b=LlyN3iMNg9simpYTG5/M1Jv69GBL32+ZU+GLgWWyxrODD8WiHdCGleYF9PULhUt4Va
	zfuDyhj++w4rEqj70W/2LKbzG3zWG8D1CPDoXsKvdQyljh9oHc5CylJT0HQBE+ad/Lkd
	BJAny8LkKo2KT7HhJudtDkEecfYrVS7Yx1uvS7zO9TfU3ZLPp49n0xbfwYU3E0WZQHT2
	YiLqZVJcpeESJmjap1xhYSmboJvxkKTbuTuog8LCC7o1RRBORF5Jr7F95lcN35F7eLHN
	b+NjOVrQuP+QIryz2AIpjSnacd40p69dTtgeBmwyMLXWsKJfLP+T9k4ZKRg2lkgB8fl3
	vekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aGItN1BloGQoKSpbU5E7EdiWRRV0Gcm7z2iYmlSnNCA=;
	b=eeybW7p5ang/EPUhLKS7C1HQxw1i1itryDXRCabulk2SSSQWHa3Oqe73sS2Jd6Hvim
	EPhOJYbx3KA+8Q7cTQVtQuXqjcVCwyeXWEijWppp2xFY91G8+ozuE3pUFLSc1mbrtASC
	KiTrTkofAgim8ouwJvCot11DOl2knsGBc/QQhL6pxLDUa5c9UzLXfGvgsCLxhD87nvK2
	Iy3TpcfNEqA/Sb4cf3mJqZfipdfK5jIxZNLGbPGOry7PA77QJ22vm0gmMcLF48T5DQZW
	/dlfC+xh9kZDuciLT0C7glbq6dT9QTW1sVvt6s2oL4+j5Cw6fI859mhfu95pruss8cyL
	GcTw==
X-Gm-Message-State: AElRT7EFOfthc9oDqUHpBkd5xEbgPEzqX7MhEuxYI6OChZjd9sCE2Rm/
	IgsZjUpjdBiWdgmuHHQogZ6ZxA==
X-Google-Smtp-Source: AIpwx48TkrmJoopsMrKfRb68Y4cbCsNXTT805r6JbE8qz4y3zFrrp1p4HmKdVSobf+k7vbOngisw6g==
X-Received: by 10.28.20.140 with SMTP id 134mr2141657wmu.87.1522416751549;
	Fri, 30 Mar 2018 06:32:31 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:39 +0200
Message-Id: <20180330133151.25882-28-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 27/39] udisks2: update 2.1.8 -> 2.7.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2018 13:38:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They moved to github so updates slipped through...

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../udisks2/0001-data-fix-out-of-tree-build.patch  | 35 ++++++++++++++++
 meta-oe/recipes-support/udisks/udisks2_2.1.8.bb    | 39 -----------------
 meta-oe/recipes-support/udisks/udisks2_2.7.6.bb    | 49 ++++++++++++++++++++++
 3 files changed, 84 insertions(+), 39 deletions(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
 create mode 100644 meta-oe/recipes-support/udisks/udisks2_2.7.6.bb

diff --git a/meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch b/meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
new file mode 100644
index 000000000..1cbd87751
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
@@ -0,0 +1,35 @@
+From 7fdd4acdf6daf95c5cc74e968f4710513c8ddaea Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 23 Mar 2018 18:33:52 +0100
+Subject: [PATCH] data: fix out of tree build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| sed: can't read udisks2.service.in: No such file or directory
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/storaged-project/udisks/pull/510
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ data/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/data/Makefile.am b/data/Makefile.am
+index ddf9e3d6..b38928c8 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -22,7 +22,7 @@ systemdservicedir       = $(systemdsystemunitdir)
+ systemdservice_DATA     = $(systemdservice_in_files:.service.in=.service)
+ 
+ $(systemdservice_DATA): udisks2.service.in Makefile
+-	@sed -e "s|\@udisksdprivdir\@|$(libexecdir)/udisks2|" udisks2.service.in > udisks2.service
++	@sed -e "s|\@udisksdprivdir\@|$(libexecdir)/udisks2|" $(srcdir)/udisks2.service.in > udisks2.service
+ endif
+ 
+ udevrulesdir = $(udevdir)/rules.d
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
deleted file mode 100644
index a3efc5160..000000000
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
-
-DEPENDS = "acl libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native libxslt-native"
-DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-
-RDEPENDS_${PN} = "acl"
-
-SRC_URI = "http://udisks.freedesktop.org/releases/udisks-${PV}.tar.bz2 \
-           file://non-gnu-libc.patch \
-"
-SRC_URI[md5sum] = "501d11c243bd8c6c00650474cd2afaab"
-SRC_URI[sha256sum] = "da416914812a77e5f4d82b81deb8c25799fd3228d27d52f7bf89a501b1857dda"
-
-CVE_PRODUCT = "udisks"
-
-inherit autotools systemd gtk-doc gobject-introspection
-
-S = "${WORKDIR}/udisks-${PV}"
-
-EXTRA_OECONF = "--disable-man --disable-gtk-doc"
-
-FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
-                ${datadir}/dbus-1/ \
-                ${datadir}/polkit-1 \
-                ${nonarch_base_libdir}/udev/* \
-                ${exec_prefix}${nonarch_base_libdir}/udisks2/* \
-"
-
-PACKAGES =+ "${PN}-libs"
-
-FILES_${PN} += "${datadir}/bash-completion"
-FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
-
-FILES_${PN}-dbg += "${exec_prefix}${nonarch_base_libdir}/udisks2/.debug"
-
-SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb b/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
new file mode 100644
index 000000000..4d22afd0d
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
@@ -0,0 +1,49 @@
+SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
+
+DEPENDS = " \
+    acl \
+    libatasmart \
+    polkit \
+    libgudev \
+    dbus-glib \
+    glib-2.0 \
+    libblockdev \
+    intltool-native \
+    gnome-common-native \
+    libxslt-native \
+"
+DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
+RDEPENDS_${PN} = "acl"
+
+SRC_URI = " \
+    git://github.com/storaged-project/udisks.git \
+    file://0001-data-fix-out-of-tree-build.patch \
+    file://non-gnu-libc.patch \
+"
+SRCREV = "b6471f2e99f6aa1133af0de658f1fa05c748932c"
+S = "${WORKDIR}/git"
+
+CVE_PRODUCT = "udisks"
+
+inherit autotools systemd gtk-doc gobject-introspection
+
+EXTRA_OECONF = "--disable-man --disable-gtk-doc"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1/ \
+    ${datadir}/polkit-1 \
+    ${datadir}/bash-completion \
+    ${libdir}/polkit-1/extensions/*.so \
+    ${nonarch_base_libdir}/udev/* \
+    ${exec_prefix}${nonarch_base_libdir}/udisks2/* \
+    ${systemd_system_unitdir} \
+"
+
+PACKAGES =+ "${PN}-libs"
+FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.14.3


