Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9TQ-00053y-53
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:46:36 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so871094fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YLWOO5Um2hFTi8baxpBsd3gKMcvp8+AK2YaxbPVU83M=;
	b=WUHhEnQSJj0tievzY+kwaVHL/cw/h7RM4s1u6BAZzX9ONRIaWULAw6pwk1XuK3S7EA
	gVNqIQqg3pbBVP3zTeNWqaa72TmD7BeylaoyScOXYaLpg6CdHmRgGSS+xdCX5Zs9kmJy
	fGLv925wmp9obZKsSoyKZ0KuvPANreo/fn3ms=
Received: by 10.223.39.193 with SMTP id h1mr479667fae.135.1314891702903;
	Thu, 01 Sep 2011 08:41:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p3sm130348faa.9.2011.09.01.08.41.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:41:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:39:16 +0200
Message-Id: <af2d01f1621c1372d43cd0a1296c80e375202fee.1314891222.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
References: <d5fa6ed7bc46990f2652da9019d9531de1cd443d.1314891222.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1314891222.git.Martin.Jansa@gmail.com>
References: <cover.1314891222.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld][PATCH 09/10] spitz, akita: add iwmmxt to PACKAGE_EXTRA_ARCHS_tune-xscale not PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Thu, 01 Sep 2011 15:46:36 -0000

* otherwise fails with:
  ERROR:  Poky's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (armv5te).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/machine/akita.conf |    2 +-
 conf/machine/spitz.conf |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/akita.conf b/conf/machine/akita.conf
index ae089a1..0b31954 100644
--- a/conf/machine/akita.conf
+++ b/conf/machine/akita.conf
@@ -5,7 +5,7 @@
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-PACKAGE_EXTRA_ARCHS += "iwmmxt" 
+PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt" 
 MACHINE_FEATURES += "iwmmxt"
 
 # NAND factory-default
diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
index 4019bca..f585197 100644
--- a/conf/machine/spitz.conf
+++ b/conf/machine/spitz.conf
@@ -6,7 +6,7 @@ require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
 MACHINE_FEATURES += "iwmmxt"
-PACKAGE_EXTRA_ARCHS += "iwmmxt"
+PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 
 # NAND factory-default
 # SL-C3000 (spitz) mtdparts=sharpsl-nand:7168k@0k(smf),5120k@7168k(root),-(home)
-- 
1.7.6.1



