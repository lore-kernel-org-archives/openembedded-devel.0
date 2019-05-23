Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 79F7D7E42B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id q15so4517798wmj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=k4wM5MgGce+V7guQfJsXKguG9/mzCH4eHUO7GnHq9MY=;
	b=TZBDWNQmEdN7y9oKLC4ZpeLJi5G7kc+ysl4ehd6lr3f74AupGWCIjMHF0RuX1SU3IQ
	0S3bfOG9sVZLJFjJXYZgawQ0UpytowSFZsyKO4c6k97dtJwCnkLni2+yZEplJqzDFzV1
	D2i+D/uzgFh6b0jlcaB3FxMQ7HJ/+tddmsJ2VCHH8AxFkUXFG4mAb4dD/43tBtaJZ0as
	DvpQmJRgodnBTjm+pNtX7mb7JnXt+w7kSHjjoqXZCexDK4DdhSzIZf9i2kzva/73ZiiY
	ZcNpFlwRplKMRD8MKnd2p4fLaxY4E0ufrRW0JAmK8pO/wXZoOadess+Gtq3Q5hKh9lT6
	qZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=k4wM5MgGce+V7guQfJsXKguG9/mzCH4eHUO7GnHq9MY=;
	b=AivqG3JGtfIQJH39MhHjpF/wtsH5U/4O7w71651mL8EyB7Na2BCNZs0vazA3K/i+12
	XtMJJHpPuiwEbQeEyA+vjmXc2DnaGG73ItM5qIeFZD1bhfb9olKvL5bDYh3kWy3d6Ngb
	jiku+zhNrGTbQkHwzXXYQTevw6462Pt1caxNlXG3mQUizpWffOUF1d4qMgDqRhYDC5LZ
	NkufVTuaAIe1UOfOlWP67gxxhwbNgGsPjkIIc1/65Wo2zopFyqWtOd5FQ+8byX7C2FKZ
	3CV1bMm/ei4G65hjDXRNoOc2d7K+qgFtoT3X0bgywhjJkgAphlBx2LFKuyKtETfOTaOf
	/VEQ==
X-Gm-Message-State: APjAAAUsK6dU5NYb61dYb2UACT3hFQE7pQAwpaglJW2NWRAqmjgFZC8T
	KI1L1xE9H7gjEf7/x0L6BuGZNoRNBQk=
X-Google-Smtp-Source: APXvYqzi5Eh3U8CEcoaVZsxRtTUewSCwBO9orEoIBQxiNftS3hLb4lg3So6HyZQmRi9fEePybJv1vA==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr9965983wmb.110.1558594167201; 
	Wed, 22 May 2019 23:49:27 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:40 +0200
Message-Id: <20190523064859.24336-23-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 22/41] gnome-autoar: inital add 0.2.3
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
X-List-Received-Date: Thu, 23 May 2019 06:49:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a dependency for upcoming nautilus 3.32.1

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-autoar/gnome-autoar_0.2.3.bb         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb
new file mode 100644
index 000000000..16a9213cb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "GNOME archive library"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = " \
+    gnome-common-native \
+    gtk+3 \
+    libarchive \
+"
+
+inherit gnomebase gobject-introspection gtk-doc vala
+
+SRC_URI[archive.md5sum] = "39b13fb2fc7752fa3b80616244dc4ef8"
+SRC_URI[archive.sha256sum] = "5de9db0db028cd6cab7c2fec46ba90965474ecf9cd68cfd681a6488cf1fb240a"
+
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/gnome-autoar/.libs"
+}
-- 
2.20.1


