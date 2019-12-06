Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 986747F95C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:31 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id g206so5985143wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GlZgIgCZHv3uVQo47VPPhDNRqH6bA1b3SgXE+0jUPdc=;
	b=JDEYnVKmBfTWNZoZRBuYboJc7v18dUGDGLDpAzfGxok8oKWBGo0LFaTd1ClvIk2d+w
	Gkw7CrONmy94oy7bwILFCeLWBiGx1yzh2ZB180Me4XJy5NHIKFd0Ec+P3AKiMir/Ry/l
	FOrfuicocDP5f/tis19eoEeMx14x0mFOsDBfOiYIlXrtN7hBKCLX1I7W3aJZGq2WcGWr
	8eiDBF1pOGmiKmxlIFT7r6/J2kRgyFPCQrcByutXRGRB6UYm8zOK//4kxFj3zJbKjUN9
	FvAr8eqYeF/gr1Qu1j1qsTWa+vkjDfxxgy5nymlS+0PWdw1Z5Zf98f52jhoE9XBQjzf3
	1+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GlZgIgCZHv3uVQo47VPPhDNRqH6bA1b3SgXE+0jUPdc=;
	b=HZWKdZwLWJf+xg6+J0pgcydtrQKnyOAfctRksVVOuiLkeJbtM2tAJzxTAK1TyiM0pZ
	gv3q/NXBz+xrkrsnkVHT8hUWPzJBl+AHROAkT55Sqr+7CEe8qd/r21GSBC8CokBENMZD
	ThXFgsok7ZZGou8JreDZT0zh0Zo9dpLHA7Pygk30L3FdMjI7GERUS+XA1kp4yUcaRDoK
	6uqM9/imAH+QoxAg+qhDDzHhD/MMPmG4Y4y4vA1PNyxUeaNaf4mtU8zNBc0h/OZmmnsB
	VQLA4L4rOPY70bX6Iw5PIUTjBBVM4oUTCJeEnbZLG35lrI7NEA7yPel6nMmceSA+IXXR
	kiBw==
X-Gm-Message-State: APjAAAVGrmm43d46iNKxVn5u9dLfQ/WAHN33/AQy0n++u2gAynH+S+4R
	hplpE80Ioj9WyTSH7pQ5965Jwm+c
X-Google-Smtp-Source: APXvYqxyrOXy9GCni9A3bNBR2fVBH+qKJtYBZssiqdR0dfGOC4DAXkwINqX1kQ/NC4+VDNQrEiHyVg==
X-Received: by 2002:a1c:9ec6:: with SMTP id h189mr1025935wme.28.1575590972145; 
	Thu, 05 Dec 2019 16:09:32 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:08:59 +0100
Message-Id: <20191206000912.19841-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/21] gnome-shell-extensions: initial add 3.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-shell-extensions_3.34.1.bb          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
new file mode 100644
index 000000000..93460baf2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "GNOME Shell Extensions"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4cb3a392cbf81a9e685ec13b88c4c101"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gettext gsettings
+
+SRC_URI[archive.md5sum] = "09e64640bbf0e978171d581e2086a0c6"
+SRC_URI[archive.sha256sum] = "b0ad51143b1bf40def4a10f8fd0ab0ffb47218304800794e62cadd29d0acc75b"
+
+DEPENDS += " \
+    sassc-native \
+"
+
+EXTRA_OEMESON += " \
+    -Dextension_set=all \
+    -Dclassic_mode=true \
+"
+
+RDEPENDS_${PN} += "gnome-shell"
+
+FILES_${PN} += " \
+    ${datadir}/gnome-shell \
+    ${datadir}/gnome-session \
+    ${datadir}/xsessions \
+"
-- 
2.21.0


