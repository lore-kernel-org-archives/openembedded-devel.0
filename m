Return-Path: <lionel.ains@legrand.fr>
Received: from grpleg.net (smtp1-22.grpleg.net [85.158.16.28])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5C273728
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 15:14:08 +0000 (UTC)
Received: from ([10.0.51.15])
	by smtp1-22.grpleg.net with ESMTP  id 7RSHRF1.321663953;
	Tue, 24 Feb 2015 15:59:04 +0100
Received: from localhost.localdomain ([10.0.250.7])
	by fr-lgs-hub-02.srvnts.grpleg.com (Lotus Domino Release 8.5.3FP1)
	with ESMTP id 2015022415590378-33189 ;
	Tue, 24 Feb 2015 15:59:03 +0100 
From: Lionel AINS <lionel.ains@legrand.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Feb 2015 15:57:32 +0100
Message-Id: <1424789852-28989-2-git-send-email-lionel.ains@legrand.fr>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1424789852-28989-1-git-send-email-lionel.ains@legrand.fr>
References: <1424789852-28989-1-git-send-email-lionel.ains@legrand.fr>
X-MIMETrack: Itemize by SMTP Server on FR-LGS-HUB-02/SRV/GRPLEG(Release
	8.5.3FP1|March 07, 2012) at 24/02/2015 15:59:03,
	Serialize by Router on FR-LGS-HUB-02/SRV/GRPLEG(Release 8.5.3FP1|March
	07, 2012) at 24/02/2015 15:59:04,
	Serialize complete at 24/02/2015 15:59:04
X-TNEFEvaluated: 1
Cc: Lionel AINS <lionel.ains@legrand.fr>
Subject: [meta-oe][daisy][PATCH] php: do_install cleanup tests dir exists before trying rmdir $TMP
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
X-List-Received-Date: Tue, 24 Feb 2015 15:14:11 -0000
Content-Type: text/plain;
	charset="UTF-8"

---
 meta-oe/recipes-devtools/php/php.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 1e2aa72..b03c9bd 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -92,7 +92,7 @@ do_install_append_pn-php() {
     install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
     TMP=`dirname ${D}/${TMPDIR}`
     while test ${TMP} != ${D}; do
-        rmdir ${TMP}
+        test -d ${TMP} && rmdir ${TMP}
         TMP=`dirname ${TMP}`;
     done
 }
-- 
1.7.10.4



Ce message, ainsi que tous les fichiers joints à ce message,
peuvent contenir des informations sensibles et/ ou confidentielles
ne devant pas être divulguées. Si vous n'êtes pas le destinataire
de ce message (ou que vous recevez ce message par erreur), nous
vous remercions de le notifier immédiatement à son expéditeur, et
de détruire ce message. Toute copie, divulgation, modification,
utilisation ou diffusion, non autorisée, directe ou indirecte, de
tout ou partie de ce message, est strictement interdite.

This e-mail, and any document attached hereby, may contain
confidential and/or privileged information. If you are not the
intended recipient (or have received this e-mail in error) please
notify the sender immediately and destroy this e-mail. Any
unauthorized, direct or indirect, copying, disclosure, distribution
or other use of the material or parts thereof is strictly
forbidden.

