Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M8Pyb-00063W-7L
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 04:31:45 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KK600AIQHB8PQ70@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 May 2009 21:23:32 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1B68614AF5F; Sun,
	24 May 2009 22:23:32 -0400 (EDT)
Date: Sun, 24 May 2009 22:23:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090525022331.GE1445@denix.org>
References: <1243199407-28031-1-git-send-email-ihar.hrachyshka@gmail.com>
	<20090525020845.GS23842@smtp.west.cox.net>
MIME-version: 1.0
In-reply-to: <20090525020845.GS23842@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] directfb: added new version 1.2.8
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
X-List-Received-Date: Mon, 25 May 2009 02:31:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, May 24, 2009 at 07:08:46PM -0700, Tom Rini wrote:
> On Mon, May 25, 2009 at 12:10:07AM +0300, Ihar Hrachyshka wrote:
> 
> > Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> > ---
> >  conf/checksums.ini                                 |    4 +++
> >  .../directfb/directfb-1.2.8/ts_lib_autotools.patch |   22 ++++++++++++++++
> >  recipes/directfb/directfb_1.2.8.bb                 |   27 ++++++++++++++++++++
> >  3 files changed, 53 insertions(+), 0 deletions(-)
> >  create mode 100644 recipes/directfb/directfb-1.2.8/ts_lib_autotools.patch
> >  create mode 100644 recipes/directfb/directfb_1.2.8.bb
> 
> NAK.  Can you please add in:
>     file://directfb-1.2.x-fix-pkgconfig-cflags.patch;patch=1 \
>     file://mkdfiff.patch;patch=1 \
>     file://dont-use-linux-config.patch;patch=1 \
> (from the files/ dir).  Thanks.

What's the point of duplicating patches, when they are the same from version 
to version?

-- 
Denys


