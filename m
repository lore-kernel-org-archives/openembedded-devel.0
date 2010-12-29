Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PY0z4-0002c2-4G
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 19:42:50 +0100
Received: by iyj18 with SMTP id 18so9609703iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Dec 2010 10:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mpKyLCBJnSJbqUU1/pM9GkXiGI5kQIVQ4eWO2e5FIYY=;
	b=Jaq48nhzEnR+N8CsseuWdb9S63kZGylD/t/ls6KMnAhTYRk8LikHBWAYKnC5CCWXvy
	ELMAxjqJJt5BGzNSbzxAI4RF8+Ll2aoAMLW2/9ALM6KDqpC3qcukf8F848UJWou3IMYA
	CYCOfQlt1oHuwLRFZ7M5AtCXcqlvP433a0724=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dYUPSQVP8cbqoS4wk8ObA2TqDgjAaNo15Vo6PwXJ79FzugVQTRvvBLl9S4Ef8N5EDB
	4qabxa9GZkYYJsgcFPVHXGzvaZNyTnzgNsOD648MQs5KlrmzekDyPT7mg1cBxrJ9Hkki
	pW/morr4FflwMycCRRPBKUoxLJSwrIY8QQQc4=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr15131956ibv.32.1293648153553;
	Wed, 29 Dec 2010 10:42:33 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 29 Dec 2010 10:42:33 -0800 (PST)
In-Reply-To: <201012291440.41718.roman@khimov.ru>
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikKLawM78rC4mc2B4M2S2N1+eqa-9Tp9TS1M__5@mail.gmail.com>
	<201012291041.07466.roman@khimov.ru>
	<201012291440.41718.roman@khimov.ru>
Date: Wed, 29 Dec 2010 19:42:33 +0100
Message-ID: <AANLkTikGTvYHsy=NDv10evW0UM_f=trvpVZZSub_pJhZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Wed, 29 Dec 2010 18:42:50 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/12/29 Roman I Khimov <roman@khimov.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 29 =C4=C5=CB=C1=C2=
=D2=D1 2010 10:41:00 =C1=D7=D4=CF=D2 Roman I Khimov =CE=C1=D0=C9=D3=C1=CC:
>> I've built libdatetime-perl for qemuarm/angstrom-2010.x yesterday with n=
o
>> problems. Rebuilding perl, perl-native and libdatetime-perl now with fre=
sh
>> pull from oe.dev and building with sheevaplug/minimal combination in
>> =9Aparallel. But it might be that clean build results would be different=
 for
>> sheevaplug/minimal.
>
> Both built just fine, commit 45316c97133b75f6b9ceec9667749648c2046d4d,
> configurations mentioned above.
>

Tested with todays git head, still no success:
I did a fresh build:
bitbake -cclean perl perl-native libdatetime-perl
libdatetime-perl-native; bitbake libdatetime-perl

I now get:

| arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
-mthumb-interwork -mthumb -Ic -I/usr/lib/perl/5.10/CORE
-DXS_VERSION=3D"0.61" -DVERSION=3D"0.61" -fPIC -c
-isystem/home/frans/oe/tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/in=
clude
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1
-DDEBIAN -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS
-fno-strict-aliasing -pipe -O2 -o lib/DateTime.o lib/DateTime.c
| lib/DateTime.xs:7:20: fatal error: EXTERN.h: No such file or directory


I do have EXTERN.h:
sysroots/i686-linux/usr/lib/perl/5.10.1/CORE/EXTERN.h
sysroots/armv5te-oe-linux-gnueabi/usr/lib/perl/5.10.1/CORE/EXTERN.h

What I find worrying (and probably wrong) is:
-I/usr/lib/perl/5.10/CORE
I don't expect host dirs in and arm gcc command.

Also note that the host path says perl/5.10 whereas my files live in perl/5=
.10.1

Roman, can you compare this with your compile log (or can you pastebin
it or provide a link to tinderbox)?

Thanks, Frans


