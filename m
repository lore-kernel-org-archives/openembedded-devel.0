Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9D276733C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 16:49:59 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id ey11so19928141pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=hvQE5JDBqp6Pv+xfloJPcfu8gB83fXq44w51L+DZbVQ=;
	b=pbQ9VgZxdPkpdT+OAwc7ZSUvyXABG0wdtgWHX+HBjmn2cXnNPWBPJT6Bvob0wTYdN+
	Q5SfTHD7pk2BmbmZFuClO4lQxDiv/iux9v/eHMti3b8STbvMm74Zym5DrnNV+rmkyzvQ
	BXdJ1sEq7zkGAwh0Er4i++qK5jQXW3GgnP9VUQDKhYMyAbU7k0z/xvaP3kUEk8v/io3q
	1aVKViTX1rrRP0QLKst0jsUE7B9wCWPRekMj1aGBZHYIXTgiOD1n73KO1uoqCUvkOkBI
	yZPGABDqtFwOFSJHYiD2SLalJJOJubtBQwzeM/7Xv9RpkrqRXOHw9qxc9UBX+7YgM6+p
	Qjjg==
X-Received: by 10.66.161.170 with SMTP id xt10mr16986312pab.14.1423846200460; 
	Fri, 13 Feb 2015 08:50:00 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id n4sm7263925pdl.12.2015.02.13.08.49.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Feb 2015 08:49:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:49:55 -0800
Message-Id: <1423846195-9910-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] wireshark: fix pcap-config issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Feb 2015 16:50:01 -0000

configure: error: Header file pcap.h not found; if you installed libpcap

don't use pcap. Use the internal version.

And minor configure cleanups

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
index 7604bd7..f16d0f6 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
@@ -4,7 +4,7 @@ SECTION = "network"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
-DEPENDS = "perl-native libcap libpcap pcre expat glib-2.0 sbc"
+DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
 SRC_URI = " \
     http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-${PV}.tar.bz2 \
@@ -23,10 +23,11 @@ ARM_INSTRUCTION_SET = "arm"
 # Works with either gtk+ or gtk3.
 WHICH_GTK = "gtk3"
 
-PACKAGECONFIG ??= "gnutls gcrypt libnl"
+PACKAGECONFIG ??= "libcap gnutls libnl"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${WHICH_GTK}  graphics", "", d)}"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
 
+PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_DIR_HOST}, --with-libcap=no, libcap"
 PACKAGECONFIG[libsmi] = "--with-libsmi=yes, --with-libsmi=no, libsmi"
 PACKAGECONFIG[libnl] = "--with-libnl=yes, --with-libnl=no, libnl"
 PACKAGECONFIG[portaudio] = "--with-portaudio=yes, --with-portaudio=no, portaudio-v19"
@@ -45,7 +46,7 @@ PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[adns] = "--with-adns=yes, --with-adns=no, adns"
 PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
 
-EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark"
+EXTRA_OECONF += "--with-qt=no --enable-usr-local=no --enable-tshark --with-pcap=no --enable-pcap-ng-default"
 
 do_configure_prepend() {
     # force to use fallback 
-- 
1.9.1


