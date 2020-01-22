Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id A51937FD1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:30 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id i6so2861236pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KU2uvzW0+gFoDvBR9H8eZ5Ns3Dc520mbER4KDleZn2E=;
	b=qEAyo3ZkSj+QFLmqVJmxvKmYfbt0TBhKzeDWqQzfI6JtWgY8anvyZN/s2jtd74EagO
	qIL69WM6ZEQ4fzp/dTm6ZzfwPxyc8XUdKXwaz6Jg07e3EPIDFYz7ZD8qzIm7BSM60rPj
	QE/wwYs18P/qWgnujGCL3fsFhkYipM4ve1P7dRlHopQ6RR/XofkuvmMCpIqATBGRQ8Vh
	yap1ffEoof8hgSsJLl7cWwAOlVED1yESu496tRFAauYFrFNJUMSYnWOor63+qj72njBE
	cxmKfKWHdgGdlKIJUa30bCBEF4fNBnobtgOLXkHemdIp/LZ91n/2RkcT3feJUPDnNqCz
	JOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KU2uvzW0+gFoDvBR9H8eZ5Ns3Dc520mbER4KDleZn2E=;
	b=S/vDL0XN8gcSS9tJRGsmTMX3K+CEzJyr7pYRfCj6ewMry7UG8ylnsZWWQvwSxcVH8p
	gIiqGQ6YXmc3i10XWnNgRElYOCK6HCfEfsXCnpoa1XuFEmtRNNF12yzAyt5iVvBCTPCf
	/SxVQ9cODHi+9UirP3Olby8Zz1g3PLrycQHpUQK84JN13QGwEsMlNf9WY4pCwGsJTICL
	AERXE6A1UwzSJjz+6Ql8eBRV/4ETe8tQkBKEwRINAf8wd16rQ8oYFu1vFIw2Zv37wKq6
	gZdppoHtYSP3sqbA+tt0q/p1SEiG3IUKgjpaIxxRL6XheItKrMM8IPoKTiVT4KsesJWs
	Id3w==
X-Gm-Message-State: APjAAAUTJvDJqdtxjoLxMsPLVTcbnVHPg9OEooUuhGLDWNP99E3eg5U7
	nZVbz1PBFXO5liyaQ3I7Xd1RNiVqEjA=
X-Google-Smtp-Source: APXvYqwNk/NXRhCE2E/0BMvOhSa1LfzjL0otOpSKE8ConLQ9B2G84GtTPPkKAlNHjaRsuRbS5JLACw==
X-Received: by 2002:aa7:9191:: with SMTP id x17mr1307501pfa.38.1579675111511; 
	Tue, 21 Jan 2020 22:38:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:20 -0800
Message-Id: <20200122063823.242098-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 09/12] fontforge: Link with libpython3
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:30 -0000
Content-Transfer-Encoding: 8bit

Helps building with python3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index c12d01e2d6..1863f95f0f 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=d042f3d2a8fd7208b704a499168e3c89 \
 "
 
-DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg libtool uthash gettext-native"
+DEPENDS = "python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool uthash gettext-native"
 DEPENDS_append_class-target = " libxi"
 
 inherit autotools pkgconfig python3native features_check gettext gtk-icon-cache mime mime-xdg
@@ -20,9 +20,12 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git \
 "
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF += "--without-libuninameslist"
+EXTRA_OECONF += "--without-libuninameslist  --enable-python-scripting --enable-python-extension"
 EXTRA_OECONF_append_class-native = " with_x=no"
 
+LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
+BUILD_LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
+
 #do_configure_prepend() {
 # uthash sources are expected in uthash/src
 #    mkdir -p ${S}/uthash/src
-- 
2.25.0


