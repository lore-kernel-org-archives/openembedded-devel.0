Received: from [195.135.220.2] (helo=mx1.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mhrusecky@suse.cz>) id 1M8ZXH-0007qT-4U
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 14:44:11 +0200
Received: from relay1.suse.de (mail2.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.suse.de (Postfix) with ESMTP id D8619749C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 14:36:09 +0200 (CEST)
Date: Mon, 25 May 2009 14:36:05 +0200
From: Michal Hrusecky <mhrusecky@suse.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090525123605.GA26583@misibook.miska.isageek.net>
MIME-Version: 1.0
X-Operating-System: WindowsKiller Linux
User-Agent: Mutt - the best e-mail client in the world
Subject: [PATCH] linux-hackndev: fixed SRC_URI
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
X-List-Received-Date: Mon, 25 May 2009 12:44:11 -0000
X-Groupsio-MsgNum: 10725
Content-Type: multipart/mixed; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

structure on our server was changed, sou we've got different URI now.

-- 
Michal Hrusecky

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="linux-hnd.patch"

From ac5f1e8010ce665c54a4fd729c99eea69898e197 Mon Sep 17 00:00:00 2001
From: Michal Hrusecky <Michal@hrusecky.net>
Date: Sun, 24 May 2009 20:17:08 +0200
Subject: [PATCH] linux-hackndev-2.6: fixing SRC_URI

---
 recipes/linux/linux-hackndev-2.6_git.bb |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes/linux/linux-hackndev-2.6_git.bb b/recipes/linux/linux-hackndev-2.6_git.bb
index 71e1235..2f9f902 100644
--- a/recipes/linux/linux-hackndev-2.6_git.bb
+++ b/recipes/linux/linux-hackndev-2.6_git.bb
@@ -6,9 +6,8 @@ PR = "r14"
 
 COMPATIBLE_MACHINE = "(palmld|palmtc|palmtt3|palmtt5|palmtx|palmz31|palmz72|palmt650)"
 
-SRC_URI = "git://git.hackndev.com/linux-hnd;protocol=git;tag=master \
-	   file://defconfig"
-
+SRC_URI = "git://git.hackndev.com/hackndev/linux-hnd.git;protocol=git;tag=master \
+           file://defconfig "
 S = "${WORKDIR}/git"
 
 K_MAJOR = "2"
-- 
1.6.3.1


--CE+1k2dSO48ffgeK--
