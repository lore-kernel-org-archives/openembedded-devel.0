Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N0adK-00055o-QD
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 14:49:46 +0200
Received: (qmail 19898 invoked by uid 1003); 21 Oct 2009 12:48:39 -0000
Received: from localhost (HELO ?192.168.1.194?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 21 Oct 2009 12:48:39 -0000
Message-ID: <4ADF0326.8010805@balister.org>
Date: Wed, 21 Oct 2009 08:48:38 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1256113695-18662-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1256113695-18662-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
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
X-List-Received-Date: Wed, 21 Oct 2009 12:49:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Philip Balister <philip@balister.org>

On 10/21/2009 04:28 AM, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>
>
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


