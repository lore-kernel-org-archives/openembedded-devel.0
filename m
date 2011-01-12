Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pcx4j-0005Hi-EX
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 10:33:05 +0100
Received: by wwi17 with SMTP id 17so343180wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 01:32:34 -0800 (PST)
Received: by 10.216.205.213 with SMTP id j63mr3755590weo.60.1294824753777;
	Wed, 12 Jan 2011 01:32:33 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 7sm212716wet.24.2011.01.12.01.32.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 01:32:33 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1294823863-13419-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 12 Jan 2011 10:32:31 +0100
Message-Id: <443159FC-EE63-418A-AE65-CE7D63995448@dominion.thruhere.net>
References: <1294823863-13419-1-git-send-email-raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] eglibc: Configure based on DISTRO_FEATURES_EGLIBC
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
X-List-Received-Date: Wed, 12 Jan 2011 09:33:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jan 2011, om 10:17 heeft Khem Raj het volgende geschreven:

> * Let distros decide what features to enable if not
>  selected it will turn off all possible knobs
>=20
> * Enable all knobs for angstrom and distros based on
>  sane-toolchain
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Koen Kooi <koen@openembedded.org>

> CC: koen@dominion.thruhere.net
> CC: koansoftware@gmail.com
> ---
> conf/distro/include/eglibc.inc    |    8 +++
> recipes/eglibc/eglibc-options.inc |   89 =
+++++++++++++++++++------------------
> recipes/eglibc/eglibc.inc         |    4 +-
> 3 files changed, 55 insertions(+), 46 deletions(-)
>=20
> diff --git a/conf/distro/include/eglibc.inc =
b/conf/distro/include/eglibc.inc
> index 5115e7f..cd66442 100644
> --- a/conf/distro/include/eglibc.inc
> +++ b/conf/distro/include/eglibc.inc
> @@ -18,3 +18,11 @@ OLDEST_KERNEL ?=3D "2.4.0"
> OLDEST_KERNEL_linux-gnueabi ?=3D "2.6.16"
> OLDEST_KERNEL_sparc64 ?=3D "2.4.21"
> OLDEST_KERNEL_ppc64 ?=3D "2.4.21"
> +DISTRO_FEATURES_EGLIBC ?=3D "ipv6 backtrace big-macros bsd cxx-tests =
catgets \
> +                           charsets crypt crypt-ufc db-aliases envz =
fcvt fmtmsg \
> +                           fstab ftraverse getlogin idn inet inet-anl =
libm \
> +                           libm-big locales locale-code memusage nis =
nsswitch \
> +                           rcmd rtld-debug spawn streams sunrpc utmp =
utmpx \
> +                           wordexp posix-clang-wchar posix-regexp \
> +                           posix-regexp-glibc posix-wchar-io"
> +
> diff --git a/recipes/eglibc/eglibc-options.inc =
b/recipes/eglibc/eglibc-options.inc
> index d552bbc..5e21d3c 100644
> --- a/recipes/eglibc/eglibc-options.inc
> +++ b/recipes/eglibc/eglibc-options.inc
> @@ -1,50 +1,51 @@
> def eglibc_cfg(feature, features, tokens, cnf ):
> -        if type(tokens) =3D=3D type(""):
> -                tokens =3D [tokens]
> -        if type(features) =3D=3D type([]) and feature in features:
> -                cnf.extend([token + ' =3D n' for token in tokens])
> +	if type(tokens) =3D=3D type(""):
> +		tokens =3D [tokens]
> +	if type(features) =3D=3D type([]) and feature in features:
> +		cnf.extend([token + ' =3D y' for token in tokens])
> +	else:
> +		cnf.extend([token + ' =3D n' for token in tokens])
>=20
> # Map distro features to eglibc options settings
> def features_to_eglibc_settings(d):
>         cnf =3D ([])
> -        distro_features =3D bb.data.getVar('DISTRO_FEATURES', d, =
True).split()
> -        eglibc_cfg('noinet6',      distro_features, =
'OPTION_EGLIBC_ADVANCED_INET6', cnf)
> -        eglibc_cfg('nobacktrace',      distro_features, =
'OPTION_EGLIBC_BACKTRACE', cnf)
> -        eglibc_cfg('nobig-macros',      distro_features, =
'OPTION_EGLIBC_BIG_MACROS', cnf)
> -        eglibc_cfg('nobsd',      distro_features, =
'OPTION_EGLIBC_BSD', cnf)
> -        eglibc_cfg('nocxx-tests',      distro_features, =
'OPTION_EGLIBC_CXX_TESTS', cnf)
> -        eglibc_cfg('nocatgets',      distro_features, =
'OPTION_EGLIBC_CATGETS', cnf)
> -        eglibc_cfg('nocharsets',      distro_features, =
'OPTION_EGLIBC_CHARSETS', cnf)
> -        eglibc_cfg('nocrypt',      distro_features, =
'OPTION_EGLIBC_CRYPT', cnf)
> -        eglibc_cfg('nocrypt-ufc',      distro_features, =
'OPTION_EGLIBC_CRYPT_UFC', cnf)
> -        eglibc_cfg('nodb-aliases',      distro_features, =
'OPTION_EGLIBC_DB_ALIASES', cnf)
> -        eglibc_cfg('noenvz',      distro_features, =
'OPTION_EGLIBC_ENVZ', cnf)
> -        eglibc_cfg('nofcvt',      distro_features, =
'OPTION_EGLIBC_FCVT', cnf)
> -        eglibc_cfg('nofmtmsg',      distro_features, =
'OPTION_EGLIBC_FMTMSG', cnf)
> -        eglibc_cfg('nofstab',      distro_features, =
'OPTION_EGLIBC_FSTAB', cnf)
> -        eglibc_cfg('noftraverse',      distro_features, =
'OPTION_EGLIBC_FTRAVERSE', cnf)
> -        eglibc_cfg('nogetlogin',      distro_features, =
'OPTION_EGLIBC_GETLOGIN', cnf)
> -        eglibc_cfg('noidn',      distro_features, =
'OPTION_EGLIBC_IDN', cnf)
> -        eglibc_cfg('noinet',      distro_features, =
'OPTION_EGLIBC_INET', cnf)
> -        eglibc_cfg('noinet-anl',      distro_features, =
'OPTION_EGLIBC_INET_ANL', cnf)
> -        eglibc_cfg('nolibm',      distro_features, =
'OPTION_EGLIBC_LIBM', cnf)
> -        eglibc_cfg('nolibm-big',      distro_features, =
'OPTION_EGLIBC_LIBM_BIG', cnf)
> -        eglibc_cfg('nolocales',      distro_features, =
'OPTION_EGLIBC_LOCALES', cnf)
> -        eglibc_cfg('nolocale-code',      distro_features, =
'OPTION_EGLIBC_LOCALE_CODE', cnf)
> -        eglibc_cfg('nomemusage',      distro_features, =
'OPTION_EGLIBC_MEMUSAGE', cnf)
> -        eglibc_cfg('nonis',      distro_features, =
'OPTION_EGLIBC_NIS', cnf)
> -        eglibc_cfg('nonsswitch',      distro_features, =
'OPTION_EGLIBC_NSSWITCH', cnf)
> -        eglibc_cfg('norcmd',      distro_features, =
'OPTION_EGLIBC_RCMD', cnf)
> -        eglibc_cfg('nortld-debug',      distro_features, =
'OPTION_EGLIBC_RTLD_DEBUG', cnf)
> -        eglibc_cfg('nospawn',      distro_features, =
'OPTION_EGLIBC_SPAWN', cnf)
> -        eglibc_cfg('nostreams',      distro_features, =
'OPTION_EGLIBC_STREAMS', cnf)
> -        eglibc_cfg('nosunrpc',      distro_features, =
'OPTION_EGLIBC_SUNRPC', cnf)
> -        eglibc_cfg('noutmp',      distro_features, =
'OPTION_EGLIBC_UTMP', cnf)
> -        eglibc_cfg('noutmpx',      distro_features, =
'OPTION_EGLIBC_UTMPX', cnf)
> -        eglibc_cfg('nowordexp',      distro_features, =
'OPTION_EGLIBC_WORDEXP', cnf)
> -        eglibc_cfg('noposix-clang-wchar',      distro_features, =
'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
> -        eglibc_cfg('noposix-regexp',      distro_features, =
'OPTION_POSIX_REGEXP', cnf)
> -        eglibc_cfg('noposix-regexp-glibc',      distro_features, =
'OPTION_POSIX_REGEXP_GLIBC', cnf)
> -        eglibc_cfg('noposix-wchar-io',      distro_features, =
'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
> +        distro_features =3D bb.data.getVar('DISTRO_FEATURES_EGLIBC', =
d, True).split()
> +        eglibc_cfg('ipv6',      distro_features, =
'OPTION_EGLIBC_ADVANCED_INET6', cnf)
> +        eglibc_cfg('backtrace',      distro_features, =
'OPTION_EGLIBC_BACKTRACE', cnf)
> +        eglibc_cfg('big-macros',      distro_features, =
'OPTION_EGLIBC_BIG_MACROS', cnf)
> +        eglibc_cfg('bsd',      distro_features, 'OPTION_EGLIBC_BSD', =
cnf)
> +        eglibc_cfg('cxx-tests',      distro_features, =
'OPTION_EGLIBC_CXX_TESTS', cnf)
> +        eglibc_cfg('catgets',      distro_features, =
'OPTION_EGLIBC_CATGETS', cnf)
> +        eglibc_cfg('charsets',      distro_features, =
'OPTION_EGLIBC_CHARSETS', cnf)
> +        eglibc_cfg('crypt',      distro_features, =
'OPTION_EGLIBC_CRYPT', cnf)
> +        eglibc_cfg('crypt-ufc',      distro_features, =
'OPTION_EGLIBC_CRYPT_UFC', cnf)
> +        eglibc_cfg('db-aliases',      distro_features, =
'OPTION_EGLIBC_DB_ALIASES', cnf)
> +        eglibc_cfg('envz',      distro_features, =
'OPTION_EGLIBC_ENVZ', cnf)
> +        eglibc_cfg('fcvt',      distro_features, =
'OPTION_EGLIBC_FCVT', cnf)
> +        eglibc_cfg('fmtmsg',      distro_features, =
'OPTION_EGLIBC_FMTMSG', cnf)
> +        eglibc_cfg('fstab',      distro_features, =
'OPTION_EGLIBC_FSTAB', cnf)
> +        eglibc_cfg('ftraverse',      distro_features, =
'OPTION_EGLIBC_FTRAVERSE', cnf)
> +        eglibc_cfg('getlogin',      distro_features, =
'OPTION_EGLIBC_GETLOGIN', cnf)
> +        eglibc_cfg('idn',      distro_features, 'OPTION_EGLIBC_IDN', =
cnf)
> +        eglibc_cfg('inet',      distro_features, =
'OPTION_EGLIBC_INET', cnf)
> +        eglibc_cfg('inet-anl',      distro_features, =
'OPTION_EGLIBC_INET_ANL', cnf)
> +        eglibc_cfg('libm',      distro_features, =
'OPTION_EGLIBC_LIBM', cnf)
> +        eglibc_cfg('libm-big',      distro_features, =
'OPTION_EGLIBC_LIBM_BIG', cnf)
> +        eglibc_cfg('locales',      distro_features, =
'OPTION_EGLIBC_LOCALES', cnf)
> +        eglibc_cfg('locale-code',      distro_features, =
'OPTION_EGLIBC_LOCALE_CODE', cnf)
> +        eglibc_cfg('memusage',      distro_features, =
'OPTION_EGLIBC_MEMUSAGE', cnf)
> +        eglibc_cfg('nis',      distro_features, 'OPTION_EGLIBC_NIS', =
cnf)
> +        eglibc_cfg('nsswitch',      distro_features, =
'OPTION_EGLIBC_NSSWITCH', cnf)
> +        eglibc_cfg('rcmd',      distro_features, =
'OPTION_EGLIBC_RCMD', cnf)
> +        eglibc_cfg('rtld-debug',      distro_features, =
'OPTION_EGLIBC_RTLD_DEBUG', cnf)
> +        eglibc_cfg('spawn',      distro_features, =
'OPTION_EGLIBC_SPAWN', cnf)
> +        eglibc_cfg('streams',      distro_features, =
'OPTION_EGLIBC_STREAMS', cnf)
> +        eglibc_cfg('sunrpc',      distro_features, =
'OPTION_EGLIBC_SUNRPC', cnf)
> +        eglibc_cfg('utmp',      distro_features, =
'OPTION_EGLIBC_UTMP', cnf)
> +        eglibc_cfg('utmpx',      distro_features, =
'OPTION_EGLIBC_UTMPX', cnf)
> +        eglibc_cfg('wordexp',      distro_features, =
'OPTION_EGLIBC_WORDEXP', cnf)
> +        eglibc_cfg('posix-clang-wchar',      distro_features, =
'OPTION_POSIX_C_LANG_WIDE_CHAR', cnf)
> +        eglibc_cfg('posix-regexp',      distro_features, =
'OPTION_POSIX_REGEXP', cnf)
> +        eglibc_cfg('posix-regexp-glibc',      distro_features, =
'OPTION_POSIX_REGEXP_GLIBC', cnf)
> +        eglibc_cfg('posix-wchar-io',      distro_features, =
'OPTION_POSIX_WIDE_CHAR_DEVICE_IO', cnf)
>         return "\n".join(cnf)
> -
> diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
> index c9765dd..02209eb 100644
> --- a/recipes/eglibc/eglibc.inc
> +++ b/recipes/eglibc/eglibc.inc
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.eglibc.org/home"
> SECTION =3D "libs"
> PRIORITY =3D "required"
> LICENSE =3D "LGPL"
> -INC_PR =3D "r20"
> +INC_PR =3D "r21"
> # nptl needs unwind support in gcc, which can't be built without =
glibc.
> DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-intermediate =
linux-libc-headers"
> #this leads to circular deps, so lets not add it yet
> @@ -44,5 +44,5 @@ do_move_ports() {
> }
> OE_FEATURES :=3D "${@features_to_eglibc_settings(d)}"
> do_configure_prepend() {
> -	echo '${OE_FEATURES}' > ${S}/option-groups.config
> +	echo '${OE_FEATURES}' > ${B}/option-groups.config
> }
> --=20
> 1.7.2.3
>=20



