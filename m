Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9E77FAAE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:01 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c9so14116172wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bQechx1ePY/QmX980OOK8kPA5u4uYThb65b7WIKgcAQ=;
	b=f/QO2szqtZGR9lDI4cBHuOjBWDhmYHbcyKKrYCfCz+E6AorHKdQs49FRzsMLsAjM/N
	dyrzEFft6sxM7U6u2q4S9DayZRuOFOVdAGVsLfZy5MQBSIJIDQHbQ6CRHsSQbB95xcl+
	QwyAn4HJqJ2nvS8cInxo+AjJxknBxHqCbfyaplw91WJs2P+k2SDe3XoNZuk3/oLa+e8U
	2LKLB8XThb9M8ZtrWvr2A3cMBTSMxC1moDjju0PJHQBzQYLRsOiV8iz8IvRBfX/uQOpd
	ABoM5bc+y9msKaqdPiefySR5kObRRomiiqOAmU55aveCQaYg8w8dOOkU1y0qdybTAlP7
	LcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bQechx1ePY/QmX980OOK8kPA5u4uYThb65b7WIKgcAQ=;
	b=LQj4dmpDCGoCAdIqq4pBJ+fMvepMFBHqVN6oNL2G7hOwfT/bQW4jc/Rv7gDfXycR7O
	mtph/IeXRq97zk9ocO9r4GNSJLTbA1Z+41n9YZCIaX4sSSCP/46emYsF6+acJ/uBRhU3
	W4jJlieNyC+r/fFIBGP010Wf/UvDtGgxttq/dwZFvZ/Vo6uFlaYZkv4hddz4QRtXoHhY
	Hq2w3VmMZWg/8fjuQctM5DpHGBGF3I5x8nxgtusWAaR6kypJLC9Yi9sc/4q2awhzFQKJ
	T2Prnp5cs94MqbVRhIVHN2GTr1TqnDKrMXBRP+kb2umKyTNMgyBZeI6sTYy9NVIuj7Nz
	ycxw==
X-Gm-Message-State: APjAAAXpf7JIGn/iaOJa14MdT2bUGPQexRLirwA3oX2gznt/MPwVnw8q
	TN7Ymf664eGywJANNInkKRpdxIzY
X-Google-Smtp-Source: APXvYqxd5Xb6tbExYjuYn4iytXtkDHlGePZRzCixGzhIawQpcSVsi/6LPkBT4NMjN9h5Uq/qdEd/Nw==
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr28364685wrr.312.1575851941765;
	Sun, 08 Dec 2019 16:39:01 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:22 +0100
Message-Id: <20191209003840.3383-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/29] gnome-online-accounts: initial add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a mandatory dependency for upcoming gnome-control-center

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-online-accounts_3.34.1.bb           | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb
new file mode 100644
index 000000000..74d71ec81
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.34.1.bb
@@ -0,0 +1,35 @@
+SUMMARY = "GNOME Online Accounts - Single sign-on framework for GNOME"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=34c88b124db5fb2762c1676be7dadd36"
+
+GNOMEBASEBUILDCLASS = "autotools"
+
+inherit gnomebase gsettings gobject-introspection gsettings gtk-doc vala gettext upstream-version-is-even features_check
+
+# for webkitgtk
+REQUIRED_DISTRO_FEATURES = "x11"
+
+DEPENDS = "glib-2.0"
+
+SRC_URI[archive.md5sum] = "aa94d1dd07ca53729a036b5df1c78c05"
+SRC_URI[archive.sha256sum] = "4832ca8e48d3a497fc676e7b6f146009ab4206995362977b9805aa39f164783a"
+
+# backend is required for gnome-control-center
+PACKAGECONFIG = "backend other"
+
+PACKAGECONFIG[backend] = "--enable-backend,--disable-backend,gtk+3 webkitgtk libsoup-2.4 json-glib libsecret rest libxml2"
+PACKAGECONFIG[krb5] = "--enable-kerberos, --disable-kerberos , krb5 gcr"
+
+# no extra dependencies!
+PACKAGECONFIG[other] = " \
+    --enable-facebook  --enable-foursquare  --enable-exchange  --enable-flickr  --enable-google  --enable-imap-smtp  --enable-owncloud  --enable-windows-live,\
+    --disable-facebook --disable-foursquare --disable-exchange --disable-flickr --disable-google --disable-imap-smtp --disable-owncloud --disable-windows-live, \
+"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${libdir}/goa-1.0/web-extensions/*.so \
+"
+
+# looked into pkg-config file: it is not a bug - they mean it
+FILES_${PN}-dev += "${libdir}/goa-1.0/include"
-- 
2.21.0


