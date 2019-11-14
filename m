Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDB787F9B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:51 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c22so7469954wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=F/EWN+/1Mj42zmeOOdRhWmjy8g/VE4J8NSFXKJUIQlQ=;
	b=d/Z7QNo4ATtqi6Ou7pPZfSYppat/mgNL5uu9j+p0nglBfqc1FhsWg4HXHX8/bH/5wu
	rQoUWMEBUAuGApuOX5j4BLL22GZ1rRRHWrdBA7h7VWHUYOnaqA+DwuFZedkXVpqt/xQ/
	BctGHfcKXr9A1kUwnJc0lNvHZnsaS5N3cFgPHHFEUGiPQKL4Q8hw01fiLaTiqkk9aX8G
	KlPmvA9ykQ8DEFq53u2OlVXJLRLzSpiQbC1eAiKbst4L4wWQK16JS+J69VhmV/8imsxf
	EprcQxfx1PUotEeyn4yvC8lDe12i2Eu/eFSfCbP7ZyKFrBGHV34XB78xuVnt5oc1qNiI
	b/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F/EWN+/1Mj42zmeOOdRhWmjy8g/VE4J8NSFXKJUIQlQ=;
	b=A4dIY3IWDPE0frkY670ZWhAHZ6t5J3Tnc9/jn3GIqhgr5QxxJGPEfVrGU8xbQyyJbY
	GFrQKgxFdaKxmBBNsEyRt9T0w+kY7K/oM/owEeF/nahArc1aQWhTUdEUzru9h/VGOCcN
	C3OkdFDkwfZwi+IjK0f5lIXTMzolax0OZX5ewxkiOF7Qs2Tt0O3LOFogS07s6P66LOxJ
	kNRGhZXPxRC1UyAjJS1L4+voJrggiZNUNYam0RlhG3d79+yZ2t5DvUUhvHd60LKkigO+
	BzrqK4KZ0jNU/5bd3tas06tc62Np/0O/Uah1HSIZ+Fmn7P+Kyq1d14gZPy+giWHuRRyg
	DAqg==
X-Gm-Message-State: APjAAAWCpjzFb3C/FTp2ZF/EO3RwG4M4PpSkiemFhbJ2U8wDe/9B7oCW
	QLc6hbBwqIvcsqUyt141wsTjGy2V
X-Google-Smtp-Source: APXvYqzsAmPGDRhdQU8NmLCLPSleLveyySxEllBRLqH+Rvn6R84u5+5pe/13HpzWzdSc0Qx15dY+YQ==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr9795092wmi.141.1573760991661; 
	Thu, 14 Nov 2019 11:49:51 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:27 +0100
Message-Id: <20191114194930.2786-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/16] geocode-glib: initial add 3.26.1
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
 .../geocode-glib/geocode-glib_3.26.1.bb       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb

diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
new file mode 100644
index 000000000..dc218f3a3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A convenience library for the geocoding"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+GNOMEBASEBUILDCLASS = "meson"
+GIR_MESON_OPTION = "enable-introspection"
+GTKDOC_MESON_OPTION = "enable-gtk-doc"
+
+inherit gnomebase gobject-introspection gettext gtk-doc upstream-version-is-even
+
+DEPENDS = " \
+    json-glib \
+    libsoup-2.4 \
+"
+
+SRC_URI[archive.md5sum] = "21094494e66c86368add6a55bf480049"
+SRC_URI[archive.sha256sum] = "5baa6ab76a76c9fc567e4c32c3af2cd1d1784934c255bc5a62c512e6af6bde1c"
+
+EXTRA_OEMESON = "-Denable-installed-tests=false"
-- 
2.21.0


