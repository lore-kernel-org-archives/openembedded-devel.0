Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pcwce-0001up-77
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 10:04:04 +0100
Received: by wwi17 with SMTP id 17so321969wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 01:03:32 -0800 (PST)
Received: by 10.227.136.202 with SMTP id s10mr660394wbt.114.1294823012655;
	Wed, 12 Jan 2011 01:03:32 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 11sm301654wbi.6.2011.01.12.01.03.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 01:03:32 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1294822095-10559-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 12 Jan 2011 10:03:31 +0100
Message-Id: <BA7CD77F-CB74-4639-B887-413AA7B873D8@dominion.thruhere.net>
References: <1294822095-10559-1-git-send-email-raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: Configure based on DISTRO_FEATURES_EGLIBC
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
X-List-Received-Date: Wed, 12 Jan 2011 09:04:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jan 2011, om 09:48 heeft Khem Raj het volgende geschreven:

> * Let distros decide what features to enable if not
>  selected it will turn off all possible knobs
>=20
> * Enable all knobs for angstrom and distros based on
>  sane-toolchain
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC: k.kooi@student.utwente.nl

That email address will stop to exist soon :)

> CC: koansoftware@gmail.com
> ---
> conf/distro/include/angstrom-eglibc.inc       |    8 ++-
> conf/distro/include/sane-toolchain-eglibc.inc |    8 ++
> recipes/eglibc/eglibc-options.inc             |   89 =
+++++++++++++------------
> recipes/eglibc/eglibc.inc                     |    4 +-
> 4 files changed, 62 insertions(+), 47 deletions(-)
>=20
> diff --git a/conf/distro/include/angstrom-eglibc.inc =
b/conf/distro/include/angstrom-eglibc.inc
> index f0ef802..1e3b971 100644
> --- a/conf/distro/include/angstrom-eglibc.inc
> +++ b/conf/distro/include/angstrom-eglibc.inc
> @@ -26,4 +26,10 @@ BUILD_OPTIMIZATION_sparc =3D "-O2"
> TARGET_LINK_HASH_STYLE =3D =
"${@['-Wl,--hash-style=3Dgnu',''][bb.data.getVar('TARGET_ARCH',d,1) in =
['mips', 'mipsel', 'mips64', 'mips64el']]}"
>=20
> CXXFLAGS +=3D "-fvisibility-inlines-hidden"
> -
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

Can we double-soft assign (??=3D) it in eglibc.inc as well?

regards,

Koen=


