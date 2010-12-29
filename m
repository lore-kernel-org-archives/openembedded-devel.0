Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PXsbF-0001x7-BF
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 10:45:44 +0100
Received: by iwn8 with SMTP id 8so10386669iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Dec 2010 01:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hfvbAP3FU3PoUQ7Xf0cmAxK8L6z1Vx02NhXOjVJqlcM=;
	b=rShxNb+iQuttkqb+Y4GaxyDRcebs0e+Rp1E4RLd5bO1vPYqAujbiIltVsnMZzPZ5Dq
	iobElm/zG1ZZHT6eUn6W1dnHdZnPucwR/ikmOEvDiUcyI0U9V/CBDubL3NmUryIwd0hd
	jSdttKp5Oix0Jah1AIlRaOlKA9SMRnPmV0k+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xZazRHupmLZkvmrU+/iSfYrdK3+he5s341ltLw7EZyvCQBUyFFYhoRvsazTiDK/Pxb
	Nw5BiAVezZ/ztJuI8ym9ZlQHMaNHKSnV12upBs0Nvx8GcEQxpvt2SI4t9v0dsrjK3Yk6
	bGw9hiz3QHFkuPxivXDQU+BcmrEE1bF5j476U=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr14419311ibv.32.1293615922269;
	Wed, 29 Dec 2010 01:45:22 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 29 Dec 2010 01:45:22 -0800 (PST)
In-Reply-To: <201012291041.07466.roman@khimov.ru>
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinj-pWTJfLqszpHVkN29McgpZ1Lidg8n-+V7RYo@mail.gmail.com>
	<AANLkTikKLawM78rC4mc2B4M2S2N1+eqa-9Tp9TS1M__5@mail.gmail.com>
	<201012291041.07466.roman@khimov.ru>
Date: Wed, 29 Dec 2010 10:45:22 +0100
Message-ID: <AANLkTi=rzins+VyJV-rOP6RZQwwDhNJQs--=tceOc2ZM@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Dec 2010 09:45:44 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/12/29 Roman I Khimov <roman@khimov.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 29 =C4=C5=CB=C1=C2=
=D2=D1 2010 01:19:09 =C1=D7=D4=CF=D2 Frans Meulenbroeks
> =CE=C1=D0=C9=D3=C1=CC:
>> After Roman pushed his patches, I tried again.
>>
>> It seems the proper compiler is invoked
>
> Yep, just wanted to reply to previous mail that
> 264f7ab1f41cc86d29716619d67506c85223df71 might probably fix it.
>
>> , but =9Athis time I get a compiler error:
>> | arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
>>
>> -mthumb-interwork -mthumb -Ic -I/usr/lib/perl/5.10/CORE
>> -DXS_VERSION=3D"0.61" -DVERSION=3D"0.61" -fPIC -c
>> -isystem/home/frans/oe/tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr=
/in
>> clude -fexpensive-optimizations -fomit-frame-pointer -frename-registers =
-O1
>> =9A-DDEBIAN -D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS
>> -fno-strict-aliasing -pipe -O2 -o lib/DateTime.o lib/DateTime.c
>>
>> | lib/DateTime.xs:7:20: fatal error: EXTERN.h: No such file or directory
>>
>> Too late to investigate this now.
>
> Well, time to deal with this kind of problem.
>
> I've built libdatetime-perl for qemuarm/angstrom-2010.x yesterday with no
> problems. Rebuilding perl, perl-native and libdatetime-perl now with fres=
h
> pull from oe.dev and building with sheevaplug/minimal combination in para=
llel.
> But it might be that clean build results would be different for
> sheevaplug/minimal.
>

Thanks for your feedback and help.
I'll retry and investigate tonight (in about 8 hrs from now).
If you find out anything before, please keep me posted.

Thanks again, Frans.


