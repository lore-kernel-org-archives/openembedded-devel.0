Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 400AC79BA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:49:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u1-v6so886852wrn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=St+p72mlCNwvn1KxJJmAjp0pOYKFgM10FlDtruNsz9E=;
	b=I7Y6hhxWCwX/trEk6Pf9GhizlCH3jWweDmwM7Wm+o7zKpdp4pCDRVB8TDf1KgYsoWv
	6vFPI11XjHbHBK/gYqG2U+wLgPV1Y006YnR8lfTaFPhZPy8oC5isk1VlP0s3M0VOajyo
	C7TZVNSIfELF7Ghn67mbcyQap+U09b0qCdBlNjA4koy+TFy2FsS+NECZ+aWU4f3sFg9Z
	79L48Ervs5Tki1RqAnp8g6z49RXX0vgd9Z33OGzIOJ6QwULs55WBS+5N4D9vRef/C4jl
	23E14/oQo6lSGgGgAgci96GtMO/sKgTYOQigov4reDpooSaNSWyZQAYyyLj4UxpmNsm6
	Jd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=St+p72mlCNwvn1KxJJmAjp0pOYKFgM10FlDtruNsz9E=;
	b=ABGWrs1MiEmf1tJyoonkXBcZosfKesmor4NcMAAH7xATyyBaZU27nAGIMYfUrJuGsN
	jZ9DLMGjWzfSqCoAB+NISMSSyHBMT0m7sQY+fhJ+hjCyKrI9Vw93svTJVkA7QpDHszJb
	2JAp9m9C34msjiRnZfsg2/naxWXVXlVBk9VNj3L6meRhA6UtNEy3ZVHJUM8AklpNG6Tl
	QfSXej7CRx7BskozEBfB64bfP91iIij5LMY85THOc0Wzqd2XbyUoitRDXeGuPtbND+gP
	7wsrt6F4rHlOaqUOMZ2J80CougmkMQgE+sHxBN58fIX3zP85/obO6lim6ZCMniRNIZUq
	n7rQ==
X-Gm-Message-State: AGRZ1gINcJpgCYIxKdcfh8WVSsOLkCso+LSHHKTnJiLtGKbZo1+zZMNd
	E3ktOcnyzTQX4v2VnGn31acq+nPT
X-Google-Smtp-Source: AJdET5fGgp6y36Cy03KIB28RgNFQrECM7+b3G5pBz9yrv1Vsoa33+c3gy6xV7Nbf/vnMYB2WErzr8Q==
X-Received: by 2002:adf:fb12:: with SMTP id
	c18-v6mr5373870wrr.200.1540550956756; 
	Fri, 26 Oct 2018 03:49:16 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	x8-v6sm23905660wrd.54.2018.10.26.03.49.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Oct 2018 03:49:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 12:48:54 +0200
Message-Id: <20181026104857.32142-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181026104857.32142-1-schnitzeltony@gmail.com>
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] xfce4-panel-profiles: initial add 1.0.8
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
X-List-Received-Date: Fri, 26 Oct 2018 10:49:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfce4-panel-profiles_1.0.8.bb                  | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb
new file mode 100644
index 000000000..5fa2a7bce
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Backup, restore, import, and export panel layouts"
+SECTION = "x11/application"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit python3native gettext distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+DEPENDS += "intltool-native"
+
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "bc75a143423fba3a82f114f47e86580c"
+SRC_URI[sha256sum] = "a69e20f5e637319e14898b5c13ff7ba31d001a6e38e7516d70dbfd7600ad72db"
+
+do_configure() {
+    # special configure - no autotools...
+    ./configure --prefix=${prefix}
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+    sed -i 's:${PYTHON}:python3:g' ${D}${bindir}/xfce4-panel-profiles
+}
+
+FILES_${PN} += "${datadir}/metainfo"
+
+RDEPENDS_${PN} += "python3-pygobject python3-pexpect"
-- 
2.14.5


