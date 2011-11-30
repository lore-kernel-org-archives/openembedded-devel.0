Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVfSz-0008BK-JZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 09:24:33 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so154835eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7QDz8db+imglQ8x3pRqw4HA+x16JNuudOlKCSifChjE=;
	b=W2kB/MrhzqSb255M4DEGGFT8s/62UyN8aHhuwr/cXlWBvgs9Y3cGInKocdiDz+6jXE
	CcnURuJsGq+bZdEVGmR3k0E4h6zO2QXMV1w6oapo6gHS8jRyAhNh2fkeHvbQPtJeGNwE
	GWaqD2uCytgALx6yk+jIW/5zZDwqaqfQ8mUjw=
Received: by 10.14.18.4 with SMTP id k4mr120430eek.169.1322641075992;
	Wed, 30 Nov 2011 00:17:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d6sm3627844eec.10.2011.11.30.00.17.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 00:17:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 09:16:52 +0100
Message-Id: <3cd56302dbe7ffe56a8762c2de86afe2374ac192.1322640506.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
References: <a>
	<55137a5d61c11567ab74d1c1382e04da35cecd5f.1322640506.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322640506.git.Martin.Jansa@gmail.com>
References: <cover.1322640506.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 05/11] efl.bbclass: don't remove STAGING_LIBDIR STAGING_INCDIR from efl pkgconfig files
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
X-List-Received-Date: Wed, 30 Nov 2011 08:24:33 -0000

* but replace those with ${libdir} and ${includedir}
* it was breaking edbus:
  Cflags: -I${includedir}/e_dbus-1 -I/OE/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/dbus-1.0 -I/OE/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/dbus-1.0/include
  after make install:
  Cflags: -I${includedir}/e_dbus-1 /dbus-1.0 -I/OE/shr-core/tmp-eglibc/sysroots/qemuarm/usr/lib/dbus-1.0/include
* and notice that dbus-1 is using -I{libdir} here, so replace it too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/efl.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
index f90dc1c..792343b 100644
--- a/meta-efl/classes/efl.bbclass
+++ b/meta-efl/classes/efl.bbclass
@@ -15,7 +15,7 @@ do_configure_prepend() {
 
 do_install_prepend () {
 	for i in `find ${S}/ -name "*.pc" -type f` ; do \
-		sed -i -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDIR}::g' $i
+		sed -i -e 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i
 	done
 }
 
-- 
1.7.8.rc4



