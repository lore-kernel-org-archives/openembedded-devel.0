Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9AB75E42
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 17:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68H1TUR003511 for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jul 2015 18:01:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LjjcVjCdyBTN
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 18:01:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t68H1G8D003493
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jul 2015 18:01:27 +0100
Message-ID: <1436374857.9778.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 08 Jul 2015 18:00:57 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH][meta-oe] postgresql: Add explict getVar expansion parameter
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
X-List-Received-Date: Wed, 08 Jul 2015 17:01:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Bitbake is likely to require this parameter in future, add
the default value.

Patch generated with the command: 

sed -e 's:\(getVar([^,()]*\)\s*):\1, False):g' -i `grep -ril getVar *`

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index c7aed9e..15fb7c7 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -84,14 +84,14 @@ python populate_packages_prepend() {
         if name is None or name.strip() == "":
             return
 
-        fpack=d.getVar('PACKAGES') or ""
+        fpack=d.getVar('PACKAGES', False) or ""
         fpack="${PN}-" + name + " " + fpack
         if dbg:
             fpack="${PN}-" + name + "-dbg" + " " + fpack
         d.setVar('PACKAGES', fpack)
 
     conf=(d.getVar('PACKAGECONFIG', True) or "").split()
-    pack=d.getVar('PACKAGES') or ""
+    pack=d.getVar('PACKAGES', False) or ""
     bb.debug(1, "PACKAGECONFIG=%s" % conf)
     bb.debug(1, "PACKAGES1=%s" % pack )
 



