Return-Path: <lionel.ains@legrand.fr>
X-Greylist: delayed 905 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Feb 2015 15:13:33 UTC
Received: from grpleg.net (smtp1-22.grpleg.net [85.158.16.28])
	by mail.openembedded.org (Postfix) with ESMTP id D3A0A72007
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 15:13:32 +0000 (UTC)
Received: from ([10.0.51.15])
	by smtp1-22.grpleg.net with ESMTP  id 7RSHRF1.321663934;
	Tue, 24 Feb 2015 15:58:26 +0100
Received: from localhost.localdomain ([10.0.250.7])
	by fr-lgs-hub-02.srvnts.grpleg.com (Lotus Domino Release 8.5.3FP1)
	with ESMTP id 2015022415582595-33157 ;
	Tue, 24 Feb 2015 15:58:25 +0100 
From: Lionel AINS <lionel.ains@legrand.fr>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Feb 2015 15:57:31 +0100
Message-Id: <1424789852-28989-1-git-send-email-lionel.ains@legrand.fr>
X-Mailer: git-send-email 1.7.10.4
X-MIMETrack: Itemize by SMTP Server on FR-LGS-HUB-02/SRV/GRPLEG(Release
	8.5.3FP1|March 07, 2012) at 24/02/2015 15:58:26,
	Serialize by Router on FR-LGS-HUB-02/SRV/GRPLEG(Release 8.5.3FP1|March
	07, 2012) at 24/02/2015 15:58:26,
	Serialize complete at 24/02/2015 15:58:26
X-TNEFEvaluated: 1
Cc: Lionel AINS <lionel.ains@legrand.fr>
Subject: [meta-oe][daisy][PATCH] php: Fixing cleanup at the end of do_install on non-existing directories
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
X-List-Received-Date: Tue, 24 Feb 2015 15:13:37 -0000
Content-Type: text/plain;
	charset="UTF-8"

At the end of do_install_append_pn-php, a recursive cleanup of temporary directory is executed.
We start from ${D}/${TMPDIR} and go up one level each time, removing each directory, until we read ${D}
The issue is that TMPDIR is not defined in this script, and in some setup seems to contain an absolute path.
Concatenating ${D} with another absolute path leads to a non-existing directory, rmdir will then fail.
I don't really know why this recursive cleanup has been implemented, but in order to keep it working when it
can, but letting it fail silently without failing the whole do_install task, I have just made sure we try to
delete a directory that actually exists, and just silently skip directories otherwise.

Lionel AINS (1):
  php: do_install cleanup tests dir exists before trying rmdir $TMP

 meta-oe/recipes-devtools/php/php.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

