Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RY09A-00009f-Ba
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 19:53:44 +0100
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LVS000V7PHA7DC1@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	06 Dec 2011 12:46:28 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C239A14AF5D; Tue,
	06 Dec 2011 13:46:22 -0500 (EST)
Date: Tue, 06 Dec 2011 13:46:22 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111206184622.GB22517@denix.org>
References: <jblfj1$mnj$1@dough.gmane.org> <4EDE4ED3.1090609@oliseo.fr>
MIME-version: 1.0
In-reply-to: <4EDE4ED3.1090609@oliseo.fr>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] Fix git URL to linux-omap git repo.
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
X-List-Received-Date: Tue, 06 Dec 2011 18:53:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Dec 06, 2011 at 06:20:19PM +0100, Guillaume GARDET - Olis?o wrote:
> This is for beagleboard but it seems there are recipes for newer kernels 
> but they are not used by default.
> Oh, theu have the same bad URL, should fix it.

While you are at it, please fix these (some are outdated, but still):

$ grep 'tmlind/linux-omap-2.6' *
linux-kexecboot_2.6.32.bb:SRC_URI_append_omap3 = " git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git;rev=6833f1a8cdcb65a370f898bde6b6af63f81962df \
linux-omap_2.6.26.bb:SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
linux-omap_2.6.27.bb:SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
linux-omap_2.6.28.bb:SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;branch=omap-2.6.28;protocol=git \
linux-omap_2.6.29.bb:SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
linux-omap_2.6.31.bb:SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
linux-omap_2.6.32.bb:SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
linux-omap_2.6.37.bb:SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
linux-omap_2.6.38.bb:SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
linux-omap_2.6.39.bb:SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
linux-omap2_git.bb:SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \
linux-omap_git.bb:SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git \

-- 
Denys


