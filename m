Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVKAA-0002N3-KW for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 09:35:10 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVKA5-00056C-3A for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 09:35:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 09:35:05 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 09:35:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Dec 2010 09:32:58 +0100
Message-ID: <iesd3q$kf4$1@dough.gmane.org>
References: <1292999142-28338-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1292999142-28338-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] sane-toolchain.inc: FEED_ARCH should be prepended to OVERRIDES
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
X-List-Received-Date: Wed, 22 Dec 2010 08:35:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-12-10 07:25, Khem Raj wrote:
> Currently it ends up after local override and hence appears first in FILESPATH
> and for buiding uclibc_git.bb on qemuarm it picks wrong uClibc.machine file from
> uclibc-git/armv5te where as it should have picked from uclibc-git/qemuarm
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/distro/include/sane-toolchain.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
> index 6802eb2..f5ca22b 100644
> --- a/conf/distro/include/sane-toolchain.inc
> +++ b/conf/distro/include/sane-toolchain.inc
> @@ -75,7 +75,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
>  # Add FEED_ARCH to the overrides list so that we can override the
>  # ARM_INSTRUCTION_SET like below
>  
> -OVERRIDES .= ":${FEED_ARCH}"
> +OVERRIDES =. "${FEED_ARCH}:"
>  
>  # ARM920T and up can use thumb mode to decrease binary size at the expense of speed
>  # (the complete story is a bit more nuanced due to cache starvation)

Shouldn't that be BASE_PACKAGE_ARCH nowadays?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNEbe6MkyGM64RGpERAnMHAJ9x+kBJeouJPeVMJxQlgWNzTK05sACfSFur
ckz3MaEHqpx3h9rPdo9pKn8=
=xnMX
-----END PGP SIGNATURE-----



