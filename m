Return-Path: <dmitri.vorobiev@movial.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id D697A74D7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 14:53:11 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id t16-v6so13129349wrm.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=movial-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Atefd4OFReDQUpfwsRtbER5V/J/2fcO8gtbY8QIGhjA=;
	b=OWHuUjQWoHxZJrUlO6uZeJiOPjS6ZRPtFrOVDcbySHc3QIpE8sVL3B3hK/PXWh3Lqz
	mQpOJyoDhJycQhMgbeZp1h1AulVS3MWMBOz63D2nz0YzqTG4TdHU3sdc5cUIMN5GUQck
	vEZdUYhQ5XrD7guIWZcAeS1EmUDT3YPnWBV/FdLlhb6WZ02diT1axTK0G0UBC8Fej29O
	iSOyRawflOqQ7BpQjUctE4uCUyuNfo5OPtOtf1wr9anEXpwTq9NS17RNcNmSsNgZkGKL
	O/Fp/uufUudDK5/G/9ViWC9Qvw88PFl22c0FzBUznJWQ2Qc2D6HWw50gMxI5Xf2mRA0A
	fvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Atefd4OFReDQUpfwsRtbER5V/J/2fcO8gtbY8QIGhjA=;
	b=LcNA8lQiA0dEKCNeeKgGX94tnqk5xeTOfIw7Uh1ef/61VFParLdMBnJ90fDP2obLgK
	lu9cMa88+yzZJeeTii2a5AzbXrsjSSSEVVPCMDiQTtvHq6FAX+dGWrOnXgUPEEy4wsYh
	s+4nyhRDL/iI8+kTT+Nt5gzCyyiqj/m/iyqcJrQ5SBFSe2+UhWv9xDccBNUrfZSMc5C9
	TBOBXOh5qRsA804aYtwj09O6A59lcssnT/Hm5oZvWPBCIrsJwFDdcR4QhthxYdXD2bI4
	GDAdWS77cpa5N4pmhWBYbHUN4qQ5juLRExDz7jc41wvxKNIzGtc3nbrPL/3Xwbo7YLPR
	DNZg==
X-Gm-Message-State: ALKqPweAPHgDbZE0y8boK0aW7i0srw/cCzq5l2t4dIa0vcnGuKFPqdX7
	cDIU5aZHlBxjXMUio6deACUxZJ2cbAY43g==
X-Google-Smtp-Source: AB8JxZoJVrhgCnjT/u6aA3CTTsUIbxJq0tzomhzGQobm38dRFuItu//9hMHiFsZKNjXDHYNNeTIbpg==
X-Received: by 2002:a5d:410b:: with SMTP id
	l11-v6mr10851446wrp.88.1526914392179; 
	Mon, 21 May 2018 07:53:12 -0700 (PDT)
Received: from euromake.fi (euromake.fi. [151.80.147.128])
	by smtp.gmail.com with ESMTPSA id
	90-v6sm13945573wrl.79.2018.05.21.07.53.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 May 2018 07:53:11 -0700 (PDT)
From: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 May 2018 17:52:54 +0300
Message-Id: <1526914374-27705-1-git-send-email-dmitri.vorobiev@movial.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <49c90165-022b-38b9-fec7-79c492777951@gmail.com>
References: <49c90165-022b-38b9-fec7-79c492777951@gmail.com>
Subject: [PATCH 1/1] [meta-oe] usb-modeswitch: Upgrade to version 2.5.1
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
X-List-Received-Date: Mon, 21 May 2018 14:53:12 -0000

Use a later version of usb-modeswitch (2.5.1) and
usb-modeswitch-data (20170806).

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
---
 .../usb-modeswitch/usb-modeswitch-data_20170205.bb | 19 ---------------
 .../usb-modeswitch/usb-modeswitch-data_20170806.bb | 19 +++++++++++++++
 .../usb-modeswitch/usb-modeswitch_2.5.0.bb         | 27 ----------------------
 .../usb-modeswitch/usb-modeswitch_2.5.1.bb         | 27 ++++++++++++++++++++++
 4 files changed, 46 insertions(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
 create mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
 delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
 create mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
deleted file mode 100644
index eeed5e2..0000000
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170205.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Data files for usbmodeswitch"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit allarch
-
-DEPENDS += "tcl-native"
-
-SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "0cc107cd0c4c83df0d9400c999e21dfd"
-SRC_URI[sha256sum] = "e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40a1a07d01662738d1"
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-}
-
-RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
-FILES_${PN} += "${base_libdir}/udev/rules.d/ \
-                ${datadir}/usb_modeswitch"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
new file mode 100644
index 0000000..eeed5e2
--- /dev/null
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Data files for usbmodeswitch"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit allarch
+
+DEPENDS += "tcl-native"
+
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
+SRC_URI[md5sum] = "0cc107cd0c4c83df0d9400c999e21dfd"
+SRC_URI[sha256sum] = "e2dcfd9d28928d8d8f03381571a23442b3c50d48d343bc40a1a07d01662738d1"
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"
+FILES_${PN} += "${base_libdir}/udev/rules.d/ \
+                ${datadir}/usb_modeswitch"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
deleted file mode 100644
index ac0df8b..0000000
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.0.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "libusb1"
-
-SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "38ad5c9d70e06227a00361bdc2b1e568"
-SRC_URI[sha256sum] = "31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0ce1e36a614d687633"
-
-inherit pkgconfig systemd
-
-SYSTEMD_SERVICE_${PN} = "usb_modeswitch@.service"
-
-EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
-
-FILES_${PN} = "${bindir} ${sysconfdir} ${nonarch_base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
-RDEPENDS_${PN} = "tcl"
-RRECOMMENDS_${PN} = "usb-modeswitch-data"
-
-do_install() {
-    oe_runmake DESTDIR=${D} install
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}/${systemd_unitdir}/system
-        install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_unitdir}/system
-    fi
-}
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
new file mode 100644
index 0000000..ac0df8b
--- /dev/null
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "libusb1"
+
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
+SRC_URI[md5sum] = "38ad5c9d70e06227a00361bdc2b1e568"
+SRC_URI[sha256sum] = "31c0be280d49a99ec3dc0be3325bef320d9c04b50714ef0ce1e36a614d687633"
+
+inherit pkgconfig systemd
+
+SYSTEMD_SERVICE_${PN} = "usb_modeswitch@.service"
+
+EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
+
+FILES_${PN} = "${bindir} ${sysconfdir} ${nonarch_base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
+RDEPENDS_${PN} = "tcl"
+RRECOMMENDS_${PN} = "usb-modeswitch-data"
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_unitdir}/system
+    fi
+}
-- 
2.7.4


