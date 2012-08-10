Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpkK-0003Pl-Op
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:59:24 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so928736wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=14HLQzXO4ZbJ969nSCviD04oniE83jhtJ2BYg0uEObc=;
	b=PGxmr6VagnZisjr1fG9JrlzyBRX2RiNsN9fWD4eA7WN212nkA3UWElPOmkHlXdiKiD
	zuytMQy3TeJ1dFXwyMhFNagGOSm1Eq8lRF8QeBIaIjJTybk8336ACNDJi6N0Hi4cWiTq
	0q8TLCrkz4/gnWfTrihKNZNWHlpYfoMsJe8RVutqw4aMe2q6UPmixyhsgWHOwXrhkMgw
	lvxvasxpG/Ljq5V7iqp7S2QvbiVe0j570B1MNsLWqZfrPI74S11cy5MmxFe9Qgj6r3De
	YIONWyi9OLiI1c620upHEFd/p+B5OjJDu4FrcEYcuGYsJWex6qSB5oB9eot9S2A0+50j
	EFiw==
Received: by 10.180.107.103 with SMTP id hb7mr6297056wib.3.1344606457195;
	Fri, 10 Aug 2012 06:47:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm11640321wiy.4.2012.08.10.06.47.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:47:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:23 +0200
Message-Id: <97085b1d8c72bf9c66053042d57869d820e2c4de.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 28/46] e-wm: add elementary dependency
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
X-List-Received-Date: Fri, 10 Aug 2012 13:59:24 -0000

* fixes: e_main.c:22:24: fatal error: Elementary.h: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index b97cb50..6d4656b 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "The Enlightenment Window Manager Version 17"
-DEPENDS = "eet evas eina ecore edje efreet edbus eeze eio"
+DEPENDS = "eet evas eina ecore edje efreet edbus eeze eio elementary"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
-- 
1.7.8.6



