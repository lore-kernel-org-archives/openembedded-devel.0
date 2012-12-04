Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi2I-00024s-Vs
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:15:03 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1925797eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DDsTIXtI9VjrS+uFpdB7Z58BmRGmt2Hc5NSHb5XtKDY=;
	b=ryVgxC8Rh5MUb8a45f2xpNIkXp+NbpJJZS2hxxO/ZXQW7OAV5k7SjtcUYsqsnFknvF
	hz7ptWBRUfNdhKcQtL2iuUuxIyO7Fcoy9OZQcdb89x4kCGoXRURQyB8/mdZwhDq9oB1X
	afHuL0WpOTrdYAtER0zzS77X+sQBpVc6KpQ9UzMtn66bpIYOYgfcY9GgNv+iLcMkHdvC
	GVaRvtTEz1FROksiL512ijsnLvfGWL0/FPh5u8fCMvP31LjRuZF39sIzKdAkocBvkGNo
	ulzfXSRxck5PD24JpLhEIMdge+4fhj7xe+gU0Q8RBeKYgCon2ktFDQFI9/9BrCt2rhpn
	Vttg==
Received: by 10.14.178.196 with SMTP id f44mr42942952eem.14.1354586443379;
	Mon, 03 Dec 2012 18:00:43 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 44sm25506687eek.0.2012.12.03.18.00.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:00:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:41 +0100
Message-Id: <9f784b4e6ab5fb6ecaa1507013bf39bb79bf149c.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/58] usb-modeswitch: upgrade to 1.2.5
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
X-List-Received-Date: Tue, 04 Dec 2012 02:15:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-usbmodeswitch-leave-stripping-to-packager.patch |  7 ++-----
 ...2-usb-modeswitch-leave-script-munging-to-recipe.patch | 16 +++++-----------
 .../{usb-modeswitch_1.2.2.bb => usb-modeswitch_1.2.5.bb} |  6 +++---
 3 files changed, 10 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_1.2.2.bb => usb-modeswitch_1.2.5.bb} (78%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch
index 063aba5..0cbacf0 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-usbmodeswitch-leave-stripping-to-packager.patch
@@ -15,15 +15,12 @@ diff --git a/Makefile b/Makefile
 index 2072976..a71780a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -46,7 +46,7 @@ distclean:
+@@ -46,7 +46,7 @@
  	cd jim && $(MAKE) distclean
  
- install-common:
+ install-common: all
 -	install -D -s --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
 +	install -D --mode=755 usb_modeswitch $(SBINDIR)/usb_modeswitch
  	install -D --mode=755 usb_modeswitch.sh $(UDEVDIR)/usb_modeswitch
  	install -D --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
  	install -D --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
--- 
-1.7.2.5
-
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch
index d6f2ff2..f9396b2 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0002-usb-modeswitch-leave-script-munging-to-recipe.patch
@@ -15,7 +15,7 @@ diff --git a/Makefile b/Makefile
 index a71780a..a26b8de 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -51,23 +51,12 @@ install-common:
+@@ -51,20 +51,9 @@
  	install -D --mode=644 usb_modeswitch.conf $(ETCDIR)/usb_modeswitch.conf
  	install -D --mode=644 usb_modeswitch.1 $(MANDIR)/usb_modeswitch.1
  	install -d $(DESTDIR)/var/lib/usb_modeswitch
@@ -32,14 +32,8 @@ index a71780a..a26b8de 100644
 -	sed 's_!/usr/bin/tclsh_!'"$$SHELL"'_' <usb_modeswitch.tcl >usb_modeswitch_dispatcher
  	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
  
- install-binary:
- 	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
- 
--install: all install-common install-script
-+install: all install-common
+-install: install-common install-script
++install: install-common
  
- install-shared: shared install-common install-binary
- 
--- 
-1.7.2.5
-
+ install-shared: dispatcher-dynamic install-common
+ 	install -D -s --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.2.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb
similarity index 78%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.2.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb
index 2e19370..b0c9e95 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.2.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_1.2.5.bb
@@ -7,14 +7,14 @@ DEPENDS = "virtual/libusb0"
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${PV}.tar.bz2 \
            file://0001-usbmodeswitch-leave-stripping-to-packager.patch \
            file://0002-usb-modeswitch-leave-script-munging-to-recipe.patch"
-SRC_URI[md5sum] = "4f3d3b9342b59b488089a8a81abda3ae"
-SRC_URI[sha256sum] = "b46b08b0899bbacfe9081ed907f8d0f3fac9e647c4d0f3705c85804cb3a431e0"
+SRC_URI[md5sum] = "c393603908eceab95444c5bde790f6f0"
+SRC_URI[sha256sum] = "ce47a3dec3e4c93e0a2fcea64278d0e289e6e78d8e1381c54f03986e443ab90f"
 
 do_install() {
 	sed 's_!/usr/bin_!'"${bindir}"'_' <usb_modeswitch.tcl >usb_modeswitch_dispatcher
 	oe_runmake install DESTDIR=${D}
 }
 
-FILES_${PN} = "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswitch ${sbindir}"
+FILES_${PN} = "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
 RDEPENDS_${PN} = "tcl"
 RRECOMMENDS_${PN} = "usb-modeswitch-data"
-- 
1.8.0



