Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7BD65C9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 02:10:53 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so32025987pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2015 19:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=D9NrMj84FYyjI87y4VhSieKVWbeN0iYopp6JZ6Oe/O4=;
	b=NVXa0/x39Hb3VO3HXw14OoszS/fVTacHDuwX7+NGSCZwaG8bM7LCMviOhOlJH7fLUK
	EQ7VgfMOzH8T8RAnpPS8K8s6Ft+Efd2gfy8sDxuhMU67KTzeYZnpIoYRNcwIYPgrSvZ2
	GaVxbDyANi5alv90v6S9wCkQ9xdhAl9tggNSEaE0BtjdOtproIZN9cgpbzeZ7WalBBnH
	GVouiAR2ZNRuZXRU0sC5P35AdUk/HeLQWGYTKWdt5czD6IHvmaOLgbiOcet4EqxaqH9a
	VY3SvmVt12gP3VmpZYCRuKlQjlxq+GKVN7Y0QkPIqohqrSiUH5M8vq5bix3PP+mrhiMK
	1ing==
X-Received: by 10.66.62.166 with SMTP id z6mr26151789par.42.1431915054458;
	Sun, 17 May 2015 19:10:54 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id ge4sm8218863pbc.52.2015.05.17.19.10.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 May 2015 19:10:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Sun, 17 May 2015 19:10:41 -0700
Message-Id: <1431915041-2961-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] whireshark: update to 12.5
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
X-List-Received-Date: Mon, 18 May 2015 02:10:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v2: cleanup extra spaces in last patch noticed by Martin.


fixed broken url and cleaned up the PACKAGECONFIG
removed patch as it is included in this release

The following vulnerabilities have been fixed.
* [1]wnpa-sec-2015-12
The LBMR dissector could go into an infinite loop. ([2]Bug 11036)
[3]CVE-2015-3808 [4]CVE-2015-3809

* [5]wnpa-sec-2015-13
The WebSocket dissector could recurse excessively. ([6]Bug 10989)
[7]CVE-2015-3810

* [8]wnpa-sec-2015-14
The WCP dissector could crash while decompressing data. ([9]Bug
10978) [10]CVE-2015-3811

* [11]wnpa-sec-2015-15
The X11 dissector could leak memory. ([12]Bug 11088)
[13]CVE-2015-3812

* [14]wnpa-sec-2015-16
The packet reassembly code could leak memory. ([15]Bug 11129)
[16]CVE-2015-3813

* [17]wnpa-sec-2015-17
The IEEE 802.11 dissector could go into an infinite loop. ([18]Bug
11110) [19]CVE-2015-3814

* [20]wnpa-sec-2015-18
The Android Logcat file parser could crash. Discovered by Hanno
Böck. ([21]Bug 11188) [22]CVE-2015-3815

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{wireshark_1.12.4.bb => wireshark_1.12.5.bb}         | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.4.bb => wireshark_1.12.5.bb} (78%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.5.bb
similarity index 78%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_1.12.5.bb
index 6833216..ae419aa 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.5.bb
@@ -6,15 +6,12 @@ LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
 DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
-SRC_URI = " \
-    http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-${PV}.tar.bz2 \
-    file://Do-not-set-CC_FOR_BUILD-flags.patch \
-"
+SRC_URI = "https://2.na.dl.wireshark.org/src/wireshark-${PV}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "acfa156fd35cb66c867b1ace992e4b5b"
-SRC_URI[sha256sum] = "de804e98e252e4b795d28d6ac2d48d7f5aacd9b046ee44d44266983795ebc312"
+SRC_URI[md5sum] = "9ee199dde4f36a3d71f7b81dd6764e93"
+SRC_URI[sha256sum] = "d0f177b2ef49e4deae4ff7d3299bdd295ba558a3934ce8ae489b2f13927cbd82"
 
 inherit autotools pkgconfig
 
@@ -23,11 +20,12 @@ ARM_INSTRUCTION_SET = "arm"
 # Works with either gtk+ or gtk3.
 WHICH_GTK = "gtk3"
 
-PACKAGECONFIG ??= "libcap gnutls libnl"
+PACKAGECONFIG ?= "libpcap gnutls libnl libcap"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${WHICH_GTK}  graphics", "", d)}"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
 
-PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_DIR_HOST}, --with-libcap=no, libcap"
+PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_LIBDIR}, --with-libcap=no --enable-pcap-ng-default , libcap"
+PACKAGECONFIG[libpcap] = "--with-pcap=${STAGING_LIBDIR} --with-pcap-remote, --with-pcap=no --enable-pcap-ng-default  , libpcap"
 PACKAGECONFIG[libsmi] = "--with-libsmi=yes, --with-libsmi=no, libsmi"
 PACKAGECONFIG[libnl] = "--with-libnl=yes, --with-libnl=no, libnl"
 PACKAGECONFIG[portaudio] = "--with-portaudio=yes, --with-portaudio=no, portaudio-v19"
@@ -46,7 +44,7 @@ PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[adns] = "--with-adns=yes, --with-adns=no, adns"
 PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
 
-EXTRA_OECONF += "--with-qt=no --enable-usr-local=no --enable-tshark --with-pcap=no --enable-pcap-ng-default"
+EXTRA_OECONF += "--with-qt=no --enable-usr-local=no --enable-tshark --enable-rawshark"
 
 do_configure_prepend() {
     # force to use fallback 
-- 
2.3.5


