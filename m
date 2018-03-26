Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3277C60102
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:09:01 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id y63so4168813pgy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gJnJ5OH2frLcF3iqSaZ3XVA7ExIhU8sTN4x0LAueFXc=;
	b=co0kCH+ZAKPki/jegeD6eLVIi7LSWtR534dep4QhJHoeIwI3GzWt8n+nlYSbsn23Ka
	Pj0Z6dVgws3BgMpU33JmwOOwackMS0mtC7Tta06PB/fHOT3qDWkpoNFmjMga/VC0MbpV
	9hTBM+WBqu2FM0Ig6UtedRQU2KmrlcK5AV5FnqxJMCVSpn73bR9Bjg+Y43MnsWG0++fU
	qTrVf4p3kd77iY96SDCio8clrhaoYq5jjFWtDx4U2tBJIB/UAWc91SamkPdQ2qBFtJL9
	Rgq0W50frGHHKtDl6J2h3L/ywlBLP7p6AkkITnYVV2nXSiiwCPyyHQnj1H8eOfTY81gj
	mbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gJnJ5OH2frLcF3iqSaZ3XVA7ExIhU8sTN4x0LAueFXc=;
	b=eAZ5Lf4I+u2Un4XTzlg65JnVIcDDNdW2oe32ltOm7xsc4yoV9vC+HGdJH/S/NIxdQJ
	4Dz2fvTj9RHJCuQa8VF2Doeo9xjR7CvZStNCsKG2wCgYjATjlITvB82P7jw45MtIvdgb
	+mZX6WqDL4DeaLGCgs5E+mPlYp4N1yFEu/cQSnvJaGQzuCDUQ6IeQDAuiS2TkpKpQXka
	2EMQSZiGCVehQ88lXjKL/og2WewB7H2wJutFw3D+13B5Pw61iQCg9FVCx48FI3aS6KiC
	KkjgZRjifJGMkbMdmz56Xr4vC0NNlHMECSI7/TUACdGz2UlgSx1+/aItldDewX1/aHMN
	GrwQ==
X-Gm-Message-State: AElRT7EmdUtyRh+PMrUGswgQ6tvQY5leRTx8BGgY2Owtd2dr+bvgcWDB
	PZXKLvI+4aj9zcOZ+PeiJIeCLmtkKTIf6+xnngM=
X-Google-Smtp-Source: AG47ELugSB+tPlorEljctnn9UlUSLlionYQpXJF8Jz5ReRJRF2FVGeL70T7bheukXIaIYx7Z4Nu1uu+tAERRfxyzto4=
X-Received: by 10.99.96.147 with SMTP id u141mr28934974pgb.227.1522073342600; 
	Mon, 26 Mar 2018 07:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180325230452.40908-1-raj.khem@gmail.com>
	<CALbNGRTRsNOgr9AZD+cWeoUmfHKetXgQuGGd0r-yb_h_FU9RJA@mail.gmail.com>
In-Reply-To: <CALbNGRTRsNOgr9AZD+cWeoUmfHKetXgQuGGd0r-yb_h_FU9RJA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Mar 2018 14:08:51 +0000
Message-ID: <CAMKF1sofXkmq=i_F1uH6vO1choZQcMrZ+2kQhPyyN9T0Ba0g0Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/2] qtwebkit: Fix build on armv7ve (rpi)
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
X-List-Received-Date: Mon, 26 Mar 2018 14:09:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 25, 2018 at 11:50 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> On Mon, Mar 26, 2018 at 1:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  recipes-qt/qt5/qtwebkit_git.bb | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/
> qtwebkit_git.bb
> > index b23d4d6..0f5cbbc 100644
> > --- a/recipes-qt/qt5/qtwebkit_git.bb
> > +++ b/recipes-qt/qt5/qtwebkit_git.bb
> > @@ -18,6 +18,19 @@ DEPENDS +=3D "qtbase qtdeclarative icu ruby-native
> sqlite3 glib-2.0 libxslt gperf-
> >  ARM_INSTRUCTION_SET_armv4 =3D "arm"
> >  ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >
> > +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
> > +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
> > +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> > +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2
> (-mthumb).
> > +ARM_INSTRUCTION_SET_armv7a =3D "thumb"
> > +ARM_INSTRUCTION_SET_armv7r =3D "thumb"
> > +ARM_INSTRUCTION_SET_armv7ve =3D "thumb"
> > +
> > +# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> > +# Segmentation fault
> > +GI_DATA_ENABLED_armv7a =3D "False"
> > +GI_DATA_ENABLED_armv7ve =3D "False"
> > +
> >  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
> >  # 5.10.meta-qt5.1
> >  SRC_URI +=3D "\
> > --
> > 2.16.2
> >
> Hmm strange - my builds for Rpi are fine. Are you sure that this is
> not caused by musl in particular gi part?


I transplanted it from oe core the thumb instruction set it what I was
needing I have to test a build without it and you might be right about musl
I should check that too

>
>
> Andreas
>

