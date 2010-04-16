Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O2kjz-0005Gq-4h
	for Openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 14:33:48 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id B172FEB93C
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 08:30:18 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 16 Apr 2010 08:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:mime-version:content-type;
	s=smtpout; bh=haBx10n22czwXJBIjGYVx6tFrdY=;
	b=Ehc+NUTxb5464LA+qBUBASvVMBo1lgIyzWj5NrTJuAcXpeztrplPc8DFhfsDm7ATZnXbXP1RL2lSM/gR39c1pCtYi9eToq2inueKR4kMndRHeO9sA92O6e7o7A6NfAQ1VecuF9FZ3aXvw3qtV28/cz9xNKKiVbr5VguY5vc/CP0=
X-Sasl-enc: mdVCM+Ok3jga7t/DHYRPgSrC86e+wEBdAENiU+tUeRpd 1271421018
Received: from [192.168.1.34] (hnvr-4d07a1c5.pool.mediaWays.net [77.7.161.197])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 17BFB4AFE0D
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 08:30:17 -0400 (EDT)
Date: Fri, 16 Apr 2010 14:31:31 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Message-ID: <alpine.LNX.2.00.1004161430260.28729@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH][STABLE] bitbake.conf: SRCPV always upgradeable paths for git recipes
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
X-List-Received-Date: Fri, 16 Apr 2010 12:33:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

From: Martin Jansa <martin.jansa@gmail.com>

* Holger Hans Peter Freyther <zecke@openmoko.org> did for the OM git
  tree that was never merged back into OE.
* Taken from xora/angstrom-srcpv branch where it rot for long enough
Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 conf/bitbake.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index d1ed040..f6c4c12 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -531,7 +531,8 @@ UPDATECOMMAND_cvs = "/usr/bin/env 'PATH=${PATH}' cvs -d${CVSROOT} update -d -P $
 UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
 SRCDATE = "${DATE}"
 SRCREV = "1"
-AUTOREV = "${@bb.fetch.get_srcrev(d)}"
+SRCPV = "${@bb.fetch.get_srcrev(d)}"
+AUTOREV = "${SRCPV}"

 SRC_URI = "file://${FILE}"

-- 
1.6.4.4


-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


