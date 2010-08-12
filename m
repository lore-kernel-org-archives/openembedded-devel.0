Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OjbSY-00060z-CQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 19:20:55 +0200
Received: by eyx24 with SMTP id 24so840710eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 10:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=AI8IYsiY6SeMEn+494ysheNsMzDsditj/7WbTlFzUl4=;
	b=bQ0Z6eKvKFK3W4c+pzWNTIz/vToQjQ+mkY6+xwimfgcEC/CbobuluNcHbg6gIXNvsb
	z7kQUlS2pL00mRHXiTjUa0TW6Zgb7eaxKRynqnpOVZ9uzOad8kvBNslAXUpIuiv2oY32
	9YHs0g4ra8Ez7jpa/kf/6l2QDIMa6qicIVFO4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ESUXRlSHE5eicc1nLuRK65Dn3GCstvyi3dBjHrwGeR6A9HdW0ZEqhSJlroTxjrn/nz
	J4jTLnNzTjxufo6E1pFQX+XNBWXFksYxWe9woh0AupVx2a4vVnrwws89U/n8su8Suj2A
	8X+xUXJJvdmR4mHz7SfcTVUz0Ns8spiTlMgrI=
Received: by 10.213.33.135 with SMTP id h7mr551299ebd.34.1281633630145;
	Thu, 12 Aug 2010 10:20:30 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm2511887eei.7.2010.08.12.10.20.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 12 Aug 2010 10:20:29 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Aug 2010 19:20:23 +0200
Message-Id: <1281633623-10945-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] src_distribute_local.bbclass: add an error message and exit if a file is not found
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
X-List-Received-Date: Thu, 12 Aug 2010 17:20:55 -0000

When a file was not found do_distribute_local would still continue.
This patch adds an error message and terminates do_distribute_local

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/src_distribute_local.bbclass |   28 +++++++++++++++++++++++-----
 1 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/classes/src_distribute_local.bbclass b/classes/src_distribute_local.bbclass
index 7b1e7d7..bdf03e9 100644
--- a/classes/src_distribute_local.bbclass
+++ b/classes/src_distribute_local.bbclass
@@ -7,21 +7,39 @@ SRC_DISTRIBUTECOMMAND[dirs] = "${SRC_DISTRIBUTEDIR}/${LIC}/${PN}"
 # symlinks the files to the SRC_DISTRIBUTEDIR
 SRC_DISTRIBUTECOMMAND-symlink () {
     test -e "${SRC}.md5" && ln -sf "${SRC}.md5" .
-    ln -sf "${SRC}" .
+    if test -e {SRC}
+    then
+        ln -sf "${SRC}" .
+    else
+    	echo "File does not exist:" ${SRC}
+	exit 1
+    fi
 }
 
 # copies the files to the SRC_DISTRIBUTEDIR
 SRC_DISTRIBUTECOMMAND-copy () {
     test -e "${SRC}.md5" && cp -f "${SRC}.md5" .
-    cp -fr "${SRC}" .
+    if test -e {SRC}
+    then
+        cp -fr "${SRC}" .
+    else
+    	echo "File does not exist:" ${SRC}
+	exit 1
+    fi
 }
 
 # moves the files to the SRC_DISTRIBUTEDIR and symlinks them back
 SRC_DISTRIBUTECOMMAND-move+symlink () {
     if ! [ -L ${SRC} ]; then
-        src=`basename "${SRC}"`
-        mv ${SRC} .
-        ln -sf $src "${SRC}"
+        if test -e {SRC}
+        then
+            src=`basename "${SRC}"`
+            mv ${SRC} .
+            ln -sf $src "${SRC}"
+        else
+    	    echo "File does not exist:" ${SRC}
+	    exit 1
+        fi
         if [ -e ${SRC}.md5 ]; then
             mv ${SRC}.md5 .
             ln -sf $src "${SRC}.md5"
-- 
1.6.4.2



