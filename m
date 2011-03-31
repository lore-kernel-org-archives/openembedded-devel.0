Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5Eyo-0000Vt-Us
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 12:19:55 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1699154bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=dKSU/gmmX64Z4SzlcA6XfMc4JULCYhx8HwddzgupuiI=;
	b=h370F2pFGGAuafavm89ad6ouuFP4togR/Q3ZMeZPV+InYW+nI2jnKmsNb1WPU7q7hy
	s1oRAG9IYoEutBb4qXPoNiwCFd2JzCGSw50k/DRf4iHJZhZPvSMj26bYd0WWEnWQfDwh
	BNiVfNfcGxC78hQ/SGGBvLd8f3gBkfLIBFbQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Mz/gl4UuzewqAeNtMTlj6Tcto02gfJ9rFXb3aBdbYiZsDEJVYhx50OTG1Qd0y/CKVt
	ojf/yjY7nL4Ls6bfX+uDEuMs0yZS+B5NkhbCRisZU++PSWxaKNhQT2BWyNBAIzMQwv9o
	xF7ltdTSOrLpDzzT+qwOSw3V8778Of6+uyNfA=
Received: by 10.204.127.68 with SMTP id f4mr2221888bks.42.1301566676415;
	Thu, 31 Mar 2011 03:17:56 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm637785bkl.1.2011.03.31.03.17.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:17:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:17:53 +0200
Message-Id: <b954c6fd0585fcb6cdb0a809e4a19886b48396d7.1301560589.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301560589.git.Martin.Jansa@gmail.com>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/8] libeflvala: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 10:19:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/libeflvala_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index 6c56ba4..3ac2384 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Vala meets the Enlightenment Foundation Libraries"
 AUTHOR = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
-LICENSE = "LGPL"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary"
 PV = "2011.01.13.1+svnr${SRCPV}"
-- 
1.7.4.1



