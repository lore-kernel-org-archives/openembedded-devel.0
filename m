Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHhv-00070a-Jh
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:47 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1522503eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Bjx/BcNwscXjSOkTJ6T8BO26bbRMS/8VquMnqbr5UUQ=;
	b=G58bH99Nu0ldId+qSTsDzcP/Xvu+tpuIa6llgCM+OvGOtzatTktEJtgQpZE0yqKpUv
	QInD/XLPoIQj3xsbVqeBbd+2GIdoufpsUqgEm+yZU6L4/3PR3r06ZtbLq8W0taiJqVR8
	EJZQpuZ48NBmNHOzreXokU7FOdY3eIRGD47VJqJyPdm4g5Bu6+o5K/s114kJ4okZlWcr
	UwrjXuTp2EadMEH6/Hz4aUbWFYE4JWkb+liqhWxg3qGkpr3ILpx/XwK2JK4O9v5+MlTz
	nWk/CgFq8IjZkjEHKXTrYspPWwUjyLrKbhwDszwXT4TRqTd8b86sv4ofQ8fPRp+vNJKb
	3/XQ==
Received: by 10.14.225.72 with SMTP id y48mr9068767eep.46.1355438532473;
	Thu, 13 Dec 2012 14:42:12 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f6sm5682433eeo.7.2012.12.13.14.42.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:42:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:49 +0100
Message-Id: <438ebe8cfe643f3d82f3a825651693c4c90edb6f.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/11] glade3: disable html doc, fails to build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 22:56:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/glade/glade3_3.8.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
index 8cd6a0e..049f7e3 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
                     file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
 DEPENDS = "gtk+ gnome-doc-utils-native"
 
+PR = "r1"
+
 inherit autotools pkgconfig pythonnative
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
@@ -14,6 +16,10 @@ SRC_URI[sha256sum] = "f180a5018eee6e3fe574854cb025af897dd9962b01d17d5752e626876d
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
+do_configure_prepend() {
+  sed -i 's/HAVE_GNOME_DOC_UTILS/HAVE_GNOME_DOC_UTILS_IGNORED/g' ${S}/Makefile.am
+}
+
 FILES_${PN} += "${datadir}/icons"
 FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
 FILES_${PN}-dev += "${libdir}/glade3/modules/*.la"
-- 
1.8.0.2



