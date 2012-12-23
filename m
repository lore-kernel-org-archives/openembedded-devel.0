Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkrh-0001yX-MQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:41:28 +0100
Received: by mail-ee0-f50.google.com with SMTP id b45so3259493eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=dCVdhab+HU5PAVV+p8DG691cDFXAh7xz/nJE6QP/w+c=;
	b=g3I8U/CsuiZSn3sCK7NcFC0TYFtcjQV//hLZxVENjc6m67u7YoXmocF/fQxwKJmJ6j
	fpOFtfp7HInUu5up8FY1/talb7w1/40g88OCyu40jfQhPXODwo6OTiNQXTIgntJO4j+G
	9VGQxxg3z+D59sHbjttG8b92f/995/xGCPnWj/t5cj+Nvar3n1980LnLC/AjL6ArSxOQ
	1x5dY133GjBc5mEUs5SeRMsyfIgLsZ1+/r3v3BJCoratNAa85w8LawIpZuqET6jxC1ue
	zwvtwCl5ZvM9p24w7/fx+Zz2yJizUoNYAZubkJSh/4vcohOBZmTiaGQz4iH619T3mzX5
	By0w==
X-Received: by 10.14.2.196 with SMTP id 44mr47886652eef.25.1356265585381;
	Sun, 23 Dec 2012 04:26:25 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 43sm34566295eed.10.2012.12.23.04.26.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:26:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:55 +0100
Message-Id: <a211d495558f7d1e9ecb53da457c5e34bc5ee40c.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 30/30] nautilus3: fix packaging issue
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
X-List-Received-Date: Sun, 23 Dec 2012 12:41:43 -0000

* ERROR: QA Issue: non debug package contains .debug directory: nautilus3 path /work/armv5te-oe-linux-gnueabi/nautilus3/3.2.1-r3/packages-split/nautilus3/usr/lib/nautilus/extensions-3.0/.debug/libnautilus-sendto.so

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
index 728e718..488df1c 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
@@ -6,7 +6,7 @@ LICENSE="GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426 \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "libnotify3 gtk+3 libunique gvfs librsvg libexif gnome-desktop3"
 # optional: tracker
@@ -35,7 +35,8 @@ FILES_${PN} += "${datadir}/icons \
                 ${datadir}/dbus-1 \
                 ${libdir}/nautilus/extensions*/*.so \
                "
-FILES_${PN}-dbg += "/usr/libexec/.debug"
+FILES_${PN}-dbg += "/usr/libexec/.debug \
+  ${libdir}/nautilus/extensions*/.debug"
 
 # Don't make nautils drag us in
 PRIVATE_LIBS = "libnautilus-extension.so.1"
-- 
1.8.0.2



