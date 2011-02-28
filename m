Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pu4cn-0000Nq-Tx for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 16:03:01 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pu4bP-0007OW-6e for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 16:01:35 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 16:01:35 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 16:01:35 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 28 Feb 2011 16:01:24 +0100
Message-ID: <ikgdc4$j5n$1@dough.gmane.org>
References: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
	<1298899606-9139-2-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1298899606-9139-2-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/2] conf/bitbake.conf: add DISTRO_ARCH and MACHINE_DISTRO_ARCH
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
X-List-Received-Date: Mon, 28 Feb 2011 15:03:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

What does it do and why is it needed?

On 28-02-11 14:26, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  conf/bitbake.conf |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 1002c01..b018f08 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -132,7 +132,9 @@ PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
>  PACKAGE_EXTRA_ARCHS ?= ""
>  MACHINE_ARCH = "${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE}', \
>                                     'BASE_PACKAGE_ARCH')}"
> -PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}"
> +DISTRO_ARCH = "${TARGET_ARCH}-${DISTRO}"
> +MACHINE_DISTRO_ARCH = "${MACHINE_ARCH}-${DISTRO}"
> +PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${DISTRO_ARCH} ${MACHINE_DISTRO_ARCH} ${MACHINE}"
>  
>  MULTIMACH_ARCH = "${PACKAGE_ARCH}"
>  MULTIMACH_TARGET_SYS = "${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNa7jDMkyGM64RGpERAlXgAJsF7DlPyuZo8XyGq0U5TOYt3bLxhQCgtsS5
rfWBVwGPaGgjvc84OCecAqw=
=HD2X
-----END PGP SIGNATURE-----



