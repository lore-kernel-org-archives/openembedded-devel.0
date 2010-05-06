Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9ybN-0002UP-M2 for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 12:47:19 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9yXh-0006Ee-2v for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 12:42:57 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 12:42:57 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 12:42:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 06 May 2010 12:42:47 +0200
Message-ID: <hru6f7$4qk$1@dough.gmane.org>
References: <4BE185C7.50305@dresearch.de>
	<1273140949-14699-1-git-send-email-sledz@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <1273140949-14699-1-git-send-email-sledz@dresearch.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: use linux-libc-headers 2.6.24 for hipox machine
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
X-List-Received-Date: Thu, 06 May 2010 10:47:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-05-10 12:15, Steffen Sledz wrote:
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  conf/distro/angstrom-2008.1.conf |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
> index 1df0c0b..760166b 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -81,7 +81,8 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
>  #KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
>  
>  #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
> -PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
> +PREFERRED_VERSION_linux-libc-headers       ?= "2.6.31"
> +PREFERRED_VERSION_linux-libc-headers_hipox ?= "2.6.24"
>  
>  #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
>  PREFERRED_VERSION_glibc 		?= "2.9"

NACK, that creates undefined behaviour for multimachine builds.

Also, please remove the legacy staging behaviour from the
linux-libc-headers recipe you just pushed.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL4p0mMkyGM64RGpERAug1AJ9uEHk3KtRBXbILlfAM9IKV8kPC2ACfQHF4
p8l5iA3z+D1L5x+17Yq/u+Y=
=rjzW
-----END PGP SIGNATURE-----



