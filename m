Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 717 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Apr 2016 22:23:18 UTC
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id AC0FE73218
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 22:23:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1461968599; h=Content-Type: To: From: Subject: Message-ID:
	Date: References: In-Reply-To: MIME-Version: Sender;
	bh=OL0B5cJTilFrfSGjD0R0FGdpmmpUo+V0I0+OPN8NyMk=;
	b=TmUqEgyID1nkvITV2H4Mf9YNe06VK0dB9Bj6zxwHz4eW+WFFozNf+1pXK5FjGlEM6XCwQOJh
	jlI/TC3GLysSj/FZKyo9hTXdfAJzzFprssP+chkZ4wijRua+hzWn3iAgnQI7KbEiFz0IltZY
	MHcrgok1+Y/FZFiVbZQmsv6WeHA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: Date:
	Message-ID: Subject: From: To: Content-Type;
	b=sU/MEyXLdIeSeIDfhW316fIory+LWpjr+Ecyud4ptGMyMAkof6Rg0+xm6kkQtA+QeqYDur
	xXWznv5F9SrVvS8vEVqQvI0KOaAK9nvrC9UL1D/YgHb1zJn1ts38TM8NexVjptogtN+MupK4
	xnQGXLYY370wl0loNf7jn2/8VpOKQ=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mxa.mailgun.org with ESMTP id 5723dbf5.7fa78cdaccb0-in6;
	Fri, 29 Apr 2016 22:11:01 -0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id s8so31776711ign.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 15:11:01 -0700 (PDT)
X-Gm-Message-State: AOPr4FVG+qVv+vlQofqW4RGMY3mhRwOlBGYsWmsNJGy3owuGpCOuebloPMp/V/rBBeDr1JRiQEgWZeQrVHOOjQ==
MIME-Version: 1.0
X-Received: by 10.50.160.41 with SMTP id xh9mr7082487igb.64.1461967861058;
	Fri, 29 Apr 2016 15:11:01 -0700 (PDT)
Received: by 10.107.180.73 with HTTP; Fri, 29 Apr 2016 15:11:01 -0700 (PDT)
In-Reply-To: <36A687F7-36B8-453A-B13D-CF4E8C335CB9@gmail.com>
References: <1461959353-32423-1-git-send-email-derek@asterius.io>
	<36A687F7-36B8-453A-B13D-CF4E8C335CB9@gmail.com>
Date: Fri, 29 Apr 2016 18:11:01 -0400
X-Gmail-Original-Message-ID: <CADNbA1oQNj0NfZvWJAvq9pU2PZye8ZE76WDHxXgN3q0C2y8KEw@mail.gmail.com>
Message-ID: <CADNbA1oQNj0NfZvWJAvq9pU2PZye8ZE76WDHxXgN3q0C2y8KEw@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] tinymembench: update to version 0.4.0 plus bux fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Apr 2016 22:23:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ah.  That makes more sense why ARM_INSTRUCTION_SET is there.  It still
fails to build with thumb, so I reverted that portion of the patch.  Thanks=
!

On Fri, Apr 29, 2016 at 5:57 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Apr 29, 2016, at 12:49 PM, Derek Straka <derek@asterius.io> wrote:
> >
> > Removed ARM_INSTRUCTION_SET since it builds on qemuarm and qemuarm64
> without issues
> > Also tested the build on qemuppc and qemux86-64
>
>
> For test, you need to set ARM_INSTRUCTION_SET =3D =E2=80=9Cthumb=E2=80=9D=
 in this recipe and
> see if that works for qemuarm
> if that does then it can be removed.
>
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> > meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb | 12
> ++----------
> > 1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> > index 9898a70..a675bda 100644
> > --- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> > +++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> > @@ -6,9 +6,9 @@ HOMEPAGE =3D "https://github.com/ssvb/tinymembench/wiki=
"
> > LICENSE =3D "MIT"
> > LIC_FILES_CHKSUM =3D
> "file://main.c;endline=3D22;md5=3D879b9bbb60851454885b5fa47eb6b345"
> >
> > -PV =3D "0.3.9+git${SRCPV}"
> > +PV =3D "0.4.0+git${SRCPV}"
> >
> > -SRCREV =3D "95e68477588d41187b2d2e52ecf6be0e7eb06b8d"
> > +SRCREV =3D "2c789849709d837b4bd114c11ed2d9bdc65afbc6"
> > SRC_URI =3D "git://github.com/ssvb/tinymembench.git"
> >
> > S =3D "${WORKDIR}/git"
> > @@ -17,11 +17,3 @@ do_install() {
> >     install -d ${D}${bindir}
> >     install -m755 tinymembench ${D}${bindir}/
> > }
> > -
> > -# Fails to build with thumb-1 (qemuarm)
> > -#| {standard input}: Assembler messages:
> > -#| {standard input}:66: Error: instruction not supported in Thumb16
> mode -- `subs r1,r1,#16'
> > -#| {standard input}:69: Error: instruction not supported in Thumb16
> mode -- `subs r1,r1,#16'
> > -#| {standard input}:82: Error: selected processor does not support
> Thumb mode `mla r3,r4,r3,r5'
> > -#| {standard input}:82: Error: unshifted register required -- `and
> r8,r7,r3,lsr#16'
> > -ARM_INSTRUCTION_SET =3D "arm"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

