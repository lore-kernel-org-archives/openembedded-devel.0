Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ULaVS-0001Cx-Dj
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 15:42:14 +0100
Received: by mail-ea0-f173.google.com with SMTP id k11so248514eaj.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 07:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=ofCjOOJ2v6gWA37nMtx392bWJnveBkzoi9wHUwRyccI=;
	b=mV2gbRYRBOzE9jlU/ZedXoufUG7aUzy0RZQnq8CaZ9PSwdGhD2tocNOi7KdfrxZPZj
	gI1EzHZDwQc/QV2TD/ggd3u3w1XLwSYIBTS79Zf5KLyP2EaxtibLhPh7cRwb8vUQqLgw
	5lAijuCR1bLXT6VsRPJW8vhWm5orzs3FoIaH85pwH31l0W9xMn7iNYx06B1CDJk+OlB8
	eWrEOwqQ3n5V67c+lqZbGL1npSAqwX3vVWzBy1/HD4hJ2+nfoMtOdD8iJgel5PzINkpX
	JRAZ0lKv7VSSQUcox2CBiVKGijstXH3qPtq3ZLpKxwUckoSXUmZnyoWmEdKgKJNYqlSP
	n0KA==
X-Received: by 10.15.23.193 with SMTP id h41mr8501852eeu.17.1364567110407;
	Fri, 29 Mar 2013 07:25:10 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id m46sm4277855eeo.16.2013.03.29.07.25.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 07:25:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 15:25:02 +0100
Message-Id: <1364567102-6409-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1364567102-6409-1-git-send-email-koen@dominion.thruhere.net>
References: <1364567102-6409-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmAhjd6GyqmRoPGzw+1eK/X3R7Hw+tIGT9/VlVlEdn0QOZd2IjQhBdNbwfOIwyBAzHpy6eJ
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][meta-oe][PATCH 2/2] crda: add 1.1.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 14:42:14 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-connectivity/crda/crda_1.1.3.bb        | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/crda/crda_1.1.3.bb

diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
new file mode 100644
index 0000000..d736c7a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Wireless Central Regulatory Domain Agent"
+HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
+
+
+DEPENDS = "python-m2crypto-native python-native libgcrypt libnl"
+
+SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
+           http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.11-regulatory.bin;name=bin \
+          "
+SRC_URI[crda.md5sum] = "29579185e06a75675507527243d28e5c"
+SRC_URI[crda.sha256sum] = "aa8a7fe92f0765986c421a5b6768a185375ac210393df0605ee132f6754825f0"
+SRC_URI[bin.md5sum] = "e0c8a5ca63fb8bf803213f9a0c90b50b"
+SRC_URI[bin.sha256sum] = "b1ee0b20c123c612dfdb6851ab42c01666f66fb583e0e590942f19bb54cf84be"
+
+inherit python-dir pythonnative
+# Recursive make problem
+EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D}"
+
+do_compile() {
+	oe_runmake all_noverify
+}
+
+do_install() {
+	oe_runmake install
+
+	install -d ${D}${libdir}/crda/
+
+	install -m 0644 ${WORKDIR}/2013.01.11-regulatory.bin ${D}${libdir}/crda/regulatory.bin
+}
+
+
+RDEPENDS_${PN} = "udev"
+FILES_${PN} += "${libdir}crda/regulatory.bin \
+                ${base_libdir}/udev/rules.d/85-regulatory.rules \
+               "
-- 
1.8.1.4



