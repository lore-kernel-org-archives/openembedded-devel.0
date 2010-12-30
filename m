Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PYMPZ-0005uE-6o
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 18:35:37 +0100
Received: by iwn8 with SMTP id 8so11522952iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 09:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gFy9MpkigI/LKVgdyK4n2MyqInpTOpWtbtD0LxsnDmk=;
	b=tkKd4E0OTr6s+YTVshRdqPg79eLl2Y7HJmyjv2gNJUv1cInHdC0zunNw4Tas4gwW7S
	7Froh5azxwMlbeUyn6OX1f4qXl/bo3N4OpfXs4u8ovDj8TFZCtOtYrEgLgEBsHCaunYv
	CIpAF14xVYWpwmeZU6HvSr6LuAiwWQVYAScqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ERqqou5mKKMDDTw6GDcg5udsg0wjLjPu88oH2wJbFMjMZbqPTAO5e6uq5OoDzBWobY
	TkH6fLFmZLyEEcVClmh8xvPgzD2bGq4CIsgQxlOt86/JUqaWlzB4dvgkX9NnlIYyCXjS
	t1ycYLW+dGu4pri3b0FzAHD+8QWuC0JYPgbBw=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr86036ibb.57.1293730514284; Thu,
	30 Dec 2010 09:35:14 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Thu, 30 Dec 2010 09:35:14 -0800 (PST)
In-Reply-To: <1293660478-3080-1-git-send-email-khimov@altell.ru>
References: <201012292340.40618.roman@khimov.ru>
	<1293660478-3080-1-git-send-email-khimov@altell.ru>
Date: Thu, 30 Dec 2010 18:35:14 +0100
Message-ID: <AANLkTinYyaiQYK_4S+gR3fJHcgndV-JTWJsrzsSRyNc1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] perl 5.10.1: fix archlib(exp) and privlib(exp) vars in target configs
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
X-List-Received-Date: Thu, 30 Dec 2010 17:35:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/29 Roman I Khimov <khimov@altell.ru>:
> These vars can be used to derive build flags for perl modules and thus sh=
ould
> point to build-time directories in staged configs.
>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Tested this patch and the next one together. They solve my libdatetime prob=
lem.
Thanks alot!

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/perl/perl_5.10.1.bb | =A0 =A09 ++++++++-
> =A01 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
> index d8c374b..4e6bc33 100644
> --- a/recipes/perl/perl_5.10.1.bb
> +++ b/recipes/perl/perl_5.10.1.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0PRIORITY =3D "optional"
> =A0# We need gnugrep (for -I)
> =A0DEPENDS =3D "virtual/db perl-native grep-native"
> -PR =3D "r18"
> +PR =3D "r19"
>
> =A0# 5.10.1 has Module::Build built-in
> =A0PROVIDES +=3D "libmodule-build-perl"
> @@ -224,6 +224,13 @@ do_stage() {
> =A0 =A0 =A0 =A0 install config.sh ${STAGING_LIBDIR}/perl/
> =A0 =A0 =A0 =A0 # target configuration, used by native perl when cross-co=
mpiling
> =A0 =A0 =A0 =A0 install lib/Config_heavy.pl ${STAGING_LIBDIR_NATIVE}/perl=
/${PV}/Config_heavy-${TARGET_SYS}.pl
> + =A0 =A0 =A0 sed -r -i \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,^(archlib=3D).*$,\1'${STAGING_LIBDIR}=
/perl/${PV}'," \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,^(archlibexp=3D).*$,\1'${STAGING_LIBD=
IR}/perl/${PV}'," \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,^(privlib=3D).*$,\1'${STAGING_DATADIR=
}/perl/${PV}'," \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,^(privlibexp=3D).*$,\1'${STAGING_DATA=
DIR}/perl/${PV}'," \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${STAGING_LIBDIR_NATIVE}/perl/${PV}/Config_=
heavy-${TARGET_SYS}.pl \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${STAGING_LIBDIR}/perl/config.sh
> =A0 =A0 =A0 =A0# target configuration
> =A0 =A0 =A0 =A0 install lib/Config.pm =A0 =A0 =A0 ${STAGING_LIBDIR}/perl/=
${PV}/
> =A0 =A0 =A0 =A0install lib/ExtUtils/typemap ${STAGING_DATADIR}/perl/${PV}=
/ExtUtils/
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


