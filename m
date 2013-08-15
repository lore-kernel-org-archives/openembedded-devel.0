Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4BAA26B5F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:18:59 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so178544eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=9CDLlW3MxJUan/ViOBGANuefA5IgTEz2Xo0zhhcDGyg=;
	b=A93ev82KeYwkA05kJrPzC8mjnBId54hy8ymjE5Gs3t5oOcNMoSq8TKycPEW0/ZHK6S
	ssKKIV/YtCrLLQxS6alLH9R2JZ2nIizJSp0Kw4226Nte++otymnQPySdvGqsGVxxYJ+u
	+0BJODQhtzWo3LLPfDG0GigOV15ihKXEsy1VZOkSZBHXHC0BwbcGitJHkCSkDPJWEdQT
	kazsVbQEl4NR94yY6lj8NekJbbyEz3DKkV9Fh1BPibh5pgDecpzIzlAbWbHuWZVHkpK9
	hlJYz49CPcyJ5g7dQCun1V5OvS1UOjF5v/7QNXVJWgQj4gemXV4pf4LBzpffXZ99/HDd
	zKGg==
X-Received: by 10.14.212.6 with SMTP id x6mr1290033eeo.67.1376551139740;
	Thu, 15 Aug 2013 00:18:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k3sm81996732een.16.2013.08.15.00.18.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:18:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:45 +0200
Message-Id: <0d3f3e09a02ad95d0b41037b05db4031d247be78.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 05/60] fbida: define -I when checking jpeg version
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
X-List-Received-Date: Thu, 15 Aug 2013 07:18:59 -0000

* echo JPEG_LIB_VERSION | i586-starfish-linux-cpp -include jpeglib.h |
  tail -n 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.09.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
index 02ea57f..aa4c1ca 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = "STRIP="
 
 do_compile() {
-    sed -i -e 's: cpp: ${TARGET_PREFIX}cpp:g' GNUmakefile
+    sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I{STAGING_INCDIR}:g' GNUmakefile
     oe_runmake
 }
 
-- 
1.8.3.2


