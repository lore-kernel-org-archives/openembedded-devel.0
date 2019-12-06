Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 67BA07FA41
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f129so5656801wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZBV0wl4egDu4jku/DVcHkm4vMVVcg3DZhjL5/2LqW6U=;
	b=lZRlYNgpZMgyRfQt0IJU+IMf4W3BLDbg2bhPkdfKlULphC4kqxCmYYel0icqwCVGCO
	bXG+GYs2se9fay/qV8ude+WwuH/x+MgE1sxd0a+bPJBDUh0vwJcDAaeQoZN0xpnYeRz6
	hZYQ1xy//jELlFMzjSCH9uevpwXUmimC1kG7u3JU+ZyArImFWPula2xfwWPtVw4GY2CN
	7CioV0AQmjSSntOs5Npm0VU2RJpD9jXYDxXGH3v8hB15p0c5rCG3CpzzaPvGPGIlHVl1
	txPaTgL7SNodXWgK/QuBcDafraE5M+w1IHEGagJcJCwCDTEJP4k0poPS9DATzk/pZFAK
	Y8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZBV0wl4egDu4jku/DVcHkm4vMVVcg3DZhjL5/2LqW6U=;
	b=qRV3NvtHW4cxWZ0K1oCTJnK0yqtKhyYF6OUsc8TOabnNB12VN6rK/K1Fo5Lx8v69oC
	q79IRl5CZabSgSLoRetXZM/Vy4JvDlQ3+TTRh878Fb/PpF3ychWjzIU1ta3XarLG94EX
	9xCfUnh7Qu2Py2j0Ugawfr37/AiG50rRc8YRdFjWfZU6siYZHhUOZRR5RDUZ3o545+kN
	Cw8uF1WJRHF0VXfXlr2nVRXPcsrh1WEfh51ZpZIzb5bzfIk5F+zE7d2XPHRDSAJ2ZFCa
	bTLp30BHMKtk+r1qmOfloTT7hBYfsv3eh95ehju3sdBbUsCL+oypA0wz1DtEu4CdYBoN
	00+g==
X-Gm-Message-State: APjAAAU7JER4D3Gvml8V5PtL3e8p2XeAXVFW6HCCVLYETG+6NHh/vb7e
	i1+pyQqLLW0Py7mfdOG89qf6Zn67
X-Google-Smtp-Source: APXvYqzMq5r5pO4AookAyrDKuqGo0wFDiIi0Od/18yfC95Zd8WOvhad9PBWHkzsDvoecj1PepdkG8w==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr7597394wmc.59.1575590982828; 
	Thu, 05 Dec 2019 16:09:42 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:09 +0100
Message-Id: <20191206000912.19841-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 18/21] metacity: upgrade 3.32.0 -> 3.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is more or less a recipe-rewrite:

* get sources from GNOME
* cleanup DEPENDS
* give up tailored configure
* make xinerama a PACKAGECONFIG

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{metacity_3.32.0.bb => metacity_3.34.1.bb} | 41 +++++++++----------
 1 file changed, 19 insertions(+), 22 deletions(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.32.0.bb => metacity_3.34.1.bb} (44%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
similarity index 44%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
index 8f15c5774..d8c8b5389 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.34.1.bb
@@ -6,36 +6,33 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b4cce53560b8e619ffa7c830fb8761aa \
 
 PE = "1"
 
-DEPENDS = "gsettings-desktop-schemas startup-notification \
-           gnome-doc-utils gdk-pixbuf-native \
-           gtk+3 glib-2.0 libcanberra libgtop intltool-native"
+DEPENDS = " \
+    gdk-pixbuf-native \
+    gtk+3 \
+    gsettings-desktop-schemas \
+    startup-notification \
+    libcanberra \
+    libgtop \
+"
+
 
-inherit autotools gettext gnomebase features_check
 # depends on startup-notification which depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://github.com/GNOME/metacity.git;branch=master \
-           file://0001-drop-zenity-detection.patch \
-"
-
-S = "${WORKDIR}/git"
-SRCREV = "bf1bfbadf47eff97703df17e95b15168e2034222"
+inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-EXTRA_OECONF += "--disable-xinerama"
-
-PACKAGECONFIG ?= ""
+SRC_URI[archive.md5sum] = "c0c10204e4d6d024cb413042c1de316b"
+SRC_URI[archive.sha256sum] = "31c7d1045c390afb3bf405735b0b26c459197cbf43af37c469eb8918ce3a453d"
+SRC_URI += "file://0001-drop-zenity-detection.patch"
 
+PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
 # enable as neccessary until new warnings are dealt with
 PACKAGECONFIG[werror] = "--enable-Werror,--disable-Werror,,"
 
-do_configure_prepend() {
-    cd ${S}
-    aclocal --install || exit 1
-    autoreconf --verbose --force --install -Wno-portability || exit 1
-    cd -
-
-}
+FILES_${PN} += " \
+    ${datadir}/themes \
+    ${datadir}/gnome-control-center \
+    ${datadir}/gnome\
+"
 
-FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
 RDEPENDS_${PN} += "gsettings-desktop-schemas"
-
-- 
2.21.0


