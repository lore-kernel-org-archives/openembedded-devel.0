Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QcXml-0005GG-Uo for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 09:05:08 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QcXj5-0003aD-U1 for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 09:01:19 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 09:01:19 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 09:01:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 01 Jul 2011 09:01:06 +0200
Message-ID: <iujrbi$agn$1@dough.gmane.org>
References: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1309498698-13369-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] systemd_git.bb: Alias mkostemp() to mkstemp() for uclibc targets
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
X-List-Received-Date: Fri, 01 Jul 2011 07:05:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thanks, both are in

On 01-07-11 07:38, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../systemd/systemd/paper-over-mkostemp.patch      |   19 +++++++++++++++++++
>  meta-oe/recipes-core/systemd/systemd_git.bb        |    3 ++-
>  2 files changed, 21 insertions(+), 1 deletions(-)
>  create mode 100644 meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
> 
> diff --git a/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
> new file mode 100644
> index 0000000..ca10440
> --- /dev/null
> +++ b/meta-oe/recipes-core/systemd/systemd/paper-over-mkostemp.patch
> @@ -0,0 +1,19 @@
> +uclibc does not have mkostemp() so we redefine it to use mkstemp()
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: git/src/macro.h
> +===================================================================
> +--- git.orig/src/macro.h	2011-06-30 10:33:53.000000000 -0700
> ++++ git/src/macro.h	2011-06-30 15:07:28.285270006 -0700
> +@@ -27,6 +27,10 @@
> + #include <sys/uio.h>
> + #include <inttypes.h>
> + 
> ++#ifdef __UCLIBC__
> ++/* uclibc does not implement mkostemp GNU extention */
> ++#define mkostemp(x,y) mkstemp(x)
> ++#endif
> + #define _printf_attr_(a,b) __attribute__ ((format (printf, a, b)))
> + #define _sentinel_ __attribute__ ((sentinel))
> + #define _noreturn_ __attribute__((noreturn))
> diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
> index 2a313e0..c750b2f 100644
> --- a/meta-oe/recipes-core/systemd/systemd_git.bb
> +++ b/meta-oe/recipes-core/systemd/systemd_git.bb
> @@ -15,7 +15,7 @@ inherit gitpkgv
>  PKGV = "v${GITPKGVTAG}"
>  
>  PV = "git"
> -PR = "r3"
> +PR = "r4"
>  
>  inherit autotools vala
>  
> @@ -23,6 +23,7 @@ SRCREV = "8585357a0e5e9f4d56e999d7cd1a73e77ae0eb80"
>  
>  SRC_URI = "git://anongit.freedesktop.org/systemd;protocol=git \
>             file://0001-systemd-disable-xml-file-stuff-and-introspection.patch \
> +           file://paper-over-mkostemp.patch \
>            "
>  
>  S = "${WORKDIR}/git"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFODXCyMkyGM64RGpERAs2xAJkBX+3ccJsW4y9osQSYFq5shzC2LACfe6IX
RN9FH3u/dVImKyDh794PCfg=
=SyuQ
-----END PGP SIGNATURE-----



