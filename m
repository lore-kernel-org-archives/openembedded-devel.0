Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad@mail.asoft.ru>) id 1LnsSl-0000jU-TM
	for openembedded-devel@openembedded.org; Sun, 29 Mar 2009 12:42:00 +0200
Received: from localhost ([95.72.103.196]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n2TAdwL1013367
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2009 14:40:00 +0400
Date: Sun, 29 Mar 2009 14:39:58 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Message-ID: <20090329103958.GA30154@rainbow>
References: <1237150071-24115-1-git-send-email-mad_soft@inbox.ru>
	<1237162088.5882.7.camel@utx.utx.cz>
MIME-Version: 1.0
In-Reply-To: <1237162088.5882.7.camel@utx.utx.cz>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Sun, 29 Mar 2009 14:40:00 +0400 (MSD)
Subject: Re: [PATCH/RFC] base-files: add noatime to rootfs mount	options
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
X-List-Received-Date: Sun, 29 Mar 2009 10:42:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01:08 Mon 16 Mar     , Stanislav Brabec wrote:
> Dmitry Artamonow wrote in Sun 03/15 2009 at 23:47 +0300:
> > In most machines' fstabs rootfs mounted with 'defaults' option.
> > This implies that atime logging is on - i.e. on every read from
> > filesystem kernel writes atime stamp to files' metadata.
> > Here in embedded world, where rootfs is usually stored on some
> > kind of flash (internal NAND/NOR, or external SD/MMC/CF card)
> > it is a real problem, because higher number of writes causes
> > flash wearing, higher system load and higher chance of filesystem
> > corruption.
> > 
> > Fix it by adding noatime to rootfs mount options in fstab.

If there's no objections, can somebody apply this?
(hint: I don't have a commit rights)

I can send updated patch if needed - though changing 'packages' to
'recipes' with sed shouldn't be too hard:
 sed -i 's:a/packages/:a/recipes/:g' *.patch
 sed -i 's:b/packages/:b/recipes/:g' *.patch

> 
> Good idea. On Zaurus it even prevents regular hard disc waking up while
> executing scripts and significantly increases speed of writing of large
> amount of small files.
> 
> Patching of udev mount.sh script would be useful as well.

Yes. I'll try too look into this.

-- 
Best regards,
Dmitry "MAD" Artamonow



