Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PdUab-0008Pi-7R
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 22:20:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 289F3314CDE7;
	Thu, 13 Jan 2011 22:19:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 6HTaiQQWg-Dy; Thu, 13 Jan 2011 22:19:37 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id E3A96314CE0E;
	Thu, 13 Jan 2011 22:19:35 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 13 Jan 2011 21:19:35 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 21:19:35 +0000
Message-Id: <1294953575-30765-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] libcap2: add libpam to DEPENDS
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
X-List-Received-Date: Thu, 13 Jan 2011 21:20:13 -0000

* Fixes the following compile error:

pam_cap.c:19:34: error: security/pam_modules.h: No such file or
directory
pam_cap.c:20:34: error: security/_pam_macros.h: No such file or
directory

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/libcap/libcap2_2.16.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libcap/libcap2_2.16.bb b/recipes/libcap/libcap2_2.16.bb
index 97b03d5..be0788e 100644
--- a/recipes/libcap/libcap2_2.16.bb
+++ b/recipes/libcap/libcap2_2.16.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Libcap is a library for getting and setting POSIX.1e (formerly PO
 PRIORITY = "optional"
 SECTION = "libs"
 LICENSE = "GPL"
-DEPENDS = "bison-native flex-native attr"
-PR = "r2"
+DEPENDS = "bison-native flex-native attr libpam"
+PR = "r3"
 
 BUILD_CFLAGS += "-I${S}/libcap/include"
 CFLAGS += "-I${S}/libcap/include"
-- 
1.7.2.3



