Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NHbBv-0003xU-9r for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 11:51:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NHbAK-00012x-2v
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 11:50:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 11:50:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 11:50:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 07 Dec 2009 11:41:33 +0100
Message-ID: <hfim4t$osr$5@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>	<1260139496-21442-2-git-send-email-leon@sidebranch.com>	<1260139496-21442-3-git-send-email-leon@sidebranch.com>	<1260139496-21442-4-git-send-email-leon@sidebranch.com>	<1260139496-21442-5-git-send-email-leon@sidebranch.com>	<1260139496-21442-6-git-send-email-leon@sidebranch.com>	<1260139496-21442-7-git-send-email-leon@sidebranch.com>	<1260139496-21442-8-git-send-email-leon@sidebranch.com>	<1260139496-21442-9-git-send-email-leon@sidebranch.com>	<1260139496-21442-10-git-send-email-leon@sidebranch.com>	<1260139496-21442-11-git-send-email-leon@sidebranch.com>
	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1260139496-21442-12-git-send-email-leon@sidebranch.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] angstrom-2008.1.conf: Use ?= on PREFERRED_VERSION_linux-libc-headers.
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
X-List-Received-Date: Mon, 07 Dec 2009 10:51:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-12-09 23:44, Leon Woestenberg wrote:
> This allows machines/archs to override towards older kernels and
> matching headers. This was needed for nios2.
>
> Signed-off-by: Leon Woestenberg<leon@sidebranch.com>
> ---
>   conf/distro/angstrom-2008.1.conf |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
> index 51d8242..abc9a93 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -79,7 +79,7 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
>   #KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
>
>   #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
> -PREFERRED_VERSION_linux-libc-headers 	?= "2.6.31"
> +PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
>
>   #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
>   PREFERRED_VERSION_glibc 		?= "2.9"

NAK

If an arch really needs another version you need to do

PREFERRED_VERSION_linux-libc-headers_nios2 	= "2.6.other"

That way we know that it is nios that needs an older kernel. The actual 
preferred solution is to patch nios2 support into linux-libc-headers-2.6.31.

regards,

Koen



