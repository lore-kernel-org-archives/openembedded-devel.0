Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1KszVq-0000A9-0G
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 14:42:02 +0200
Received: from c120.apm.etc.tu-bs.de ([134.169.174.120] helo=localhost)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1KszV7-0003p4-GH by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2008 14:41:31 +0200
Received: from stefan by localhost with local (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1KszV6-0003y3-6o
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 14:41:16 +0200
Date: Thu, 23 Oct 2008 14:41:16 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081023124116.GA15082@datenfreihafen.org>
MIME-Version: 1.0
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Pidgin needs to RDEPENDS on pidgin-data?
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
X-List-Received-Date: Thu, 23 Oct 2008 12:42:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

I have a user bug report here that pidgin segfaults without pidgin-data
installed:
http://trac.freesmartphone.org/ticket/170

In pidgin.inc it only RRECOMMANDS pidgin-data, but not RDEPENDS on it.
Patch below is what I would push if nobody objects.

regards
Stefan Schmidt

diff --git a/packages/pidgin/pidgin.inc b/packages/pidgin/pidgin.inc
index db66d13..e3c35a7 100644
--- a/packages/pidgin/pidgin.inc
+++ b/packages/pidgin/pidgin.inc
@@ -44,7 +44,7 @@ FILES_finch-dbg     = "${bindir}/.debug/finch \
 
 FILES_${PN} = "${bindir} ${datadir}/${PN} ${libdir}/${PN}/*.so \
 	       ${datadir}/applications"
-RRECOMMENDS_${PN{ += "${PN}-data "
+RDEPENDS_${PN{ += "${PN}-data "
 FILES_${PN}-data = "${datadir}/pixmaps ${datadir}/sounds ${datadir}/icons"
 FILES_${PN}-dev += "${libdir}/${PN}/*.la"
 


