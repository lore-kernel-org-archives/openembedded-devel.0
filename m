Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAFA7E98A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 01:21:02 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id q9so4934487wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4rLgEC6vcM1t4HsTRF6MtkoCPOZ778Rzp20FodipDJI=;
	b=pb1/AEH4RxDkGqEAsgPPryRWDsZo76Ydv2oZyYBL90fe7KbzGk6/EYz6QzFS6mQz0M
	w+0yp4f48VEt+voU21YPYeSLFYcRLrOTwNnd+gF1H0AB/9fAkutKe/8hYQ4zNMACntQF
	1amaA+sI7bmXqp8eR/P6d2AKtn7y1inIjzAjvDP3kHfcmd0x9D0M91Xv91dWUReU3vu6
	2loQR0gIlLm2anRdrHg8ENNBVuh+oNEGp7jMC2UezmwFCc0LCeXhxJ3LmLMwGfYPEbxM
	5s3PHJRX8o2nwOL3Y/Rx3EYNUrtGE5TaYie6vY/TKQPBe1/z5siTznar2UmtisA0eqj7
	dvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4rLgEC6vcM1t4HsTRF6MtkoCPOZ778Rzp20FodipDJI=;
	b=feLzgvcUuHc0E66NJIRFH/unWGChll+cKTe/LtVyN9TWkTdx88n2Zl9L+kFwNOv8Mg
	xbtziiviWfCyekIFDuB3Osq1xKRGisbwBQVL5kreem6SsaB0uHiHj5VFnHma/tDotC3p
	ILRuRvX1yHFTxfkuzqgX5mb8vTMmq0Utz5MrMa0QwG2i/+1sUPOZN4/+m7gvRLXSwx3M
	Bcy6//NUmklVhMdsPh2w8WlZeCGXFMKUck4nUAit/OGWbRwzajdubp9LOerl6AIcOKYi
	1ElPx7mZoRURY7blQwBr0M3/ta9OWQ3qkyM7np3I/lfH09eNzReG/fRsgVjltej25PaE
	Sh7A==
X-Gm-Message-State: APjAAAVDSE0W91QY6WSwcMS/dblUlerCPf34gnCveW827jX4oLJrEL4B
	I36P8hCnzLnD9T1cgptwKV8c+vJU
X-Google-Smtp-Source: APXvYqz8mXiaR0nHqcmowO6zuDemJ0vaXfS8STxsG5thE0dWIIsYX1MAbWTmFxAwvF1cRvvigkoMLw==
X-Received: by 2002:a05:600c:2549:: with SMTP id
	e9mr14965121wma.6.1576459262863; 
	Sun, 15 Dec 2019 17:21:02 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F06A307CB3B21B8240595DD.dip0.t-ipconnect.de.
	[2003:f0:7f06:a307:cb3b:21b8:2405:95dd])
	by smtp.gmail.com with ESMTPSA id
	t190sm10877063wmt.44.2019.12.15.17.21.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 17:21:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2019 02:20:46 +0100
Message-Id: <20191216012047.17312-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191216012047.17312-1-schnitzeltony@gmail.com>
References: <20191216012047.17312-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] libhandy: initial add 0.0.12
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
X-List-Received-Date: Mon, 16 Dec 2019 01:21:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libhandy is required by upcoming gnome-tweaks

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/libhandy/libhandy_git.bb  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libhandy/libhandy_git.bb

diff --git a/meta-gnome/recipes-support/libhandy/libhandy_git.bb b/meta-gnome/recipes-support/libhandy/libhandy_git.bb
new file mode 100644
index 000000000..0fbbfdc5d
--- /dev/null
+++ b/meta-gnome/recipes-support/libhandy/libhandy_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A library full of GTK+ widgets for mobile phones"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://source.puri.sm/Librem5/${BPN}.git"
+SRCREV = "ef7c4bf75ae239495141ada83d2fbaf034315563"
+S = "${WORKDIR}/git"
+PV = "0.0.12"
+
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+GTKDOC_MESON_OPTION = 'gtk_doc'
+
+inherit meson gobject-introspection vala gettext gtk-doc features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+DEPENDS += "gtk+3"
+
+PACKAGES =+ "${PN}-examples"
+FILES_${PN}-examples = "${bindir}"
-- 
2.21.0


