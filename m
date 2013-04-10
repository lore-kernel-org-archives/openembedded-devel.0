Received: from mail-pd0-f171.google.com ([209.85.192.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQ2Ln-0000BU-PX
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 23:14:49 +0200
Received: by mail-pd0-f171.google.com with SMTP id z10so476716pdj.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=XUDn8+B5+d/r8yWwOP3tN9330lXWrDLHWSv/u1aTFDk=;
	b=eUEIrfxLyKfDxe/EqP7S9uslD89SwuYEN27AED2HUOO0SNJisH5wTgp9gUQtDsb1DM
	3FsbtATHS14mLO5WjKebowdz476xMVKplem44wRj/vokNvsfrAGx6PFPKjUisOm33vo9
	nKtTlMycdOt1JMBvc0rw38yr58PpaDDuXjvsHlyfYRodqkcl9fuZnBFE3qVqEcZUGK7C
	MRNeeGTfH8KR/3lKUQGB34sn0v3Yzmgxyed4dEtjizSuKZdarfeT+z4RcNRMlVSTIZWZ
	4whSV3QQFQz9SIU7VST7wFTYIAQbjGoNxxZnRgp896p6aXM1tZFEK6MKAAIHnZcBTCQT
	yEjw==
X-Received: by 10.66.159.234 with SMTP id xf10mr5692568pab.203.1365627437206; 
	Wed, 10 Apr 2013 13:57:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b3sm1258853pbw.4.2013.04.10.13.57.14
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 13:57:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 22:57:06 +0200
Message-Id: <1365627426-27104-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][PATCH] icon-slicer: remove gtk+-native dependency from native build
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
X-List-Received-Date: Wed, 10 Apr 2013 21:14:50 -0000

* gtk+-native was removed from oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
index b9a2909..b77fbf5 100644
--- a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
+++ b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
@@ -2,6 +2,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ popt"
+DEPENDS_class-native = "popt-native"
 
 SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Makefile.am-no-examples.patch"
-- 
1.8.1.5



