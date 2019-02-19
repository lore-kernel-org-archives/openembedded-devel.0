Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id A98A27C9A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 22:23:29 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id t18so23785542wrx.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 14:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zhPoVthSWdWcgeq1J3t6qCBe4kEbOu3nds6efM8s/FM=;
	b=elTqW11wLux6jAiYpa03oR+I+OYu21JR3vCk+dno5YC3ERAf03j8oeqa7asCR1Nv2u
	gWVPMxL2roJ7K6vu+cIHrLq/9R9Ms09ISLiNzbvNFldOT+3gCHaVihgtf0xc9rLuqCWY
	Nqd0NJauyKA1OjExuMg8nYZbYwfY49WMgob9M83JbL4am9H4lCkfPwU66AUXeejeteJr
	oypOar98y6sdN4QxBKHVji4BhhG2T3eU4aCj2uNTM1179hFrvMwelkzgx7zACMSODUWY
	BoUoXp8vQdBbK6flBfiWQ1NtwvgpeJAetxuRR5U70R88+Ltxx1KW5mxhIQn3SF05u/u+
	95kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zhPoVthSWdWcgeq1J3t6qCBe4kEbOu3nds6efM8s/FM=;
	b=nU9LcBECCvp5Fjh6ua9KCdtgOCXg7+0O5tUQUinpdnZ2CDgRBG64qudYpQHRfWlFss
	a7I1S23evXV8WsvXfMNfFZ3hrdNNn3+MJjV3jttYT5WHYWuDOigHOAxKC4Rk+GqQ1WIw
	pkyqX18QGbUIydYwAZvNDut1MqZ0+R3RT+INmbOhesBDVowx4RGwkXzBf1uFa5cK5POx
	+LSATW8LA6oQ+shzHZgh14AaqoBi/0+UbHnlABv7ATwa9eqizGsV09onlzdAFQPfvOjx
	9qN/38fSX9Zn//BjTqBilZdjtTv9NZ0Gbm4PZ1AG2ga0RAVfUVGwKsikv4uYfC+STPE3
	xTtg==
X-Gm-Message-State: AHQUAuYBw8v04YSUxbXALw9A6GtOhc/Fzeq4ya81OnxbZb0a6yNEKUz5
	vhT5L4RDz7NzSuuam/XDKuUIFFzo
X-Google-Smtp-Source: AHgI3Ib9oWkQkcu9aSThGgHlKxcX/kWldzphk1rbsz+V5yJO23YgYVOQlo3F6J/XOr4wl2biAFuNbw==
X-Received: by 2002:a5d:4412:: with SMTP id z18mr21848025wrq.111.1550615009751;
	Tue, 19 Feb 2019 14:23:29 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F065789FB9A06193E8AB1B8.dip0.t-ipconnect.de.
	[2003:f0:7f06:5789:fb9a:619:3e8a:b1b8])
	by smtp.gmail.com with ESMTPSA id
	d24sm55158896wrb.47.2019.02.19.14.23.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 14:23:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Feb 2019 23:23:16 +0100
Message-Id: <20190219222319.21370-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] libpeas: initial add 1.22.0
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
X-List-Received-Date: Tue, 19 Feb 2019 22:23:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am working on a rebirth of midori (no it's not dead) at meta-browser. To avoid
an additional layer dependency for meta-browser, put libpeas to meta-oe.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/libpeas/libpeas_1.22.0.bb   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
new file mode 100644
index 000000000..c1ead0670
--- /dev/null
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "libpeas is a gobject-based plugins engine"
+HOMEPAGE = "https://wiki.gnome.org/Projects/Libpeas"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
+
+DEPENDS = "gnome-common gtk+3 intltool-native"
+
+inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache
+
+SRC_URI[archive.md5sum] = "a20dc55c3f88ad06da9491cfd7de7558"
+SRC_URI[archive.sha256sum] = "5b2fc0f53962b25bca131a5ec0139e6fef8e254481b6e777975f7a1d2702a962"
+
+PACKAGECONFIG[python3] = "--enable-python3,--disable-python3,python3-pygobject"
+
+export GIR_EXTRA_LIBS_PATH = "${B}/libpeas/.libs"
+
+PACKAGES =+ "${PN}-demo ${PN}-python3"
+FILES_${PN}-demo = " \
+    ${bindir}/peas-demo \
+    ${libdir}/peas-demo \
+"
+
+RDEPENDS_${PN}-python3 = "python3-pygobject"
+FILES_${PN}-python3 = "${libdir}/libpeas-1.0/loaders/libpython3loader.so"
-- 
2.20.1


