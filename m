Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 85C616B819
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:59:59 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N35003FMRC01DW0@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	28 Mar 2014 13:00:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A6CB12036F; Fri,
	28 Mar 2014 14:00:00 -0400 (EDT)
Date: Fri, 28 Mar 2014 14:00:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140328180000.GM3370@denix.org>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
MIME-version: 1.0
In-reply-to: <1394227575-27897-1-git-send-email-lauren.post@freescale.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe][PATCH 1/7] linuxptp: Create 1.4 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Mar 2014 18:00:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 07, 2014 at 03:26:09PM -0600, Lauren Post wrote:
> Precision Time Protocol (PTP) according to IEEE standard 1588

Heh, another instance of "duplication" - I also have a similar recipe in my 
layer... Well, I do understand that "the early bird gets the worm" or the 
first submitter gets his change merged, but let me point out few issues:


> Signed-off-by: Lauren Post <lauren.post@freescale.com>
> ---
>  .../recipes-connectivity/linuxptp/linuxptp_1.4.bb  |   26 ++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
> 
> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
> new file mode 100644
> index 0000000..c708b13
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS = "virtual/kernel"
> +
> +SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz"
> +
> +SRC_URI[md5sum] = "a37ad2b2ef7d1ebc4d64a66d3fe55cdf"
> +SRC_URI[sha256sum] = "6cfd5291fb7394cc9f25458927874a203971b66b76d1c9d6568e007d0cbd81f2"
> +
> +inherit autotools pkgconfig

It's easy to see that linuxptp build doesn't really use autotools or pkgconfig


> +EXTRA_OEMAKE = 'KBUILD_OUTPUT="${STAGING_KERNEL_DIR}" CROSS_COMPILE="${TARGET_PREFIX}"'
> +
> +do_configure_append () {
> +    find ${S} -name makefile | xargs sed -i 's,^\(CC\|CFLAGS\|prefix\|AR\)=,\1 ?=,g'

Why do you need to mangle the makefile? Passing CROSS_COMPILE and maybe ARCH 
should be enough, isn't it?


> +}
> +
> +do_install () {
> +    install -d ${D}/${bindir}
> +    install -p ${S}/ptp4l  ${D}/${bindir}
> +    install -p ${S}/pmc  ${D}/${bindir}
> +    install -p ${S}/phc2sys  ${D}/${bindir}
> +    install -p ${S}/hwstamp_ctl  ${D}/${bindir}
> +}

And the last bit about dependency on virtual/kernel above and passing 
KBUILD_OUTPUT=STAGING_KERNEL_DIR to the build - I have looked into what that 
does and it tries to locate the correct /usr/include/linux/net_tstamp.h just 
to see if it contains definition for HWTSTAMP_TX_ONESTEP_SYNC. But that header 
file hasn't changed in at least 5 years. Anyway, the result of the check is to 
pass some defines to their build. I ended up just short-cutting the check and 
avoid unnecessary dependency on virtual/kernel:

EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH} \
                EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME \
                -DHAVE_ONESTEP_SYNC'"

Should I submit a patch to fix the above issues?

-- 
Denys

