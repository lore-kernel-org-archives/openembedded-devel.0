Received: from mail-px0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NQGrv-0005Y5-1N
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Dec 2009 09:58:58 +0100
Received: by pxi12 with SMTP id 12so7698010pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2009 00:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=lf999f+h+LaCzIuy/J6MY3/sRHKfEM/quajbAkHzOC4=;
	b=CCIZ+iqNk6HCcjzky1JU70SFqFE7v6MTYHDB1jso/WCDs0T2AiuhA81zVf7Tx6VWQv
	IIr1MdJGKAPMN6fYC2NcaFuikBzFXR5wVnQqvCZBlgBEFIukiH9/GdA2VP2qK/uMy91m
	aTwynz+T7t2lfC6zMb7XAFKzC7F6qFgK4hWj4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=xGt+5PmR9oLOTkA+WERkQSvp0lYHFjTJdndM93vn2ZFMKln9qSQDl0wClkZRi0C54J
	Ta0zn2ti79sFYtGGHKrHfEEZBBJS4Kz1SNxOFgWMeesX2z2v2feMjOVXDE7t8g4aY3EP
	PC6NeAuuqGV5Vg5P+UsEASd9gUjHDLBqNxzDU=
Received: by 10.115.38.30 with SMTP id q30mr8160571waj.184.1262249814924;
	Thu, 31 Dec 2009 00:56:54 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 20sm14184534pzk.9.2009.12.31.00.56.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 31 Dec 2009 00:56:53 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5mp87ximn1qzu@guohr-laptop-ubuntu>
	<19c1b8a90912281053u2ebb8e62k313b1c41f99462f6@mail.gmail.com>
Date: Thu, 31 Dec 2009 16:56:45 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5sogndnmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a90912281053u2ebb8e62k313b1c41f99462f6@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compilation of gcc-cross-intermediate-4.4.2 failed due to lack of fenv.h
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
X-List-Received-Date: Thu, 31 Dec 2009 08:58:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

I am afraid that the failure is not so easy.

Today, I recompile the following builds:
MACHINE=3Dqemux86 DISTRO=3Dmicro-uclibc
MACHINE=3Dqemuarm DISTRO=3Dmicro-uclibc
MACHINE=3Dqemumips DISTRO=3Dmicro-uclibc

only qemuarm works. But the problem is that the uclibc configuration in =
 =

qemuarm building has not defined UCLIBC_HAS_FENV, and the configuration =
 =

options of gcc-cross-intermedia lacks --disable-decimal-float. So  =

according the previous analysis, the qemuarm building should failed and =
 =

reported the same reason.

Why did qemuarm build pass? I can not figure it out.

Thanks a lot!

=E5=9C=A8 Tue, 29 Dec 2009 02:53:07 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On Sun, Dec 27, 2009 at 7:49 PM, Guo Hongruan <camelguo@gmail.com> wro=
te:
>> Hi guys,
>>   I found a build error when building openembedded using:
>> 1. MACHINE =3D qemux86 DISTRO=3Dmicro-uclibc, see the follow url for =
 =

>> detailed.
>> http://tinderbox.openembedded.net/packages/391641/
>> 2. MACHINE =3D qemux86 DISTRO=3Dminimal-uclibc, see the following url=
 for
>> detailed
>> http://tinderbox.openembedded.net/packages/391427/
>>
>> It seems that the comiler can not find the fenv.h which should be  =

>> provided
>> by uclibc.
>>
>> /media/work-disk/workdir/oe-qemux86-micro-uclibc/work/i686-oe-linux-u=
clibc/gcc-cross-intermediate-4.4.2-r1.1/gcc-4.4.2/libgcc/config/libbid/b=
id_decimal_globals.c:47:18:
>> error: fenv.h: No such file or directory
>>
>> Any advice is welcome.
>
> You can add --disable-decimal-float to the configure options if its  =

> missing.
> try the attached patch.
>
> or you can enable UCLIBC_HAS_FENV in the uclibc config file.


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


