Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QFhYe-0000Fz-Sh for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 08:52:09 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QFhWE-0003gS-2k for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 08:49:38 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 08:49:38 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 08:49:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 29 Apr 2011 08:49:24 +0200
Message-ID: <ipdn1k$d51$1@dough.gmane.org>
References: <1304033478-22959-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304033478-22959-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 1/3] proxy-libintl_20100902.bb: Specify -fPIC in CFLAGS
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
X-List-Received-Date: Fri, 29 Apr 2011 06:52:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-04-11 01:31, raj.khem@gmail.com wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Some architectures like mips become upset if you
> try to link non-pic libraries to shared objects
> some generate pic by default so it does not matter
> Specifying -fPIC on commandline should make all happy
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

This needs a PR bump, since it changes the output.

regards,

Koen

> ---
>  .../proxy-libintl/proxy-libintl_20100902.bb        |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
> index 7c433bd..548e656 100644
> --- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
> +++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
> @@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356
>  S = "${WORKDIR}"
>  FILES_${PN}-dev = "${includedir}/libintl.h ${libdir}/libintl.a"
>  
> -CFLAGS_append = " -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
> +CFLAGS_append = " -fPIC -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
>  do_compile() {

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNul90MkyGM64RGpERAryIAKCUVh3wc0iPwSJGc9gXPC8qrhNaDACeLsX3
64BJOcqERBPwYoesfm+2bgY=
=OVMA
-----END PGP SIGNATURE-----



