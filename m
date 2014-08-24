Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9813270738
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 21:04:17 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id a41so10334515yho.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 14:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=CHy41m1tm+RxZRjwy9iQ/baZXMj6+691Xp5xTNVGEBY=;
	b=jV1594kplBUbyalTL18F9cNNZdTDg3QXQWPsmkVrfyoa77NQdS7Ae+tythXo3Zf/VQ
	SBntT2ItPI9LMlWymlImNgyuKsMMfyjjPIokoU1hTIYe/h1ZnVGFJJyQNF1wiBLNWMdo
	jOuee1pS6zTowJjCDSrNMET5Rbr+yNr5oSRzoCYb7SJVu4SWaNlhErvc8YuSO1O7oMi4
	hL1II3PpDci1pvoqn93sUflAzz5mHiuCN3q1Yrv1wMiRIHH5TRbaOGgRYmbijobFopwL
	UD2TPh26RAvTpMdiaSeYZiT+xcvGcIyfjse8v159yRK9LD49yWRF6SYWvf/uYzLd8Fo2
	aYhA==
X-Received: by 10.236.145.97 with SMTP id o61mr28725212yhj.45.1408914259279;
	Sun, 24 Aug 2014 14:04:19 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id s9sm3015583yhp.39.2014.08.24.14.04.17
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 24 Aug 2014 14:04:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Aug 2014 18:03:59 -0300
Message-Id: <1408914239-11562-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][for-daisy][PATCH] php: Fix native build due mistakenly linking against host's iconv
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
X-List-Received-Date: Sun, 24 Aug 2014 21:04:18 -0000

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
index b1bf79c..1e2aa72 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -37,6 +37,7 @@ EXTRA_OECONF = "--enable-mbstring \
 EXTRA_OECONF_virtclass-native = " \
                 --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
                 --with-libxml-dir=${STAGING_BINDIR_NATIVE} \
+                --without-iconv \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-- 
1.7.10.4


