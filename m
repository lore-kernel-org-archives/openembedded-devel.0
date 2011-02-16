Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpfR5-0002e3-5y
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 12:20:43 +0100
Received: by yxd5 with SMTP id 5so534997yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 03:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=SyHmkwumEeB+fTTQAIfvNBBkDMZNR4KfR5hc5aBxENs=;
	b=aPBHgP0qgLdg3aEtnX5vtteOLFFANr+xnIGvg/ecaKDBhT6umwL/vP4DjSuqEyVQuI
	LdolS9dczBUd1Rwcy0L0ySZu5F5oTU1f4URqyGXJBX+AzygMC0idLOHtQkP5r1f306UA
	HTjhEIXXi8BvfU5FK09lSrbQSHWjZJHH088R8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=gwxk3Li0q8J03MIJC9+VAUnUTH8lEQIzo6+4313uMMqzS4WzXKdgmD8VFObxXuECIU
	Qz96wighkSBHfsj53Z+kDywl6U4ks5dKmvAPJj+o0rWFtPPnJdSbVZRmLCexTND7pS4t
	852PnyqEGsm4Q9JyzTv4YhVjGljCMOipNWJ+Q=
Received: by 10.236.105.244 with SMTP id k80mr847998yhg.60.1297855169833;
	Wed, 16 Feb 2011 03:19:29 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 68sm3057927yhl.19.2011.02.16.03.19.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 03:19:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:18:51 +0000
Message-Id: <1297855134-19216-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 10/13] qt4-tools-sdk: use host include headers for dbus
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
X-List-Received-Date: Wed, 16 Feb 2011 11:20:43 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/qt4/qt4-tools-sdk.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/qt4/qt4-tools-sdk.inc b/recipes/qt4/qt4-tools-sdk.inc
index ad896e4..bd70046 100644
--- a/recipes/qt4/qt4-tools-sdk.inc
+++ b/recipes/qt4/qt4-tools-sdk.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.trolltech.com"
 PRIORITY = "optional"
 LICENSE = "LGPLv2.1 GPLv3"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 FILESPATHPKG =. "qt-${PV}:"
 inherit sdk
@@ -32,9 +32,9 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -verbose -release -fast -static \
                 -embedded -no-freetype -no-glib -no-iconv \
                 -qt3support \
-                -I${STAGING_DIR_NATIVE}/usr/include \
-                -I${STAGING_DIR_NATIVE}/usr/include/dbus-1.0 \
-                -I${STAGING_DIR_NATIVE}/usr/lib/dbus-1.0/include"
+                -I${STAGING_DIR}/${HOST_SYS}${target_includedir} \
+                -I${STAGING_DIR}/${HOST_SYS}${target_includedir}/dbus-1.0 \
+                -I${STAGING_DIR}/${HOST_SYS}${target_libdir}/dbus-1.0/include"
 
 # yank default -e, otherwise we get the following error:
 # moc_qbuffer.cpp: No such file or directory
-- 
1.7.2.3



