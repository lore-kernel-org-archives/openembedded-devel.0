Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5101D72D0D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 17:43:50 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id ft15so9724157pdb.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 09:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rOjQoUcSoO57Q0a/TiXTphPzYo9FV+V78+1GRh47TaA=;
	b=Rhnn0WrjqCN9/bSRx5BdS3yRBPChQK30+qeGvBfEaVkhPxcNcsXNDTw0/Cfp9NpTrw
	4H8XV7Ss36aFJr5BsnQoKLowUJhfamcybo4bHg6BJlrpDq/o/Kk4+oQ9shJvFMKRmV4u
	tTllXqYP3VdRpoVAPAJ0eNO1eYEEu7SyxMMrSuRQuxvncClZac0j/5EDTR4qd3Xc96ox
	RAlscpVgM1F8NRztjLgG34JQRik7eSW3QF8GomyimDlDlbpXY1MUkiCoX8sLhhRlhGbk
	XdUcGLR+kzNLj1GwTZk4CHdBRU/J9e9rsRWoF9Qs3+PoP2ZZtkAYLuU8n0LG2SnGlGxj
	ENDQ==
X-Received: by 10.68.238.234 with SMTP id vn10mr13007274pbc.140.1422035030655; 
	Fri, 23 Jan 2015 09:43:50 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id fm4sm2487462pdb.88.2015.01.23.09.43.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Jan 2015 09:43:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Jan 2015 09:43:46 -0800
Message-Id: <1422035026-3909-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][PATCH] wireshark: fix rdepends issue
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
X-List-Received-Date: Fri, 23 Jan 2015 17:43:57 -0000

From: Armin Kuster <akuster@mvista.com>

Added a few more PACKAGECONF options

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-support/wireshark/wireshark_1.12.3.bb          | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
index 2dd99d6..7604bd7 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
@@ -4,7 +4,7 @@ SECTION = "network"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
-DEPENDS = "perl-native libcap libpcap pcre expat glib-2.0 libnl sbc"
+DEPENDS = "perl-native libcap libpcap pcre expat glib-2.0 sbc"
 
 SRC_URI = " \
     http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-${PV}.tar.bz2 \
@@ -23,11 +23,12 @@ ARM_INSTRUCTION_SET = "arm"
 # Works with either gtk+ or gtk3.
 WHICH_GTK = "gtk3"
 
-PACKAGECONFIG ??= "gnutls gcrypt"
+PACKAGECONFIG ??= "gnutls gcrypt libnl"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${WHICH_GTK}  graphics", "", d)}"
 PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
 
 PACKAGECONFIG[libsmi] = "--with-libsmi=yes, --with-libsmi=no, libsmi"
+PACKAGECONFIG[libnl] = "--with-libnl=yes, --with-libnl=no, libnl"
 PACKAGECONFIG[portaudio] = "--with-portaudio=yes, --with-portaudio=no, portaudio-v19"
 PACKAGECONFIG[gtk2] = "--with-gtk2=yes, --with-gtk2=no, gtk+"
 PACKAGECONFIG[gtk3] = "--with-gtk3=yes, --with-gtk3=no, gtk+3"
@@ -36,8 +37,15 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
 PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
 PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
+PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
+PACKAGECONFIG[zlib] = "--with-zlib=yes, --with-zlib=no, zlib"
+PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 
-EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark --with-c-ares=no"
+# these next two options require addional layers
+PACKAGECONFIG[adns] = "--with-adns=yes, --with-adns=no, adns"
+PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
+
+EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark"
 
 do_configure_prepend() {
     # force to use fallback 
-- 
1.9.1


