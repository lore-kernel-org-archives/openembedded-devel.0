Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A84E74914
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 19:16:27 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.91507.1696274178605742952
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 12:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fCScVTxR;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1dd5b98d9aeso40866fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 12:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696274178; x=1696878978; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxGo7+5V8qV4kz8p9BSnzR6P3HFtdDLnxSNTwvGK2g0=;
        b=fCScVTxRZplmS0hcHXX3kJPwK5veLzMqQZw/mhQNycZU3U+46cO9zCn6PaOM35xIP3
         Y7A/PgBBJe+KJ4n+PLtvoB4USJ7eKbZiSvzC/aoMMOkGL6DRtFd79wDpGryFNth7JsSF
         MC63TAgTvue4wefpIcoL26Fa1tbkBoH1NQM+X5R2MVZ/FmwPgFZIwz6spzQFkWF2pKVw
         oRDZl8/IfmqdifcSB1WY9wljlbiiyQdhDQ6qTnaE9ALKnx+mv8n80oQrlxt2fOOi+SMG
         +l557X3AEin/+QYPGoJ8hRuNzp3LnjGsXncTbEzuOMN6+1Tj/bv9BLekhdClgbXTCP7j
         +png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696274178; x=1696878978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxGo7+5V8qV4kz8p9BSnzR6P3HFtdDLnxSNTwvGK2g0=;
        b=YWZO8SYFc5h00CPjVsKbLPADWWO4Kp9dHksg0+n6Sz5gNorVkvL8sni8+19AhqzQoe
         5ATVfPvJomOxzBB6eXVyfWLaNENi8NDKBv3vMW7z2Ezh4dx1L5IKw60IYtcDIxYFXLMG
         vGq/joSotxwH4iaxeY1487idOKYk05So6G+3d+dUGx7UutkVBgJJqM1SjQOenonI4rPQ
         A4+kRtgtDH3/DCH6UP44EDHMwjMe+Ht8PfouKdqXwJU/+OXCtTlQBhh/vZB3SGWPJIYZ
         GRf8r84Xzstjd9bSlVuT1XDSryRVHyU84pG+mhxuw6VSHACIm1pzS42Kj+oahwhtn0b8
         ZO0A==
X-Gm-Message-State: AOJu0YyE8HCyW0DtY0E7N34YFx+0hpq4QUjfrTFUaIH1l+tWYz55Vz43
	Mj6caQkaPfVIqZTL9cFxFcGw/p7qpV0GtAnaqnAEb/4IS0k=
X-Google-Smtp-Source: AGHT+IFAkgcPtukji9OzkFWJHOq7j22se1FFXiTQmvf71mbLJsLwO2IiOaoOoyYDm7P+1ppyAecJtjHZs0JNU8GZUjU=
X-Received: by 2002:a05:6870:d0d5:b0:1c8:c22d:1130 with SMTP id
 k21-20020a056870d0d500b001c8c22d1130mr318372oaa.21.1696274177590; Mon, 02 Oct
 2023 12:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231002190749.1427522-1-joe.slater@windriver.com>
In-Reply-To: <20231002190749.1427522-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Oct 2023 12:15:51 -0700
Message-ID: <CAMKF1soXFsVSvq643EA0CBvEh2TeVg2GK+t-Us7GQ_Gkpb8xAg@mail.gmail.com>
Subject: Re: [oe] [mickledore][meta-python][PATCH 1/1] python3-inotify: fix tests
To: joe.slater@windriver.com
Cc: openembedded-devel@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 19:16:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105312

Do we need this on master too ? if so please submit it for master
first and then backport to mickledore

On Mon, Oct 2, 2023 at 12:07=E2=80=AFPM Joe Slater via lists.openembedded.o=
rg
<joe.slater=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Joe Slater <joe.slater@windriver.com>
>
> Some tests in test-inotify.py assume values for watch
> descriptors.  This is not safe, so we retrieve the
> assigned values to compare with event information generated.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 0efa5c872f6357f8639310e339d9c5a6f0315f2d)
> ---
>  .../python3-inotify/new-test-inotify.patch    | 620 ++++++++++++++++++
>  .../python/python3-inotify_git.bb             |   1 +
>  2 files changed, 621 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-inotify/n=
ew-test-inotify.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-inotify/new-test=
-inotify.patch b/meta-python/recipes-devtools/python/python3-inotify/new-te=
st-inotify.patch
> new file mode 100644
> index 0000000000..e462615e14
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-inotify/new-test-inotif=
y.patch
> @@ -0,0 +1,620 @@
> +From 80010e27d774e8b722d569384492eaab2bc4ac61 Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Thu, 27 Jul 2023 15:01:04 +0000
> +Subject: [PATCH] working commit
> +
> +It is not safe to assume the values returned by add_watch(),
> +so we add a local helper get_wd() to retrieve them.  This fixes
> +a problem in TestInotifyTree.test__cycle() where the
> +wd's for the 'aa' and 'bb' paths are not '2' and '3',
> +respectively.
> +
> +A second issue is that Inotify._get_event_names() should
> +return a set or sorted list to avoid comparison problems,
> +but that is not addressed here since it could be viewed as
> +changing the API.
> +
> +This test_inotify.py is based on the version in the fix_tests branch of
> +pyinotify as of commit d7d3c58...
> +
> +Upstream-Status: Submitted [github.com/dsoprea/PyInotify/pull/104]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + tests/test_inotify.py | 346 ++++++++++++++++++++++++++++++++----------
> + 1 file changed, 262 insertions(+), 84 deletions(-)
> +
> +diff --git a/tests/test_inotify.py b/tests/test_inotify.py
> +index d9f1f84..d89a49e 100644
> +--- a/tests/test_inotify.py
> ++++ b/tests/test_inotify.py
> +@@ -2,6 +2,7 @@
> +
> + import os
> + import unittest
> ++import time
> +
> + import inotify.constants
> + import inotify.calls
> +@@ -15,6 +16,11 @@ except NameError:
> + else:
> +     _HAS_PYTHON2_UNICODE_SUPPORT =3D True
> +
> ++# Inotify does not have a get for watch descriptors
> ++#
> ++def get_wd(i, path):
> ++    return i._Inotify__watches[path]
> ++
> +
> + class TestInotify(unittest.TestCase):
> +     def __init__(self, *args, **kwargs):
> +@@ -29,11 +35,11 @@ class TestInotify(unittest.TestCase):
> +     @unittest.skipIf(_HAS_PYTHON2_UNICODE_SUPPORT is True, "Not in Pyth=
on 3")
> +     def test__international_naming_python3(self):
> +         with inotify.test_support.temp_path() as path:
> +-            inner_path =3D os.path.join(path, '=E6=96=B0=E5=A2=9E=E8=B3=
=87=E6=96=99=E5=A4=BE')
> ++            inner_path =3D os.path.join(path, u'=E6=96=B0=E5=A2=9E=E8=
=B3=87=E6=96=99=E5=A4=BE')
> +             os.mkdir(inner_path)
> +
> +             i =3D inotify.adapters.Inotify()
> +-            i.add_watch(inner_path)
> ++            wd =3D i.add_watch(inner_path)
> +
> +             with open(os.path.join(inner_path, 'filename'), 'w'):
> +                 pass
> +@@ -41,12 +47,27 @@ class TestInotify(unittest.TestCase):
> +             events =3D self.__read_all_events(i)
> +
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], inner_path, 'filename'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], inner_path, 'filename'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, 'filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256, c=
ookie=3D0, len=3D16), ['IN_CREATE'], inner_path, 'filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32, co=
okie=3D0, len=3D16), ['IN_OPEN'], inner_path, 'filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, coo=
kie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, 'filename'),
> +             ]
> +
> +-            self.assertEquals(events, expected)
> ++            if events !=3D expected:
> ++                print("ACTUAL:")
> ++                print("")
> ++
> ++                for i, event in enumerate(events):
> ++                    print(event)
> ++
> ++                print("")
> ++
> ++                print("EXPECTED:")
> ++                print("")
> ++
> ++                for i, event in enumerate(expected):
> ++                    print(event)
> ++
> ++                raise Exception("Events not correct.")
> +
> +     @unittest.skipIf(_HAS_PYTHON2_UNICODE_SUPPORT is False, "Not in Pyt=
hon 2")
> +     def test__international_naming_python2(self):
> +@@ -55,7 +76,7 @@ class TestInotify(unittest.TestCase):
> +             os.mkdir(inner_path)
> +
> +             i =3D inotify.adapters.Inotify()
> +-            i.add_watch(inner_path)
> ++            wd =3D i.add_watch(inner_path)
> +
> +             with open(os.path.join(inner_path, u'filename=E6=96=99=E5=
=A4=BE'), 'w'):
> +                 pass
> +@@ -63,12 +84,28 @@ class TestInotify(unittest.TestCase):
> +             events =3D self.__read_all_events(i)
> +
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], inner_path, u'filename=E6=96=99=E5=A4=
=BE'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], inner_path, u'filename=E6=96=99=E5=A4=BE')=
,
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, u'filename=E6=96=99=E5=
=A4=BE'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256, c=
ookie=3D0, len=3D16), ['IN_CREATE'], inner_path, u'filename=E6=96=99=E5=A4=
=BE'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32, co=
okie=3D0, len=3D16), ['IN_OPEN'], inner_path, u'filename=E6=96=99=E5=A4=BE'=
),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, coo=
kie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, u'filename=E6=96=99=E5=
=A4=BE'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D16, co=
okie=3D0, len=3D16), ['IN_CLOSE_NOWRITE'], inner_path, u'filename=E6=96=99=
=E5=A4=BE'),
> +             ]
> +
> +-            self.assertEquals(events, expected)
> ++            if events !=3D expected:
> ++                print("ACTUAL:")
> ++                print("")
> ++
> ++                for i, event in enumerate(events):
> ++                    print(event)
> ++
> ++                print("")
> ++
> ++                print("EXPECTED:")
> ++                print("")
> ++
> ++                for i, event in enumerate(expected):
> ++                    print(event)
> ++
> ++                raise Exception("Events not correct.")
> +
> +     def test__cycle(self):
> +         with inotify.test_support.temp_path() as path:
> +@@ -79,7 +116,7 @@ class TestInotify(unittest.TestCase):
> +             os.mkdir(path2)
> +
> +             i =3D inotify.adapters.Inotify()
> +-            i.add_watch(path1)
> ++            wd =3D i.add_watch(path1)
> +
> +             with open('ignored_new_file', 'w'):
> +                 pass
> +@@ -96,32 +133,47 @@ class TestInotify(unittest.TestCase):
> +
> +             expected =3D [
> +                 (
> +-                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256,=
 cookie=3D0, len=3D16),
> ++                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256=
, cookie=3D0, len=3D16),
> +                     ['IN_CREATE'],
> +                     path1,
> +                     'seen_new_file'
> +                 ),
> +                 (
> +-                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, =
cookie=3D0, len=3D16),
> ++                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32,=
 cookie=3D0, len=3D16),
> +                     ['IN_OPEN'],
> +                     path1,
> +                     'seen_new_file'
> +                 ),
> +                 (
> +-                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, c=
ookie=3D0, len=3D16),
> ++                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, =
cookie=3D0, len=3D16),
> +                     ['IN_CLOSE_WRITE'],
> +                     path1,
> +                     'seen_new_file'
> +                 ),
> +                 (
> +-                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D512,=
 cookie=3D0, len=3D16),
> ++                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D512=
, cookie=3D0, len=3D16),
> +                     ['IN_DELETE'],
> +                     path1,
> +                     'seen_new_file'
> +                 )
> +             ]
> +
> +-            self.assertEquals(events, expected)
> ++            if events !=3D expected:
> ++                print("ACTUAL:")
> ++                print("")
> ++
> ++                for i, event in enumerate(events):
> ++                    print(event)
> ++
> ++                print("")
> ++
> ++                print("EXPECTED:")
> ++                print("")
> ++
> ++                for i, event in enumerate(expected):
> ++                    print(event)
> ++
> ++                raise Exception("Events not correct.")
> +
> +             # This can't be removed until *after* we've read the events=
 because
> +             # they'll be flushed the moment we remove the watch.
> +@@ -131,7 +183,7 @@ class TestInotify(unittest.TestCase):
> +                 pass
> +
> +             events =3D self.__read_all_events(i)
> +-            self.assertEquals(events, [])
> ++            self.assertEqual(events, [])
> +
> +     @staticmethod
> +     def _open_write_close(*args):
> +@@ -167,23 +219,47 @@ class TestInotify(unittest.TestCase):
> +         with inotify.test_support.temp_path() as path:
> +             path1 =3D TestInotify._make_temp_path(path, 'aa')
> +             path2 =3D TestInotify._make_temp_path(path, 'bb')
> ++
> +             i =3D inotify.adapters.Inotify([path1, path2])
> ++
> +             TestInotify._open_write_close('ignored_new_file')
> +             TestInotify._open_write_close(path1, 'seen_new_file')
> +             TestInotify._open_write_close(path2, 'seen_new_file2')
> ++
> ++            wd_path1 =3D get_wd(i, path1)
> ++            wd_path2 =3D get_wd(i, path2)
> ++
> ++
> +             os.remove(os.path.join(path1, 'seen_new_file'))
> ++
> +             events =3D self.__read_all_events(i)
> ++
> +             expected =3D [
> +-                TestInotify._event_create(wd=3D1, path=3Dpath1, filenam=
e=3D'seen_new_file'),
> +-                TestInotify._event_open(wd=3D1, path=3Dpath1, filename=
=3D'seen_new_file'),
> +-                TestInotify._event_close_write(wd=3D1, path=3Dpath1, fi=
lename=3D'seen_new_file'),
> +-                TestInotify._event_create(wd=3D2, path=3Dpath2, filenam=
e=3D'seen_new_file2'),
> +-                TestInotify._event_open(wd=3D2, path=3Dpath2, filename=
=3D'seen_new_file2'),
> +-                TestInotify._event_close_write(wd=3D2, path=3Dpath2, fi=
lename=3D'seen_new_file2'),
> +-                TestInotify._event_general(wd=3D1, mask=3D512, type_nam=
e=3D'IN_DELETE',
> +-                                           path=3Dpath1, filename=3D'se=
en_new_file')
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path1, u'seen_new_file'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path1, u'seen_new_file'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, u'seen_new_file'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, u'seen_new_file2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, u'seen_new_file2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, u'seen_new_file2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
512, cookie=3D0, len=3D16), ['IN_DELETE'], path1, u'seen_new_file'),
> +             ]
> +-            self.assertEquals(events, expected)
> ++
> ++            if events !=3D expected:
> ++                print("ACTUAL:")
> ++                print("")
> ++
> ++                for i, event in enumerate(events):
> ++                    print(event)
> ++
> ++                print("")
> ++
> ++                print("EXPECTED:")
> ++                print("")
> ++
> ++                for i, event in enumerate(expected):
> ++                    print(event)
> ++
> ++                raise Exception("Events not correct.")
> +
> +     def test__error_on_watch_nonexistent_folder(self):
> +         i =3D inotify.adapters.Inotify()
> +@@ -201,7 +277,7 @@ class TestInotify(unittest.TestCase):
> +         i =3D inotify.adapters.Inotify()
> +         names =3D i._get_event_names(all_mask)
> +
> +-        self.assertEquals(names, all_names)
> ++        self.assertEqual(names, all_names)
> +
> +
> + class TestInotifyTree(unittest.TestCase):
> +@@ -219,56 +295,101 @@ class TestInotifyTree(unittest.TestCase):
> +             path1 =3D os.path.join(path, 'aa')
> +             os.mkdir(path1)
> +
> ++            time.sleep(.10)
> ++
> +             path2 =3D os.path.join(path, 'bb')
> +             os.mkdir(path2)
> +
> ++            time.sleep(.10)
> ++
> +             i =3D inotify.adapters.InotifyTree(path)
> +
> +             with open('seen_new_file1', 'w'):
> +                 pass
> +
> ++            time.sleep(.10)
> ++
> +             with open(os.path.join(path1, 'seen_new_file2'), 'w'):
> +                 pass
> +
> ++            time.sleep(.10)
> ++
> +             with open(os.path.join(path2, 'seen_new_file3'), 'w'):
> +                 pass
> +
> ++            time.sleep(.10)
> ++
> ++            wd_path  =3D get_wd(i.inotify, path)
> ++            wd_path1 =3D get_wd(i.inotify, path1)
> ++            wd_path2 =3D get_wd(i.inotify, path2)
> ++
> +             os.remove(os.path.join(path, 'seen_new_file1'))
> ++
> ++            time.sleep(.10)
> ++
> +             os.remove(os.path.join(path1, 'seen_new_file2'))
> ++
> ++            time.sleep(.10)
> ++
> +             os.remove(os.path.join(path2, 'seen_new_file3'))
> +
> ++            time.sleep(.10)
> ++
> +             os.rmdir(path1)
> ++
> ++            time.sleep(.10)
> ++
> +             os.rmdir(path2)
> +
> +-            events =3D self.__read_all_events(i)
> ++            time.sleep(.10)
> +
> ++            events =3D self.__read_all_events(i)
> ++            events =3D sorted(events)
> ++
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path, 'seen_new_file1'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path, 'seen_new_file1'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path, 'seen_new_file1'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D2=
56, cookie=3D0, len=3D16), ['IN_CREATE'], path, 'seen_new_file1'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D3=
2, cookie=3D0, len=3D16), ['IN_OPEN'], path, 'seen_new_file1'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D8=
, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path, 'seen_new_file1'),
> +
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file2'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file2'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file2'),
> +
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file3'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file3'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file3'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file3'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file3'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file3'),
> +
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], path, 'seen_new_file1'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], path1, 'seen_new_file2'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], path2, 'seen_new_file3'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D5=
12, cookie=3D0, len=3D16), ['IN_DELETE'], path, 'seen_new_file1'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
512, cookie=3D0, len=3D16), ['IN_DELETE'], path1, 'seen_new_file2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
512, cookie=3D0, len=3D16), ['IN_DELETE'], path2, 'seen_new_file3'),
> +
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D1024, c=
ookie=3D0, len=3D0), ['IN_DELETE_SELF'], path1, ''),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D32768, =
cookie=3D0, len=3D0), ['IN_IGNORED'], path1, ''),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
336, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_DELETE'], path, 'aa'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
1024, cookie=3D0, len=3D0), ['IN_DELETE_SELF'], path1, ''),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32768, cookie=3D0, len=3D0), ['IN_IGNORED'], path1, ''),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742336, cookie=3D0, len=3D16), ['IN_DELETE', 'IN_ISDIR'], path, 'aa'),
> +
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D1024, c=
ookie=3D0, len=3D0), ['IN_DELETE_SELF'], path2, ''),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32768, =
cookie=3D0, len=3D0), ['IN_IGNORED'], path2, ''),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
336, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_DELETE'], path, 'bb'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
1024, cookie=3D0, len=3D0), ['IN_DELETE_SELF'], path2, ''),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32768, cookie=3D0, len=3D0), ['IN_IGNORED'], path2, ''),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742336, cookie=3D0, len=3D16), ['IN_DELETE', 'IN_ISDIR'], path, 'bb'),
> +             ]
> +
> +-            self.assertEquals(events, expected)
> ++            expected =3D sorted(expected)
> ++
> ++            if events !=3D expected:
> ++                print("ACTUAL:")
> ++                print("")
> ++
> ++                for i, event in enumerate(events):
> ++                    print(event)
> ++
> ++                print("")
> ++
> ++                print("EXPECTED:")
> ++                print("")
> ++
> ++                for i, event in enumerate(expected):
> ++                    print(event)
> ++
> ++                raise Exception("Events not correct.")
> +
> +     def test__renames(self):
> +
> +@@ -283,26 +404,30 @@ class TestInotifyTree(unittest.TestCase):
> +             new_path =3D os.path.join(path, 'new_folder')
> +
> +             os.mkdir(old_path)
> ++
> ++            wd_path =3D get_wd(i.inotify, path)
> +
> +             events1 =3D self.__read_all_events(i)
> +
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
080, cookie=3Devents1[0][0].cookie, len=3D16), ['IN_ISDIR', 'IN_CREATE'], p=
ath, 'old_folder'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742080, cookie=3Devents1[0][0].cookie, len=3D16), ['IN_CREATE', 'IN_ISDI=
R'], path, 'old_folder'),
> +             ]
> +
> +-            self.assertEquals(events1, expected)
> +-
> ++            self.assertEqual(events1, expected)
> +
> +             os.rename(old_path, new_path)
> +
> ++            wd_old_path =3D get_wd(i.inotify, old_path)
> ++
> +             events2 =3D self.__read_all_events(i)
> +
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073741=
888, cookie=3Devents2[0][0].cookie, len=3D16), ['IN_MOVED_FROM', 'IN_ISDIR'=
], path, 'old_folder'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073741=
952, cookie=3Devents2[1][0].cookie, len=3D16), ['IN_MOVED_TO', 'IN_ISDIR'],=
 path, 'new_folder'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073741888, cookie=3Devents2[0][0].cookie, len=3D16), ['IN_MOVED_FROM', 'IN_=
ISDIR'], path, 'old_folder'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073741952, cookie=3Devents2[1][0].cookie, len=3D16), ['IN_MOVED_TO', 'IN_IS=
DIR'], path, 'new_folder'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D2048, cookie=3D0, len=3D0), ['IN_MOVE_SELF'], new_path, '')
> +             ]
> +
> +-            self.assertEquals(events2, expected)
> ++            self.assertEqual(events2, expected)
> +
> +
> +             with open(os.path.join(new_path, 'old_filename'), 'w'):
> +@@ -318,21 +443,33 @@ class TestInotifyTree(unittest.TestCase):
> +             events3 =3D self.__read_all_events(i)
> +
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], new_path, 'old_filename'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], new_path, 'old_filename'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], new_path, 'old_filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D256, cookie=3D0, len=3D16), ['IN_CREATE'], new_path, 'old_filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D32, cookie=3D0, len=3D16), ['IN_OPEN'], new_path, 'old_filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], new_path, 'old_filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D64, cookie=3Devents3[3][0].cookie, len=3D16), ['IN_MOVED_FROM'], new_pat=
h, 'old_filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D128, cookie=3Devents3[4][0].cookie, len=3D16), ['IN_MOVED_TO'], new_path=
, 'new_filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D512, cookie=3D0, len=3D16), ['IN_DELETE'], new_path, 'new_filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D1024, cookie=3D0, len=3D0), ['IN_DELETE_SELF'], new_path, ''),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D32768, cookie=3D0, len=3D0), ['IN_IGNORED'], new_path, ''),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742336, cookie=3D0, len=3D16), ['IN_DELETE', 'IN_ISDIR'], path, 'new_fol=
der'),
> ++            ]
> +
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D64, coo=
kie=3Devents3[3][0].cookie, len=3D16), ['IN_MOVED_FROM'], new_path, 'old_fi=
lename'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D128, co=
okie=3Devents3[4][0].cookie, len=3D16), ['IN_MOVED_TO'], new_path, 'new_fil=
ename'),
> ++            if events3 !=3D expected:
> ++                print("ACTUAL:")
> ++                print("")
> +
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], new_path, 'new_filename'),
> ++                for i, event in enumerate(events3):
> ++                    print(event)
> +
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D1024, c=
ookie=3D0, len=3D0), ['IN_DELETE_SELF'], new_path, ''),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32768, =
cookie=3D0, len=3D0), ['IN_IGNORED'], new_path, ''),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
336, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_DELETE'], path, 'new_folder'),
> +-            ]
> ++                print("")
> ++
> ++                print("EXPECTED:")
> ++                print("")
> +
> +-            self.assertEquals(events3, expected)
> ++                for i, event in enumerate(expected):
> ++                    print(event)
> ++
> ++                raise Exception("Events not correct.")
> +
> +     def test__automatic_new_watches_on_new_paths(self):
> +
> +@@ -346,39 +483,60 @@ class TestInotifyTree(unittest.TestCase):
> +             path2 =3D os.path.join(path1, 'folder2')
> +
> +             os.mkdir(path1)
> ++
> ++            wd_path =3D get_wd(i.inotify, path)
> +
> +             events =3D self.__read_all_events(i)
> +
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
080, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_CREATE'], path, 'folder1'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742080, cookie=3D0, len=3D16), ['IN_CREATE', 'IN_ISDIR'], path, 'folder1=
'),
> +             ]
> +
> +-            self.assertEquals(events, expected)
> ++            self.assertEqual(events, expected)
> +
> +
> +             os.mkdir(path2)
> +
> ++            wd_path1 =3D get_wd(i.inotify, path1)
> ++
> +             events =3D self.__read_all_events(i)
> +
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D1073742=
080, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_CREATE'], path1, 'folder2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
1073742080, cookie=3D0, len=3D16), ['IN_CREATE', 'IN_ISDIR'], path1, 'folde=
r2'),
> +             ]
> +
> +-            self.assertEquals(events, expected)
> ++            self.assertEqual(events, expected)
> +
> +
> +             with open(os.path.join(path2,'filename'), 'w'):
> +                 pass
> +
> ++            wd_path2 =3D get_wd(i.inotify, path2)
> ++
> +             events =3D self.__read_all_events(i)
> +
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
> +             ]
> +
> +-            self.assertEquals(events, expected)
> ++            if events !=3D expected:
> ++                print("ACTUAL:")
> ++                print("")
> ++
> ++                for i, event in enumerate(events):
> ++                    print(event)
> ++
> ++                print("")
> ++
> ++                print("EXPECTED:")
> ++                print("")
> ++
> ++                for i, event in enumerate(expected):
> ++                    print(event)
> ++
> ++                raise Exception("Events not correct.")
> +
> +     def test__automatic_new_watches_on_existing_paths(self):
> +
> +@@ -396,16 +554,33 @@ class TestInotifyTree(unittest.TestCase):
> +
> +             with open(os.path.join(path2,'filename'), 'w'):
> +                 pass
> ++
> ++            wd =3D get_wd(i.inotify, path2)
> +
> +             events =3D self.__read_all_events(i)
> +
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256, c=
ookie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32, co=
okie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, coo=
kie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
> +             ]
> +
> +-            self.assertEquals(events, expected)
> ++            if events !=3D expected:
> ++                print("ACTUAL:")
> ++                print("")
> ++
> ++                for i, event in enumerate(events):
> ++                    print(event)
> ++
> ++                print("")
> ++
> ++                print("EXPECTED:")
> ++                print("")
> ++
> ++                for i, event in enumerate(expected):
> ++                    print(event)
> ++
> ++                raise Exception("Events not correct.")
> +
> +
> + class TestInotifyTrees(unittest.TestCase):
> +@@ -428,6 +603,9 @@ class TestInotifyTrees(unittest.TestCase):
> +
> +             i =3D inotify.adapters.InotifyTrees([path1, path2])
> +
> ++            wd_path1 =3D get_wd(i.inotify, path1)
> ++            wd_path2 =3D get_wd(i.inotify, path2)
> ++
> +             with open(os.path.join(path1, 'seen_new_file1'), 'w'):
> +                 pass
> +
> +@@ -437,13 +615,13 @@ class TestInotifyTrees(unittest.TestCase):
> +             events =3D self.__read_all_events(i)
> +
> +             expected =3D [
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file1'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file1'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file1'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file1'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file1'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file1'),
> +
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file2'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file2'),
> +-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file2'),
> ++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file2'),
> +             ]
> +
> +-            self.assertEquals(events, expected)
> ++            self.assertEqual(events, expected)
> +--
> +2.35.5
> +
> diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b=
/meta-python/recipes-devtools/python/python3-inotify_git.bb
> index 15fb92eedd..37a2e2a6f2 100644
> --- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
> +++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
> @@ -8,6 +8,7 @@ SRC_URI[sha256sum] =3D "974a623a338482b62e16d4eb705fb863e=
d33ec178680fc3e96ccdf0df6
>
>  SRC_URI =3D " \
>      git://github.com/dsoprea/pyinotify.git;branch=3Dmaster;protocol=3Dht=
tps \
> +    file://new-test-inotify.patch \
>      file://run-ptest \
>  "
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105311): https://lists.openembedded.org/g/openembedde=
d-devel/message/105311
> Mute This Topic: https://lists.openembedded.org/mt/101719595/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

