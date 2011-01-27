Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PiX5Y-0003Ee-Fx
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 20:01:02 +0100
Received: by ywi6 with SMTP id 6so737152ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 11:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=bxvOIXQzssioJBVb/YlEVi32VH/k83pMmMvSABlXjiI=;
	b=OsO9CxIkHSkAyvNdyFdd1pu7NDgQ5YE/YiGpvLXQZ67w+Qujtsj4VbX5ZAIwFygN5q
	CFGSvbRKJXTr0/jkEk7dn0jZjlMI0rnLWhzD9ZVkFo6ar8mBFKUFxYncaVMRHJoJpuY4
	CJc7otUFRP2aQmFisaewq42+gef/+g4RM6GaM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=bMqEg/F/6sQPkd1t78jAoe7aW0lPsos4SRyG4+htg4PzoaEqBStj+GFpwiDAk5QJf2
	oGhrObpF/vnoDWA3aQc1bYfB4hBrLm8WmB7HYs8yQYEuzAuQt9BiSrU0Rh1BASTrEEA8
	/KK2/JF4xufH7XNbTeZlufkqEJv77TJz4P4lo=
Received: by 10.90.51.20 with SMTP id y20mr3541685agy.115.1296154804667; Thu,
	27 Jan 2011 11:00:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Thu, 27 Jan 2011 10:59:41 -0800 (PST)
In-Reply-To: <4D41B69F.7030403@mentor.com>
References: <1296144645-16120-1-git-send-email-ryan_d_phillips@dell.com>
	<4D41B69F.7030403@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2011 10:59:41 -0800
Message-ID: <AANLkTim5kWpY0+UbeFEBmT4fxE-JbsJpJ49C4e2_k1vy@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bind: Add DISTRO_FEATURES support for ipv6
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
X-List-Received-Date: Thu, 27 Jan 2011 19:01:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2011 at 10:17 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 01/27/2011 09:10 AM, Ryan D Phillips wrote:
>>
>> Signed-off-by: Ryan D Phillips<ryan_d_phillips@dell.com>
>
> Acked-by: Tom Rini <tom_rini@mentor.com>
>
>> ---
>> =C2=A0recipes/bind/bind_9.3.1.bb =C2=A0 =C2=A0| =C2=A0 =C2=A06 ++++--
>> =C2=A0recipes/bind/bind_9.3.4-P1.bb | =C2=A0 =C2=A06 ++++--
>> =C2=A0recipes/bind/bind_9.3.5-P1.bb | =C2=A0 =C2=A06 ++++--
>> =C2=A0recipes/bind/bind_9.3.6.bb =C2=A0 =C2=A0| =C2=A0 =C2=A07 +++++--
>> =C2=A04 files changed, 17 insertions(+), 8 deletions(-)
>>
>> diff --git a/recipes/bind/bind_9.3.1.bb b/recipes/bind/bind_9.3.1.bb
>> index 268253e..11d4c71 100644
>> --- a/recipes/bind/bind_9.3.1.bb
>> +++ b/recipes/bind/bind_9.3.1.bb
>> @@ -1,7 +1,7 @@
>> =C2=A0DEPENDS =3D "openssl"
>> =C2=A0RPEDENDS =3D ""
>> =C2=A0DESCRIPTION =3D "ISC Internet Domain Name Server"
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> =C2=A0SRC_URI =3D "ftp://ftp.isc.org/isc/bind9/9.3.1/bind-9.3.1.tar.gz \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lib_dns_Makefile.in.pat=
ch \
>> @@ -9,7 +9,9 @@ SRC_URI =3D
>> "ftp://ftp.isc.org/isc/bind9/9.3.1/bind-9.3.1.tar.gz \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://conf.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>
>> -EXTRA_OECONF =3D " --enable-ipv6=3Dno --with-randomdev=3D/dev/random
>> --disable-threads --sysconfdir=3D/etc/bind --localstatedir=3D/var --pref=
ix=3D/usr"
>> +EXTRA_OECONF =3D "--with-randomdev=3D/dev/random --disable-threads \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sysconfdir=3D=
/etc/bind --localstatedir=3D/var --prefix=3D/usr
>> \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contain=
s('DISTRO_FEATURES', 'ipv6',
>> '--enable-ipv6=3Dyes', '--enable-ipv6=3Dno', d)}"
>> =C2=A0inherit autotools update-rc.d
>>
>> =C2=A0INITSCRIPT_NAME =3D "bind"
>> diff --git a/recipes/bind/bind_9.3.4-P1.bb b/recipes/bind/bind_9.3.4-P1.=
bb
>> index 70c261e..f8ae48f 100644
>> --- a/recipes/bind/bind_9.3.4-P1.bb
>> +++ b/recipes/bind/bind_9.3.4-P1.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "ISC Internet Domain Name Server"
>> =C2=A0SECTION =3D "console/network"
>> =C2=A0HOMEPAGE =3D "http://www.isc.org/sw/bind/"
>> =C2=A0LICENSE =3D "BSD"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> =C2=A0DEPENDS =3D "openssl"
>>
>> @@ -12,7 +12,9 @@ SRC_URI =3D
>> "ftp://ftp.isc.org/isc/bind9/9.3.4-P1/bind-9.3.4-P1.tar.gz \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://so_bsdcompat.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>
>> -EXTRA_OECONF =3D " --enable-ipv6=3Dno --with-randomdev=3D/dev/random
>> --disable-threads --sysconfdir=3D/etc/bind --localstatedir=3D/var --pref=
ix=3D/usr"
>> +EXTRA_OECONF =3D "--with-randomdev=3D/dev/random --disable-threads \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sysconfdir=3D=
/etc/bind --localstatedir=3D/var --prefix=3D/usr
>> \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contain=
s('DISTRO_FEATURES', 'ipv6',
>> '--enable-ipv6=3Dyes', '--enable-ipv6=3Dno', d)}"
>> =C2=A0inherit autotools update-rc.d
>>
>> =C2=A0INITSCRIPT_NAME =3D "bind"
>> diff --git a/recipes/bind/bind_9.3.5-P1.bb b/recipes/bind/bind_9.3.5-P1.=
bb
>> index bb98261..f573e57 100644
>> --- a/recipes/bind/bind_9.3.5-P1.bb
>> +++ b/recipes/bind/bind_9.3.5-P1.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "ISC Internet Domain Name Server"
>> =C2=A0SECTION =3D "console/network"
>> =C2=A0HOMEPAGE =3D "http://www.isc.org/sw/bind/"
>> =C2=A0LICENSE =3D "BSD"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> =C2=A0DEPENDS =3D "openssl"
>>
>> @@ -12,7 +12,9 @@ SRC_URI =3D
>> "ftp://ftp.isc.org/isc/bind9/9.3.5-P1/bind-9.3.5-P1.tar.gz \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://so_bsdcompat.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>
>> -EXTRA_OECONF =3D " --enable-ipv6=3Dno --with-randomdev=3D/dev/random
>> --disable-threads --sysconfdir=3D/etc/bind --localstatedir=3D/var --pref=
ix=3D/usr"
>> +EXTRA_OECONF =3D "--with-randomdev=3D/dev/random --disable-threads \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sysconfdir=3D=
/etc/bind --localstatedir=3D/var --prefix=3D/usr
>> \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contain=
s('DISTRO_FEATURES', 'ipv6',
>> '--enable-ipv6=3Dyes', '--enable-ipv6=3Dno', d)}"
>> =C2=A0inherit autotools update-rc.d
>>
>> =C2=A0INITSCRIPT_NAME =3D "bind"
>> diff --git a/recipes/bind/bind_9.3.6.bb b/recipes/bind/bind_9.3.6.bb
>> index b10d6e8..2ea37f9 100644
>> --- a/recipes/bind/bind_9.3.6.bb
>> +++ b/recipes/bind/bind_9.3.6.bb
>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "ISC Internet Domain Name Server"
>> =C2=A0SECTION =3D "console/network"
>> =C2=A0HOMEPAGE =3D "http://www.isc.org/sw/bind/"
>> =C2=A0LICENSE =3D "BSD"
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> =C2=A0DEPENDS =3D "openssl"
>>
>> @@ -11,7 +11,10 @@ SRC_URI =3D
>> "ftp://ftp.isc.org/isc/bind9/${PV}/${PN}-${PV}.tar.gz \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.in.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>
>> -EXTRA_OECONF =3D " --enable-ipv6=3Dno --with-randomdev=3D/dev/random
>> --disable-threads --sysconfdir=3D/etc/bind --localstatedir=3D/var --pref=
ix=3D/usr
>> --disable-devpoll --disable-epoll"
>> +EXTRA_OECONF =3D "--with-randomdev=3D/dev/random --disable-threads \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sysconfdir=3D=
/etc/bind --localstatedir=3D/var --prefix=3D/usr
>> --disable-devpoll \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-epoll=
 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contain=
s('DISTRO_FEATURES', 'ipv6',
>> '--enable-ipv6=3Dyes', '--enable-ipv6=3Dno', d)}"
>> =C2=A0inherit autotools update-rc.d
>>
>> =C2=A0INITSCRIPT_NAME =3D "bind"
>
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Commit here
commit a88aca1d7dfa3a08957dd49cb61bac850f197106
Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date:   Wed Jan 12 20:34:55 2011 +0100

    autotools.bbclass: pass distro_imposed_configure_flags


should now automatically feed in --enale-ipv6 based on ipv6 being
selected and I see bind is inheriting autotools so why is it not
working for bind ?

-Khem


