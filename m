Received: from mail-ye0-f169.google.com ([209.85.213.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TlMnT-0005eG-8P
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 17:47:08 +0100
Received: by mail-ye0-f169.google.com with SMTP id l13so490722yen.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 08:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=jBNPQBOuOXK5aEVWkjwQwIZ+QXzrue4Db7D9i391zD8=;
	b=Ch4oqPcsG9GVna5CKKTvvqaGayBlPyEBeHr7R5EP2FRFwpDLbpBOLE/u4yKRxXpHoG
	mD+jNHub7aeW3HqeV9oJSIw6s8ffN4zQuKF4I+sPjTwDYb4Jy9PR9GjL5OPVUdyRAdid
	pV3+iPRrQ5OF2n3yJfpGrQonwLxckza75lq9/TAPg/Ie0QsG6k5WAJVCQS9wMkibLMyl
	n1pk4K0KVZ9MTLHdpXVWDyWxL4Rg/J8SLR0HJyJIn5a94pJLwmM9mcK39YF81Wj3Rewl
	n1+xzNZ7SZMR2YsYeYkgY9FDJN+3LTOQSroB4HTrLDBDhGE+zk8N4u3gfwRR0dJOr34b
	FH2Q==
X-Received: by 10.236.150.17 with SMTP id y17mr222950yhj.126.1355934743594;
	Wed, 19 Dec 2012 08:32:23 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.170])
	by mx.google.com with ESMTPS id v9sm4593775anm.22.2012.12.19.08.32.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 08:32:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Dec 2012 14:32:10 -0200
Message-Id: <1355934731-32281-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1355934731-32281-1-git-send-email-otavio@ossystems.com.br>
References: <1355934731-32281-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v2 2/3] openmotif: Update SRC_URI and add libxft in depends
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
X-List-Received-Date: Wed, 19 Dec 2012 16:47:10 -0000

The file couldn't be found in the official repository and it seems
unmaintained as it had processing errors when trying to register to be
able to download the last release. Researching in the web a mirror has
been found and than we're using now this mirror so fetch works again.

During build test, from a clean tmp directory we found that libxft is
a hard dependency so we add it to depends list.

Change-Id: If486a40718af688dfad6768d56432afb573cf8d8
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/openmotif/openmotif_2.3.3.bb   |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index 2e9c2de..e7a0220 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -1,11 +1,13 @@
 SECTION = "libs"
 DESCRIPTION = "OSM/Motif implementation."
 LICENSE = "OGPL"
-DEPENDS = "xbitmaps virtual/libx11 libxt libxp"
+DEPENDS = "xbitmaps virtual/libx11 libxt libxp libxft"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
 
-SRC_URI = "http://openmotif.com/files/public_downloads/openmotif/2.3/2.3.3/openmotif-2.3.3.tar.gz \
+PR = "r1"
+
+SRC_URI = "http://fossies.org/unix/misc/openmotif-2.3.3.tar.gz \
            file://configure.patch;patch=1"
 
 SRC_URI[md5sum] = "fd27cd3369d6c7d5ef79eccba524f7be"
-- 
1.7.2.5



