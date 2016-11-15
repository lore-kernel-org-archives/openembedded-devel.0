Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9936D6B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 15:43:22 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g23so1120899wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 07:43:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=083jfhUJoah5NMeSdanM+kP6pIYkvy0YjV2IjHF8uKI=;
	b=DR6RlbAhHoRBEwSYLPvgxbaSB931sHXXi48BPzq81FlB8T6aID4uv9jwyX5F4SCw77
	0F439mJ2VIzsraautf6D/BSHH3nbPJeFCF4Nupoh8hapksIPO/aKmUOkctcRGL1C3xKQ
	hEggPS+VBfZlXa23Pxo5ZekdXI82fMXEXfIWulwjbZjxXmQsYrgdHYh3d3/XsB6PQwG+
	xV6uNGrrXxPvJ0hHR3sEco2sVoYzY7ks3SHvCIu+52jHaLJNq6rmiKvbLLi6FaCu1+XA
	RN3aqrU7LYL/GS4tXto2Ws7H9s/zc/LrbuQk2RNpI4iTE1KYuVyTCZD0yQ5QersbZfcG
	DsZA==
X-Gm-Message-State: ABUngveTEVKiEZH6QbkLekeftmHAnavsIG5OWa9oTwvs0UfN7xxZo/dyIesURNe/Q5lh0Q==
X-Received: by 10.28.24.67 with SMTP id 64mr4296161wmy.136.1479224603166;
	Tue, 15 Nov 2016 07:43:23 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f134sm4880716wmf.19.2016.11.15.07.43.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 07:43:22 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Nov 2016 15:43:10 +0000
Message-Id: <20161115154311.30118-2-git@andred.net>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161115154311.30118-1-git@andred.net>
References: <20161115154311.30118-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] libowfat: add v0.31
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
X-List-Received-Date: Tue, 15 Nov 2016 15:43:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 .../recipes-support/ncp/libowfat_0.31.bb           | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-networking/recipes-support/ncp/libowfat_0.31.bb

diff --git a/meta-networking/recipes-support/ncp/libowfat_0.31.bb b/meta-networking/recipes-support/ncp/libowfat_0.31.bb
new file mode 100644
index 0000000..4b072f7
--- /dev/null
+++ b/meta-networking/recipes-support/ncp/libowfat_0.31.bb
@@ -0,0 +1,27 @@
+SUMMARY = "reimplement libdjb"
+DESCRIPTION = "libowfat is a library of general purpose APIs extracted from Dan \
+Bernstein's software (libdjb), reimplemented and covered by the GNU \
+General Public License Version 2 (no later versions)."
+HOMEPAGE = "http://www.fefe.de/libowfat"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz"
+SRC_URI[md5sum] = "120798fab86cfd72dc6b12284d248dd0"
+SRC_URI[sha256sum] = "d1e4ac1cfccbb7dc51d77d96398e6302d229ba7538158826c84cb4254c7e8a12"
+
+EXTRA_OEMAKE = "\
+    DIET= \
+    CC='${BUILD_CC} ${BUILD_CPPFLAGS} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}' \
+    CCC='${CC}' CFLAGS='${CFLAGS} -I.' CFLAGS_OPT='${CFLAGS} -I.' \
+"
+
+do_install() {
+    make install \
+        DESTDIR=${D} \
+        INCLUDEDIR=${includedir}/${BPN} \
+        LIBDIR=${libdir} \
+        MAN3DIR=${mandir}/man3
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.10.2


