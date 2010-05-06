Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O9uQd-0001Tr-61
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 08:19:25 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1Z00F3FIPXBPU5@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	06 May 2010 01:15:34 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5B6CB14AF60; Thu,
	06 May 2010 02:15:33 -0400 (EDT)
Date: Thu, 06 May 2010 02:15:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100506061533.GA24209@denix.org>
References: <mailman.6069.1273115899.24517.openembedded-devel@lists.openembedded.org>
	<p2lad875cab1005052017k622928e3jabfe4ea684e4ef62@mail.gmail.com>
	<l2pad875cab1005052019o60a63221ya1727def61751e98@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <l2pad875cab1005052019o60a63221ya1727def61751e98@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: create ipk failed...
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
X-List-Received-Date: Thu, 06 May 2010 06:19:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, May 06, 2010 at 11:19:46AM +0800, yenchengwang wrote:
> >
> > hi all,
> >     I have a problem when try to "bitbake -b recipes/minicom/
> > minicom-mypkg_2.4.bb"
> >
> >     the bellow is the content of my bb file:
> >     file name is minicom-mypkg_2.4.bb
> > *********************************************************************************************************
> >
> >     SECTION = "console/network"
> >     DEPENDS = "ncurses"
> >     LICENSE = "GPL"
> >
> >     SRC_URI = "
> > https://alioth.debian.org/frs/download.php/3195/minicom-${PV}.tar.gz<https://alioth.debian.org/frs/download.php/3195/minicom-$%7BPV%7D.tar.gz>
> > "
> >     S = "${WORKDIR}/minicom-${PV}"
> >     PR = "r0"
> >
> >     inherit autotools gettext
> >
> >     do_configure() {
> >         ./configure --host = arm
> >     }
> >
> >     do_install() {
> >         autotools_do_install
> >     }
> >
> > *********************************************************************************************************
> >
> > then bitbake -b recipes/minicom/minicom-mypkg_2.4.bb, I always get the
> > below messages:
> >
> >
> > ****************************************************************************************************************************************************************
> > NOTE: the following files were installed but not shipped in any package:

The above message says it all - your files are installed in /usr/local and not 
being added to any package, that's why they are all empty.

> > NOTE: /usr/local/share/man/man1/ascii-xfr.1
> > NOTE: /usr/local/share/man/man1/minicom.1
> > NOTE: /usr/local/share/man/man1/xminicom.1
> > NOTE: /usr/local/share/man/man1/runscript.1
> > ... ignored
> > NOTE: /usr/local/bin/xminicom
> > NOTE: /usr/local/bin/ascii-xfr
> > NOTE: /usr/local/bin/minicom
> > NOTE: /usr/local/bin/runscript
> > NOTE: /usr/local/bin/.debug/ascii-xfr
> > NOTE: /usr/local/bin/.debug/minicom
> > NOTE: /usr/local/bin/.debug/runscript
> > NOTE: Running task 12 of 17 (ID: 10, /home/rd/oe/build/recipes/minicom/
> > minicom-mypkg_2.4.bb, do_qa_staging)
> > NOTE: Running task 13 of 17 (ID: 16, /home/rd/oe/build/recipes/minicom/
> > minicom-mypkg_2.4.bb, do_package_write_ipk)
> > Packaged contents of minicom-mypkg-dbg into
> > /home/rd/oe/build/tmp/deploy/glibc/ipk/armv5te/minicom-mypkg-dbg_2.4-r0.5_armv5te.ipk
> > NOTE: Not creating empty archive for minicom-mypkg-2.4-r0.5
> > NOTE: Not creating empty archive for minicom-mypkg-doc-2.4-r0.5
> > Packaged contents of minicom-mypkg-dev into
> > /home/rd/oe/build/tmp/deploy/glibc/ipk/armv5te/minicom-mypkg-dev_2.4-r0.5_armv5te.ipk
> > NOTE: Not creating empty archive for minicom-mypkg-static-2.4-r0.5
> > NOTE: Not creating empty archive for minicom-mypkg-locale-2.4-r0.5
> > ...ignored
> >
> > ****************************************************************************************************************************************************************
> >
> > I have no idea why I always get these messages...
> > NOTE: Not creating empty archive for minicom-mypkg-2.4-r0.5
> > NOTE: Not creating empty archive for minicom-mypkg-doc-2.4-r0.5
> > NOTE: Not creating empty archive for minicom-mypkg-static-2.4-r0.5
> > NOTE: Not creating empty archive for minicom-mypkg-locale-2.4-r0.5
> >
> > any information is appreciate !!


