Return-Path: <voipio@kos.to>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id 05675610DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 13:47:27 +0000 (UTC)
Received: from kos.to (a91-156-63-85.elisa-laajakaista.fi [91.156.63.85])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 53B0D26552
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 15:47:28 +0200 (CEST)
Received: from voipio (uid 1000) (envelope-from voipio@kos.to) id 5e0a1a
	by kos.to (DragonFly Mail Agent); Mon, 30 Sep 2013 16:47:26 +0300
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Sep 2013 16:46:11 +0300
Message-Id: <1380548771-13812-3-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
References: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
Cc: patches@linaro.org
Subject: [meta-java][PATCH 3/3] jamvm/java: allow spaces in arguments
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
X-List-Received-Date: Mon, 30 Sep 2013 13:47:27 -0000

Current IFS mangling blows up on the face:

    | configure:2341: javac  -classpath .: Test.java
    | Invalid maximum heap size: -Xmx1024m-cp/srv/oe/b

Simpler command line expansion works just as easy.
---
 recipes-core/jamvm/files/java | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-core/jamvm/files/java b/recipes-core/jamvm/files/java
index 27cf094..9a396a7 100755
--- a/recipes-core/jamvm/files/java
+++ b/recipes-core/jamvm/files/java
@@ -1,6 +1,5 @@
 #!/bin/sh
 
-IFS=""
-export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:STAGING_LIBDIR_NATIVE/classpath:STAGING_LIBDIR_NATIVE/jamvm"
-export BOOTCLASSPATH="STAGING_DATADIR_NATIVE/jamvm/classes.zip:STAGING_DATADIR_NATIVE/classpath/glibj.zip"
-exec jamvm ${1+"$@"}
+export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/srv/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/classpath:/srv/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/jamvm"
+export BOOTCLASSPATH="/srv/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/jamvm/classes.zip:/srv/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/classpath/glibj.zip"
+exec jamvm "$@"
-- 
1.8.1.2


