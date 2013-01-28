Received: from mail-wg0-f53.google.com ([74.125.82.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TznwG-00051S-Gg
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 13:35:53 +0100
Received: by mail-wg0-f53.google.com with SMTP id fn15so1633658wgb.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 04:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=PlG0d+nu3Lw2dLMIf7Mx4bEjlF4QpS6AmBy6pXRIIcM=;
	b=eWExHiRsUDx/MFOAEXcZwa+mRs+n8SKBsLxV64O/fSaBunYT5ung8pJnqgm9afzIO/
	HPf9aXvw9VB4HlxvnN4ttARC5VuTIJ4J+HUxlGwDh091X3h+T6ohjDkq+akHrOYTqs2K
	HOvFMmkDMeIFomKpniVHqmPddckuAWof7Zp4xvp6zcgJppCPTgRETnpsDtYU5qIx6KPE
	JI5ooXPH2sVp1666D9qg9/VZ3KT9UqlbUTZOxXTKdOz1LQXMr5gBzQbfGQhnvaUWESQm
	jtwXOIJHZVPZqbyr/nqHxicvD2W0Nrj5O7Vx+cXCffffeIkRuw9tefLLAanqMVs1VntO
	Nnog==
X-Received: by 10.194.21.70 with SMTP id t6mr20834623wje.42.1359375614293;
	Mon, 28 Jan 2013 04:20:14 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s16sm12500498wii.0.2013.01.28.04.20.13
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 04:20:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2013 13:20:12 +0100
Message-Id: <1359375612-22606-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH][for-danny] mm-common: inherit gnomebase instead of gnome
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
X-List-Received-Date: Mon, 28 Jan 2013 12:35:54 -0000

* gnomebase is enough and gnome pulls a lot of extra dependencies

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
index 79da497..c49b4c8 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.5.bb
@@ -1,4 +1,4 @@
-inherit gnome
+inherit gnomebase
 
 SRC_URI[archive.md5sum] = "4a4dad67fc8d7e0c529f3a8c6ba4d8b2"
 SRC_URI[archive.sha256sum] = "9c602dba89d264a4719db996b9b169716df2d4d10bcd24e56fc3572865a5cb8b"
-- 
1.8.1.1



