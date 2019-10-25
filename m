Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id AAF247F7C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:40 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s1so1077897wro.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XZ3erVDbmYyerOK2e3wIRvtELpYf7+2LA5uCoCLNfko=;
	b=dd8RVRd7vHBO75CshumgC5n48MihSEzYC1M4HTlld+fYBenNrOdZCd0YRUL+XjWco6
	LOP3ntmmBocvkqt2JJ4NQ1K+NoQsigt46yDm3WYuT6/H/0kHRKuXvoSAYURvRxig1zIW
	dtWg4FUMHbpYEc6l5oFVxxZ3ERpum3QugjDKtxRC6yL/uyYsp6aEYwFwVYsHSTM8l38l
	QskQa71/FXR5H2NOxJSboM0TASMqMI9LUw28Q11e7DvymRFgG8+gw/dacT7fegj0u0Vb
	89JNEjzKoc9HQIy+QBuVPaqLb0nYjP7uvs/QCgMemCelntDOt5ktRn5Iv3yrZkIQR56m
	xTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XZ3erVDbmYyerOK2e3wIRvtELpYf7+2LA5uCoCLNfko=;
	b=Z3G1L607FBZGiR+9VRxkarCujwcYGXWHCBaPuZCc8WmUeQpguvueuB77VJ9gUKAz5J
	+Bda+Hjkq5OYwx3LyHTIT+mFfaLdzQht2ifhN50ikwnsta6lAfzvW/LIEgh6PCi8XAAC
	ZOzAHAgkDUuMkXXoAxU5uoy/NKBtCGxvh6InUWVhcvYUeIQZEf5FmWcSoAquVWvlaSR0
	TTU3koOc5whahFmVpjrqo7uwPb8FzpbMOoYqgGLZD+C/8j9JFkzASI4IzPW0WZAqbtf9
	U9MmYbVV/kxkjfCDvNzujf1wDIWmHcREl10A2Tj3B5UCreMflCBxo8Y1mF4b3qsEtmXE
	a+Pg==
X-Gm-Message-State: APjAAAWNz6LS8E8LwUVAOvL1k6rHhj8UO6bfvFgGFPbVI/0nbm6orBIV
	mO6ZRKdlFS272bw+L5v+AxSfUbAv
X-Google-Smtp-Source: APXvYqyA6sD8dL9ocI3elxOXc4GwEo9nps4OemD1pMpN9fyva6cXOVCNVFjXAeqbJ1IImF072B7NDw==
X-Received: by 2002:a05:6000:1252:: with SMTP id
	j18mr1418250wrx.23.1571988101117; 
	Fri, 25 Oct 2019 00:21:41 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:13 +0200
Message-Id: <20191025072113.11172-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/15] colord-gtk: initial add 0.2.0
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it is a dependency for upcoming gnome-control-center

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../colord-gtk/colord-gtk_0.2.0.bb            | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb

diff --git a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
new file mode 100644
index 000000000..c960b99c4
--- /dev/null
+++ b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "GTK support library for colord"
+HOMEPAGE = "https://www.freedesktop.org/software/colord/"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+inherit meson gobject-introspection gettext gtk-doc distro_features_check
+
+DEPENDS = " \
+    gtk+3 \
+    colord \
+"
+
+SRC_URI = "http://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "66d048803c8b89e5e63da4b461484933"
+SRC_URI[sha256sum] = "2a4cfae08bc69f000f40374934cd26f4ae86d286ce7de89f1622abc59644c717"
+
+EXTRA_OEMESON = "-Dman=false"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
-- 
2.21.0


