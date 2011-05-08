Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJ8wO-0007uI-Vz for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 20:42:53 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJ8tg-0006l9-US for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 20:40:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 20:40:04 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 20:40:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 08 May 2011 20:36:18 +0200
Message-ID: <iq6nr2$ppo$1@dough.gmane.org>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
	<1304872895-21596-8-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304872895-21596-8-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH v3 08/11] libinih: add git recipe
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
X-List-Received-Date: Sun, 08 May 2011 18:42:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-05-11 18:41, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-support/inih/libinih_git.bb |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/inih/libinih_git.bb
> 
> diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
> new file mode 100644
> index 0000000..1dc2059
> --- /dev/null
> +++ b/meta-oe/recipes-support/inih/libinih_git.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "C and C++ INI Library"
> +HOMEPAGE = "http://code.google.com/p/inih/"
> +PRIORITY = "optional"
> +PV = "0.0+gitr${SRCPV}"
> +PKGV = "${GITPKGVTAG}"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
> +
> +PR = "r0"
> +
> +# The github repository provides a cmake and pkg-config integration
> +SRCREV = "715cb4dc3d56714d7d53dcd94ae4b41c950119a7"
> +SRC_URI = "git://github.com/OSSystems/inih.git;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit gitpkgv cmake
> +
> +# We don't have libinih since we only have static libraries
> +RDEPENDS_${PN}-dev = ""

ALLOW_EMPTY_${PN} = "1" would be better, since that doesn't break the
automatic depchain code
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNxuKiMkyGM64RGpERAgjbAKCJHErAGUNq7yOnjj5u/Qp6YfpKIgCdFu6B
qnXoflMuORS6H6e3K+R1sMw=
=KvqY
-----END PGP SIGNATURE-----



