Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LPN8V-0005lA-0f
	for openembedded-devel@openembedded.org; Tue, 20 Jan 2009 21:23:47 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090120201642.XGX8485.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 20 Jan 2009 15:16:42 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id 5wGf1b00J1E665w04wGf5M; Tue, 20 Jan 2009 15:16:42 -0500
X-Authority-Analysis: v=1.0 c=1 a=MqJQbzTCXzgA:10 a=PRi5dtLgnIcA:10
	a=lQQa6ZgXvQrHbSIkFH4A:9 a=uCIEzuWJe-qip6C5XTsA:7
	a=L0mazjMW71pe4bP8Djb7825mfLQA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 20 Jan 2009 13:16:39 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090120201639.GB4023@smtp.west.cox.net>
References: <200812051715.45106.openembedded@haerwu.biz>
	<20081205174806.GA12852@denix.org>
	<200901201630.08341.openembedded@haerwu.biz>
	<20090120200454.GA18725@denix.org>
MIME-Version: 1.0
In-Reply-To: <20090120200454.GA18725@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Tue, 20 Jan 2009 20:23:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 20, 2009 at 03:04:54PM -0500, Denys Dmytriyenko wrote:
> On Tue, Jan 20, 2009 at 04:30:07PM +0100, Marcin Juszkiewicz wrote:
> > On Friday 05 of December 2008 18:48:06 Denys Dmytriyenko wrote:
> > > On Fri, Dec 05, 2008 at 05:15:41PM +0100, Marcin Juszkiewicz wrote:
> > > > In few words: it checks how big rootfs is, adds IMAGE_EXTRA_SPACE
> > > > amount of kilobytes to it and gives that size to genext2fs.
> > > >
> > > > Below is a patch with code changes. Check it and say what You think
> > > > about it. One thing is missing - support for fixed size ext2/3
> > > > images big enough to fit resulting rootfs.
> > 
> > > Can it be done like this:
> > >
> > > ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = ${IMAGE_EXTRA_SPACE}
> > > + $1; \ print (size > ${IMAGE_ROOTFS_SIZE} ? size :
> > > ${IMAGE_ROOTFS_SIZE}) }'`
> > 
> > Yes, it can - I pushed my patch and your code went too (as separate 
> > commit).
> 
> Thanks. I wonder why it can't be also applied to ext2.gz and ext3.gz images.

Tangentally, is there a reason we can't have:
IMAGE_CMD_ext2 = "...."
IMAGE_CMD_ext2.gz = "${IMAGE_CMD_ext2} ; gzip ..."
?

-- 
Tom Rini


