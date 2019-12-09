Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 14DE27FA49
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id s14so12995157wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=h909LFPf/jZ4ftxLnI5Zu+UIJUWnSFdRaAB6XPhXhFU=;
	b=Ol/iVo/n6u8CmIguSEI7DzkS16Mb1sJ7eDwZbfoILdMYobs6BDBbtc7CSOXU0zTuld
	bRGaFAiZQp7i2kAA8RNKBeP9sp1rGqSlojSfGKwlYAiisKf+0+sr9DC3K+7mT7OjTvSl
	t/IftBMvo0kRRTVBhzyhmmH2dfQzgquhqtAjdN7IfcK4pJTt+APTYCrNZx0LIa2b6tZs
	sj6eo6tkJqTwGSMoPZV5u+vTu8kz4MdT3tjX+fdQh+NJL2oi3UFd0Gox5qINH+TJiOTV
	1SNf0oSHfCsR5mHc+2lpa6f/JIKMW20UpAlMSuZpglGQUeiFfS9oDPPqJNWk5RgK2tEE
	VrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h909LFPf/jZ4ftxLnI5Zu+UIJUWnSFdRaAB6XPhXhFU=;
	b=Kg2B2U88ltXkKTAG3uyCSPGSwftyx7GX4F2tJ2WYurJkUmLnjukKYb/ejD1oJ3TFtS
	hTOLweHYl8MFlGE+6SlLX0ZxgjsXadAoElH3OQ1LrBfz5QKo8EpSJpBl286oVF1D6WDZ
	kPwc2Xc28UHS9CwUNSrHJG/eyQDRDVuvbDARW33nMDK3DhDsdinjD3sNRivZLJU1KCg/
	GTzek0YQE+/6xSEuh+gc2o0KQCOKXJWvISTNCuhi7LxJHZ64NDPOdJ7NV+m9SkGx+zzC
	GybzOSiqnlfDjs/rmTI1WezQzeaKLdASH5sQwESequRteF5F2C6zkwVSb/FCQnk22Q8E
	lB0A==
X-Gm-Message-State: APjAAAW7m6LUPly0qRtlZ3l2e3EPPnoinuswjx1nIH5wF4CKMdSQ2afE
	15qT4lXmV9B03G/oWeSFHvMeeFuN
X-Google-Smtp-Source: APXvYqyvhBYJt/i73nWY3SIh9lwYc5I1c/PBNVLz3Oj/DPt+D4Jyte+AFQSNS651jQ0LsjL2xU4HZg==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr22266369wmc.9.1575851944588;
	Sun, 08 Dec 2019 16:39:04 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:24 +0100
Message-Id: <20191209003840.3383-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/29] grilo: initial add 0.3.10
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is an unconditional dependency for upcoming gnome-control-center

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/grilo/grilo_0.3.10.bb       | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
new file mode 100644
index 000000000..e3fd67172
--- /dev/null
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Grilo is a framework forsearching media content from various sources"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+DEPENDS = " \
+    libxml2 \
+    glib-2.0 \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gobject-introspection gtk-doc gettext vala
+
+SRC_URI[archive.md5sum] = "f02bf585d1a48dc65be8b90ae3b08330"
+SRC_URI[archive.sha256sum] = "7e44b2e74c31ed24eb97e43265a9e41effe8660287b02295111805c7bda7f1e8"
+
+GIR_MESON_OPTION = "enable-introspection"
+GTKDOC_MESON_OPTION = "enable-gtk-doc"
+
+# Note: removing 'net' from PACKAGECONFIG causes
+# | bindings/vala/meson.build:15:0: ERROR: Unknown variable "grlnet_gir".
+PACKAGECONFIG ??= "net"
+
+PACKAGECONFIG[net] = "-Denable-grl-net=true, -Denable-grl-net=false, libsoup-2.4"
+PACKAGECONFIG[test-ui] = "-Denable-test-ui=true, -Denable-test-ui=false, gtk+3 liboauth"
+
+# Once we have a recipe for 'totem-plparser' this can turn into a PACKAGECONFIG
+EXTRA_OEMESON = "-Denable-grl-pls=false"
+
-- 
2.21.0


