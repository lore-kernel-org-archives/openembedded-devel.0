Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LiAE0-0003qf-Hq
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 17:27:08 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGG007A1DOARBW0@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	13 Mar 2009 11:26:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 82C156B83B5; Fri,
	13 Mar 2009 12:26:34 -0400 (EDT)
Date: Fri, 13 Mar 2009 12:26:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090313162634.GB26615@denix.org>
References: <1236958547.8913.5.camel@northpole>
MIME-version: 1.0
In-reply-to: <1236958547.8913.5.camel@northpole>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Can't build an ext2 minimal image
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
X-List-Received-Date: Fri, 13 Mar 2009 16:27:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 13, 2009 at 12:35:47PM -0300, Jader H. Silva wrote:
> I'm trying to build a minimal-image with an ext2 filesystem image, so I
> set inside my local.conf:
> 
> IMAGE_FSTYPES = "ext2"
> 
> But OE insists on building an jffs2 image. I found, inside
> conf/distro/minimal.conf:
> 
> IMAGE_FSTYPES = "tar.gz jffs2"
> 
> Does it means local.conf's IMAGE_FSTYPES get overwritten? If so, can
> anybody fix it?

Thanks for reporting - it should be fixed now.

-- 
Denys


