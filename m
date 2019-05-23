Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5AFE97E40C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:12 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f204so4521634wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/s4GxM8tqYGdWOHjoGWNoML/4Hv4UvmsK8803hBQu3U=;
	b=LVWeBoQq90eK8WOdV73FdWflkYxXsJqpqTRjtcR4uCF9LmaG32EXhwshr8KvBmTqYr
	xrKPxCmBNJ/CWyW88caeaTmx7M1EmcuLw9zU7lXYx0Vo0ku7vLbOt8YPsaJWatYVktZl
	9DFl82GV6VkgkN0R5LBGmqZvHmUsbkXwKc08LqpJUS7m7eeiidS/4ZuaJxwQ+3eE3nFu
	Uonxq9qKycSnO3oi7Ep2IaT2f59BcUitkVZvUtPXDpmma0L6dyE6L+x0PpuV+td/DIa8
	hw77RJOa7AyFoLtgso7fN0CuV3XG+hbv+GEXKKm4gH6GXj5anHaX4fB3IL6I5eOb/JyZ
	zXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/s4GxM8tqYGdWOHjoGWNoML/4Hv4UvmsK8803hBQu3U=;
	b=R1d846J434jzqnE1U/DS2viG4+f9USrrS9FnosMe1BIVPpQ5SvNF4shl0Ka6wFMAu3
	029CSwld3h+e1LhY7PyciAX/uM3s44SxvTLYTn44r0AWOmFRiLOQsk+Vbiwgp9xMS1pF
	GaTMYnRbnjgGX1g3tYcvJOdN4mjskxCjL7NLiCRhl+vGEvUckwpncbqt1vUwGMf22bBx
	yb9vKSlCB5dR+gVEz2DCjCd1NNzO8aCIg8TaPlQo4ke0TX9G/XGwpBx444ZRy2QdZdLy
	5SgHSDhcImy97+aNAtLH3uKFOquLfjfrljFDUGByi+xQJ8JiwZS6xdUvohn/cA4+jacz
	cv4w==
X-Gm-Message-State: APjAAAV1Rhh+M2ZaiYD0I3jymuruk8vPW/MP3PEAgeOfmk9x0bcDcBSj
	UcljWsLlwXKotOrqu6aFykk/85ANzYY=
X-Google-Smtp-Source: APXvYqwMH+eBVdBptmL0XUafLnIXFliYLO+rtqmcC4ckojWGAJtYyl5PXwAUbYC9SBJcVYtMCmOxyQ==
X-Received: by 2002:a1c:80d7:: with SMTP id b206mr10643614wmd.48.1558594153014;
	Wed, 22 May 2019 23:49:13 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:24 +0200
Message-Id: <20190523064859.24336-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/41] yelp: initial add 3.32.1
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
X-List-Received-Date: Thu, 23 May 2019 06:49:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_3.32.1.bb | 37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp_3.32.1.bb

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_3.32.1.bb b/meta-gnome/recipes-gnome/yelp/yelp_3.32.1.bb
new file mode 100644
index 000000000..910f1ab34
--- /dev/null
+++ b/meta-gnome/recipes-gnome/yelp/yelp_3.32.1.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Help browser for the GNOME desktop"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=6e1b9cb787e76d7e6946887a65caa754 \
+"
+
+inherit gnomebase gsettings gettext gtk-doc
+
+SRC_URI[archive.md5sum] = "f8d3463f95b636651b1879cbb0955def"
+SRC_URI[archive.sha256sum] = "99589896b2d60f66e1219285e62736168402e1a5464b58de813e59aebdf32a95"
+
+B = "${S}"
+
+DEPENDS += " \
+    libxml2-native \
+    glib-2.0-native \
+    itstool-native \
+    gtk+3 \
+    appstream-glib \
+    libxslt \
+    sqlite3 \
+    webkitgtk \
+    yelp-xsl \
+"
+
+EXTRA_OECONF = "--disable-appstream-util"
+
+do_configure_prepend() {
+    export ITSTOOL=${STAGING_BINDIR_NATIVE}/itstool
+}
+
+FILES_${PN} += " \
+    ${datadir}/metainfo \
+    ${datadir}/yelp-xsl \
+"
+
+RDEPENDS_${PN} += "yelp-xsl"
-- 
2.20.1


