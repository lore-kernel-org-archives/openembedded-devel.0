Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id CA83670E5A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 19:39:54 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id a41so10405584yho.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 12:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=+hFglS+9gl1LRalCZpYEFDAeqsmZuVxDUx1PoKu4fso=;
	b=Uw1JsqUkMRF1kGh9OrgMAuUufgM0tWjqEtVwsDxwOADp0950q2ZZ2Mu15b5GLpB/lu
	dgApZZ+Wbv4XJPknpisfWJvveJD3pXdQ+C2LAk84IvO75+NyHvls3TcsbJnH2NPCi9Sm
	GFBBpr/B2QOA9zq3edZiA2ylcx5pBwGBj9ETmOwVV81eI/Gb/5jsReSPNpaUWIqRqARO
	kG091ay0wQmp4EVC9K8ycSt9FOQkvFzGgjp5uPvHyEF0YJw+J72myPy3ygvJxU6wnC8C
	2ggQmv14TQcV2g0BnzXbxMBmunq8Lo6l2UUMTkb9N6u2EXo2uEQVspmt0iuc3r9REKNv
	Id6g==
X-Received: by 10.236.100.147 with SMTP id z19mr27749382yhf.70.1408909195939; 
	Sun, 24 Aug 2014 12:39:55 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id d66sm2937767yhd.41.2014.08.24.12.39.53
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 24 Aug 2014 12:39:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Aug 2014 16:39:47 -0300
Message-Id: <1408909187-29642-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] php: Fix native build due mistakenly linking against host's iconv
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Aug 2014 19:39:56 -0000

The configure script has mistakenly choose to enable iconv support,
due host to provide it, adding '/usr/lib' to the linking flags and
failing as:

,----[ Linking error while testing 'fork' support ]
| conftest.c:268: warning: conflicting types for built-in function 'fork'
| .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
|     undefined reference to `gzopen64@ZLIB_1.2.3.3'
| collect2: ld returned 1 exit status
`----

This patch disables iconv support for native builds fixing the error.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-devtools/php/php.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 030c090..6bdae78 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -35,6 +35,7 @@ EXTRA_OECONF = "--enable-mbstring \
 "
 EXTRA_OECONF_virtclass-native = " \
                 --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
+                --without-iconv \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-- 
1.7.10.4


