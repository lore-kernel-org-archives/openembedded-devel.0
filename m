Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQJgF-0006IO-JU
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 14:03:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 707ED314B862
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id i2TPRnUlW5XL
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:02 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 0A8DE314B02B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:01 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 13:02:00 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 13:01:53 +0000
Message-Id: <1291813320-24770-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/8] efl1: depend on virtual/libsdl instead of libsdl-x11
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
X-List-Received-Date: Wed, 08 Dec 2010 13:03:35 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/efl1/ecore.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/efl1/ecore.inc b/recipes/efl1/ecore.inc
index bb7eea5..76df91a 100644
--- a/recipes/efl1/ecore.inc
+++ b/recipes/efl1/ecore.inc
@@ -4,7 +4,7 @@ DEPENDS = "gettext-native virtual/libiconv tslib curl eet evas glib-2.0 \
            libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor libxprintutil"
 DEPENDS_virtclass-native = "eet-native evas-native"	   
 # optional
-# DEPENDS += "directfb libsdl-x11 openssl virtual/libiconv"
+# DEPENDS += "directfb virtual/libsdl openssl virtual/libiconv"
 PV = "0.9.9.060+svnr${SRCPV}"
 PR = "r5"
 
-- 
1.7.2.3



