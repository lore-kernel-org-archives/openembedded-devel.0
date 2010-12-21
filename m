Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PV5B8-00060A-4g for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 17:35:10 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PV5B2-0000Mi-JN for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 17:35:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 17:35:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 17:35:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Dec 2010 17:26:00 +0100
Message-ID: <ieqkeo$8ql$2@dough.gmane.org>
References: <20101221133550.GI3282@jama>
	<1292940593-22743-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1292940593-22743-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] talloc: install .so links
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
X-List-Received-Date: Tue, 21 Dec 2010 16:35:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>

On 21-12-10 15:09, Martin Jansa wrote:
> * otherwise mesa finds talloc.pc, but doesn't link to libtalloc.so.2 in the end
> ---
>  recipes/talloc/talloc_2.0.1.bb |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/talloc/talloc_2.0.1.bb b/recipes/talloc/talloc_2.0.1.bb
> index 9514a15..80f4b37 100644
> --- a/recipes/talloc/talloc_2.0.1.bb
> +++ b/recipes/talloc/talloc_2.0.1.bb
> @@ -10,8 +10,17 @@ SRC_URI[sha256sum] = "5b810527405f29d54f50efd78bf2c89e318f2cd8bed001f22f2a1412fd
>  
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
> +PR = "r1"
> +
>  # autoreconf doesn't work well while reconfiguring included libreplace
>  do_configure () {
>         gnu-configize
>         oe_runconf
>  }
> +
> +do_install_append() {
> +       install -d ${D}${libdir}
> +       ln -s libtalloc.so.2.0.1 ${D}${libdir}/libtalloc.so.2.0
> +       ln -s libtalloc.so.2.0 ${D}${libdir}/libtalloc.so.2
> +       ln -s libtalloc.so.2 ${D}${libdir}/libtalloc.so
> +}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNENUYMkyGM64RGpERAipoAJwO7iq3HesWj8x9o4vnW3v2aNEirACgvDn9
QaeCjBOjMtbmsD1cd+T+1P0=
=Vb7w
-----END PGP SIGNATURE-----



