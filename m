Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4637ACCF9F1
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 10:32:06 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web01.19849.1761820324103920395
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 03:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dgy2uFnT;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c67d9577b3so582797a34.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761820323; x=1762425123; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TH9wpghejr4Jp8u8YJsfhuVoVS7Aka6l348H2ixpwI=;
        b=dgy2uFnT4xDSh2U8IH2a5sGGj4ZY8zhSom5VCOB7nQd7DSnNtQeforC5A6CCrFKvbX
         voFYc6YQiAcAhmmBrPePm93V67p0t8p/0CiVt6w1yYhFOjLYWuc/zuZtq+nqsHddHnQK
         5Byikg1Gq1ZiMay0QFwMKwUNtK2Ky+JJqM+DMzp9/X3cOs7sgGEFThK8otfgoY5lyKm3
         vECYKJ56A+AJhj78AmM2Zf375DhnjN3IrOe7ZliuMPpOjAR1iYIFyEUAwRk4/u+tR7Ru
         W9+hyeVkhGbZUgVe5UUFoiXlx/aw77d7d+WCbU+gSiPwFjAxz+XiQXn9Mzj7Z97xwixN
         jkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761820323; x=1762425123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TH9wpghejr4Jp8u8YJsfhuVoVS7Aka6l348H2ixpwI=;
        b=dcOR5K1rA6FJzJVc4dAO+s6h07/VTDjFXxe4OsLa38Fgns0UuWvJULu5sJjiNVqdtW
         +sueuixA6kwcS3aFQSas2AKx4lr35J3hwVPFGId4q9isPvMC3e5hokDdZ+6janqhN9As
         go+/I7p3t9ZRVCzumCE8Nd0EM1Lc5pMT2qwzWfW1JHxL8UOoKy06ZFx+U7a+Ogn6lqV5
         IywHmQ1CmGQKw6F0lDGJr2ozWI5HjLEyZ5FLyJz152Pammi3r7QGe3AnJx66tJ2PKwHb
         LllGeEdM7v/zEryZySvip/2XR8EUi4xuC7V6SLNG8Y/hnieTcbZndsqgJvHzQKfnxMan
         GBVA==
X-Forwarded-Encrypted: i=1; AJvYcCW7v2A7m4DfaB7P3ATpFgvPgOPqqXKqZVooejknojfzEe2fP9Tgnv2bFax3XWuDOADbXPAsVAKuY3gHCCjdm0/JF0I=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy57GCNerrEmpcN9KEJNdqg1ZRjecphUYiJXXnwkFsSaazzQnlC
	BDPSVqA2OxjSZup+xM0xC4UWXoBpJyXuY4Zvrffly3oXgoHzLIon+uEPrvNggBGlu70Q2YU/DgZ
	HqZIeIsB/UQ/KgqvGoI1K3FoaCx4ezAk=
X-Gm-Gg: ASbGncvJ5v3oQ2m6QoZ9oUT0QVxkYzi5t5mofGQzCNimt645/ApDtcdPseqomWXpPHO
	d8DtE6NaNqXwLTC88wgZWtM93CSicH5phV5hvGp63LqQdw222uiY6V77uzmVmFAYvyktqoQw7rw
	hMmP7cEK+ht4MwMKB0gnGT2dOYdxtfYDKT/IdpCoO31HoKHKYlXbd83w8IRB2LYv9p+2Oja19s+
	+FU0jrkPk5PsASKUFr87Lbn+3k387qGhGGDd7vu9RbewvC1Hqs9j04hPlF13BLXaY2jJBAPug==
X-Google-Smtp-Source: AGHT+IEkB2ee1PzmiBu42i6DH7JmyejMDlVK3Knne3Sv7irc+kEjsDy63ZtvtIsztSn7KWXUrMzNFrHhv34SPmDWu6g=
X-Received: by 2002:a05:6808:810e:b0:44d:b8d3:322a with SMTP id
 5614622812f47-44f89e61dc7mr957986b6e.41.1761820323174; Thu, 30 Oct 2025
 03:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
 <20251022232633.1703690-8-ankur.tyagi85@gmail.com> <55399ed3eb7a13cd570872e691416f3090e8e52f.camel@intel.com>
 <18733D5BF1B5E4D9.16111@lists.openembedded.org>
In-Reply-To: <18733D5BF1B5E4D9.16111@lists.openembedded.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 30 Oct 2025 23:31:52 +1300
X-Gm-Features: AWmQ_blEoKgYMvE-iHO9hEWoLNe8dIX_fjaXXK7oa11bUtHNPciTf3sZWKcejdw
Message-ID: <CADySD0F4P2AoxW3LrPsLgskyWN46sFqQTiv62a5xm+3PSUJuCQ@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH v2 7/8] python3-django: patch CVE-2025-59682
To: ankur.tyagi85@gmail.com
Cc: anuj.mittal@intel.com, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Oct 2025 10:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121207

On Thu, Oct 30, 2025 at 11:15=E2=80=AFPM Ankur Tyagi via
lists.openembedded.org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Thu, Oct 30, 2025 at 8:16=E2=80=AFPM Anuj Mittal via lists.openembedde=
d.org
> <anuj.mittal=3Dintel.com@lists.openembedded.org> wrote:
> >
> > Can we update straight to 4.2.25 instead that only has all these CVE
> > fixes and a few bug fixes?
>
> Agree, please drop following patches for v4.x and I'll submit upgrade
> to 4.2.25 separately
> https://lists.openembedded.org/g/openembedded-devel/message/120902
> https://lists.openembedded.org/g/openembedded-devel/message/120903
> https://lists.openembedded.org/g/openembedded-devel/message/120904
> https://lists.openembedded.org/g/openembedded-devel/message/120905
> https://lists.openembedded.org/g/openembedded-devel/message/120906
> https://lists.openembedded.org/g/openembedded-devel/message/120907
> https://lists.openembedded.org/g/openembedded-devel/message/120908
>

Starting with v4.2.21 [1], setuptools configuration migrated from
setup.py/setup.cfg to pyproject.toml
And [2] updated setuptools version causing following build error:

ERROR Missing dependencies:
    setuptools>=3D75.8.1; python_version >=3D "3.9"

[1] https://github.com/django/django/commit/afe52d89c4f42870622a4bb161ab5f4=
d4913aac5
[2] https://github.com/django/django/commit/3456eee4a3a00dc14e72d4f7d6eecc1=
5ed9571e7

Any ideas to try?

> >
> > On Thu, 2025-10-23 at 12:26 +1300, Ankur Tyagi via
> > lists.openembedded.org wrote:
> > > Details https://nvd.nist.gov/vuln/detail/CVE-2025-59682
> > >
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > ---
> > >  .../CVE-2025-59682.patch                      | 72
> > > +++++++++++++++++++
> > >  .../python/python3-django_4.2.20.bb           |  1 +
> > >  2 files changed, 73 insertions(+)
> > >  create mode 100644 meta-python/recipes-devtools/python/python3-
> > > django-4.2.20/CVE-2025-59682.patch
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-django-
> > > 4.2.20/CVE-2025-59682.patch b/meta-python/recipes-
> > > devtools/python/python3-django-4.2.20/CVE-2025-59682.patch
> > > new file mode 100644
> > > index 0000000000..72f566a0e1
> > > --- /dev/null
> > > +++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-
> > > 2025-59682.patch
> > > @@ -0,0 +1,72 @@
> > > +From c757b620cd8099d17e202c0f5582bbab5564056c Mon Sep 17 00:00:00
> > > 2001
> > > +From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
> > > +Date: Tue, 16 Sep 2025 17:13:36 +0200
> > > +Subject: [PATCH] [4.2.x] Fixed CVE-2025-59682 -- Fixed potential
> > > partial
> > > + directory-traversal via archive.extract().
> > > +
> > > +Thanks stackered for the report.
> > > +
> > > +Follow up to 05413afa8c18cdb978fcdf470e09f7a12b234a23.
> > > +
> > > +Backport of 924a0c092e65fa2d0953fd1855d2dc8786d94de2 from main.
> > > +
> > > +CVE: CVE-2025-59682
> > > +Upstream-Status: Backport
> > > [https://github.com/django/django/commit/9504bbaa392c9fe37eee9291f5b4
> > > c29eb6037619]
> > > +(cherry picked from commit 9504bbaa392c9fe37eee9291f5b4c29eb6037619)
> > > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > +---
> > > + django/utils/archive.py           |  6 +++++-
> > > + tests/utils_tests/test_archive.py | 19 +++++++++++++++++++
> > > + 2 files changed, 24 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/django/utils/archive.py b/django/utils/archive.py
> > > +index 71ec2d0015..e8af690e27 100644
> > > +--- a/django/utils/archive.py
> > > ++++ b/django/utils/archive.py
> > > +@@ -144,7 +144,11 @@ class BaseArchive:
> > > +     def target_filename(self, to_path, name):
> > > +         target_path =3D os.path.abspath(to_path)
> > > +         filename =3D os.path.abspath(os.path.join(target_path, name=
))
> > > +-        if not filename.startswith(target_path):
> > > ++        try:
> > > ++            if os.path.commonpath([target_path, filename]) !=3D
> > > target_path:
> > > ++                raise SuspiciousOperation("Archive contains invalid
> > > path: '%s'" % name)
> > > ++        except ValueError:
> > > ++            # Different drives on Windows raises ValueError.
> > > +             raise SuspiciousOperation("Archive contains invalid
> > > path: '%s'" % name)
> > > +         return filename
> > > +
> > > +diff --git a/tests/utils_tests/test_archive.py
> > > b/tests/utils_tests/test_archive.py
> > > +index 8cd107063f..8063dafb65 100644
> > > +--- a/tests/utils_tests/test_archive.py
> > > ++++ b/tests/utils_tests/test_archive.py
> > > +@@ -3,6 +3,7 @@ import stat
> > > + import sys
> > > + import tempfile
> > > + import unittest
> > > ++import zipfile
> > > +
> > > + from django.core.exceptions import SuspiciousOperation
> > > + from django.test import SimpleTestCase
> > > +@@ -96,3 +97,21 @@ class TestArchiveInvalid(SimpleTestCase):
> > > +             with self.subTest(entry), tempfile.TemporaryDirectory()
> > > as tmpdir:
> > > +                 with self.assertRaisesMessage(SuspiciousOperation,
> > > msg % invalid_path):
> > > +                     archive.extract(os.path.join(archives_dir,
> > > entry), tmpdir)
> > > ++
> > > ++    def test_extract_function_traversal_startswith(self):
> > > ++        with tempfile.TemporaryDirectory() as tmpdir:
> > > ++            base =3D os.path.abspath(tmpdir)
> > > ++            tarfile_handle =3D
> > > tempfile.NamedTemporaryFile(suffix=3D".zip", delete=3DFalse)
> > > ++            tar_path =3D tarfile_handle.name
> > > ++            tarfile_handle.close()
> > > ++            self.addCleanup(os.remove, tar_path)
> > > ++
> > > ++            malicious_member =3D os.path.join(base + "abc",
> > > "evil.txt")
> > > ++            with zipfile.ZipFile(tar_path, "w") as zf:
> > > ++                zf.writestr(malicious_member, "evil\n")
> > > ++                zf.writestr("test.txt", "data\n")
> > > ++
> > > ++            with self.assertRaisesMessage(
> > > ++                SuspiciousOperation, "Archive contains invalid
> > > path"
> > > ++            ):
> > > ++                archive.extract(tar_path, base)
> > > diff --git a/meta-python/recipes-devtools/python/python3-
> > > django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-
> > > django_4.2.20.bb
> > > index 443b4dbbfc..964b982fda 100644
> > > --- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
> > > @@ -12,6 +12,7 @@ SRC_URI +=3D " \
> > >      file://CVE-2025-48432-6.patch \
> > >      file://CVE-2025-57833.patch \
> > >      file://CVE-2025-59681.patch \
> > > +    file://CVE-2025-59682.patch \
> > >  "
> > >
> > >  SRC_URI[sha256sum] =3D
> > > "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
> > >
> > >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121203): https://lists.openembedded.org/g/openembedde=
d-devel/message/121203
> Mute This Topic: https://lists.openembedded.org/mt/115902367/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

