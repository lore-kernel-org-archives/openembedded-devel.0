Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjdxg-0003hE-FX
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 23:05:44 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2390408fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ig5Xp+4IRC6x9IQH/3H1nI5xP0/0iBzHJYwBQyn4dUU=;
	b=kOOuMxmx9U3CiAKQp8lP1alIwrObW/ktx2DC8oBXA9/XEbjEPn9k2No3PfxCYh/iPm
	gXqyeF5A9027y2JKVkLeIJmlBH/cpkLcKN3ZDAJpyTBpMxKpdeLJqrFS45a5w9RvOmAO
	YNEz+pTZGJSutFV1GfxdrpsPYSnfuweIfwzu8=
Received: by 10.223.6.201 with SMTP id a9mr399696faa.110.1311195699925;
	Wed, 20 Jul 2011 14:01:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm930020far.37.2011.07.20.14.01.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:01:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:01:30 +0200
Message-Id: <5b1d75d8c68175e831c7b3ba7d2d9d056be9bffb.1311195655.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311195655.git.Martin.Jansa@gmail.com>
References: <cover.1311195655.git.Martin.Jansa@gmail.com>
Subject: [meta-gnome][PATCH 1/2] libgnome-keyring: inherit perlnative
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
X-List-Received-Date: Wed, 20 Jul 2011 21:05:44 -0000

* otherwise perl from host is used and if there isn't libxml-parser-perl
  installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgnome/libgnome-keyring_2.32.0.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome-keyring_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnome-keyring_2.32.0.bb
index 139de0a..b568b0a 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome-keyring_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome-keyring_2.32.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-inherit gnome lib_package
+inherit gnome lib_package perlnative
 
 SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
 SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
-- 
1.7.6



