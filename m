Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2D27F9B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:52 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e6so8057986wrw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5k4nvt2EItPKYKOWcDZgr9zlOsP6Bkei0qkQ3+2PFP4=;
	b=do0Tl+oTZW6C91+QPxf+Crw8aZDGZxYwitYva/HnEn/oHwcPkUebQASQsfFkI356KC
	LA71CzZvLzXQOSzqOSnIlsJAju7DLSb1NRhS553zV0JhHEySk1xwVkNdkXWgnk8gbjyT
	8ise/qkDz5eXRo8jss5ShFmLrnKpgzQyVYRA4YN1oa5hDiQrSuhSlHHCjD9JirRLDBE8
	f0oU9QbPEnwD3e9kKQjp4KliOAkK2LulPoEM+uU8C2PcWmTgzuH5j8wS8LEU/+DbxUQH
	jkzXir+GPiryECtAtNqPr0D/4aZHrZVH6Mdld6NTK6uF0vfcCSITUqf6bN+yn15/hHO2
	tuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5k4nvt2EItPKYKOWcDZgr9zlOsP6Bkei0qkQ3+2PFP4=;
	b=tvlznQM1X4yTY0jfK7pwV19frh6r3yNGj9UQ6ivrCXTCViIyWMZxGsllRiKHV6aNYe
	6PT6A5Zzg1aFygT4V1HncivRSTwR814HitG3t6tHjuyPALqDTOlSY/gZK6gxJ6orF0Qi
	PSEif8bDnyOZDRfzGLO4XN32F3W6GJlAZiU3ba6FHDwcuSn6Feqb4rsY06WwoPlKRq1h
	zRX7PAZv1kmXcqB0Hecx2P01rL5b0W7/+CR6Blza9+uQT7HYSh9WB9okyLA4T3q3gNAz
	3sKcT664AkblbGt5LXCW9nnp9rAqvPdcM2GsOPhNSrm2NSIWf+Qpb9/PVmwsDMoGv5vM
	vJXA==
X-Gm-Message-State: APjAAAU7ToB2VeRPYZrSzlyQRbPtSDUMJEHriYudjrLqooFkhOiziQ/0
	QJHGRnpLbR2ely7H6S75Tz2FlvGx
X-Google-Smtp-Source: APXvYqzvF6GJUztDxRT2wfDuc+iHl1X58pVQkckplm+IrUNQQtblx3pVpWkjaEqZk7aHySa44gLq4w==
X-Received: by 2002:a5d:4247:: with SMTP id s7mr3701560wrr.381.1573760992584; 
	Thu, 14 Nov 2019 11:49:52 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:28 +0100
Message-Id: <20191114194930.2786-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/16] libgweather: initial add 3.34.0
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming gnome-settings-daemon

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgweather/libgweather_3.34.0.bb         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb b/meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb
new file mode 100644
index 000000000..2d31be08d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A library to access weather information from online services"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gobject-introspection gettext gtk-doc vala distro_features_check
+
+SRC_URI[archive.md5sum] = "52c3b1e27887fc88f862c92c42d930c1"
+SRC_URI[archive.sha256sum] = "02245395d639d9749fe2d19b7e66b64a152b9509ab0e5aad92514538b9c6f1b9"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+DEPENDS = " \
+    gtk+3 \
+    json-glib \
+    libsoup-2.4 \
+    geocode-glib \
+"
-- 
2.21.0


