Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4n5D-0003j4-UV
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 08:09:28 +0200
Received: by pbcwy7 with SMTP id wy7so2828031pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2012 22:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=RvXBHVrZ56KKYr8JsGJqNgCenzELKdO4bWEzLIYp8ok=;
	b=hQQOVX5YC/EaBK0eMz8rufCvGhQXh43rnG1jGOoz18FtSC67u5q/hEUV6ApKt5HBQe
	6G7FGezoyhC1rEKoyNxzk+0+/psJZXG/7JhvzBBlKCoP8OBRI5Tq4jAGX8K8AoTY2ts2
	foXm25R+a7ZlwzdKUTOqrWq2hUvmuND9/Hfy1AtQneAjWuooCLGsXKdD/Jma/0jEI3S+
	RtLJGMcLh1ZHoLJpBZvfVQAxn1yiQOcy193HEYdx3bUORxZRRj1a/fNzpuhw/Xw5lM4e
	iCUFgvDwZi7OzIv6d92ADwIrv/svdwZLC/6svNVfzj/er5soals7o2Bv2CIbZPHf3Q4c
	37mA==
Received: by 10.68.230.194 with SMTP id ta2mr10231472pbc.30.1345787840090;
	Thu, 23 Aug 2012 22:57:20 -0700 (PDT)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id hr9sm7594293pbc.36.2012.08.23.22.57.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 22:57:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2012 22:57:02 -0700
Message-Id: <1345787825-9950-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
References: <1345787825-9950-1-git-send-email-raj.khem@gmail.com>
Subject: [2011.03-maintenance][PATCH 2/5] qt-4.7.1: Dont create symlinks for non existing binaries
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
X-List-Received-Date: Fri, 24 Aug 2012 06:09:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/qt4/qt-4.7.1.inc |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes/qt4/qt-4.7.1.inc b/recipes/qt4/qt-4.7.1.inc
index bf3f39e..7177d26 100644
--- a/recipes/qt4/qt-4.7.1.inc
+++ b/recipes/qt4/qt-4.7.1.inc
@@ -49,10 +49,6 @@ do_compile() {
     fi
 
     unset CFLAGS CXXFLAGS
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
 
     oe_runmake ${EXTRA_ENV}
 }
@@ -60,7 +56,10 @@ do_compile() {
 do_install_append() {
 	install -d ${D}${bindir}
 	for i in rcc uic moc ; do
-		install -m 0755 ${S}/bin/$i ${D}${bindir}/
+		if [ -e ${S}/bin/$i ]
+		then
+			install -m 0755 ${S}/bin/$i ${D}${bindir}/
+		fi
 	done
 
         #Append an E to the qtdemo file
-- 
1.7.9.5



