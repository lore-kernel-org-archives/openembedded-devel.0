Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MkKTE-0000RQ-70
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 18:20:09 +0200
Received: by qw-out-1920.google.com with SMTP id 4so473889qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Sep 2009 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=EUx29m2b85wRM6cmd/3366+dmUrMCLlrKdQ7t1mcXiY=;
	b=ZtPrPRQLpGrw7THynkbPng6emdG+pClXGELAusKJOK8DiGMPU7DlQXodITRLlnCPdc
	Nso4+dZv4ZHSFTB8Yxy2aj6l7GzFHy6HGA1tuYPzMMSIc+9HqSh/pYpZFVOQ8Ws7mr86
	DdndlkbIqZ63QdQK5flC4atIaUxasDBoOtSVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=jSa0GMpHA59l4+Y7i4PgCyt4Ep6cd0z0iFkiHo+mHV15GSrl5y+ESJkc5CtSx/LLNy
	5bglVS3RrkiQT/JvGV0Afz53qpIrW0W9lR0YBSzR7UWp55Q9mfsHKRjaT/VZrCK3DfVi
	suiohQGkKYFaO9kZHorOPYGWJAbHuM71NbAnI=
MIME-Version: 1.0
Received: by 10.229.16.73 with SMTP id n9mr400761qca.70.1252252852794; Sun, 06 
	Sep 2009 09:00:52 -0700 (PDT)
In-Reply-To: <27c25bc40909060241v5be9aca0xb2d6c647b03179ba@mail.gmail.com>
References: <27c25bc40909050924o3632ba7dp8dd84e950a689617@mail.gmail.com>
	<19c1b8a90909051050s382dcbf1of5aed8482cfd25aa@mail.gmail.com>
	<1252181231.4490.148.camel@lenovo.internal.reciva.com>
	<19c1b8a90909051341w882f41aj9ed35a381eb3377a@mail.gmail.com>
	<27c25bc40909060001w4e236953v4503216cac29a12f@mail.gmail.com>
	<19c1b8a90909060117p70dbda1fk4df80fb3dcb55aed@mail.gmail.com>
	<27c25bc40909060241v5be9aca0xb2d6c647b03179ba@mail.gmail.com>
Date: Sun, 6 Sep 2009 09:00:52 -0700
Message-ID: <19c1b8a90909060900j42372a1dl75a07e300efb8f11@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: unable to bitbake ortp
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
X-List-Received-Date: Sun, 06 Sep 2009 16:20:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2009 at 2:41 AM, Juan Backson<juanbackson@gmail.com> wrote:
> Hi,
>
> This may be a pretty dumb question.
>
> I tried to git pull, but I am getting:
>
> OE:beagleboard [juan@localhost openembedded]$ git pull
> Already up-to-date.
>
> Is it something to do with my config or I should remove something for it =
to
> recognize that it is not the latest build?

what branch are you on?
Try to see git log and see if you have latest commits.

and finally stop top posting. Its hard to follow threads with top posting.

>
> Thanks,
> jb
> On Sun, Sep 6, 2009 at 4:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sun, Sep 6, 2009 at 12:01 AM, Juan Backson<juanbackson@gmail.com>
>> wrote:
>> > Hi
>> >
>> > I have the following in my ortp0.7 recipe. =C2=A0How should I change i=
t to get
>> > bitbake to work?
>>
>> I have committed a fix for it on .dev if you are using .dev branch
>> just update your copy.
>>
>>
>> >
>> > DESCRIPTION =3D "An LGPL implementation of RTP - RFC3550"
>> > LICENSE =3D "LGPL"
>> > DEPENDS =3D "glibc"
>> >
>> > PR =3D "r1"
>> >
>> > inherit autotools pkgconfig
>> >
>> > SRC_URI =3D "
>> >
>> http://download.savannah.nongnu.org/releases/linphone/${PN}/sources/${P}=
.tar.gz
>> > "
>> >
>> > do_compile_append() {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e s:${STAGING_DIR_TARGET}::g \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e s:/${TARGET_SYS}::=
g \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ortp.pc
>> >
>> > }
>>
>> =C2=A0_______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


