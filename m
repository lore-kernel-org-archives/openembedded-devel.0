Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 91FBE7F7C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:29 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id p4so1029733wrm.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6bf1YMXsSjAws0cKud4Rs2j5tDCITExAn+8Infk20ms=;
	b=gZpIxmtzwV7bTqdwMsIBaK3qNhGEgcByjVjnk6U+X7GcDdj/jTKeil8Mvy3RuPv8Bv
	bwzVRtFiMEbQM4wLrsIeZGSEbH812prY8onMTdFSR2Y35p3QJdcv3UxmjnSbmyVAz8Pi
	n79fZb+6I09uj4FR3vqSE2jj2Mf7DfpqZpFNPALhDIW28SNWi1QwQcloZf08GeYDxFUu
	eoO4UVQ2JYDTiDYe++20/rBn/pSmZtLMN/T4wIHD8C0H8DZIOVmIRTIHTwMcGd0INibS
	ub2xho1G/3DsQSkGFcdTh2CsoF2+oFy0QEXrMhRBTnt47lhlCraqHGrHypmt+RV1PB2M
	iOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6bf1YMXsSjAws0cKud4Rs2j5tDCITExAn+8Infk20ms=;
	b=Pe9grUcw7CrwTdm92mehtBNow6nrTFGtPgl1+LoKKjeRQGejyANlNx6cmvPEVU61Ot
	rc2h9XM01WQjDLJ+dO726UqTo8OoCLUoIAL8IsHt749sXc4LFsoCQULsl++Bb++eUj7k
	KcqDYd6zFVEdLrf527aQ7VBvij4sGSPk3BSq8eRG3bCeZDiC7L8GW8xWM1AEXL4Pn3Ho
	SFmAdIdd/LiP7RKTnRg7UgXwwa250V18JbRD5zKAn+37lETT4smZTGMZwyLlFhyrgGRX
	h/PRGKiyizZy6P6odVVwqHxS5Djs2lnMpmWYAk8vrZ/LC2KaJo2Dxk2l7h5+WQoNebZi
	xQwg==
X-Gm-Message-State: APjAAAWMES+KPGY3oOit1GoMYyLgvc9AZv+Mv3sRJC++sGvx/O+1vpoW
	X1VGcnLpVCsAOvT9KVq+KZs8Y22H
X-Google-Smtp-Source: APXvYqx/lvd1MsQEqTNZPOs89nQEvprGusS51ijwnuT5D3P5shBQKUdBZPIs7LhbcoQjyIbQVPfXFA==
X-Received: by 2002:adf:e651:: with SMTP id b17mr973065wrn.191.1571988090033; 
	Fri, 25 Oct 2019 00:21:30 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:03 +0200
Message-Id: <20191025072113.11172-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/15] appstream-glib: initial add 0.7.16
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming gnome recipes

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../appstream-glib/appstream-glib_0.7.16.bb   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.16.bb

diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.16.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.16.bb
new file mode 100644
index 000000000..ec3e4a3d3
--- /dev/null
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.7.16.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Objects and helper methods to help reading and writing AppStream metadata"
+HOMEPAGE = "https://people.freedesktop.org/~hughsient/appstream-glib/index.htm"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = " \
+    gperf-native \
+    glib-2.0 \
+    gtk+3 \
+    libyaml \
+    libarchive \
+    libsoup-2.4 \
+    json-glib \
+    gdk-pixbuf \
+    freetype \
+    fontconfig \
+    libstemmer \
+"
+
+inherit meson gobject-introspection gettext bash-completion
+
+SRC_URI = "https://people.freedesktop.org/~hughsient/${BPN}/releases/${BP}.tar.xz"
+SRC_URI[md5sum] = "78306049412396a72746186452abdf66"
+SRC_URI[sha256sum] = "04f290d73bc865071112076b8a3345df2730783a16af976fe3becfd2f50d5992"
+
+EXTRA_OEMESON = " \
+    -Drpm=false \
+"
+
+FILES_${PN} += "${libdir}/asb-plugins-5"
+
+FILES_${PN}-dev += " \
+    ${datadir}/installed-tests \
+    ${datadir}/gettext \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.21.0


