Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M8KkJ-0004XG-V8
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 22:56:40 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KK60004A1SLTYT7@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 May 2009 15:48:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 82DC214AF5F; Sun,
	24 May 2009 16:48:21 -0400 (EDT)
Date: Sun, 24 May 2009 16:48:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090524204821.GC1445@denix.org>
References: <fce2a370905231344i3eced2bci5e1997d520be705e@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <fce2a370905231344i3eced2bci5e1997d520be705e@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: e2fsprogs-libs is unbuildable for .dev
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
X-List-Received-Date: Sun, 24 May 2009 20:56:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, May 23, 2009 at 11:44:47PM +0300, Ihar Hrachyshka wrote:
> For org.openembedded.dev branch I get the following error when trying
> to compile console-image for BeagleBoard. The problem is reproducable
> with fully cleaned tmp/
> 
> ERROR: Error in executing:
> /home/booxter/projects/oe.devel//openembedded/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb
> ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such
> file or directory:
> '/home/booxter/projects/oe.devel//tmp/work/armv7a-angstrom-linux-gnueabi/util-linux-ng-2.15-r2/install/e2fsprogs-libs-dbg'

It is due to this:

http://thread.gmane.org/gmane.comp.handhelds.openembedded/22376/focus=22561

And caused I believe by this:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=61f0ac5601f6c03871d084f879ef618664d9b2c6

Looks like pkgdata/runtime handling needs fixing...

-- 
Denys


