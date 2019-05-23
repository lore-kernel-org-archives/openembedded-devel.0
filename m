Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8D37E400
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:09 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id u16so994519wrn.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=B0MFEUJxNPoZ48MpuW3TrpYj8P5kvhRP6H8S2WwhxTw=;
	b=r705FSdKcROjtHmDPPpHS0137xOjYLK/DjeUVDq0sOpnuCuhBVWv1LILOk51Lhjo56
	5LG8dIkn/nb7nrl5eO93NcdMc6pXC6HogFURRBn0Np8SVzdR9uVqlP5TlilnhjmXUqT0
	RHD9MsSnuFabnTsyIMWx9YK60HgGcebV0SgjVf+lo+EjVdwikSuwcpi7PtmoCzi8UMT6
	xrqqmy92hjSi6OO5BsZEMjEdC/mLETdJCM59DDNBAC+hhGqH7V2RL56+h9ZnklCIQm72
	8/cfiX0Ik9T0s4TLtoR6JugE0u0RPELSBIZwnLyxfVnNgI4LZ6oo1Cer5SghMuk9ZcEy
	TR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B0MFEUJxNPoZ48MpuW3TrpYj8P5kvhRP6H8S2WwhxTw=;
	b=g8ghiASpkSEhm6rB75UYxctRcFoW4MFdNG+F9W4ikmNhYX0BL+bPv3QG0DSYGBTmJG
	uHbva4++N5IxB64gUuJCxZCKm2n7e9xjLwn/CsezX0hAg6kh/3B35bNayR7H38Wj8pbU
	9sXyEQQPi5EjAAUPJVAgAA/5Te+p1ryW84LoEQkKq3oDfFeFxBwvt88UWhqwUReeo/mF
	e2kv6ErKWcmNZvnPVkygwpU4OTI2bOkrAHys5AjUlrJ3qT1mtSB1WK3Bcign/x08BGoB
	BVDmr+XAA4HY7tRFk0to8s0vOvT63D1EUq2NWtt4z4uIQYm12GBXE7DFepGZGNHgEcK5
	M6vQ==
X-Gm-Message-State: APjAAAXg8a+Cupo4UfE2vMm/7s+sWRIxV05c5pJwzir8Jokf8Nznbw8X
	rDYDKZbbT/ONl1OrfQ/OjwgVK4SXr/g=
X-Google-Smtp-Source: APXvYqwsPvEOtX+vzoiTi7dCEsn7abjpGv5ppepl13FxylBoyaKj+OgrDNtk/KVNOGefcuN2Ib4+EQ==
X-Received: by 2002:adf:c7d0:: with SMTP id y16mr394122wrg.39.1558594150204;
	Wed, 22 May 2019 23:49:10 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:21 +0200
Message-Id: <20190523064859.24336-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/41] appstream-glib: initial add 0.7.15
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
X-List-Received-Date: Thu, 23 May 2019 06:49:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../appstream-glib/appstream-glib_0.7.15.bb   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.15.bb

diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.15.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.15.bb
new file mode 100644
index 000000000..a6529e609
--- /dev/null
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.15.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Objects and helper methods to help reading and writing AppStream metadata"
+HOMEPAGE = "https://people.freedesktop.org/~hughsient/appstream-glib/index.htm"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = " \
+    gperf-native \
+    glib-2.0 \
+    gtk+3 \
+    libyaml \
+    libarchive \
+    libsoup-2.4 \
+    json-glib \
+    gdk-pixbuf \
+    freetype \
+    fontconfig \
+    libstemmer \
+"
+
+inherit meson gobject-introspection gettext bash-completion
+
+SRC_URI = "https://people.freedesktop.org/~hughsient/${BPN}/releases/${BP}.tar.xz"
+SRC_URI[md5sum] = "51f15108d6b9224f2ce2cf9364403b10"
+SRC_URI[sha256sum] = "7e27947de3742fcc02a96a22fb91e137a49cd55234c407a246476f3624a92a9f"
+
+EXTRA_OEMESON = " \
+    -Drpm=false \
+"
+
+FILES_${PN} += "${libdir}/asb-plugins-5"
+
+FILES_${PN}-dev += " \
+    ${datadir}/installed-tests \
+    ${datadir}/gettext \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


