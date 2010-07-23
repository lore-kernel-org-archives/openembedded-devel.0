Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OcLqC-00024X-CU
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 19:15:21 +0200
Received: by ywe9 with SMTP id 9so88789ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 10:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=19FqAC7DgMVNrH3k1tpyGJBikl1YCM9PPxSxnBSb58s=;
	b=uXyNLWOe1YfSdLcy4Ir1sW+PJaCStIFNHAKOgagdXuZi1QNLqx3RzzgRvWG/E5GwsD
	JqjjneJxr7nXXu++cf2823c5jGXPcw/CTKs/z3h5mUUD/bLn129q3hDVK+0Re6x1SvsF
	M6LtvDihyrAyou/vEM45eH0m/TJMTRgINHn6s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ovvjSRQunPEI4apjqM3KJB9LDZU2CcScg2Qiv7OibxvmaBmtzxGdQI21RZeMJUbbGY
	uxNgFzjQuSxcgB/N3QEKRLERhbHfIkXafo7EO8eSV2E/JTqiiRVxFLpvzCH3RswU3XBC
	rFigDeRRqxnXa+l0AB9jyoXyNMzMsIhGySq9I=
Received: by 10.150.72.31 with SMTP id u31mr5912696yba.221.1279905305532; Fri, 
	23 Jul 2010 10:15:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Fri, 23 Jul 2010 10:14:45 -0700 (PDT)
In-Reply-To: <1279875548.13006.32.camel@rex>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com> 
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com> 
	<i2bir6$un3$1@dough.gmane.org> <1279875548.13006.32.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jul 2010 10:14:45 -0700
Message-ID: <AANLkTinpLhu3Vas3UdOk-q9xhxHbRMaPXgN3fQQGy=gQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Fri, 23 Jul 2010 17:15:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2010 at 1:59 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Fri, 2010-07-23 at 10:11 +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 23-07-10 10:02, Phil Blundell wrote:
>> > On Fri, 2010-07-23 at 09:25 +0200, Koen Kooi wrote:
>> >> There is a BIG problem with these patches, they break multimachine bu=
ilds.
>> >>
>> >> The previous situation had:
>> >>
>> >> cross/armv7a-angstrom-foo/usr/bin/
>> >> cross/armv5te-angstrom-foo/usr/bin/
>> >> etc
>> >>
>> >> The new situation has:
>> >>
>> >> x86_64-linux/usr/bin
>> >>
>> >> So all the toolchains get dropped into the *same* directory, which
>> >> breaks horribly.
>> >
>> > Which are the actual binaries that collide? =A0I would have thought th=
at
>> > everything which gets installed into the cross bindir ought to be
>> > prefixed with TARGET_SYS (i.e. usr/bin/armv7a-angstrom-linux-gcc, etc)=
.
>>
>> It's all 'arm-angstrom-foo', I was just about to make the suggestion to
>> change it to 'armv7a-angstrom-foo' :)
>
> I've just been talking to Koen about this. When building for armv7a,
> TARGET_ARCH which goes into TARGET_PREFIX and TARGET_SYS is "arm".
>
> I suspect if we change TARGET_ARCH to be armv7a, nasty things will
> happen but I could be wrong.

I think it will be fine. I think this will be fine approach. If we think th=
is
is the way I can throw in a patch quickly.

>
> If that doesn't help which I suspect it won't, my gut instinct is to add
> a architecture specific directory under bin for the cross bits. This
> could be as simple as changing bindir in cross.bbclass.
>
>> I don't know if that solves the binutils-cross problem[1], though.
>>
>> Koen
>>
>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/34685
>
> Is that libiberty.a file actually useful or could we just stop
> binutils-cross installing it?
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


