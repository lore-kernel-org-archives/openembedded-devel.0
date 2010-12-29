Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PY1rv-0003pJ-3H
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 20:39:31 +0100
Received: by iyj18 with SMTP id 18so9648114iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Dec 2010 11:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mmCFquswdWOEj5mQSdo01PKI13yuLVypDI2sSqPzvAY=;
	b=LLAWyal0K22xg8DcUgwa3wNnvse5Dw3ePLPxbwH7Y4ST6M4TpzfBHc1XwkNq+RaKm+
	C2AedrOQOd9XE3U9rnmchq8Zo8ANXAMeZbCu74lWbj39uNJ+vKL5wmKvWh5vuggl4IIT
	EnevfKD2P6FWEAkrSQSLVE9aNh+mWS2XOrKao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OxReq6QRFBGSiAuYSZJSyuOIVC+KrrJmgUq3TJw8fZ/s4htR7/3gevAHd/8dCwwxOB
	9DAcCXuCJfR0xJQ5+zNIzkqfVH9TeVG7ddRX8StT/2GCX18IMUZKcfYe+dBPw+NhKPW/
	T/7NmVq0RAfn6+TM3xhxPcqX00WnQ4ak1WYm8=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr15354712ibc.7.1293651549915; Wed, 29
	Dec 2010 11:39:09 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 29 Dec 2010 11:39:09 -0800 (PST)
In-Reply-To: <AANLkTikGTvYHsy=NDv10evW0UM_f=trvpVZZSub_pJhZ@mail.gmail.com>
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikKLawM78rC4mc2B4M2S2N1+eqa-9Tp9TS1M__5@mail.gmail.com>
	<201012291041.07466.roman@khimov.ru>
	<201012291440.41718.roman@khimov.ru>
	<AANLkTikGTvYHsy=NDv10evW0UM_f=trvpVZZSub_pJhZ@mail.gmail.com>
Date: Wed, 29 Dec 2010 20:39:09 +0100
Message-ID: <AANLkTi=bnk_A_hg0G60gm7CEeKo0CXLK7E3AutR-Cc+c@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Dec 2010 19:39:31 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/12/29 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/12/29 Roman I Khimov <roman@khimov.ru>:
>> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 29 =C4=C5=CB=C1=
=C2=D2=D1 2010 10:41:00 =C1=D7=D4=CF=D2 Roman I Khimov =CE=C1=D0=C9=D3=C1=
=CC:
>>> I've built libdatetime-perl for qemuarm/angstrom-2010.x yesterday with =
no
>>> problems. Rebuilding perl, perl-native and libdatetime-perl now with fr=
esh
>>> pull from oe.dev and building with sheevaplug/minimal combination in
>>> =9Aparallel. But it might be that clean build results would be differen=
t for
>>> sheevaplug/minimal.
>>
>> Both built just fine, commit 45316c97133b75f6b9ceec9667749648c2046d4d,
>> configurations mentioned above.
>>
>
> Tested with todays git head, still no success:
> I did a fresh build:
> bitbake -cclean perl perl-native libdatetime-perl
> libdatetime-perl-native; bitbake libdatetime-perl
>
> I now get:
>
> | arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> -mthumb-interwork -mthumb -Ic -I/usr/lib/perl/5.10/CORE
> -DXS_VERSION=3D"0.61" -DVERSION=3D"0.61" -fPIC -c
> -isystem/home/frans/oe/tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/=
include
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1
> -DDEBIAN -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS
> -fno-strict-aliasing -pipe -O2 -o lib/DateTime.o lib/DateTime.c
> | lib/DateTime.xs:7:20: fatal error: EXTERN.h: No such file or directory
>
>
> I do have EXTERN.h:
> sysroots/i686-linux/usr/lib/perl/5.10.1/CORE/EXTERN.h
> sysroots/armv5te-oe-linux-gnueabi/usr/lib/perl/5.10.1/CORE/EXTERN.h
>
> What I find worrying (and probably wrong) is:
> -I/usr/lib/perl/5.10/CORE
> I don't expect host dirs in and arm gcc command.
>
> Also note that the host path says perl/5.10 whereas my files live in perl=
/5.10.1
>
> Roman, can you compare this with your compile log (or can you pastebin
> it or provide a link to tinderbox)?
>
> Thanks, Frans
>
Some further analysis

from ./sysroots/i686-linux/usr/lib/perl/5.10.1/Config_heavy-arm-oe-linux-gn=
ueabi.pl

api_versionstring=3D'5.10.0'        <--- note the .0 here
archlib=3D'/usr/lib/perl/5.10'
archlibexp=3D'/usr/lib/perl/5.10'
privlib=3D'/usr/share/perl/5.10'
privlibexp=3D'/usr/share/perl/5.10'
sitearch=3D'/usr/local/lib/perl/5.10.1'
sitearchexp=3D'/usr/local/lib/perl/5.10.1'
sitelib=3D'/usr/local/share/perl/5.10.1'
sitelibexp=3D'/usr/local/share/perl/5.10.1'

and as comparison fro
./sysroots/i686-linux/usr/lib/perl/5.10.1/Config_heavy.pl ::

api_versionstring=3D'5.10.0'
archlib=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/5.10=
.1'
archlibexp=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/5=
.10.1'
ccdlflags=3D'-Wl,-E
-Wl,-rpath,/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/5.10=
.1/CORE'
installarchlib=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/pe=
rl/5.10.1'
installprivlib=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/pe=
rl/5.10.1'
installsitearch=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/p=
erl/5.10.1'
installsitelib=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/pe=
rl/5.10.1'
installvendorarch=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib=
/perl/5.10.1'
installvendorlib=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/=
perl/5.10.1'
privlib=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/5.10=
.1'
privlibexp=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/5=
.10.1'
sitearch=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/5.1=
0.1'
sitearchexp=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/=
5.10.1'
sitelib=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/5.10=
.1'
sitelibexp=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/5=
.10.1'
vendorarch=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/5=
.10.1'
vendorarchexp=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/per=
l/5.10.1'
vendorlib=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl/5.=
10.1'
vendorlibexp=3D'/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib/perl=
/5.10.1'

Btw my host (opensuse 11.3) has perl 5.12.1.
Roman could it be that it works for you because you also have 5.10.1
on your host?

Frans


