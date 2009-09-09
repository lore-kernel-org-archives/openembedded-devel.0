Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1MlRXw-0007kp-2o
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 20:05:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 4A6BB502306F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2009 15:05:09 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D66pdb14FLGl
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2009 15:05:05 -0300 (BRT)
Received: from [192.168.15.91] (bd21096b.virtua.com.br [189.33.9.107])
	by mail.2mi.com.br (Postfix) with ESMTPA id 8FC36502306E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2009 15:05:05 -0300 (BRT)
Message-ID: <4AA7EE3B.1060107@2mi.com.br>
Date: Wed, 09 Sep 2009 15:04:43 -0300
From: "Jader H. Silva" <jader@2mi.com.br>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: jader@2mi.com.br
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: DirectFB URL has changed on stable
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
X-List-Received-Date: Wed, 09 Sep 2009 18:05:35 -0000
Content-Type: multipart/mixed; boundary="------------000901010404000002020805"

--------------000901010404000002020805
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

DirectFB recipe in stable branch points to the following URL: 
http://directfb.org/downloads/Core/DirectFB-1.2.7.tar.gz
But DirectFB URL has changed to: 
http://directfb.org/downloads/Core/DirectFB-1.2/DirectFB-1.2.7.tar.gz

There's a patch attached that fix this issue.

Att.
Jader H. Silva
2MI Tecnologia

--------------000901010404000002020805
Content-Type: text/x-patch;
 name="0001-Fix-directfb-url.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-Fix-directfb-url.patch"

From 29974323c7a8d7fb9d151b024d5ba8014c0d1dad Mon Sep 17 00:00:00 2001
From: Jader Henrique da Silva <jader@2mi.com.br>
Date: Wed, 9 Sep 2009 14:59:28 -0300
Subject: [PATCH] Fix directfb url

---
 conf/checksums.ini                 |    2 +-
 recipes/directfb/directfb_1.2.7.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 74bb1cb..99fdc88 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -214,7 +214,7 @@ sha256=f12ec5f0864d85268a8d67e4919cb7f3d7f0e06ed6cc278c952f6c342673d931
 md5=caea8bcfc9c1d391e56d85e437005a5d
 sha256=0875e553a17fe65e920ad810a67aa6faca582c53476d8dc75880a6b3da625d0b
 
-[http://directfb.org/downloads/Core/DirectFB-1.2.7.tar.gz]
+[http://directfb.org/downloads/Core/DirectFB-1.2/DirectFB-1.2.7.tar.gz]
 md5=59ca16f600e96c8c104a485ff7c322c6
 sha256=80ab8e34246a280bc380020cf331bcc0014cf816380cee3935ad455c108e661e
 
diff --git a/recipes/directfb/directfb_1.2.7.bb b/recipes/directfb/directfb_1.2.7.bb
index be6a6da..8e5d5cf 100644
--- a/recipes/directfb/directfb_1.2.7.bb
+++ b/recipes/directfb/directfb_1.2.7.bb
@@ -6,7 +6,7 @@ PR = "r0"
 DEPENDS += "sysfsutils"
 
 SRC_URI = " \
-    http://directfb.org/downloads/Core/DirectFB-${PV}.tar.gz \
+    http://directfb.org/downloads/Core/DirectFB-1.2/DirectFB-${PV}.tar.gz \
     file://directfb-1.2.x-fix-pkgconfig-cflags.patch;patch=1 \
     file://mkdfiff.patch;patch=1 \
     file://dont-use-linux-config.patch;patch=1 \
-- 
1.6.0.4


--------------000901010404000002020805--
