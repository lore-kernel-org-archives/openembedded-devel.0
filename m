Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrrXP-0006kb-Nq
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 16:17:07 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2024631bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fU4wVmYpk3Kaq6vcVwu2sKinhXXALuBnEuhQQJTGlTo=;
	b=oM8WtJV2fTHDBNoKF7TuBhZ/mRy6NkoaPSMulOLcTsyVKdFdhpDodnS8QLJKCxp/CK
	qTIZOyH2Yg1PMzoMhDI/aHzl0j2mn5pzkEhywIC1aAomRxwemK/xIFS8HaeoIxdFT0sY
	1xI/uwQrIH7zkX9bWzq6YGAG/uazEFwnv8icYUOKjutKqRszK/SsUH7SAWL5bpiOMIZr
	tzwpdoIozKXIll+TzN7mHIB+FXg+uCsTxuhwc5JU33X6kukvA36d8N45UuUWUImV9PLn
	f/9F/Il1TjfeWJlebf3JPiVIRpsjMTewOvmyMXBsZXhkjDES4S5cScFkjr7Dvl6JvOXn
	qPkQ==
Received: by 10.204.154.214 with SMTP id p22mr1172450bkw.111.1342706747982;
	Thu, 19 Jul 2012 07:05:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n5sm1262224bkv.14.2012.07.19.07.05.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 07:05:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 16:05:36 +0200
Message-Id: <fc9f919b648a0aa48553012db0e2e6dd9875d98c.1342706683.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342706683.git.Martin.Jansa@gmail.com>
References: <cover.1342706683.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342706683.git.Martin.Jansa@gmail.com>
References: <cover.1342706683.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] lzma: use 4 spaces instead of 8 in do_unpack_append
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
X-List-Received-Date: Thu, 19 Jul 2012 14:17:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lzma/lzma.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/lzma/lzma.inc b/meta-oe/recipes-support/lzma/lzma.inc
index 72f5d47..9718600 100644
--- a/meta-oe/recipes-support/lzma/lzma.inc
+++ b/meta-oe/recipes-support/lzma/lzma.inc
@@ -14,10 +14,10 @@ SRC_URI = "http://downloads.sourceforge.net/sevenzip/lzma${@bb.data.getVar('PV',
 EXTRA_OEMAKE = "-f makefile.gcc"
 
 do_unpack_append() {
-        import oe.process
-        # Replace MS-DOS line-endings with Unix style line-endings
-        oe.process.run("find . -type f -print0 | xargs -0 sed 's/\r$//' -i",
-                       cwd=d.getVar("S", True))
+    import oe.process
+    # Replace MS-DOS line-endings with Unix style line-endings
+    oe.process.run("find . -type f -print0 | xargs -0 sed 's/\r$//' -i",
+               cwd=d.getVar("S", True))
 }
 
 do_compile() {
-- 
1.7.8.6



