Return-Path: <marek.bykowski@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 951237F993
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:45:43 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id v138so1145540oif.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hyyncmvXG9++fMo8SUnuBFsAcNCaTkc7c7W3RdNbY0U=;
	b=DoQDDoHJMhRHDVgzIOQWGr9QRi9g3Y/91Wqf0Z61KXNJbCqM944OU8sRiaRfpq/8eu
	8fWfNiHGX9vc0i6m2/lxt+GzSih0wGPrpjvrl2SjcXcrn7qru+DZn+rUnZWAXdE3kefW
	/+p5VTxOgvRy1nEmOUsw3B+N3DMClgmBlvJUfF9v95FxK46hmBU3PUr9e9UFU9b/D5ts
	llbefgF602evSbkwc10i6G+KBlYTmGb2ZgOC1UvUlldvfWEzZPlxMx/rDCL64C7EUO0S
	8RFUXPkQL5/FYcfQC/GHBvqRANQ21oq3+b/MJ1bwvVIhKKzqcXNCCPVCT9tVAaXdWO3m
	LiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hyyncmvXG9++fMo8SUnuBFsAcNCaTkc7c7W3RdNbY0U=;
	b=KKNL3W9dNiU5ZRVpQ+etYhbiw8xsK93cAGPOfpSCzzY5kpDGWmgNSHxPB1gZk/Jofy
	SLjzmjo1PLN52WOUnRElgT/8x1hCdJf9ppTdIFm+TVAozsnztF5ZcgvsEOfYLP/6olgW
	cKaHUTDJ3Ftm0QDb+yKavEPujPsd255k9ygGE312wGkl3K3Y36bMMLP64F+qPtbSwc8D
	536M9mJzkCZuwuijiizAHSXrAqo03M5wnqK3DHHs2swvMBxRZ/8kgJpsu3HE+ovYg3QK
	O3Lko7zX7JRNvEvgtmr1cd/COfLZLKrbUi/zN3g8AUkD/Zny/i++ziHbKb/pWEi4RzA7
	34/A==
X-Gm-Message-State: APjAAAUjtYpqbqSDer2mKORA85B1QCYw2iz/5AMFKs5voVuVkpz/qZB5
	vuhpgRMhaDWhiDjOgh3LXkYYgyQphFAjIIcLo3o=
X-Google-Smtp-Source: APXvYqy+n4mnR5zW7uvZm2qf/vGhngU5HCAR37zFX6Oiqfsgj/fSYNR+y5uVQBRt8U4hFgRGAT8QuXCJ8Cb5FUWt7P4=
X-Received: by 2002:aca:4c86:: with SMTP id z128mr3919121oia.91.1571910344199; 
	Thu, 24 Oct 2019 02:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNJ+3e6C_gwQ7Oyq0xKTiDCo47SHcr5naChERq0wFrk+r7N9w@mail.gmail.com>
	<CAMKF1sr3YHNUOm=7AEU6VZJDSy-3CdeVgOXAiUvM0Z9e0n+4Sg@mail.gmail.com>
	<CAJNJ+3daY1os_VUtVg8AU+POUK+E6q6GF-FkMx9dWfOEAmygEw@mail.gmail.com>
	<CAMKF1soZwpo0YewBPFJRqg6BQRkftPfcMLn91Vj=J538wox-2w@mail.gmail.com>
	<CAJNJ+3eixSQNxEd1WQKfucQ0ySh4N1qR9oGK=wLh=TrNN66M9g@mail.gmail.com>
In-Reply-To: <CAJNJ+3eixSQNxEd1WQKfucQ0ySh4N1qR9oGK=wLh=TrNN66M9g@mail.gmail.com>
From: Marek <marek.bykowski@gmail.com>
Date: Thu, 24 Oct 2019 11:45:32 +0200
Message-ID: <CAHw2UgD3Vbt6t=+oYvJec7k2g0xWEyqFr6DvC-9TtnJVvgvHUg@mail.gmail.com>
To: =?UTF-8?Q?Micha=C5=82_Lower?= <michal@pcb.red>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] update python setuptools-scm from 2.1.0 to 3.3.3
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
X-List-Received-Date: Thu, 24 Oct 2019 09:45:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Or use any other email client like Claws, works perfectly for upstream patc=
hes

On Thu, 24 Oct 2019 at 11:07, Micha=C5=82 Lower <michal@pcb.red> wrote:
>
> thanks for the hint, will do.
>
> czw., 24 pa=C5=BA 2019 o 11:03 Khem Raj <no-reply@forwardemail.net> napis=
a=C5=82(a):
> >
> > On Thu, Oct 24, 2019 at 9:48 AM Micha=C5=82 Lower <michal@pcb.red> wrot=
e:
> > >
> > > > please use git format-patch to generate it
> > > This is exactly what I've did. Sadly it appears that Gmail inserts
> > > line breaks on its own. Can I send the patch as an attachment so it
> > > will be kept intact? I cannot use git send-email since it doesn't
> > > support gmail two actor authentication and my account doesn't allow
> > > for application passwords.
> >
> > yeah I see. if you use github then send a pull request against
> > https://github.com/openembedded/meta-openembedded
> > I do process that as well.
> >
> > >
> > > czw., 24 pa=C5=BA 2019 o 10:18 Khem Raj <no-reply@forwardemail.net> n=
apisa=C5=82(a):
> > > >
> > > > Hi Micha=C5=82
> > > >
> > > > This patch appears malformed. So please use git format-patch to
> > > > generate it and git send-email to send it also rebase it on top of
> > > > latest master
> > > >
> > > > On Tue, Oct 22, 2019 at 9:03 AM Micha=C5=82 Lower <michal@pcb.red> =
wrote:
> > > > >
> > > > > Previous version fails to compile for zeus branch. Upgrading fixe=
s that.
> > > > >
> > > > > Signed-off-by: Michal Lower <michal at pcb.red>
> > > > > ---
> > > > >  meta-python/recipes-devtools/python/python-setuptools-scm.inc | =
4 ++--
> > > > >  ...setuptools-scm_2.1.0.bb =3D> python-setuptools-scm_3.3.3.bb} =
| 0
> > > > >  ...etuptools-scm_2.1.0.bb =3D> python3-setuptools-scm_3.3.3.bb} =
| 0
> > > > >  3 files changed, 2 insertions(+), 2 deletions(-)
> > > > >  rename meta-python/recipes-devtools/python/{python-setuptools-sc=
m_2.1.0.bb
> > > > > =3D> python-setuptools-scm_3.3.3.bb} (100%)
> > > > >  rename meta-python/recipes-devtools/python/{python3-setuptools-s=
cm_2.1.0.bb
> > > > > =3D> python3-setuptools-scm_3.3.3.bb} (100%)
> > > > >
> > > > > diff --git a/meta-python/recipes-devtools/python/python-setuptool=
s-scm.inc
> > > > > b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> > > > > index 98883ec39..a7e1bf6ad 100644
> > > > > --- a/meta-python/recipes-devtools/python/python-setuptools-scm.i=
nc
> > > > > +++ b/meta-python/recipes-devtools/python/python-setuptools-scm.i=
nc
> > > > > @@ -2,8 +2,8 @@ SUMMARY =3D "the blessed package to manage your v=
ersions
> > > > > by scm tags"
> > > > >  LICENSE =3D "MIT"
> > > > >  LIC_FILES_CHKSUM =3D
> > > > > "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D8227180126797a01=
48f94f483f3e1489"
> > > > >
> > > > > -SRC_URI[md5sum] =3D "cfec5d2dbbd0a85c40066f79035b5878"
> > > > > -SRC_URI[sha256sum] =3D
> > > > > "a767141fecdab1c0b3c8e4c788ac912d7c94a0d6c452d40777ba84f918316379=
"
> > > > > +SRC_URI[md5sum] =3D "50b2199082fe808d032ec1710c9d7415"
> > > > > +SRC_URI[sha256sum] =3D
> > > > > "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5=
"
> > > > >
> > > > >  PYPI_PACKAGE =3D "setuptools_scm"
> > > > >  inherit pypi
> > > > > diff --git a/meta-python/recipes-devtools/python/python-setuptool=
s-scm_2.1.0.bb
> > > > > b/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3=
.bb
> > > > > similarity index 100%
> > > > > rename from meta-python/recipes-devtools/python/python-setuptools=
-scm_2.1.0.bb
> > > > > rename to meta-python/recipes-devtools/python/python-setuptools-s=
cm_3.3.3.bb
> > > > > diff --git a/meta-python/recipes-devtools/python/python3-setuptoo=
ls-scm_2.1.0.bb
> > > > > b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.=
3.bb
> > > > > similarity index 100%
> > > > > rename from meta-python/recipes-devtools/python/python3-setuptool=
s-scm_2.1.0.bb
> > > > > rename to meta-python/recipes-devtools/python/python3-setuptools-=
scm_3.3.3.bb
> > > > > --
> > > > > 2.17.1
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--=20
Sl=C3=A1n,
Marek

