Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QcD3V-0003eZ-Kk for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 10:57:01 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QcCzs-000447-Ik for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 10:53:16 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 10:53:16 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2011 10:53:16 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 30 Jun 2011 10:53:03 +0200
Message-ID: <iuhdhf$k68$1@dough.gmane.org>
References: <1309365186-10742-1-git-send-email-j-lance1@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1309365186-10742-1-git-send-email-j-lance1@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH v2 1/1] am-benchmarks: Remove platform dependencies
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
X-List-Received-Date: Thu, 30 Jun 2011 08:57:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-06-11 18:33, Jeff Lance wrote:
> * Remove platform dependencies and use architecture dependencies instead
> * Use OE BASE_PACKAGE_ARCH to determine architecture
> * Update the SRCREV to revision 66
> * Update the recipe revision to 1.3
> * Removed INSANE_SKIP
> NOTE - architecture dependency can be removed once CFLAGS can be passed into CCSv5 project makefile
> 
> Signed-off-by: Jeff Lance <j-lance1@ti.com>

Much better, thanks!

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> Updated in version 2:
>   Removed INSANE_SKIP directive
>   updated SRCREV from 65 to 66
>   used find-copies-harder to show differences with previous recipe
> --
>  recipes/ti/am-benchmarks_1.3.bb |   33 +++++++++++++++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/ti/am-benchmarks_1.3.bb
> 
> diff --git a/recipes/ti/am-benchmarks_1.3.bb b/recipes/ti/am-benchmarks_1.3.bb
> new file mode 100644
> index 0000000..8ac9b74
> --- /dev/null
> +++ b/recipes/ti/am-benchmarks_1.3.bb
> @@ -0,0 +1,33 @@
> +#NOTE: This package is currently only supported for the Angstrom
> +#      distribution.  Other distributions and toolchains may or
> +#      may not work.
> +
> +DESCRIPTION = "AM Benchmarks"
> +HOMEPAGE = "https://gforge.ti.com/gf/project/am_benchmarks/"
> +LICENSE = "BSD"
> +SECTION = "system"
> +PRIORITY = "optional"
> +
> +SRCREV = "66"
> +PR = "r2+svnr${SRCPV}"
> +
> +SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
> +
> +S = "${WORKDIR}/trunk"
> +
> +do_configure() {
> +        sed -i -e 's|LIBS :=|LIBS := ${LDFLAGS} |' Release/objects.mk
> +}
> +
> +do_compile() {
> +	# don't build debug version
> +	touch debug
> +	export CROSS_COMPILE=${TARGET_PREFIX}
> +	export ARCH=${BASE_PACKAGE_ARCH}
> +	make release 
> +}
> +
> +do_install() {
> +	export ARCH=${BASE_PACKAGE_ARCH}
> +	make DESTDIR=${D} install
> +}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFODDlvMkyGM64RGpERAkG8AJ4nj8TWYoY89u9XJHPiw13adfgeGACgp69I
UxVJuBlADDqibDEyEAUuBcE=
=yCEc
-----END PGP SIGNATURE-----



