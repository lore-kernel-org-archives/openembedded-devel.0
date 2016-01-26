Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D2B0173D27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2016 11:55:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l65so16895267wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2016 03:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=6dHHQ+LUydWjEyMWlYujqtlXdpizzkM+GAb0tEMq/6A=;
	b=xprLKM2IK1jZvddan6xFSt42NYIUtKrkqazTcBb0vfzyRq5+qYNQicUteSvfEQxN2f
	v1vc6/rbwRZ0sGHxUb+qv9EecCd/DewsUiE2Fi7e7zIAlSwCxF6KiJKOVCqJ3adXquKK
	HTFuOLAZYRjEt7OWgaqGyZYyAhwhNYLFf6hoxzhpyWeHYzvjyC2z2hReYOgdS48Z98pS
	Y4bG/r+L6ndq0mArbYcqu6KoORFlQ9tQ3tT1ro55ICC/mHNWL9HiRwnKV2EHOqmUG7lO
	WU2EXTZVQuTXJkLo13WJozZRsqHVuU1yjfPVjjr3G4+vJcshKKq72MR+JXXIfFxqLeI2
	hI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=6dHHQ+LUydWjEyMWlYujqtlXdpizzkM+GAb0tEMq/6A=;
	b=eZKBdm8w8Rtk5ZrZCEHiUagUDupyEjzPqW9CqGyUWbqvsDlApjWLV4cByfeXM0Rmin
	UFkUTr1TaBM+1AU2xUhXXbtxpw58xpvb+IhiYM1nMAMmxm0AAZulJxl3fA480zslNTR1
	sJfpNx8l0UY4vzB9O2LNrfAJ5B3xj2cSsvXLPoEgaenP/92jWzsAiUkjItcT2lBXas55
	oSFG8szIOhF57s6hqDV2K2WxRnBDPDveOTCB5zDPIUV4fh605OEtTupD7nD84T50yJ3H
	O6c0J78yqbIN9oTDpzl/DveWYMpTdtTooCe7f/pJUYHyF1vODESECnRwMY6/I0n8u7IZ
	31wg==
X-Gm-Message-State: AG10YOSbqT3JwpYcWlyyfjy19PYAjh+qCFi044fW8JCC2YXDbMlv0ab0nZ/Vnccl7z6oqA==
X-Received: by 10.28.11.77 with SMTP id 74mr25190295wml.36.1453809354392;
	Tue, 26 Jan 2016 03:55:54 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	m143sm2532503wma.17.2016.01.26.03.55.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jan 2016 03:55:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jan 2016 12:55:21 +0100
Message-Id: <1453809321-10937-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453809321-10937-1-git-send-email-schnitzeltony@googlemail.com>
References: <1453809321-10937-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] geis: initial add 2.2.17
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
X-List-Received-Date: Tue, 26 Jan 2016 11:55:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../canonical-multitouch/geis_2.2.17.bb            | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
new file mode 100644
index 0000000..9403bdf
--- /dev/null
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -0,0 +1,52 @@
+SUMMARY = "An implementation of the GEIS interface"
+DESCRIPTION = "An implementation of the GEIS (Gesture Engine Interface and Support) \
+interface\
+GEIS is a library for applications and toolkit programmers which \
+provides a consistent platform independent interface for any \
+system-wide input gesture recognition mechanism."
+
+HOMEPAGE = "https://launchpad.net/geis"
+
+LICENSE = "GPLv3 & LGPLv3"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6 \
+    file://COPYING.GPL;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
+"
+
+inherit autotools pkgconfig python3native lib_package
+
+DEPENDS += "grail dbus-glib python3"
+
+SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "2ff9d76a3ea5794516bb02c9d1924faf"
+SRC_URI[sha256sum] = "8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
+
+EXTRA_OECONF = "--disable-integration-tests"
+
+FILES_${PN}-bin = "${bindir}"
+RDEPENDS_${PN}-bin = " \
+    python3-compression \
+    python3-core \
+    python3-crypt \
+    python3-ctypes \
+    python3-fcntl \
+    python3-misc \
+    python3-pickle \
+    python3-shell \
+    python3-stringold \
+    python3-subprocess \
+    python3-textutils \
+    python3-threading \
+"
+
+FILES_${PN} += " \
+    ${datadir}/geisview \
+    ${libdir}/${PYTHON_DIR}/site-packages/geis* \
+    ${libdir}/${PYTHON_DIR}/site-packages/_*.so \
+"
+
+FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
+
+FILES_${PN}-dev += "${libdir}/${PYTHON_DIR}/site-packages/_*.la"
+
+FILES_${PN}-staticdev += "${libdir}/${PYTHON_DIR}/site-packages/_*.a"
-- 
2.5.0


