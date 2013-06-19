Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE4B6AD3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 17:29:49 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so3391329ead.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=GGxEzIUd9rW2+ITcB2EoTZGeXkTGen8Mp2/z2UeaJlA=;
	b=rYCXzoIqCVSTC+SLDxU8HZ18Qc/iaO4c/R7VDuJQsnsKMpKAXgiJHlAhmYR/k2w7NI
	wjIvV5xDgdCByABwjJGs/11nVG1tIvUBr+cmo+WTGeBIHyO4JdlEZmige3+vSMtWk7L0
	zuWmEt4fYQepa7WLlyBb1iaq44n+fm/S4qYk47Oyk0NymrbAgbMm/zz98D4EAcQD4kgP
	WsKGoZ+dPzaZY+MXYDW3hxpGWBGyR7vkJvd+e6D95jM48QsMcgTYoKehixJ8PYdZQVQg
	yWN0vEHn0niTDwhy1C4OL7+WBJO0EZals7jQHz+U8FcX81TPM9pTto2tzKLTWtWCbiC2
	Iy2A==
X-Received: by 10.14.2.73 with SMTP id 49mr3551238eee.118.1371662990736;
	Wed, 19 Jun 2013 10:29:50 -0700 (PDT)
Received: from localhost.localdomain (p5B0A06AC.dip0.t-ipconnect.de.
	[91.10.6.172]) by mx.google.com with ESMTPSA id
	n42sm38290045eeh.15.2013.06.19.10.29.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 19 Jun 2013 10:29:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2013 19:29:14 +0200
Message-Id: <1371662967-31734-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
References: <1371662967-31734-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce/V2 07/20] p11-kit: initial add 0.19.1
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
X-List-Received-Date: Wed, 19 Jun 2013 17:29:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb

diff --git a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
new file mode 100644
index 0000000..c5b6129
--- /dev/null
+++ b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Provides a way to load and enumerate PKCS#11 modules"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
+
+inherit autotools gettext pkgconfig
+
+DEPENDS = "libtasn1 libffi"
+
+SRC_URI = "http://p11-glue.freedesktop.org/releases/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "d96046ab6ac00d005342caf416ed76ab"
+SRC_URI[sha256sum] = "94fbed372c11d0a404762aad966e54eb4f44c1d5b871a1b79a1a3b4cf36ed256"
+
+FILES_${PN}-dev += " \
+    ${libdir}/p11-kit-proxy.so \
+    ${libdir}/pkcs11/p11-kit-trust.so \
+"
+FILES_${PN}-dev += "${libdir}/pkcs11/*.la"
+FILES_${PN}-dbg += "${libdir}/pkcs11/.debug"
-- 
1.7.4.4


