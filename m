Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0E87FB63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 01:03:05 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id l10so11809490wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 18:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XZ3erVDbmYyerOK2e3wIRvtELpYf7+2LA5uCoCLNfko=;
	b=fHKV+wccOjCBWLO70AdSn9u4UIJ/epUudqpupPz260xwxSoLhlv/QTElquew5XsRKe
	xqs8bC0YAlA1CTaQcuSQasHTP2t+CwvCF2/zfcV+Zq/7sNZbjO/9JQMdcqBlNccpd3iJ
	LedGn59CUFdt59aY0xoOaTNDoqXbba5YeusdeSDqv40KGfU1xil4txmq0D61UVNTRPVH
	5fDeLVyidfBi3aZt/vJbdmDpLvgz4kd06pIHo4/30tFcvyIsr0LjusRLoDNWKBLaW+g/
	Bd8A/kSsTT5IENsiHeayXABiE0qF6kC7bq14VoP1hCHSqXCpOb15SkJzJ5X6BRmvKo4t
	XdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XZ3erVDbmYyerOK2e3wIRvtELpYf7+2LA5uCoCLNfko=;
	b=T9NckdeIMH/Qh09AUrxHWv9xGDjURE237dkSvY7u8T/fMWUl+UiNd1AslmOgpVeN2/
	8F6oOr7PZIasOlpRZAnpzqnAW3DH/XU5kisOykV6RCP/f1s1+XF9TF/NqamBTX0jP7N1
	yOGy5SxffvCUUeEuqTNp0Fq/X+W/9stnHU0GuH61EHesL5kSpIFV8VA+9snEBMiD8URo
	9MNHkzvuFkFXo/CyjNJdgRj3VjlTQTMsgmaQroyUtpgokjNBFWj3KsIGEZtIQDc4zYeQ
	nNnplTK1yOYim6Zxmhlxp2DdWham2HbhJyZrAoP41wQaPbOC4hzUdlhtqKVD2NbChMX/
	YWRw==
X-Gm-Message-State: APjAAAWFgqJezIJpw2nkPLw/Cl5njINn0fjOnafIRnkYILBxFxsiYd+o
	CJRppKxDySck5ZCyPkiWhsR3dukr
X-Google-Smtp-Source: APXvYqwA+k4a7KxXrJQBaSwbAevDV8Lt+Wa2FLMbAw2MC6e3lZ3cWVI0xTe/IslpFDOEgOntkmKiQA==
X-Received: by 2002:adf:8088:: with SMTP id 8mr16728450wrl.230.1572310985476; 
	Mon, 28 Oct 2019 18:03:05 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F3206985B50CF9AC855C254.dip0.t-ipconnect.de.
	[2003:f0:7f32:698:5b50:cf9a:c855:c254])
	by smtp.gmail.com with ESMTPSA id k3sm8758714wrn.95.2019.10.28.18.03.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Oct 2019 18:03:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 02:02:51 +0100
Message-Id: <20191029010253.5784-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191029010253.5784-1-schnitzeltony@gmail.com>
References: <20191029010253.5784-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] colord-gtk: initial add 0.2.0
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
X-List-Received-Date: Tue, 29 Oct 2019 01:03:05 -0000
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


