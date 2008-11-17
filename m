Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L27F7-0002A0-GL
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 17:46:29 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081117164407.OTVZ12520.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 11:44:07 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id gGk61a0021E665w04Gk6mn; Mon, 17 Nov 2008 11:44:06 -0500
X-Authority-Analysis: v=1.0 c=1 a=OC_Q40pD8XEA:10 a=mIBhVGiXw10A:10
	a=T7TGibHI_mcr298AJWQA:9 a=jFppab9lxzQBUJyIexgA:7
	a=0TddH8mswmeMmBGEMyvkE3ZHR68A:4 a=BMhvWp3hHq8A:10 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 17 Nov 2008 09:44:06 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081117164405.GM15695@smtp.west.cox.net>
References: <49251.80.246.32.33.1226575168.squirrel@intern.netexpress.de>
	<200811171731.25253.openembedded@haerwu.biz>
MIME-Version: 1.0
In-Reply-To: <200811171731.25253.openembedded@haerwu.biz>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Issues with the system startup when the IMAGE_TYPE is	squashfs
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
X-List-Received-Date: Mon, 17 Nov 2008 16:46:30 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Nov 17, 2008 at 05:31:24PM +0100, Marcin Juszkiewicz wrote:
> Thursday 13 of November 2008 12:19:28 Christian Pössinger napisa??(a):
> > I'm currently building a rootfs that will be stored in a squashfs
> > container. The file is properly created by OpenEmbedded, but I
> > noticed some issues:
> 
> > The second issue comes with the kernel modules. Again, the first
> > system startup will create the modules.dep file inside the
> > /lib/modules/$(uname -a) directory. But as stated before, this is not
> > possible on a read-only filesystem.
> >
> > Is there any way within OpenEmbedded to create those files before the
> > actual rootfs image is packed?
> 
> Each kernel module has postinstall script (added by kernel.bbclass) 
> which calls 'depmod -a' and update-modules. Opkg intercepts depmod calls 
> to make it just one call in 'opkg configure' during first boot. In 
> effect your rootfs has all module dependencies generated on build time. 
> You can probably remove second part of those postinstalls to not call 
> them on device at all.

Another option, if your kernel only builds the modules you want to
install, is have module.dep, etc, be built in the install section of the
kernel recipe and package them up into the kernel-modules package.  The
only slight trick is that you need to do this in kernel_do_install in
kernel.bbclass:
oe_runmake DEPMOD=`which ${TARGET_PREFIX}depmod-2.6` INSTALL_MOD_PATH="${D}" modules_install
Since the kernel does some tests which mean that DEPMOD must be passed
as a full path.

-- 
Tom Rini


