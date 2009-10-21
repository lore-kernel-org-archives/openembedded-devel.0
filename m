Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N0ber-00011m-HP for openembedded-devel@lists.openembedded.org;
	Wed, 21 Oct 2009 15:55:24 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N0bZi-0006Nu-1N
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Oct 2009 15:50:02 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2009 15:50:02 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2009 15:50:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 21 Oct 2009 15:42:18 +0200
Message-ID: <hbn33r$jae$1@ger.gmane.org>
References: <1256113695-18662-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1256113695-18662-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] linux-bug: added extra staging, bumped SRCREV
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
X-List-Received-Date: Wed, 21 Oct 2009 13:55:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-10-09 10:28, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>

Acked-by: Koen Kooi <koen@openembedded.org>


>
> Signed-off-by: Marcin Juszkiewicz<marcin@buglabs.net>
> ---
>   recipes/linux/linux-bug_2.6.27.2.bb |   13 ++++++++++---
>   1 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/linux/linux-bug_2.6.27.2.bb b/recipes/linux/linux-bug_2.6.27.2.bb
> index b5899a7..8c83f9a 100644
> --- a/recipes/linux/linux-bug_2.6.27.2.bb
> +++ b/recipes/linux/linux-bug_2.6.27.2.bb
> @@ -2,12 +2,12 @@ DESCRIPTION = "Linux kernel for bug"
>
>   PV_append = "+svnr${SRCREV}"
>   KV = "2.6.27.2"
> -PR = "r28"
> +PR = "r29"
>
>   COMPATIBLE_MACHINE = "bug"
>
>   SVN_PRJ = "bug-linux-${KV}"
> -SRCREV = "10017"
> +SRCREV = "10199"
>
>   SRC_URI = "svn://svn.buglabs.net/bug/branches/R1.4/qa;module=${SVN_PRJ};proto=svn \
>              file://defconfig \
> @@ -21,10 +21,17 @@ UBOOT_ENTRYPOINT = "0x80008000"
>   require linux.inc
>
>   do_install_append() {
> -#        install -m 0644 arch/${ARCH}/boot/uImage ${D}/${KERNEL_IMAGEDEST}/uImage-${KERNEL_VERSION}
>           cd ${D}/${KERNEL_IMAGEDEST}&&  ln -sf uImage-${KERNEL_VERSION} uImage
>   }
>
> +do_stage_append() {
> +	cp -fR arch/arm/include/asm/* ${STAGING_KERNEL_DIR}/include/asm/
> +	if [ ! -e ${STAGING_KERNEL_DIR}/include/mach ]; then
> +		mkdir ${STAGING_KERNEL_DIR}/include/mach
> +	fi
> +	cp -fR arch/arm/plat-mxc/include/mach/* ${STAGING_KERNEL_DIR}/include/mach/
> +}
> +
>   FILESDIR = "${WORKDIR}"
>   FILES_kernel-image += "${KERNEL_IMAGEDEST}/uImage*"
>




