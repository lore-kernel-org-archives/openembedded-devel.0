Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5G1s-0005lK-W8
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:59:25 +0200
Received: by fxi1 with SMTP id 1so3616324fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=FSgdeB8gQM/0VQY2nlFaG6LxOx3d3+ljG6ozBlb07/Q=;
	b=ej7SGmZrsInVvm2KEHCAJfgmyXvMK7VmXzwX5k5uczf3uzS8tZNsuYcHHPVabrZoHC
	TVr7GpivIdDomi/oykpWdru3VL04SUYJYCl7rczeCHPzAOVlr/v9UxtqPwg/gVJeW2Or
	O+B6a3b6+yNBgLTHQLEKumo4dlHLD59AoPLk4=
Received: by 10.223.41.87 with SMTP id n23mr2991562fae.78.1316346850369;
	Sun, 18 Sep 2011 04:54:10 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t19sm17965467faj.23.2011.09.18.04.54.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:54:09 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:53:53 +0400
Message-Id: <1316346834-11051-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316346834-11051-1-git-send-email-dbaryshkov@gmail.com>
References: <1316346834-11051-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-oe 2/2] gconf: fix the "unshipped files" warnings
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
X-List-Received-Date: Sun, 18 Sep 2011 11:59:25 -0000

1) correct static libs removal in do_install_append
2) provide .la files in -dev package as it's usually done in other
packages.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb b/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb
index 1d5a857..3745bc6 100644
--- a/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb
+++ b/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb
@@ -30,6 +30,7 @@ do_install_append() {
 
 	# this stuff is unusable
 	rm ${D}${libdir}/GConf/*/*.*a
+	rm ${D}${libdir}/gio/*/*.*a
 }
 
 RDEPENDS_${PN} += "dbus-x11"
@@ -41,4 +42,5 @@ FILES_${PN} += "${libdir}/GConf/* \
 "
 
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
-FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd"
+FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd \
+		    ${libdir}/*/gio/*/*.la"
-- 
1.7.2.5



