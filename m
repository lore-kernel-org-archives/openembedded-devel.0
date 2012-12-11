Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiER9-0007Rs-QR
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 02:15:14 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1930168eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 17:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0dICc3cFV6pWtHZ4x0agGk9MXlXNGfnnGk76WFjyShY=;
	b=diCFaOO0PfBnbvofthPpIwJpp5N4GBXrlIArbwMaqicoxZbii49FBriRGQMmJpMxJC
	y9seofZ4Te6ukWVyQJ6rLhYLDEScr/qtdffzEAFUcOF6JJmdXoDChuHvKb2j48SLKsfI
	ccxnq9ad9Q5RePzhVBZRGISQaH925VHQdD6nXBEAv/LDmsth0WSDdrAHMOwDr9fL5tTw
	ye/uJm9Mx+lNkqxkwpaSqTuQBZ5oPCoC279x5F0F+GYlcG01HvHg5W1okbthNCr12DzT
	HCldEzpTrpiytIPL9LmS51EiIBlwSBIYg2fnyBUT1RiB4Vw3RK3sH7rBkXUVnRM5t1cH
	I4Og==
Received: by 10.14.3.195 with SMTP id 43mr55086348eeh.36.1355187636648;
	Mon, 10 Dec 2012 17:00:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f6sm24851301eeo.7.2012.12.10.17.00.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 17:00:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 02:00:01 +0100
Message-Id: <64e891e02f58ace1fac85b7f5edd61303c938a35.1355187290.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1355187290.git.Martin.Jansa@gmail.com>
Subject: [PATCH 89/90] fluidsynth: upgrade to 1.1.1
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
X-List-Received-Date: Tue, 11 Dec 2012 01:15:14 -0000
X-List-Received-Date: Tue, 11 Dec 2012 01:15:14 -0000

* and drop special do_configure, now with libtool working with sysroot
  argument, we need this otherwise libfluidsynth.la references
  /usr/lib/libasound.la directly instead of =/usr/lib/libasound.la and
  e.g. vlc build fails

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../fluidsynth/{fluidsynth_1.0.8.bb => fluidsynth_1.1.1.bb}    | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.0.8.bb => fluidsynth_1.1.1.bb} (62%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.0.8.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
similarity index 62%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.0.8.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
index f5d6e53..a989e76 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.0.8.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
@@ -7,13 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dda26baa823649da9a68947707650272"
 DEPENDS = "alsa-lib ncurses"
 
 SRC_URI = "http://savannah.nongnu.org/download/fluid/${P}.tar.gz"
-SRC_URI[md5sum] = "e2abfd2e69fd8b28d965df968d7d44ee"
-SRC_URI[sha256sum] = "45e7c9967d0fb0344f4da539ab343fb979384b36a429a8594c94cf466dff4320"
+SRC_URI[md5sum] = "0db3da78028d255026230809c6e21b44"
+SRC_URI[sha256sum] = "55638cb04f39f4df76c081e22ca7feeea58ddd20ebf779a7db2d38b1ff374cd6"
 
 inherit autotools pkgconfig lib_package
-
-#Has broken libtool usage
-do_configure() {
-	gnu-configize
-	oe_runconf
-}
-- 
1.8.0



