Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CF5767FA32
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:33 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f129so5656510wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=T8OaH7nnhtdRfdqpssGXtGsXiZnFpi4OnLInFTKWMMY=;
	b=MG0n0hpG8YkNjvqRpOoQsIgGYah3ASwaUQZh2hWEh+ioWwheu+kdvtPfk7zTqLeWQB
	W4kIesyM4qwMsnUStk/ClQzJC6WqjBvHM5t+7b5L4YxfNIvvMDBJ5ae0ijRfLtNVTbeY
	uQyM1HtjrkG9I0bTBTZOHpS9sSXEgCMvTjQPC43nctM2dipbbhnEAHME81NIdtV65xhQ
	j7gWNt2GkvNJk2/V5dtE+xymn7sxsnzcNwcM+egBbPdZfYXBgK8B1JxYLQ61PWjxWWL4
	6+jTge93/RXBRP/AwP0q6YTJuoSSH7GFsp8wUbDDnmbQDevtgOB55txODmbmpxSnXtrY
	2nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T8OaH7nnhtdRfdqpssGXtGsXiZnFpi4OnLInFTKWMMY=;
	b=FxHT4FgyCnCFrAL2y+c/hy7gMia9v4mbrshjn2yuwGYTR03hkQGLlcT5NpNxxW5B1Y
	UrTpkFYcdJPu3p/7epZ+yoZrgZ9uoYnTOLn/ltkrq3/Q0Ip7pcjOgimM1ecIYTp/oHV+
	d8UPLsK7pAEmnt/xVSP2L0QXuc+31JQVmwMo4a29Ff2ulA9c857jnB27wP9cPZWa350v
	lEIsT80NI8jXShMaOPIcAkCx/wXOyRRFlkHNLXtP3HsjI0Sc2nmpCjTvfYnlZZxCqd1j
	W9C2UEqHXykTPjRGh6lPQGJbiR++hUkN7PkFtgqEIjcZKAyXJNx9kVBPLNwTft8Lo4mk
	ZYag==
X-Gm-Message-State: APjAAAXN7mOs/xLU7JSG4PX1TC4b4CNeffn4EUg4hUgmhZWW/CQY0Vv+
	yt7VTb+v0ySpsNzAAZdUT3Se/56D
X-Google-Smtp-Source: APXvYqwLYC8eSYM5kO9xjBnxZmZeLxgTvctLDG08/cJlcVulgWaM5BftMRP0zq9GlNg1qbOVwRp96w==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr7696005wml.3.1575590974243;
	Thu, 05 Dec 2019 16:09:34 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:01 +0100
Message-Id: <20191206000912.19841-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/21] rest: initial add 0.8.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is an optional dependency for upcoming gnome-online-accounts

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb | 28 +++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb

diff --git a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb b/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
new file mode 100644
index 000000000..acbc23f21
--- /dev/null
+++ b/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
@@ -0,0 +1,28 @@
+SUMMARY = "library to access web services that claim to be "RESTful""
+HOMPAGE = "https://wiki.gnome.org/Projects/Librest"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+GNOMEBASEBUILDCLASS = "autotools"
+
+DEPENDS = " \
+    libxml2-native \
+    glib-2.0-native \
+    glib-2.0 \
+    libsoup-2.4 \
+"
+
+inherit gnomebase gobject-introspection gtk-doc vala
+
+SRC_URI[archive.md5sum] = "ece4547298a81105f307369d73c21b9d"
+SRC_URI[archive.sha256sum] = "0513aad38e5d3cedd4ae3c551634e3be1b9baaa79775e53b2dba9456f15b01c9"
+
+do_configure_prepend() {
+    # rest expects introspection.m4 at custom location (see aclocal.m4).
+    cp -f ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}/build
+}
+
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/rest/.libs"
+}
+
-- 
2.21.0


