Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <majo.huber@googlemail.com>) id 1NjqwN-00034G-P1
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 10:20:31 +0100
Received: by fxm20 with SMTP id 20so3268821fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 01:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bpTS8cTOCiPp1z9E5tDFQ2ia/MrvUlTGptw3ZyluFQE=;
	b=tAqgOHw7IcgXlPnAkXeDswypXswG7CBM4/JnYMsWiTyBUa3ktlY+0YhACf6YcnppC0
	lbZa86mHp1RewH1x91Mt2KR5lW46/Js7f0AsoR/xVfYETfqC1LgrJu12DxY5DLwUgBA1
	6khZjSL1aqWF8j+ZxqM0gEdELEab+JBI20CAw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aGH7kewn5d3SQmUF4sX3QHRCSpmgVzMIs32Qg3DTA/rac+4SmJMATLyB9FlETzM9yf
	mKsJdgyB8/D1Az9GorAuJyfui+XZeFR1LJk53OsPZK51a0zkdBa1FYrfYHRAvj9dytBK
	Uv+0jQrmT33fT3O+KLBRN/a3JLVoOPhnRjB6s=
MIME-Version: 1.0
Received: by 10.216.87.83 with SMTP id x61mr1449292wee.7.1266916663366; Tue, 
	23 Feb 2010 01:17:43 -0800 (PST)
In-Reply-To: <4B82D6E0.7030005@tycoelectronics.com>
References: <mailman.3892.1266855314.14961.openembedded-devel@lists.openembedded.org>
	<4B82D6E0.7030005@tycoelectronics.com>
Date: Tue, 23 Feb 2010 10:17:43 +0100
Message-ID: <40d782961002230117ra414155o3fdea83b95943701@mail.gmail.com>
From: majo huber <majo.huber@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: majo.huber@googlemail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Build GCC QA Issue: with objc: No GNU_HASH in the elf binary: '/home/oe/build/tmp/work/i686-angstrom-linux/gcc-4.3.3-r10.1/packages-split/objc/usr/lib/libobjc.so.2.0.0'
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
X-List-Received-Date: Tue, 23 Feb 2010 09:20:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

try the following:
TARGET_CC_ARCH +=3D "${LDFLAGS}"
This should resolve your problems if you build your executable from
within your OE buildsystem.
In very rare cases (e.g. when you build some programs outside of OE
but use OE to package all) it could be useful to use the following:
INSANE_SKIP_objc =3D "True"
AFAIK that sould not be commonly used, but it worked for me.

majo

2010/2/22 Jay Snyder <jay.snyder@tycoelectronics.com>:
> ERROR: QA Issue with gcc: non -dev package contains symlink .so: gcc path
> '/work/i686-angstrom-linux/gcc-4.3.3-r10.1/packages-split/gcc/usr/lib/gcc=
/i686-angstrom-linux/4.3.3/libgcc_s.so'
>
>
>
> ERROR: QA Issue with objc: No GNU_HASH in the elf binary:
> '/home/oe/build/tmp/work/i686-angstrom-linux/gcc-4.3.3-r10.1/packages-spl=
it/objc/usr/lib/libobjc.so.2.0.0'
>
> ERROR: QA run found fatal errors. Please consider fixing them.
> I get the GNU_HASH problem with a lot of packages, and quite frankly, it =
is
> really getting annoying. =A0 My project deadline is quickly approaching, =
and I
> need a compete system, even if it doesn't have some of this security stuf=
f
> in it (which, is what I assume the HASH stuff is for).
>
> Is there any way to configure OE to ingore the QA stuff? =A0 =A0 The GNU_=
HASH is
> not required for a working executable is it?
>
> In this particular case, I'm trying to build a compiler to run natively o=
n
> my target, so I can build some packages that have proved to be real tough=
 to
> cross compile.
>
> I can't be the first one out there to try this? =A0 =A0Has anyone else ha=
d this
> problem?
>
> Was this GNU_HASH stuff added somewhere along the way, because it seems a=
n
> aweful lot of packages are broken by this?
>
>
> Thanks,
> Jay
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


