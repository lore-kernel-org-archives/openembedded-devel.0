Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id E73887FA8E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:05 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id a11so7979686wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XZ3erVDbmYyerOK2e3wIRvtELpYf7+2LA5uCoCLNfko=;
	b=RQgdESDzIBwF0LA3+Ae6gNNWoP5qcXZAghmSzIzPCK9WIIiHcnQ4OpL6rt4E6Recmo
	y9CC7/CNKWIhtqNst8yQfZ/sdt9DZh8hxtUmsOeP7jcRhup49bt3NNDKqGOk7iZxG7ED
	Cs6qow7q2NDltQe4YOWIUOf/8IlgfFIMDgqldwoFgVBTPtAcjiIPdScgf68gf4Zg9Ks/
	nv04Oxj24OiT0Zmg7oUDAW775rADxMKpFyBvdJ/dyDuArt5i0Dwsm2ymOIm3mVsPMMx0
	3DYTDYMaV+wNQxXQYCxvn+8aGNue7TWWOhLINLYDRTweTwC1wDHRjs+NrWeNxfcNyBSE
	9mDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XZ3erVDbmYyerOK2e3wIRvtELpYf7+2LA5uCoCLNfko=;
	b=V3r5GIsLAwT53v7xKr9U5Z5x1P/wMeZelnlPuMtmK1xYIuWce4sdnhVTmcaObbzfKw
	Ny8jz9SSpgBw1zh4navS/SFIHmzSt2RwElgukInr/GBvXvfZvAMqNs2KtQBYdd1CR0FK
	mCB68MXBv6X2IgNdag3B+M1GQehyFKOoiCWqgY4II+tY1dz2ZQYL+F3PBSchPqoFcnbD
	xEaAt3v889Mjeld0ThToUmzEkIxpwwIS0UpDp3zhISNZUB9YM1RChXYyN0U3RbL6IOxE
	h/7rMQ3O0iChQLDffdth8J7kHSe/X2xEcUaKyXkFBuB7HcWLxbqQ0Yb3pXwF+yrJbtgf
	wx+A==
X-Gm-Message-State: APjAAAVTtkAGmU0kBnBheK6CgsVVEZ83FyfJNns2Pq0kVwWIiMLlILfV
	O3syieI0HMj+u/69vVVedEjiqKix
X-Google-Smtp-Source: APXvYqwrcHfobhXB8fMJ3Bw+kU7fi+33BpRpJtA++5lLBG7RRvpIf/fT9SawdtjgytQa+h8R/sfq5g==
X-Received: by 2002:adf:82d2:: with SMTP id 76mr12064080wrc.52.1572219366484; 
	Sun, 27 Oct 2019 16:36:06 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:34 +0100
Message-Id: <20191027233545.4146-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/19] colord-gtk: initial add 0.2.0
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:06 -0000
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


