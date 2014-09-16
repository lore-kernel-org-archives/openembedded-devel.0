Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id ED58D714C5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 23:50:29 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id hz1so829561pad.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 16:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=n0XUAhCLmB3L5gQxfPI4AMOv8JidosPtiijB3CXAvdg=;
	b=oBNtr7ER/uR/f6GbGMEQ2S+V46P66YZ17XCVT837B7sz/rsEkYsXkYw5WNKlyJ6dxA
	H8HHh9+7YURzdHZkR2SlAfI19z46lbtB+Tr7l9S7gmCXsOpWM2RZljPlW2Aw5K/wI5NU
	OTaS5gXoUdx8oGRtkp8L2UZBPtiBEjhWhYgvknh/pl1tXMzs36N1UWNN3PHIplSWMUIk
	zrc+pW1WnNgKenA3TIW9baIB5FqxdBcvMWs/OSKS+IqX+6CtIkkgAQW/WbQ+1+c1gQi/
	fdz6ihfkVVyQtHBVGS+48Ps0VJb25lHrlq0Sa6d/vADBysZqkTBpuJjWlG2vqtNb8464
	ky8w==
X-Received: by 10.70.128.137 with SMTP id no9mr26489003pdb.143.1410911431126; 
	Tue, 16 Sep 2014 16:50:31 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id j9sm15100581pdr.77.2014.09.16.16.50.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 16:50:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Sep 2014 16:50:19 -0700
Message-Id: <1410911419-466-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] wireshark: update to 12.1
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
X-List-Received-Date: Tue, 16 Sep 2014 23:50:37 -0000

following security fixes included:
MEGACO dissector infinite loop. (Bug 10333) CVE-2014-6423
Netflow dissector crash. (Bug 10370) CVE-2014-6424
CUPS dissector crash. (Bug 10353) CVE-2014-6425
HIP dissector infinite loop. CVE-2014-6426
RTSP dissector crash. (Bug 10381) CVE-2014-6427
SES dissector crash. (Bug 10454) CVE-2014-6428
Sniffer file parser crash. (Bug 10461) CVE-2014-6429 CVE-2014-6430 CVE-2014-6431 CVE-2014-6432

re-org'd dd file to be more in-line with style guide.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{wireshark_1.12.0.bb => wireshark_1.12.1.bb}    | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0.bb => wireshark_1.12.1.bb} (90%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
similarity index 90%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
rename to meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
index 39a24dc..71cc082 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
@@ -2,9 +2,19 @@ DESCRIPTION = "wireshark - a popular network protocol analyzer"
 HOMEPAGE = "http://www.wireshark.org"
 SECTION = "network"
 LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
 DEPENDS = "perl-native libcap libpcap pcre expat glib-2.0 libnl sbc"
 
+SRC_URI = " \
+    http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-${PV}.tar.bz2 \
+"
+
+PE = "1"
+
+SRC_URI[md5sum] = "14b3e3d8979d1eb27ff085bb5f400e67"
+SRC_URI[sha256sum]= "82b26bd416ec15903b27785e35a622687008a743342054e96eaaeaa249be584b"
+
 inherit autotools pkgconfig
 
 ARM_INSTRUCTION_SET = "arm"
@@ -27,16 +37,6 @@ PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
 
 EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark --with-c-ares=no"
 
-LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
-SRC_URI = " \
-    http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0.tar.bz2 \
-"
-
-PE = "1"
-
-SRC_URI[md5sum] = "8dcfe451d8769901129809d2e19c1fb7"
-SRC_URI[sha256sum]= "0f59fea1c5b35de90af681067e49113fee0dd7a901750a97fa25f4256dbf13c7"
-
 do_configure_prepend() {
     # force to use fallback 
     sed -i -e '/^glib_prefix/s/=.*$/=""/' ${S}/aclocal-flags
@@ -44,4 +44,3 @@ do_configure_prepend() {
 
 ALLOW_EMPTY_${PN} = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-- 
1.9.1


