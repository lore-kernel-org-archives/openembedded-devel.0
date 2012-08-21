Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3tSC-00046M-8w
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Aug 2012 20:45:28 +0200
Received: by pbcwy7 with SMTP id wy7so293070pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=29B08hA/2qtvVmnIU3zB6AoQ3ChhiTfePsCMpDzL3kA=;
	b=FgjVZ6deU0nL3vPsvCE70F0P0/AunxREyXjqYjpVVqmDuprpYsoMpo9YBEGmTIk4gT
	yByS7noN4CJl3UV0bNynHJLBR6CfbvJx4cy0JDww6AMhKSAId0sQTlsXhzRwNPxiFVI1
	gs2QkVmHLe5AvOxUHp0/31q1rXQEAvSLPAusQcKjyYay3wVkBCR8pc6phjv8bdaQJ+PL
	FyJYfOIMOSClsVbPx/CV3KEKhzuBqUTBq+SVYkuad8QlrjsZpFFYmn6Uq8ZbKxbL+2ry
	A3R3j4q4GhQpjy+uRIoPucOcW+kjUInt48qwv4xoslG0D332etSbIBVyJyevHTjwU6vL
	Wjag==
Received: by 10.68.229.228 with SMTP id st4mr38735109pbc.106.1345574003502;
	Tue, 21 Aug 2012 11:33:23 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id kt8sm1952661pbc.1.2012.08.21.11.33.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 11:33:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2012 11:32:49 -0700
Message-Id: <1345573969-6069-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [toolchain-layer][PATCH] gcc: Delete gcc intermediate recipes
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
X-List-Received-Date: Tue, 21 Aug 2012 18:45:28 -0000

Not needed after toolchain rework

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-cross-intermediate_4.6.bb              |    3 ---
 .../gcc/gcc-crosssdk-intermediate_4.6.bb           |    3 ---
 2 files changed, 6 deletions(-)
 delete mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bb
 delete mode 100644 toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bb

diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bb
deleted file mode 100644
index 8892288..0000000
--- a/toolchain-layer/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-devtools/gcc/gcc-cross_${PV}.bb
-require recipes-devtools/gcc/gcc-cross-intermediate.inc
-
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bb b/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bb
deleted file mode 100644
index 61a0dfb..0000000
--- a/toolchain-layer/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-devtools/gcc/gcc-cross-intermediate_${PV}.bb
-require recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
-EXTRA_OECONF += " --with-headers=${STAGING_DIR_TCBOOTSTRAP}${SYSTEMHEADERS} "
-- 
1.7.9.5



