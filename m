Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 951DA7F691
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:28 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f129so13914790wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bQechx1ePY/QmX980OOK8kPA5u4uYThb65b7WIKgcAQ=;
	b=F1Dd5kYdY5TE1jVgsHLOBbO9l86YdbpCRzwUYCyjo/cW60EDDvuC6N9VfCdOalDsIN
	C5NidP1dUBjq6dYDu0Kb4Vx5yfIR8QEROE1DqjzDBLUox85xG/PY4m1qlHgin0VyynuY
	cE4Vo8ODLfTEKk0D2misg/3p76zZN6oQ2hvPHP5MejSTA8SsfhGmnAk7s5iMGUH8cQf/
	O4bTFieRXuqXXykB5B8lISoToaodjr0+iqmK7U0vKY+Bd268Q8pAp4QzH+YNI0FdqLFQ
	pjPE1qZsk77YzdSEW8tsRix/ac3ZFOgWndB4/ZkqcBZJHgyWox9vh41/0hvEoqzTm0Bc
	aH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bQechx1ePY/QmX980OOK8kPA5u4uYThb65b7WIKgcAQ=;
	b=jI/3fKBgBTAYTXypSiRJl+ceCK0PEcxT/eXzTawrvBT4kaZqTcgbaTQHtc2WLDVz1Q
	FCAx4wFffnLJ351L6Zr7qJiJcMUTCKNTXgVCXcdCtC8AVcEfKfNKPS9KIScmcMaQNM4S
	DEHxZf9rYbdoNli3jC9xbjT/x0aJyqikUtUk54+VWhw5JOYUC4sVo3JxpVJIqj0UPRUd
	Bh40BdleXpJbg7AXB/SR7535NG0wdWjI7n0Sz/FMuMCnZcZhoqH00ZWfqmxuuyC6QFYo
	DCEYrCDy6I7OY2WW4rD5FF209wFPNZh+WidsODSwckxhknXRipRDnVQbSqt92e2vWQel
	t3vQ==
X-Gm-Message-State: APjAAAX3HZT3j8HoW6Swi9SuzYZBntTiiyuHWC3Z9rAm/TWLDO2YmQ9c
	BAi9X873dRtipdWSAeXwtKVxI5XU
X-Google-Smtp-Source: APXvYqwcCZntxnI5ldvDXhAhFd1vvuBeSKDIUJ1WjsoLHg5UzGc76vhOVjIkESGtHXB5aDWZ7jJ2Lg==
X-Received: by 2002:a1c:731a:: with SMTP id d26mr22146680wmb.130.1575880589040;
	Mon, 09 Dec 2019 00:36:29 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:35:59 +0100
Message-Id: <20191209083612.23922-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 07/20] gnome-online-accounts: initial add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:29 -0000
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


