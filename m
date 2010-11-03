Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDftc-0001py-4E
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 17:09:09 +0100
Received: by yxe42 with SMTP id 42so596982yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=6ByZuKcw1wWVmgUUbR54W1yVf0TxSMk5j2GXdALXURA=;
	b=VbwQwhG6tAZI/+4o56V65SePeIABYOsD++VzGxCHHQYCARzSqDiTIvjesIUD/Oi3o0
	0ngt04camHIxKGo6+Lt81l7WwKz6ugfZuxGhHyDjcqJp/llNVYlPDnSEbZ0W12UWMnVy
	PRhbV6+ICGDsvkmqrbxVJSaKlLrQCKXsSrKk8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=T3mLWs6SVG0NQZI4BWpRqqDy/ETv4Jz/vn5YNrRXq/lHU7X386pMdbTqGELinqf8yA
	mSQCNyCZMxwNxrXrvD74aKcewSWD0uDeMg5oIU7UtA782Xi2RDhcoVQ9+C8hGxLSeyoV
	3MBTLPM+6uLOFCpXEFg0lHsOEIQBWj7VM3a0o=
Received: by 10.90.15.31 with SMTP id 31mr1200716ago.10.1288800495954; Wed, 03
	Nov 2010 09:08:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 09:07:55 -0700 (PDT)
In-Reply-To: <20101103154735.GE3440@jama>
References: <4CCF64DD.9080709@gmail.com>
	<AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
	<AANLkTiktvcs1HsktTWaFATVDR492tPCHb_d7JU1xm_uW@mail.gmail.com>
	<AANLkTinjMC_Eou5Bt9FE07Vn-4xXD_2ugrgCGKgcPxvP@mail.gmail.com>
	<AANLkTinN5pGVW6-aos16m7gZo2ytaF1cgh+9uO3k+G+9@mail.gmail.com>
	<20101103154735.GE3440@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 09:07:55 -0700
Message-ID: <AANLkTi=d_G9A0Mf2zMzG-9zmec06vYNaB1pLrkDQnyvE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Wed, 03 Nov 2010 16:09:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2010 at 8:47 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Wed, Nov 03, 2010 at 08:17:29AM -0700, Khem Raj wrote:
>> On Wed, Nov 3, 2010 at 2:42 AM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>> > 2010/11/2 Khem Raj <raj.khem@gmail.com>:
>> >> On Mon, Nov 1, 2010 at 11:38 PM, Frans Meulenbroeks
>> >
>> >>> I have some concerns here.
>> >>> For configure it seems best to explicitly set and reset the flags in
>> >>> it, otherwise you may just pick up whatever happened to be build
>> >>> before.
>> >>>
>> >>
>> >>
>> >> this is the case with any package that uses configure tools. But assu=
mption here
>> >> is that when you are building you are not building stuff thats not
>> >> meant to be in
>> >> the given image.
>> >
>> > True. However we should enforce that. If e.g. gphoto has no depends on
>> > exif it autotools will still pick up exif if it happens to be there
>> > because some other package build it.
>> > Funtionally this is not necessarily bad (as your image has exif
>> > anyway), but from a point of reproducability it is undesirable.
>> > E.g. if you build the recipe the first time, you might not get exif
>> > and if you rebuild you do get exif. (because the build system does not
>> > know the dependency is there so it might not have build exif yet).
>> >
>> > Actually the results might even differ for between builds of the same
>> > image (especially if you build machines with different speeds etc
>> > and/or use different flags for parallellism.
>> > Therefore I feel it is highly desirable to have all optionals that you
>> > have in configure either explicitly disabled or explicitly added to
>> > depends.
>> >
>>
>> this is everlasting problem with autoconf and autotools. There is a
>> set of options
>> which are enabled based on what autoconf guesses on the sysroots. Unfort=
unately
>> it will be very tedious if you want to explicitly enable and disable
>> every option as well.
>> and there are quite a lot of packages using autotools. However I think
>> that the sysroot is minimal
>> when we build from scratch so most of options should be disabled which
>> are decided by autoconf
>> so we may not get unneeded features which is better than having them
>> enabled at build time
>> and needed support being missing at run time.
>
> well but then you rebuild that package ie after just PR bump and feature
> gets enabled, users gets used to it and with next rebuild from scratch
> you will be surprised why they are complaining about missing feature
> (happened to me with python + tk).
>

yes there are many other packages including eglibc/glibc which will
not configured same on rebuild.

> So to keep them disabled even for next rebuild after PR bump we should
> put --disable-feature to EXTRA_OECONF to be sure.
>
> But that would make it conflicting for maintainers who are used to have i=
t
> "usually enabled" and "usually disabled".
>
> Which can be solved by DISTRO_FEATURES but some shortcuts like gentoo
> has would be usefull
>
> DEPENDS +=3D tk? ( >=3Ddev-lang/tk-8.0 )
> instead of
> DEPENDS +=3D ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}
>
> $(use_with threads)
> instead of
> ${@base_contains('DISTRO_FEATURES', 'threads', '--with-threads', --withou=
t-threads)}
>
> $(use_enable ipv6)
> instead of
> ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6', --disable-ip=
v6)}
>
> or even
> DEPEND=3D"dev-libs/ecore[evas]"
> instead of
> hoping that ecore was built with evas support
>

yes a more detailed solution is better. you have to go through the
configure of every
package and understand the behavior then act upon. As I said before
its a tedious task


> Regards,
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


