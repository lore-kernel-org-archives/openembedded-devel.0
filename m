Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id B64BA71E54
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 16:04:20 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id a197so170745438wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2016 08:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7RyxC8WbBlDXnDnkTVjPhrzYDq4rtnL1mrdL3xvUo2U=;
	b=imChcTIq4PeTCjbL8+ZwZDK6k/Fe9FAQSIaqGmbqMljTh1CwyaA/leSuB5aNXTK9SL
	CsugVqkdgBAkqoDtFhscHVj4FJGhHqW8iMFaTEfFLiIUS74JUgredXn/jTlnQMPoz5Aj
	M0xtEYxeqUirILIqIp1hMAkbV+qlbC5FphHV1vImX0vWtBwl16Vv8Cbp/dfJl3UVICbr
	/4l3sYUwtQ6mgBlHKEKQ8geYhAxcJRSZqxiVDFgC4wdlRedKRQeucdsbh6+piderAhz5
	CR8OFsPhbU7P0F7RXEg8y1ARMaQsTYzdywWXkAYJuwvbqbvo22HOzZ0oQzgCWPZfpzxg
	hP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7RyxC8WbBlDXnDnkTVjPhrzYDq4rtnL1mrdL3xvUo2U=;
	b=PYl4GKpgK7ENOMjQNECe0ANF9RTr1GoF2U0/HurS48bi8KkHHid/ZM47m1/LzDP4nb
	jpoZTfxowxmvtmBXytEvOw6P3wJIPNJajmOmaQ+HjZfNllXVntwmy0phBHq236qTQ8Il
	C7tiGKzl5Ikfidazql2OMmnCspQ3pYKbVQ9XukRDVSa8nnLWqHnxAp2j4EtEhbwRnzgu
	SRei2b+60mC9pt3DAEL6TMGDiRzwhDTkegdsvyupGKzgwLzOTwE8yobhZtF2wCWY3JNh
	hTs8rGcFgnbRnUkIkasyr002TA5FS5Iy+4rky5uw1vhDhZab6VqaghNdLmMdh0XCnSu8
	ZTQQ==
X-Gm-Message-State: AIkVDXKbBnUvb8Ibl9t8zxblv1nHgH5fRDJeWocvlrInk+Easa7b6e0sX5W4sHbe7HLv8w==
X-Received: by 10.28.193.199 with SMTP id r190mr2076854wmf.58.1481817861128;
	Thu, 15 Dec 2016 08:04:21 -0800 (PST)
Received: from localhost.localdomain
	(ip-217-103-177-37.ip.prioritytelecom.net. [217.103.177.37])
	by smtp.gmail.com with ESMTPSA id w8sm13039585wmw.4.2016.12.15.08.04.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Dec 2016 08:04:20 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2016 08:04:11 -0800
Message-Id: <1481817851-17771-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] dibbler: add initial recipe, dibbler 1.0.1
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
X-List-Received-Date: Thu, 15 Dec 2016 16:04:21 -0000

Dibbler is a portable DHCPv6 implementation.

  http://klub.com.pl/dhcpv6/

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-connectivity/dibbler/dibbler_1.0.1.bb  | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb

diff --git a/meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb b/meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb
new file mode 100644
index 0000000..41bb78f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/dibbler/dibbler_1.0.1.bb
@@ -0,0 +1,40 @@
+SUMMARY = "A portable DHCPv6 implementation"
+DESCRIPTION = "Dibbler is a portable DHCPv6 implementation. It supports stateful \
+(i.e. IPv6 address granting and IPv6 prefix delegation) as well as stateless (i.e. \
+option granting) autoconfiguration for IPv6."
+HOMEPAGE = "http://klub.com.pl/dhcpv6"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7236695bb6d4461c105d685a8b61c4e3 \
+                    file://bison++/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "http://klub.com.pl/dhcpv6/dibbler/dibbler-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "93357bea3ec35b0c1d11242055361409"
+SRC_URI[sha256sum] = "27869877e060c039cbc24a5f6a9dd69006bf67de0ffdf29a645a80aef6e476a1"
+
+inherit autotools
+
+PACKAGECONFIG ?= "auth bind-reuse dns-update dst-addr-filter link-state"
+
+PACKAGECONFIG[auth] = "--enable-auth,--disable-auth"
+PACKAGECONFIG[bind-reuse] = "--enable-bind-reuse,--disable-bind-reuse"
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
+PACKAGECONFIG[dns-update] = "--enable-dns-update,--disable-dns-update"
+PACKAGECONFIG[dst-addr-filter] = "--enable-dst-addr-filter,--disable-dst-addr-filter"
+PACKAGECONFIG[link-state] = "--enable-link-state,--disable-link-state"
+PACKAGECONFIG[remote-autoconf] = "--enable-remote-autoconf,--disable-remote-autoconf"
+PACKAGECONFIG[resolvconf] = "--enable-resolvconf,--disable-resolvconf"
+
+EXTRA_OECONF += " \
+    --disable-efence \
+    --with-gtest=no \
+"
+
+PACKAGES =+ "${PN}-client ${PN}-relay ${PN}-requestor ${PN}-server"
+
+FILES_${PN}-client = "${sbindir}/${PN}-client"
+FILES_${PN}-relay = "${sbindir}/${PN}-relay"
+FILES_${PN}-requestor = "${sbindir}/${PN}-requestor"
+FILES_${PN}-server = "${sbindir}/${PN}-server"
-- 
1.9.1


