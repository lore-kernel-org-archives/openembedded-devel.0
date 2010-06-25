Received: from fg-out-1718.google.com ([72.14.220.154])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OS7xi-00069I-Dk
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:25:54 +0200
Received: by fg-out-1718.google.com with SMTP id 22so2265487fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=WbPkSGB//vpGXF4CgfhcxfqUWoSkQTmIJasJxmjJQ8s=;
	b=RZq/MafbI6SfSSIwoNAvX2KgGWY/lhJtCt0tNjrpYdRmM6DqkF5PKYquzwhRg10uC3
	nxme3pWcMD+OXsmwwS0KrTceCTRHgm5KW/YEWdRA4yMr3ugi7vND8Yl/O0u0s43N9FQA
	k0tnUWPhanvURVjgmcPtP57KMNuRaQf0mU/U8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HoYPUm6YccHQi+MeBiQusiincU8Q99dmWnLnJWRlHs4lPvnncMtCe78OaMsmlIeb9+
	Bax39GR5L/+Ey+agOkbygefFpKjg3rEjwftAb0tQyOuRgvgyXuQURGUgUWd6U0GjoDlx
	1nO7xDYT40rEr+ywLfRutKY5j5XKsUopIKONE=
Received: by 10.223.18.154 with SMTP id w26mr503296faa.39.1277468414200;
	Fri, 25 Jun 2010 05:20:14 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j23sm43462189faa.2.2010.06.25.05.20.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jun 2010 05:20:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 14:19:43 +0200
Message-Id: <1277468383-16679-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
References: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 9/9] mesa: switch to new staging
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
X-List-Received-Date: Fri, 25 Jun 2010 12:28:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/mesa/mesa-common.inc |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/recipes/mesa/mesa-common.inc b/recipes/mesa/mesa-common.inc
index 51f7873..dd66410 100644
--- a/recipes/mesa/mesa-common.inc
+++ b/recipes/mesa/mesa-common.inc
@@ -4,7 +4,7 @@ DESCRIPTION = "An open source implementation of the OpenGL spec"
 HOMEPAGE = "http://mesa3d.org"
 LICENSE = "MIT"
 
-INC_PR = "r8"
+INC_PR = "r9"
 PE = "2"
 
 PROTO_DEPS = "xf86driproto glproto"
@@ -47,15 +47,12 @@ FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 FILES_libegl-dbg += "${libdir}/egl/.debug/*"
 
-do_stage() {
-        autotools_stage_all
-		install -d ${STAGING_INCDIR}/GL/	
-		cp -pPr ${S}/include/GL/internal* ${STAGING_INCDIR}/GL/
-}
-
+NATIVE_INSTALL_WORKS = "1"
 do_install_append () {
     install -d ${D}/${bindir}
     for i in glxdemo glxgears glxheads glxinfo; do 
         install -m 0755 ${S}/progs/xdemos/${i} ${D}/${bindir}
     done
+    install -d ${D}/${includedir}/GL
+    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
 }
-- 
1.7.0.2



