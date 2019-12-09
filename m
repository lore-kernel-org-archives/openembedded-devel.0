Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 60D977FC5B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:41 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f4so14848212wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AvHMMVIKaK5emFmTG+f52P8NI1+LSxkRyrKOq/XTuwI=;
	b=n96ObA/fjcsaQ58EWlBYRQvK28Y0g22K+e7GfDJtBRSy3obL2CwrbDrSMm57GG6B+F
	TklUOiY5RdgcQUbhZix3m9zrVhdURQqomLcTA1WV7hjyWaokNmg8NaDUp4Qd8SkUMULE
	RikHxiByCx5FCTIcNsrRIbiTlnaYOsq5/3fiefzVMEsf0qyFVR4QyKoKszwQrxqXjRVY
	uUDGPj5PLzLt1BPeyKsgwiFjYl1XJv5Rqn9lvQF2eZ9ccPshJc9a3fCGKMF9FeBl2U7R
	hWZ++5R+zhjfFbTYrHh9nMrfRg3Zwy2aL/xMhOm09KDKNDpQClxJSS/w81DqoBssluYf
	F0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AvHMMVIKaK5emFmTG+f52P8NI1+LSxkRyrKOq/XTuwI=;
	b=D3jf07cvDL5nrFpa1uWOwhFT/Qzi6q9hnO8AmHfBEUPs9c6nkVxgdq/yc7eeD0yE22
	1QVcYSq4JAEzY7Bz+iQr8d7nU7j43UnXXeeSqQk1VtKsnoQ/7+5YcDE2Sb+HXRguHgEg
	QUOMqKQEQp+KSYZoWr91ONAHOIdRltQiLdhd8F8sJNmFdZwLLQtcXaJBbbVsacucULjy
	OprikKFV4OY+tot9hvyyCoLOwbqSe9noq8ma7OqEFbEBwAt1X8aIsE1IZnWNIWuwwpsC
	aEhb4jf1nlcupXL50+i7rlORiEJ0nW2j1FpbiG4I6HQowxgGgYInAKX1L3WrwGcdr7Ih
	bmkg==
X-Gm-Message-State: APjAAAU5/vT1hbpZxRx0+/yb4JG+DOAVSYhi70t3BiEid47BeBmx4kct
	kdsNv+TusLE5v5sHugBuN6iacMp5
X-Google-Smtp-Source: APXvYqzW5FsIFmgXfnX1Vb40AQPbs7Ph1ySqf7M7Uhvxp7Kti3+M7o0P0xbdO+O+02NG3zjg7xXN0g==
X-Received: by 2002:a05:600c:a:: with SMTP id
	g10mr22889099wmc.69.1575880601937; 
	Mon, 09 Dec 2019 00:36:41 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:11 +0100
Message-Id: <20191209083612.23922-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 19/20] libgdata: add x11 to required distro features
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb
index 7bedd87ad..8e8e12b38 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb
@@ -12,7 +12,10 @@ DEPENDS = "libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr json-glib"
 GTKDOC_MESON_OPTION = "gtk_doc"
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase pkgconfig gettext gtk-doc vala gobject-introspection manpages
+inherit gnomebase pkgconfig gettext gtk-doc vala gobject-introspection manpages features_check
+
+# gcr
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gdata/.libs"
-- 
2.21.0


