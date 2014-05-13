Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f47.google.com (unknown [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 96FCF65F99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 14:49:00 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id c13so500904eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=frcvPBNEe6lMc2SPSNck8JOIihS9TgRr5usmI38GlgU=;
	b=yFRnfKQSj98r033gsCYZui/KrsgLm0BUMEQZxjjNvgWuHgC0OqQ4ggaGPMH1ymrPYe
	Ez9KjvjS87xgm2CQV4TkwO1t5BqcRyCIGBtr18XGt/Ce8+Eh4O6FptQ3rr/H8+xZUM97
	Ze7NSvYMb+Ip9/Jck7GiaYGHgNJX9jYhH4DI5bZ4GEdRrW8G0V8ALaDKkUZI+LW7Tyqd
	oL2pg5IsNzHSTVz8vgiHdRr867UVIw+ugWlssJs5QMw0FemiVPXiSYztt4wDIYr2d0NU
	iKHyShAUcY2JVAtAhmKqRvhmTsQkCRxZDucal3ZDursSvAZ2qr8TDFTKADK6fNjslziQ
	ey2w==
X-Received: by 10.14.208.195 with SMTP id q43mr3286208eeo.42.1399992541627;
	Tue, 13 May 2014 07:49:01 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-161-153.unitymediagroup.de.
	[95.222.161.153]) by mx.google.com with ESMTPSA id
	m44sm40701315eeh.14.2014.05.13.07.49.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 May 2014 07:49:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2014 16:48:48 +0200
Message-Id: <1399992528-10108-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399992528-10108-1-git-send-email-schnitzeltony@googlemail.com>
References: <1399992528-10108-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH, V2][meta-qt5 3/3] qtwayland: install created private headers
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
X-List-Received-Date: Tue, 13 May 2014 14:49:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

buildhistory diff:
--- a/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayland/qtwayland-dev/latest
+++ b/packages/armv7at2hf-vfp-neon-angstrom_wl-linux-gnueabi/qtwayland/qtwayland-dev/latest
@@ -4,6 +4,6 @@ PKGV = 5.2.1+git0+f9ebbd6c61
 RPROVIDES =
 RDEPENDS = qtwayland
 RRECOMMENDS = eglibc-dev libgcc-dev libstdc++-dev libxkbcommon-dev qtbase-dev qtdeclarative-dev wayland-dev xproto-dev zlib-dev
-PKGSIZE = 295533
+PKGSIZE = 537651
 FILES = /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.o /usr/lib/qtwayland/*.la /lib/*.la
-FILELIST = /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/qwlclientbufferintegration_p.h /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/qwlclientbufferintegrat
+FILELIST = /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/qwayland-server-hardware-integration.h /usr/include/qt5/QtCompositor/5.3.0/QtCompositor/private/qwayland-server

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtwayland_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index ebdda82..df7a562 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -9,3 +9,8 @@ SRCREV = "f9ebbd6c618488f9b671f5504528ced3350754fb"
 SRC_URI += " \
     file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \
 "
+
+do_install_append() {
+    # do install files created by qtwaylandscanner
+    install ${B}/include/QtCompositor/5.3.0/QtCompositor/private/{qwayland-server-*,*protocol*}.h ${D}${includedir}/${QT_DIR_NAME}/QtCompositor/5.3.0/QtCompositor/private
+}
-- 
1.8.3.1


