Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lut2B-0006j3-7L
	for openembedded-devel@openembedded.org; Fri, 17 Apr 2009 20:43:57 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090417183927.WUPU27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 17 Apr 2009 14:39:27 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id gifT1b00N4dMFYL04ifTBt; Fri, 17 Apr 2009 14:39:27 -0400
X-Authority-Analysis: v=1.0 c=1 a=Z0Wpj-QlwhaSmdyBvHkA:9
	a=SkwR3mWN8EuqnxMNariYXuSNN6sA:4
X-CM-Score: 0.00
Date: Fri, 17 Apr 2009 11:39:27 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090417183927.GU17629@smtp.west.cox.net>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF763@hiob.intern.dresearch.de>
MIME-Version: 1.0
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF763@hiob.intern.dresearch.de>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: initramfs howto?
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
X-List-Received-Date: Fri, 17 Apr 2009 18:44:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 17, 2009 at 06:18:19PM +0200, Sledz, Steffen wrote:

> We want to use a little initramfs for our machine (hipox
> with linux-2.6.24) to load some modules. I've found some
> samples (e.g. initramfs-image.bb). But the usage is totally
> unclear to me.

I don't think that out of the box, "load some modules" can work.  The
current initramfs stuff, if I read it right, makes use of a premade
cpio.  It should however, be possible to fix this up, with the hardest
part being fixing up of the dev nodes.  What follows is a hack I've done
to a specific kernel's do_compile:

# We need to make an initramfs.  First step, extract the
# initramfs
# contents, minus modules.
mkdir -p rootfs/dev
fakeroot tar -C rootfs -xf ${DEPLOY_DIR_IMAGE}/myinitramfs.tar

# Second, build first kernel and modules.
oe_runmake ${KERNEL_IMAGETYPE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}"

# Third, install modules
oe_runmake DEPMOD=`which ${TARGET_PREFIX}depmod-2.6` \
  INSTALL_MOD_PATH="rootfs" modules_install

# Fourth, make the cpio list AND add in /dev/null and
# /dev/console
sh ./scripts/gen_initramfs_list.sh rootfs > rootfs.list
echo "nod /dev/console 0600 0 0 c 5 1" >> rootfs.list
echo "nod /dev/null 0666 0 0 c 1 3" >> rootfs.list

# Fifth, build a kernel with the full initramfs.
sed -i -e 's|\(CONFIG_INITRAMFS_SOURCE\)=""|\1="rootfs.list"|g' .config
echo "CONFIG_INITRAMFS_ROOT_UID=`id -u`" >> .config
echo "CONFIG_INITRAMFS_ROOT_GID=`id -g`" >> .config
oe_runmake ${KERNEL_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"

And I also put in:
# For our initramfs.  It must exist and if we clean this, we should
# clean that.
do_compile[depends] += "myinitramfs-image:do_rootfs"
do_clean[depends] += "myinitramfs-image:do_clean"

This should somehow be generalized a bit and put into kernel.bbclass,
quite probably.

-- 
Tom Rini


