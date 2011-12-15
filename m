Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1Rb6eI-0003b9-Ns
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 09:26:42 +0100
Received: from [62.99.145.5] (port=51400 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1Rb6Xb-0002r2-Hq
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 09:19:47 +0100
Received: from [83.64.51.210] (port=14645 helo=gateway1.hale)
	by smartmx-05.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1Rb6XV-0002hu-Rn for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 09:19:41 +0100
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id pBF8JapT030758
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 09:19:36 +0100
Received: from localhost.localdomain ([192.168.100.138]) by hale.at with
	MailEnable ESMTP; Thu, 15 Dec 2011 09:19:25 +0100
From: Bernhard Guillon <Bernhard.Guillon@hale.at>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 09:19:11 +0100
Message-Id: <1323937151-17817-1-git-send-email-Bernhard.Guillon@hale.at>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: pBF8JapT030758
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1324541977.4297@+8xXdG1dTP9Gj81Wug6YIQ
X-Spam-Status: No
Subject: [meta-oe] libgtkstylus_0.5.bb: fix LIC_FILES_CHECKSUM and LICENSE
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
X-List-Received-Date: Thu, 15 Dec 2011 08:26:42 -0000

Provide a valid LIC_FILES_CHECKSUM
Use SPDX style versioned license for LICENSE field

Signed-off-by: Bernhard Guillon <Bernhard.Guillon@hale.at>
---
 .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
index f614048..8567b13 100644
--- a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
+++ b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
@@ -1,8 +1,9 @@
 DESCRIPTION = "GTK plugin for stylus based systems"
 SECTION = "libs"
 DEPENDS = "gtk+"
-LICENSE = "LGPL"
-PR = "r2"
+LICENSE = "LGPL-2.0+"
+LIC_FILES_CHKSUM = "file://tap.c;beginline=1;endline=20;md5=71756eeb144e9eeb177c69aa672b1635"
+PR = "r3"
 
 inherit autotools
 
-- 
1.7.0.4



--
Scanned by MailScanner.



