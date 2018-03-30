Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 05F1E7471A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:21 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id y55so8062185wry.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nu1KYdXEmqrgNznVf7TxjTpZzKtZAf8PhFPgUGVcgoA=;
	b=bKrkJErmW4o8cIrRq5wBxGizkP/K14cO2ruPKNXqSWcUqp0hh57/QWvkE4H4ek62xU
	+pgxfQSOxuavOQY4mw7kuttsEtMFR7MUvcpW/OrPyBvcA7I1nMktB4toUNoy4sM/tR9T
	sP6vColvXY6LIQFBWaZa/97BCFBb1a+bPWMphMlNYDKCXialcBK4rTOuOf+Lgv6KUWtm
	6CTaeH4UrBoStSLyADr1LHYULuPrlNuCcs0lF+PlMFmCUJEFvAsDVy5uFAEIaB5waQX4
	JrB/VlYAhLJOHgFIjOvX/pbA66nuNv7qUgoT0keIhTTUVW8y24cejeLHO9YR93eLmYcI
	a8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nu1KYdXEmqrgNznVf7TxjTpZzKtZAf8PhFPgUGVcgoA=;
	b=WHRvdUMRl/O7GnE45SIcjbinRXPMHI5luxuye+vwNV36Ngzhhbvogjfgi19mi1D29E
	fg2xuNZhfkmGQiq7Axccm0Y7UyrciLJMN3wdxrIHqrbkXPYyyWca6+dD3l72CC3r2qqf
	mglaG0qTcF/pvDk8nrskN8UTHEX9DE+wMYQUyur77gewEqaNW3ed9XC7ITkqoRFOIfeZ
	taa420pinkh1AwtrTPpO35rQuruOclCK/2hYpiPI/z5acEb6APz7JRB2EhBexKnnsNwD
	WuGhdwc8E44dUs5jgA0bcb0bwwIsOr6lBxLpFOaUv6hpF64BW6eZ/OFqwb+aXoGbVeNb
	HSBQ==
X-Gm-Message-State: AElRT7GfX8FJED01D+7TqYhTgjkPhz/4ykuBABfMlG5sj6rZFR1EfyNI
	m1t1vjaS6oQtpVnJoJl+0zNBlQ==
X-Google-Smtp-Source: AIpwx4+vGUY9gVi6dKFmrNHrnmWeGQ+xU41spChrJAnbNEufA0U4+w9Cye1pGnTXRkmD5P9BD7E0wA==
X-Received: by 10.223.179.18 with SMTP id j18mr9611551wrd.33.1522416742170;
	Fri, 30 Mar 2018 06:32:22 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:29 +0200
Message-Id: <20180330133151.25882-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 17/39] gtkmm3: add initial 3.22.2
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is gtk3 version of gtkmm. There are no cnflicts with gtkmm for gtk2.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
new file mode 100644
index 000000000..e4bd27e58
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "C++ bindings for the GTK+ toolkit V3"
+HOMEPAGE = "http://www.gtkmm.org/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "atkmm pangomm glibmm gtk+3 cairomm"
+
+BPN = "gtkmm"
+
+inherit gnomebase distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "883e9046768b3a5afc8e365988823e77"
+SRC_URI[archive.sha256sum] = "91afd98a31519536f5f397c2d79696e3d53143b80b75778521ca7b48cb280090"
+
+EXTRA_OECONF = " --disable-documentation "
+
+FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
2.14.3


