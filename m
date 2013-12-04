Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 01B3A6D915
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 11:13:52 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VoAOn-0000tA-Rp for openembedded-devel@lists.openembedded.org;
	Wed, 04 Dec 2013 12:13:45 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 12:13:45 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 12:13:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 04 Dec 2013 12:15:03 +0100
Message-ID: <l7n2ol$u75$1@ger.gmane.org>
References: <1386154747-14820-1-git-send-email-patrick.patat@innotis.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1386154747-14820-1-git-send-email-patrick.patat@innotis.org>
X-Enigmail-Version: 1.6
Subject: Re: [meta-perl][PATCH] add libcrypt-openssl-rsa-perl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Dec 2013 11:13:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Patrick Patat schreef op 04-12-13 11:59:
> This recipe build cpan module Crypt-OpenSSL-RSA
> 
> Signed-off-by: Patrick Patat <patrick.patat@innotis.org> --- 
> .../libcrypt/libcrypt-openssl-rsa-perl_0.28.bb     |   23
> ++++++++++++++++++++

> 1 file changed, 23 insertions(+) create mode 100644
> meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
> 
> diff --git
> a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
> b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb new
> file mode 100644 index 0000000..3d902a3 --- /dev/null +++
> b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb @@
> -0,0 +1,23 @@ +SUMMARY = "Collection of Perl modules for working with
> shairport."

I don't think that's the correct summary.

> +SECTION = "libs" +LICENSE = "MIT" +LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>
> 
+
> +SRC_URI =
> "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz
> " + +SRC_URI[md5sum] = "86217a5036fc63779c30420b5fd84129" 
> +SRC_URI[sha256sum] =
> "5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be" + 
> +DEPENDS += "perl openssl"

'perl' should already be added by cpan.bbclass.

> + +EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR}
> -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'" + +S =
> "${WORKDIR}/Crypt-OpenSSL-RSA-${PV}" + +inherit cpan + +do_compile() { +
> export LIBC="$(find ${STAGING_DIR_TARGET}${base_libdir}/ -name
> 'libc-*.so')" +	export OTHERLDFLAGS='-Wl,-rpath' +
> cpan_do_compile +}

http://deps.cpantesters.org/?module=Crypt%3A%3AOpenSSL%3A%3ARSA;perl=latest
reports a dependency on openssl::random, so you probably need an
RDEPENDS_${PN} for that.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSnw63MkyGM64RGpERAuWfAJ0XUBxSe4MnayKTfGJVUNlaWEoDrQCggTM3
LMPrOwaSjEy3jvF67JCYpi8=
=cy5N
-----END PGP SIGNATURE-----


