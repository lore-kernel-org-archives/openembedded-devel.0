Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 60E97750DF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:50 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id l10-v6so17794428wrn.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EeZqOLk2H+a5hevjLLRc1BDbvRjQaxWWvu6F6AcmmFk=;
	b=qnALE6wkxXdYQ8vWHOTgHz5VIJJdK8ipaODkAF+dNWcWI5L44Cqre4JK92h/PYI2w9
	T9jnTv5xLv2OQKtIW8+2sRl6QvmAx+sYAFQB9WeWug/5PxusZaY7DPveE+BgPpSZEQoS
	WpcUudCA15hcN6xzd7Is27gJL2L7nAFlbiTFBk0I9HSm9R/+TNLqvIktPyFZW3yM7kTP
	XnPgBZL2pHGCg+S9MJ4y6k45xIlb1VL75r5vEPKqAMd2Ra9CNpJEENYWP1MLTEBGZEYu
	yADjnv6bsPmB+1IxvNU881vZD5cxQ2UhjFtZk5we3subJcPccu7t6d/mjW7oCxTMh+W9
	DgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EeZqOLk2H+a5hevjLLRc1BDbvRjQaxWWvu6F6AcmmFk=;
	b=FAWF9CGHJ6ohM55V0N+KJi+9v+zB6X7Q9P6hJk4oodDCu8V278LEopT+iJASx4ok6a
	k2FOqV4OSN83sT1XJZ3bdbLAng+3v1pj1bHxeERzDBsc9i0RKAiHthIQfVzRJl5zme64
	vzQxI7jAPCol4ZFkiY1qUerY468dlWnb/k6qsBxo/ywYRy/c8h8dTAoZTAraIg1Qqw1g
	+JVtBxYYkYGx/l2n/s6vItkLRLaIQnLioE0TE6hHyFNwiIe0YTeuyW8jmkxxi+gbML/4
	/fXc0PJS/QOd6mUSkmODJVAlDDuM4xPoGhX6iE0W2C4AO131zUCTQDNwqjBNTHknphug
	KLow==
X-Gm-Message-State: APt69E1fegYFDuKgLN8Bfm9LAZVpUkldw4Gzx93auEFlTDB2cMDRwm5I
	IGcqAGoP5Bt7Mo2z5lysNKu25g==
X-Google-Smtp-Source: ADUXVKIzkgA4+iSSoovO9A02+2m3fZMPZYgRMeOXA3bgk/IUbVTwmKSWp49gBAiJzm6lPPJ1SUjdPA==
X-Received: by 2002:adf:a0aa:: with SMTP id
	m39-v6mr9955061wrm.125.1528643330818; 
	Sun, 10 Jun 2018 08:08:50 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:10 +0200
Message-Id: <20180610150821.9536-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 08/19] thunar: upgrade 1.6.15 -> 1.8.0
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../thunar/{thunar_1.6.15.bb => thunar_1.8.0.bb}            | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.15.bb => thunar_1.8.0.bb} (66%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.6.15.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
similarity index 66%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.6.15.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
index 170e25070..65d6b28c5 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.6.15.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
@@ -2,15 +2,15 @@ SUMMARY = "File manager for the Xfce Desktop Environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui xfconf libsm dbus-glib startup-notification libnotify xfce4-panel udev"
+DEPENDS = "exo glib-2.0 gtk+3 gdk-pixbuf libxfce4util libxfce4ui xfconf libsm dbus-glib startup-notification libnotify xfce4-panel udev"
 
-inherit xfce distro_features_check
+inherit xfce gobject-introspection distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "8fea2af69c3acbb273fd1a177d3d8e47"
-SRC_URI[sha256sum] = "e81291a8519f495e0a059ff1f2d29608bc6d37c0be83b1f38f3c9aa25f8d252d"
+SRC_URI[md5sum] = "245ca8e9111c44667032023199ca7778"
+SRC_URI[sha256sum] = "acf151bceedb20aed45a6da61d7bb85a4a03964090c80454e72e61e7fc9e49c7"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
@@ -18,11 +18,12 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
 
 FILES_${PN} += " \
-    ${libdir}/thunarx-2/* \
+    ${libdir}/thunarx-3/* \
     ${libdir}/xfce4/panel/plugins/* \
     ${libdir}/Thunar/[Tt]hunar* \
-    ${datadir}/appdata \
+    ${libdir}/systemd \
     ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
     ${datadir}/polkit-1 \
     ${datadir}/Thunar \
     ${datadir}/xfce4/panel/plugins/* \
-- 
2.14.3


