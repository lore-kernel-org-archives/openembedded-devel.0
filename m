Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8DE65FF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 05:43:24 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so344745wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 22:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UYfcDySlizLtUep1o2ZKRFyhV0sXFMktIFMS3PGe80g=;
	b=N/TmYQk5Aw/sA6F4RrHOxUBF3gJSuOev8/MsbvxtnrUEg7veVg2hwUeBISii4OFT5A
	3GxFiJJg/WrDinRy3Ov2MZJz7Q8sSjSd+WzZpNVnVxtm9I91SA2KvY5aRNZM6jxjgqtB
	3VnpiRzQIFP2mi/Zhj9Nw2cIGEphlfjkOp+VRUB2P9ktaLhxi1SkOituDzdJf9zsIPT9
	9VUFkVh+G06cuYNFj0kANc42tsj8fhEnkZwvpspTkiwPnYXW6Dikl7BeTOoxFjDsgPKL
	obfcq2ULGk5H471GtjLaKih1H/EQnPqMDTTFYFpm0fBC0ImRimDw02AlV1mc0vhn00P6
	PQlg==
X-Gm-Message-State: ALoCoQlklhnFqZeklSl3YWOH1GOE9ITwRsbHm2b1yI3BFNLvtjbPo1gOWPe9NNPA7BRxganFKACU
X-Received: by 10.180.24.66 with SMTP id s2mr10458293wif.33.1405489405295;
	Tue, 15 Jul 2014 22:43:25 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	cd1sm37371898wjc.19.2014.07.15.22.43.23 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 22:43:24 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jul 2014 07:43:20 +0200
Message-Id: <1405489400-6339-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] ola: add 0.9.1
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
X-List-Received-Date: Wed, 16 Jul 2014 05:43:33 -0000

Open Lighting Architecture (OLA) is part of the Open Lighting Project
and provides applications with a mechanism to send and receive DMX512 &
RDM commands using hardware devices and DMX over IP protocols.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/ola/ola_git.bb | 47 ++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/ola/ola_git.bb

diff --git a/meta-oe/recipes-support/ola/ola_git.bb b/meta-oe/recipes-support/ola/ola_git.bb
new file mode 100644
index 0000000..4e24543
--- /dev/null
+++ b/meta-oe/recipes-support/ola/ola_git.bb
@@ -0,0 +1,47 @@
+SUMMARY = "Open Lighting Architecture - OLA"
+DESCRIPTION = "The Open Lighting Architecture (OLA) is part of the Open Lighting Project and provides applications with a mechanism to send and receive DMX512 & RDM commands using hardware devices and DMX over IP protocols. This enables software lighting controllers to communicate with hardware either via Ethernet or traditional DMX512 networks. \
+OLA can also convert DMX512 data sent using DMX over IP protocols from one format to another, allowing devices from different manufacturers to interact with one another. For example a Strand Lighting Console using ShowNet can send DMX512 to an Enttec EtherGate. When combined with a physical DMX interface such as the DMX USB Pro, OLA can send and receive data from wired DMX512 networks."
+
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=f1be0425937acddca9ed750ce30f821d"
+
+DEPENDS = "libmicrohttpd avahi libusb1 libftdi cppunit protobuf protobuf-native ola-native"
+DEPENDS_class-native = "protobuf cppunit"
+
+PV = "0.9.1"
+SRCREV = "8c7067514793baaeaa3033d77de163d981d7c73a"
+SRC_URI = "git://github.com/OpenLightingProject/ola.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pythonnative
+
+export BUILD_SYS
+export HOST_SYS
+export STAGING_LIBDIR
+
+EXTRA_OECONF = " --disable-unittests \
+               "
+
+EXTRA_OECONF_append_class-target = " --with-ola-protoc=${STAGING_BINDIR_NATIVE}/ola_protoc"
+
+# -fvisibility-inlines-hidden breaks stuff
+CXXFLAGS = "${CFLAGS}"
+
+# The code is not Werror safe
+do_configure_prepend() {
+	sed -i -e 's:-Werror::g' ${S}/configure.ac
+	sed -i -e 's:-Werror::g' ${S}/Makefile.am
+}
+
+do_install_append_class-native() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/protoc/ola_protoc ${D}${bindir}
+}
+
+FILES_${PN}-dbg += "${libdir}/*/.debug"
+FILES_${PN} += "${datadir}/olad ${libdir}/olad/*.so.*"
+FILES_${PN}-staticdev += "${libdir}/olad/*.a"
+FILES_${PN}-dev += "${libdir}/olad/*.la ${libdir}/olad/*.so"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.0


