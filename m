Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Srp0f-0002WS-Bd for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 13:35:09 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sroph-0004bx-84 for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 13:23:49 +0200
Received: from 92.69.204.68 ([92.69.204.68])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 13:23:49 +0200
Received: from koen by 92.69.204.68 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 13:23:49 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 19 Jul 2012 13:23:33 +0200
Message-ID: <ju8qnl$47e$1@dough.gmane.org>
References: <1342696316-8537-1-git-send-email-Martin.Jansa@gmail.com>
	<1342696316-8537-2-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 92.69.204.68
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <1342696316-8537-2-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-oe][RFC 2/2] e/efl/gpe.bbclass: convert tabs to 4 spaces also in bash tasks
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
X-List-Received-Date: Thu, 19 Jul 2012 11:35:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Shell tasks use tabs according to the styleguide

Op 19-07-12 13:11, Martin Jansa schreef:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> meta-efl/classes/e.bbclass   |    4 ++-- meta-efl/classes/efl.bbclass |
> 8 ++++---- meta-oe/classes/gpe.bbclass  |    4 ++-- 3 files changed, 8
> insertions(+), 8 deletions(-)
> 
> diff --git a/meta-efl/classes/e.bbclass b/meta-efl/classes/e.bbclass 
> index 375f914..4bcc2bc 100644 --- a/meta-efl/classes/e.bbclass +++
> b/meta-efl/classes/e.bbclass @@ -3,12 +3,12 @@ SECTION = "e/apps" inherit
> e-base autotools pkgconfig binconfig
> 
> do_prepsources () { -	make clean distclean || true +    make clean
> distclean || true } addtask prepsources after do_patch before
> do_configure
> 
> do_configure_append() { -	find ${S} -name Makefile | xargs sed -i
> s:'-I$(includedir)':'-I.':g +    find ${S} -name Makefile | xargs sed -i
> s:'-I$(includedir)':'-I.':g }
> 
> export CURL_CONFIG = "${STAGING_BINDIR_CROSS}/curl-config" diff --git
> a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass index
> 792343b..7cf8556 100644 --- a/meta-efl/classes/efl.bbclass +++
> b/meta-efl/classes/efl.bbclass @@ -10,13 +10,13 @@ inherit e-base
> autotools # evas-native looks at this var, so keep it
> 
> do_configure_prepend() { -	autopoint || touch config.rpath +    autopoint
> || touch config.rpath }
> 
> do_install_prepend () { -	for i in `find ${S}/ -name "*.pc" -type f` ; do
> \ -		sed -i -e 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e
> 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e
> 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i -	done +    for i in
> `find ${S}/ -name "*.pc" -type f` ; do \ +        sed -i -e
> 's:-L${STAGING_LIBDIR}:-L\$\{libdir\}:g' -e
> 's:-I${STAGING_LIBDIR}:-I\$\{libdir\}:g' -e
> 's:-I${STAGING_INCDIR}:-I\$\{includedir\}:g' $i +    done }
> 
> PACKAGES =+ "${PN}-themes" diff --git a/meta-oe/classes/gpe.bbclass
> b/meta-oe/classes/gpe.bbclass index 7e042ee..2adbd48 100644 ---
> a/meta-oe/classes/gpe.bbclass +++ b/meta-oe/classes/gpe.bbclass @@ -7,11
> +7,11 @@ SECTION ?= "gpe" inherit gettext
> 
> gpe_do_compile() { -	oe_runmake PREFIX=${prefix} +    oe_runmake
> PREFIX=${prefix} }
> 
> gpe_do_install() { -	oe_runmake PREFIX=${prefix} DESTDIR=${D} install +
> oe_runmake PREFIX=${prefix} DESTDIR=${D} install }
> 
> EXPORT_FUNCTIONS do_compile do_install

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQB+41MkyGM64RGpERAlLUAJ46P5hcIkcHbqacI66sydAr4clhggCeO3Uo
Fnz5VUBx1366gOr5wCK+gXs=
=kFmn
-----END PGP SIGNATURE-----



