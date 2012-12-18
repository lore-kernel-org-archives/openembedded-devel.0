Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0g6-00072I-El
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:10:09 +0100
Received: by mail-ea0-f171.google.com with SMTP id n10so366123eaa.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=48IgIx2ycTr3bYb1cUIPYAevsxhC5ezAh5YicJK+6cM=;
	b=LVErlqOoOmKeHZVkru7oUYyFna92rfSxMg47hIVjTOjc1svJpwY/udkc+xfjr8GYNN
	n/FwOXiuSC0EDT4Q6ZJYw3OaSCApb8LrBxO9MP6zktTfDGlBLVN9bNVAKNqtmafevI/3
	vD4ZtB/0vi6wZgyzdXDNTyKG4soE7slY87bVGiAH3hInw4lpGFnhvkbUVp53JCojsY5d
	gnuEuGUivEC6tE86Hza9I8aLEuQQCV6MMOfBJCZqa19ycSpYWmjEK2l5oy5qBZ+jqEB0
	ojmUQ6ICk2k7ItQCs0AQqdYvUPvJ0iz+NXDbB6ShRAtgeBs3CQgJ8LKws5Nq/Yuu4vju
	CB5A==
X-Received: by 10.14.3.195 with SMTP id 43mr7004465eeh.36.1355849720757;
	Tue, 18 Dec 2012 08:55:20 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f49sm4215780eep.12.2012.12.18.08.55.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:55:06 +0100
Message-Id: <e8874ce41f1614ac17607a169ee3370b56811911.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/10] evince: disable help build
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
X-List-Received-Date: Tue, 18 Dec 2012 17:10:20 -0000

* xsltproc does not work in oe-core correctly:
  | xsltproc -o evince-it.omf --stringparam db2omf.basename evince --stringparam db2omf.format 'docbook' --stringparam db2omf.dtd "-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam db2omf.lang it --stringparam db2omf.omf_dir "/usr/share/omf" --stringparam db2omf.help_dir "/usr/share/gnome/help" --stringparam db2omf.omf_in "/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/evince/2.32.0-r2/evince-2.32.0/help/evince.omf.in"  /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm`/OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/pkg-config --variable db2omf gnome-doc-utils` it/evince.xml || { rm -f "evince-it.omf"; exit 1; }
  | http://www.oasis-open.org/docbook/xml/4.1.2/dbhierx.mod:115: parser warning : PEReference: %list.class; not found
  |               %local.divcomponent.mix;">
  |                                        ^
  ...
* https://bugzilla.yoctoproject.org/show_bug.cgi?id=2416

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
index f92a599..74958d8 100644
--- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
 DEPENDS = "gnome-icon-theme gnome-doc-utils-native libgnome-keyring nautilus tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
 
-PR = "r2"
+PR = "r3"
 
 inherit gnome pkgconfig gtk-icon-cache
 
@@ -17,6 +17,7 @@ EXTRA_OECONF = " --enable-thumbnailer \
                  --enable-nautilus \
                  --disable-scrollkeeper \
                  --enable-pixbuf \
+                 --disable-help \
                "
 
 do_install_append() {
-- 
1.8.0.2



