Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWnYZ-0001lW-Fl
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 14:52:08 +0200
Received: by mail-ea0-f172.google.com with SMTP id z16so954495ead.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 05:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=tHxyZqzlwrRleqxeeKg1fpcp5Hx9rtAKPkzdHG7YBxQ=;
	b=wicC2pUo15SPDNcKlWu4cfD5xZo4rJsCo4ykb8XL+131GRR9jaaS+ExIrwzsWJT8Em
	g9ge/+tpli/LKrNXNsVC64l2mvEptDWxa424q4w+/D00ftuKVjPwfnsUETPIFtCDxygp
	YMV5bc4JbSX7ToYthYiJjPpt1lddyT9iAxsZRFHzi/40Cjtwuc14+2ntFuBXtkntZzM1
	Zhaf5WpJhsHFDRx6pjvIXA3h3tEAnlaSW5fqtT+YtZ6O5ba9wk8wzZAhsQmvoaWyvtQ8
	EJ2j5neHT8xKRnnXoaR0g7rU5PSY+dtvHsEaZoEyzfJgH46BEyrK3FJ2ng9i2Ihp/j0W
	V+sA==
X-Received: by 10.15.41.2 with SMTP id r2mr63160346eev.23.1367238833353;
	Mon, 29 Apr 2013 05:33:53 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204]) by mx.google.com with ESMTPSA id
	r10sm14784232eez.10.2013.04.29.05.33.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 05:33:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 14:31:24 +0200
Message-Id: <1367238685-16855-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome 4/5] gnome-power-manager: fix compile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2013 12:52:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* on some machines help crashed with:
| xsltproc -o gnome-power-manager-C.omf --stringparam db2omf.basename gnome-power-manager --stringparam db2omf.format 'docbook' --stringparam db2omf.dtd "-//OASIS//DTD DocBook XML V4.3//EN" --stringparam db2omf.lang C --stringparam db2omf.omf_dir "/usr/share/omf" --stringparam db2omf.help_dir "/usr/share/gnome/help" --stringparam db2omf.omf_in "/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnome-power-manager/2.32.0-r2/gnome-power-manager-2.32.0/help/gnome-power-manager.omf.in"  /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config --variable db2omf gnome-doc-utils` C/gnome-power-manager.xml || { rm -f "gnome-power-manager-C.omf"; exit 1; }
| unable to parse fr/gnome-power-manager.xml

* disable man in recipe did not work

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-Makefile.am-don-t-build-help-man.patch    |   37 ++++++++++++++++++++
 .../gnome-power-manager_2.32.0.bb                  |   11 +++---
 2 files changed, 42 insertions(+), 6 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager-2.32.0/0001-Makefile.am-don-t-build-help-man.patch

diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager-2.32.0/0001-Makefile.am-don-t-build-help-man.patch b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager-2.32.0/0001-Makefile.am-don-t-build-help-man.patch
new file mode 100644
index 0000000..d6d49bb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager-2.32.0/0001-Makefile.am-don-t-build-help-man.patch
@@ -0,0 +1,37 @@
+From 3ed15a3c6ae4ab94c7e3af306644bb5d7f3fd1fa Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 29 Apr 2013 13:08:10 +0200
+Subject: [PATCH] Makefile.am: don't build help/man
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+help crashes with:
+
+| xsltproc -o gnome-power-manager-C.omf --stringparam db2omf.basename gnome-power-manager --stringparam db2omf.format 'docbook' --stringparam db2omf.dtd "-//OASIS//DTD DocBook XML V4.3//EN" --stringparam db2omf.lang C --stringparam db2omf.omf_dir "/usr/share/omf" --stringparam db2omf.help_dir "/usr/share/gnome/help" --stringparam db2omf.omf_in "/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gnome-power-manager/2.32.0-r2/gnome-power-manager-2.32.0/help/gnome-power-manager.omf.in"  /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config --variable db2omf gnome-doc-utils` C/gnome-power-manager.xml || { rm -f "gnome-power-manager-C.omf"; exit 1; }
+| unable to parse fr/gnome-power-manager.xml
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Makefile.am |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 005b8a0..5b9e318 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -5,9 +5,7 @@ SUBDIRS = 						\
+ 	src						\
+ 	po						\
+ 	docs						\
+-	man						\
+ 	data						\
+-	help						\
+ 	policy						\
+ 	tools
+ 
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index c11d6ea..aac6b6c 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -2,14 +2,17 @@ DESCRIPTION = "Power management daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "glib-2.0 gtk+ gconf libgnome-keyring dbus dbus-glib libnotify libwnck cairo libunique xrandr virtual/libx11 libxrender libcanberra upower"
 RRECOMMENDS_${PN} += "gnome-keyring"
 
 inherit gnome
 
-SRC_URI += "file://sysrooted-pkg-config.patch"
+SRC_URI += " \
+    file://sysrooted-pkg-config.patch \
+    file://0001-Makefile.am-don-t-build-help-man.patch \
+"
 
 SRC_URI[archive.md5sum] = "9a08e85dce3ffb90775f15e3bda4adda"
 SRC_URI[archive.sha256sum] = "17fa301bf7e133285c0e054ae3be2b0f690c48f59b09f67e04d6ed339b330476"
@@ -23,10 +26,6 @@ EXTRA_OECONF = " --disable-scrollkeeper \
                  ac_cv_header_X11_extensions_dpms_h=yes \
 "
 
-do_configure_prepend() {
-    sed -i -e 's:    man    ::g' ${S}/Makefile.am
-}
-
 do_configure_append() {
     rm config.log
     # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
-- 
1.7.6.5



