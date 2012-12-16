Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIoz-0007ri-30
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:20:17 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1966530eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fWg2VHgfO4EO3X5/1Q6KWMr4av1nXVGt8fKgbBrsGTQ=;
	b=Mz6skGX2+8fFqZlFOJRu3hmLMEDbtmRvfaPl4jkMdjI9Ic9s0Az/oYm8seM051W5Rv
	i4HpHce//EOtaaBOBQOSv1vw6bf09CwgVCoWptP5bm8IslJEp9qWO1IjQsp5852O1bUG
	zg59i4UL7uzSRyjZepBVKm89n1LAsbL5BNyp8MvnMoyD5vkID8fMGRoSVNEh7iI6Jh7M
	E+Jx8xoUIhPMZG/0qqm3XmdCQu5TbhbYH9r3O3LXIHq5aQYSoNowqoJwnFZN4lfWUFJh
	86gcr5xpto8L3zV3IwTtXjt0ZOe0v/uVmWzXMc+wzA/IyBFu3nyHhT2z7+2H37758ouJ
	sB5g==
Received: by 10.14.208.137 with SMTP id q9mr33703457eeo.28.1355680716707;
	Sun, 16 Dec 2012 09:58:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r1sm23881409eeo.2.2012.12.16.09.58.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:58:02 +0100
Message-Id: <b38a8c64fa0428e02032970d8dafc294b70a3f35.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 19/26] postgresql: disable spinlocks for AArch64
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
X-List-Received-Date: Sun, 16 Dec 2012 18:20:17 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index eeda729..4e7aec2 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -19,6 +19,7 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-rpath"
 EXTRA_OECONF_sh4 = "--disable-spinlocks --disable-rpath"
+EXTRA_OECONF_aarch64 += "--disable-spinlocks"
 
 do_compile_append() {
          cp /usr/sbin/zic ${S}/src/timezone/
-- 
1.8.0.2



