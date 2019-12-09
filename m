Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id D8A087FB11
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:19 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id f4so14188623wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AvHMMVIKaK5emFmTG+f52P8NI1+LSxkRyrKOq/XTuwI=;
	b=b1UpGsjevlvI1Zloh5Y6vbipbbpz984Zm4fwp9iBlDhnEucwmKNz3ZMy6mErmOxd/4
	YQ5Nte6Whc0H6J0ekcCPCa3w4bCpBWiF0W+5yZaeLoERKGTufp8wtHkjT+oK0ioBMHu8
	x6m6X7K3m2kR9+e1cIl8SH4qAQzgPyCMdJz4R7LUUYLrO0w7FwSii2KnXzUpioRFAwDw
	WyJ9rkIrWZz6RY5roEy5EAvg7WapPKFMEANfB/SPekECn4Mf42o5lEuPxmEOjCbkx7Y1
	VsCRAYH0ApBnKrqvFHoSHTVaLuvlGr9iA2fQb+Q7NYED+Wxsn4yzgFgnY0lojFjwouPW
	KRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AvHMMVIKaK5emFmTG+f52P8NI1+LSxkRyrKOq/XTuwI=;
	b=BpTs/XxCODMTtsAFgeGKqn8W5ZGHQj6eMMyZ49vTkPBq/56tDx+CPsVjzjGTQkKszR
	4lCsb1UfUJAtBFR+ZQOaVHbXeJnLqXNAdvraF4/JIDpnzt/s4mJzRee+Rw15NRZVslT2
	jREOZf9cntFjcrHIFUMF7DZ2CSrBRNNqyCGtQJXQCOd4P6tBL4LOc5V3UZyhhdeSXAwC
	ldq80FHFzj7nvqAzsL7tPY/XtMQZ4HPESkHVICyE01LCyz/HM5hGVjRlfUuD5fpypKXc
	Glg9YUnlnSnqHIRCuxRBpvlVR7c1HmyTSeHWeDoE65qGlOVUYgTkkfZPhLiUWUmtoZ9T
	m8Pw==
X-Gm-Message-State: APjAAAW7Fz+YnTzTBU2RHs53wrkciq89nUBYzFzE27EMUXRbNBKj/b8a
	s4RFdVZhQAOyXQP/sWhZyVHO6wQQ
X-Google-Smtp-Source: APXvYqxrIS+ZYx1ZnDd+sFrxnHrWg/vM945QH7UGl6mrx1NyFksjWaNz5b4YOfpoKdSfBEjFuqvEPQ==
X-Received: by 2002:a1c:4004:: with SMTP id n4mr20804634wma.153.1575851960495; 
	Sun, 08 Dec 2019 16:39:20 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:39 +0100
Message-Id: <20191209003840.3383-29-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 28/29] libgdata: add x11 to required distro features
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:20 -0000
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


