Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBM1f-0005cn-Nr
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 09:08:39 +0100
Received: by wibhm17 with SMTP id hm17so2343033wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 00:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kZPDVz9b8PVVb+QX28Ayq87YMz5e2Lmnu7mviPkU1Lk=;
	b=J9jW54gcrHkk65LnQ7JaZiVfDxA8iRRE5wOzDc9PSc1R+YT8jdzaqUCh8jpdbCsH+g
	9v6OgAou/QUoRNjZuE502jYtrtdL22yywi8k9AbEDLRH0/DtmmComH2CPEsHb0ke1A2y
	HV/cFTyV5CBtW2ROl/FhlEJPENCn3Oglh4lE+/3xHmNfSdUQKQYc8EhXM67K9II/LBk1
	FBNa7aUrYOJd/S16E9owb5j++ox8QEJ+lyp+fShWPgdlmz06Aus3gCq7dixdX1TNBQdC
	dCIIIC+jik72imGgRFFN1r9ryqce3bCLGl7SPwWusxzOWmZTAOafENWgD+FJqVRAtbc6
	tEyA==
Received: by 10.180.89.9 with SMTP id bk9mr3296981wib.11.1332575982952;
	Sat, 24 Mar 2012 00:59:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm34128825wix.10.2012.03.24.00.59.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 00:59:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2012 08:59:30 +0100
Message-Id: <3f310c7f5d6120ff6a1b744089b48b2ae982bfa7.1332575856.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <caec63e12fc6f93d292da393985032c2d407d6f8.1332575856.git.Martin.Jansa@gmail.com>
References: <caec63e12fc6f93d292da393985032c2d407d6f8.1332575856.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332575856.git.Martin.Jansa@gmail.com>
References: <cover.1332575856.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/3] emotion: fix upgrade path from libemotion0 to libemotion1
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
X-List-Received-Date: Sat, 24 Mar 2012 08:08:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/emotion_svn.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index 2588256..f9ae8f6 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
 # we no longer build the libxine backend, since the gstreamer backend seems more promising
 DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base"
 PV = "0.2.0+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 
 inherit efl
@@ -16,3 +16,5 @@ EXTRA_OECONF = "--disable-xine --enable-gstreamer --with-edje-cc=${STAGING_BINDI
 PACKAGES =+ "emotion-backend-gstreamer"
 FILES_emotion-backend-gstreamer = "${libdir}/emotion/*.so"
 RRECOMMENDS_${PN} = "emotion-backend-gstreamer"
+# upgrade path from libemotion0 to libemotion1
+RREPLACES_${PN} = "libemotion0"
-- 
1.7.8.5



