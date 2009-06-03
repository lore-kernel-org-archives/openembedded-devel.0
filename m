Received: from [209.85.220.213] (helo=mail-fx0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsg8-0000ej-Vo
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:47:01 +0200
Received: by mail-fx0-f213.google.com with SMTP id 9so74430fxm.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Vur3G9v48KPXcOWB8p2f8Zb/4FNDz9Va52Q27s3nofU=;
	b=eGerTtdu9ffdUOkccndKzpTYo08DfxwNtDWrF8pSwezUXUAeW8Haj27LqWtVjtCr+f
	mtzKRvK0yi6K9ejsXM5H21U+s4Em6oS/Rtk6vOEO3LpwsaU2MnC77Y80CsqjSRq+eUwv
	rDfuoNuDgStlRuwBbcBgUm0/66cfZ2vl6vblM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=HGH9H0SzDGzWLqhnyN3V0HIXc1tI+b8cqO9FOwG6bdbHPgjKMdAcFHU8xLdEgj8gy5
	FfPBdNCoj+3kUlUeFXS+CWVCx4Hjez8s0gTehj8yFEvYdCYltCuwk1CvRhqh35atAPXU
	dfybltn0O725mHjXDCZ4g2E5HCMiL2P2aLmM4=
Received: by 10.102.219.8 with SMTP id r8mr732466mug.0.1244043483587;
	Wed, 03 Jun 2009 08:38:03 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 23sm454398mun.46.2009.06.03.08.38.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:38:03 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:20 +0300
Message-Id: <1244043442-3868-11-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-10-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-8-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-9-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-10-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 10/12] qt4: create mkspecs package
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
X-List-Received-Date: Wed, 03 Jun 2009 15:47:01 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index de7ae15..f5da652 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -63,6 +63,7 @@ OTHER_PACKAGES = "\
              ${QT_BASE_NAME}-fonts \
              ${QT_BASE_NAME}-linguist \
              ${QT_BASE_NAME}-makeqpf \
+             ${QT_BASE_NAME}-mkspecs \
              ${QT_BASE_NAME}-pixeltool \
              ${QT_BASE_NAME}-qt3to4"
 
@@ -98,6 +99,7 @@ FILES_${QT_BASE_NAME}-qt3to4               = "${bindir}/qt3to4 ${datadir}/${QT_D
 FILES_${QT_BASE_NAME}-qt3to4-dbg           = "${bindir}/.debug/qt3to4"
 FILES_${QT_BASE_NAME}-makeqpf              = "${bindir}/makeqpf"
 FILES_${QT_BASE_NAME}-makeqpf-dbg          = "${bindir}/.debug/makeqpf"
+FILES_${QT_BASE_NAME}-mkspecs              = "${datadir}/${QT_DIR_NAME}/mkspecs/*"
 
 
 do_configure() {
@@ -209,7 +211,6 @@ do_install() {
 
     # XXX, FIXME, TODO: package the demos and examples properly
     rm -rf ${D}/${bindir}/${QT_DIR_NAME}
-    rm -rf ${D}/${datadir}/${QT_DIR_NAME}/mkspecs
 
     # fix pkgconfig, libtool and prl files
     sed -i -e s#-L${S}/lib##g \
-- 
1.6.3.1



