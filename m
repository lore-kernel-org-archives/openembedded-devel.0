Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id C46A37F9B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:11:31 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t1so950122wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XZ3erVDbmYyerOK2e3wIRvtELpYf7+2LA5uCoCLNfko=;
	b=LSiD1LB8PdlxVU76/zF+gE5+gxVgvxIGNAeR1k+B1rI3vRpv0vep8YVEoNRPe3xEKo
	d8ydaqjrEEJICnDsC0aHR/iPbizWEmdA9keyIAMhNTDR/kl5sjIAw4CgKL4E5VYgKEso
	PhnR6xgr2Zbm4ijDyFosD2C9t3A6EzvlUy9E9L+EAGYoF2mu0yoYkotWfw6AU6Q5KAuf
	cfcJimt+Tu+bZfr3NJE14C+5aUjpoknrSAs1wDxMxEaMXnhzNY21FjH7sJ0JrEqz3hSM
	Rk+lq3FzQ4Q2RwBTA8OcW9SJTAMtnRXpRmfjSsFlKqN4MmSidG3hIBdN0SS2bVif+Zwb
	dqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XZ3erVDbmYyerOK2e3wIRvtELpYf7+2LA5uCoCLNfko=;
	b=KA1Vse3bsbtyMrAol30geamhiLHlY/TIsxVe/YYFpOoF1XNXeOKXrTBaAz36Ul6A4s
	XoXWv0eG0g06NyoZqwYH9Yq6P53aZbneHiQtj5vaIhiHF6RWjzNhjTjuGtY9UjbdKnF/
	n/3Hbd3G5ApdJ4ENWxDV3P3K9VFfv1omykLUOWfYsmjqrQQrus1Z1StW2G7Ko0Ge2VpO
	VCVsui8KkeELeUIN3swAaYUpfJpiud2WKlkofYvV917DAApQbFY08Z3YHD0lLOmSNdiN
	KhhmcgWpKvvcCjOUnhyQpoTKLnmNzlmcnvrJBi5dx+CNx3S9DW32bggDfgCTdfN8SFpq
	uY3Q==
X-Gm-Message-State: APjAAAXpShlsY0SZA2VG+M1ZjDjH/5l4VUfUafvkTth2co67QZO0SLau
	PzQy3xYjfhddZm5s2adg3XDGif4w
X-Google-Smtp-Source: APXvYqwN6izR2+DH5nnqahxVJxn2sPWrtZaSZ4nrpe7YM50wtftgf/t+/cttJmVmHYI4gp4qhxPaLQ==
X-Received: by 2002:adf:9481:: with SMTP id 1mr6450604wrr.77.1572538292243;
	Thu, 31 Oct 2019 09:11:32 -0700 (PDT)
Received: from amue-work.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	o22sm3779852wmc.41.2019.10.31.09.11.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 09:11:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Oct 2019 17:11:21 +0100
Message-Id: <20191031161121.5013-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031161121.5013-1-schnitzeltony@gmail.com>
References: <20191031161121.5013-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] colord-gtk: initial add 0.2.0
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
X-List-Received-Date: Thu, 31 Oct 2019 16:11:32 -0000
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


