Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OveKf-0004mq-0J
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 00:50:34 +0200
Received: by iwn2 with SMTP id 2so6508279iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 15:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=VB6WvorBQ46zXmCT/PmEdKcD8w9WjcMqEc5g/hmu95Y=;
	b=Aecjzm2RwB1Ew1pajf26KdevYWWo9e3T+z1YLXVWari6tKCZkok6TWurpK/N2C9Gmc
	veLKs7VNlW2oZnimIkuBoRMn39ZuF8RCLzw4VYRMNukWAuMKDhIaMfMV32b+3PYnFOvB
	QeyzwXUnPV24Tj3hZn5OqNQukCmwZ5EkHufCY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=pvSfCxEyBvIFXSTDhzZ8ZyJ+6gkyOkUVh+AMrugAPHkkaK/tnjcY4Be9Hg1k/rgUhL
	sGuWS9IAZ6IZkmKyhG9l2qHsjIe4rbg0i5XrJXFJ/wElyUVAXf0/csOIxkc0jYYSW3E9
	BpYXjjZHrrC+HVHuMndg5qKm9e4v79ucleU0Y=
Received: by 10.231.30.134 with SMTP id u6mr559438ibc.121.1284504585813; Tue,
	14 Sep 2010 15:49:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Tue, 14 Sep 2010 15:49:25 -0700 (PDT)
In-Reply-To: <1284503564.3724.52.camel@mattotaupa>
References: <1284404613.4133.103.camel@mattotaupa>
	<AANLkTi=TNCakw39uSUHbVudgdJrxwaQPPZZHmpbO38zN@mail.gmail.com>
	<AANLkTi=ay75ZtCe7g5td8tAMwHki-Hk0_FWjYSkT+KoL@mail.gmail.com>
	<1284496155.3724.18.camel@mattotaupa>
	<1284503564.3724.52.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Sep 2010 15:49:25 -0700
Message-ID: <AANLkTimb4zC5NYMmt=0a1=ANMxHQDotimEW7TP5JPVqw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: pixman 0.18.4: `do_compile()` fails with minimal-uclibc: `../pixman/.libs/libpixman-1.so: undefined reference to `__tls_get_addr'` (was: Re: [PATCH] preferred-xorg-versions-X11R7.5-latest.inc: Use Pixman 0.18.4.)
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
X-List-Received-Date: Tue, 14 Sep 2010 22:50:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2010 at 3:32 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Dienstag, den 14.09.2010, 22:29 +0200 schrieb Paul Menzel:
>> Am Dienstag, den 14.09.2010, 15:17 +0200 schrieb Frans Meulenbroeks:
>> > 2010/9/13 Khem Raj <raj.khem@gmail.com>:
>> > > On Mon, Sep 13, 2010 at 12:03 PM, Paul Menzel <paulepanter@users.sou=
rceforge.net> wrote:
>> > >> Date: Mon, 13 Sep 2010 20:53:48 +0200
>> > >>
>> > >> Cairo 1.10.0 was added in 1d4c650b1d8dac6adee3d3d4208b81bc9b67bd3d =
[1] and requires Pixman 0.18.4. This fixes at least the distribution Minima=
l which does not set the version of cairo explicitly.
>> > >>
>> > >>
>> > >> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=
=3D1d4c650b1d8dac6adee3d3d4208b81bc9b67bd3d
>> > >> [2] http://cgit.freedesktop.org/cairo/commit/?id=3D8127f1f5d52bb716=
dbd70efe096894f2a542f4a9
>> > >>
>> > >> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>> > >
>> > > Acked-by: Khem Raj <raj.khem@gmail.com>
>> >
>> > Paul, thanks for the fix!
>> >
>> > Acked-by: Frans Meulenbroeks <frans.meulenbroeks@gmail.com>
>>
>> Leon committed the same in f68f811ed20c32d3fb7c71fb41484ae6dd9908fc [3].
>
>> [3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df68f=
811ed20c32d3fb7c71fb41484ae6dd9908fc
>
> Unfortunately I just tested this patch with minimal-uclibc and it Pixman
> 0.18.4 fails with the following error when doing `bitbake
> console-image`.
>
> | [=E2=80=A6]
> | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/arm=
v7a/lib/gcc/arm-oe-linux-uclibceabi/4.4.4/../../../../arm-oe-linux-uclibcea=
bi/bin/ld: warning: libc.so, needed by /oe/build-minimal-uclibc/minimal-ucl=
ibc-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.4.=
4/../../../../arm-oe-linux-uclibceabi/lib/libgcc_s.so.1, not found (try usi=
ng -rpath or -rpath-link)
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__tls_get_addr'
> | collect2: ld returned 1 exit status
> | make[2]: *** [a1-trap-test] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/arm=
v7a/lib/gcc/arm-oe-linux-uclibceabi/4.4.4/../../../../arm-oe-linux-uclibcea=
bi/bin/ld: warning: libc.so, needed by /oe/build-minimal-uclibc/minimal-ucl=
ibc-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.4.=
4/../../../../arm-oe-linux-uclibceabi/lib/libgcc_s.so.1, not found (try usi=
ng -rpath or -rpath-link)
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__tls_get_addr'
> | collect2: ld returned 1 exit status
> | make[2]: *** [region-test] Error 1
> | [=E2=80=A6]
>
>

It seems that TLS is needed/enabled by default for pixman. You can explore =
if
you can disable tls during configure like --disable-tls or some such option
if exists would be ideal then you can disable it for uclibc based builds.

Otherwise we have to patch it to work without TLS.

As a workaround you can use uclibc-git recipes which have TLS/NPTL enabled
by default and it should work with uclibc-git unmodified.

-Khem

> Please tell me, if I can provide more information. Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
-Khem


