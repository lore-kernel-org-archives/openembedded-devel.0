Return-Path: <keton22@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 019977F820
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:07:18 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id a15so20004386oic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 02:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=a5raO8aEOomW7wegGy1GsN+zX45CZyBwCG2Cb5TCyt4=;
	b=eYxw6kGC46lfe73Zg9Ok18iHdsbltcoS4HpUQKpCUMEFwRPrUx27cBfYocYhsUEzL2
	paByYt3E+JwzyzOBMLFJd/tvUeqM2k14j8A4wi9rqB2/3uOddkELjEOp9E94ozDjW2hU
	IemacPB3kTACLJ9HDsz1Q29jZqRRscF05BBK6tpBFPWC8h8EkzLNEIXNs5DB9mieqQ+U
	kbISiS3np3T5r++hJD+LOBUympxSV7vOxdMQcZGrPLWFoV+BWTlnO0UskbHjDwTMYNDb
	FmMAtV+0FMOFHYorjNobHeM/X1Yr/l8vDiYqScIDJyvZikala+jS0z9c+dCKiGFMzq5O
	Er4g==
X-Gm-Message-State: APjAAAWKDoiPTx7yoBO3D325SqVGakdu0/vMEVeO1aZiw9qhlrQcYRS/
	BecQ+AlSpxniAdBPD3fP3IUGOPriU0g=
X-Google-Smtp-Source: APXvYqzPGKZFF+0mDo/5bYDgjRnvw59bbpXlLA5QrHAPtIJLTp8xzy9HqIvbgDkI+LGsW8+JzXFH4w==
X-Received: by 2002:aca:100f:: with SMTP id 15mr3784118oiq.166.1571908039729; 
	Thu, 24 Oct 2019 02:07:19 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
	[209.85.210.53])
	by smtp.gmail.com with ESMTPSA id o2sm7013968ota.3.2019.10.24.02.07.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 24 Oct 2019 02:07:19 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id n48so5071015ota.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 02:07:19 -0700 (PDT)
X-Received: by 2002:a9d:3476:: with SMTP id
	v109mr10672234otb.211.1571908039142; 
	Thu, 24 Oct 2019 02:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNJ+3e6C_gwQ7Oyq0xKTiDCo47SHcr5naChERq0wFrk+r7N9w@mail.gmail.com>
	<CAMKF1sr3YHNUOm=7AEU6VZJDSy-3CdeVgOXAiUvM0Z9e0n+4Sg@mail.gmail.com>
	<CAJNJ+3daY1os_VUtVg8AU+POUK+E6q6GF-FkMx9dWfOEAmygEw@mail.gmail.com>
	<CAMKF1soZwpo0YewBPFJRqg6BQRkftPfcMLn91Vj=J538wox-2w@mail.gmail.com>
In-Reply-To: <CAMKF1soZwpo0YewBPFJRqg6BQRkftPfcMLn91Vj=J538wox-2w@mail.gmail.com>
From: =?UTF-8?Q?Micha=C5=82_Lower?= <michal@pcb.red>
Date: Thu, 24 Oct 2019 11:07:07 +0200
X-Gmail-Original-Message-ID: <CAJNJ+3eixSQNxEd1WQKfucQ0ySh4N1qR9oGK=wLh=TrNN66M9g@mail.gmail.com>
Message-ID: <CAJNJ+3eixSQNxEd1WQKfucQ0ySh4N1qR9oGK=wLh=TrNN66M9g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 24 Oct 2019 09:07:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks for the hint, will do.

czw., 24 pa=C5=BA 2019 o 11:03 Khem Raj <no-reply@forwardemail.net> napisa=
=C5=82(a):
>
> On Thu, Oct 24, 2019 at 9:48 AM Micha=C5=82 Lower <michal@pcb.red> wrote:
> >
> > > please use git format-patch to generate it
> > This is exactly what I've did. Sadly it appears that Gmail inserts
> > line breaks on its own. Can I send the patch as an attachment so it
> > will be kept intact? I cannot use git send-email since it doesn't
> > support gmail two actor authentication and my account doesn't allow
> > for application passwords.
>
> yeah I see. if you use github then send a pull request against
> https://github.com/openembedded/meta-openembedded
> I do process that as well.
>
> >
> > czw., 24 pa=C5=BA 2019 o 10:18 Khem Raj <no-reply@forwardemail.net> nap=
isa=C5=82(a):
> > >
> > > Hi Micha=C5=82
> > >
> > > This patch appears malformed. So please use git format-patch to
> > > generate it and git send-email to send it also rebase it on top of
> > > latest master
> > >
> > > On Tue, Oct 22, 2019 at 9:03 AM Micha=C5=82 Lower <michal@pcb.red> wr=
ote:
> > > >
> > > > Previous version fails to compile for zeus branch. Upgrading fixes =
that.
> > > >
> > > > Signed-off-by: Michal Lower <michal at pcb.red>
> > > > ---
> > > >  meta-python/recipes-devtools/python/python-setuptools-scm.inc | 4 =
++--
> > > >  ...setuptools-scm_2.1.0.bb =3D> python-setuptools-scm_3.3.3.bb} | =
0
> > > >  ...etuptools-scm_2.1.0.bb =3D> python3-setuptools-scm_3.3.3.bb} | =
0
> > > >  3 files changed, 2 insertions(+), 2 deletions(-)
> > > >  rename meta-python/recipes-devtools/python/{python-setuptools-scm_=
2.1.0.bb
> > > > =3D> python-setuptools-scm_3.3.3.bb} (100%)
> > > >  rename meta-python/recipes-devtools/python/{python3-setuptools-scm=
_2.1.0.bb
> > > > =3D> python3-setuptools-scm_3.3.3.bb} (100%)
> > > >
> > > > diff --git a/meta-python/recipes-devtools/python/python-setuptools-=
scm.inc
> > > > b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> > > > index 98883ec39..a7e1bf6ad 100644
> > > > --- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> > > > +++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> > > > @@ -2,8 +2,8 @@ SUMMARY =3D "the blessed package to manage your ver=
sions
> > > > by scm tags"
> > > >  LICENSE =3D "MIT"
> > > >  LIC_FILES_CHKSUM =3D
> > > > "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D8227180126797a0148=
f94f483f3e1489"
> > > >
> > > > -SRC_URI[md5sum] =3D "cfec5d2dbbd0a85c40066f79035b5878"
> > > > -SRC_URI[sha256sum] =3D
> > > > "a767141fecdab1c0b3c8e4c788ac912d7c94a0d6c452d40777ba84f918316379"
> > > > +SRC_URI[md5sum] =3D "50b2199082fe808d032ec1710c9d7415"
> > > > +SRC_URI[sha256sum] =3D
> > > > "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"
> > > >
> > > >  PYPI_PACKAGE =3D "setuptools_scm"
> > > >  inherit pypi
> > > > diff --git a/meta-python/recipes-devtools/python/python-setuptools-=
scm_2.1.0.bb
> > > > b/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.b=
b
> > > > similarity index 100%
> > > > rename from meta-python/recipes-devtools/python/python-setuptools-s=
cm_2.1.0.bb
> > > > rename to meta-python/recipes-devtools/python/python-setuptools-scm=
_3.3.3.bb
> > > > diff --git a/meta-python/recipes-devtools/python/python3-setuptools=
-scm_2.1.0.bb
> > > > b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.=
bb
> > > > similarity index 100%
> > > > rename from meta-python/recipes-devtools/python/python3-setuptools-=
scm_2.1.0.bb
> > > > rename to meta-python/recipes-devtools/python/python3-setuptools-sc=
m_3.3.3.bb
> > > > --
> > > > 2.17.1
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

