Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QDXpy-0007Ra-2K for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 10:05:06 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QDXnd-0001PK-JT for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 10:02:41 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2011 10:02:41 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2011 10:02:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 23 Apr 2011 10:02:26 +0200
Message-ID: <iou12i$88c$1@dough.gmane.org>
References: <1303134465.3910.63.camel@mattotaupa>	<1303134640.3910.67.camel@mattotaupa>	<4DAD7297.2030606@opendreambox.org>	<1303506946.4155.81.camel@mattotaupa>	<AF97BCF4-CD32-4069-BB81-FECAC104F6D9@dominion.thruhere.net>
	<1303509611.4155.111.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1303509611.4155.111.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [RFC] [PATCH 2/2] pkgconfig: add git version
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
X-List-Received-Date: Sat, 23 Apr 2011 08:05:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-04-11 00:00, Paul Menzel wrote:
> Date: Sun, 17 Apr 2011 19:19:58 +0200
> 
> 1. The revision is close to the upcoming release of pkg-config 0.26. [1]
> 2. The patch `sysrootfix.patch` has been merged upstream [2].
> 3. No embedded GLib is shipped anymore [3]. Therefore drop patches `autofoo.patch` and `glibconfig-sysdefs.h`.
> 
> The patch is tested using the following configuration
> 
> 	Build Configuration:
> 	BB_VERSION        = "1.12.0"
> 	METADATA_BRANCH   = "pkg-config"
> 	METADATA_REVISION = "d4ae0c5"
> 	TARGET_ARCH       = "arm"
> 	TARGET_OS         = "linux-uclibceabi"
> 	MACHINE           = "beagleboard"
> 	DISTRO            = "minimal-uclibc"
> 	DISTRO_VERSION    = "dev-snapshot-20110417"
> 	TARGET_FPU        = "hard"
> 
> and `angstrom-2010.x` and `minimal` too.
> 
> [1] http://lists.freedesktop.org/archives/pkg-config/2011-April/000720.html
> [2] http://cgit.freedesktop.org/pkg-config/commit/?id=66d49f1375fec838bcd301bb4ca2ef76cee0e47c
> [3] http://cgit.freedesktop.org/pkg-config/commit/?id=99964eddb5935173fcedfc793e762d7dc7d01bba
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> v2: change `PV` from `0.26` to `0.25+0.26` to ensure a sane upgrade path
> 
> 1. How can this recipe used also for the native recipe?
> 2. What is `pkg-config-sdk` used for?
> ---
>  recipes/pkgconfig/pkgconfig_git.bb |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/pkgconfig/pkgconfig_git.bb
> 
> diff --git a/recipes/pkgconfig/pkgconfig_git.bb b/recipes/pkgconfig/pkgconfig_git.bb
> new file mode 100644
> index 0000000..39a5033
> --- /dev/null
> +++ b/recipes/pkgconfig/pkgconfig_git.bb
> @@ -0,0 +1,10 @@
> +require ${PN}.inc
> +
> +SRCREV = "7850aeb03a54a15d07b6c243b61033cd379c39d7"
> +PV = "0.25+0.26"
> +PR = "${INC_PR}.0"
> +PR_append = "+gitr${SRCPV}"
> +
> +SRC_URI = "git://anongit.freedesktop.org/pkg-config;protocol=git"
> +
> +S = "${WORKDIR}/git"
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNsoeSMkyGM64RGpERAveXAKC3iP++G8EZfKoge8kxx2oWr6aYNACeIPIf
UAEnH0MfXgLlRJrGE5FtN00=
=hiyJ
-----END PGP SIGNATURE-----



