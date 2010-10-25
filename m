Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAMgh-0005At-CX
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 15:02:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id CEFA8314A211
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:01:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id zN5wgUzr2LbV
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:01:19 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 91E6F314A210
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 15:01:18 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Mon, 25 Oct 2010 13:01:18 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 13:01:18 +0000
Message-Id: <1288011678-23938-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] cairo: depend on glib-2.0 to fix compile error
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
X-List-Received-Date: Mon, 25 Oct 2010 13:02:08 -0000

| In file included from cairo-gobject-enums.c:8:0:
| cairo-gobject.h:44:25: fatal error: glib-object.h: No such file or directory

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/cairo/cairo.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/cairo/cairo.inc b/recipes/cairo/cairo.inc
index d705db6..c60d7d9 100644
--- a/recipes/cairo/cairo.inc
+++ b/recipes/cairo/cairo.inc
@@ -1,6 +1,6 @@
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender"
+DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
 DESCRIPTION = "Cairo graphics library"
 LICENSE = "MPL LGPL"
 
-- 
1.7.1



