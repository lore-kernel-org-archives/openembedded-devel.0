Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6F385719E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:37 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c4so445042pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CIFTu3Aq62A2fOZZ14vsy+38j6Fesd55bJYiR/jKOzU=;
	b=yJ04VWukgFTzMFH7NA8nhpT1r9+X8ug5WVi6IHvPkKt2GfiOGdZpPKiMWPPBfCIPf8
	Ok5Vzcgs9FG2DdP+wL+yu84Kio7k7fsaHdZLuKdf0UO7A2uN1Wt6BFi5lCmLlZ2+Soyu
	z2q3HO65qT+MXYw2yExNIB7/HCZiugxGKP0ZBOtpcZrQixVmqcS9/LCxUTIiqGBa1UqL
	aSJYk2CczSzX2Sk5NmE3MTZ/szZdeP2tYwph8eqlh1K9zz8fOq9oVcv3rEWLE4uuG4me
	RfiZOGMD+s4O8dyBkunoIIX274qZLve1VdoZ5qA70aR03nATQzubMmPYi4Szx03ZMH44
	FZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CIFTu3Aq62A2fOZZ14vsy+38j6Fesd55bJYiR/jKOzU=;
	b=bkPcJWLMsSDJ39imOlRUUJueHiVf/yM66J32pEgvIQPx8jNXPkasgx3rg9K3zolEsM
	FlCz3y4j5m5C61D8Vp9RK+5qC82DlS8o3GBLc/5r7euouVBBbzvbw7Je7jj+PcgwNuGF
	d9oFEFVr/eY0Ha1OlM4diZ8WwPrBp/HvEFtSTb2AN5cbNImdXTh2BdtLTREydSXU1aU8
	3VvSudVcJKl3/x9wKizw481wX9zRKdX1USC3ubiYRMhtLUQxX5UxolpXZ8NY0ATQjpFG
	PP0R8UA65oPQUocU7hvDKu9kHRMolKxyYouDCV8VkctjK2Dx0ouWfdh/Hx27OlXmIqV0
	fcCw==
X-Gm-Message-State: AKaTC022uaTeXJq4dwAabxFlVSPmOPkzsQ2TWLcwRsZ8ODCMVxuM5Lt8GG9tJ8WavyTOgg==
X-Received: by 10.99.66.198 with SMTP id p189mr3615541pga.30.1479892958995;
	Wed, 23 Nov 2016 01:22:38 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:49 -0800
Message-Id: <20161123092209.23699-29-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 29/49] dante: Add recipe for 1.4.1
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/dante/dante_1.4.1.bb         | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/dante/dante_1.4.1.bb

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
new file mode 100644
index 0000000..dbb86fb
--- /dev/null
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
@@ -0,0 +1,47 @@
+SECTION = "console/utils"
+SUMMARY = "A free SOCKS server"
+DESCRIPTION = "Dante consists of a SOCKS server and a SOCKS client,\
+implementing RFC 1928 and related standards. It is a flexible product\
+that can be used to provide convenient and secure network\
+connectivity. Once installed, Dante can in most cases be made\
+transparent to clients, providing functionality somewhat similar to\
+what could be described as a non-transparent Layer 4 router."
+HOMEPAGE = "http://www.inet.no/dante/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=221118dda731fe93a85d0ed973467249"
+
+SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "68c2ce12119e12cea11a90c7a80efa8f"
+SRC_URI[sha256sum] = "b6d232bd6fefc87d14bf97e447e4fcdeef4b28b16b048d804b50b48f261c4f53"
+
+# without --without-gssapi, config.log will contain reference to /usr/lib
+# as a consequence of GSSAPI path being set to /usr by default.
+# --with-gssapi-path=PATH specify gssapi path
+# --without-gssapi        disable gssapi support
+# --enable-release        build prerelease as full release
+EXTRA_OECONF += "--without-gssapi --sbindir=${bindir}"
+
+DEPENDS += "flex-native bison-native"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+inherit autotools-brokensep
+
+EXTRA_AUTORECONF = "-I ${S}"
+
+PACKAGECONFIG[libwrap] = ",--disable-libwrap,tcp-wrappers,libwrap"
+
+PACKAGECONFIG ??= ""
+
+do_install_append() {
+    install -d ${D}${sysconfdir}
+    cp ${S}/example/sock[sd].conf ${D}${sysconfdir}
+}
+
+PACKAGES =+ "${PN}-sockd ${PN}-libdsocks "
+
+FILES_${PN}-libdsocks = "${libdir}/libdsocks.so"
+FILES_${PN}-sockd = "${bindir}/sockd ${sysconfdir}/sockd.conf"
+
+INSANE_SKIP_${PN}-libdsocks = "dev-elf"
-- 
2.10.2


