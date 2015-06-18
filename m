Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB0875A02
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 22:49:01 +0000 (UTC)
Received: by igbiq7 with SMTP id iq7so2332364igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 15:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O0J8lI/040GCGzYxIcP9Oz2mYAqQ1oDKi+heiZfff14=;
	b=dv+2Z9vVIb1I9nCfoftCk/X3gDy0jcPOF6+lU29llFVg5bMgeB+RMal7z61P2AL8Zn
	kzVZ1kMTpRJfFWKmPvvPMaZIpLy3GsDhTGG+w2ndazxolmVTGwA4DjmQijLg7hnvo1gM
	p4S4VR+5FouJdS6ORrN1olGmYkj7a9JqpI81PkHj1nKHdv1LXEl/tZcrPxNMRSWpCgWK
	9xrXJoLULj2rzNu2I3wgkdu6LjC/4CDk/LynAslalxH/siGBrc94G/xdyyMIeA5Yqrns
	Of0h8nu0JvEPzhJamXvgHmZpO1c0d8XPepYGXV62aw5cUSfkn7DeG563qL5AgBq0vCmp
	Jfzg==
X-Received: by 10.107.136.42 with SMTP id k42mr1548617iod.63.1434667742494;
	Thu, 18 Jun 2015 15:49:02 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id x3sm465991igl.2.2015.06.18.15.49.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Jun 2015 15:49:01 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2015 15:48:46 -0700
Message-Id: <1434667726-15581-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] minini: fix build when SECURITY_CFLAGS includes -pie -fpie
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
X-List-Received-Date: Thu, 18 Jun 2015 22:49:04 -0000

Separating compile and link steps avoids build errors when
security_flags.inc is used:

  | DEBUG: Executing shell function do_compile
  | ../sysdeps/i386/start.S:98: error: undefined reference to 'main'
  | collect2: error: ld returned 1 exit status

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/minini/minini_1.2.b.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/minini/minini_1.2.b.bb b/meta-oe/recipes-support/minini/minini_1.2.b.bb
index e739498..6607dd8 100644
--- a/meta-oe/recipes-support/minini/minini_1.2.b.bb
+++ b/meta-oe/recipes-support/minini/minini_1.2.b.bb
@@ -22,7 +22,8 @@ SRC_URI[sha256sum] = "b08839af74acb36061fb76e1123bf56711bc5cf7a08b32e189b0ad78a2
 do_configure[noexec] = "1"
 
 do_compile() {
-    ${CC} minIni.c -shared -fPIC -o libminini.so.0.0 -Wl,-soname,libminini.so.0 ${CFLAGS} ${LDFLAGS}
+    ${CC} ${CFLAGS} -fPIC -c minIni.c -o minIni.o
+    ${CC} ${LDFLAGS} -shared -Wl,-soname,libminini.so.0 minIni.o -o libminini.so.0.0
 }
 
 do_install () {
-- 
1.9.1


