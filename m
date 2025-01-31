Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A410BC02192
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 13:52:21 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.19097.1738331539562550548
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jan 2025 05:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MVIxYb1/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1185614f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 05:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738331537; x=1738936337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzAQfvRvknen+npskCOaTwYnJYguIqWigXBemehDjZg=;
        b=MVIxYb1/ECNpiWdNaZmpEZNWOunp3b/8i4O9oy8DPiseMPt5CBz2ntoLmMufUhH1kR
         cSq0co6Xca48VoaUImVhx4mnEKc8n9yKSHfPgNjMO/XTpcsugByp0PcCJOAYBlO3Thq0
         eX3PDBABXzkNB8/lU5PSiCuzmuSuKOGPkxh+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738331537; x=1738936337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vzAQfvRvknen+npskCOaTwYnJYguIqWigXBemehDjZg=;
        b=cJd/24ZD27XCjqYPCJc4khJU0nLjsMMZcYgm2Rwqwg8msdNkHSP6BLLQeRAs0X5z8g
         FcNnlj8ATHdBbllf6pzvq2S849NT9DfVvaHwMgre84TMJX+vgAIqHM72Yq/lghLuShir
         Wl/RZ6+4pYQ87rQ6sNsfQu9QfXtSUITYO7CrikG05zXc0fCaiNNBrNLwmqmdGinWjLE3
         hRRDGbJHhcBSYt92xftde6MgaMvGOCKi5G8QAFjKlQA031jdAtP8JyfExuu24URKDX5+
         e88f8G9OYIpdPGrZvCQw0IGcNSRmxkLuoLdy5qa0yt3eDOFOTSu35uqXfbfPMwF9zhXa
         X4xw==
X-Gm-Message-State: AOJu0YyP0FfC5qnqos+Svdo2IO+HclaG9AzGflslnQax/YJ3o4vW401i
	SuLkeNDRdUWZeetea/DhJXUVGYEpZWbcZ0hqEU3GDnThoWBFk9v/gBtcoUv1q5d5g7NJNL7TjDe
	8
X-Gm-Gg: ASbGncvDCtHF62fyYFMFe3u/3E//05opj3KyvJVwRJKHI+RiRgNMAU4Dtrek5bo6lan
	NWZJOeIcvhoPyjrGu7qL2cIZwVS3b/oCG0WdpHY6qcoggxmznzYsCHKWj0GMYkvthag/KvIC29Z
	7fPLF/5PIH2UslXXK0p0jrRWrUiyvp/Ad6OpDmL5li2SwwKLpW+yQYXMjfvKNQ6ga87MFvFQUfP
	A3X9Fx7els6Mw9nvMBMiOObPhm084T9ga2ovt86Ge2tci/L0MkYnpCB8i9RPQ2qKer3oZt+p9m+
	WmfT9ABB+1G5O0c/u+zNBhFwtLfhPtRJdJnBVhvX8GP3
X-Google-Smtp-Source: AGHT+IFq+VuKGVnOZK2yjYrHBzn6IS/opZz3lSgRE0Fx2fDSoWBx1RMEhE5lpxwCXvQmFo9NlchDbA==
X-Received: by 2002:a5d:5288:0:b0:385:ed16:c91 with SMTP id ffacd0b85a97d-38c51b5df32mr7220857f8f.24.1738331535713;
        Fri, 31 Jan 2025 05:52:15 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bcf2:8577:8e76:da28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11fadbsm4642111f8f.44.2025.01.31.05.52.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 05:52:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH] recipes: Fix variable assignment whitespace
Date: Fri, 31 Jan 2025 13:52:13 +0000
Message-ID: <20250131135213.3058983-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 13:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115197

Recipes are much more readable with whitespace around the assignment operators.
Fix various assignments in meta-openembedded recipes to show this is definitely
the preferred formatting.

This fixes recipes with larger numbers of issues but there are just under 100
other references left to fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-filesystems/ifuse/ifuse_1.1.4.bb  |   2 +-
 .../recipes-utils/xfsprogs/xfsprogs_6.6.0.bb  |   6 +-
 .../rygel/rygel_0.44.1.bb                     |  16 +-
 .../recipes-multimedia/libao/libao_1.2.0.bb   |   2 +-
 .../recipes-multimedia/musicpd/mpd_0.23.16.bb |   2 +-
 .../recipes-connectivity/rdate/rdate_1.5.bb   |   2 +-
 .../samba/samba_4.19.8.bb                     |  14 +-
 .../recipes-devtools/libcoap/libcoap_4.3.4.bb |   2 +-
 .../recipes-support/libldb/libldb_2.8.1.bb    |   4 +-
 .../libtevent/libtevent_0.16.1.bb             |   4 +-
 .../mdio-tools/mdio-netlink_1.3.1.bb          |   2 +-
 .../include/ptest-packagelists-meta-oe.inc    |   2 +-
 .../recipes-devtools/nanopb/nanopb.inc        |   4 +-
 .../recipes-multimedia/kmsxx/kmsxx_git.bb     |   2 +-
 .../recipes-benchmark/linpack/linpack_1.0.bb  |   2 +-
 .../recipes-devtools/ssd1306/ssd1306_git.bb   |   2 +-
 .../recipes-extended/hplip/hplip_3.22.10.bb   |   2 +-
 meta-oe/recipes-extended/minio/src_uri.inc    | 204 +++++++++---------
 meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb |   6 +-
 .../xorg-driver/xf86-input-tslib_1.1.1.bb     |   2 +-
 .../edid-decode/edid-decode_git.bb            |   2 +-
 .../recipes-support/mcelog/mce-test_git.bb    |   2 +-
 .../recipes-support/opencv/opencv_4.10.0.bb   |   8 +-
 .../opentelemetry/opentelemetry-cpp_1.17.0.bb |  15 +-
 meta-oe/recipes-support/sdparm/sdparm_1.12.bb |   2 +-
 .../vboxguestdrivers_7.1.4.bb                 |   4 +-
 .../websocketpp/websocketpp_0.8.2.bb          |   2 +-
 .../python-txws/python3-txws_0.9.1.bb         |   2 +-
 .../python/python3-h5py_3.12.1.bb             |   2 +-
 .../python/python3-jsbeautifier_1.15.1.bb     |   2 +-
 .../python/python3-pcodedmp_1.2.6.bb          |   2 +-
 .../python/python3-pdm-backend_2.4.3.bb       |   2 +-
 .../python/python3-pylint_3.3.3.bb            |   4 +-
 .../python/python3-rarfile_4.2.bb             |   2 +-
 .../python/python3-redis_5.2.1.bb             |   2 +-
 .../python/python3-unoconv_0.9.0.bb           |   2 +-
 .../python/python3-wand_0.6.13.bb             |   2 +-
 .../python-rich/python3-rich_13.9.4.bb        |   2 +-
 38 files changed, 170 insertions(+), 171 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
index c9702eb93e..5fbeab53d8 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
@@ -1,7 +1,7 @@
 SUMMARY = "A fuse filesystem to access the contents of an iPhone or iPod Touch"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
-HOMEPAGE ="http://www.libimobiledevice.org/"
+HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "fuse libimobiledevice"
 
diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
index 07c5e97dbb..907b875718 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.6.0.bb
@@ -44,9 +44,9 @@ PACKAGECONFIG ??= "blkid"
 
 PACKAGECONFIG[blkid] = "--enable-blkid=yes,--enable-blkid=no,util-linux"
 
-export DEBUG="-DNDEBUG"
-export BUILD_VERBOSE="1"
-export tagname="CC"
+export DEBUG = "-DNDEBUG"
+export BUILD_VERBOSE = "1"
+export tagname = "CC"
 
 EXTRA_OEMAKE = "DIST_ROOT='${D}'"
 
diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
index b5329a9a36..9bede50233 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
@@ -40,14 +40,14 @@ PACKAGECONFIG[tracker3] = ""
 PACKAGECONFIG[gtk+3] = ",-Dgtk=disabled,gtk+3"
 
 RYGEL_PLUGINS = ""
-RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'external', ',external', '', d)}"
-RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'mpris', ',mpris', '', d)}"
-RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'ruih', ',ruih', '', d)}"
-RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'gst-launch', ',gst-launch', '', d)}"
-RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'lms', ',lms', '', d)}"
-RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'media-export', ',media-export', '', d)}"
-RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'tracker3', ',tracker3', '', d)}"
-RYGEL_PLUGINS:append ="${@bb.utils.contains('PACKAGECONFIG', 'playbin', ',playbin', '', d)}"
+RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'external', ',external', '', d)}"
+RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'mpris', ',mpris', '', d)}"
+RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'ruih', ',ruih', '', d)}"
+RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gst-launch', ',gst-launch', '', d)}"
+RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lms', ',lms', '', d)}"
+RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'media-export', ',media-export', '', d)}"
+RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tracker3', ',tracker3', '', d)}"
+RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'playbin', ',playbin', '', d)}"
 
 LIBV = "2.8"
 
diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index b30f398e87..233b890711 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.xiph.org/ao/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI="http://downloads.xiph.org/releases/ao/${BP}.tar.gz"
+SRC_URI = "http://downloads.xiph.org/releases/ao/${BP}.tar.gz"
 SRC_URI[md5sum] = "9f5dd20d7e95fd0dd72df5353829f097"
 SRC_URI[sha256sum] = "03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf"
 
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
index bf95f41b26..812437a98c 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.16.bb
@@ -2,7 +2,7 @@ SUMMARY = "Music Player Daemon"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-HOMEPAGE ="http://www.musicpd.org"
+HOMEPAGE = "http://www.musicpd.org"
 
 inherit meson useradd systemd pkgconfig
 
diff --git a/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb b/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
index 67e7c1c615..5c9e0c8643 100644
--- a/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
+++ b/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The rdate utility retrieves the date and time from \
   time of the machine that you queried. \
 "
 
-HOMEPAGE= "https://www.aelius.com/njh/rdate/"
+HOMEPAGE = "https://www.aelius.com/njh/rdate/"
 SECTION = "Applications/System"
 
 LICENSE = "GPL-2.0-only"
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
index 09d5608df0..beff73b1b3 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
@@ -12,7 +12,7 @@ ${SAMBA_MIRROR}    http://mirror.internode.on.net/pub/samba \n \
 ${SAMBA_MIRROR}    http://www.mirrorservice.org/sites/ftp.samba.org \n \
 "
 
-export PYTHONHASHSEED="1"
+export PYTHONHASHSEED = "1"
 
 SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://smb.conf \
@@ -69,7 +69,7 @@ SYSTEMD_AUTO_ENABLE:${PN}-ad-dc = "disable"
 
 #cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
 #to cross Popen
-export WAF_NO_PREFORK="yes"
+export WAF_NO_PREFORK = "yes"
 
 # Use krb5. Build active domain controller.
 #
@@ -95,16 +95,16 @@ PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
 PACKAGECONFIG[ad-dc] = "--with-experimental-mit-ad-dc,--without-ad-dc,python3-markdown python3-dnspython,"
 PACKAGECONFIG[mitkrb5] = "--with-system-mitkrb5 --with-system-mitkdc=/usr/sbin/krb5kdc,,krb5,"
 
-SAMBA4_IDMAP_MODULES="idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
-SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
-SAMBA4_AUTH_MODULES="auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4"
-SAMBA4_MODULES="${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODULES}"
+SAMBA4_IDMAP_MODULES = "idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
+SAMBA4_PDB_MODULES = "pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
+SAMBA4_AUTH_MODULES = "auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4"
+SAMBA4_MODULES = "${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODULES}"
 
 # These libraries are supposed to replace others supplied by packages, but decorate the names of
 # .so files so there will not be a conflict.  This is not done consistantly, so be very careful
 # when adding to this list.
 #
-SAMBA4_LIBS="heimdal,NONE"
+SAMBA4_LIBS = "heimdal,NONE"
 
 EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=/run \
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
index 2f5d192a77..8a114411fa 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "A C implementation of the Constrained Application Protocol"
 DESCRIPTION = "libcoap implements a lightweight application-protocol for \
 devices that are constrained their resources such as computing power, \
 RF range, memory, bandwith, or network packet sizes."
-HOMEPAGE ="https://libcoap.net/"
+HOMEPAGE = "https://libcoap.net/"
 
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1978dbc41673ab1c20e64b287c8317bc"
diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.1.bb b/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
index 29ff2cf6f2..2040d016e5 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-3.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
 DEPENDS += "libtdb libtalloc libtevent popt cmocka"
 RDEPENDS:pyldb += "python3"
 
-export PYTHONHASHSEED="1"
+export PYTHONHASHSEED = "1"
 export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
@@ -42,7 +42,7 @@ S = "${WORKDIR}/ldb-${PV}"
 
 # Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
 # to cross Popen
-export WAF_NO_PREFORK="yes"
+export WAF_NO_PREFORK = "yes"
 
 EXTRA_OECONF += "--disable-rpath \
                  --disable-rpath-install \
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb b/meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb
index 0a37d7977d..e1089d091e 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.16.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-3.0-or-later"
 DEPENDS += "libtalloc libtirpc cmocka"
 RDEPENDS:python3-tevent = "python3"
 
-export PYTHONHASHSEED="1"
+export PYTHONHASHSEED = "1"
 export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
 
 SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
@@ -37,7 +37,7 @@ S = "${WORKDIR}/tevent-${PV}"
 
 # Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
 # to cross Popen
-export WAF_NO_PREFORK="yes"
+export WAF_NO_PREFORK = "yes"
 
 EXTRA_OECONF += "--disable-rpath \
                  --disable-rpath-install \
diff --git a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
index 3867b89052..9a00d66a52 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
+++ b/meta-networking/recipes-support/mdio-tools/mdio-netlink_1.3.1.bb
@@ -8,7 +8,7 @@ S = "${WORKDIR}/git"
 inherit module
 
 EXTRA_OEMAKE = "-C kernel/ KDIR=${STAGING_KERNEL_DIR}"
-MODULES_MODULE_SYMVERS_LOCATION="kernel"
+MODULES_MODULE_SYMVERS_LOCATION = "kernel"
 MODULES_INSTALL_TARGET = "install"
 
 RPROVIDES:${PN} += "kernel-module-mdio-netlink"
diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 7cb15b49c7..380c6dd3f6 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -67,7 +67,7 @@ PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
 PTESTS_SLOW_META_OE:append:x86-64 = " kernel-selftest"
 PTESTS_SLOW_META_OE:remove:libc-musl = "kernel-selftest"
 
-PTESTS_PROBLEMS_META_OE ="\
+PTESTS_PROBLEMS_META_OE = "\
     keyutils \
     libdbi-perl \
     libjcat \
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
index 8480ea5b0e..371d66bdfe 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
@@ -1,5 +1,5 @@
-DESCRIPTION="Protocol Buffers with small code size"
-LICENSE="Zlib"
+DESCRIPTION = "Protocol Buffers with small code size"
+LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 
 SRC_URI = "git://github.com/nanopb/nanopb.git;branch=maintenance_0.4;protocol=https"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
index cdba1a24d1..f37c63d316 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
@@ -31,5 +31,5 @@ do_install:append() {
     fi
 }
 
-FILES:${PN} ="${bindir} ${libdir}"
+FILES:${PN} = "${bindir} ${libdir}"
 FILES:${PN}-python += "${PYTHON_SITEPACKAGES_DIR}/*"
diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
index 086f84a706..fe540749b5 100644
--- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "LINPACK Benchmarks are a measure of a system's floating point com
 SUMMARY = "LINPACK is a software library for performing numerical linear algebra on digital computers"
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM ="file://${UNPACKDIR}/linpacknew.c;beginline=1;endline=23;md5=aa025e3bc44190c71e4c5e3b084fed87"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/linpacknew.c;beginline=1;endline=23;md5=aa025e3bc44190c71e4c5e3b084fed87"
 
 SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c \
            file://0001-linpack-Define-DP-only-when-SP-is-not-defined.patch \
diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
index f9e3679590..2c01e126ff 100644
--- a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
@@ -1,4 +1,4 @@
-SUMMARY="SSD1306 OLED I2C drive"
+SUMMARY = "SSD1306 OLED I2C drive"
 DESCRIPTION = "SSD1306 OLED I2C driver working in Linux"
 HOMEPAGE = "https://github.com/armlabs/ssd1306_linux"
 SECTION = "console/utils"
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
index 4ee333de33..ffc18d90c6 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -1,5 +1,5 @@
 SUMMARY = "HP Linux Imaging and Printing"
-LICENSE="GPL-2.0-only"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=20f2c819499cc2063e9a7b07b408815c"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
diff --git a/meta-oe/recipes-extended/minio/src_uri.inc b/meta-oe/recipes-extended/minio/src_uri.inc
index 5cdc69dfca..964dfab9dc 100644
--- a/meta-oe/recipes-extended/minio/src_uri.inc
+++ b/meta-oe/recipes-extended/minio/src_uri.inc
@@ -1,509 +1,509 @@
 # 	github.com/charmbracelet/bubbletea v0.19.3
 # [1] git ls-remote https://github.com/charmbracelet/bubbletea 3dc51789d11229a1fb00f137d02b50b04cac372b 
-SRCREV_bubbletea="3dc51789d11229a1fb00f137d02b50b04cac372b"
+SRCREV_bubbletea = "3dc51789d11229a1fb00f137d02b50b04cac372b"
 SRC_URI += "git://github.com/charmbracelet/bubbletea;name=bubbletea;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/charmbracelet/bubbletea"
 
 # 	github.com/cheggaaa/pb v1.0.29
 # [1] git ls-remote https://github.com/cheggaaa/pb e2a33cc368a206516cc95f7bdd9176db0b83f098 
-SRCREV_pb="e2a33cc368a206516cc95f7bdd9176db0b83f098"
+SRCREV_pb = "e2a33cc368a206516cc95f7bdd9176db0b83f098"
 SRC_URI += "git://github.com/cheggaaa/pb;name=pb;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cheggaaa/pb"
 
 # 	github.com/dustin/go-humanize v1.0.0
 # [1] git ls-remote https://github.com/dustin/go-humanize e673fa1ffc91213297a60d18a6f513aa74bced52 
-SRCREV_go-humanize="e673fa1ffc91213297a60d18a6f513aa74bced52"
+SRCREV_go-humanize = "e673fa1ffc91213297a60d18a6f513aa74bced52"
 SRC_URI += "git://github.com/dustin/go-humanize;name=go-humanize;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/dustin/go-humanize"
 
 # 	github.com/fatih/color v1.13.0
 # [1] git ls-remote https://github.com/fatih/color a05da93ebe62ca9fc6791d3376ec4dad01196448 
-SRCREV_color="a05da93ebe62ca9fc6791d3376ec4dad01196448"
+SRCREV_color = "a05da93ebe62ca9fc6791d3376ec4dad01196448"
 SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/color"
 
 # 	github.com/go-ole/go-ole v1.2.6
 # [1] git ls-remote https://github.com/go-ole/go-ole 8b1f7f90f6b1728609c9694f2cff140d34fd91f8 
-SRCREV_go-ole="8b1f7f90f6b1728609c9694f2cff140d34fd91f8"
+SRCREV_go-ole = "8b1f7f90f6b1728609c9694f2cff140d34fd91f8"
 SRC_URI += "git://github.com/go-ole/go-ole;name=go-ole;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-ole/go-ole"
 
 # 	github.com/goccy/go-json v0.8.1
 # [1] git ls-remote https://github.com/goccy/go-json de89bd3db67f2219c6183ec6febe2b5f7a6b06fb 
-SRCREV_go-json="de89bd3db67f2219c6183ec6febe2b5f7a6b06fb"
+SRCREV_go-json = "de89bd3db67f2219c6183ec6febe2b5f7a6b06fb"
 SRC_URI += "git://github.com/goccy/go-json;name=go-json;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/goccy/go-json"
 
 # 	github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
 # [1] git ls-remote https://github.com/google/shlex e7afc7fbc51079733e9468cdfd1efcd7d196cd1d 
-SRCREV_shlex="e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
+SRCREV_shlex = "e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
 SRC_URI += "git://github.com/google/shlex;name=shlex;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/shlex"
 
 # 	github.com/google/uuid v1.3.0
 # [1] git ls-remote https://github.com/google/uuid 44b5fee7c49cf3bcdf723f106b36d56ef13ccc88 
-SRCREV_uuid="44b5fee7c49cf3bcdf723f106b36d56ef13ccc88"
+SRCREV_uuid = "44b5fee7c49cf3bcdf723f106b36d56ef13ccc88"
 SRC_URI += "git://github.com/google/uuid;name=uuid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/uuid"
 
 # 	github.com/inconshreveable/mousetrap v1.0.0
 # [1] git ls-remote https://github.com/inconshreveable/mousetrap 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75 
-SRCREV_mousetrap="76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
+SRCREV_mousetrap = "76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
 SRC_URI += "git://github.com/inconshreveable/mousetrap;name=mousetrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/inconshreveable/mousetrap"
 
 # 	github.com/json-iterator/go v1.1.12
 # [1] git ls-remote https://github.com/json-iterator/go 024077e996b048517130b21ea6bf12aa23055d3d 
-SRCREV_go="024077e996b048517130b21ea6bf12aa23055d3d"
+SRCREV_go = "024077e996b048517130b21ea6bf12aa23055d3d"
 SRC_URI += "git://github.com/json-iterator/go;name=go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/json-iterator/go"
 
 # 	github.com/klauspost/compress v1.13.6
 # [1] git ls-remote https://github.com/klauspost/compress 38d4ba985ac157cb858763e016645e14e74c13c4 
-SRCREV_compress="38d4ba985ac157cb858763e016645e14e74c13c4"
+SRCREV_compress = "38d4ba985ac157cb858763e016645e14e74c13c4"
 SRC_URI += "git://github.com/klauspost/compress;name=compress;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/compress"
 
 # 	github.com/mattn/go-ieproxy v0.0.1
 # [1] git ls-remote https://github.com/mattn/go-ieproxy 439dd0581a2a03b415673a2462ad5c21eaabc588 
-SRCREV_go-ieproxy="439dd0581a2a03b415673a2462ad5c21eaabc588"
+SRCREV_go-ieproxy = "439dd0581a2a03b415673a2462ad5c21eaabc588"
 SRC_URI += "git://github.com/mattn/go-ieproxy;name=go-ieproxy;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-ieproxy"
 
 # 	github.com/mattn/go-isatty v0.0.14
 # [1] git ls-remote https://github.com/mattn/go-isatty 504425e14f742f1f517c4586048b49b37f829c8e 
-SRCREV_go-isatty="504425e14f742f1f517c4586048b49b37f829c8e"
+SRCREV_go-isatty = "504425e14f742f1f517c4586048b49b37f829c8e"
 SRC_URI += "git://github.com/mattn/go-isatty;name=go-isatty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-isatty"
 
 # 	github.com/minio/cli v1.22.0
 # [1] git ls-remote https://github.com/minio/cli 735b30120ed7535d13933b0246f8a75cf80b0f74 
-SRCREV_cli="735b30120ed7535d13933b0246f8a75cf80b0f74"
+SRCREV_cli = "735b30120ed7535d13933b0246f8a75cf80b0f74"
 SRC_URI += "git://github.com/minio/cli;name=cli;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/cli"
 
 # 	github.com/minio/colorjson v1.0.2
 # [1] git ls-remote https://github.com/minio/colorjson f964b335cdb6cd51dff32a726d3d6ab9e1db0633 
-SRCREV_colorjson="f964b335cdb6cd51dff32a726d3d6ab9e1db0633"
+SRCREV_colorjson = "f964b335cdb6cd51dff32a726d3d6ab9e1db0633"
 SRC_URI += "git://github.com/minio/colorjson;name=colorjson;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/colorjson"
 
 # 	github.com/minio/filepath v1.0.0
 # [1] git ls-remote https://github.com/minio/filepath a116cb5d2b6396deea35d06389e3e9809c887fcf 
-SRCREV_filepath="a116cb5d2b6396deea35d06389e3e9809c887fcf"
+SRCREV_filepath = "a116cb5d2b6396deea35d06389e3e9809c887fcf"
 SRC_URI += "git://github.com/minio/filepath;name=filepath;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/filepath"
 
 # 	github.com/minio/madmin-go v1.4.3
 # [1] git ls-remote https://github.com/minio/madmin-go 4f71c826739af4ebf73308e7f9a849a781859f78 
-SRCREV_madmin-go="4f71c826739af4ebf73308e7f9a849a781859f78"
+SRCREV_madmin-go = "4f71c826739af4ebf73308e7f9a849a781859f78"
 SRC_URI += "git://github.com/minio/madmin-go;name=madmin-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/madmin-go"
 
 # 	github.com/minio/md5-simd v1.1.2
 # [1] git ls-remote https://github.com/minio/md5-simd 776275e0c9a74ceebbd50fe5c1d61b0c80c608df 
-SRCREV_md5-simd="776275e0c9a74ceebbd50fe5c1d61b0c80c608df"
+SRCREV_md5-simd = "776275e0c9a74ceebbd50fe5c1d61b0c80c608df"
 SRC_URI += "git://github.com/minio/md5-simd;name=md5-simd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/md5-simd"
 
 # 	github.com/minio/minio-go/v7 v7.0.30
 # [1] git ls-remote https://github.com/minio/minio-go 81c303325bb4426c89776854b2ea4f7936deb11c 
-SRCREV_v7="81c303325bb4426c89776854b2ea4f7936deb11c"
+SRCREV_v7 = "81c303325bb4426c89776854b2ea4f7936deb11c"
 SRC_URI += "git://github.com/minio/minio-go;name=v7;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/minio-go/v7"
 
 # 	github.com/minio/pkg v1.1.22
 # [1] git ls-remote https://github.com/minio/pkg 3b76bdaec27995a31d0b0a7959bbef55bfe0d364 
-SRCREV_pkg="3b76bdaec27995a31d0b0a7959bbef55bfe0d364"
+SRCREV_pkg = "3b76bdaec27995a31d0b0a7959bbef55bfe0d364"
 SRC_URI += "git://github.com/minio/pkg;name=pkg;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/pkg"
 
 # 	github.com/minio/selfupdate v0.4.0
 # [1] git ls-remote https://github.com/minio/selfupdate 9e32fb8d38277355add4fa3983edb0b376d12bb5 
-SRCREV_selfupdate="9e32fb8d38277355add4fa3983edb0b376d12bb5"
+SRCREV_selfupdate = "9e32fb8d38277355add4fa3983edb0b376d12bb5"
 SRC_URI += "git://github.com/minio/selfupdate;name=selfupdate;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/selfupdate"
 
 # 	github.com/minio/sha256-simd v1.0.0
 # [1] git ls-remote https://github.com/minio/sha256-simd 6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9 
-SRCREV_sha256-simd="6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9"
+SRCREV_sha256-simd = "6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9"
 SRC_URI += "git://github.com/minio/sha256-simd;name=sha256-simd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/sha256-simd"
 
 # 	github.com/mitchellh/go-homedir v1.1.0
 # [1] git ls-remote https://github.com/mitchellh/go-homedir af06845cf3004701891bf4fdb884bfe4920b3727 
-SRCREV_go-homedir="af06845cf3004701891bf4fdb884bfe4920b3727"
+SRCREV_go-homedir = "af06845cf3004701891bf4fdb884bfe4920b3727"
 SRC_URI += "git://github.com/mitchellh/go-homedir;name=go-homedir;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/go-homedir"
 
 # 	github.com/pkg/xattr v0.4.4
 # [1] git ls-remote https://github.com/pkg/xattr 8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a 
-SRCREV_xattr="8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a"
+SRCREV_xattr = "8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a"
 SRC_URI += "git://github.com/pkg/xattr;name=xattr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/xattr"
 
 # 	github.com/posener/complete v1.2.3
 # [1] git ls-remote https://github.com/posener/complete 05b68ffc813dd10c420993cb1cf927b346c057b8 
-SRCREV_complete="05b68ffc813dd10c420993cb1cf927b346c057b8"
+SRCREV_complete = "05b68ffc813dd10c420993cb1cf927b346c057b8"
 SRC_URI += "git://github.com/posener/complete;name=complete;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/posener/complete"
 
 # 	github.com/prometheus/client_golang v1.12.1
 # [1] git ls-remote https://github.com/prometheus/client_golang 2e1c4818ccfdcf953ce399cadad615ff2bed968c 
-SRCREV_client_golang="2e1c4818ccfdcf953ce399cadad615ff2bed968c"
+SRCREV_client_golang = "2e1c4818ccfdcf953ce399cadad615ff2bed968c"
 SRC_URI += "git://github.com/prometheus/client_golang;name=client_golang;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_golang"
 
 # 	github.com/prometheus/prom2json v1.3.1
 # [1] git ls-remote https://github.com/prometheus/prom2json ac13972e54feb2f8eafc9a613112cb310f5463dc 
-SRCREV_prom2json="ac13972e54feb2f8eafc9a613112cb310f5463dc"
+SRCREV_prom2json = "ac13972e54feb2f8eafc9a613112cb310f5463dc"
 SRC_URI += "git://github.com/prometheus/prom2json;name=prom2json;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/prom2json"
 
 # 	github.com/rjeczalik/notify v0.9.2
 # [1] git ls-remote https://github.com/rjeczalik/notify 69d839f37b13a8cb7a78366f7633a4071cb43be7 
-SRCREV_notify="69d839f37b13a8cb7a78366f7633a4071cb43be7"
+SRCREV_notify = "69d839f37b13a8cb7a78366f7633a4071cb43be7"
 SRC_URI += "git://github.com/rjeczalik/notify;name=notify;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rjeczalik/notify"
 
 # 	github.com/rs/xid v1.3.0
 # [1] git ls-remote https://github.com/rs/xid efa678f304ab65d6d57eedcb086798381ae22206 
-SRCREV_xid="efa678f304ab65d6d57eedcb086798381ae22206"
+SRCREV_xid = "efa678f304ab65d6d57eedcb086798381ae22206"
 SRC_URI += "git://github.com/rs/xid;name=xid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rs/xid"
 
 # 	github.com/secure-io/sio-go v0.3.1
 # [1] git ls-remote https://github.com/secure-io/sio-go a455d2cd8fcacdfe18557d117db15c0629fb7e2c 
-SRCREV_sio-go="a455d2cd8fcacdfe18557d117db15c0629fb7e2c"
+SRCREV_sio-go = "a455d2cd8fcacdfe18557d117db15c0629fb7e2c"
 SRC_URI += "git://github.com/secure-io/sio-go;name=sio-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/secure-io/sio-go"
 
 # 	github.com/shirou/gopsutil/v3 v3.21.12
 # [1] git ls-remote https://github.com/shirou/gopsutil 2f8da0a39487ceddf44cebe53a1b563b0b7173cc 
-SRCREV_v3="2f8da0a39487ceddf44cebe53a1b563b0b7173cc"
+SRCREV_v3 = "2f8da0a39487ceddf44cebe53a1b563b0b7173cc"
 SRC_URI += "git://github.com/shirou/gopsutil;name=v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/shirou/gopsutil/v3"
 
 # 	github.com/tidwall/gjson v1.12.1
 # [1] git ls-remote https://github.com/tidwall/gjson db0033701cccc8e2e43b77d03e4f509a48b6b2f2 
-SRCREV_gjson="db0033701cccc8e2e43b77d03e4f509a48b6b2f2"
+SRCREV_gjson = "db0033701cccc8e2e43b77d03e4f509a48b6b2f2"
 SRC_URI += "git://github.com/tidwall/gjson;name=gjson;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/gjson"
 
 # 	golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e
 # [1] git ls-remote https://go.googlesource.com/crypto 793ad666bf5ec61392092b27061be9618e4e219b 
-SRCREV_crypto="793ad666bf5ec61392092b27061be9618e4e219b"
+SRCREV_crypto = "793ad666bf5ec61392092b27061be9618e4e219b"
 SRC_URI += "git://go.googlesource.com/crypto;name=crypto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/crypto"
 
 # 	golang.org/x/net v0.0.0-20220225172249-27dd8689420f
 # [1] git ls-remote https://go.googlesource.com/net 27dd8689420fcde088514397d015e4fea5174e0e 
-SRCREV_net="27dd8689420fcde088514397d015e4fea5174e0e"
+SRCREV_net = "27dd8689420fcde088514397d015e4fea5174e0e"
 SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/net"
 
 # 	golang.org/x/text v0.3.7
 # [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f883d229d707172ed356727aae99 
-SRCREV_text="3cd4007149f3f883d229d707172ed356727aae99"
+SRCREV_text = "3cd4007149f3f883d229d707172ed356727aae99"
 SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/text"
 
 # 	gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b
 # [1] git ls-remote https://gopkg.in/check.v1 038fdea0a05bc030b0bfda479dc2e08d2220ec74 
-SRCREV_check.v1="038fdea0a05bc030b0bfda479dc2e08d2220ec74"
+SRCREV_check.v1 = "038fdea0a05bc030b0bfda479dc2e08d2220ec74"
 SRC_URI += "git://gopkg.in/check.v1;name=check.v1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/check.v1"
 
 # 	gopkg.in/h2non/filetype.v1 v1.0.5
 # [1] git ls-remote https://gopkg.in/h2non/filetype.v1 8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b 
-SRCREV_filetype.v1="8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b"
+SRCREV_filetype.v1 = "8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b"
 SRC_URI += "git://gopkg.in/h2non/filetype.v1;name=filetype.v1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/h2non/filetype.v1"
 
 # 	gopkg.in/yaml.v2 v2.4.0
 # [1] git ls-remote https://gopkg.in/yaml.v2 7649d4548cb53a614db133b2a8ac1f31859dda8c 
-SRCREV_yaml.v2="7649d4548cb53a614db133b2a8ac1f31859dda8c"
+SRCREV_yaml.v2 = "7649d4548cb53a614db133b2a8ac1f31859dda8c"
 SRC_URI += "git://gopkg.in/yaml.v2;name=yaml.v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2"
 
 # 	github.com/charmbracelet/bubbles v0.10.0
 # [1] git ls-remote https://github.com/charmbracelet/bubbles 7714089ad7c81898564ebeb7b6876b5844e26ccd 
-SRCREV_bubbles="7714089ad7c81898564ebeb7b6876b5844e26ccd"
+SRCREV_bubbles = "7714089ad7c81898564ebeb7b6876b5844e26ccd"
 SRC_URI += "git://github.com/charmbracelet/bubbles;name=bubbles;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/charmbracelet/bubbles"
 
 # 	github.com/charmbracelet/lipgloss v0.4.1-0.20220204041308-bf2912e703f6
 # [1] git ls-remote https://github.com/charmbracelet/lipgloss bf2912e703f6ecf88a1b843472afd47ce5002caf 
-SRCREV_lipgloss="bf2912e703f6ecf88a1b843472afd47ce5002caf"
+SRCREV_lipgloss = "bf2912e703f6ecf88a1b843472afd47ce5002caf"
 SRC_URI += "git://github.com/charmbracelet/lipgloss;name=lipgloss;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/charmbracelet/lipgloss"
 
 # 	github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857a1
 # [1] git ls-remote https://github.com/gdamore/tcell f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1 
-SRCREV_v2="f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1"
+SRCREV_v2 = "f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1"
 SRC_URI += "git://github.com/gdamore/tcell;name=v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gdamore/tcell/v2"
 
 # 	github.com/golang-jwt/jwt/v4 v4.4.1
 # [1] git ls-remote https://github.com/golang-jwt/jwt 0972257eba279bb357882afc11db8218644ad565 
-SRCREV_v4="0972257eba279bb357882afc11db8218644ad565"
+SRCREV_v4 = "0972257eba279bb357882afc11db8218644ad565"
 SRC_URI += "git://github.com/golang-jwt/jwt;name=v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang-jwt/jwt/v4"
 
 # 	github.com/navidys/tvxwidgets v0.1.0
 # [1] git ls-remote https://github.com/navidys/tvxwidgets f017cfd5ce6d4bd7fb22529305d7a438c3f1369d 
-SRCREV_tvxwidgets="f017cfd5ce6d4bd7fb22529305d7a438c3f1369d"
+SRCREV_tvxwidgets = "f017cfd5ce6d4bd7fb22529305d7a438c3f1369d"
 SRC_URI += "git://github.com/navidys/tvxwidgets;name=tvxwidgets;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/navidys/tvxwidgets"
 
 # 	github.com/olekukonko/tablewriter v0.0.5
 # [1] git ls-remote https://github.com/olekukonko/tablewriter c7d2a8a09b076b70918308a3cd95464b2ae3b5d8 
-SRCREV_tablewriter="c7d2a8a09b076b70918308a3cd95464b2ae3b5d8"
+SRCREV_tablewriter = "c7d2a8a09b076b70918308a3cd95464b2ae3b5d8"
 SRC_URI += "git://github.com/olekukonko/tablewriter;name=tablewriter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/olekukonko/tablewriter"
 
 # 	github.com/prometheus/client_model v0.2.0
 # [1] git ls-remote https://github.com/prometheus/client_model f44e7adcba5ee54c8a94709e6fc300d83245f171 
-SRCREV_client_model="f44e7adcba5ee54c8a94709e6fc300d83245f171"
+SRCREV_client_model = "f44e7adcba5ee54c8a94709e6fc300d83245f171"
 SRC_URI += "git://github.com/prometheus/client_model;name=client_model;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_model"
 
 # 	github.com/rivo/tview v0.0.0-20211202162923-2a6de950f73b
 # [1] git ls-remote https://github.com/rivo/tview 2a6de950f73bdc70658f7e754d4b5593f15c8408 
-SRCREV_tview="2a6de950f73bdc70658f7e754d4b5593f15c8408"
+SRCREV_tview = "2a6de950f73bdc70658f7e754d4b5593f15c8408"
 SRC_URI += "git://github.com/rivo/tview;name=tview;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/tview"
 
 # 	github.com/tinylib/msgp v1.1.6
 # [1] git ls-remote https://github.com/tinylib/msgp 205265da651409c54677b486e350b4d105da6d8b 
-SRCREV_msgp="205265da651409c54677b486e350b4d105da6d8b"
+SRCREV_msgp = "205265da651409c54677b486e350b4d105da6d8b"
 SRC_URI += "git://github.com/tinylib/msgp;name=msgp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tinylib/msgp"
 
 # 	golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
 # [1] git ls-remote https://go.googlesource.com/term 03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50 
-SRCREV_term="03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50"
+SRCREV_term = "03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50"
 SRC_URI += "git://go.googlesource.com/term;name=term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/term"
 
 # 	github.com/beorn7/perks v1.0.1
 # [1] git ls-remote https://github.com/beorn7/perks c49ff274687222a7373c4cd83578f1065cf3e143 
-SRCREV_perks="c49ff274687222a7373c4cd83578f1065cf3e143"
+SRCREV_perks = "c49ff274687222a7373c4cd83578f1065cf3e143"
 SRC_URI += "git://github.com/beorn7/perks;name=perks;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/beorn7/perks"
 
 # 	github.com/cespare/xxhash/v2 v2.1.2
 # [1] git ls-remote https://github.com/cespare/xxhash 7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4 
-SRCREV_v21="7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4"
+SRCREV_v21 = "7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4"
 SRC_URI += "git://github.com/cespare/xxhash;name=v21;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cespare/xxhash/v2"
 
 # 	github.com/containerd/console v1.0.2
 # [1] git ls-remote https://github.com/containerd/console d5efa7d56fd239f7f3dad2ab6685db09359a3618 
-SRCREV_console="d5efa7d56fd239f7f3dad2ab6685db09359a3618"
+SRCREV_console = "d5efa7d56fd239f7f3dad2ab6685db09359a3618"
 SRC_URI += "git://github.com/containerd/console;name=console;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/console"
 
 # 	github.com/coreos/go-semver v0.3.0
 # [1] git ls-remote https://github.com/coreos/go-semver 6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5 
-SRCREV_go-semver="6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5"
+SRCREV_go-semver = "6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5"
 SRC_URI += "git://github.com/coreos/go-semver;name=go-semver;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-semver"
 
 # 	github.com/coreos/go-systemd/v22 v22.3.2
 # [1] git ls-remote https://github.com/coreos/go-systemd 0b40357fd65760243a3eceb80a299772c23c8470 
-SRCREV_v22="0b40357fd65760243a3eceb80a299772c23c8470"
+SRCREV_v22 = "0b40357fd65760243a3eceb80a299772c23c8470"
 SRC_URI += "git://github.com/coreos/go-systemd;name=v22;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-systemd/v22"
 
 # 	github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
 # [1] git ls-remote https://github.com/decred/dcrd 75f1b4dac2e43133f3281ac63a9ef9eb699200e5 
-SRCREV_v41="75f1b4dac2e43133f3281ac63a9ef9eb699200e5"
+SRCREV_v41 = "75f1b4dac2e43133f3281ac63a9ef9eb699200e5"
 SRC_URI += "git://github.com/decred/dcrd;name=v41;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/decred/dcrd/dcrec/secp256k1/v4"
 
 # 	github.com/fatih/structs v1.1.0
 # [1] git ls-remote https://github.com/fatih/structs 4966fc68f5b7593aafa6cbbba2d65ec6e1416047 
-SRCREV_structs="4966fc68f5b7593aafa6cbbba2d65ec6e1416047"
+SRCREV_structs = "4966fc68f5b7593aafa6cbbba2d65ec6e1416047"
 SRC_URI += "git://github.com/fatih/structs;name=structs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/structs"
 
 # 	github.com/gdamore/encoding v1.0.0
 # [1] git ls-remote https://github.com/gdamore/encoding 79c592247a6248468805a0e297f43a7cac979903 
-SRCREV_encoding="79c592247a6248468805a0e297f43a7cac979903"
+SRCREV_encoding = "79c592247a6248468805a0e297f43a7cac979903"
 SRC_URI += "git://github.com/gdamore/encoding;name=encoding;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gdamore/encoding"
 
 # 	github.com/gogo/protobuf v1.3.2
 # [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ede29f62fe3ce239267c1bc 
-SRCREV_protobuf="b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
+SRCREV_protobuf = "b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
 SRC_URI += "git://github.com/gogo/protobuf;name=protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/protobuf"
 
 # 	github.com/golang/protobuf v1.5.2
 # [1] git ls-remote https://github.com/golang/protobuf ae97035608a719c7a1c1c41bed0ae0744bdb0c6f 
-SRCREV_protobuf1="ae97035608a719c7a1c1c41bed0ae0744bdb0c6f"
+SRCREV_protobuf1 = "ae97035608a719c7a1c1c41bed0ae0744bdb0c6f"
 SRC_URI += "git://github.com/golang/protobuf;name=protobuf1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/protobuf"
 
 # 	github.com/hashicorp/errwrap v1.1.0
 # [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d14dd0caaacbd13e76254d02c0 
-SRCREV_errwrap="7b00e5db719c64d14dd0caaacbd13e76254d02c0"
+SRCREV_errwrap = "7b00e5db719c64d14dd0caaacbd13e76254d02c0"
 SRC_URI += "git://github.com/hashicorp/errwrap;name=errwrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/errwrap"
 
 # 	github.com/hashicorp/go-multierror v1.1.1
 # [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec57696378079ecc3accd3d6f29401b3a0 
-SRCREV_go-multierror="9974e9ec57696378079ecc3accd3d6f29401b3a0"
+SRCREV_go-multierror = "9974e9ec57696378079ecc3accd3d6f29401b3a0"
 SRC_URI += "git://github.com/hashicorp/go-multierror;name=go-multierror;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-multierror"
 
 # 	github.com/klauspost/cpuid/v2 v2.0.9
 # [1] git ls-remote https://github.com/klauspost/cpuid 6903d4066801a7d800d4537ee9eebe81ea97000e 
-SRCREV_v212="6903d4066801a7d800d4537ee9eebe81ea97000e"
+SRCREV_v212 = "6903d4066801a7d800d4537ee9eebe81ea97000e"
 SRC_URI += "git://github.com/klauspost/cpuid;name=v212;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/cpuid/v2"
 
 # 	github.com/kr/text v0.2.0
 # [1] git ls-remote https://github.com/kr/text 0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5 
-SRCREV_text1="0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5"
+SRCREV_text1 = "0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5"
 SRC_URI += "git://github.com/kr/text;name=text1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kr/text"
 
 # 	github.com/lestrrat-go/backoff/v2 v2.0.8
 # [1] git ls-remote https://github.com/lestrrat-go/backoff c3af762cb9d2bc8339e1d5099a4550366a675f60 
-SRCREV_v2123="c3af762cb9d2bc8339e1d5099a4550366a675f60"
+SRCREV_v2123 = "c3af762cb9d2bc8339e1d5099a4550366a675f60"
 SRC_URI += "git://github.com/lestrrat-go/backoff;name=v2123;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/backoff/v2"
 
 # 	github.com/lestrrat-go/blackmagic v1.0.0
 # [1] git ls-remote https://github.com/lestrrat-go/blackmagic 370527f88bbfd5be3192a38af3148dbd64f0976f 
-SRCREV_blackmagic="370527f88bbfd5be3192a38af3148dbd64f0976f"
+SRCREV_blackmagic = "370527f88bbfd5be3192a38af3148dbd64f0976f"
 SRC_URI += "git://github.com/lestrrat-go/blackmagic;name=blackmagic;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/blackmagic"
 
 # 	github.com/lestrrat-go/httpcc v1.0.0
 # [1] git ls-remote https://github.com/lestrrat-go/httpcc e7e8fea419e32f7549252ad15ecf17f3a3c1a268 
-SRCREV_httpcc="e7e8fea419e32f7549252ad15ecf17f3a3c1a268"
+SRCREV_httpcc = "e7e8fea419e32f7549252ad15ecf17f3a3c1a268"
 SRC_URI += "git://github.com/lestrrat-go/httpcc;name=httpcc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/httpcc"
 
 # 	github.com/lestrrat-go/iter v1.0.1
 # [1] git ls-remote https://github.com/lestrrat-go/iter 628869e97ee3dcc09033086e547a5cab96b0d708 
-SRCREV_iter="628869e97ee3dcc09033086e547a5cab96b0d708"
+SRCREV_iter = "628869e97ee3dcc09033086e547a5cab96b0d708"
 SRC_URI += "git://github.com/lestrrat-go/iter;name=iter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/iter"
 
 # 	github.com/lestrrat-go/jwx v1.2.14
 # [1] git ls-remote https://github.com/lestrrat-go/jwx de7d9bca43812abc4f630320f8632108ccfe34bf 
-SRCREV_jwx="de7d9bca43812abc4f630320f8632108ccfe34bf"
+SRCREV_jwx = "de7d9bca43812abc4f630320f8632108ccfe34bf"
 SRC_URI += "git://github.com/lestrrat-go/jwx;name=jwx;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/jwx"
 
 # 	github.com/lestrrat-go/option v1.0.0
 # [1] git ls-remote https://github.com/lestrrat-go/option 7e3467dce320ff45667b138ae503367c92deaa0b 
-SRCREV_option="7e3467dce320ff45667b138ae503367c92deaa0b"
+SRCREV_option = "7e3467dce320ff45667b138ae503367c92deaa0b"
 SRC_URI += "git://github.com/lestrrat-go/option;name=option;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/option"
 
 # 	github.com/lucasb-eyer/go-colorful v1.2.0
 # [1] git ls-remote https://github.com/lucasb-eyer/go-colorful d2b05a0d83cca9d610425691c3253d5f36d0ad06 
-SRCREV_go-colorful="d2b05a0d83cca9d610425691c3253d5f36d0ad06"
+SRCREV_go-colorful = "d2b05a0d83cca9d610425691c3253d5f36d0ad06"
 SRC_URI += "git://github.com/lucasb-eyer/go-colorful;name=go-colorful;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lucasb-eyer/go-colorful"
 
 # 	github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0
 # [1] git ls-remote https://github.com/lufia/plan9stats 39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2 
-SRCREV_plan9stats="39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2"
+SRCREV_plan9stats = "39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2"
 SRC_URI += "git://github.com/lufia/plan9stats;name=plan9stats;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lufia/plan9stats"
 
 # 	github.com/mattn/go-colorable v0.1.12
 # [1] git ls-remote https://github.com/mattn/go-colorable e1bb79c8d53c38a60962ad4b8f658226cc983710 
-SRCREV_go-colorable="e1bb79c8d53c38a60962ad4b8f658226cc983710"
+SRCREV_go-colorable = "e1bb79c8d53c38a60962ad4b8f658226cc983710"
 SRC_URI += "git://github.com/mattn/go-colorable;name=go-colorable;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-colorable"
 
 # 	github.com/mattn/go-runewidth v0.0.13
 # [1] git ls-remote https://github.com/mattn/go-runewidth df1ff59654317c1b5a3f860ffc47402931932104 
-SRCREV_go-runewidth="df1ff59654317c1b5a3f860ffc47402931932104"
+SRCREV_go-runewidth = "df1ff59654317c1b5a3f860ffc47402931932104"
 SRC_URI += "git://github.com/mattn/go-runewidth;name=go-runewidth;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-runewidth"
 
 # 	github.com/matttproud/golang_protobuf_extensions v1.0.1
 # [1] git ls-remote https://github.com/matttproud/golang_protobuf_extensions c12348ce28de40eed0136aa2b644d0ee0650e56c 
-SRCREV_golang_protobuf_extensions="c12348ce28de40eed0136aa2b644d0ee0650e56c"
+SRCREV_golang_protobuf_extensions = "c12348ce28de40eed0136aa2b644d0ee0650e56c"
 SRC_URI += "git://github.com/matttproud/golang_protobuf_extensions;name=golang_protobuf_extensions;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/matttproud/golang_protobuf_extensions"
 
 # 	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
 # [1] git ls-remote https://github.com/modern-go/concurrent bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94 
-SRCREV_concurrent="bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
+SRCREV_concurrent = "bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
 SRC_URI += "git://github.com/modern-go/concurrent;name=concurrent;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/modern-go/concurrent"
 
 # 	github.com/modern-go/reflect2 v1.0.2
 # [1] git ls-remote https://github.com/modern-go/reflect2 2b33151c9bbc5231aea69b8861c540102b087070 
-SRCREV_reflect2="2b33151c9bbc5231aea69b8861c540102b087070"
+SRCREV_reflect2 = "2b33151c9bbc5231aea69b8861c540102b087070"
 SRC_URI += "git://github.com/modern-go/reflect2;name=reflect2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/modern-go/reflect2"
 
 # 	github.com/muesli/ansi v0.0.0-20211018074035-2e021307bc4b
 # [1] git ls-remote https://github.com/muesli/ansi 2e021307bc4b4f4766c3fb4faf6030b13dc9ec51 
-SRCREV_ansi="2e021307bc4b4f4766c3fb4faf6030b13dc9ec51"
+SRCREV_ansi = "2e021307bc4b4f4766c3fb4faf6030b13dc9ec51"
 SRC_URI += "git://github.com/muesli/ansi;name=ansi;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/ansi"
 
 # 	github.com/muesli/reflow v0.3.0
 # [1] git ls-remote https://github.com/muesli/reflow 602e329532049c9e33fa8c74e352a46fb9486947 
-SRCREV_reflow="602e329532049c9e33fa8c74e352a46fb9486947"
+SRCREV_reflow = "602e329532049c9e33fa8c74e352a46fb9486947"
 SRC_URI += "git://github.com/muesli/reflow;name=reflow;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/reflow"
 
 # 	github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e0
 # [1] git ls-remote https://github.com/muesli/termenv 5ac8409525e03ee6cd96daeae32d47902b88f32a 
-SRCREV_termenv="5ac8409525e03ee6cd96daeae32d47902b88f32a"
+SRCREV_termenv = "5ac8409525e03ee6cd96daeae32d47902b88f32a"
 SRC_URI += "git://github.com/muesli/termenv;name=termenv;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/termenv"
 
 # 	github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e
 # [1] git ls-remote https://github.com/niemeyer/pretty a10e7caefd8e0d600cea437f5c3613aeb1553d56 
-SRCREV_pretty="a10e7caefd8e0d600cea437f5c3613aeb1553d56"
+SRCREV_pretty = "a10e7caefd8e0d600cea437f5c3613aeb1553d56"
 SRC_URI += "git://github.com/niemeyer/pretty;name=pretty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/niemeyer/pretty"
 
 # 	github.com/philhofer/fwd v1.1.1
 # [1] git ls-remote https://github.com/philhofer/fwd 9bcb9cab1b0394d8516a132ec243ba944efdb644 
-SRCREV_fwd="9bcb9cab1b0394d8516a132ec243ba944efdb644"
+SRCREV_fwd = "9bcb9cab1b0394d8516a132ec243ba944efdb644"
 SRC_URI += "git://github.com/philhofer/fwd;name=fwd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/philhofer/fwd"
 
 # 	github.com/pkg/errors v0.9.1
 # [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c1767a985424175c39b465 
-SRCREV_errors="614d223910a179a466c1767a985424175c39b465"
+SRCREV_errors = "614d223910a179a466c1767a985424175c39b465"
 SRC_URI += "git://github.com/pkg/errors;name=errors;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors"
 
 # 	github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea8c
 # [1] git ls-remote https://github.com/power-devops/perfstat 5aafc221ea8c1ff54b0835cbd5f2386a8410be11 
-SRCREV_perfstat="5aafc221ea8c1ff54b0835cbd5f2386a8410be11"
+SRCREV_perfstat = "5aafc221ea8c1ff54b0835cbd5f2386a8410be11"
 SRC_URI += "git://github.com/power-devops/perfstat;name=perfstat;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/power-devops/perfstat"
 
 # 	github.com/prometheus/common v0.33.0
 # [1] git ls-remote https://github.com/prometheus/common 63e75f51cd2368130efbd51b95a4e457e64b444e 
-SRCREV_common="63e75f51cd2368130efbd51b95a4e457e64b444e"
+SRCREV_common = "63e75f51cd2368130efbd51b95a4e457e64b444e"
 SRC_URI += "git://github.com/prometheus/common;name=common;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/common"
 
 # 	github.com/prometheus/procfs v0.7.3
 # [1] git ls-remote https://github.com/prometheus/procfs f436cbb89ece38bf080d446b3ca27053b305eaac 
-SRCREV_procfs="f436cbb89ece38bf080d446b3ca27053b305eaac"
+SRCREV_procfs = "f436cbb89ece38bf080d446b3ca27053b305eaac"
 SRC_URI += "git://github.com/prometheus/procfs;name=procfs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/procfs"
 
 # 	github.com/rivo/uniseg v0.2.0
 # [1] git ls-remote https://github.com/rivo/uniseg 75711fccf6a3e85bc74c241e2dddd06a9bc9e53d 
-SRCREV_uniseg="75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
+SRCREV_uniseg = "75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
 SRC_URI += "git://github.com/rivo/uniseg;name=uniseg;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/uniseg"
 
 # 	github.com/sirupsen/logrus v1.8.1
 # [1] git ls-remote https://github.com/sirupsen/logrus bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b 
-SRCREV_logrus="bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b"
+SRCREV_logrus = "bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b"
 SRC_URI += "git://github.com/sirupsen/logrus;name=logrus;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sirupsen/logrus"
 
 # 	github.com/tidwall/match v1.1.1
 # [1] git ls-remote https://github.com/tidwall/match 4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf 
-SRCREV_match="4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
+SRCREV_match = "4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
 SRC_URI += "git://github.com/tidwall/match;name=match;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/match"
 
 # 	github.com/tidwall/pretty v1.2.0
 # [1] git ls-remote https://github.com/tidwall/pretty aaa765e7476acb0028a854b85675801362cbdaa2 
-SRCREV_pretty1="aaa765e7476acb0028a854b85675801362cbdaa2"
+SRCREV_pretty1 = "aaa765e7476acb0028a854b85675801362cbdaa2"
 SRC_URI += "git://github.com/tidwall/pretty;name=pretty1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/pretty"
 
 # 	github.com/tklauser/go-sysconf v0.3.9
 # [1] git ls-remote https://github.com/tklauser/go-sysconf 746b19d14e19d242c2daa08e0d645c19832c1939 
-SRCREV_go-sysconf="746b19d14e19d242c2daa08e0d645c19832c1939"
+SRCREV_go-sysconf = "746b19d14e19d242c2daa08e0d645c19832c1939"
 SRC_URI += "git://github.com/tklauser/go-sysconf;name=go-sysconf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tklauser/go-sysconf"
 
 # 	github.com/tklauser/numcpus v0.3.0
 # [1] git ls-remote https://github.com/tklauser/numcpus cc3fdd5f3955d53d50d94380963bddd24bd373e2 
-SRCREV_numcpus="cc3fdd5f3955d53d50d94380963bddd24bd373e2"
+SRCREV_numcpus = "cc3fdd5f3955d53d50d94380963bddd24bd373e2"
 SRC_URI += "git://github.com/tklauser/numcpus;name=numcpus;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tklauser/numcpus"
 
 # 	github.com/yusufpapurcu/wmi v1.2.2
 # [1] git ls-remote https://github.com/yusufpapurcu/wmi 253c5f0cb35e666c4c0fc42083824e7c89f0cc8d 
-SRCREV_wmi="253c5f0cb35e666c4c0fc42083824e7c89f0cc8d"
+SRCREV_wmi = "253c5f0cb35e666c4c0fc42083824e7c89f0cc8d"
 SRC_URI += "git://github.com/yusufpapurcu/wmi;name=wmi;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/yusufpapurcu/wmi"
 
 # 	go.etcd.io/etcd/api/v3 v3.5.2
 # [1] git ls-remote https://github.com/etcd-io/etcd 4591a096d4d3c08e577d7269851938db0c1da3d4 
-SRCREV_v31="4591a096d4d3c08e577d7269851938db0c1da3d4"
+SRCREV_v31 = "4591a096d4d3c08e577d7269851938db0c1da3d4"
 SRC_URI += "git://github.com/etcd-io/etcd;name=v31;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/etcd-io/etcd/api/v3"
 
 # 	go.uber.org/atomic v1.9.0
 # [1] git ls-remote https://github.com/uber-go/atomic 135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8 
-SRCREV_atomic="135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8"
+SRCREV_atomic = "135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8"
 SRC_URI += "git://github.com/uber-go/atomic;name=atomic;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/atomic"
 
 # 	go.uber.org/multierr v1.7.0
 # [1] git ls-remote https://github.com/uber-go/multierr 19d9fff1d3b66750a134671435786579bc994737 
-SRCREV_multierr="19d9fff1d3b66750a134671435786579bc994737"
+SRCREV_multierr = "19d9fff1d3b66750a134671435786579bc994737"
 SRC_URI += "git://github.com/uber-go/multierr;name=multierr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/multierr"
 
 # 	go.uber.org/zap v1.19.1
 # [1] git ls-remote https://github.com/uber-go/zap 2f61e97148e69cd2dd1902b03e89ce07cd1218a1 
-SRCREV_zap="2f61e97148e69cd2dd1902b03e89ce07cd1218a1"
+SRCREV_zap = "2f61e97148e69cd2dd1902b03e89ce07cd1218a1"
 SRC_URI += "git://github.com/uber-go/zap;name=zap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/zap"
 
 # 	golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
 # [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0ddf193dd5a34e034151da389d09 
-SRCREV_sync="036812b2e83c0ddf193dd5a34e034151da389d09"
+SRCREV_sync = "036812b2e83c0ddf193dd5a34e034151da389d09"
 SRC_URI += "git://go.googlesource.com/sync;name=sync;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/sync"
 
 # 	golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
 # [1] git ls-remote https://go.googlesource.com/sys 33da011f77ade50ff5b6a6fb4a9a1e6d6b285809 
-SRCREV_sys="33da011f77ade50ff5b6a6fb4a9a1e6d6b285809"
+SRCREV_sys = "33da011f77ade50ff5b6a6fb4a9a1e6d6b285809"
 SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/sys"
 
 # 	google.golang.org/genproto v0.0.0-20211223182754-3ac035c7e7cb
 # [1] git ls-remote https://github.com/googleapis/go-genproto 3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3 
-SRCREV_genproto="3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3"
+SRCREV_genproto = "3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3"
 SRC_URI += "git://github.com/googleapis/go-genproto;name=genproto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto"
 
 # 	google.golang.org/grpc v1.43.0
 # [1] git ls-remote https://github.com/grpc/grpc-go 14c11384b76b67f7b1b32a5d18f865762634c0ae 
-SRCREV_grpc="14c11384b76b67f7b1b32a5d18f865762634c0ae"
+SRCREV_grpc = "14c11384b76b67f7b1b32a5d18f865762634c0ae"
 SRC_URI += "git://github.com/grpc/grpc-go;name=grpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/grpc"
 
 # 	google.golang.org/protobuf v1.27.1
 # [1] git ls-remote https://github.com/protocolbuffers/protobuf-go b92717ecb630d4a4824b372bf98c729d87311a4d 
-SRCREV_protobuf12="b92717ecb630d4a4824b372bf98c729d87311a4d"
+SRCREV_protobuf12 = "b92717ecb630d4a4824b372bf98c729d87311a4d"
 SRC_URI += "git://github.com/protocolbuffers/protobuf-go;name=protobuf12;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/protobuf"
 
 # 	gopkg.in/ini.v1 v1.66.3
 # [1] git ls-remote https://gopkg.in/ini.v1 fcd6cc399e588727c1231f4ea187d1b963536bcc 
-SRCREV_ini.v1="fcd6cc399e588727c1231f4ea187d1b963536bcc"
+SRCREV_ini.v1 = "fcd6cc399e588727c1231f4ea187d1b963536bcc"
 SRC_URI += "git://gopkg.in/ini.v1;name=ini.v1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1"
 
 # 	gopkg.in/yaml.v3 v3.0.1
 # [1] git ls-remote https://gopkg.in/yaml.v3 f6f7691b1fdeb513f56608cd2c32c51f8194bf51 
-SRCREV_yaml.v3="f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
+SRCREV_yaml.v3 = "f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
 SRC_URI += "git://gopkg.in/yaml.v3;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3"
diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
index fc227734d8..917cc694c7 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
@@ -1,6 +1,6 @@
-DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
-HOMEPAGE="https://github.com/taocpp/PEGTL"
-LICENSE="MIT"
+DESCRIPTION = "header-only library for creating parsers according to Parsing Expression Grammar"
+HOMEPAGE = "https://github.com/taocpp/PEGTL"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dccf35ef30bf912bb07b01d469965293"
 
 SRC_URI = " \
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb
index 171b2dec7b..a2be3bb70b 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_1.1.1.bb
@@ -9,7 +9,7 @@ RRECOMMENDS:${PN} += "tslib-calibrate"
 SRC_URI = "https://github.com/merge/xf86-input-tslib/releases/download/${PV}/xf86-input-tslib-${PV}.tar.xz \
            file://99-xf86-input-tslib.rules \
 "
-UPSTREAM_CHECK_URI="https://github.com/merge/xf86-input-tslib/tags"
+UPSTREAM_CHECK_URI = "https://github.com/merge/xf86-input-tslib/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 SRC_URI[sha256sum] = "b596168c4ed2f1023212dc828ce49cbe82a0bbd1aac3c5e2958154d78870ca88"
diff --git a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
index 37fe0e1bdc..197e4b7184 100644
--- a/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
+++ b/meta-oe/recipes-support/edid-decode/edid-decode_git.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ef696d66c156139232201f223c22592"
 
-SRC_URI= "git://git.linuxtv.org/edid-decode.git;protocol=https;branch=master"
+SRC_URI = "git://git.linuxtv.org/edid-decode.git;protocol=https;branch=master"
 SRCREV = "5920bf2a756b2f748c49ff6a08b9f421026473c5"
 PV = "0.0+git"
 
diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
index 0a6fd684eb..c43651f6eb 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} = "mcelog mce-inject dialog bash"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-S ="${WORKDIR}/git"
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
 
diff --git a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb b/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
index 5e54ab636f..6abe0b9546 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
@@ -123,10 +123,10 @@ PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
 
 inherit pkgconfig cmake setuptools3-base python3native
 
-export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export ORACLE_JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
-export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/lib/jvm/openjdk-8-native"
-export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
+export PYTHON_CSPEC = "-I${STAGING_INCDIR}/${PYTHON_DIR}"
+export ORACLE_JAVA_HOME = "${STAGING_DIR_NATIVE}/usr/bin/java"
+export JAVA_HOME = "${STAGING_DIR_NATIVE}/usr/lib/jvm/openjdk-8-native"
+export ANT_DIR = "${STAGING_DIR_NATIVE}/usr/share/ant/"
 
 TARGET_CC_ARCH += "-I${S}/include "
 
diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
index 50e6bbebab..3df48fa019 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.17.0.bb
@@ -17,18 +17,17 @@ inherit cmake pkgconfig lib_package
 
 LDFLAGS:append:riscv32 = " -latomic"
 
-
 EXTRA_OECMAKE:append = " -DPROTOBUF_PROTOC_EXECUTABLE=${RECIPE_SYSROOT_NATIVE}${bindir}/protoc \
                          -DOTELCPP_VERSIONED_LIBS=ON \
                          -DBUILD_SHARED_LIBS=ON "
 
 PACKAGECONFIG ?= "opentelemetry_install otlp_api"
 
-PACKAGECONFIG[opentelemetry_install]="-DOPENTELEMETRY_INSTALL=ON, -DOPENTELEMETRY_INSTALL=OFF"
-PACKAGECONFIG[otlp_api]="-DWITH_OTLP_API=ON, -DWITH_OTLP_API=OFF"
-PACKAGECONFIG[otlp_grpc]="-DWITH_OTLP_GRPC=ON -DWITH_ABSEIL=ON, -DWITH_OTLP_GRPC=OFF, grpc grpc-native protobuf-native"
-PACKAGECONFIG[otlp_http]="-DWITH_OTLP_HTTP=ON -DWITH_ABSEIL=ON, -DWITH_OTLP_HTTP=OFF, protobuf protobuf-native curl"
-PACKAGECONFIG[otlp_prometheus]="-DWITH_PROMETHEUS=ON -DUSE_THIRDPARTY_LIBRARIES=OFF, \
+PACKAGECONFIG[opentelemetry_install] = "-DOPENTELEMETRY_INSTALL=ON, -DOPENTELEMETRY_INSTALL=OFF"
+PACKAGECONFIG[otlp_api] = "-DWITH_OTLP_API=ON, -DWITH_OTLP_API=OFF"
+PACKAGECONFIG[otlp_grpc] = "-DWITH_OTLP_GRPC=ON -DWITH_ABSEIL=ON, -DWITH_OTLP_GRPC=OFF, grpc grpc-native protobuf-native"
+PACKAGECONFIG[otlp_http] = "-DWITH_OTLP_HTTP=ON -DWITH_ABSEIL=ON, -DWITH_OTLP_HTTP=OFF, protobuf protobuf-native curl"
+PACKAGECONFIG[otlp_prometheus] = "-DWITH_PROMETHEUS=ON -DUSE_THIRDPARTY_LIBRARIES=OFF, \
                                 -DWITH_PROMETHEUS=OFF, civetweb curl"
-PACKAGECONFIG[benchmark]="-DWITH_BENCHMARK=ON, -DWITH_BENCHMARK=OFF"
-PACKAGECONFIG[testing]="-DBUILD_TESTING=ON, -DBUILD_TESTING=OFF, gtest"
+PACKAGECONFIG[benchmark] = "-DWITH_BENCHMARK=ON, -DWITH_BENCHMARK=OFF"
+PACKAGECONFIG[testing] = "-DBUILD_TESTING=ON, -DBUILD_TESTING=OFF, gtest"
diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.12.bb b/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
index dcb264c508..1143d157c9 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecab6c36b7ba82c675581dd0afde36f7 \
                     file://lib/BSD_LICENSE;md5=12cde17a04c30dece2752f36b7192c64"
-DEPENDS="sg3-utils"
+DEPENDS = "sg3-utils"
 SRC_URI = "http://sg.danny.cz/sg/p/${BPN}-${PV}.tgz \
            file://make-sysroot-work.patch \
            "
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
index 0eed353e01..f4f3abd81b 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.1.4.bb
@@ -21,8 +21,8 @@ S ?= "${WORKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
 
-export VBOX_KBUILD_TARGET_ARCH="${ARCH}"
-export VBOX_KBUILD_TARGET_ARCH:x86-64="amd64"
+export VBOX_KBUILD_TARGET_ARCH = "${ARCH}"
+export VBOX_KBUILD_TARGET_ARCH:x86-64 = "amd64"
 
 EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1 CC='${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}'"
 
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
index 716e538902..7b8097c80c 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
@@ -23,7 +23,7 @@ RDEPENDS:${PN}-dev = ""
 # TOOLCHAIN_TARGET_TASK:append = " websocketpp-dev"
 
 # tag 0.8.2
-SRCREV= "56123c87598f8b1dd471be83ca841ceae07f95ba"
+SRCREV = "56123c87598f8b1dd471be83ca841ceae07f95ba"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
index ab39606bdb..2d77c32945 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -12,7 +12,7 @@ RDEPENDS:${PN} += " \
 "
 
 SRC_URI = "git://github.com/MostAwesomeDude/txWS.git;branch=master;protocol=https"
-SRCREV= "88cf6d9b9b685ffa1720644bd53c742afb10a414"
+SRCREV = "88cf6d9b9b685ffa1720644bd53c742afb10a414"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.12.1.bb b/meta-python/recipes-devtools/python/python3-h5py_3.12.1.bb
index 152d952263..3a06fa88ef 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.12.1.bb
@@ -25,4 +25,4 @@ RDEPENDS:${PN} = "python3-numpy \
                   python3-json \
                  "
 
-export HDF5_VERSION="1.14.0"
+export HDF5_VERSION = "1.14.0"
diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.1.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.1.bb
index 5a0e5a8499..8390a8f78a 100644
--- a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.1.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "ebd733b560704c602d744eafc839db60a1ee9326e30a2a80c4adb8718adc1b24"
 
-PYPI_PACKAGE="jsbeautifier"
+PYPI_PACKAGE = "jsbeautifier"
 
 RDEPENDS:${PN} += "\
     python3-core \
diff --git a/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb b/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb
index 185597dea1..e4246f594e 100644
--- a/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pcodedmp_1.2.6.bb
@@ -7,6 +7,6 @@ SRC_URI[sha256sum] = "025f8c809a126f45a082ffa820893e6a8d990d9d7ddb68694b5a9f0a6d
 
 inherit pypi setuptools3
 
-PYPI_PACKAGE="pcodedmp"
+PYPI_PACKAGE = "pcodedmp"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
index 6cf33491b7..46440c9d5d 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.4.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "dbd9047a7ac10d11a5227e97163b617ad5d665050476ff63867d971758
 
 inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE= "pdm_backend"
+PYPI_PACKAGE = "pdm_backend"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.3.bb b/meta-python/recipes-devtools/python/python3-pylint_3.3.3.bb
index 8709d8596f..f3654360de 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.3.bb
@@ -1,5 +1,5 @@
-SUMMARY="Pylint is a Python source code analyzer"
-HOMEPAGE= "http://www.pylint.org/"
+SUMMARY = "Pylint is a Python source code analyzer"
+HOMEPAGE = "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
index 6f3012d1e1..3f4423a71f 100644
--- a/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "8e1c8e72d0845ad2b32a47ab11a719bc2e41165ec101fd4d3fe9e92aa3
 
 inherit pypi
 
-PYPI_PACKAGE="rarfile"
+PYPI_PACKAGE = "rarfile"
 
 RDEPENDS:${PN} += "\
     7zip \
diff --git a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb b/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
index 8e6df79385..8e762580f6 100644
--- a/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_5.2.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 
 # Prefix archive to avoid clashing with the main redis archives
-PYPI_ARCHIVE_NAME_PREFIX="pypi-"
+PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 SRC_URI[sha256sum] = "16f2e22dff21d5125e8481515e386711a34cbec50f0e44413dd7d9c060a54e0f"
 
diff --git a/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb b/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
index 8bfb8a6deb..6ff9a091f0 100644
--- a/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-unoconv_0.9.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "308ebfd98e67d898834876348b27caf41470cd853fbe2681cc7dacd8fd
 
 inherit pypi setuptools3
 
-PYPI_PACKAGE="unoconv"
+PYPI_PACKAGE = "unoconv"
 
 RDEPENDS:${PN} += "\
     python3-setuptools \
diff --git a/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb b/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb
index 27ae8fe8af..8de764a7b6 100644
--- a/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb
+++ b/meta-python/recipes-devtools/python/python3-wand_0.6.13.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "f5013484eaf7a20eb22d1821aaefe60b50cc329722372b5f8565d46d4a
 
 inherit pypi setuptools3
 
-PYPI_PACKAGE="Wand"
+PYPI_PACKAGE = "Wand"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 FILES:${PN}-doc += "${datadir}/README.rst"
diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
index 9755bacca1..1512672435 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.9.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Rich is a Python library for rich text and beautiful formatting in th
 DESCRIPTION = "The Rich API makes it easy to add color and style to terminal output. \
 Rich can also render pretty tables, progress bars, markdown, syntax highlighted source code, \
 tracebacks, and more."
-HOMEPAGE="https://github.com/Textualize/rich"
+HOMEPAGE = "https://github.com/Textualize/rich"
 SECTION = "devel/python"
 LICENSE = "MIT"
 

