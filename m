Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LPMxM-0003Zg-Uq
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jan 2009 21:12:17 +0100
Received: from gandalf.denix.org ([71.255.246.155]) by vms173003.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KDS0026QD47R8L1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	20 Jan 2009 14:05:01 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DA31A6B83A8; Tue,
	20 Jan 2009 15:04:54 -0500 (EST)
Date: Tue, 20 Jan 2009 15:04:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <200901201630.08341.openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090120200454.GA18725@denix.org>
MIME-version: 1.0
References: <200812051715.45106.openembedded@haerwu.biz>
	<20081205174806.GA12852@denix.org>
	<200901201630.08341.openembedded@haerwu.biz>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] Auto resizing ext2/ext3 images (from Poky)
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
X-List-Received-Date: Tue, 20 Jan 2009 20:12:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 20, 2009 at 04:30:07PM +0100, Marcin Juszkiewicz wrote:
> On Friday 05 of December 2008 18:48:06 Denys Dmytriyenko wrote:
> > On Fri, Dec 05, 2008 at 05:15:41PM +0100, Marcin Juszkiewicz wrote:
> > > In few words: it checks how big rootfs is, adds IMAGE_EXTRA_SPACE
> > > amount of kilobytes to it and gives that size to genext2fs.
> > >
> > > Below is a patch with code changes. Check it and say what You think
> > > about it. One thing is missing - support for fixed size ext2/3
> > > images big enough to fit resulting rootfs.
> 
> > Can it be done like this:
> >
> > ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = ${IMAGE_EXTRA_SPACE}
> > + $1; \ print (size > ${IMAGE_ROOTFS_SIZE} ? size :
> > ${IMAGE_ROOTFS_SIZE}) }'`
> 
> Yes, it can - I pushed my patch and your code went too (as separate 
> commit).

Thanks. I wonder why it can't be also applied to ext2.gz and ext3.gz images.

-- 
Denys


