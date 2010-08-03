Received: from smtp5-g21.free.fr ([212.27.42.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ydirson@free.fr>) id 1OgQNx-0006aw-PT
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 00:55:02 +0200
Received: from home.lan (unknown [81.57.214.146])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 500D5D48031;
	Wed,  4 Aug 2010 00:54:56 +0200 (CEST)
Received: from yann by home.lan with local (Exim 4.72)
	(envelope-from <ydirson@free.fr>)
	id 1OgQTg-0006Un-RM; Wed, 04 Aug 2010 01:00:56 +0200
Date: Wed, 4 Aug 2010 01:00:56 +0200
From: Yann Dirson <ydirson@free.fr>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803230056.GM4752@home.lan>
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
Subject: [PATCH] assorted fixes to python packages
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
X-List-Received-Date: Tue, 03 Aug 2010 22:55:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I use those two packages (xdg and rsvg) in the Omaha board-game GUI
(http://repo.or.cz/w/omaha.git).  The first patch fixes a blocking
bug, and the second one allows to simply install python-rsvg withou
having to install a completely unneeded gnome.

What's next with those packages: we should update pyxdg to the latest
version (I'll give it a run later), and building python-rsvg should
not even require that we build all that gnome stuff, but that is an
upstream issue: maybe we could still make a specific recipe which only
builds rsvg from the package, and have gnome-python-desktop RDEPEND on it ?



