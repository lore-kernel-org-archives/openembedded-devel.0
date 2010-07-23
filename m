Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OcLwA-0002Iu-HD
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 19:21:32 +0200
Received: by gwb15 with SMTP id 15so847861gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 10:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=6QBrZhLXyJbEAyyb4qaudTLvaAjvQEtD3nByYcr+A40=;
	b=qCaNg1hU2rbj84z9cOgoWobulFuvHBr+5OpenOQFrIL+3Q3w4iyop6MvfWL4UxDK/D
	6zX4TGThO8Zd4elQhOJ1qHl9o2Kt8e8ptqGxsP7lofKXPBW//wbWPAoFQCWcPqTy4Lzu
	hzFfhnABI4E7lwDQYdagOb1Se3NCYUTQLLwYE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=bSeJgTDgBqcCF+QMBvgflbDbnPFQrIB0BBqEEkDX8ErASGkIYHm2pUPuzewcoXT/qB
	BKwmwSTKP5xfUnhLBWFUrvoYufmWjQQSRzt0xy/0ZFnbt1kw2J848lfnYqYfihku0CTz
	6xFPk9dbDd3bB77L5VUdz9LOYSfB4FKjbSVEA=
Received: by 10.151.40.7 with SMTP id s7mr4091827ybj.405.1279905669462; Fri, 
	23 Jul 2010 10:21:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Fri, 23 Jul 2010 10:20:49 -0700 (PDT)
In-Reply-To: <AANLkTi=XnYtiTtUke0aiPgvFao3De6-xxb1cWt3hr7=X@mail.gmail.com>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com> 
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com> 
	<i2bir6$un3$1@dough.gmane.org> <1279875548.13006.32.camel@rex> 
	<AANLkTi=XnYtiTtUke0aiPgvFao3De6-xxb1cWt3hr7=X@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jul 2010 10:20:49 -0700
Message-ID: <AANLkTinJZ-Nst4HvkGtuPG5Y9X3MQuqfFhmkoU=cKaER@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages 	into native sysroot
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
X-List-Received-Date: Fri, 23 Jul 2010 17:21:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2010 at 2:18 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/7/23 Richard Purdie <rpurdie@rpsys.net>
>
>> On Fri, 2010-07-23 at 10:11 +0200, Koen Kooi wrote:
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > On 23-07-10 10:02, Phil Blundell wrote:
>> > > On Fri, 2010-07-23 at 09:25 +0200, Koen Kooi wrote:
>> > >> There is a BIG problem with these patches, they break multimachine
>> builds.
>> > >>
>> > >> The previous situation had:
>> > >>
>> > >> cross/armv7a-angstrom-foo/usr/bin/
>> > >> cross/armv5te-angstrom-foo/usr/bin/
>> > >> etc
>> > >>
>> > >> The new situation has:
>> > >>
>> > >> x86_64-linux/usr/bin
>> > >>
>> > >> So all the toolchains get dropped into the *same* directory, which
>> > >> breaks horribly.
>> > >
>> > > Which are the actual binaries that collide? =A0I would have thought =
that
>> > > everything which gets installed into the cross bindir ought to be
>> > > prefixed with TARGET_SYS (i.e. usr/bin/armv7a-angstrom-linux-gcc, et=
c).
>> >
>> > It's all 'arm-angstrom-foo', I was just about to make the suggestion t=
o
>> > change it to 'armv7a-angstrom-foo' :)
>>
>> I've just been talking to Koen about this. When building for armv7a,
>> TARGET_ARCH which goes into TARGET_PREFIX and TARGET_SYS is "arm".
>>
>> I suspect if we change TARGET_ARCH to be armv7a, nasty things will
>> happen but I could be wrong.
>>
>
> I've been pondering if TARGET_ARCH should be the real arch (like armv7a) =
and
> whether adjacent to that there should be a TARGET_ARCH_FAMILY or so.
>
> Changing TARGET_ARCH to armv7a without other changes definitely is going =
to
> break things.


maybe we should not change TARGET_ARCH but use FEED_ARCH to construct TARGE=
T_SYS

> There are 110 .bb files that reference TARGET_ARCH
>
> the last two lines of the grep read:
> xqt2/xqt2_20060509.bb: =A0 =A0if [ ${TARGET_ARCH} =3D=3D "arm" ]; then
> xqt/xqt_0.0.9.bb: =A0 =A0if [ ${TARGET_ARCH} =3D=3D "arm" ]; then
> so these are definitely not going to fly
>
> for some other of the 110 recipes the change is harmless (e.g. because th=
ey
> compare to "mips" in gcc-common.inc)
> for most others I cannot judge this, e.g. because the value is passed to
> configure.
>
> unrelated side note:
> while grepping I noticed the existence of dirs like linux-uml and linux-a=
tm.
> These contain kernel recipes.
> Shouldn't these be in linux recipes dir? (or alternately shouldn't there =
be
> also things like linux-omap and linux-nios2).
>
> frans
>
>
>> If that doesn't help which I suspect it won't, my gut instinct is to add
>> a architecture specific directory under bin for the cross bits. This
>> could be as simple as changing bindir in cross.bbclass.
>>
>> > I don't know if that solves the binutils-cross problem[1], though.
>> >
>> > Koen
>> >
>> > [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/34685
>>
>> Is that libiberty.a file actually useful or could we just stop
>> binutils-cross installing it?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


