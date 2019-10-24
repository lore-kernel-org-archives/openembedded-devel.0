Return-Path: <keton22@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2F07F96D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:48:41 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id u13so1200213ote.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=G1VJfjWOqlfrdzPIdubmgcQ5PK4wsocVArmd872JCW8=;
	b=A9pw0X3vofYovpX15eaablVxpIgKfCKutcTLpUIURqamVfgtOJ8UMoUD7Et6t7L7By
	jnOtn9OJwADc9kgTCMzwU6EXyO6HcJCIjoHDmQBS9YUVrFGm7wEeqRUPNZ9k+kztX94S
	KH3y58zb7LZgy2A3hDjK78+yd7A61fuL0XJ4hTj8tfNnq12eQjQBgLW7jzpTqtqkq3nW
	MrNaj2373nn5OHabM96Gp3nvEZd+9rXxrxuLvYZ8maCuANdPXbf5tWg9eaeK5w3jiuLX
	hetnKR8PzC7a9nwpk8ZHIe+MNZOHKc8u7+Rh6AefpvpZIK6qJU6vgZQywN5QOGJOjDNT
	dYtQ==
X-Gm-Message-State: APjAAAWCJZxIbYCOG0Sv0PP38wZbXrOTugh9EqrXYCpane6YsZcgNQiM
	ia3nHEbw5wPeLuEQkotzIUrtTaO+ek0=
X-Google-Smtp-Source: APXvYqx2szrIWqpXkzzdBEFgdTPzXuSPbucrQ2CmpOpIPXSPwHP8jxcizLi8Kw8HXW+x1+K66BT6Pg==
X-Received: by 2002:a05:6830:1099:: with SMTP id
	y25mr10398550oto.113.1571906921965; 
	Thu, 24 Oct 2019 01:48:41 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
	[209.85.210.50])
	by smtp.gmail.com with ESMTPSA id i5sm6908288otk.10.2019.10.24.01.48.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 24 Oct 2019 01:48:41 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id m19so19994376otp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:48:41 -0700 (PDT)
X-Received: by 2002:a9d:620a:: with SMTP id g10mr10852582otj.318.1571906921244;
	Thu, 24 Oct 2019 01:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNJ+3e6C_gwQ7Oyq0xKTiDCo47SHcr5naChERq0wFrk+r7N9w@mail.gmail.com>
	<CAMKF1sr3YHNUOm=7AEU6VZJDSy-3CdeVgOXAiUvM0Z9e0n+4Sg@mail.gmail.com>
In-Reply-To: <CAMKF1sr3YHNUOm=7AEU6VZJDSy-3CdeVgOXAiUvM0Z9e0n+4Sg@mail.gmail.com>
From: =?UTF-8?Q?Micha=C5=82_Lower?= <michal@pcb.red>
Date: Thu, 24 Oct 2019 10:48:29 +0200
X-Gmail-Original-Message-ID: <CAJNJ+3daY1os_VUtVg8AU+POUK+E6q6GF-FkMx9dWfOEAmygEw@mail.gmail.com>
Message-ID: <CAJNJ+3daY1os_VUtVg8AU+POUK+E6q6GF-FkMx9dWfOEAmygEw@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Oct 2019 08:48:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> please use git format-patch to generate it
This is exactly what I've did. Sadly it appears that Gmail inserts
line breaks on its own. Can I send the patch as an attachment so it
will be kept intact? I cannot use git send-email since it doesn't
support gmail two actor authentication and my account doesn't allow
for application passwords.

czw., 24 pa=C5=BA 2019 o 10:18 Khem Raj <no-reply@forwardemail.net> napisa=
=C5=82(a):
>
> Hi Micha=C5=82
>
> This patch appears malformed. So please use git format-patch to
> generate it and git send-email to send it also rebase it on top of
> latest master
>
> On Tue, Oct 22, 2019 at 9:03 AM Micha=C5=82 Lower <michal@pcb.red> wrote:
> >
> > Previous version fails to compile for zeus branch. Upgrading fixes that=
.
> >
> > Signed-off-by: Michal Lower <michal at pcb.red>
> > ---
> >  meta-python/recipes-devtools/python/python-setuptools-scm.inc | 4 ++--
> >  ...setuptools-scm_2.1.0.bb =3D> python-setuptools-scm_3.3.3.bb} | 0
> >  ...etuptools-scm_2.1.0.bb =3D> python3-setuptools-scm_3.3.3.bb} | 0
> >  3 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-setuptools-scm_2.1.=
0.bb
> > =3D> python-setuptools-scm_3.3.3.bb} (100%)
> >  rename meta-python/recipes-devtools/python/{python3-setuptools-scm_2.1=
.0.bb
> > =3D> python3-setuptools-scm_3.3.3.bb} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.=
inc
> > b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> > index 98883ec39..a7e1bf6ad 100644
> > --- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> > +++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> > @@ -2,8 +2,8 @@ SUMMARY =3D "the blessed package to manage your version=
s
> > by scm tags"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> > "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D8227180126797a0148f94f=
483f3e1489"
> >
> > -SRC_URI[md5sum] =3D "cfec5d2dbbd0a85c40066f79035b5878"
> > -SRC_URI[sha256sum] =3D
> > "a767141fecdab1c0b3c8e4c788ac912d7c94a0d6c452d40777ba84f918316379"
> > +SRC_URI[md5sum] =3D "50b2199082fe808d032ec1710c9d7415"
> > +SRC_URI[sha256sum] =3D
> > "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"
> >
> >  PYPI_PACKAGE =3D "setuptools_scm"
> >  inherit pypi
> > diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_=
2.1.0.bb
> > b/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python-setuptools-scm_2=
.1.0.bb
> > rename to meta-python/recipes-devtools/python/python-setuptools-scm_3.3=
.3.bb
> > diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm=
_2.1.0.bb
> > b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python3-setuptools-scm_=
2.1.0.bb
> > rename to meta-python/recipes-devtools/python/python3-setuptools-scm_3.=
3.3.bb
> > --
> > 2.17.1
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

