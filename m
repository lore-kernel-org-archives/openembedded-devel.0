Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3ABF771AB3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 15:43:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o81so10386207wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 08:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=mskBmrQKeUskzwfe21l6WpVAtoeGfiXtypj5Z+/2YTU=;
	b=VZuAJep2lqPER+yy/LZ/EHyZL7YYhZf+l+zn4ISVSHntDtmhADfHmTVxFS2A7PqRiH
	HxZHGsrRuowKcuCCeRBrVjJkQLTQl5LjFptpy2YEiJIioKM8tPOcDMrGiznE4QG2c0kU
	7f1WaHpyP3LBOKWV9xj+K8/qhNjlBwUImj2zc6GseD3AMhMSlgcAciLfeY58X8wyFkWC
	LTabNnRonvnNvca/Wrck4vJSW1iu+BHWBQIjPubgQP6anu+VTQPAiyeNzsRvGY1po9Yc
	E2gvFE1RW96vUVa3CDJajjAmcIHG5Fa/AceQ03l2TbU0CgbTLJJjocDAFpRub8vmsThQ
	EpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=mskBmrQKeUskzwfe21l6WpVAtoeGfiXtypj5Z+/2YTU=;
	b=Ze3gk+U3am6KIxo+y98XEARhg/m0qA82Atw4zsCuRpnwuAPXwPiIuswd5KmJnCqliy
	HlZbu6RGfmtqR4puAalMhS/2IdmxEJtp32DluHrJ6dYiYmm5c12zKbHOOWErvm7O7So5
	xlWDGtZXSbEcT6F18S/qFYEEnhpARpdjoqvTJZtnYK3jrF4FkBMVDIRKGx6PMOHOW4cX
	WIA3MjXVFmFlVk7eCM1hpDY5x4C01JFOcMm6fpeMpQiCchKFKlJmm4W9BOHKfzALcO+r
	JaRSwYIzhEJKzQ9n6Nkswlzt3HG3hUFkvlddZ5H2fgyBr4RcBIEQ6MsGKxKOHavi6oZn
	N9/A==
X-Gm-Message-State: ABUngvc6eo+EYPwH/iHrFWQzP1Fj3alCnFGyh2+pLeg+ljxmD8QGprRya1F+ENolm17JqKcaWejZFSGJj0+kcw==
X-Received: by 10.194.83.166 with SMTP id r6mr12311911wjy.186.1477323831660;
	Mon, 24 Oct 2016 08:43:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.159.203 with HTTP; Mon, 24 Oct 2016 08:43:50 -0700 (PDT)
In-Reply-To: <f831f9a9-d2e3-9fd3-41f9-d8479a933a1a@balister.org>
References: <1477052056-14472-1-git-send-email-philip@balister.org>
	<36CFFABF-F18A-405E-BA43-08713EC46478@gmail.com>
	<f831f9a9-d2e3-9fd3-41f9-d8479a933a1a@balister.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Oct 2016 17:43:50 +0200
Message-ID: <CA+chaQd09rwPViw9bwaXT3cpNqhGPE3k_4=Ud3cFOxPWi6E4Uw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] fftw: Allow an empty package for fftw.
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
X-List-Received-Date: Mon, 24 Oct 2016 15:43:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

RDEPENDS_${PN}-dev_remove =3D =E2=80=9C${PN}=E2=80=9D

doesn't work?

On Sat, Oct 22, 2016 at 1:05 AM, Philip Balister <philip@balister.org>
wrote:

> On 10/21/2016 01:08 PM, Khem Raj wrote:
> >
> >> On Oct 21, 2016, at 5:14 AM, Philip Balister <philip@balister.org>
> wrote:
> >>
> >> The fftw-dev package RDEPENDS on the fftw package. Let the recipe
> create an
> >> empty one to satisfy this requirement.
> >>
> >> Signed-off-by: Philip Balister <philip@balister.org>
> >> ---
> >> meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 2 ++
> >> 1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
> b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
> >> index 0faaea1..0bb6cc2 100644
> >> --- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
> >> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
> >> @@ -69,4 +69,6 @@ FILES_fftwl-wisdom =3D "${bindir}/fftwl-wisdom"
> >> FILES_fftwf-wisdom =3D "${bindir}/fftwf-wisdom"
> >> FILES_fftw-wisdom-to-conf =3D "${bindir}/fftw-wisdom-to-conf"
> >>
> >> +ALLOW_EMPTY_${PN}=3D =E2=80=9C1"
> >
> > as Martin said
> >
> > RDEPENDS_${PN}-dev =3D =E2=80=9C=E2=80=9D
> >
> > should be done.
>
> It also RDEPENDS on libfftw libfftwf and libfftwl.
>
> Is there a way to remove just one entry in the RDEPENDS line? Need to
> think through exactly what is going on.
>
> Philip
>
> >
> >> +
> >> BBCLASSEXTEND =3D "native"
> >> --
> >> 2.5.5
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

