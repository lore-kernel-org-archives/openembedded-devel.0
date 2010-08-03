Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OgQDb-0002Da-Mt
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 00:44:22 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 825E7D48079;
	Wed,  4 Aug 2010 00:44:08 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>)
	id 1OgQJE-0006Ov-Uw; Wed, 04 Aug 2010 00:50:08 +0200
Date: Wed, 4 Aug 2010 00:50:08 +0200
From: Yann Dirson <ydirson@free.fr>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803225008.GF4752@home.lan>
MIME-Version: 1.0
X-Mailer: git-send-email 1.7.1
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: ydirson@free.fr
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Make git more usable
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
X-List-Received-Date: Tue, 03 Aug 2010 22:44:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This series allows to install the essential functionnality of git
while still consuming as less space as possible.  Space-consuming
binaries are split to separate ipk's.

The final patch activates installation of gitk - it is only partially
working, but does not force build of anything that's not built in the
default shr image, and can hopefully bring someone into looking at
what seems to be an issue in tcl/tk packaging.




