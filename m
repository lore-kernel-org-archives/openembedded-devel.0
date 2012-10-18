Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TOqrx-0002vD-1j
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 16:14:41 +0200
Received: from localhost ([127.0.0.1]:36708 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TOqf3-00076F-BP; Thu, 18 Oct 2012 14:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id; s=default; bh=/Scpc5bkzduF51wAg+igkJD6
	LMw=; b=GvKYGZos0LC5lVS3gESd09VSBaTvfERB7H8+W6DT4eLLj4B9mxK+KB+e
	Z6lt9qsSQoPl75QeYbeKzTnotK21AhRPz9pgNmh35y+3MedSmFkLKKoBQu64lfZU
	pnjYbghNeHpe8mxwJwFT48MvdqvHQvmZh35vMEY81OmNC/4zues=
Received: from [195.171.99.130] (port=24106 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TOqf3-000764-81; Thu, 18 Oct 2012 14:01:21 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2012 15:03:02 +0100
Message-Id: <1350568982-23033-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12.3
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-webserver][PATCH v4] Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
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
X-List-Received-Date: Thu, 18 Oct 2012 14:14:41 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Hiawatha: add initial 8.5 recipe and associated files
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
index a029047..b4462bb 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb
@@ -37,9 +37,9 @@ EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
 
 do_install_append() {
 
-	# Copy over init script and sed in the correct sbin path
-  sed -i 's,sed_sbin_path,${sbindir},' ${WORKDIR}/hiawatha-init
-  mkdir -p ${D}${sysconfdir}/init.d
-  install -m 0755 ${WORKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hiawatha
+    # Copy over init script and sed in the correct sbin path
+    sed -i 's,sed_sbin_path,${sbindir},' ${WORKDIR}/hiawatha-init
+    mkdir -p ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hiawatha
 
 }
-- 
1.7.12.3



