Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzxOP-0003ud-NS
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 21:32:30 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI600AYG3MKXT32@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Mar 2011 15:30:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A5B2B14AF6A; Wed,
	16 Mar 2011 16:30:20 -0400 (EDT)
Date: Wed, 16 Mar 2011 16:30:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Message-id: <20110316203020.GL3042@denix.org>
References: <1300212835-8779-1-git-send-email-bengardiner@nanometrics.ca>
	<20110315200131.GA3042@denix.org>
	<AANLkTikS9S8OdO3DqBzhErVMiTxHruk2Mo17rNqK9aad@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTikS9S8OdO3DqBzhErVMiTxHruk2Mo17rNqK9aad@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Tom Rini <trini@embeddedalley.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: add link to .rootfs.<type> or	.<type>.img
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
X-List-Received-Date: Wed, 16 Mar 2011 20:32:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 16, 2011 at 11:25:48AM -0400, Ben Gardiner wrote:
> Thanks, Denys for the Ack and Tom for picking up the patches.
> 
> Now that they have hit mainline, I would like to request that they get
> into arago-oe-dev. From the 2010.03-maintenance announcement I'm
> guessing that means that they need to be backported to
> 2010.03-maintenance branch first.

Ben,

I'm in the process of switching arago-oe-dev snapshot to track 
2011.03-maintenance branch instead of the mainline, as Arago is currently 
based on Angstrom-2008.1 and that was removed from the mainline.

I've acked the cherry-picks for the maintenance branch, so once Tom pushes 
them there, you should see them appear in arago-oe-dev in a day or two...

And thank you for your help.

> I've cherry-picked the following commits (some with fixups) to get a
> successful build of hello-worldimage with externa-toolchain and
> Build Configuration:
> BB_VERSION        = "1.10.2"
> METADATA_BRANCH   =
> "upstream/oe/releases/2011.03-maintenance/features/BenGardiner/backport-ubifs-links"
> METADATA_REVISION = "64d4245"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "da850-omapl138-evm"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "2011.03"
> TARGET_FPU        = "soft"
> 
> commit 64d42452395f0c02d355516943c8493dc770ade2Author: Denys
> Dmytriyenko <denys@ti.com>
> Date:   Thu Mar 3 13:37:19 2011 -0500
> 
>     toolchain-external.conf: set the default provider for gdbserver
> 
>     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>     (cherry picked from commit df59f77a2eb37d9807c6d9167488110e92601d7b)
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
>  conf/distro/include/toolchain-external.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> commit 2641cb6d7e2db1dcd2608bae7d84909915b1f023
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Thu Mar 3 13:27:26 2011 -0500
> 
>     external-toolchain-csl: handle packaging of gdbserver based on
> PREFERRED_PROVIDER
> 
>     Allow packaging independent copy of specific version of gdbserver with
>     external-toolchain-csl by setting PREFERRED_PROVIDER. E.g. for GPLv2
>     gdbserver, add these lines to your distro/local.conf:
> 
>     PREFERRED_PROVIDER_gdbserver = "gdbserver"
>     PREFERRED_VERSION_gdbserver = "6.6"
> 
>     Thanks to Ben Gardiner for providing valuable feedback.
> 
>     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>     (cherry picked from commit a47c14c83cf97a2c90ee50ec7212ec33bdafb58b)
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
>  recipes/meta/external-toolchain-csl.bb |   11 ++++++-----
>  1 files changed, 6 insertions(+), 5 deletions(-)
> 
> commit 1775a7d2fdc6b7cc242b2b4e9f0a6516edf0ad83
> Author: Tom Rini <tom_rini@mentor.com>
> Date:   Wed Mar 2 11:39:48 2011 -0700
> 
>     external-toolchain-csl: Drop do_stage, add gdbserver
> 
>     Based on work from Noor Ahsan, we merge the important part of do_stage
>     into do_install and then set NATIVE_INSTALL_WORKS.  We also add a function
>     for getting the gdb version for packaging up gdbserver and ship that.
> 
>     Signed-off-by: Tom Rini <tom_rini@mentor.com>
>     (cherry picked from commit 207971b244ee6958dab1fb41d6f3cd94ac416b73)
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
>  recipes/meta/external-toolchain-csl.bb |   39 +++++++++++++++++--------------
>  1 files changed, 21 insertions(+), 18 deletions(-)
> 
> commit a96c10d6cff4f8298c43eccd9139dd20d41a4cc8
> Author: Ben Gardiner <bengardiner@nanometrics.ca>
> Date:   Wed Mar 2 10:05:14 2011 -0500
> 
>     external-toolchain-csl: allow linux-libc-headers
> 
>     If PREFERRED_PROVIDER_linux-libc-headers is defined as anything
>     other than external-toolchain-csl then don't PROVIDE, install or
>     stage the linux headers packaged with the CSL toolchain.
> 
>     (Updated by Tom Rini to not modify local.conf.sample yet and to use
>     cp + rm -rf rather than rsync)
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>     Tested-by: Andrea Galbusera <gizero@gmail.com>
>     Signed-off-by: Tom Rini <tom_rini@mentor.com>
>     (cherry picked from commit 3116ad58e507c6e5dc7b7249f521c395db586b9f)
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
>  recipes/meta/external-toolchain-csl.bb |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
> 
> commit 925e89153270dc162957903bc793ecbfdbf6ec05
> Author: Ben Gardiner <bengardiner@nanometrics.ca>
> Date:   Wed Mar 2 10:05:13 2011 -0500
> 
>     external-toolchain: allow override of linux-libc-headers provider
> 
>     only set PREFERRED_PROVIDER_linux-libc-headers if it is not
>     already assigned a value.
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>     Tested-by: Andrea Galbusera <gizero@gmail.com>
>     Signed-off-by: Tom Rini <tom_rini@mentor.com>
>     (cherry picked from commit 829ea5110bc82f71a225f168bcb6a9a327b1b5c8)
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
>  conf/distro/include/toolchain-external.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> commit 5156e672c781e8a44e02f9eb4351cb8c476c3a60
> Author: Ben Gardiner <bengardiner@nanometrics.ca>
> Date:   Tue Mar 15 14:13:55 2011 -0400
> 
>     bitbake.conf: use .ubifs.img extension in IMAGE_CMD_ubi
> 
>     The current IMAGE_CMD_ubi creates an interim image with a .rootfs.ubifs
>     extension.
> 
>     The ubifs image created is not considered a valid rootfs without a UBI
>     container.
> 
>     Change the filename of the iterim ubifs image used by IMAGE_CMD_ubi to
>     .ubifs.img to match the IMAGE_CMD_ubifs command.
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>     Acked-by: Denys Dmytriyenko <denys@ti.com>
>     Signed-off-by: Tom Rini <tom_rini@mentor.com>
>     (backported from commit 7308e68fc26cdbffa08d311a2319c8d1c3b2805f -- some
>     changes were needed since commit 312b42bcf2cc9b11266ba497ade68e8ddabb3007
>     bitbake.conf: add XZ_INTEGRITY_CHECK and LZMA_COMPRESSION_LEVEL variables
>     has not been applied to 2011.03-maintenance)
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
>  conf/bitbake.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> commit 08cb84d24fdd8e9d40a5db836b98a3706187c7c6
> Author: Ben Gardiner <bengardiner@nanometrics.ca>
> Date:   Tue Mar 15 14:13:54 2011 -0400
> 
>     image.bbclass: add link to .rootfs.<type> or .<type>.img
> 
>     The current image link-creation code will unconditionaly create a link
>     from .<type> pointing to the .rootfs.<type> output.
> 
>     This is not compatible with the UBIFS images produced which have
>     .<type>.img extension since they are not considered to be valid rootfs
>     images when they are not included in a UBI container.
> 
>     Check for existence of the link target .rootfs.<type> before creating the
>     link and fallback to a check for the .<type>.img target after that.
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>     Acked-by: Denys Dmytriyenko <denys@ti.com>
>     Signed-off-by: Tom Rini <tom_rini@mentor.com>
>     (cherry picked from commit cfde49e8d0f1cf09d589910f1a342849db148519)
> 
>     Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
>  classes/image.bbclass |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> It seems a little strange to me to re-post the patches to the list; so
> I'm asking first. Please let me know if I'm on the right track for the
> procedure.
> 
> Best Regards,
> Ben Gardiner
> 
> ---
> Nanometrics Inc.
> http://www.nanometrics.ca
> 


