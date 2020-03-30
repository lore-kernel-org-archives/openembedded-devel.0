Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.43919.1585543721315317350
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 21:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PHWp/F3F;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id j29so8110367pgl.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 21:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Dweze26u+xKo1enXQA1Fvexfts/9zy7u1hpc1CWHnk=;
        b=PHWp/F3FXwlqdvF4BAAGOJSnDOkSMG07i1SpT15s8CtQ1gzftZWMV60TaowYGwKyRD
         NiAFDxLRXFNeC6oFxj3S/JwgTTuIeYZIU6zCBGE3QRIVkzsWEI9UMQDWHDS/ZJTLLMLF
         eYUxKtIoQkZyoL5Ba8WYLzFqvDwRO/QcwkpyhTjX5RUShbQQroP4zUce27FMlEEnefIR
         qn63NItb5N8tV2SGJnFd4Ca7dVO/kypwa45Kuf7z+RdaFuB5ScYj6yEXOOkhI4cbs0MQ
         0+dYXuQ8pk7MMsFqTwor/+pkDy28GPmi8uzvI+wQg7c8FHNuAocr+53CtCYQ6IUHSRr4
         0Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Dweze26u+xKo1enXQA1Fvexfts/9zy7u1hpc1CWHnk=;
        b=Cazl9zMU5Zb74HySq+G266qLjPHNXG0w3COwyzmFchm8tIOV+pjD9nT/2OFcREDCqU
         9J2edwd1ORAb4OfWuGWYYP1p2SWlOwCnMDMxiDGkRs7gCxtEMxCZmKJZ+2fTO+Gca9x+
         RRILbRBZbK9lfeaTGEaIJCfa8uufZ/L81vglXMNCNS2CkspM8iPMsomLmhMaYfpY5Msj
         qqHrPttHu2yA67fhU09gpavhCRCpjiks9pl1FQX+50RZbOLosO0O94kgeeV2IuOf4nr/
         uYGHBn9iOY5/9xe7OqtgJicRrUVXdYT0i6lUHelOAYCA21LVQm939KOcn1cpWEEKCPFh
         aLOw==
X-Gm-Message-State: ANhLgQ3NeQVIAy9sGOlzSezcXjcn/oyKT91wPR2WF7MeyD96bKaYCmj7
	Qltp/JNKkziLahjnfbMiwM+SwNFTcgY=
X-Google-Smtp-Source: ADFU+vsdseQZ4hbanJM5KHiSCjEtWaM/HmK+DbkkOieo8cdipVp0Eev3UsvUsULusygwxmWDdgZPwA==
X-Received: by 2002:a65:53c9:: with SMTP id z9mr9966709pgr.405.1585543720398;
        Sun, 29 Mar 2020 21:48:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id fa16sm9130949pjb.39.2020.03.29.21.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 21:48:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] packagegroups: Add bbappends for python and perl layer requiring recipes
Date: Sun, 29 Mar 2020 21:48:52 -0700
Message-Id: <20200330044852.1727500-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330044852.1727500-1-raj.khem@gmail.com>
References: <20200330044852.1727500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add this bbappends in dynamic layers
Move the main recipe back to meta-oe main recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroup-meta-oe.bbappend             | 20 +++++++++++++++++++
 .../packagegroup-meta-oe.bbappend             |  2 --
 .../packagegroups/packagegroup-meta-oe.bb     | 11 +++++-----
 3 files changed, 25 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
 rename meta-oe/{dynamic-layers/meta-python => }/recipes-core/packagegroups/packagegroup-meta-oe.bb (97%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
new file mode 100644
index 0000000000..50da5e5d0d
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -0,0 +1,20 @@
+RDEPENDS_packagegroup-meta-oe-devtools += "\
+    python3-distutils-extra \
+    rwmem \
+    speedtest-cli \
+    mongodb \
+"
+
+RDEPENDS_packagegroup-meta-oe-connectivity += "\
+    lirc \
+"
+
+RDEPENDS_packagegroup-meta-oe-extended += "\
+    lcdproc \
+    mozjs \
+"
+RDEPENDS_packagegroup-meta-oe-support += "\
+    smem \
+"
+RDEPENDS_packagegroup-meta-oe-extended_remove_libc-musl = "lcdproc"
+
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index e7b43204b6..69bc788a86 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -1,3 +1 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
 RDEPENDS_packagegroup-meta-oe-support += "debsums"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
similarity index 97%
rename from meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bb
rename to meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index f4931aeeba..fabb45c88d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -62,7 +62,7 @@ RDEPENDS_packagegroup-meta-oe-benchmarks_remove_riscv32 = "libhugetlbfs"
 RDEPENDS_packagegroup-meta-oe-connectivity ="\
     gammu hostapd irssi krb5 libev libimobiledevice \
     libmbim libmtp libndp libqmi libtorrent \
-    libuv libwebsockets linuxptp lirc loudmouth \
+    libuv libwebsockets linuxptp loudmouth \
     modemmanager mosh  \
     paho-mqtt-c phonet-utils rabbitmq-c rfkill rtorrent \
     ser2net smstools3 telepathy-glib thrift \
@@ -115,7 +115,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     libubox log4cplus lshw ltrace lua mcpp memstat mercurial \
     mpich msgpack-c nlohmann-json openocd pax-utils \
     ipc-run libdbd-mysql-perl libdbi-perl libio-pty-perl php \
-    protobuf protobuf-c python3-distutils-extra \
+    protobuf protobuf-c \
     rapidjson serialcheck sip3 tclap uftrace uw-imap valijson \
     xmlrpc-c yajl yasm \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
@@ -136,12 +136,12 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     byacc cfengine cfengine-masterfiles cmpi-bindings \
     ddrescue dialog dumb-init enscript fluentbit \
     haveged hexedit hiredis hplip hwloc indent iotop isomd5sum \
-    jansson konkretcmpi lcdproc libblockdev libcec libconfig \
+    jansson konkretcmpi libblockdev libcec libconfig \
     libdivecomputer libplist libusbmuxd \
     liblockfile liblogging liblognorm libmodbus libmodbus \
     libpwquality libqb libuio \
     lockfile-progs logwatch lprng mailx md5deep \
-    mozjs mraa nana nicstat \
+    mraa nana nicstat \
     p7zip p8platform libfile-fnmatch-perl \
     rarpd redis rrdtool libfastjson librelp rsyslog sanlock \
     sblim-cmpi-devel sblim-sfc-common sblim-sfcc \
@@ -163,7 +163,6 @@ RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64 = "upm mraa"
 RDEPENDS_packagegroup-meta-oe-extended_remove_powerpc64le = "upm mraa"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv64 = "upm mraa tiptop"
 RDEPENDS_packagegroup-meta-oe-extended_remove_riscv32 = "upm mraa tiptop"
-RDEPENDS_packagegroup-meta-oe-extended_remove_libc-musl = "lcdproc"
 
 RDEPENDS_packagegroup-meta-oe-gnome ="\
     atkmm gnome-common gnome-doc-utils-stub gtkmm \
@@ -256,7 +255,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     pngcheck poco poppler poppler-data portaudio-v19 pps-tools \
     pv pxaregs raptor2 rdfind read-edid rsnapshot \
     satyr sdparm pty-forward-native serial-forward \
-    sg3-utils sharutils smem spitools srecord ssiapi stm32flash \
+    sg3-utils sharutils spitools srecord ssiapi stm32flash \
     syslog-ng system-config-keyboard tbb thin-provisioning-tools tokyocabinet \
     tree uhubctl unixodbc uriparser usb-modeswitch \
     usb-modeswitch-data uthash utouch-evemu utouch-frame \
-- 
2.26.0

