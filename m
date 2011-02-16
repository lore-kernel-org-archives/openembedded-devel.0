Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ppc5j-0003ve-KH
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 08:46:29 +0100
Received: by iwn8 with SMTP id 8so1016766iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 23:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=/bkcJu1W6EI7A+g1fjfzpOIwIcrm9pqnULlyxYZZkzE=;
	b=dTlTMoQsEvqWmwgcj8kXyuyxbTP2sVGeaQpFLurIbQAOMT8V/+egMijHQeGYMlY2m4
	PuuJTQzEoBAUIlt8NhR5eq6nSBpakvsZMHNuVa0jOCXbmKyUbZq553HEb9jwB+7DJ/KX
	sYq36EjVIMgATqzli8jUW9qLChAJbylFp8MMA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YwrokXqVexLhqdjjrpDueAB3ZQdwDavwshyXpLGrWBj3JE8BjfAHaYXg42Q+rmePkC
	G0ZFinN3B5n85tt4OzdZh9lEMWFb4dcqrhknGSYM+vrhn+DUx5TeuSzOlqL0zOsUqf4X
	ub4kcMTOsyPOM1nDBymfTU2nyzDS/pVTQd/WU=
MIME-Version: 1.0
Received: by 10.231.35.200 with SMTP id q8mr192697ibd.147.1297842316188; Tue,
	15 Feb 2011 23:45:16 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Tue, 15 Feb 2011 23:45:16 -0800 (PST)
In-Reply-To: <AANLkTimSjWURf8gMrVZGd==xCH3jnWEG_=G8EMfsdbW1@mail.gmail.com>
References: <AANLkTimSjWURf8gMrVZGd==xCH3jnWEG_=G8EMfsdbW1@mail.gmail.com>
Date: Wed, 16 Feb 2011 08:45:16 +0100
Message-ID: <AANLkTimPz8ji6Lo-Yh2DmRUc0=A-EwePxre6GiTss2=V@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Pull request from O.S. Systems tree
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
X-List-Received-Date: Wed, 16 Feb 2011 07:46:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Otavio, thanks for your contributions.

One remark:
- what about going to a newer version of cups. i seem to recall
meta-oe or poky has 1.4.6

And one request (or maybe discussion point for the community).
Would it be possible to post patches. That makes it much easier to review t=
hem.

(alternately maybe links to web browsable patches would be nice).
pull requests are somewhat harder to review (at least for me)

Frans

2011/2/15 Otavio Salvador <otavio@ossystems.com.br>:
> Hello,
>
> We have been working forward to get our required changes into OE and
> currently following ones are queued up for merging. Those fix/improve
> the issues we found while working in our layer and have been in use
> for some time without problems.
>
> The following changes since commit 5f3bc5b423e00089e97c7a1657760f67bf20aa=
34:
>
> =A0spojegui: bump SRCREV and remove upstream applied desktop file fixes
> for QA issues (2011-02-15 16:57:05 +0100)
>
> are available in the git repository at:
> =A0git://projetos.ossystems.com.br/git/users/otavio/org.openembedded.dev.=
git
> master
>
> Otavio Salvador (13):
> =A0 =A0 =A0xkeyboard-config: avoid recipe code duplication and depends on
> intltool-native
> =A0 =A0 =A0python-dbus: update to 0.83.2 and fix rpath to use absolute pa=
th
> =A0 =A0 =A0cups: drop unused versions
> =A0 =A0 =A0cups: merge cups.inc into cups 1.2.12 recipe
> =A0 =A0 =A0cups: merge cups14.inc into cups 1.4.4 recipe
> =A0 =A0 =A0cups: add textonly filter and split packages
> =A0 =A0 =A0libinih: add
> =A0 =A0 =A0cdparanoia (svn): use build variables to fix packaging when
> using empty prefix
> =A0 =A0 =A0sdk.bbclass: cache ${libdir} as ${target_libdir}
> =A0 =A0 =A0qt4-tools-sdk: use host include headers for dbus
> =A0 =A0 =A0cmake: drop 2.6.4 as it is not used by any distro
> =A0 =A0 =A0cmake: update from 2.8.2 to 2.8.3
> =A0 =A0 =A0distro/micro.conf: drop exec_prefix_native since it is unused
>
> =A0classes/sdk.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A01 +
> =A0conf/distro/micro.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A01 -
> =A0recipes/cdparanoia/cdparanoia_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A08 +-
> =A0.../fix_fortify_source_compilation.patch =A0 =A0 =A0 =A0 =A0 | =A0 32 =
-----
> =A0.../dont-run-cross-binaries.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A00
> =A0recipes/cmake/cmake-native_2.6.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 10 --
> =A0...cmake-native_2.8.2.bb =3D> cmake-native_2.8.3.bb} | =A0 =A04 +-
> =A0.../{cmake-sdk_2.8.2.bb =3D> cmake-sdk_2.8.3.bb} =A0 =A0 | =A0 =A04 +-
> =A0recipes/cmake/cmake_2.6.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 11 --
> =A0recipes/cmake/{cmake_2.8.2.bb =3D> cmake_2.8.3.bb} =A0 | =A0 =A06 +-
> =A0recipes/cups/cups-1.1.23/strftime_fix.patch =A0 =A0 =A0 =A0| =A0 26 --=
--
> =A0.../cups/cups-1.3.8/use_echo_only_in_init.patch =A0 =A0| =A0 11 --
> =A0recipes/cups/cups-1.4.3/configure.patch =A0 =A0 =A0 =A0 =A0 =A0| =A011=
7 ------------------
> =A0recipes/cups/cups-1.4.3/skip_tools.patch =A0 =A0 =A0 =A0 =A0 | =A0 51 =
--------
> =A0.../cups/cups-1.4.3/use_echo_only_in_init.patch =A0 =A0| =A0 11 --
> =A0recipes/cups/cups-1.4.4/text.convs =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A06 +
> =A0recipes/cups/cups-1.4.4/textonly =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0124 ++++++++++++++++++++
> =A0recipes/cups/cups-1.4.4/textonly.ppd =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 47 ++++++++
> =A0recipes/cups/cups.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 89 --------------
> =A0recipes/cups/cups14.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 83 -------------
> =A0recipes/cups/cups_1.1.23.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 51 --------
> =A0recipes/cups/cups_1.2.12.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 92 ++++++++++++++-
> =A0recipes/cups/cups_1.2.7.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 80 -------------
> =A0recipes/cups/cups_1.3.8.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 11 --
> =A0recipes/cups/cups_1.4.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 15 ---
> =A0recipes/cups/cups_1.4.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0122 +++++++++++++++++--
> =A0recipes/libinih/libinih_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 14 +++
> =A0...python-dbus_0.83.0.bb =3D> python-dbus_0.83.2.bb} | =A0 10 +-
> =A0recipes/qt4/qt4-tools-sdk.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A08 +-
> =A0recipes/xkeyboard-config/xkeyboard-config.inc =A0 =A0 =A0| =A0 18 +++
> =A0recipes/xkeyboard-config/xkeyboard-config_1.4.bb =A0 | =A0 18 +---
> =A0recipes/xkeyboard-config/xkeyboard-config_1.8.bb =A0 | =A0 18 +---
> =A0recipes/xkeyboard-config/xkeyboard-config_git.bb =A0 | =A0 17 +---
> =A033 files changed, 441 insertions(+), 675 deletions(-)
> =A0delete mode 100644
> recipes/cmake/cmake-2.6.4/fix_fortify_source_compilation.patch
> =A0rename recipes/cmake/{cmake-2.8.2 =3D>
> cmake-2.8.3}/dont-run-cross-binaries.patch (100%)
> =A0delete mode 100644 recipes/cmake/cmake-native_2.6.4.bb
> =A0rename recipes/cmake/{cmake-native_2.8.2.bb =3D> cmake-native_2.8.3.bb=
} (56%)
> =A0rename recipes/cmake/{cmake-sdk_2.8.2.bb =3D> cmake-sdk_2.8.3.bb} (56%=
)
> =A0delete mode 100644 recipes/cmake/cmake_2.6.4.bb
> =A0rename recipes/cmake/{cmake_2.8.2.bb =3D> cmake_2.8.3.bb} (91%)
> =A0delete mode 100644 recipes/cups/cups-1.1.23/strftime_fix.patch
> =A0delete mode 100644 recipes/cups/cups-1.3.8/use_echo_only_in_init.patch
> =A0delete mode 100644 recipes/cups/cups-1.4.3/configure.patch
> =A0delete mode 100644 recipes/cups/cups-1.4.3/skip_tools.patch
> =A0delete mode 100644 recipes/cups/cups-1.4.3/use_echo_only_in_init.patch
> =A0create mode 100644 recipes/cups/cups-1.4.4/text.convs
> =A0create mode 100644 recipes/cups/cups-1.4.4/textonly
> =A0create mode 100644 recipes/cups/cups-1.4.4/textonly.ppd
> =A0delete mode 100644 recipes/cups/cups.inc
> =A0delete mode 100644 recipes/cups/cups14.inc
> =A0delete mode 100644 recipes/cups/cups_1.1.23.bb
> =A0delete mode 100644 recipes/cups/cups_1.2.7.bb
> =A0delete mode 100644 recipes/cups/cups_1.3.8.bb
> =A0delete mode 100644 recipes/cups/cups_1.4.3.bb
> =A0create mode 100644 recipes/libinih/libinih_git.bb
> =A0rename recipes/python/{python-dbus_0.83.0.bb =3D> python-dbus_0.83.2.b=
b} (71%)
> =A0create mode 100644 recipes/xkeyboard-config/xkeyboard-config.inc
>
>
> --
> Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.oss=
ystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


