Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A4BCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 19:54:06 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.3956.1761162846131810583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 12:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OnXRC5RG;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-651c83b6c14so1574541eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 12:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761162845; x=1761767645; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9XPDvNd5IkWCZ77HXq0pvGF3MPpPF/y+tQVms7KIMA=;
        b=OnXRC5RGTQ9ivCwRmneqi01w+Bx4GDs2BWkwwSsOb3EzOS/lduCigODFpEWGoqAe7t
         WsQmtRL15TG6BNTg5O7T9TZ9VTW9L4O7J70pH2FINX0DweiQ1wJDEi2q/avuXis5VHUK
         +SGsxtLlHVi54Heb9m+kzFi1SF8sNVELHvXQk9IoNoIpyVn2sBlrixX0KSlj+gL7nY6c
         VdTBvyF8kp4/0UhBJeWfuIV9lxc5btsrUp1m3QdXe/a9fE502n1i3KpfliLEaQMYi+6g
         b1lIYey3NH+pqHzJhhtxRlKQE5Yn0owiZuj/Q2svoPF4iatV/EW5jEUs4sRF9o27O6OQ
         1iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761162845; x=1761767645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9XPDvNd5IkWCZ77HXq0pvGF3MPpPF/y+tQVms7KIMA=;
        b=X3Y48QiP/JP+2q2px9gXT2o9XYNRXRd2oN79087872JAXGiiaQCCj+/B/IuchYYRjP
         f8kVFO1TDcGzEokg9qB7bxieK2lduoo7iyXV6SwhI1PY/L7KP22PKtA1sIfPmbdKCOV2
         oh+M1qYifD5gvbEpS+ZM+WplHY+SEKdwqyPSTSzl9Af+6qcpgVBlF+W00TfprZrU+UYC
         Mvq20qtGxOG153n7/YxuDsBnXzF6cEviocqJkf4RpzTPa3ifXCCdzbkvLqKnhfq0I6V/
         h1+DZEM9RMaFOa4IYgKMEnLhda381Wz+NG2v3UysqXE6AkC8BgIS+kQkrw4tFjVb283S
         p0UQ==
X-Gm-Message-State: AOJu0Yz54Zjeo8o253uI7wpMfsqQHPT60mcDzNNPlH/gMgupqvsSdiOE
	CvR9zQz8jt9M/Vnim0hFEWcqTc+OIOwz8C3h72KCshLfjatos+Da/bUO0AoJegZi7T5Bl1kAlxt
	ybR2BhLGcaqWBPHWamIKUagI8j8ebXPI=
X-Gm-Gg: ASbGnctWZrODRzJBi35JIofV291dxkZzjKgwmB1vfeSFjek6BB+gWIsfp+/JTCHyE1o
	YZ0VhlFc4LUgbg7uzPv58FLE3snGNNdnyex5lUcp+rqU8yKZvPc+9GSQlFDDJX2rtf1rzjlLbxa
	d0Wfns/76BfNnwUzuef/NAP9kZecjvhsi/SZ2bz91rWmk7zJo4UQmkYsQoLkZT1Mve8/J01MWKE
	uo4A+B9+IxpKOI8FMflTDjog23vTZRupZRVFGFHw9PhTZAgvhZgSAB+s290kW0=
X-Google-Smtp-Source: AGHT+IEEul4h4NqAGrQhSd2i2oB9pVWp+AmtzyqZJKOiU4HXUctBJCqnROljXsRmbUqKCLgTlIDc8VScy9lZxli8sSs=
X-Received: by 2002:a05:6870:6490:b0:372:abfa:f274 with SMTP id
 586e51a60fabf-3c98d145a83mr9352586fac.44.1761162844946; Wed, 22 Oct 2025
 12:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
 <20251022061803.887676-2-ankur.tyagi85@gmail.com> <e890a1cc-ce4d-4e65-8327-123db3370b6e@gmail.com>
In-Reply-To: <e890a1cc-ce4d-4e65-8327-123db3370b6e@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 23 Oct 2025 08:53:54 +1300
X-Gm-Features: AS18NWASrPIKmGWORA4Gxl-mecpEabxCtRFqeVOLzAqxbsIcpkN-ECckVT5Vxqw
Message-ID: <CADySD0FK1-8BYFCXZZTD1g7k6NpTGm_Bvhnw=0f5sdpix0q_rg@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH 2/8] python3-django: patch CVE-2025-26699
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 19:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120898

On Wed, Oct 22, 2025 at 10:48=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> The patch looks correct and necessary to me, but I find the commit
> subject and the CVE tag in the patch somewhat misleading. The CVE is
> patched in 4.2.20, this patch is a fix for a regression that was caused
> by the fix, but otherwise not related to the CVE.
>
> I think the patch should just come as it is, with and explanation of
> what is it, but without referring to it as a CVE fix.
>
Good point, I'll submit v2 soon.

Should I do similar for the following patches from [patch 4/8] as well?
 - CVE-2025-48432-1.patch
 - CVE-2025-48432-2.patch
 - CVE-2025-48432-4.patch
Because they are not the CVE fix but needed to apply CVE fix cleanly.

cheers
Ankur

> On 10/22/25 08:17, Ankur Tyagi via lists.openembedded.org wrote:
> > This fixes a regression in Django 4.2.20, introduced when fixing CVE-20=
25-26699
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../CVE-2025-26699.patch                      | 102 ++++++++++++++++++
> >  .../python/python3-django_4.2.20.bb           |   4 +
> >  2 files changed, 106 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-django-=
4.2.20/CVE-2025-26699.patch
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/=
CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-4=
.2.20/CVE-2025-26699.patch
> > new file mode 100644
> > index 0000000000..54a43b123d
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-202=
5-26699.patch
> > @@ -0,0 +1,102 @@
> > +From 3407ea136bd619591d259221d8712b72b3f3b9a0 Mon Sep 17 00:00:00 2001
> > +From: Matti Pohjanvirta <matti.pohjanvirta@iki.fi>
> > +Date: Sun, 20 Apr 2025 18:22:51 +0300
> > +Subject: [PATCH] [4.2.x] Fixed #36341 -- Preserved whitespaces in word=
wrap
> > + template filter.
> > +
> > +Regression in 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b.
> > +
> > +This work improves the django.utils.text.wrap() function to ensure tha=
t
> > +empty lines and lines with whitespace only are kept instead of being
> > +dropped.
> > +
> > +Thanks Matti Pohjanvirta for the report and fix.
> > +
> > +Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
> > +
> > +Backport of 1e9db35836d42a3c72f3d1015c2f302eb6fee046 from main.
> > +
> > +CVE: CVE-2025-26699
> > +Upstream-Status: Backport [https://github.com/django/django/commit/e61=
e3daaf037507211028494d61f24382be31e5a]
> > +(cherry picked from commit e61e3daaf037507211028494d61f24382be31e5a)
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + django/utils/text.py                          | 13 +++++-
> > + .../filter_tests/test_wordwrap.py             | 41 ++++++++++++++++++=
+
> > + 2 files changed, 52 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/django/utils/text.py b/django/utils/text.py
> > +index 81ae88dc76..b018f2601f 100644
> > +--- a/django/utils/text.py
> > ++++ b/django/utils/text.py
> > +@@ -102,10 +102,19 @@ def wrap(text, width):
> > +         width=3Dwidth,
> > +         break_long_words=3DFalse,
> > +         break_on_hyphens=3DFalse,
> > ++        replace_whitespace=3DFalse,
> > +     )
> > +     result =3D []
> > +-    for line in text.splitlines(True):
> > +-        result.extend(wrapper.wrap(line))
> > ++    for line in text.splitlines():
> > ++        wrapped =3D wrapper.wrap(line)
> > ++        if not wrapped:
> > ++            # If `line` contains only whitespaces that are dropped, r=
estore it.
> > ++            result.append(line)
> > ++        else:
> > ++            result.extend(wrapped)
> > ++    if text.endswith("\n"):
> > ++        # If `text` ends with a newline, preserve it.
> > ++        result.append("")
> > +     return "\n".join(result)
> > +
> > +
> > +diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/test=
s/template_tests/filter_tests/test_wordwrap.py
> > +index 4afa1dd234..1692332e1e 100644
> > +--- a/tests/template_tests/filter_tests/test_wordwrap.py
> > ++++ b/tests/template_tests/filter_tests/test_wordwrap.py
> > +@@ -89,3 +89,44 @@ class FunctionTests(SimpleTestCase):
> > +             "I'm afraid",
> > +             wordwrap(long_text, 10),
> > +         )
> > ++
> > ++    def test_wrap_preserve_newlines(self):
> > ++        cases =3D [
> > ++            (
> > ++                "this is a long paragraph of text that really needs t=
o be wrapped\n\n"
> > ++                "that is followed by another paragraph separated by a=
n empty line\n",
> > ++                "this is a long paragraph of\ntext that really needs =
to be\nwrapped\n\n"
> > ++                "that is followed by another\nparagraph separated by =
an\nempty line\n",
> > ++                30,
> > ++            ),
> > ++            ("\n\n\n", "\n\n\n", 5),
> > ++            ("\n\n\n\n\n\n", "\n\n\n\n\n\n", 5),
> > ++        ]
> > ++        for text, expected, width in cases:
> > ++            with self.subTest(text=3Dtext):
> > ++                self.assertEqual(wordwrap(text, width), expected)
> > ++
> > ++    def test_wrap_preserve_whitespace(self):
> > ++        width =3D 5
> > ++        width_spaces =3D " " * width
> > ++        cases =3D [
> > ++            (
> > ++                f"first line\n{width_spaces}\nsecond line",
> > ++                f"first\nline\n{width_spaces}\nsecond\nline",
> > ++            ),
> > ++            (
> > ++                "first line\n \t\t\t \nsecond line",
> > ++                "first\nline\n \t\t\t \nsecond\nline",
> > ++            ),
> > ++            (
> > ++                f"first line\n{width_spaces}\nsecond line\n\nthird{wi=
dth_spaces}\n",
> > ++                f"first\nline\n{width_spaces}\nsecond\nline\n\nthird\=
n",
> > ++            ),
> > ++            (
> > ++                f"first line\n{width_spaces}{width_spaces}\nsecond li=
ne",
> > ++                f"first\nline\n{width_spaces}{width_spaces}\nsecond\n=
line",
> > ++            ),
> > ++        ]
> > ++        for text, expected in cases:
> > ++            with self.subTest(text=3Dtext):
> > ++                self.assertEqual(wordwrap(text, width), expected)
> > diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.=
bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> > index 3fb8b03224..0b9ff1b8c0 100644
> > --- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> > +++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> > @@ -1,6 +1,10 @@
> >  require python-django.inc
> >  inherit setuptools3
> >
> > +SRC_URI +=3D " \
> > +    file://CVE-2025-26699.patch \
> > +"
> > +
> >  SRC_URI[sha256sum] =3D "92bac5b4432a64532abb73b2ac27203f485e40225d2640=
a7fbef2b62b876e789"
> >
> >  RDEPENDS:${PN} +=3D "\
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120885): https://lists.openembedded.org/g/openembed=
ded-devel/message/120885
> > Mute This Topic: https://lists.openembedded.org/mt/115888203/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

