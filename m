Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0852BCCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 10:15:46 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.23003.1761819344164731864
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 03:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EaKHhAQd;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c681a8aecdso545454a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 03:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761819343; x=1762424143; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JWX5laqV7xXO0/9PTIxFhqMJO5lm6PyFXEjpoK9IlE=;
        b=EaKHhAQdUhjgfZ34B/DN5ROEQaAZPxn/s6XTV2mp41ItZynzK+KKaPmnunguoJLAry
         LtqT0yuroqkTMOrZ/epllZebF+St7sjXgnLsNKSyAcWN9/dCaxacUlTpyE9hMl8t+VWr
         YHbTWPV7dUP4B84gIW3TfXO779Znd9hTNubjEG+FGDwzR42F5Np9T3iyJzf0e4eZjM9h
         m02RNVI58vH9pGDdtJcURbPoMjyiHDNIA0OMcuTyPuV6vSKnM8olfNAmjFRBDFOh8ptO
         KXVKyCliKJW1UWo4NUwmkRtmBnyGlbe0QizmjyYM4ufdDHNENQlEaGLFg3Rcy1fI30oT
         5dlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761819343; x=1762424143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JWX5laqV7xXO0/9PTIxFhqMJO5lm6PyFXEjpoK9IlE=;
        b=mDBfik8QvXWFggsduwSm7yDeJwvrZ+DI9EqrmGDjn/rLjD2YNxKtg4Q4ozUKqUzxG9
         EOOHqhuChh6se+2mnLT9ApHKc0wARZ3KSbSTSL8EXctnBOc2gICanGJfPsU0Vocjc+b3
         cra65fpGgR4zO7xhLvRrV/oYDxpe52gETgarU75MSOdLq4opc6Rz2j3LyKunZ4YXU5XC
         QNHajcp3ggJ/sWuAbKQr7Rzp5jrUSpbE1A1Gst3pstRRUib7XluQhWfohZVh9FEL2FMP
         8hyuijWmRE00zcLWDxG+wtvabiorsaje7MCzwjeMi1wGWsTRV2HgQ7FrFUWXLpxAfGyg
         o/5g==
X-Gm-Message-State: AOJu0Yx53fTqoDJ7p13lKBMpZfCLazdQqOR27ED+lQBPch0cqf2Zn/4o
	F3RRfLIoD+u5OLeStK12Q3AkJjweVMcemFlvzp8xQ7mZAz+GhSo8ilxyJd4BFTNTvHkSAV4XOxt
	pPmCi7cUa2XCk0vPldSNEFdcQj1b8fs0=
X-Gm-Gg: ASbGncutApmIEZB4Jiah+bNo2HC89ypDJV16ogu1V4rJDuYFdz73p4wd79jt948huag
	Ena2m0F3mcieI0uWk/bNYH3ei4x7hUjzG7ecwtaTrkLAoGw4kWJcRSkf4pke4i5jOs41Kb1y0cr
	ds+OIesOczYgxrSHROWdWLzTKxlYjhOmhRaKJ6vODGKvoVE4P+0rfTii5Ot2PWnwkNgT79inm0j
	mmzksYt6L1Jv80SuoJpee2ppJhaHaqdWeh7cokM0CgPHrrJE8BX1lSNr8hkpLo=
X-Google-Smtp-Source: AGHT+IFOzsED6QIyeVfQ3C5XHvqSsnZAN+dcsHn3pbj4a/ngjSGqfumsz45zV+MJEmxHcswlqA0U8ERp9uJBImrXzj8=
X-Received: by 2002:a05:6808:4f22:b0:44d:b637:14a7 with SMTP id
 5614622812f47-44f89eaf3b5mr1122868b6e.55.1761819343051; Thu, 30 Oct 2025
 03:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
 <20251022232633.1703690-8-ankur.tyagi85@gmail.com> <55399ed3eb7a13cd570872e691416f3090e8e52f.camel@intel.com>
In-Reply-To: <55399ed3eb7a13cd570872e691416f3090e8e52f.camel@intel.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 30 Oct 2025 23:15:32 +1300
X-Gm-Features: AWmQ_bl2tjh7LgoFz0-Yz_arRKXZ3oGSXZ5DX3gKEQL3DmxAfdPhQ3c2knvvnW4
Message-ID: <CADySD0E1a7jF8MumqS5iPZzmJpdpfytDBwqyVsd7DqO40bkzDQ@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH v2 7/8] python3-django: patch CVE-2025-59682
To: anuj.mittal@intel.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 10:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121203

On Thu, Oct 30, 2025 at 8:16=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Dintel.com@lists.openembedded.org> wrote:
>
> Can we update straight to 4.2.25 instead that only has all these CVE
> fixes and a few bug fixes?

Agree, please drop following patches for v4.x and I'll submit upgrade
to 4.2.25 separately
https://lists.openembedded.org/g/openembedded-devel/message/120902
https://lists.openembedded.org/g/openembedded-devel/message/120903
https://lists.openembedded.org/g/openembedded-devel/message/120904
https://lists.openembedded.org/g/openembedded-devel/message/120905
https://lists.openembedded.org/g/openembedded-devel/message/120906
https://lists.openembedded.org/g/openembedded-devel/message/120907
https://lists.openembedded.org/g/openembedded-devel/message/120908

>
> On Thu, 2025-10-23 at 12:26 +1300, Ankur Tyagi via
> lists.openembedded.org wrote:
> > Details https://nvd.nist.gov/vuln/detail/CVE-2025-59682
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../CVE-2025-59682.patch                      | 72
> > +++++++++++++++++++
> >  .../python/python3-django_4.2.20.bb           |  1 +
> >  2 files changed, 73 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-
> > django-4.2.20/CVE-2025-59682.patch
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-django-
> > 4.2.20/CVE-2025-59682.patch b/meta-python/recipes-
> > devtools/python/python3-django-4.2.20/CVE-2025-59682.patch
> > new file mode 100644
> > index 0000000000..72f566a0e1
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-
> > 2025-59682.patch
> > @@ -0,0 +1,72 @@
> > +From c757b620cd8099d17e202c0f5582bbab5564056c Mon Sep 17 00:00:00
> > 2001
> > +From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
> > +Date: Tue, 16 Sep 2025 17:13:36 +0200
> > +Subject: [PATCH] [4.2.x] Fixed CVE-2025-59682 -- Fixed potential
> > partial
> > + directory-traversal via archive.extract().
> > +
> > +Thanks stackered for the report.
> > +
> > +Follow up to 05413afa8c18cdb978fcdf470e09f7a12b234a23.
> > +
> > +Backport of 924a0c092e65fa2d0953fd1855d2dc8786d94de2 from main.
> > +
> > +CVE: CVE-2025-59682
> > +Upstream-Status: Backport
> > [https://github.com/django/django/commit/9504bbaa392c9fe37eee9291f5b4
> > c29eb6037619]
> > +(cherry picked from commit 9504bbaa392c9fe37eee9291f5b4c29eb6037619)
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + django/utils/archive.py           |  6 +++++-
> > + tests/utils_tests/test_archive.py | 19 +++++++++++++++++++
> > + 2 files changed, 24 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/django/utils/archive.py b/django/utils/archive.py
> > +index 71ec2d0015..e8af690e27 100644
> > +--- a/django/utils/archive.py
> > ++++ b/django/utils/archive.py
> > +@@ -144,7 +144,11 @@ class BaseArchive:
> > +     def target_filename(self, to_path, name):
> > +         target_path =3D os.path.abspath(to_path)
> > +         filename =3D os.path.abspath(os.path.join(target_path, name))
> > +-        if not filename.startswith(target_path):
> > ++        try:
> > ++            if os.path.commonpath([target_path, filename]) !=3D
> > target_path:
> > ++                raise SuspiciousOperation("Archive contains invalid
> > path: '%s'" % name)
> > ++        except ValueError:
> > ++            # Different drives on Windows raises ValueError.
> > +             raise SuspiciousOperation("Archive contains invalid
> > path: '%s'" % name)
> > +         return filename
> > +
> > +diff --git a/tests/utils_tests/test_archive.py
> > b/tests/utils_tests/test_archive.py
> > +index 8cd107063f..8063dafb65 100644
> > +--- a/tests/utils_tests/test_archive.py
> > ++++ b/tests/utils_tests/test_archive.py
> > +@@ -3,6 +3,7 @@ import stat
> > + import sys
> > + import tempfile
> > + import unittest
> > ++import zipfile
> > +
> > + from django.core.exceptions import SuspiciousOperation
> > + from django.test import SimpleTestCase
> > +@@ -96,3 +97,21 @@ class TestArchiveInvalid(SimpleTestCase):
> > +             with self.subTest(entry), tempfile.TemporaryDirectory()
> > as tmpdir:
> > +                 with self.assertRaisesMessage(SuspiciousOperation,
> > msg % invalid_path):
> > +                     archive.extract(os.path.join(archives_dir,
> > entry), tmpdir)
> > ++
> > ++    def test_extract_function_traversal_startswith(self):
> > ++        with tempfile.TemporaryDirectory() as tmpdir:
> > ++            base =3D os.path.abspath(tmpdir)
> > ++            tarfile_handle =3D
> > tempfile.NamedTemporaryFile(suffix=3D".zip", delete=3DFalse)
> > ++            tar_path =3D tarfile_handle.name
> > ++            tarfile_handle.close()
> > ++            self.addCleanup(os.remove, tar_path)
> > ++
> > ++            malicious_member =3D os.path.join(base + "abc",
> > "evil.txt")
> > ++            with zipfile.ZipFile(tar_path, "w") as zf:
> > ++                zf.writestr(malicious_member, "evil\n")
> > ++                zf.writestr("test.txt", "data\n")
> > ++
> > ++            with self.assertRaisesMessage(
> > ++                SuspiciousOperation, "Archive contains invalid
> > path"
> > ++            ):
> > ++                archive.extract(tar_path, base)
> > diff --git a/meta-python/recipes-devtools/python/python3-
> > django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-
> > django_4.2.20.bb
> > index 443b4dbbfc..964b982fda 100644
> > --- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> > +++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> > @@ -12,6 +12,7 @@ SRC_URI +=3D " \
> >      file://CVE-2025-48432-6.patch \
> >      file://CVE-2025-57833.patch \
> >      file://CVE-2025-59681.patch \
> > +    file://CVE-2025-59682.patch \
> >  "
> >
> >  SRC_URI[sha256sum] =3D
> > "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121198): https://lists.openembedded.org/g/openembedde=
d-devel/message/121198
> Mute This Topic: https://lists.openembedded.org/mt/115902367/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

