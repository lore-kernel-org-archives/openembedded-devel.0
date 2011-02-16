Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ppm5g-0005t7-84
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 19:27:04 +0100
Received: by eya28 with SMTP id 28so897504eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 10:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=M4lpe9YOtPwwdSEquTI5pehsh5WBuoE8YIKglPqAaY8=;
	b=CrzvNoGFCv905YRpHZm6tnJSUsrqfRRiOTl01k1BON8lkyvZPj/L+ulQKD52RKwMqO
	JSQW6J60zYpFuWspV6AS+xw8Mb/7M7+avEOfBxGA+5c41QjIFnBEr5xrAL3MGN+4kU63
	yWlguIsgaUg68C52g09koT7LGa4DSz+7X8LPw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=YD+GyYU2tKBEvqzm0lODU4/P6RGOis2IU9hGr7kcOL/Hy8kKYJm0ox/aoJ4rv3G+Z9
	nAnQLYLnx/3QamKH94vUBTMlpCN3GgxpOWGYstNFzstyGW8uZO/R6Yf9MczUHcmRD/Hz
	doSA/yjcHmCv9C9bZfL4E2xeFb+zCnUvFlGxs=
Received: by 10.223.86.2 with SMTP id q2mr1124746fal.139.1297880635272; Wed,
	16 Feb 2011 10:23:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Wed, 16 Feb 2011 10:23:35 -0800 (PST)
In-Reply-To: <AANLkTimPz8ji6Lo-Yh2DmRUc0=A-EwePxre6GiTss2=V@mail.gmail.com>
References: <AANLkTimSjWURf8gMrVZGd==xCH3jnWEG_=G8EMfsdbW1@mail.gmail.com>
	<AANLkTimPz8ji6Lo-Yh2DmRUc0=A-EwePxre6GiTss2=V@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Feb 2011 10:23:35 -0800
Message-ID: <AANLkTi=pcOHKF78X_uezE9Yqj9m=TLT5FPsWePp_Vs11@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 Feb 2011 18:27:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2011 at 11:45 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Otavio, thanks for your contributions.
>
> One remark:
> - what about going to a newer version of cups. i seem to recall
> meta-oe or poky has 1.4.6
>
> And one request (or maybe discussion point for the community).
> Would it be possible to post patches. That makes it much easier to review=
 them.

on contrary, moving forward this would be a better model where folks
can publish their git trees to get soaked in upstream.

>
> (alternately maybe links to web browsable patches would be nice).
> pull requests are somewhat harder to review (at least for me)
>
> Frans
>
> 2011/2/15 Otavio Salvador <otavio@ossystems.com.br>:
>> Hello,
>>
>> We have been working forward to get our required changes into OE and
>> currently following ones are queued up for merging. Those fix/improve
>> the issues we found while working in our layer and have been in use
>> for some time without problems.
>>
>> The following changes since commit 5f3bc5b423e00089e97c7a1657760f67bf20a=
a34:
>>
>> =C2=A0spojegui: bump SRCREV and remove upstream applied desktop file fix=
es
>> for QA issues (2011-02-15 16:57:05 +0100)
>>
>> are available in the git repository at:
>> =C2=A0git://projetos.ossystems.com.br/git/users/otavio/org.openembedded.=
dev.git
>> master
>>
>> Otavio Salvador (13):
>> =C2=A0 =C2=A0 =C2=A0xkeyboard-config: avoid recipe code duplication and =
depends on
>> intltool-native
>> =C2=A0 =C2=A0 =C2=A0python-dbus: update to 0.83.2 and fix rpath to use a=
bsolute path
>> =C2=A0 =C2=A0 =C2=A0cups: drop unused versions
>> =C2=A0 =C2=A0 =C2=A0cups: merge cups.inc into cups 1.2.12 recipe
>> =C2=A0 =C2=A0 =C2=A0cups: merge cups14.inc into cups 1.4.4 recipe
>> =C2=A0 =C2=A0 =C2=A0cups: add textonly filter and split packages
>> =C2=A0 =C2=A0 =C2=A0libinih: add
>> =C2=A0 =C2=A0 =C2=A0cdparanoia (svn): use build variables to fix packagi=
ng when
>> using empty prefix
>> =C2=A0 =C2=A0 =C2=A0sdk.bbclass: cache ${libdir} as ${target_libdir}
>> =C2=A0 =C2=A0 =C2=A0qt4-tools-sdk: use host include headers for dbus
>> =C2=A0 =C2=A0 =C2=A0cmake: drop 2.6.4 as it is not used by any distro
>> =C2=A0 =C2=A0 =C2=A0cmake: update from 2.8.2 to 2.8.3
>> =C2=A0 =C2=A0 =C2=A0distro/micro.conf: drop exec_prefix_native since it =
is unused
>>
>> =C2=A0classes/sdk.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A01 +
>> =C2=A0conf/distro/micro.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 -
>> =C2=A0recipes/cdparanoia/cdparanoia_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A08 +-
>> =C2=A0.../fix_fortify_source_compilation.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 32 -----
>> =C2=A0.../dont-run-cross-binaries.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
>> =C2=A0recipes/cmake/cmake-native_2.6.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 10 --
>> =C2=A0...cmake-native_2.8.2.bb =3D> cmake-native_2.8.3.bb} | =C2=A0 =C2=
=A04 +-
>> =C2=A0.../{cmake-sdk_2.8.2.bb =3D> cmake-sdk_2.8.3.bb} =C2=A0 =C2=A0 | =
=C2=A0 =C2=A04 +-
>> =C2=A0recipes/cmake/cmake_2.6.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 11 --
>> =C2=A0recipes/cmake/{cmake_2.8.2.bb =3D> cmake_2.8.3.bb} =C2=A0 | =C2=A0=
 =C2=A06 +-
>> =C2=A0recipes/cups/cups-1.1.23/strftime_fix.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 26 ----
>> =C2=A0.../cups/cups-1.3.8/use_echo_only_in_init.patch =C2=A0 =C2=A0| =C2=
=A0 11 --
>> =C2=A0recipes/cups/cups-1.4.3/configure.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0117 ------------------
>> =C2=A0recipes/cups/cups-1.4.3/skip_tools.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 51 --------
>> =C2=A0.../cups/cups-1.4.3/use_echo_only_in_init.patch =C2=A0 =C2=A0| =C2=
=A0 11 --
>> =C2=A0recipes/cups/cups-1.4.4/text.convs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +
>> =C2=A0recipes/cups/cups-1.4.4/textonly =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0124 ++++++++++++++++++++
>> =C2=A0recipes/cups/cups-1.4.4/textonly.ppd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 47 ++++++++
>> =C2=A0recipes/cups/cups.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 89 -=
-------------
>> =C2=A0recipes/cups/cups14.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 83 --------=
-----
>> =C2=A0recipes/cups/cups_1.1.23.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 51 --------
>> =C2=A0recipes/cups/cups_1.2.12.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 92 ++++++++++++++-
>> =C2=A0recipes/cups/cups_1.2.7.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 80 -------------
>> =C2=A0recipes/cups/cups_1.3.8.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 11 --
>> =C2=A0recipes/cups/cups_1.4.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 15 ---
>> =C2=A0recipes/cups/cups_1.4.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0122 +++++++++++++++++=
--
>> =C2=A0recipes/libinih/libinih_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 14 +++
>> =C2=A0...python-dbus_0.83.0.bb =3D> python-dbus_0.83.2.bb} | =C2=A0 10 +=
-
>> =C2=A0recipes/qt4/qt4-tools-sdk.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A08 +-
>> =C2=A0recipes/xkeyboard-config/xkeyboard-config.inc =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 18 +++
>> =C2=A0recipes/xkeyboard-config/xkeyboard-config_1.4.bb =C2=A0 | =C2=A0 1=
8 +---
>> =C2=A0recipes/xkeyboard-config/xkeyboard-config_1.8.bb =C2=A0 | =C2=A0 1=
8 +---
>> =C2=A0recipes/xkeyboard-config/xkeyboard-config_git.bb =C2=A0 | =C2=A0 1=
7 +---
>> =C2=A033 files changed, 441 insertions(+), 675 deletions(-)
>> =C2=A0delete mode 100644
>> recipes/cmake/cmake-2.6.4/fix_fortify_source_compilation.patch
>> =C2=A0rename recipes/cmake/{cmake-2.8.2 =3D>
>> cmake-2.8.3}/dont-run-cross-binaries.patch (100%)
>> =C2=A0delete mode 100644 recipes/cmake/cmake-native_2.6.4.bb
>> =C2=A0rename recipes/cmake/{cmake-native_2.8.2.bb =3D> cmake-native_2.8.=
3.bb} (56%)
>> =C2=A0rename recipes/cmake/{cmake-sdk_2.8.2.bb =3D> cmake-sdk_2.8.3.bb} =
(56%)
>> =C2=A0delete mode 100644 recipes/cmake/cmake_2.6.4.bb
>> =C2=A0rename recipes/cmake/{cmake_2.8.2.bb =3D> cmake_2.8.3.bb} (91%)
>> =C2=A0delete mode 100644 recipes/cups/cups-1.1.23/strftime_fix.patch
>> =C2=A0delete mode 100644 recipes/cups/cups-1.3.8/use_echo_only_in_init.p=
atch
>> =C2=A0delete mode 100644 recipes/cups/cups-1.4.3/configure.patch
>> =C2=A0delete mode 100644 recipes/cups/cups-1.4.3/skip_tools.patch
>> =C2=A0delete mode 100644 recipes/cups/cups-1.4.3/use_echo_only_in_init.p=
atch
>> =C2=A0create mode 100644 recipes/cups/cups-1.4.4/text.convs
>> =C2=A0create mode 100644 recipes/cups/cups-1.4.4/textonly
>> =C2=A0create mode 100644 recipes/cups/cups-1.4.4/textonly.ppd
>> =C2=A0delete mode 100644 recipes/cups/cups.inc
>> =C2=A0delete mode 100644 recipes/cups/cups14.inc
>> =C2=A0delete mode 100644 recipes/cups/cups_1.1.23.bb
>> =C2=A0delete mode 100644 recipes/cups/cups_1.2.7.bb
>> =C2=A0delete mode 100644 recipes/cups/cups_1.3.8.bb
>> =C2=A0delete mode 100644 recipes/cups/cups_1.4.3.bb
>> =C2=A0create mode 100644 recipes/libinih/libinih_git.bb
>> =C2=A0rename recipes/python/{python-dbus_0.83.0.bb =3D> python-dbus_0.83=
.2.bb} (71%)
>> =C2=A0create mode 100644 recipes/xkeyboard-config/xkeyboard-config.inc
>>
>>
>> --
>> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
>> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
>> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


