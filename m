Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LPIfR-0005OC-4q
	for openembedded-devel@openembedded.org; Tue, 20 Jan 2009 16:37:29 +0100
Received: (qmail 3952 invoked by uid 813007); 20 Jan 2009 15:30:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Jan 2009 15:30:26 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jan 2009 16:30:07 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.28; KDE/4.1.96; x86_64; ; )
References: <200812051715.45106.openembedded@haerwu.biz>
	<20081205174806.GA12852@denix.org>
In-Reply-To: <20081205174806.GA12852@denix.org>
MIME-Version: 1.0
Message-Id: <200901201630.08341.openembedded@haerwu.biz>
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
X-List-Received-Date: Tue, 20 Jan 2009 15:37:29 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 05 of December 2008 18:48:06 Denys Dmytriyenko wrote:
> On Fri, Dec 05, 2008 at 05:15:41PM +0100, Marcin Juszkiewicz wrote:
> > In few words: it checks how big rootfs is, adds IMAGE_EXTRA_SPACE
> > amount of kilobytes to it and gives that size to genext2fs.
> >
> > Below is a patch with code changes. Check it and say what You think
> > about it. One thing is missing - support for fixed size ext2/3
> > images big enough to fit resulting rootfs.

> Can it be done like this:
>
> ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = ${IMAGE_EXTRA_SPACE}
> + $1; \ print (size > ${IMAGE_ROOTFS_SIZE} ? size :
> ${IMAGE_ROOTFS_SIZE}) }'`

Yes, it can - I pushed my patch and your code went too (as separate 
commit).

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




