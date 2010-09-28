Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P0drp-0008S1-Or
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 19:21:27 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9G00L5YW6DNZ51@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	28 Sep 2010 12:20:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B7F1814AF60; Tue,
	28 Sep 2010 13:20:37 -0400 (EDT)
Date: Tue, 28 Sep 2010 13:20:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100928172037.GE12985@denix.org>
References: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: generate a named kernel in ${DEPLOY_DIR_IMAGE}
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
X-List-Received-Date: Tue, 28 Sep 2010 17:21:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 28, 2010 at 06:54:38PM +0200, Frans Meulenbroeks wrote:
> Hi,
> 
> As I needed to generate two different kernels for the same machine I
> had some kind of problem (as emailed yesterday).
> For now I've solved it as follows:
> 
> I created a 2nd recipe (in an overlay):
> linux-small_2.6.34.bb
> this one essentially only requires linux_2.6.34.bb and sets S to the linux_${PN}
> Then I can just add a dir linux-small and add the small defconfig in it.
> 
> That way bitbake linux-small should give me the 2nd kernel.
> And actually it builds the kernel but this one is also packaged in a
> kernel-*.ipk.
> I could have made two different machines, but that seemed somewhat
> overkill, so in the end I decided to modify do_install_append in
> linux.inc.
> 
> This function currently reads:
> 
> do_install_append() {
> 	oe_runmake headers_install
> INSTALL_HDR_PATH=${D}${exec_prefix}/src/linux-${KERNEL_VERSION}
> ARCH=$ARCH
> }
> 
> And I just added a line:
>     cp ${D}/boot/uImage ${DEPLOY_DIR_IMAGE}/uImage-${PN}
> 
> That way both kernels end up with different names in the deploy dir.
> In the image recipe I can then just copy them in a post process
> command to the proper location.
> (btw that is also why I went for uImage-${PN} and not for
> uImage-${PN}-${KERNEL_VERSION}, the kernel version is not known in the
> image recipe so it is much harder to copy the right/latest uImage to
> the kernel.
> 
> Rationale for typing this message is threefold:
> - first of all I wanted to record and share what I have done, so
> others can use it
> - secondly I would appreciate feedback on my solutions (and maybe
> someone sees a way to improve it)
> - and lastly I would like to inquire if people feel the above line
> would be a nice addition to the stock linux.inc. If so I'l happily
> prepare a patch.

Frans,

May I suggest you to look at the existing multi-kernel.inc implementation[1] 
for building multiple versions of the same kernel with slightly different 
defconfigs and slightly different resulting names in the deploy. I use it in 
Arago[2][3] for linux-davinci machines, while Koen uses it in OE with 
linux-omap-psp for beagleboard[4][5]...

[1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/multi-kernel.inc
[2] http://arago-project.org/git/?p=arago.git;a=blob;f=recipes/linux/linux-davinci-staging_git.bb;hb=HEAD
[3] http://arago-project.org/git/?p=arago.git;a=tree;f=recipes/linux/linux-davinci-staging/dm355-evm;hb=HEAD
[4] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-omap-psp_2.6.32.bb
[5] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-omap-psp-2.6.32/beagleboard

-- 
Denys


