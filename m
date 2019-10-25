Return-Path: <keton22@gmail.com>
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
	[209.85.219.179])
	by mail.openembedded.org (Postfix) with ESMTP id 67D607FA91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 17:38:15 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id m1so1187754ybm.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 10:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eNUkjKFyd2jEgVek2ap/TABvJ0hB6zNeXPPPARbSGsI=;
	b=Dh501gkDEb+j3ClQY7RxYZ9PlDyHjHiB/lc4yta0u9xnKcgDiECEnVxb4fJeT1VUzT
	/jbzXKAkGG7/BLjGR3YKaO7EhHIaa2rM8UqUlDdGlwo5hIRlV2nVONcISbCJH45FB6if
	CYl7AkL0PrCpr7vNYCcCxUfQHKUUrzy6CBnfvE59xzIj2VPJ+vqjuVoI80WgXZdeuTXG
	n5dbgcH+T8t/eQbAhZabcgCI/Xjx+m6jrtx4ZdrCL8J2+uquLWRvzUiG4JhBvipeMqhk
	xtVAGvWaDeKsULMNdTgo4noiTa10DORVCjOOTbGScozrOSy8T9K0hi7tVznO1vRcK7iV
	5W6A==
X-Gm-Message-State: APjAAAWHVVDfhscH6t2uuZMR8nuxQb65cMXiJvR25f/Qo5WvaD0mLVm+
	TY5yKWOO+iYw4GZy8eCNc3mczIZMbtg=
X-Google-Smtp-Source: APXvYqwLoqN8syPuwhTrZhFWovHvLeAebs58Mmjw4Z0PWZnmXcsCb06gc2Sg4Boia0k6HrWreLK+wA==
X-Received: by 2002:a25:4b04:: with SMTP id y4mr4148392yba.480.1572025095466; 
	Fri, 25 Oct 2019 10:38:15 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
	[209.85.219.181]) by smtp.gmail.com with ESMTPSA id
	z139sm3513551ywz.32.2019.10.25.10.38.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 25 Oct 2019 10:38:15 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id w5so936026ybs.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 10:38:14 -0700 (PDT)
X-Received: by 2002:a25:71c1:: with SMTP id m184mr4315550ybc.167.1572025094300;
	Fri, 25 Oct 2019 10:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNJ+3e6C_gwQ7Oyq0xKTiDCo47SHcr5naChERq0wFrk+r7N9w@mail.gmail.com>
	<CAMKF1sr3YHNUOm=7AEU6VZJDSy-3CdeVgOXAiUvM0Z9e0n+4Sg@mail.gmail.com>
	<CAJNJ+3daY1os_VUtVg8AU+POUK+E6q6GF-FkMx9dWfOEAmygEw@mail.gmail.com>
	<CAMKF1soZwpo0YewBPFJRqg6BQRkftPfcMLn91Vj=J538wox-2w@mail.gmail.com>
	<CAJNJ+3eixSQNxEd1WQKfucQ0ySh4N1qR9oGK=wLh=TrNN66M9g@mail.gmail.com>
	<CAHw2UgD3Vbt6t=+oYvJec7k2g0xWEyqFr6DvC-9TtnJVvgvHUg@mail.gmail.com>
	<c5392435-2c09-873a-235d-206fa0d9d026@windriver.com>
In-Reply-To: <c5392435-2c09-873a-235d-206fa0d9d026@windriver.com>
From: =?UTF-8?Q?Micha=C5=82_Lower?= <michal@pcb.red>
Date: Fri, 25 Oct 2019 19:38:02 +0200
X-Gmail-Original-Message-ID: <CAJNJ+3dNMLwxy-Uxi1LVVeY6BhdwsxV4QdvtwhVR5oKOKAtkcw@mail.gmail.com>
Message-ID: <CAJNJ+3dNMLwxy-Uxi1LVVeY6BhdwsxV4QdvtwhVR5oKOKAtkcw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
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
X-List-Received-Date: Fri, 25 Oct 2019 17:38:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All Gmail + git send-email doc's I've found use application passwords.
I can't use this feature since I have hardware two factor enforced on
my account (I believe it's called advanced security or something like
that).
I've used GitHub to submit this patch:
https://github.com/openembedded/meta-openembedded/pull/151
From my point of view it would be great if docs mentioned option to
submit patches via github.

pt., 25 pa=C5=BA 2019 o 19:31 Randy MacLeod <no-reply@forwardemail.net> nap=
isa=C5=82(a):
>
> On 10/24/19 5:45 AM, Marek wrote:
> > Or use any other email client like Claws, works perfectly for upstream =
patches
>
> Marek,
>    Is the client going to behave better than git send-email?
>
> Micha=C5=82,
>
> Did you look at:
>    https://git-scm.com/docs/git-send-email/
> for:
>    "Use gmail as the smtp server" ?
>
> Our docs:
>
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#S=
ending_using_git-send-email
>
> do cover the basic setup but don't cover a multifactor authentication
> setup that the man page mentions. If that works for Micha=C5=82, we can
> add a sentence and a link in the OE Howto doc.
> Send patches to yourself or to me if you want to try it out.
>
> Thanks,
>
> ../Randy
>
> >
> > On Thu, 24 Oct 2019 at 11:07, Micha=C5=82 Lower <michal@pcb.red> wrote:
> >>
> >> thanks for the hint, will do.
> >>
> >> czw., 24 pa=C5=BA 2019 o 11:03 Khem Raj <no-reply@forwardemail.net> na=
pisa=C5=82(a):
> >>>
> >>> On Thu, Oct 24, 2019 at 9:48 AM Micha=C5=82 Lower <michal@pcb.red> wr=
ote:
> >>>>
> >>>>> please use git format-patch to generate it
> >>>> This is exactly what I've did. Sadly it appears that Gmail inserts
> >>>> line breaks on its own. Can I send the patch as an attachment so it
> >>>> will be kept intact? I cannot use git send-email since it doesn't
> >>>> support gmail two actor authentication and my account doesn't allow
> >>>> for application passwords.
> >>>
> >>> yeah I see. if you use github then send a pull request against
> >>> https://github.com/openembedded/meta-openembedded
> >>> I do process that as well.
> >>>
> >>>>
> >>>> czw., 24 pa=C5=BA 2019 o 10:18 Khem Raj <no-reply@forwardemail.net> =
napisa=C5=82(a):
> >>>>>
> >>>>> Hi Micha=C5=82
> >>>>>
> >>>>> This patch appears malformed. So please use git format-patch to
> >>>>> generate it and git send-email to send it also rebase it on top of
> >>>>> latest master
> >>>>>
> >>>>> On Tue, Oct 22, 2019 at 9:03 AM Micha=C5=82 Lower <michal@pcb.red> =
wrote:
> >>>>>>
> >>>>>> Previous version fails to compile for zeus branch. Upgrading fixes=
 that.
> >>>>>>
> >>>>>> Signed-off-by: Michal Lower <michal at pcb.red>
> >>>>>> ---
> >>>>>>   meta-python/recipes-devtools/python/python-setuptools-scm.inc | =
4 ++--
> >>>>>>   ...setuptools-scm_2.1.0.bb =3D> python-setuptools-scm_3.3.3.bb} =
| 0
> >>>>>>   ...etuptools-scm_2.1.0.bb =3D> python3-setuptools-scm_3.3.3.bb} =
| 0
> >>>>>>   3 files changed, 2 insertions(+), 2 deletions(-)
> >>>>>>   rename meta-python/recipes-devtools/python/{python-setuptools-sc=
m_2.1.0.bb
> >>>>>> =3D> python-setuptools-scm_3.3.3.bb} (100%)
> >>>>>>   rename meta-python/recipes-devtools/python/{python3-setuptools-s=
cm_2.1.0.bb
> >>>>>> =3D> python3-setuptools-scm_3.3.3.bb} (100%)
> >>>>>>
> >>>>>> diff --git a/meta-python/recipes-devtools/python/python-setuptools=
-scm.inc
> >>>>>> b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> >>>>>> index 98883ec39..a7e1bf6ad 100644
> >>>>>> --- a/meta-python/recipes-devtools/python/python-setuptools-scm.in=
c
> >>>>>> +++ b/meta-python/recipes-devtools/python/python-setuptools-scm.in=
c
> >>>>>> @@ -2,8 +2,8 @@ SUMMARY =3D "the blessed package to manage your ve=
rsions
> >>>>>> by scm tags"
> >>>>>>   LICENSE =3D "MIT"
> >>>>>>   LIC_FILES_CHKSUM =3D
> >>>>>> "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D8227180126797a014=
8f94f483f3e1489"
> >>>>>>
> >>>>>> -SRC_URI[md5sum] =3D "cfec5d2dbbd0a85c40066f79035b5878"
> >>>>>> -SRC_URI[sha256sum] =3D
> >>>>>> "a767141fecdab1c0b3c8e4c788ac912d7c94a0d6c452d40777ba84f918316379"
> >>>>>> +SRC_URI[md5sum] =3D "50b2199082fe808d032ec1710c9d7415"
> >>>>>> +SRC_URI[sha256sum] =3D
> >>>>>> "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"
> >>>>>>
> >>>>>>   PYPI_PACKAGE =3D "setuptools_scm"
> >>>>>>   inherit pypi
> >>>>>> diff --git a/meta-python/recipes-devtools/python/python-setuptools=
-scm_2.1.0.bb
> >>>>>> b/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.=
bb
> >>>>>> similarity index 100%
> >>>>>> rename from meta-python/recipes-devtools/python/python-setuptools-=
scm_2.1.0.bb
> >>>>>> rename to meta-python/recipes-devtools/python/python-setuptools-sc=
m_3.3.3.bb
> >>>>>> diff --git a/meta-python/recipes-devtools/python/python3-setuptool=
s-scm_2.1.0.bb
> >>>>>> b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3=
.bb
> >>>>>> similarity index 100%
> >>>>>> rename from meta-python/recipes-devtools/python/python3-setuptools=
-scm_2.1.0.bb
> >>>>>> rename to meta-python/recipes-devtools/python/python3-setuptools-s=
cm_3.3.3.bb
> >>>>>> --
> >>>>>> 2.17.1
> >>>>>> --
> >>>>>> _______________________________________________
> >>>>>> Openembedded-devel mailing list
> >>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux

