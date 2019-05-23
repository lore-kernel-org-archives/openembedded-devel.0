Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 13DF27E42D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b18so4849613wrq.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=y9qNgQECbn4UG5z0TIocwM4cKQ3uvvJPXeLbgWWjUEQ=;
	b=R6IElaT7bGOJk6E6vwa0Hp7qtra7fRpEZHfgSeS1JxQjAXcERrDi8JsF62sYrLuriR
	ddz7JUSpWeCewUiUMFJfVfLdEgg2kdtk9UesuGmbZsQB3FRjN+hIBPWr3hWNMb8q1zNC
	PP64xfuhAidmuBOLeJe68uCZMAExhamuLWCPlQWeAu1DvUss1Tid/dBhFh3eh0KzUMp1
	8yrmndrAN/9HKsi/CSu1lEWQvAguqxfQBX4EXdvGmXEbhE8YlpAiZ9plb/Jt8vPuKOiv
	iQYUBkhtZl4oMj7r3zWfBEHgHLY14S/bm2WxD8YKmGiTUVVeJEmDzjFlTage9x+q6mN/
	sWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y9qNgQECbn4UG5z0TIocwM4cKQ3uvvJPXeLbgWWjUEQ=;
	b=edaOD3XP2A7Ba52Im2Y8d813z9JcmOWe9XpIOY7M8yJXK6V3XcyvBgmA0BEfEhosnN
	QauerIUuTw6c0hGK9/aCOwrRHZTJmmWPSqWY3ZifT3UzFbKhSEWxnUDAiB8M8E3eH4mH
	RZ5rhLmWCHSFbIvnoum8OeUxSATJsFEWFPofqShxTVWh+YbMzkfAU1qee4pvfIB5AbNG
	V+g40ljiec8/nawB3toy2bxugET9Pw1w8NRwqTSg+XTMxdM4tx5uH8JVn1F3l5reaASp
	MtwvZzH8lcNAmz3ugZ1ty53fD8CE0JgH7D2AonjYcdiY/3h7vrM7/hgIhyfeQXPZrxQo
	ch1g==
X-Gm-Message-State: APjAAAVDtkid5fRr8O5raROpn/rZAUxk/3eMF7bialpRzhVBHwdPfMz5
	OA5xGT4N6GPrZJQbP9UvqXlIRi1etx0=
X-Google-Smtp-Source: APXvYqyyWN2hM/2da+IGe+yMAgfyKtlQ2CDcz7OZzWjS5exM6buWjxTCwAqNvDC1dIr0Jt+s88m1kg==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr19783295wrt.197.1558594175727;
	Wed, 22 May 2019 23:49:35 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:50 +0200
Message-Id: <20190523064859.24336-33-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 32/41] geocode-glib: initial add 3.26.1
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
X-List-Received-Date: Thu, 23 May 2019 06:49:35 -0000
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
2.20.1


