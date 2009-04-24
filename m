Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LxFoM-0006AE-J7
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Apr 2009 09:27:02 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 249921880DC; Fri, 24 Apr 2009 09:26:21 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2009 09:26:21 +0200
Message-Id: <1240557981-13344-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] unzip: GNU_HASH QA fix.
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
X-List-Received-Date: Fri, 24 Apr 2009 07:27:02 -0000

From: Stanislav Brabec <utx@penguin.cz>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/unzip/unzip_552.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/unzip/unzip_552.bb b/recipes/unzip/unzip_552.bb
index 2f06e1b..d880919 100644
--- a/recipes/unzip/unzip_552.bb
+++ b/recipes/unzip/unzip_552.bb
@@ -6,7 +6,7 @@ PR = "r1"
 SRC_URI = "http://ftp.info-zip.org/pub/infozip/src/unzip${PV}.tar.gz"
 S = "${WORKDIR}/unzip-5.52"
 
-export LD = "${CC}"
+export LD = "${CC} ${LDFLAGS}"
 
 do_compile() {
         oe_runmake -f unix/Makefile generic
-- 
1.5.6.5



