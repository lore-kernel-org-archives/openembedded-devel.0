Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D25C47073
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 20:12:13 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.13855.1703362330069230921
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Dec 2023 12:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=np5KnfzB;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dbdbfaab70eso2156020276.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 12:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703362329; x=1703967129; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MLRdrkZjVe8Gv30sb2sF2iFSGT8pz2Be1Yl9GuelMGg=;
        b=np5KnfzBfXzlnW2/6v9Diw2wfc4NIL2BGSDcsnhRIPxh9Cn12dy2CBQ/wN338Ve0uv
         3GyLkfnDB1bffx0x15CJjdro+dZ5mzKY/Vu+8dtHONd5WjnT8F9ZJVfcwsTuC3rrYJR7
         9reI4YGL+I6JweSt9Zu3JUB7OKpZiefEEIlg80vp90t5AZCHC1oIvl057ERgd4lEbFzv
         ZtMsLrw06OZZKsP2cCCgljJCj5KkP/NTJGvafS5h4NEpNpRXBTiV7wCPapbmawim7nBv
         g2kRSFlfAVCYOhUdb4XK6hsOi3VY5sNDpkXD3TD6XgYvsjbwAG8yI62awzTUYl4oe+Nn
         M98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703362329; x=1703967129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLRdrkZjVe8Gv30sb2sF2iFSGT8pz2Be1Yl9GuelMGg=;
        b=tr0oxjLmKTpt/IUeLB1jNES0PCCSzSyzOcOAHgpDmbxEcgixGLwL1t/2Jtrm5CIEHh
         LzEpZmWnzyJwNhIwRX1z1rbFpxFtaeV51clf6UneRcOlt1qo32lgEDHDFfmuNpTwpGzX
         e2IxTKHBCKYtzGp6yTRmmmSubY5PB/wbmLCgU3VNWVHNNJWdxVarj3PTPju9OUqbzIcO
         D4k9XkdeMHskYvvNr16r4i/eFNUaff16UjtwZelYbwS+d++Yjl0JurUEcIuXiuLE7tBp
         x63/F7lkF94fsc1LZuFUdhbi2ksNlfZ52g/h7QYUYMCffeuc8VU0F+0us+k5SPSNL0T+
         58ew==
X-Gm-Message-State: AOJu0Yx7iluIGD8bLfvCGiysjftAgTb8FAqSOBnV5jr705u5z6tS3u7e
	WoUSTO4fAlQd2xd6OcT8ZczSyT56Y10c/yrxS4s=
X-Google-Smtp-Source: AGHT+IGAJ5ZjL07gLYEEq/KVczjoBfxGb5A/7Zb+ESnVACqKDkKRmaeVV6Xt4cWFp4V0EBi4NmaKlxNS131gRcMKNSs=
X-Received: by 2002:a25:dc11:0:b0:dbd:3969:f2bb with SMTP id
 y17-20020a25dc11000000b00dbd3969f2bbmr1743353ybe.120.1703362328796; Sat, 23
 Dec 2023 12:12:08 -0800 (PST)
MIME-Version: 1.0
References: <20231222151108.645675-1-alex@linutronix.de> <CAMKF1so--mRfBjFwyW3b1ZigtfxSvX-rYcvhvzCExYUpjJXTVQ@mail.gmail.com>
 <CANNYZj8NriRkbO52ThZ4Z_rWF-UCZYK_EyJqprEfLdz6r3KRoA@mail.gmail.com>
In-Reply-To: <CANNYZj8NriRkbO52ThZ4Z_rWF-UCZYK_EyJqprEfLdz6r3KRoA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 23 Dec 2023 12:11:57 -0800
Message-ID: <CANx9H-B0y8B3iR22BaYh_2cVjyYrLs2H8PakZAPu1c4KKRBa0g@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/9] python3-yappi: update 1.4.0 -> 1.6.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000882096060d32f2ee"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Dec 2023 20:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107775

--000000000000882096060d32f2ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 8:12=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> I didn't try that. And I have to ask: checking ptests by hand means
> we're not running those ptests regularly in CI, and if so, then why
> bother? It can regress at any point through seemingly unrelated
> changes, and maybe already has even before this update.
>
> If python 3.12 update has a chance of ever happening, ptests need to
> be checked by someone else, as there are still some 25 build failures
> I need to look at. Otherwise doing all the runtime testing and fixing
> across the whole python stack simply exceeds my capacity.
>

Thanks for starting the process, Alex. I=E2=80=99ll work in this one.

>
> Alex
>
> On Fri, 22 Dec 2023 at 16:54, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Dec 22, 2023 at 7:11=E2=80=AFAM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Drop patches:
> > > 0002-add-3.11-to-the-setup.patch - issue resolved upstream
> > > 0001-Fix-imports-for-ptests.patch - unclear what the problem is, too
> difficult to rebase.
> >
> > Does
> > bitbake meta-python-image-ptest-python3-yappi
> >
> > show regression ?
> >
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  .../0001-Fix-imports-for-ptests.patch         | 3895 ---------------=
--
> > >  .../0002-add-3.11-to-the-setup.patch          |   26 -
> > >  ...-yappi_1.4.0.bb =3D> python3-yappi_1.6.0.bb} |    8 +-
> > >  3 files changed, 2 insertions(+), 3927 deletions(-)
> > >  delete mode 100644
> meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-pt=
ests.patch
> > >  delete mode 100644
> meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-se=
tup.patch
> > >  rename meta-python/recipes-devtools/python/{python3-yappi_1.4.0.bb
> =3D> python3-yappi_1.6.0.bb} (74%)
> > >
> > > diff --git
> a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-=
ptests.patch
> b/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-=
ptests.patch
> > > deleted file mode 100644
> > > index 476db4b7d..000000000
> > > ---
> a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-=
ptests.patch
> > > +++ /dev/null
> > > @@ -1,3895 +0,0 @@
> > > -From 0dedc1c573ddc4e87475eb03c64555cd54a72e92 Mon Sep 17 00:00:00 20=
01
> > > -From: Trevor Gamblin <trevor.gamblin@windriver.com>
> > > -Date: Mon, 7 Jun 2021 09:40:20 -0400
> > > -Subject: [PATCH] Fix imports for tests
> > > -
> > > -Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > > ----
> > > -Upstream-Status: Pending
> > > -
> > > - tests/test_asyncio.py              | 2 +-
> > > - tests/test_asyncio_context_vars.py | 2 +-
> > > - tests/test_functionality.py        | 2 +-
> > > - tests/test_hooks.py                | 2 +-
> > > - tests/test_tags.py                 | 2 +-
> > > - 5 files changed, 6 insertions(+), 6 deletions(-)
> > > -
> > > ---- a/tests/test_asyncio.py
> > > -+++ b/tests/test_asyncio.py
> > > -@@ -2,7 +2,7 @@ import unittest
> > > - import yappi
> > > - import asyncio
> > > - import threading
> > > --from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> > > -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> > > -
> > > -
> > > - async def async_sleep(sec):
> > > ---- a/tests/test_asyncio_context_vars.py
> > > -+++ b/tests/test_asyncio_context_vars.py
> > > -@@ -5,7 +5,7 @@ import contextvars
> > > - import functools
> > > - import time
> > > - import os
> > > --import utils
> > > -+import tests.utils as utils
> > > - import yappi
> > > -
> > > - async_context_id =3D contextvars.ContextVar('async_context_id')
> > > ---- a/tests/test_functionality.py
> > > -+++ b/tests/test_functionality.py
> > > -@@ -1,1916 +1,1916 @@
> > > --import os
> > > --import sys
> > > --import time
> > > --import threading
> > > --import unittest
> > > --import yappi
> > > --import _yappi
> > > --import utils
> > > --import multiprocessing  # added to fix
> http://bugs.python.org/issue15881 for > Py2.6
> > > --import subprocess
> > > --
> > > --_counter =3D 0
> > > --
> > > --
> > > --class BasicUsage(utils.YappiUnitTestCase):
> > > --
> > > --    def test_callback_function_int_return_overflow(self):
> > > --        # this test is just here to check if any errors are
> generated, as the err
> > > --        # is printed in C side, I did not include it here. THere ar=
e
> ways to test
> > > --        # this deterministically, I did not bother
> > > --        import ctypes
> > > --
> > > --        def _unsigned_overflow_margin():
> > > --            return 2**(ctypes.sizeof(ctypes.c_void_p) * 8) - 1
> > > --
> > > --        def foo():
> > > --            pass
> > > --
> > > --        #with utils.captured_output() as (out, err):
> > > --        yappi.set_context_id_callback(_unsigned_overflow_margin)
> > > --        yappi.set_tag_callback(_unsigned_overflow_margin)
> > > --        yappi.start()
> > > --        foo()
> > > --
> > > --    def test_issue60(self):
> > > --
> > > --        def foo():
> > > --            buf =3D bytearray()
> > > --            buf +=3D b't' * 200
> > > --            view =3D memoryview(buf)[10:]
> > > --            view =3D view.tobytes()
> > > --            del buf[:10]  # this throws exception
> > > --            return view
> > > --
> > > --        yappi.start(builtins=3DTrue)
> > > --        foo()
> > > --        self.assertTrue(
> > > --            len(
> > > --                yappi.get_func_stats(
> > > --                    filter_callback=3Dlambda x: yappi.
> > > --                    func_matches(x, [memoryview.tobytes])
> > > --                )
> > > --            ) > 0
> > > --        )
> > > --        yappi.stop()
> > > --
> > > --    def test_issue54(self):
> > > --
> > > --        def _tag_cbk():
> > > --            global _counter
> > > --            _counter +=3D 1
> > > --            return _counter
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        def b():
> > > --            pass
> > > --
> > > --        yappi.set_tag_callback(_tag_cbk)
> > > --        yappi.start()
> > > --        a()
> > > --        a()
> > > --        a()
> > > --        yappi.stop()
> > > --        stats =3D yappi.get_func_stats()
> > > --        self.assertEqual(stats.pop().ncall, 3)  # aggregated if no
> tag is given
> > > --        stats =3D yappi.get_func_stats(tag=3D1)
> > > --
> > > --        for i in range(1, 3):
> > > --            stats =3D yappi.get_func_stats(tag=3Di)
> > > --            stats =3D yappi.get_func_stats(
> > > --                tag=3Di, filter_callback=3Dlambda x:
> yappi.func_matches(x, [a])
> > > --            )
> > > --
> > > --            stat =3D stats.pop()
> > > --            self.assertEqual(stat.ncall, 1)
> > > --
> > > --        yappi.set_tag_callback(None)
> > > --        yappi.clear_stats()
> > > --        yappi.start()
> > > --        b()
> > > --        b()
> > > --        stats =3D yappi.get_func_stats()
> > > --        self.assertEqual(len(stats), 1)
> > > --        stat =3D stats.pop()
> > > --        self.assertEqual(stat.ncall, 2)
> > > --
> > > --    def test_filter(self):
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        def b():
> > > --            a()
> > > --
> > > --        def c():
> > > --            b()
> > > --
> > > --        _TCOUNT =3D 5
> > > --
> > > --        ts =3D []
> > > --        yappi.start()
> > > --        for i in range(_TCOUNT):
> > > --            t =3D threading.Thread(target=3Dc)
> > > --            t.start()
> > > --            ts.append(t)
> > > --
> > > --        for t in ts:
> > > --            t.join()
> > > --
> > > --        yappi.stop()
> > > --
> > > --        ctx_ids =3D []
> > > --        for tstat in yappi.get_thread_stats():
> > > --            if tstat.name =3D=3D '_MainThread':
> > > --                main_ctx_id =3D tstat.id
> > > --            else:
> > > --                ctx_ids.append(tstat.id)
> > > --
> > > --        fstats =3D yappi.get_func_stats(filter=3D{"ctx_id": 9})
> > > --        self.assertTrue(fstats.empty())
> > > --        fstats =3D yappi.get_func_stats(
> > > --            filter=3D{
> > > --                "ctx_id": main_ctx_id,
> > > --                "name": "c"
> > > --            }
> > > --        )  # main thread
> > > --        self.assertTrue(fstats.empty())
> > > --
> > > --        for i in ctx_ids:
> > > --            fstats =3D yappi.get_func_stats(
> > > --                filter=3D{
> > > --                    "ctx_id": i,
> > > --                    "name": "a",
> > > --                    "ncall": 1
> > > --                }
> > > --            )
> > > --            self.assertEqual(fstats.pop().ncall, 1)
> > > --            fstats =3D yappi.get_func_stats(filter=3D{"ctx_id": i,
> "name": "b"})
> > > --            self.assertEqual(fstats.pop().ncall, 1)
> > > --            fstats =3D yappi.get_func_stats(filter=3D{"ctx_id": i,
> "name": "c"})
> > > --            self.assertEqual(fstats.pop().ncall, 1)
> > > --
> > > --        yappi.clear_stats()
> > > --        yappi.start(builtins=3DTrue)
> > > --        time.sleep(0.1)
> > > --        yappi.stop()
> > > --        fstats =3D yappi.get_func_stats(filter=3D{"module": "time"}=
)
> > > --        self.assertEqual(len(fstats), 1)
> > > --
> > > --        # invalid filters`
> > > --        self.assertRaises(
> > > --            Exception, yappi.get_func_stats, filter=3D{'tag': "sss"=
}
> > > --        )
> > > --        self.assertRaises(
> > > --            Exception, yappi.get_func_stats, filter=3D{'ctx_id':
> "None"}
> > > --        )
> > > --
> > > --    def test_filter_callback(self):
> > > --
> > > --        def a():
> > > --            time.sleep(0.1)
> > > --
> > > --        def b():
> > > --            a()
> > > --
> > > --        def c():
> > > --            pass
> > > --
> > > --        def d():
> > > --            pass
> > > --
> > > --        yappi.set_clock_type("wall")
> > > --        yappi.start(builtins=3DTrue)
> > > --        a()
> > > --        b()
> > > --        c()
> > > --        d()
> > > --        stats =3D yappi.get_func_stats(
> > > --            filter_callback=3Dlambda x: yappi.func_matches(x, [a, b=
])
> > > --        )
> > > --        #stats.print_all()
> > > --        r1 =3D '''
> > > --        tests/test_functionality.py:98 a      2      0.000000
> 0.200350  0.100175
> > > --        tests/test_functionality.py:101 b     1      0.000000
> 0.120000  0.100197
> > > --        '''
> > > --        self.assert_traces_almost_equal(r1, stats)
> > > --        self.assertEqual(len(stats), 2)
> > > --        stats =3D yappi.get_func_stats(
> > > --            filter_callback=3Dlambda x: yappi.
> > > --            module_matches(x, [sys.modules[__name__]])
> > > --        )
> > > --        r1 =3D '''
> > > --        tests/test_functionality.py:98 a      2      0.000000
> 0.230130  0.115065
> > > --        tests/test_functionality.py:101 b     1      0.000000
> 0.120000  0.109011
> > > --        tests/test_functionality.py:104 c     1      0.000000
> 0.000002  0.000002
> > > --        tests/test_functionality.py:107 d     1      0.000000
> 0.000001  0.000001
> > > --        '''
> > > --        self.assert_traces_almost_equal(r1, stats)
> > > --        self.assertEqual(len(stats), 4)
> > > --
> > > --        stats =3D yappi.get_func_stats(
> > > --            filter_callback=3Dlambda x: yappi.func_matches(x,
> [time.sleep])
> > > --        )
> > > --        self.assertEqual(len(stats), 1)
> > > --        r1 =3D '''
> > > --        time.sleep                            2      0.206804
> 0.220000  0.103402
> > > --        '''
> > > --        self.assert_traces_almost_equal(r1, stats)
> > > --
> > > --    def test_print_formatting(self):
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        def b():
> > > --            a()
> > > --
> > > --        func_cols =3D {
> > > --            1: ("name", 48),
> > > --            0: ("ncall", 5),
> > > --            2: ("tsub", 8),
> > > --        }
> > > --        thread_cols =3D {
> > > --            1: ("name", 48),
> > > --            0: ("ttot", 8),
> > > --        }
> > > --
> > > --        yappi.start()
> > > --        a()
> > > --        b()
> > > --        yappi.stop()
> > > --        fs =3D yappi.get_func_stats()
> > > --        cs =3D fs[1].children
> > > --        ts =3D yappi.get_thread_stats()
> > > --        #fs.print_all(out=3Dsys.stderr, columns=3D{1:("name", 70), =
})
> > > --        #cs.print_all(out=3Dsys.stderr, columns=3Dfunc_cols)
> > > --        #ts.print_all(out=3Dsys.stderr, columns=3Dthread_cols)
> > > --        #cs.print_all(out=3Dsys.stderr, columns=3D{})
> > > --
> > > --        self.assertRaises(
> > > --            yappi.YappiError, fs.print_all, columns=3D{1: ("namee",=
 9)}
> > > --        )
> > > --        self.assertRaises(
> > > --            yappi.YappiError, cs.print_all, columns=3D{1: ("dd", 0)=
}
> > > --        )
> > > --        self.assertRaises(
> > > --            yappi.YappiError, ts.print_all, columns=3D{1: ("tidd", =
0)}
> > > --        )
> > > --
> > > --    def test_get_clock(self):
> > > --        yappi.set_clock_type('cpu')
> > > --        self.assertEqual('cpu', yappi.get_clock_type())
> > > --        clock_info =3D yappi.get_clock_info()
> > > --        self.assertTrue('api' in clock_info)
> > > --        self.assertTrue('resolution' in clock_info)
> > > --
> > > --        yappi.set_clock_type('wall')
> > > --        self.assertEqual('wall', yappi.get_clock_type())
> > > --
> > > --        t0 =3D yappi.get_clock_time()
> > > --        time.sleep(0.1)
> > > --        duration =3D yappi.get_clock_time() - t0
> > > --        self.assertTrue(0.05 < duration < 0.3)
> > > --
> > > --    def test_profile_decorator(self):
> > > --
> > > --        def aggregate(func, stats):
> > > --            fname =3D "tests/%s.profile" % (func.__name__)
> > > --            try:
> > > --                stats.add(fname)
> > > --            except IOError:
> > > --                pass
> > > --            stats.save(fname)
> > > --            raise Exception("messing around")
> > > --
> > > --        @yappi.profile(return_callback=3Daggregate)
> > > --        def a(x, y):
> > > --            if x + y =3D=3D 25:
> > > --                raise Exception("")
> > > --            return x + y
> > > --
> > > --        def b():
> > > --            pass
> > > --
> > > --        try:
> > > --            os.remove(
> > > --                "tests/a.profile"
> > > --            )  # remove the one from prev test, if available
> > > --        except:
> > > --            pass
> > > --
> > > --        # global profile is on to mess things up
> > > --        yappi.start()
> > > --        b()
> > > --
> > > --        # assert functionality and call function at same time
> > > --        try:
> > > --            self.assertEqual(a(1, 2), 3)
> > > --        except:
> > > --            pass
> > > --        try:
> > > --            self.assertEqual(a(2, 5), 7)
> > > --        except:
> > > --            pass
> > > --        try:
> > > --            a(4, 21)
> > > --        except:
> > > --            pass
> > > --        stats =3D yappi.get_func_stats().add("tests/a.profile")
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        self.assertEqual(fsa.ncall, 3)
> > > --        self.assertEqual(len(stats), 1)  # b() should be cleared ou=
t.
> > > --
> > > --        @yappi.profile(return_callback=3Daggregate)
> > > --        def count_down_rec(n):
> > > --            if n =3D=3D 0:
> > > --                return
> > > --            count_down_rec(n - 1)
> > > --
> > > --        try:
> > > --            os.remove(
> > > --                "tests/count_down_rec.profile"
> > > --            )  # remove the one from prev test, if available
> > > --        except:
> > > --            pass
> > > --
> > > --        try:
> > > --            count_down_rec(4)
> > > --        except:
> > > --            pass
> > > --        try:
> > > --            count_down_rec(3)
> > > --        except:
> > > --            pass
> > > --
> > > --        stats =3D yappi.YFuncStats("tests/count_down_rec.profile")
> > > --        fsrec =3D utils.find_stat_by_name(stats, 'count_down_rec')
> > > --        self.assertEqual(fsrec.ncall, 9)
> > > --        self.assertEqual(fsrec.nactualcall, 2)
> > > --
> > > --    def test_strip_dirs(self):
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a, )
> > > --        stats.strip_dirs()
> > > --        fsa =3D utils.find_stat_by_name(stats, "a")
> > > --        self.assertEqual(fsa.module, os.path.basename(fsa.module))
> > > --
> > > --    @unittest.skipIf(os.name =3D=3D "nt", "do not run on Windows")
> > > --    def test_run_as_script(self):
> > > --        import re
> > > --        p =3D subprocess.Popen(
> > > --            ['yappi', os.path.join('./tests', 'run_as_script.py')],
> > > --            stdout=3Dsubprocess.PIPE
> > > --        )
> > > --        out, err =3D p.communicate()
> > > --        self.assertEqual(p.returncode, 0)
> > > --        func_stats, thread_stats =3D re.split(
> > > --            b'name\\s+id\\s+tid\\s+ttot\\s+scnt\\s*\n', out
> > > --        )
> > > --        self.assertTrue(b'FancyThread' in thread_stats)
> > > --
> > > --    def test_yappi_overhead(self):
> > > --        LOOP_COUNT =3D 100000
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        def b():
> > > --            for i in range(LOOP_COUNT):
> > > --                a()
> > > --
> > > --        t0 =3D time.time()
> > > --        yappi.start()
> > > --        b()
> > > --        yappi.stop()
> > > --        time_with_yappi =3D time.time() - t0
> > > --        t0 =3D time.time()
> > > --        b()
> > > --        time_without_yappi =3D time.time() - t0
> > > --        if time_without_yappi =3D=3D 0:
> > > --            time_without_yappi =3D 0.000001
> > > --
> > > --        # in latest v0.82, I calculated this as close to "7.0" in m=
y
> machine.
> > > --        # however, %83 of this overhead is coming from tickcount().
> The other %17
> > > --        # seems to have been evenly distributed to the internal
> bookkeeping
> > > --        # structures/algorithms which seems acceptable. Note that
> our test only
> > > --        # tests one function being profiled at-a-time in a short
> interval.
> > > --        # profiling high number of functions in a small time
> > > --        # is a different beast, (which is pretty unlikely in most
> applications)
> > > --        # So as a conclusion: I cannot see any optimization window
> for Yappi that
> > > --        # is worth implementing as we will only optimize %17 of the
> time.
> > > --        sys.stderr.write("\r\nYappi puts %0.1f times overhead to th=
e
> profiled application in average.\r\n" % \
> > > --            (time_with_yappi / time_without_yappi))
> > > --
> > > --    def test_clear_stats_while_running(self):
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        yappi.start()
> > > --        a()
> > > --        yappi.clear_stats()
> > > --        a()
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        self.assertEqual(fsa.ncall, 1)
> > > --
> > > --    def test_generator(self):
> > > --
> > > --        def _gen(n):
> > > --            while (n > 0):
> > > --                yield n
> > > --                n -=3D 1
> > > --
> > > --        yappi.start()
> > > --        for x in _gen(5):
> > > --            pass
> > > --        self.assertTrue(
> > > --            yappi.convert2pstats(yappi.get_func_stats()) is not Non=
e
> > > --        )
> > > --
> > > --    def test_slice_child_stats_and_strip_dirs(self):
> > > --
> > > --        def b():
> > > --            for i in range(10000000):
> > > --                pass
> > > --
> > > --        def a():
> > > --            b()
> > > --
> > > --        yappi.start(builtins=3DTrue)
> > > --        a()
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        self.assertTrue(fsa.children[0:1] is not None)
> > > --        prev_afullname =3D fsa.full_name
> > > --        prev_bchildfullname =3D fsa.children[fsb].full_name
> > > --        stats.strip_dirs()
> > > --        self.assertTrue(len(prev_afullname) > len(fsa.full_name))
> > > --        self.assertTrue(
> > > --            len(prev_bchildfullname) >
> len(fsa.children[fsb].full_name)
> > > --        )
> > > --
> > > --    def test_children_stat_functions(self):
> > > --        _timings =3D {"a_1": 5, "b_1": 3, "c_1": 1}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        def b():
> > > --            pass
> > > --
> > > --        def c():
> > > --            pass
> > > --
> > > --        def a():
> > > --            b()
> > > --            c()
> > > --
> > > --        yappi.start()
> > > --        a()
> > > --        b()  # non-child call
> > > --        c()  # non-child call
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        childs_of_a =3D fsa.children.get().sort("tavg", "desc")
> > > --        prev_item =3D None
> > > --        for item in childs_of_a:
> > > --            if prev_item:
> > > --                self.assertTrue(prev_item.tavg > item.tavg)
> > > --            prev_item =3D item
> > > --        childs_of_a.sort("name", "desc")
> > > --        prev_item =3D None
> > > --        for item in childs_of_a:
> > > --            if prev_item:
> > > --                self.assertTrue(prev_item.name > item.name)
> > > --            prev_item =3D item
> > > --        childs_of_a.clear()
> > > --        self.assertTrue(childs_of_a.empty())
> > > --
> > > --    def test_no_stats_different_clock_type_load(self):
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        yappi.start()
> > > --        a()
> > > --        yappi.stop()
> > > --        yappi.get_func_stats().save("tests/ystats1.ys")
> > > --        yappi.clear_stats()
> > > --        yappi.set_clock_type("WALL")
> > > --        yappi.start()
> > > --        yappi.stop()
> > > --        stats =3D yappi.get_func_stats().add("tests/ystats1.ys")
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        self.assertTrue(fsa is not None)
> > > --
> > > --    def test_subsequent_profile(self):
> > > --        _timings =3D {"a_1": 1, "b_1": 1}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        def b():
> > > --            pass
> > > --
> > > --        yappi.start()
> > > --        a()
> > > --        yappi.stop()
> > > --        yappi.start()
> > > --        b()
> > > --        yappi.stop()
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        self.assertTrue(fsa is not None)
> > > --        self.assertTrue(fsb is not None)
> > > --        self.assertEqual(fsa.ttot, 1)
> > > --        self.assertEqual(fsb.ttot, 1)
> > > --
> > > --    def test_lambda(self):
> > > --        f =3D lambda: time.sleep(0.3)
> > > --        yappi.set_clock_type("wall")
> > > --        yappi.start()
> > > --        f()
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsa =3D utils.find_stat_by_name(stats, '<lambda>')
> > > --        self.assertTrue(fsa.ttot > 0.1)
> > > --
> > > --    def test_module_stress(self):
> > > --        self.assertEqual(yappi.is_running(), False)
> > > --
> > > --        yappi.start()
> > > --        yappi.clear_stats()
> > > --        self.assertRaises(_yappi.error, yappi.set_clock_type, "wall=
")
> > > --
> > > --        yappi.stop()
> > > --        yappi.clear_stats()
> > > --        yappi.set_clock_type("cpu")
> > > --        self.assertRaises(yappi.YappiError, yappi.set_clock_type,
> "dummy")
> > > --        self.assertEqual(yappi.is_running(), False)
> > > --        yappi.clear_stats()
> > > --        yappi.clear_stats()
> > > --
> > > --    def test_stat_sorting(self):
> > > --        _timings =3D {"a_1": 13, "b_1": 10, "a_2": 6, "b_2": 1}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        self._ncall =3D 1
> > > --
> > > --        def a():
> > > --            b()
> > > --
> > > --        def b():
> > > --            if self._ncall =3D=3D 2:
> > > --                return
> > > --            self._ncall +=3D 1
> > > --            a()
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a)
> > > --        stats =3D stats.sort("totaltime", "desc")
> > > --        prev_stat =3D None
> > > --        for stat in stats:
> > > --            if prev_stat:
> > > --                self.assertTrue(prev_stat.ttot >=3D stat.ttot)
> > > --            prev_stat =3D stat
> > > --        stats =3D stats.sort("totaltime", "asc")
> > > --        prev_stat =3D None
> > > --        for stat in stats:
> > > --            if prev_stat:
> > > --                self.assertTrue(prev_stat.ttot <=3D stat.ttot)
> > > --            prev_stat =3D stat
> > > --        stats =3D stats.sort("avgtime", "asc")
> > > --        prev_stat =3D None
> > > --        for stat in stats:
> > > --            if prev_stat:
> > > --                self.assertTrue(prev_stat.tavg <=3D stat.tavg)
> > > --            prev_stat =3D stat
> > > --        stats =3D stats.sort("name", "asc")
> > > --        prev_stat =3D None
> > > --        for stat in stats:
> > > --            if prev_stat:
> > > --                self.assertTrue(prev_stat.name <=3D stat.name)
> > > --            prev_stat =3D stat
> > > --        stats =3D stats.sort("subtime", "asc")
> > > --        prev_stat =3D None
> > > --        for stat in stats:
> > > --            if prev_stat:
> > > --                self.assertTrue(prev_stat.tsub <=3D stat.tsub)
> > > --            prev_stat =3D stat
> > > --
> > > --        self.assertRaises(
> > > --            yappi.YappiError, stats.sort, "invalid_func_sorttype_ar=
g"
> > > --        )
> > > --        self.assertRaises(
> > > --            yappi.YappiError, stats.sort, "totaltime",
> > > --            "invalid_func_sortorder_arg"
> > > --        )
> > > --
> > > --    def test_start_flags(self):
> > > --        self.assertEqual(_yappi._get_start_flags(), None)
> > > --        yappi.start()
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        a()
> > > --
> self.assertEqual(_yappi._get_start_flags()["profile_builtins"], 0)
> > > --
> self.assertEqual(_yappi._get_start_flags()["profile_multicontext"], 1)
> > > --        self.assertEqual(len(yappi.get_thread_stats()), 1)
> > > --
> > > --    def test_builtin_profiling(self):
> > > --
> > > --        def a():
> > > --            time.sleep(0.4)  # is a builtin function
> > > --
> > > --        yappi.set_clock_type('wall')
> > > --
> > > --        yappi.start(builtins=3DTrue)
> > > --        a()
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsa =3D utils.find_stat_by_name(stats, 'sleep')
> > > --        self.assertTrue(fsa is not None)
> > > --        self.assertTrue(fsa.ttot > 0.3)
> > > --        yappi.stop()
> > > --        yappi.clear_stats()
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        yappi.start()
> > > --        t =3D threading.Thread(target=3Da)
> > > --        t.start()
> > > --        t.join()
> > > --        stats =3D yappi.get_func_stats()
> > > --
> > > --    def test_singlethread_profiling(self):
> > > --        yappi.set_clock_type('wall')
> > > --
> > > --        def a():
> > > --            time.sleep(0.2)
> > > --
> > > --        class Worker1(threading.Thread):
> > > --
> > > --            def a(self):
> > > --                time.sleep(0.3)
> > > --
> > > --            def run(self):
> > > --                self.a()
> > > --
> > > --        yappi.start(profile_threads=3DFalse)
> > > --
> > > --        c =3D Worker1()
> > > --        c.start()
> > > --        c.join()
> > > --        a()
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsa1 =3D utils.find_stat_by_name(stats, 'Worker1.a')
> > > --        fsa2 =3D utils.find_stat_by_name(stats, 'a')
> > > --        self.assertTrue(fsa1 is None)
> > > --        self.assertTrue(fsa2 is not None)
> > > --        self.assertTrue(fsa2.ttot > 0.1)
> > > --
> > > --    def test_run(self):
> > > --
> > > --        def profiled():
> > > --            pass
> > > --
> > > --        yappi.clear_stats()
> > > --        try:
> > > --            with yappi.run():
> > > --                profiled()
> > > --            stats =3D yappi.get_func_stats()
> > > --        finally:
> > > --            yappi.clear_stats()
> > > --
> > > --        self.assertIsNotNone(utils.find_stat_by_name(stats,
> 'profiled'))
> > > --
> > > --    def test_run_recursive(self):
> > > --
> > > --        def profiled():
> > > --            pass
> > > --
> > > --        def not_profiled():
> > > --            pass
> > > --
> > > --        yappi.clear_stats()
> > > --        try:
> > > --            with yappi.run():
> > > --                with yappi.run():
> > > --                    profiled()
> > > --                # Profiling stopped here
> > > --                not_profiled()
> > > --            stats =3D yappi.get_func_stats()
> > > --        finally:
> > > --            yappi.clear_stats()
> > > --
> > > --        self.assertIsNotNone(utils.find_stat_by_name(stats,
> 'profiled'))
> > > --        self.assertIsNone(utils.find_stat_by_name(stats,
> 'not_profiled'))
> > > --
> > > --
> > > --class StatSaveScenarios(utils.YappiUnitTestCase):
> > > --
> > > --    def test_pstats_conversion(self):
> > > --
> > > --        def pstat_id(fs):
> > > --            return (fs.module, fs.lineno, fs.name)
> > > --
> > > --        def a():
> > > --            d()
> > > --
> > > --        def b():
> > > --            d()
> > > --
> > > --        def c():
> > > --            pass
> > > --
> > > --        def d():
> > > --            pass
> > > --
> > > --        _timings =3D {"a_1": 12, "b_1": 7, "c_1": 5, "d_1": 2}
> > > --        _yappi._set_test_timings(_timings)
> > > --        stats =3D utils.run_and_get_func_stats(a, )
> > > --        stats.strip_dirs()
> > > --        stats.save("tests/a1.pstats", type=3D"pstat")
> > > --        fsa_pid =3D pstat_id(utils.find_stat_by_name(stats, "a"))
> > > --        fsd_pid =3D pstat_id(utils.find_stat_by_name(stats, "d"))
> > > --        yappi.clear_stats()
> > > --        _yappi._set_test_timings(_timings)
> > > --        stats =3D utils.run_and_get_func_stats(a, )
> > > --        stats.strip_dirs()
> > > --        stats.save("tests/a2.pstats", type=3D"pstat")
> > > --        yappi.clear_stats()
> > > --        _yappi._set_test_timings(_timings)
> > > --        stats =3D utils.run_and_get_func_stats(b, )
> > > --        stats.strip_dirs()
> > > --        stats.save("tests/b1.pstats", type=3D"pstat")
> > > --        fsb_pid =3D pstat_id(utils.find_stat_by_name(stats, "b"))
> > > --        yappi.clear_stats()
> > > --        _yappi._set_test_timings(_timings)
> > > --        stats =3D utils.run_and_get_func_stats(c, )
> > > --        stats.strip_dirs()
> > > --        stats.save("tests/c1.pstats", type=3D"pstat")
> > > --        fsc_pid =3D pstat_id(utils.find_stat_by_name(stats, "c"))
> > > --
> > > --        # merge saved stats and check pstats values are correct
> > > --        import pstats
> > > --        p =3D pstats.Stats(
> > > --            'tests/a1.pstats', 'tests/a2.pstats', 'tests/b1.pstats'=
,
> > > --            'tests/c1.pstats'
> > > --        )
> > > --        p.strip_dirs()
> > > --        # ct =3D ttot, tt =3D tsub
> > > --        (cc, nc, tt, ct, callers) =3D p.stats[fsa_pid]
> > > --        self.assertEqual(cc, nc, 2)
> > > --        self.assertEqual(tt, 20)
> > > --        self.assertEqual(ct, 24)
> > > --        (cc, nc, tt, ct, callers) =3D p.stats[fsd_pid]
> > > --        self.assertEqual(cc, nc, 3)
> > > --        self.assertEqual(tt, 6)
> > > --        self.assertEqual(ct, 6)
> > > --        self.assertEqual(len(callers), 2)
> > > --        (cc, nc, tt, ct) =3D callers[fsa_pid]
> > > --        self.assertEqual(cc, nc, 2)
> > > --        self.assertEqual(tt, 4)
> > > --        self.assertEqual(ct, 4)
> > > --        (cc, nc, tt, ct) =3D callers[fsb_pid]
> > > --        self.assertEqual(cc, nc, 1)
> > > --        self.assertEqual(tt, 2)
> > > --        self.assertEqual(ct, 2)
> > > --
> > > --    def test_merge_stats(self):
> > > --        _timings =3D {
> > > --            "a_1": 15,
> > > --            "b_1": 14,
> > > --            "c_1": 12,
> > > --            "d_1": 10,
> > > --            "e_1": 9,
> > > --            "f_1": 7,
> > > --            "g_1": 6,
> > > --            "h_1": 5,
> > > --            "i_1": 1
> > > --        }
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        def a():
> > > --            b()
> > > --
> > > --        def b():
> > > --            c()
> > > --
> > > --        def c():
> > > --            d()
> > > --
> > > --        def d():
> > > --            e()
> > > --
> > > --        def e():
> > > --            f()
> > > --
> > > --        def f():
> > > --            g()
> > > --
> > > --        def g():
> > > --            h()
> > > --
> > > --        def h():
> > > --            i()
> > > --
> > > --        def i():
> > > --            pass
> > > --
> > > --        yappi.start()
> > > --        a()
> > > --        a()
> > > --        yappi.stop()
> > > --        stats =3D yappi.get_func_stats()
> > > --        self.assertRaises(
> > > --            NotImplementedError, stats.save, "", "INVALID_SAVE_TYPE=
"
> > > --        )
> > > --        stats.save("tests/ystats2.ys")
> > > --        yappi.clear_stats()
> > > --        _yappi._set_test_timings(_timings)
> > > --        yappi.start()
> > > --        a()
> > > --        stats =3D yappi.get_func_stats().add("tests/ystats2.ys")
> > > --        fsa =3D utils.find_stat_by_name(stats, "a")
> > > --        fsb =3D utils.find_stat_by_name(stats, "b")
> > > --        fsc =3D utils.find_stat_by_name(stats, "c")
> > > --        fsd =3D utils.find_stat_by_name(stats, "d")
> > > --        fse =3D utils.find_stat_by_name(stats, "e")
> > > --        fsf =3D utils.find_stat_by_name(stats, "f")
> > > --        fsg =3D utils.find_stat_by_name(stats, "g")
> > > --        fsh =3D utils.find_stat_by_name(stats, "h")
> > > --        fsi =3D utils.find_stat_by_name(stats, "i")
> > > --        self.assertEqual(fsa.ttot, 45)
> > > --        self.assertEqual(fsa.ncall, 3)
> > > --        self.assertEqual(fsa.nactualcall, 3)
> > > --        self.assertEqual(fsa.tsub, 3)
> > > --        self.assertEqual(fsa.children[fsb].ttot, fsb.ttot)
> > > --        self.assertEqual(fsa.children[fsb].tsub, fsb.tsub)
> > > --        self.assertEqual(fsb.children[fsc].ttot, fsc.ttot)
> > > --        self.assertEqual(fsb.children[fsc].tsub, fsc.tsub)
> > > --        self.assertEqual(fsc.tsub, 6)
> > > --        self.assertEqual(fsc.children[fsd].ttot, fsd.ttot)
> > > --        self.assertEqual(fsc.children[fsd].tsub, fsd.tsub)
> > > --        self.assertEqual(fsd.children[fse].ttot, fse.ttot)
> > > --        self.assertEqual(fsd.children[fse].tsub, fse.tsub)
> > > --        self.assertEqual(fse.children[fsf].ttot, fsf.ttot)
> > > --        self.assertEqual(fse.children[fsf].tsub, fsf.tsub)
> > > --        self.assertEqual(fsf.children[fsg].ttot, fsg.ttot)
> > > --        self.assertEqual(fsf.children[fsg].tsub, fsg.tsub)
> > > --        self.assertEqual(fsg.ttot, 18)
> > > --        self.assertEqual(fsg.tsub, 3)
> > > --        self.assertEqual(fsg.children[fsh].ttot, fsh.ttot)
> > > --        self.assertEqual(fsg.children[fsh].tsub, fsh.tsub)
> > > --        self.assertEqual(fsh.ttot, 15)
> > > --        self.assertEqual(fsh.tsub, 12)
> > > --        self.assertEqual(fsh.tavg, 5)
> > > --        self.assertEqual(fsh.children[fsi].ttot, fsi.ttot)
> > > --        self.assertEqual(fsh.children[fsi].tsub, fsi.tsub)
> > > --        #stats.debug_print()
> > > --
> > > --    def test_merge_multithreaded_stats(self):
> > > --        import _yappi
> > > --        timings =3D {"a_1": 2, "b_1": 1}
> > > --        _yappi._set_test_timings(timings)
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        def b():
> > > --            pass
> > > --
> > > --        yappi.start()
> > > --        t =3D threading.Thread(target=3Da)
> > > --        t.start()
> > > --        t.join()
> > > --        t =3D threading.Thread(target=3Db)
> > > --        t.start()
> > > --        t.join()
> > > --        yappi.get_func_stats().save("tests/ystats1.ys")
> > > --        yappi.clear_stats()
> > > --        _yappi._set_test_timings(timings)
> > > --        self.assertEqual(len(yappi.get_func_stats()), 0)
> > > --        self.assertEqual(len(yappi.get_thread_stats()), 1)
> > > --        t =3D threading.Thread(target=3Da)
> > > --        t.start()
> > > --        t.join()
> > > --
> > > --
> self.assertEqual(_yappi._get_start_flags()["profile_builtins"], 0)
> > > --
> self.assertEqual(_yappi._get_start_flags()["profile_multicontext"], 1)
> > > --        yappi.get_func_stats().save("tests/ystats2.ys")
> > > --
> > > --        stats =3D yappi.YFuncStats([
> > > --            "tests/ystats1.ys",
> > > --            "tests/ystats2.ys",
> > > --        ])
> > > --        fsa =3D utils.find_stat_by_name(stats, "a")
> > > --        fsb =3D utils.find_stat_by_name(stats, "b")
> > > --        self.assertEqual(fsa.ncall, 2)
> > > --        self.assertEqual(fsb.ncall, 1)
> > > --        self.assertEqual(fsa.tsub, fsa.ttot, 4)
> > > --        self.assertEqual(fsb.tsub, fsb.ttot, 1)
> > > --
> > > --    def test_merge_load_different_clock_types(self):
> > > --        yappi.start(builtins=3DTrue)
> > > --
> > > --        def a():
> > > --            b()
> > > --
> > > --        def b():
> > > --            c()
> > > --
> > > --        def c():
> > > --            pass
> > > --
> > > --        t =3D threading.Thread(target=3Da)
> > > --        t.start()
> > > --        t.join()
> > > --        yappi.get_func_stats().sort("name",
> "asc").save("tests/ystats1.ys")
> > > --        yappi.stop()
> > > --        yappi.clear_stats()
> > > --        yappi.start(builtins=3DFalse)
> > > --        t =3D threading.Thread(target=3Da)
> > > --        t.start()
> > > --        t.join()
> > > --        yappi.get_func_stats().save("tests/ystats2.ys")
> > > --        yappi.stop()
> > > --        self.assertRaises(_yappi.error, yappi.set_clock_type, "wall=
")
> > > --        yappi.clear_stats()
> > > --        yappi.set_clock_type("wall")
> > > --        yappi.start()
> > > --        t =3D threading.Thread(target=3Da)
> > > --        t.start()
> > > --        t.join()
> > > --        yappi.get_func_stats().save("tests/ystats3.ys")
> > > --        self.assertRaises(
> > > --            yappi.YappiError,
> > > --            yappi.YFuncStats().add("tests/ystats1.ys").add,
> "tests/ystats3.ys"
> > > --        )
> > > --        stats =3D yappi.YFuncStats(["tests/ystats1.ys",
> > > --                                  "tests/ystats2.ys"]).sort("name")
> > > --        fsa =3D utils.find_stat_by_name(stats, "a")
> > > --        fsb =3D utils.find_stat_by_name(stats, "b")
> > > --        fsc =3D utils.find_stat_by_name(stats, "c")
> > > --        self.assertEqual(fsa.ncall, 2)
> > > --        self.assertEqual(fsa.ncall, fsb.ncall, fsc.ncall)
> > > --
> > > --    def test_merge_aabab_aabbc(self):
> > > --        _timings =3D {
> > > --            "a_1": 15,
> > > --            "a_2": 14,
> > > --            "b_1": 12,
> > > --            "a_3": 10,
> > > --            "b_2": 9,
> > > --            "c_1": 4
> > > --        }
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        def a():
> > > --            if self._ncall =3D=3D 1:
> > > --                self._ncall +=3D 1
> > > --                a()
> > > --            elif self._ncall =3D=3D 5:
> > > --                self._ncall +=3D 1
> > > --                a()
> > > --            else:
> > > --                b()
> > > --
> > > --        def b():
> > > --            if self._ncall =3D=3D 2:
> > > --                self._ncall +=3D 1
> > > --                a()
> > > --            elif self._ncall =3D=3D 6:
> > > --                self._ncall +=3D 1
> > > --                b()
> > > --            elif self._ncall =3D=3D 7:
> > > --                c()
> > > --            else:
> > > --                return
> > > --
> > > --        def c():
> > > --            pass
> > > --
> > > --        self._ncall =3D 1
> > > --        stats =3D utils.run_and_get_func_stats(a, )
> > > --        stats.save("tests/ystats1.ys")
> > > --        yappi.clear_stats()
> > > --        _yappi._set_test_timings(_timings)
> > > --        #stats.print_all()
> > > --
> > > --        self._ncall =3D 5
> > > --        stats =3D utils.run_and_get_func_stats(a, )
> > > --        stats.save("tests/ystats2.ys")
> > > --
> > > --        #stats.print_all()
> > > --
> > > --        def a():  # same name but another function(code object)
> > > --            pass
> > > --
> > > --        yappi.start()
> > > --        a()
> > > --        stats =3D yappi.get_func_stats().add(
> > > --            ["tests/ystats1.ys", "tests/ystats2.ys"]
> > > --        )
> > > --        #stats.print_all()
> > > --        self.assertEqual(len(stats), 4)
> > > --
> > > --        fsa =3D None
> > > --        for stat in stats:
> > > --            if stat.name =3D=3D "a" and stat.ttot =3D=3D 45:
> > > --                fsa =3D stat
> > > --                break
> > > --        self.assertTrue(fsa is not None)
> > > --
> > > --        self.assertEqual(fsa.ncall, 7)
> > > --        self.assertEqual(fsa.nactualcall, 3)
> > > --        self.assertEqual(fsa.ttot, 45)
> > > --        self.assertEqual(fsa.tsub, 10)
> > > --        fsb =3D utils.find_stat_by_name(stats, "b")
> > > --        fsc =3D utils.find_stat_by_name(stats, "c")
> > > --        self.assertEqual(fsb.ncall, 6)
> > > --        self.assertEqual(fsb.nactualcall, 3)
> > > --        self.assertEqual(fsb.ttot, 36)
> > > --        self.assertEqual(fsb.tsub, 27)
> > > --        self.assertEqual(fsb.tavg, 6)
> > > --        self.assertEqual(fsc.ttot, 8)
> > > --        self.assertEqual(fsc.tsub, 8)
> > > --        self.assertEqual(fsc.tavg, 4)
> > > --        self.assertEqual(fsc.nactualcall, fsc.ncall, 2)
> > > --
> > > --
> > > --class MultithreadedScenarios(utils.YappiUnitTestCase):
> > > --
> > > --    def test_issue_32(self):
> > > --        '''
> > > --        Start yappi from different thread and we get Internal
> Error(15) as
> > > --        the current_ctx_id() called while enumerating the threads i=
n
> start()
> > > --        and as it does not swap to the enumerated ThreadState* the
> THreadState_GetDict()
> > > --        returns wrong object and thus sets an invalid id for the
> _ctx structure.
> > > --
> > > --        When this issue happens multiple Threads have same tid as
> the internal ts_ptr
> > > --        will be same for different contexts. So, let's see if that
> happens
> > > --        '''
> > > --
> > > --        def foo():
> > > --            time.sleep(0.2)
> > > --
> > > --        def bar():
> > > --            time.sleep(0.1)
> > > --
> > > --        def thread_func():
> > > --            yappi.set_clock_type("wall")
> > > --            yappi.start()
> > > --
> > > --            bar()
> > > --
> > > --        t =3D threading.Thread(target=3Dthread_func)
> > > --        t.start()
> > > --        t.join()
> > > --
> > > --        foo()
> > > --
> > > --        yappi.stop()
> > > --
> > > --        thread_ids =3D set()
> > > --        for tstat in yappi.get_thread_stats():
> > > --            self.assertTrue(tstat.tid not in thread_ids)
> > > --            thread_ids.add(tstat.tid)
> > > --
> > > --    def test_subsequent_profile(self):
> > > --        WORKER_COUNT =3D 5
> > > --
> > > --        def a():
> > > --            pass
> > > --
> > > --        def b():
> > > --            pass
> > > --
> > > --        def c():
> > > --            pass
> > > --
> > > --        _timings =3D {
> > > --            "a_1": 3,
> > > --            "b_1": 2,
> > > --            "c_1": 1,
> > > --        }
> > > --
> > > --        yappi.start()
> > > --
> > > --        def g():
> > > --            pass
> > > --
> > > --        g()
> > > --        yappi.stop()
> > > --        yappi.clear_stats()
> > > --        _yappi._set_test_timings(_timings)
> > > --        yappi.start()
> > > --
> > > --        _dummy =3D []
> > > --        for i in range(WORKER_COUNT):
> > > --            t =3D threading.Thread(target=3Da)
> > > --            t.start()
> > > --            t.join()
> > > --        for i in range(WORKER_COUNT):
> > > --            t =3D threading.Thread(target=3Db)
> > > --            t.start()
> > > --            _dummy.append(t)
> > > --            t.join()
> > > --        for i in range(WORKER_COUNT):
> > > --            t =3D threading.Thread(target=3Da)
> > > --            t.start()
> > > --            t.join()
> > > --        for i in range(WORKER_COUNT):
> > > --            t =3D threading.Thread(target=3Dc)
> > > --            t.start()
> > > --            t.join()
> > > --        yappi.stop()
> > > --        yappi.start()
> > > --
> > > --        def f():
> > > --            pass
> > > --
> > > --        f()
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        fsc =3D utils.find_stat_by_name(stats, 'c')
> > > --        self.assertEqual(fsa.ncall, 10)
> > > --        self.assertEqual(fsb.ncall, 5)
> > > --        self.assertEqual(fsc.ncall, 5)
> > > --        self.assertEqual(fsa.ttot, fsa.tsub, 30)
> > > --        self.assertEqual(fsb.ttot, fsb.tsub, 10)
> > > --        self.assertEqual(fsc.ttot, fsc.tsub, 5)
> > > --
> > > --        # MACOSx optimizes by only creating one worker thread
> > > --        self.assertTrue(len(yappi.get_thread_stats()) >=3D 2)
> > > --
> > > --    def test_basic(self):
> > > --        yappi.set_clock_type('wall')
> > > --
> > > --        def dummy():
> > > --            pass
> > > --
> > > --        def a():
> > > --            time.sleep(0.2)
> > > --
> > > --        class Worker1(threading.Thread):
> > > --
> > > --            def a(self):
> > > --                time.sleep(0.3)
> > > --
> > > --            def run(self):
> > > --                self.a()
> > > --
> > > --        yappi.start(builtins=3DFalse, profile_threads=3DTrue)
> > > --
> > > --        c =3D Worker1()
> > > --        c.start()
> > > --        c.join()
> > > --        a()
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsa1 =3D utils.find_stat_by_name(stats, 'Worker1.a')
> > > --        fsa2 =3D utils.find_stat_by_name(stats, 'a')
> > > --        self.assertTrue(fsa1 is not None)
> > > --        self.assertTrue(fsa2 is not None)
> > > --        self.assertTrue(fsa1.ttot > 0.2)
> > > --        self.assertTrue(fsa2.ttot > 0.1)
> > > --        tstats =3D yappi.get_thread_stats()
> > > --        self.assertEqual(len(tstats), 2)
> > > --        tsa =3D utils.find_stat_by_name(tstats, 'Worker1')
> > > --        tsm =3D utils.find_stat_by_name(tstats, '_MainThread')
> > > --        dummy()  # call dummy to force ctx name to be retrieved
> again.
> > > --        self.assertTrue(tsa is not None)
> > > --        # TODO: I put dummy() to fix below, remove the comments
> after a while.
> > > --        self.assertTrue( # FIX: I see this fails sometimes?
> > > --            tsm is not None,
> > > --            'Could not find "_MainThread". Found: %s' % (',
> '.join(utils.get_stat_names(tstats))))
> > > --
> > > --    def test_ctx_stats(self):
> > > --        from threading import Thread
> > > --        DUMMY_WORKER_COUNT =3D 5
> > > --        yappi.start()
> > > --
> > > --        class DummyThread(Thread):
> > > --            pass
> > > --
> > > --        def dummy():
> > > --            pass
> > > --
> > > --        def dummy_worker():
> > > --            pass
> > > --
> > > --        for i in range(DUMMY_WORKER_COUNT):
> > > --            t =3D DummyThread(target=3Ddummy_worker)
> > > --            t.start()
> > > --            t.join()
> > > --        yappi.stop()
> > > --        stats =3D yappi.get_thread_stats()
> > > --        tsa =3D utils.find_stat_by_name(stats, "DummyThread")
> > > --        self.assertTrue(tsa is not None)
> > > --        yappi.clear_stats()
> > > --        time.sleep(1.0)
> > > --        _timings =3D {
> > > --            "a_1": 6,
> > > --            "b_1": 5,
> > > --            "c_1": 3,
> > > --            "d_1": 1,
> > > --            "a_2": 4,
> > > --            "b_2": 3,
> > > --            "c_2": 2,
> > > --            "d_2": 1
> > > --        }
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        class Thread1(Thread):
> > > --            pass
> > > --
> > > --        class Thread2(Thread):
> > > --            pass
> > > --
> > > --        def a():
> > > --            b()
> > > --
> > > --        def b():
> > > --            c()
> > > --
> > > --        def c():
> > > --            d()
> > > --
> > > --        def d():
> > > --            time.sleep(0.6)
> > > --
> > > --        yappi.set_clock_type("wall")
> > > --        yappi.start()
> > > --        t1 =3D Thread1(target=3Da)
> > > --        t1.start()
> > > --        t2 =3D Thread2(target=3Da)
> > > --        t2.start()
> > > --        t1.join()
> > > --        t2.join()
> > > --        stats =3D yappi.get_thread_stats()
> > > --
> > > --        # the fist clear_stats clears the context table?
> > > --        tsa =3D utils.find_stat_by_name(stats, "DummyThread")
> > > --        self.assertTrue(tsa is None)
> > > --
> > > --        tst1 =3D utils.find_stat_by_name(stats, "Thread1")
> > > --        tst2 =3D utils.find_stat_by_name(stats, "Thread2")
> > > --        tsmain =3D utils.find_stat_by_name(stats, "_MainThread")
> > > --        dummy()  # call dummy to force ctx name to be retrieved
> again.
> > > --        self.assertTrue(len(stats) =3D=3D 3)
> > > --        self.assertTrue(tst1 is not None)
> > > --        self.assertTrue(tst2 is not None)
> > > --        # TODO: I put dummy() to fix below, remove the comments
> after a while.
> > > --        self.assertTrue( # FIX: I see this fails sometimes
> > > --            tsmain is not None,
> > > --            'Could not find "_MainThread". Found: %s' % (',
> '.join(utils.get_stat_names(stats))))
> > > --        self.assertTrue(1.0 > tst2.ttot >=3D 0.5)
> > > --        self.assertTrue(1.0 > tst1.ttot >=3D 0.5)
> > > --
> > > --        # test sorting of the ctx stats
> > > --        stats =3D stats.sort("totaltime", "desc")
> > > --        prev_stat =3D None
> > > --        for stat in stats:
> > > --            if prev_stat:
> > > --                self.assertTrue(prev_stat.ttot >=3D stat.ttot)
> > > --            prev_stat =3D stat
> > > --        stats =3D stats.sort("totaltime", "asc")
> > > --        prev_stat =3D None
> > > --        for stat in stats:
> > > --            if prev_stat:
> > > --                self.assertTrue(prev_stat.ttot <=3D stat.ttot)
> > > --            prev_stat =3D stat
> > > --        stats =3D stats.sort("schedcount", "desc")
> > > --        prev_stat =3D None
> > > --        for stat in stats:
> > > --            if prev_stat:
> > > --                self.assertTrue(prev_stat.sched_count >=3D
> stat.sched_count)
> > > --            prev_stat =3D stat
> > > --        stats =3D stats.sort("name", "desc")
> > > --        prev_stat =3D None
> > > --        for stat in stats:
> > > --            if prev_stat:
> > > --                self.assertTrue(prev_stat.name.lower() >=3D
> stat.name.lower())
> > > --            prev_stat =3D stat
> > > --        self.assertRaises(
> > > --            yappi.YappiError, stats.sort,
> "invalid_thread_sorttype_arg"
> > > --        )
> > > --        self.assertRaises(
> > > --            yappi.YappiError, stats.sort,
> "invalid_thread_sortorder_arg"
> > > --        )
> > > --
> > > --    def test_ctx_stats_cpu(self):
> > > --
> > > --        def get_thread_name():
> > > --            try:
> > > --                return threading.current_thread().name
> > > --            except AttributeError:
> > > --                return "Anonymous"
> > > --
> > > --        def burn_cpu(sec):
> > > --            t0 =3D yappi.get_clock_time()
> > > --            elapsed =3D 0
> > > --            while (elapsed < sec):
> > > --                for _ in range(1000):
> > > --                    pass
> > > --                elapsed =3D yappi.get_clock_time() - t0
> > > --
> > > --        def test():
> > > --
> > > --            ts =3D []
> > > --            for i in (0.01, 0.05, 0.1):
> > > --                t =3D threading.Thread(target=3Dburn_cpu, args=3D(i=
, ))
> > > --                t.name =3D "burn_cpu-%s" % str(i)
> > > --                t.start()
> > > --                ts.append(t)
> > > --            for t in ts:
> > > --                t.join()
> > > --
> > > --        yappi.set_clock_type("cpu")
> > > --        yappi.set_context_name_callback(get_thread_name)
> > > --
> > > --        yappi.start()
> > > --
> > > --        test()
> > > --
> > > --        yappi.stop()
> > > --
> > > --        tstats =3D yappi.get_thread_stats()
> > > --        r1 =3D '''
> > > --        burn_cpu-0.1      3      123145356058624  0.100105  8
> > > --        burn_cpu-0.05     2      123145361313792  0.050149  8
> > > --        burn_cpu-0.01     1      123145356058624  0.010127  2
> > > --        MainThread        0      4321620864       0.001632  6
> > > --        '''
> > > --        self.assert_ctx_stats_almost_equal(r1, tstats)
> > > --
> > > --    def test_producer_consumer_with_queues(self):
> > > --        # we currently just stress yappi, no functionality test is
> done here.
> > > --        yappi.start()
> > > --        if utils.is_py3x():
> > > --            from queue import Queue
> > > --        else:
> > > --            from Queue import Queue
> > > --        from threading import Thread
> > > --        WORKER_THREAD_COUNT =3D 50
> > > --        WORK_ITEM_COUNT =3D 2000
> > > --
> > > --        def worker():
> > > --            while True:
> > > --                item =3D q.get()
> > > --                # do the work with item
> > > --                q.task_done()
> > > --
> > > --        q =3D Queue()
> > > --        for i in range(WORKER_THREAD_COUNT):
> > > --            t =3D Thread(target=3Dworker)
> > > --            t.daemon =3D True
> > > --            t.start()
> > > --
> > > --        for item in range(WORK_ITEM_COUNT):
> > > --            q.put(item)
> > > --        q.join()  # block until all tasks are done
> > > --        #yappi.get_func_stats().sort("callcount").print_all()
> > > --        yappi.stop()
> > > --
> > > --    def test_temporary_lock_waiting(self):
> > > --        yappi.start()
> > > --        _lock =3D threading.Lock()
> > > --
> > > --        def worker():
> > > --            _lock.acquire()
> > > --            try:
> > > --                time.sleep(1.0)
> > > --            finally:
> > > --                _lock.release()
> > > --
> > > --        t1 =3D threading.Thread(target=3Dworker)
> > > --        t2 =3D threading.Thread(target=3Dworker)
> > > --        t1.start()
> > > --        t2.start()
> > > --        t1.join()
> > > --        t2.join()
> > > --        #yappi.get_func_stats().sort("callcount").print_all()
> > > --        yappi.stop()
> > > --
> > > --    @unittest.skipIf(os.name !=3D "posix", "requires Posix complian=
t
> OS")
> > > --    def test_signals_with_blocking_calls(self):
> > > --        import signal, os, time
> > > --
> > > --        # just to verify if signal is handled correctly and
> stats/yappi are not corrupted.
> > > --        def handler(signum, frame):
> > > --            raise Exception("Signal handler executed!")
> > > --
> > > --        yappi.start()
> > > --        signal.signal(signal.SIGALRM, handler)
> > > --        signal.alarm(1)
> > > --        self.assertRaises(Exception, time.sleep, 2)
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsh =3D utils.find_stat_by_name(stats, "handler")
> > > --        self.assertTrue(fsh is not None)
> > > --
> > > --    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires
> Python 3.2")
> > > --    def test_concurrent_futures(self):
> > > --        yappi.start()
> > > --        from concurrent.futures import ThreadPoolExecutor
> > > --        with ThreadPoolExecutor(max_workers=3D5) as executor:
> > > --            f =3D executor.submit(pow, 5, 2)
> > > --            self.assertEqual(f.result(), 25)
> > > --        time.sleep(1.0)
> > > --        yappi.stop()
> > > --
> > > --    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires
> Python 3.2")
> > > --    def test_barrier(self):
> > > --        yappi.start()
> > > --        b =3D threading.Barrier(2, timeout=3D1)
> > > --
> > > --        def worker():
> > > --            try:
> > > --                b.wait()
> > > --            except threading.BrokenBarrierError:
> > > --                pass
> > > --            except Exception:
> > > --                raise Exception("BrokenBarrierError not raised")
> > > --
> > > --        t1 =3D threading.Thread(target=3Dworker)
> > > --        t1.start()
> > > --        #b.wait()
> > > --        t1.join()
> > > --        yappi.stop()
> > > --
> > > --
> > > --class NonRecursiveFunctions(utils.YappiUnitTestCase):
> > > --
> > > --    def test_abcd(self):
> > > --        _timings =3D {"a_1": 6, "b_1": 5, "c_1": 3, "d_1": 1}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        def a():
> > > --            b()
> > > --
> > > --        def b():
> > > --            c()
> > > --
> > > --        def c():
> > > --            d()
> > > --
> > > --        def d():
> > > --            pass
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a)
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        fsc =3D utils.find_stat_by_name(stats, 'c')
> > > --        fsd =3D utils.find_stat_by_name(stats, 'd')
> > > --        cfsab =3D fsa.children[fsb]
> > > --        cfsbc =3D fsb.children[fsc]
> > > --        cfscd =3D fsc.children[fsd]
> > > --
> > > --        self.assertEqual(fsa.ttot, 6)
> > > --        self.assertEqual(fsa.tsub, 1)
> > > --        self.assertEqual(fsb.ttot, 5)
> > > --        self.assertEqual(fsb.tsub, 2)
> > > --        self.assertEqual(fsc.ttot, 3)
> > > --        self.assertEqual(fsc.tsub, 2)
> > > --        self.assertEqual(fsd.ttot, 1)
> > > --        self.assertEqual(fsd.tsub, 1)
> > > --        self.assertEqual(cfsab.ttot, 5)
> > > --        self.assertEqual(cfsab.tsub, 2)
> > > --        self.assertEqual(cfsbc.ttot, 3)
> > > --        self.assertEqual(cfsbc.tsub, 2)
> > > --        self.assertEqual(cfscd.ttot, 1)
> > > --        self.assertEqual(cfscd.tsub, 1)
> > > --
> > > --    def test_stop_in_middle(self):
> > > --        _timings =3D {"a_1": 6, "b_1": 4}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        def a():
> > > --            b()
> > > --            yappi.stop()
> > > --
> > > --        def b():
> > > --            time.sleep(0.2)
> > > --
> > > --        yappi.start()
> > > --        a()
> > > --        stats =3D yappi.get_func_stats()
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --
> > > --        self.assertEqual(fsa.ncall, 1)
> > > --        self.assertEqual(fsa.nactualcall, 0)
> > > --        self.assertEqual(fsa.ttot, 0)  # no call_leave called
> > > --        self.assertEqual(fsa.tsub, 0)  # no call_leave called
> > > --        self.assertEqual(fsb.ttot, 4)
> > > --
> > > --
> > > --class RecursiveFunctions(utils.YappiUnitTestCase):
> > > --
> > > --    def test_fibonacci(self):
> > > --
> > > --        def fib(n):
> > > --            if n > 1:
> > > --                return fib(n - 1) + fib(n - 2)
> > > --            else:
> > > --                return n
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(fib, 22)
> > > --        fs =3D utils.find_stat_by_name(stats, 'fib')
> > > --        self.assertEqual(fs.ncall, 57313)
> > > --        self.assertEqual(fs.ttot, fs.tsub)
> > > --
> > > --    def test_abcadc(self):
> > > --        _timings =3D {
> > > --            "a_1": 20,
> > > --            "b_1": 19,
> > > --            "c_1": 17,
> > > --            "a_2": 13,
> > > --            "d_1": 12,
> > > --            "c_2": 10,
> > > --            "a_3": 5
> > > --        }
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        def a(n):
> > > --            if n =3D=3D 3:
> > > --                return
> > > --            if n =3D=3D 1 + 1:
> > > --                d(n)
> > > --            else:
> > > --                b(n)
> > > --
> > > --        def b(n):
> > > --            c(n)
> > > --
> > > --        def c(n):
> > > --            a(n + 1)
> > > --
> > > --        def d(n):
> > > --            c(n)
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a, 1)
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        fsc =3D utils.find_stat_by_name(stats, 'c')
> > > --        fsd =3D utils.find_stat_by_name(stats, 'd')
> > > --        self.assertEqual(fsa.ncall, 3)
> > > --        self.assertEqual(fsa.nactualcall, 1)
> > > --        self.assertEqual(fsa.ttot, 20)
> > > --        self.assertEqual(fsa.tsub, 7)
> > > --        self.assertEqual(fsb.ttot, 19)
> > > --        self.assertEqual(fsb.tsub, 2)
> > > --        self.assertEqual(fsc.ttot, 17)
> > > --        self.assertEqual(fsc.tsub, 9)
> > > --        self.assertEqual(fsd.ttot, 12)
> > > --        self.assertEqual(fsd.tsub, 2)
> > > --        cfsca =3D fsc.children[fsa]
> > > --        self.assertEqual(cfsca.nactualcall, 0)
> > > --        self.assertEqual(cfsca.ncall, 2)
> > > --        self.assertEqual(cfsca.ttot, 13)
> > > --        self.assertEqual(cfsca.tsub, 6)
> > > --
> > > --    def test_aaaa(self):
> > > --        _timings =3D {"d_1": 9, "d_2": 7, "d_3": 3, "d_4": 2}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        def d(n):
> > > --            if n =3D=3D 3:
> > > --                return
> > > --            d(n + 1)
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(d, 0)
> > > --        fsd =3D utils.find_stat_by_name(stats, 'd')
> > > --        self.assertEqual(fsd.ncall, 4)
> > > --        self.assertEqual(fsd.nactualcall, 1)
> > > --        self.assertEqual(fsd.ttot, 9)
> > > --        self.assertEqual(fsd.tsub, 9)
> > > --        cfsdd =3D fsd.children[fsd]
> > > --        self.assertEqual(cfsdd.ttot, 7)
> > > --        self.assertEqual(cfsdd.tsub, 7)
> > > --        self.assertEqual(cfsdd.ncall, 3)
> > > --        self.assertEqual(cfsdd.nactualcall, 0)
> > > --
> > > --    def test_abcabc(self):
> > > --        _timings =3D {
> > > --            "a_1": 20,
> > > --            "b_1": 19,
> > > --            "c_1": 17,
> > > --            "a_2": 13,
> > > --            "b_2": 11,
> > > --            "c_2": 9,
> > > --            "a_3": 6
> > > --        }
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        def a(n):
> > > --            if n =3D=3D 3:
> > > --                return
> > > --            else:
> > > --                b(n)
> > > --
> > > --        def b(n):
> > > --            c(n)
> > > --
> > > --        def c(n):
> > > --            a(n + 1)
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a, 1)
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        fsc =3D utils.find_stat_by_name(stats, 'c')
> > > --        self.assertEqual(fsa.ncall, 3)
> > > --        self.assertEqual(fsa.nactualcall, 1)
> > > --        self.assertEqual(fsa.ttot, 20)
> > > --        self.assertEqual(fsa.tsub, 9)
> > > --        self.assertEqual(fsb.ttot, 19)
> > > --        self.assertEqual(fsb.tsub, 4)
> > > --        self.assertEqual(fsc.ttot, 17)
> > > --        self.assertEqual(fsc.tsub, 7)
> > > --        cfsab =3D fsa.children[fsb]
> > > --        cfsbc =3D fsb.children[fsc]
> > > --        cfsca =3D fsc.children[fsa]
> > > --        self.assertEqual(cfsab.ttot, 19)
> > > --        self.assertEqual(cfsab.tsub, 4)
> > > --        self.assertEqual(cfsbc.ttot, 17)
> > > --        self.assertEqual(cfsbc.tsub, 7)
> > > --        self.assertEqual(cfsca.ttot, 13)
> > > --        self.assertEqual(cfsca.tsub, 8)
> > > --
> > > --    def test_abcbca(self):
> > > --        _timings =3D {"a_1": 10, "b_1": 9, "c_1": 7, "b_2": 4, "c_2=
":
> 2, "a_2": 1}
> > > --        _yappi._set_test_timings(_timings)
> > > --        self._ncall =3D 1
> > > --
> > > --        def a():
> > > --            if self._ncall =3D=3D 1:
> > > --                b()
> > > --            else:
> > > --                return
> > > --
> > > --        def b():
> > > --            c()
> > > --
> > > --        def c():
> > > --            if self._ncall =3D=3D 1:
> > > --                self._ncall +=3D 1
> > > --                b()
> > > --            else:
> > > --                a()
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a)
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        fsc =3D utils.find_stat_by_name(stats, 'c')
> > > --        cfsab =3D fsa.children[fsb]
> > > --        cfsbc =3D fsb.children[fsc]
> > > --        cfsca =3D fsc.children[fsa]
> > > --        self.assertEqual(fsa.ttot, 10)
> > > --        self.assertEqual(fsa.tsub, 2)
> > > --        self.assertEqual(fsb.ttot, 9)
> > > --        self.assertEqual(fsb.tsub, 4)
> > > --        self.assertEqual(fsc.ttot, 7)
> > > --        self.assertEqual(fsc.tsub, 4)
> > > --        self.assertEqual(cfsab.ttot, 9)
> > > --        self.assertEqual(cfsab.tsub, 2)
> > > --        self.assertEqual(cfsbc.ttot, 7)
> > > --        self.assertEqual(cfsbc.tsub, 4)
> > > --        self.assertEqual(cfsca.ttot, 1)
> > > --        self.assertEqual(cfsca.tsub, 1)
> > > --        self.assertEqual(cfsca.ncall, 1)
> > > --        self.assertEqual(cfsca.nactualcall, 0)
> > > --
> > > --    def test_aabccb(self):
> > > --        _timings =3D {
> > > --            "a_1": 13,
> > > --            "a_2": 11,
> > > --            "b_1": 9,
> > > --            "c_1": 5,
> > > --            "c_2": 3,
> > > --            "b_2": 1
> > > --        }
> > > --        _yappi._set_test_timings(_timings)
> > > --        self._ncall =3D 1
> > > --
> > > --        def a():
> > > --            if self._ncall =3D=3D 1:
> > > --                self._ncall +=3D 1
> > > --                a()
> > > --            else:
> > > --                b()
> > > --
> > > --        def b():
> > > --            if self._ncall =3D=3D 3:
> > > --                return
> > > --            else:
> > > --                c()
> > > --
> > > --        def c():
> > > --            if self._ncall =3D=3D 2:
> > > --                self._ncall +=3D 1
> > > --                c()
> > > --            else:
> > > --                b()
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a)
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        fsc =3D utils.find_stat_by_name(stats, 'c')
> > > --        cfsaa =3D fsa.children[fsa.index]
> > > --        cfsab =3D fsa.children[fsb]
> > > --        cfsbc =3D fsb.children[fsc.full_name]
> > > --        cfscc =3D fsc.children[fsc]
> > > --        cfscb =3D fsc.children[fsb]
> > > --        self.assertEqual(fsb.ttot, 9)
> > > --        self.assertEqual(fsb.tsub, 5)
> > > --        self.assertEqual(cfsbc.ttot, 5)
> > > --        self.assertEqual(cfsbc.tsub, 2)
> > > --        self.assertEqual(fsa.ttot, 13)
> > > --        self.assertEqual(fsa.tsub, 4)
> > > --        self.assertEqual(cfsab.ttot, 9)
> > > --        self.assertEqual(cfsab.tsub, 4)
> > > --        self.assertEqual(cfsaa.ttot, 11)
> > > --        self.assertEqual(cfsaa.tsub, 2)
> > > --        self.assertEqual(fsc.ttot, 5)
> > > --        self.assertEqual(fsc.tsub, 4)
> > > --
> > > --    def test_abaa(self):
> > > --        _timings =3D {"a_1": 13, "b_1": 10, "a_2": 9, "a_3": 5}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        self._ncall =3D 1
> > > --
> > > --        def a():
> > > --            if self._ncall =3D=3D 1:
> > > --                b()
> > > --            elif self._ncall =3D=3D 2:
> > > --                self._ncall +=3D 1
> > > --                a()
> > > --            else:
> > > --                return
> > > --
> > > --        def b():
> > > --            self._ncall +=3D 1
> > > --            a()
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a)
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        cfsaa =3D fsa.children[fsa]
> > > --        cfsba =3D fsb.children[fsa]
> > > --        self.assertEqual(fsb.ttot, 10)
> > > --        self.assertEqual(fsb.tsub, 1)
> > > --        self.assertEqual(fsa.ttot, 13)
> > > --        self.assertEqual(fsa.tsub, 12)
> > > --        self.assertEqual(cfsaa.ttot, 5)
> > > --        self.assertEqual(cfsaa.tsub, 5)
> > > --        self.assertEqual(cfsba.ttot, 9)
> > > --        self.assertEqual(cfsba.tsub, 4)
> > > --
> > > --    def test_aabb(self):
> > > --        _timings =3D {"a_1": 13, "a_2": 10, "b_1": 9, "b_2": 5}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        self._ncall =3D 1
> > > --
> > > --        def a():
> > > --            if self._ncall =3D=3D 1:
> > > --                self._ncall +=3D 1
> > > --                a()
> > > --            elif self._ncall =3D=3D 2:
> > > --                b()
> > > --            else:
> > > --                return
> > > --
> > > --        def b():
> > > --            if self._ncall =3D=3D 2:
> > > --                self._ncall +=3D 1
> > > --                b()
> > > --            else:
> > > --                return
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a)
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        cfsaa =3D fsa.children[fsa]
> > > --        cfsab =3D fsa.children[fsb]
> > > --        cfsbb =3D fsb.children[fsb]
> > > --        self.assertEqual(fsa.ttot, 13)
> > > --        self.assertEqual(fsa.tsub, 4)
> > > --        self.assertEqual(fsb.ttot, 9)
> > > --        self.assertEqual(fsb.tsub, 9)
> > > --        self.assertEqual(cfsaa.ttot, 10)
> > > --        self.assertEqual(cfsaa.tsub, 1)
> > > --        self.assertEqual(cfsab.ttot, 9)
> > > --        self.assertEqual(cfsab.tsub, 4)
> > > --        self.assertEqual(cfsbb.ttot, 5)
> > > --        self.assertEqual(cfsbb.tsub, 5)
> > > --
> > > --    def test_abbb(self):
> > > --        _timings =3D {"a_1": 13, "b_1": 10, "b_2": 6, "b_3": 1}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        self._ncall =3D 1
> > > --
> > > --        def a():
> > > --            if self._ncall =3D=3D 1:
> > > --                b()
> > > --
> > > --        def b():
> > > --            if self._ncall =3D=3D 3:
> > > --                return
> > > --            self._ncall +=3D 1
> > > --            b()
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a)
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        cfsab =3D fsa.children[fsb]
> > > --        cfsbb =3D fsb.children[fsb]
> > > --        self.assertEqual(fsa.ttot, 13)
> > > --        self.assertEqual(fsa.tsub, 3)
> > > --        self.assertEqual(fsb.ttot, 10)
> > > --        self.assertEqual(fsb.tsub, 10)
> > > --        self.assertEqual(fsb.ncall, 3)
> > > --        self.assertEqual(fsb.nactualcall, 1)
> > > --        self.assertEqual(cfsab.ttot, 10)
> > > --        self.assertEqual(cfsab.tsub, 4)
> > > --        self.assertEqual(cfsbb.ttot, 6)
> > > --        self.assertEqual(cfsbb.tsub, 6)
> > > --        self.assertEqual(cfsbb.nactualcall, 0)
> > > --        self.assertEqual(cfsbb.ncall, 2)
> > > --
> > > --    def test_aaab(self):
> > > --        _timings =3D {"a_1": 13, "a_2": 10, "a_3": 6, "b_1": 1}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        self._ncall =3D 1
> > > --
> > > --        def a():
> > > --            if self._ncall =3D=3D 3:
> > > --                b()
> > > --                return
> > > --            self._ncall +=3D 1
> > > --            a()
> > > --
> > > --        def b():
> > > --            return
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a)
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        cfsaa =3D fsa.children[fsa]
> > > --        cfsab =3D fsa.children[fsb]
> > > --        self.assertEqual(fsa.ttot, 13)
> > > --        self.assertEqual(fsa.tsub, 12)
> > > --        self.assertEqual(fsb.ttot, 1)
> > > --        self.assertEqual(fsb.tsub, 1)
> > > --        self.assertEqual(cfsaa.ttot, 10)
> > > --        self.assertEqual(cfsaa.tsub, 9)
> > > --        self.assertEqual(cfsab.ttot, 1)
> > > --        self.assertEqual(cfsab.tsub, 1)
> > > --
> > > --    def test_abab(self):
> > > --        _timings =3D {"a_1": 13, "b_1": 10, "a_2": 6, "b_2": 1}
> > > --        _yappi._set_test_timings(_timings)
> > > --
> > > --        self._ncall =3D 1
> > > --
> > > --        def a():
> > > --            b()
> > > --
> > > --        def b():
> > > --            if self._ncall =3D=3D 2:
> > > --                return
> > > --            self._ncall +=3D 1
> > > --            a()
> > > --
> > > --        stats =3D utils.run_and_get_func_stats(a)
> > > --        fsa =3D utils.find_stat_by_name(stats, 'a')
> > > --        fsb =3D utils.find_stat_by_name(stats, 'b')
> > > --        cfsab =3D fsa.children[fsb]
> > > --        cfsba =3D fsb.children[fsa]
> > > --        self.assertEqual(fsa.ttot, 13)
> > > --        self.assertEqual(fsa.tsub, 8)
> > > --        self.assertEqual(fsb.ttot, 10)
> > > --        self.assertEqual(fsb.tsub, 5)
> > > --        self.assertEqual(cfsab.ttot, 10)
> > > --        self.assertEqual(cfsab.tsub, 5)
> > > --        self.assertEqual(cfsab.ncall, 2)
> > > --        self.assertEqual(cfsab.nactualcall, 1)
> > > --        self.assertEqual(cfsba.ttot, 6)
> > > --        self.assertEqual(cfsba.tsub, 5)
> > > --
> > > --
> > > --if __name__ =3D=3D '__main__':
> > > --    #     import sys;sys.argv =3D ['', 'BasicUsage.test_run_as_scri=
pt']
> > > --    #     import sys;sys.argv =3D ['',
> 'MultithreadedScenarios.test_subsequent_profile']
> > > --    unittest.main()
> > > -+import os
> > > -+import sys
> > > -+import time
> > > -+import threading
> > > -+import unittest
> > > -+import yappi
> > > -+import _yappi
> > > -+import tests.utils as utils
> > > -+import multiprocessing  # added to fix
> http://bugs.python.org/issue15881 for > Py2.6
> > > -+import subprocess
> > > -+
> > > -+_counter =3D 0
> > > -+
> > > -+
> > > -+class BasicUsage(utils.YappiUnitTestCase):
> > > -+
> > > -+    def test_callback_function_int_return_overflow(self):
> > > -+        # this test is just here to check if any errors are
> generated, as the err
> > > -+        # is printed in C side, I did not include it here. THere ar=
e
> ways to test
> > > -+        # this deterministically, I did not bother
> > > -+        import ctypes
> > > -+
> > > -+        def _unsigned_overflow_margin():
> > > -+            return 2**(ctypes.sizeof(ctypes.c_void_p) * 8) - 1
> > > -+
> > > -+        def foo():
> > > -+            pass
> > > -+
> > > -+        #with utils.captured_output() as (out, err):
> > > -+        yappi.set_context_id_callback(_unsigned_overflow_margin)
> > > -+        yappi.set_tag_callback(_unsigned_overflow_margin)
> > > -+        yappi.start()
> > > -+        foo()
> > > -+
> > > -+    def test_issue60(self):
> > > -+
> > > -+        def foo():
> > > -+            buf =3D bytearray()
> > > -+            buf +=3D b't' * 200
> > > -+            view =3D memoryview(buf)[10:]
> > > -+            view =3D view.tobytes()
> > > -+            del buf[:10]  # this throws exception
> > > -+            return view
> > > -+
> > > -+        yappi.start(builtins=3DTrue)
> > > -+        foo()
> > > -+        self.assertTrue(
> > > -+            len(
> > > -+                yappi.get_func_stats(
> > > -+                    filter_callback=3Dlambda x: yappi.
> > > -+                    func_matches(x, [memoryview.tobytes])
> > > -+                )
> > > -+            ) > 0
> > > -+        )
> > > -+        yappi.stop()
> > > -+
> > > -+    def test_issue54(self):
> > > -+
> > > -+        def _tag_cbk():
> > > -+            global _counter
> > > -+            _counter +=3D 1
> > > -+            return _counter
> > > -+
> > > -+        def a():
> > > -+            pass
> > > -+
> > > -+        def b():
> > > -+            pass
> > > -+
> > > -+        yappi.set_tag_callback(_tag_cbk)
> > > -+        yappi.start()
> > > -+        a()
> > > -+        a()
> > > -+        a()
> > > -+        yappi.stop()
> > > -+        stats =3D yappi.get_func_stats()
> > > -+        self.assertEqual(stats.pop().ncall, 3)  # aggregated if no
> tag is given
> > > -+        stats =3D yappi.get_func_stats(tag=3D1)
> > > -+
> > > -+        for i in range(1, 3):
> > > -+            stats =3D yappi.get_func_stats(tag=3Di)
> > > -+            stats =3D yappi.get_func_stats(
> > > -+

--000000000000882096060d32f2ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Dec 22, 2023 at 8:12=E2=80=AFAM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">I didn&#39;t try that. And I have to ask:=
 checking ptests by hand means<br>
we&#39;re not running those ptests regularly in CI, and if so, then why<br>
bother? It can regress at any point through seemingly unrelated<br>
changes, and maybe already has even before this update.<br>
<br>
If python 3.12 update has a chance of ever happening, ptests need to<br>
be checked by someone else, as there are still some 25 build failures<br>
I need to look at. Otherwise doing all the runtime testing and fixing<br>
across the whole python stack simply exceeds my capacity.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for start=
ing the process, Alex. I=E2=80=99ll work in this one.</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
><br>
Alex<br>
<br>
On Fri, 22 Dec 2023 at 16:54, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Dec 22, 2023 at 7:11=E2=80=AFAM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Drop patches:<br>
&gt; &gt; 0002-add-3.11-to-the-setup.patch - issue resolved upstream<br>
&gt; &gt; 0001-Fix-imports-for-ptests.patch - unclear what the problem is, =
too difficult to rebase.<br>
&gt;<br>
&gt; Does<br>
&gt; bitbake meta-python-image-ptest-python3-yappi<br>
&gt;<br>
&gt; show regression ?<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linut=
ronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../0001-Fix-imports-for-ptests.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 3895 -----------------<br>
&gt; &gt;=C2=A0 .../0002-add-3.11-to-the-setup.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A026 -<br>
&gt; &gt;=C2=A0 ...-<a href=3D"http://yappi_1.4.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">yappi_1.4.0.bb</a> =3D&gt; <a href=3D"http://python3-yappi_=
1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.6.0.bb</a>} =
|=C2=A0 =C2=A0 8 +-<br>
&gt; &gt;=C2=A0 3 files changed, 2 insertions(+), 3927 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/pyth=
on3-yappi/0001-Fix-imports-for-ptests.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/pyth=
on3-yappi/0002-add-3.11-to-the-setup.patch<br>
&gt; &gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http=
://python3-yappi_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yap=
pi_1.4.0.bb</a> =3D&gt; <a href=3D"http://python3-yappi_1.6.0.bb" rel=3D"no=
referrer" target=3D"_blank">python3-yappi_1.6.0.bb</a>} (74%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/python3-yappi/00=
01-Fix-imports-for-ptests.patch b/meta-python/recipes-devtools/python/pytho=
n3-yappi/0001-Fix-imports-for-ptests.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 476db4b7d..000000000<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-=
imports-for-ptests.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,3895 +0,0 @@<br>
&gt; &gt; -From 0dedc1c573ddc4e87475eb03c64555cd54a72e92 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windri=
ver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt; &gt; -Date: Mon, 7 Jun 2021 09:40:20 -0400<br>
&gt; &gt; -Subject: [PATCH] Fix imports for tests<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gambl=
in@windriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br=
>
&gt; &gt; ----<br>
&gt; &gt; -Upstream-Status: Pending<br>
&gt; &gt; -<br>
&gt; &gt; - tests/test_asyncio.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
&gt; &gt; - tests/test_asyncio_context_vars.py | 2 +-<br>
&gt; &gt; - tests/test_functionality.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
&gt; &gt; - tests/test_hooks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt; - tests/test_tags.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; &gt; - 5 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; ---- a/tests/test_asyncio.py<br>
&gt; &gt; -+++ b/tests/test_asyncio.py<br>
&gt; &gt; -@@ -2,7 +2,7 @@ import unittest<br>
&gt; &gt; - import yappi<br>
&gt; &gt; - import asyncio<br>
&gt; &gt; - import threading<br>
&gt; &gt; --from utils import YappiUnitTestCase, find_stat_by_name, burn_cp=
u, burn_io<br>
&gt; &gt; -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_c=
pu, burn_io<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; - async def async_sleep(sec):<br>
&gt; &gt; ---- a/tests/test_asyncio_context_vars.py<br>
&gt; &gt; -+++ b/tests/test_asyncio_context_vars.py<br>
&gt; &gt; -@@ -5,7 +5,7 @@ import contextvars<br>
&gt; &gt; - import functools<br>
&gt; &gt; - import time<br>
&gt; &gt; - import os<br>
&gt; &gt; --import utils<br>
&gt; &gt; -+import tests.utils as utils<br>
&gt; &gt; - import yappi<br>
&gt; &gt; -<br>
&gt; &gt; - async_context_id =3D contextvars.ContextVar(&#39;async_context_=
id&#39;)<br>
&gt; &gt; ---- a/tests/test_functionality.py<br>
&gt; &gt; -+++ b/tests/test_functionality.py<br>
&gt; &gt; -@@ -1,1916 +1,1916 @@<br>
&gt; &gt; --import os<br>
&gt; &gt; --import sys<br>
&gt; &gt; --import time<br>
&gt; &gt; --import threading<br>
&gt; &gt; --import unittest<br>
&gt; &gt; --import yappi<br>
&gt; &gt; --import _yappi<br>
&gt; &gt; --import utils<br>
&gt; &gt; --import multiprocessing=C2=A0 # added to fix <a href=3D"http://b=
ugs.python.org/issue15881" rel=3D"noreferrer" target=3D"_blank">http://bugs=
.python.org/issue15881</a> for &gt; Py2.6<br>
&gt; &gt; --import subprocess<br>
&gt; &gt; --<br>
&gt; &gt; --_counter =3D 0<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; --class BasicUsage(utils.YappiUnitTestCase):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_callback_function_int_return_overflow(se=
lf):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # this test is just here to check i=
f any errors are generated, as the err<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # is printed in C side, I did not i=
nclude it here. THere are ways to test<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # this deterministically, I did not=
 bother<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 import ctypes<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _unsigned_overflow_margin():<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2**(ctypes.siz=
eof(ctypes.c_void_p) * 8) - 1<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def foo():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #with utils.captured_output() as (o=
ut, err):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_context_id_callback(_unsi=
gned_overflow_margin)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_tag_callback(_unsigned_ov=
erflow_margin)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 foo()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_issue60(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def foo():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D bytearray()<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf +=3D b&#39;t&#39;=
 * 200<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 view =3D memoryview(b=
uf)[10:]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 view =3D view.tobytes=
()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del buf[:10]=C2=A0 # =
this throws exception<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return view<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start(builtins=3DTrue)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 foo()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.g=
et_func_stats(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 filter_callback=3Dlambda x: yappi.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 func_matches(x, [memoryview.tobytes])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) &gt; 0<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_issue54(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _tag_cbk():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 global _counter<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _counter +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return _counter<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_tag_callback(_tag_cbk)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(stats.pop().ncall,=
 3)=C2=A0 # aggregated if no tag is given<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats(tag=
=3D1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(1, 3):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_f=
unc_stats(tag=3Di)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_f=
unc_stats(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tag=3Di=
, filter_callback=3Dlambda x: yappi.func_matches(x, [a])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stat =3D stats.pop()<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(stat=
.ncall, 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_tag_callback(None)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(stats), 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stat =3D stats.pop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(stat.ncall, 2)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_filter(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _TCOUNT =3D 5<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts =3D []<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(_TCOUNT):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Threa=
d(target=3Dc)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.append(t)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in ts:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx_ids =3D []<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for tstat in yappi.get_thread_stats=
():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://=
tstat.name" rel=3D"noreferrer" target=3D"_blank">tstat.name</a> =3D=3D &#39=
;_MainThread&#39;:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 main_ct=
x_id =3D <a href=3D"http://tstat.id" rel=3D"noreferrer" target=3D"_blank">t=
stat.id</a><br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx_ids=
.append(<a href=3D"http://tstat.id" rel=3D"noreferrer" target=3D"_blank">ts=
tat.id</a>)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fstats =3D yappi.get_func_stats(fil=
ter=3D{&quot;ctx_id&quot;: 9})<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fstats.empty())<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fstats =3D yappi.get_func_stats(<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filter=3D{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c=
tx_id&quot;: main_ctx_id,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;n=
ame&quot;: &quot;c&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )=C2=A0 # main thread<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fstats.empty())<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in ctx_ids:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fstats =3D yappi.get_=
func_stats(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filter=
=3D{<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;ctx_id&quot;: i,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;name&quot;: &quot;a&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;ncall&quot;: 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsta=
ts.pop().ncall, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fstats =3D yappi.get_=
func_stats(filter=3D{&quot;ctx_id&quot;: i, &quot;name&quot;: &quot;b&quot;=
})<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsta=
ts.pop().ncall, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fstats =3D yappi.get_=
func_stats(filter=3D{&quot;ctx_id&quot;: i, &quot;name&quot;: &quot;c&quot;=
})<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsta=
ts.pop().ncall, 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start(builtins=3DTrue)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(0.1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fstats =3D yappi.get_func_stats(fil=
ter=3D{&quot;module&quot;: &quot;time&quot;})<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(fstats), 1)<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # invalid filters`<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Exception, yappi.get_=
func_stats, filter=3D{&#39;tag&#39;: &quot;sss&quot;}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Exception, yappi.get_=
func_stats, filter=3D{&#39;ctx_id&#39;: &quot;None&quot;}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_filter_callback(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(0.1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def d():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&quot;wall&quo=
t;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start(builtins=3DTrue)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 c()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 d()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filter_callback=3Dlam=
bda x: yappi.func_matches(x, [a, b])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #stats.print_all()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1 =3D &#39;&#39;&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/test_functionality.py:98 a=C2=
=A0 =C2=A0 =C2=A0 2=C2=A0 =C2=A0 =C2=A0 0.000000=C2=A0 0.200350=C2=A0 0.100=
175<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/test_functionality.py:101 b=
=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 0.000000=C2=A0 0.120000=C2=A0 0.1=
00197<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assert_traces_almost_equal(r1,=
 stats)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(stats), 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filter_callback=3Dlam=
bda x: yappi.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module_matches(x, [sy=
s.modules[__name__]])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1 =3D &#39;&#39;&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/test_functionality.py:98 a=C2=
=A0 =C2=A0 =C2=A0 2=C2=A0 =C2=A0 =C2=A0 0.000000=C2=A0 0.230130=C2=A0 0.115=
065<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/test_functionality.py:101 b=
=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 0.000000=C2=A0 0.120000=C2=A0 0.1=
09011<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/test_functionality.py:104 c=
=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 0.000000=C2=A0 0.000002=C2=A0 0.0=
00002<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tests/test_functionality.py:107 d=
=C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=A0 0.000000=C2=A0 0.000001=C2=A0 0.0=
00001<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assert_traces_almost_equal(r1,=
 stats)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(stats), 4)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filter_callback=3Dlam=
bda x: yappi.func_matches(x, [time.sleep])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(stats), 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1 =3D &#39;&#39;&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2=
=C2=A0 =C2=A0 =C2=A0 0.206804=C2=A0 0.220000=C2=A0 0.103402<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assert_traces_almost_equal(r1,=
 stats)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_print_formatting(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 func_cols =3D {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1: (&quot;name&quot;,=
 48),<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0: (&quot;ncall&quot;=
, 5),<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2: (&quot;tsub&quot;,=
 8),<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 thread_cols =3D {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1: (&quot;name&quot;,=
 48),<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0: (&quot;ttot&quot;,=
 8),<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs =3D yappi.get_func_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs =3D fs[1].children<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ts =3D yappi.get_thread_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #fs.print_all(out=3Dsys.stderr, col=
umns=3D{1:(&quot;name&quot;, 70), })<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #cs.print_all(out=3Dsys.stderr, col=
umns=3Dfunc_cols)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #ts.print_all(out=3Dsys.stderr, col=
umns=3Dthread_cols)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #cs.print_all(out=3Dsys.stderr, col=
umns=3D{})<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.YappiError, fs.=
print_all, columns=3D{1: (&quot;namee&quot;, 9)}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.YappiError, cs.=
print_all, columns=3D{1: (&quot;dd&quot;, 0)}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.YappiError, ts.=
print_all, columns=3D{1: (&quot;tidd&quot;, 0)}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_get_clock(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&#39;cpu&#39;)=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(&#39;cpu&#39;, yap=
pi.get_clock_type())<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock_info =3D yappi.get_clock_info=
()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(&#39;api&#39; in cl=
ock_info)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(&#39;resolution&#39=
; in clock_info)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&#39;wall&#39;=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(&#39;wall&#39;, ya=
ppi.get_clock_type())<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t0 =3D yappi.get_clock_time()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(0.1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 duration =3D yappi.get_clock_time()=
 - t0<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(0.05 &lt; duration =
&lt; 0.3)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_profile_decorator(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def aggregate(func, stats):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D &quot;tests=
/%s.profile&quot; % (func.__name__)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.a=
dd(fname)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(fname)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&quot=
;messing around&quot;)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 @yappi.profile(return_callback=3Dag=
gregate)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a(x, y):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if x + y =3D=3D 25:<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise E=
xception(&quot;&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return x + y<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t=
ests/a.profile&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )=C2=A0 # remove the =
one from prev test, if available<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # global profile is on to mess thin=
gs up<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # assert functionality and call fun=
ction at same time<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(a(1,=
 2), 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(a(2,=
 5), 7)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a(4, 21)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats().ad=
d(&quot;tests/a.profile&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(stats), 1)=C2=
=A0 # b() should be cleared out.<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 @yappi.profile(return_callback=3Dag=
gregate)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def count_down_rec(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n =3D=3D 0:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count_down_rec(n - 1)=
<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;t=
ests/count_down_rec.profile&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )=C2=A0 # remove the =
one from prev test, if available<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count_down_rec(4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 count_down_rec(3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.YFuncStats(&quot;te=
sts/count_down_rec.profile&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsrec =3D utils.find_stat_by_name(s=
tats, &#39;count_down_rec&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsrec.ncall, 9)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsrec.nactualcall,=
 2)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_strip_dirs(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a, )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.strip_dirs()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &quot;a&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.module, os.pat=
h.basename(fsa.module))<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 @unittest.skipIf(<a href=3D"http://os.name" rel=
=3D"noreferrer" target=3D"_blank">os.name</a> =3D=3D &quot;nt&quot;, &quot;=
do not run on Windows&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_run_as_script(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 import re<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D subprocess.Popen(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;yappi&#39;, os.=
path.join(&#39;./tests&#39;, &#39;run_as_script.py&#39;)],<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout=3Dsubprocess.P=
IPE<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 out, err =3D p.communicate()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(p.returncode, 0)<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 func_stats, thread_stats =3D re.spl=
it(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b&#39;name\\s+id\\s+t=
id\\s+ttot\\s+scnt\\s*\n&#39;, out<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(b&#39;FancyThread&#=
39; in thread_stats)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_yappi_overhead(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOOP_COUNT =3D 100000<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(LOOP_C=
OUNT):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t0 =3D time.time()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 time_with_yappi =3D time.time() - t=
0<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t0 =3D time.time()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 time_without_yappi =3D time.time() =
- t0<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if time_without_yappi =3D=3D 0:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time_without_yappi =
=3D 0.000001<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # in latest v0.82, I calculated thi=
s as close to &quot;7.0&quot; in my machine.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # however, %83 of this overhead is =
coming from tickcount(). The other %17<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # seems to have been evenly distrib=
uted to the internal bookkeeping<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # structures/algorithms which seems=
 acceptable. Note that our test only<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # tests one function being profiled=
 at-a-time in a short interval.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # profiling high number of function=
s in a small time<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # is a different beast, (which is p=
retty unlikely in most applications)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # So as a conclusion: I cannot see =
any optimization window for Yappi that<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # is worth implementing as we will =
only optimize %17 of the time.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.stderr.write(&quot;\r\nYappi pu=
ts %0.1f times overhead to the profiled application in average.\r\n&quot; %=
 \<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (time_with_yappi / ti=
me_without_yappi))<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_clear_stats_while_running(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_generator(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _gen(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (n &gt; 0):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield n=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n -=3D =
1<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for x in _gen(5):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.convert2pstats(=
yappi.get_func_stats()) is not None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_slice_child_stats_and_strip_dirs(self):<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(100000=
00):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start(builtins=3DTrue)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa.children[0:1] i=
s not None)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_afullname =3D fsa.full_name<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_bchildfullname =3D fsa.childre=
n[fsb].full_name<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.strip_dirs()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(len(prev_afullname)=
 &gt; len(fsa.full_name))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len(prev_bchildfullna=
me) &gt; len(fsa.children[fsb].full_name)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_children_stat_functions(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 5, &=
quot;b_1&quot;: 3, &quot;c_1&quot;: 1}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 b()=C2=A0 # non-child call<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 c()=C2=A0 # non-child call<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 childs_of_a =3D fsa.children.get().=
sort(&quot;tavg&quot;, &quot;desc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_item =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in childs_of_a:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_item:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(prev_item.tavg &gt; item.tavg)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_item =3D item<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 childs_of_a.sort(&quot;name&quot;, =
&quot;desc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_item =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in childs_of_a:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_item:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(<a href=3D"http://prev_item.name" rel=3D"noreferrer" target=3D"_bl=
ank">prev_item.name</a> &gt; <a href=3D"http://item.name" rel=3D"noreferrer=
" target=3D"_blank">item.name</a>)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_item =3D item<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 childs_of_a.clear()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(childs_of_a.empty()=
)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_no_stats_different_clock_type_load(self)=
:<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.get_func_stats().save(&quot;t=
ests/ystats1.ys&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&quot;WALL&quo=
t;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats().ad=
d(&quot;tests/ystats1.ys&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa is not None)<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_subsequent_profile(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 1, &=
quot;b_1&quot;: 1}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa is not None)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsb is not None)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_lambda(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D lambda: time.sleep(0.3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&quot;wall&quo=
t;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 f()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;&lt;lambda&gt;&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa.ttot &gt; 0.1)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_module_stress(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(yappi.is_running()=
, False)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(_yappi.error, yap=
pi.set_clock_type, &quot;wall&quot;)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&quot;cpu&quot=
;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(yappi.YappiError,=
 yappi.set_clock_type, &quot;dummy&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(yappi.is_running()=
, False)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_stat_sorting(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 13, =
&quot;b_1&quot;: 10, &quot;a_2&quot;: 6, &quot;b_2&quot;: 1}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall =3D 1<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 2:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall +=3D 1<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D stats.sort(&quot;totaltim=
e&quot;, &quot;desc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for stat in stats:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_stat:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(prev_stat.ttot &gt;=3D stat.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D stat<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D stats.sort(&quot;totaltim=
e&quot;, &quot;asc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for stat in stats:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_stat:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(prev_stat.ttot &lt;=3D stat.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D stat<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D stats.sort(&quot;avgtime&=
quot;, &quot;asc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for stat in stats:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_stat:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(prev_stat.tavg &lt;=3D stat.tavg)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D stat<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D stats.sort(&quot;name&quo=
t;, &quot;asc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for stat in stats:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_stat:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(<a href=3D"http://prev_stat.name" rel=3D"noreferrer" target=3D"_bl=
ank">prev_stat.name</a> &lt;=3D <a href=3D"http://stat.name" rel=3D"norefer=
rer" target=3D"_blank">stat.name</a>)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D stat<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D stats.sort(&quot;subtime&=
quot;, &quot;asc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for stat in stats:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_stat:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(prev_stat.tsub &lt;=3D stat.tsub)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D stat<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.YappiError, sta=
ts.sort, &quot;invalid_func_sorttype_arg&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.YappiError, sta=
ts.sort, &quot;totaltime&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;invalid_func_so=
rtorder_arg&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_start_flags(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(_yappi._get_start_=
flags(), None)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(_yappi._get_start_=
flags()[&quot;profile_builtins&quot;], 0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(_yappi._get_start_=
flags()[&quot;profile_multicontext&quot;], 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(yappi.get_thre=
ad_stats()), 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_builtin_profiling(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(0.4)=C2=A0=
 # is a builtin function<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&#39;wall&#39;=
)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start(builtins=3DTrue)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;sleep&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa is not None)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa.ttot &gt; 0.3)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Thread(target=3Da)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_singlethread_profiling(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&#39;wall&#39;=
)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(0.2)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 class Worker1(threading.Thread):<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def a(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sl=
eep(0.3)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def run(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.a(=
)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start(profile_threads=3DFalse=
)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D Worker1()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 c.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 c.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa1 =3D utils.find_stat_by_name(st=
ats, &#39;Worker1.a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa2 =3D utils.find_stat_by_name(st=
ats, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa1 is None)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa2 is not None)<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa2.ttot &gt; 0.1)=
<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_run(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def profiled():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with yappi.run():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 profile=
d()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_f=
unc_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<b=
r>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNotNone(utils.find_sta=
t_by_name(stats, &#39;profiled&#39;))<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_run_recursive(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def profiled():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def not_profiled():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with yappi.run():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with ya=
ppi.run():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 profiled()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Profi=
ling stopped here<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 not_pro=
filed()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_f=
unc_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<b=
r>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNotNone(utils.find_sta=
t_by_name(stats, &#39;profiled&#39;))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNone(utils.find_stat_b=
y_name(stats, &#39;not_profiled&#39;))<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; --class StatSaveScenarios(utils.YappiUnitTestCase):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_pstats_conversion(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def pstat_id(fs):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (fs.module, fs=
.lineno, <a href=3D"http://fs.name" rel=3D"noreferrer" target=3D"_blank">fs=
.name</a>)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def d():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 12, =
&quot;b_1&quot;: 7, &quot;c_1&quot;: 5, &quot;d_1&quot;: 2}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a, )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.strip_dirs()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(&quot;tests/a1.pstats&qu=
ot;, type=3D&quot;pstat&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa_pid =3D pstat_id(utils.find_sta=
t_by_name(stats, &quot;a&quot;))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsd_pid =3D pstat_id(utils.find_sta=
t_by_name(stats, &quot;d&quot;))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a, )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.strip_dirs()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(&quot;tests/a2.pstats&qu=
ot;, type=3D&quot;pstat&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(b, )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.strip_dirs()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(&quot;tests/b1.pstats&qu=
ot;, type=3D&quot;pstat&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb_pid =3D pstat_id(utils.find_sta=
t_by_name(stats, &quot;b&quot;))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(c, )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.strip_dirs()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(&quot;tests/c1.pstats&qu=
ot;, type=3D&quot;pstat&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsc_pid =3D pstat_id(utils.find_sta=
t_by_name(stats, &quot;c&quot;))<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # merge saved stats and check pstat=
s values are correct<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 import pstats<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D pstats.Stats(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/a1.pstats&=
#39;, &#39;tests/a2.pstats&#39;, &#39;tests/b1.pstats&#39;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/c1.pstats&=
#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 p.strip_dirs()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # ct =3D ttot, tt =3D tsub<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cc, nc, tt, ct, callers) =3D p.sta=
ts[fsa_pid]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cc, nc, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(tt, 20)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ct, 24)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cc, nc, tt, ct, callers) =3D p.sta=
ts[fsd_pid]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cc, nc, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(tt, 6)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ct, 6)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(callers), 2)<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cc, nc, tt, ct) =3D callers[fsa_pi=
d]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cc, nc, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(tt, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ct, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cc, nc, tt, ct) =3D callers[fsb_pi=
d]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cc, nc, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(tt, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(ct, 2)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_merge_stats(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_1&quot;: 15,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_1&quot;: 14,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_1&quot;: 12,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;d_1&quot;: 10,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;e_1&quot;: 9,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;f_1&quot;: 7,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;g_1&quot;: 6,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;h_1&quot;: 5,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;i_1&quot;: 1<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def d():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def e():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def f():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def g():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def h():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def i():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NotImplementedError, =
stats.save, &quot;&quot;, &quot;INVALID_SAVE_TYPE&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(&quot;tests/ystats2.ys&q=
uot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats().ad=
d(&quot;tests/ystats2.ys&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &quot;a&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &quot;b&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsc =3D utils.find_stat_by_name(sta=
ts, &quot;c&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsd =3D utils.find_stat_by_name(sta=
ts, &quot;d&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fse =3D utils.find_stat_by_name(sta=
ts, &quot;e&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsf =3D utils.find_stat_by_name(sta=
ts, &quot;f&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsg =3D utils.find_stat_by_name(sta=
ts, &quot;g&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsh =3D utils.find_stat_by_name(sta=
ts, &quot;h&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsi =3D utils.find_stat_by_name(sta=
ts, &quot;i&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 45)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.nactualcall, 3=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.children[fsb].=
ttot, fsb.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.children[fsb].=
tsub, fsb.tsub)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.children[fsc].=
ttot, fsc.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.children[fsc].=
tsub, fsc.tsub)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.tsub, 6)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.children[fsd].=
ttot, fsd.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.children[fsd].=
tsub, fsd.tsub)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsd.children[fse].=
ttot, fse.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsd.children[fse].=
tsub, fse.tsub)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fse.children[fsf].=
ttot, fsf.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fse.children[fsf].=
tsub, fsf.tsub)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsf.children[fsg].=
ttot, fsg.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsf.children[fsg].=
tsub, fsg.tsub)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsg.ttot, 18)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsg.tsub, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsg.children[fsh].=
ttot, fsh.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsg.children[fsh].=
tsub, fsh.tsub)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsh.ttot, 15)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsh.tsub, 12)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsh.tavg, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsh.children[fsi].=
ttot, fsi.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsh.children[fsi].=
tsub, fsi.tsub)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #stats.debug_print()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_merge_multithreaded_stats(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 import _yappi<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 timings =3D {&quot;a_1&quot;: 2, &q=
uot;b_1&quot;: 1}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(timings)<b=
r>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Thread(target=3Da)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Thread(target=3Db)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.get_func_stats().save(&quot;t=
ests/ystats1.ys&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(timings)<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(yappi.get_func=
_stats()), 0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(yappi.get_thre=
ad_stats()), 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Thread(target=3Da)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(_yappi._get_start_=
flags()[&quot;profile_builtins&quot;], 0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(_yappi._get_start_=
flags()[&quot;profile_multicontext&quot;], 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.get_func_stats().save(&quot;t=
ests/ystats2.ys&quot;)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.YFuncStats([<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tests/ystats1.y=
s&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tests/ystats2.y=
s&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &quot;a&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &quot;b&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ncall, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, fsa.ttot=
, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, fsb.ttot=
, 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_merge_load_different_clock_types(self):<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start(builtins=3DTrue)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Thread(target=3Da)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.get_func_stats().sort(&quot;n=
ame&quot;, &quot;asc&quot;).save(&quot;tests/ystats1.ys&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start(builtins=3DFalse)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Thread(target=3Da)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.get_func_stats().save(&quot;t=
ests/ystats2.ys&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(_yappi.error, yap=
pi.set_clock_type, &quot;wall&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&quot;wall&quo=
t;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Thread(target=3Da)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.get_func_stats().save(&quot;t=
ests/ystats3.ys&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.YappiError,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.YFuncStats().ad=
d(&quot;tests/ystats1.ys&quot;).add, &quot;tests/ystats3.ys&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.YFuncStats([&quot;t=
ests/ystats1.ys&quot;,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;tests/ystats2=
.ys&quot;]).sort(&quot;name&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &quot;a&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &quot;b&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsc =3D utils.find_stat_by_name(sta=
ts, &quot;c&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, fsb.nca=
ll, fsc.ncall)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_merge_aabab_aabbc(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_1&quot;: 15,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_2&quot;: 14,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_1&quot;: 12,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_3&quot;: 10,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_2&quot;: 9,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_1&quot;: 4<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 1:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._n=
call +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self._ncall =3D=
=3D 5:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._n=
call +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 2:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._n=
call +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self._ncall =3D=
=3D 6:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._n=
call +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self._ncall =3D=
=3D 7:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall =3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a, )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(&quot;tests/ystats1.ys&q=
uot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #stats.print_all()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall =3D 5<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a, )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(&quot;tests/ystats2.ys&q=
uot;)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #stats.print_all()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():=C2=A0 # same name but anot=
her function(code object)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats().ad=
d(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&quot;tests/ystats1.=
ys&quot;, &quot;tests/ystats2.ys&quot;]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #stats.print_all()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(stats), 4)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for stat in stats:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://=
stat.name" rel=3D"noreferrer" target=3D"_blank">stat.name</a> =3D=3D &quot;=
a&quot; and stat.ttot =3D=3D 45:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D=
 stat<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa is not None)<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, 7)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.nactualcall, 3=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 45)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 10)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &quot;b&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsc =3D utils.find_stat_by_name(sta=
ts, &quot;c&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ncall, 6)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.nactualcall, 3=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 36)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 27)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tavg, 6)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.ttot, 8)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.tsub, 8)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.tavg, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.nactualcall, f=
sc.ncall, 2)<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; --class MultithreadedScenarios(utils.YappiUnitTestCase):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_issue_32(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 Start yappi from different thread a=
nd we get Internal Error(15) as<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 the current_ctx_id() called while e=
numerating the threads in start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 and as it does not swap to the enum=
erated ThreadState* the THreadState_GetDict()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 returns wrong object and thus sets =
an invalid id for the _ctx structure.<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 When this issue happens multiple Th=
reads have same tid as the internal ts_ptr<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 will be same for different contexts=
. So, let&#39;s see if that happens<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def foo():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(0.2)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def bar():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(0.1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def thread_func():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(=
&quot;wall&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bar()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Thread(target=3Dthr=
ead_func)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 foo()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 thread_ids =3D set()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for tstat in yappi.get_thread_stats=
():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(tstat=
.tid not in thread_ids)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thread_ids.add(tstat.=
tid)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_subsequent_profile(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORKER_COUNT =3D 5<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_1&quot;: 3,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_1&quot;: 2,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_1&quot;: 1,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def g():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 g()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _dummy =3D []<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(WORKER_COUNT):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Threa=
d(target=3Da)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(WORKER_COUNT):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Threa=
d(target=3Db)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _dummy.append(t)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(WORKER_COUNT):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Threa=
d(target=3Da)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(WORKER_COUNT):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D threading.Threa=
d(target=3Dc)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def f():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 f()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsc =3D utils.find_stat_by_name(sta=
ts, &#39;c&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, 10)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ncall, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.ncall, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, fsa.tsub=
, 30)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, fsb.tsub=
, 10)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.ttot, fsc.tsub=
, 5)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # MACOSx optimizes by only creating=
 one worker thread<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(len(yappi.get_threa=
d_stats()) &gt;=3D 2)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_basic(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&#39;wall&#39;=
)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def dummy():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(0.2)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 class Worker1(threading.Thread):<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def a(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sl=
eep(0.3)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def run(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.a(=
)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start(builtins=3DFalse, profi=
le_threads=3DTrue)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D Worker1()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 c.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 c.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa1 =3D utils.find_stat_by_name(st=
ats, &#39;Worker1.a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa2 =3D utils.find_stat_by_name(st=
ats, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa1 is not None)<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa2 is not None)<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa1.ttot &gt; 0.2)=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsa2.ttot &gt; 0.1)=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tstats =3D yappi.get_thread_stats()=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(len(tstats), 2)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tsa =3D utils.find_stat_by_name(tst=
ats, &#39;Worker1&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tsm =3D utils.find_stat_by_name(tst=
ats, &#39;_MainThread&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 dummy()=C2=A0 # call dummy to force=
 ctx name to be retrieved again.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(tsa is not None)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: I put dummy() to fix below,=
 remove the comments after a while.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue( # FIX: I see this =
fails sometimes?<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsm is not None,<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Could not find &=
quot;_MainThread&quot;. Found: %s&#39; % (&#39;, &#39;.join(utils.get_stat_=
names(tstats))))<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_ctx_stats(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 from threading import Thread<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 DUMMY_WORKER_COUNT =3D 5<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 class DummyThread(Thread):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def dummy():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def dummy_worker():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(DUMMY_WORKER_COUNT):=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D DummyThread(tar=
get=3Ddummy_worker)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_thread_stats()<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tsa =3D utils.find_stat_by_name(sta=
ts, &quot;DummyThread&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(tsa is not None)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.clear_stats()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1.0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_1&quot;: 6,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_1&quot;: 5,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_1&quot;: 3,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;d_1&quot;: 1,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_2&quot;: 4,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_2&quot;: 3,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_2&quot;: 2,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;d_2&quot;: 1<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 class Thread1(Thread):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 class Thread2(Thread):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def d():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(0.6)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&quot;wall&quo=
t;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1 =3D Thread1(target=3Da)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t2 =3D Thread2(target=3Da)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t2.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t2.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_thread_stats()<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the fist clear_stats clears the c=
ontext table?<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tsa =3D utils.find_stat_by_name(sta=
ts, &quot;DummyThread&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(tsa is None)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst1 =3D utils.find_stat_by_name(st=
ats, &quot;Thread1&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst2 =3D utils.find_stat_by_name(st=
ats, &quot;Thread2&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tsmain =3D utils.find_stat_by_name(=
stats, &quot;_MainThread&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 dummy()=C2=A0 # call dummy to force=
 ctx name to be retrieved again.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(len(stats) =3D=3D 3=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(tst1 is not None)<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(tst2 is not None)<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: I put dummy() to fix below,=
 remove the comments after a while.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue( # FIX: I see this =
fails sometimes<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsmain is not None,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Could not find &=
quot;_MainThread&quot;. Found: %s&#39; % (&#39;, &#39;.join(utils.get_stat_=
names(stats))))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(1.0 &gt; tst2.ttot =
&gt;=3D 0.5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(1.0 &gt; tst1.ttot =
&gt;=3D 0.5)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # test sorting of the ctx stats<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D stats.sort(&quot;totaltim=
e&quot;, &quot;desc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for stat in stats:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_stat:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(prev_stat.ttot &gt;=3D stat.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D stat<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D stats.sort(&quot;totaltim=
e&quot;, &quot;asc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for stat in stats:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_stat:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(prev_stat.ttot &lt;=3D stat.ttot)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D stat<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D stats.sort(&quot;schedcou=
nt&quot;, &quot;desc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for stat in stats:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_stat:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(prev_stat.sched_count &gt;=3D stat.sched_count)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D stat<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D stats.sort(&quot;name&quo=
t;, &quot;desc&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D None<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for stat in stats:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prev_stat:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertTrue(prev_stat.name.lower() &gt;=3D stat.name.lower())<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prev_stat =3D stat<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.YappiError, sta=
ts.sort, &quot;invalid_thread_sorttype_arg&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.YappiError, sta=
ts.sort, &quot;invalid_thread_sortorder_arg&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_ctx_stats_cpu(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def get_thread_name():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
threading.current_thread().name<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except AttributeError=
:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
&quot;Anonymous&quot;<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def burn_cpu(sec):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t0 =3D yappi.get_cloc=
k_time()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elapsed =3D 0<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (elapsed &lt; s=
ec):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _ i=
n range(1000):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pass<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elapsed=
 =3D yappi.get_clock_time() - t0<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def test():<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts =3D []<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in (0.01, 0.05,=
 0.1):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D t=
hreading.Thread(target=3Dburn_cpu, args=3D(i, ))<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://t.name" rel=3D"noreferrer" target=3D"_blank">t.name</a> =3D &quo=
t;burn_cpu-%s&quot; % str(i)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start=
()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.appe=
nd(t)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in ts:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.join(=
)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_clock_type(&quot;cpu&quot=
;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_context_name_callback(get=
_thread_name)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 test()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 tstats =3D yappi.get_thread_stats()=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 r1 =3D &#39;&#39;&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 burn_cpu-0.1=C2=A0 =C2=A0 =C2=A0 3=
=C2=A0 =C2=A0 =C2=A0 123145356058624=C2=A0 0.100105=C2=A0 8<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 burn_cpu-0.05=C2=A0 =C2=A0 =C2=A02=
=C2=A0 =C2=A0 =C2=A0 123145361313792=C2=A0 0.050149=C2=A0 8<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 burn_cpu-0.01=C2=A0 =C2=A0 =C2=A01=
=C2=A0 =C2=A0 =C2=A0 123145356058624=C2=A0 0.010127=C2=A0 2<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 MainThread=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0=C2=A0 =C2=A0 =C2=A0 4321620864=C2=A0 =C2=A0 =C2=A0 =C2=A00.001632=C2=
=A0 6<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assert_ctx_stats_almost_equal(=
r1, tstats)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_producer_consumer_with_queues(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # we currently just stress yappi, n=
o functionality test is done here.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if utils.is_py3x():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue import Que=
ue<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from Queue import Que=
ue<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 from threading import Thread<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORKER_THREAD_COUNT =3D 50<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORK_ITEM_COUNT =3D 2000<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def worker():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while True:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 item =
=3D q.get()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # do th=
e work with item<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q.task_=
done()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D Queue()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(WORKER_THREAD_COUNT)=
:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D Thread(target=
=3Dworker)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.daemon =3D True<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in range(WORK_ITEM_COUNT):=
<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q.put(item)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 q.join()=C2=A0 # block until all ta=
sks are done<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #yappi.get_func_stats().sort(&quot;=
callcount&quot;).print_all()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_temporary_lock_waiting(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _lock =3D threading.Lock()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def worker():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _lock.acquire()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sl=
eep(1.0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _lock.r=
elease()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1 =3D threading.Thread(target=3Dwo=
rker)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t2 =3D threading.Thread(target=3Dwo=
rker)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t2.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t2.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #yappi.get_func_stats().sort(&quot;=
callcount&quot;).print_all()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 @unittest.skipIf(<a href=3D"http://os.name" rel=
=3D"noreferrer" target=3D"_blank">os.name</a> !=3D &quot;posix&quot;, &quot=
;requires Posix compliant OS&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_signals_with_blocking_calls(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 import signal, os, time<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 # just to verify if signal is handl=
ed correctly and stats/yappi are not corrupted.<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def handler(signum, frame):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&quot=
;Signal handler executed!&quot;)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 signal.signal(signal.SIGALRM, handl=
er)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 signal.alarm(1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRaises(Exception, time.s=
leep, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsh =3D utils.find_stat_by_name(sta=
ts, &quot;handler&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsh is not None)<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 @unittest.skipIf(not sys.version_info &gt;=3D (3,=
 2), &quot;requires Python 3.2&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_concurrent_futures(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 from concurrent.futures import Thre=
adPoolExecutor<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 with ThreadPoolExecutor(max_workers=
=3D5) as executor:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D executor.submit=
(pow, 5, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(f.re=
sult(), 25)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1.0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 @unittest.skipIf(not sys.version_info &gt;=3D (3,=
 2), &quot;requires Python 3.2&quot;)<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_barrier(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D threading.Barrier(2, timeout=
=3D1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def worker():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b.wait(=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except threading.Brok=
enBarrierError:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise E=
xception(&quot;BrokenBarrierError not raised&quot;)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1 =3D threading.Thread(target=3Dwo=
rker)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 #b.wait()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 t1.join()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; --class NonRecursiveFunctions(utils.YappiUnitTestCase):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_abcd(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 6, &=
quot;b_1&quot;: 5, &quot;c_1&quot;: 3, &quot;d_1&quot;: 1}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def d():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsc =3D utils.find_stat_by_name(sta=
ts, &#39;c&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsd =3D utils.find_stat_by_name(sta=
ts, &#39;d&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsab =3D fsa.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsbc =3D fsb.children[fsc]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfscd =3D fsc.children[fsd]<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 6)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.ttot, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.tsub, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsd.ttot, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsd.tsub, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.ttot, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.tsub, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbc.ttot, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbc.tsub, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfscd.ttot, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfscd.tsub, 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_stop_in_middle(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 6, &=
quot;b_1&quot;: 4}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(0.2)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.nactualcall, 0=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 0)=C2=A0=
 # no call_leave called<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 0)=C2=A0=
 # no call_leave called<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 4)<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; --class RecursiveFunctions(utils.YappiUnitTestCase):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_fibonacci(self):<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def fib(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n &gt; 1:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
fib(n - 1) + fib(n - 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
n<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(fib, 22)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs =3D utils.find_stat_by_name(stat=
s, &#39;fib&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fs.ncall, 57313)<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fs.ttot, fs.tsub)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_abcadc(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_1&quot;: 20,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_1&quot;: 19,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_1&quot;: 17,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_2&quot;: 13,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;d_1&quot;: 12,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_2&quot;: 10,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_3&quot;: 5<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n =3D=3D 3:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n =3D=3D 1 + 1:<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d(n)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b(n)<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c(n)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a(n + 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def d(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c(n)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsc =3D utils.find_stat_by_name(sta=
ts, &#39;c&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsd =3D utils.find_stat_by_name(sta=
ts, &#39;d&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.nactualcall, 1=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 20)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 7)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 19)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.ttot, 17)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.tsub, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsd.ttot, 12)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsd.tsub, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsca =3D fsc.children[fsa]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsca.nactualcall,=
 0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsca.ncall, 2)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsca.ttot, 13)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsca.tsub, 6)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_aaaa(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;d_1&quot;: 9, &=
quot;d_2&quot;: 7, &quot;d_3&quot;: 3, &quot;d_4&quot;: 2}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def d(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n =3D=3D 3:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d(n + 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(d, 0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsd =3D utils.find_stat_by_name(sta=
ts, &#39;d&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsd.ncall, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsd.nactualcall, 1=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsd.ttot, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsd.tsub, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsdd =3D fsd.children[fsd]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsdd.ttot, 7)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsdd.tsub, 7)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsdd.ncall, 3)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsdd.nactualcall,=
 0)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_abcabc(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_1&quot;: 20,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_1&quot;: 19,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_1&quot;: 17,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_2&quot;: 13,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_2&quot;: 11,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_2&quot;: 9,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_3&quot;: 6<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if n =3D=3D 3:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b(n)<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c(n)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c(n):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a(n + 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsc =3D utils.find_stat_by_name(sta=
ts, &#39;c&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ncall, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.nactualcall, 1=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 20)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 19)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.ttot, 17)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.tsub, 7)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsab =3D fsa.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsbc =3D fsb.children[fsc]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsca =3D fsc.children[fsa]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.ttot, 19)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.tsub, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbc.ttot, 17)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbc.tsub, 7)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsca.ttot, 13)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsca.tsub, 8)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_abcbca(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 10, =
&quot;b_1&quot;: 9, &quot;c_1&quot;: 7, &quot;b_2&quot;: 4, &quot;c_2&quot;=
: 2, &quot;a_2&quot;: 1}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall =3D 1<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 1:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 1:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._n=
call +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsc =3D utils.find_stat_by_name(sta=
ts, &#39;c&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsab =3D fsa.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsbc =3D fsb.children[fsc]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsca =3D fsc.children[fsa]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 10)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.ttot, 7)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.tsub, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.ttot, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.tsub, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbc.ttot, 7)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbc.tsub, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsca.ttot, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsca.tsub, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsca.ncall, 1)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsca.nactualcall,=
 0)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_aabccb(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_1&quot;: 13,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;a_2&quot;: 11,<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_1&quot;: 9,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_1&quot;: 5,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;c_2&quot;: 3,<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;b_2&quot;: 1<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall =3D 1<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 1:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._n=
call +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 3:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def c():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 2:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._n=
call +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsc =3D utils.find_stat_by_name(sta=
ts, &#39;c&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsaa =3D fsa.children[fsa.index]<b=
r>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsab =3D fsa.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsbc =3D fsb.children[fsc.full_nam=
e]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfscc =3D fsc.children[fsc]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfscb =3D fsc.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbc.ttot, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbc.tsub, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 13)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.ttot, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.tsub, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsaa.ttot, 11)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsaa.tsub, 2)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.ttot, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsc.tsub, 4)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_abaa(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 13, =
&quot;b_1&quot;: 10, &quot;a_2&quot;: 9, &quot;a_3&quot;: 5}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall =3D 1<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 1:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self._ncall =3D=
=3D 2:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._n=
call +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall +=3D 1<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsaa =3D fsa.children[fsa]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsba =3D fsb.children[fsa]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 10)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 13)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 12)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsaa.ttot, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsaa.tsub, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsba.ttot, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsba.tsub, 4)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_aabb(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 13, =
&quot;a_2&quot;: 10, &quot;b_1&quot;: 9, &quot;b_2&quot;: 5}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall =3D 1<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 1:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._n=
call +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif self._ncall =3D=
=3D 2:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 2:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._n=
call +=3D 1<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsaa =3D fsa.children[fsa]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsab =3D fsa.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsbb =3D fsb.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 13)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsaa.ttot, 10)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsaa.tsub, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.ttot, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.tsub, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbb.ttot, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbb.tsub, 5)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_abbb(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 13, =
&quot;b_1&quot;: 10, &quot;b_2&quot;: 6, &quot;b_3&quot;: 1}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall =3D 1<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 1:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 3:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall +=3D 1<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsab =3D fsa.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsbb =3D fsb.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 13)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 10)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 10)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ncall, 3)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.nactualcall, 1=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.ttot, 10)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.tsub, 4)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbb.ttot, 6)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbb.tsub, 6)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbb.nactualcall,=
 0)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsbb.ncall, 2)<br=
>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_aaab(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 13, =
&quot;a_2&quot;: 10, &quot;a_3&quot;: 6, &quot;b_1&quot;: 1}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall =3D 1<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 3:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall +=3D 1<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsaa =3D fsa.children[fsa]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsab =3D fsa.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 13)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 12)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsaa.ttot, 10)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsaa.tsub, 9)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.ttot, 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.tsub, 1)<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 def test_abab(self):<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _timings =3D {&quot;a_1&quot;: 13, =
&quot;b_1&quot;: 10, &quot;a_2&quot;: 6, &quot;b_2&quot;: 1}<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 _yappi._set_test_timings(_timings)<=
br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall =3D 1<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._ncall =3D=3D=
 2:<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ncall +=3D 1<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; --<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D utils.run_and_get_func_st=
ats(a)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsa =3D utils.find_stat_by_name(sta=
ts, &#39;a&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb =3D utils.find_stat_by_name(sta=
ts, &#39;b&#39;)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsab =3D fsa.children[fsb]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 cfsba =3D fsb.children[fsa]<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.ttot, 13)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsa.tsub, 8)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.ttot, 10)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(fsb.tsub, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.ttot, 10)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.tsub, 5)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.ncall, 2)<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsab.nactualcall,=
 1)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsba.ttot, 6)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(cfsba.tsub, 5)<br>
&gt; &gt; --<br>
&gt; &gt; --<br>
&gt; &gt; --if __name__ =3D=3D &#39;__main__&#39;:<br>
&gt; &gt; --=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0import sys;sys.argv =3D [&#3=
9;&#39;, &#39;BasicUsage.test_run_as_script&#39;]<br>
&gt; &gt; --=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0import sys;sys.argv =3D [&#3=
9;&#39;, &#39;MultithreadedScenarios.test_subsequent_profile&#39;]<br>
&gt; &gt; --=C2=A0 =C2=A0 unittest.main()<br>
&gt; &gt; -+import os<br>
&gt; &gt; -+import sys<br>
&gt; &gt; -+import time<br>
&gt; &gt; -+import threading<br>
&gt; &gt; -+import unittest<br>
&gt; &gt; -+import yappi<br>
&gt; &gt; -+import _yappi<br>
&gt; &gt; -+import tests.utils as utils<br>
&gt; &gt; -+import multiprocessing=C2=A0 # added to fix <a href=3D"http://b=
ugs.python.org/issue15881" rel=3D"noreferrer" target=3D"_blank">http://bugs=
.python.org/issue15881</a> for &gt; Py2.6<br>
&gt; &gt; -+import subprocess<br>
&gt; &gt; -+<br>
&gt; &gt; -+_counter =3D 0<br>
&gt; &gt; -+<br>
&gt; &gt; -+<br>
&gt; &gt; -+class BasicUsage(utils.YappiUnitTestCase):<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 def test_callback_function_int_return_overflow(se=
lf):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # this test is just here to check i=
f any errors are generated, as the err<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # is printed in C side, I did not i=
nclude it here. THere are ways to test<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # this deterministically, I did not=
 bother<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import ctypes<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _unsigned_overflow_margin():<br=
>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2**(ctypes.siz=
eof(ctypes.c_void_p) * 8) - 1<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def foo():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #with utils.captured_output() as (o=
ut, err):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_context_id_callback(_unsi=
gned_overflow_margin)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_tag_callback(_unsigned_ov=
erflow_margin)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 foo()<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 def test_issue60(self):<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def foo():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D bytearray()<b=
r>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf +=3D b&#39;t&#39;=
 * 200<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 view =3D memoryview(b=
uf)[10:]<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 view =3D view.tobytes=
()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del buf[:10]=C2=A0 # =
this throws exception<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return view<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start(builtins=3DTrue)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 foo()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.g=
et_func_stats(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 filter_callback=3Dlambda x: yappi.<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 func_matches(x, [memoryview.tobytes])<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) &gt; 0<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 def test_issue54(self):<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _tag_cbk():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 global _counter<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _counter +=3D 1<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return _counter<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def a():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def b():<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.set_tag_callback(_tag_cbk)<br=
>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 a()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats()<br=
>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(stats.pop().ncall,=
 3)=C2=A0 # aggregated if no tag is given<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_func_stats(tag=
=3D1)<br>
&gt; &gt; -+<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(1, 3):<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_f=
unc_stats(tag=3Di)<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats =3D yappi.get_f=
unc_stats(<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</blockquote></div></div>

--000000000000882096060d32f2ee--

