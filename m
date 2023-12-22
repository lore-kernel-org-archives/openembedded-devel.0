Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B96C41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 15:54:57 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.26172.1703260494083181617
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 07:54:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cK6hY6Du;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-59052ab970eso1251666eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 07:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703260493; x=1703865293; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hAPnUmLbo3t7KoCHmQ64+LIiRQxS123foTr834T67Y=;
        b=cK6hY6DuM30XZP2Tj33ScO0ch+Ztv77hASjr4jUR75RF5b+LQyTzouZWCpRcOfvRD7
         Rq9t0F04YSb6srCVHZbccK2WeopCgn5ywOHgJyeoguEvZWviWv3kGFTLF/It/74/bb7Y
         JAo7mU2D8SLwCnO1bKky+Ij99xO7ywglpXesWCqtqoII/cCK5ZcO4qQGu3KMwRFLI4S+
         WA46rMhNvwWmcF95G3IZCT0HncSXxK/E+PiWnJME0s4D6KXY17aHk6WNnHZN7O6sEKkr
         BUtdbTGPyuIy7nFQYyP8+CH8zwnqdGkzsFGwRc29sQ2EMu/8KHBYaHqLySKnf+eM1j0x
         EKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703260493; x=1703865293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hAPnUmLbo3t7KoCHmQ64+LIiRQxS123foTr834T67Y=;
        b=MrJKinkHw8TD/uCyUD/5y72ceQO480N4Xa+JkjUVUxEh7mQj7++svxjXrU+aRKLOTy
         d06xQy/WaogpOSPeUdcjFDb53Aa4nAKkwalvfJcCYrDg1xzOhZerv7srAzchyf9Rshds
         DPyEgKJQeYFPHVurQlPdWv0xLZIgvN2l6ORqGSbF3S9V2/ZWpoRbUJdakeFzX28IAQsb
         0MK+qI1kmOTTCLdZRO/3E7IPbxzW1/ogVtpayI9A5W91JSR1ZNfgHM2jzkkl9jCCV1ZA
         ZuW/bThXbCs7G8y7KWiIGPXgSVV4fvoN+/Wtd4+aAe5JsQRjF+VHkmzd+oorugEHKk0w
         916g==
X-Gm-Message-State: AOJu0Yy3Czm/VchC2zCaF/js2SCiDHDM4QEIhYQZ3rJfbgskNC7yWBIx
	5iRHkBfxvWjI8RuovyDWBbznXgXlhVa5h+z1Ssc=
X-Google-Smtp-Source: AGHT+IEuHz7GJcXen00g18kR1YyQtiTWTkRT535lKVVMmhU7aJwR2SEfHS0SQThBILXhRJ+ZxoUd4wJojgcKityHpTw=
X-Received: by 2002:a05:6871:828:b0:204:4240:4772 with SMTP id
 q40-20020a056871082800b0020442404772mr550873oap.6.1703260491201; Fri, 22 Dec
 2023 07:54:51 -0800 (PST)
MIME-Version: 1.0
References: <20231222151108.645675-1-alex@linutronix.de>
In-Reply-To: <20231222151108.645675-1-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Dec 2023 07:54:24 -0800
Message-ID: <CAMKF1so--mRfBjFwyW3b1ZigtfxSvX-rYcvhvzCExYUpjJXTVQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/9] python3-yappi: update 1.4.0 -> 1.6.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 15:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107765

On Fri, Dec 22, 2023 at 7:11=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop patches:
> 0002-add-3.11-to-the-setup.patch - issue resolved upstream
> 0001-Fix-imports-for-ptests.patch - unclear what the problem is, too diff=
icult to rebase.

Does
bitbake meta-python-image-ptest-python3-yappi

show regression ?

>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-Fix-imports-for-ptests.patch         | 3895 -----------------
>  .../0002-add-3.11-to-the-setup.patch          |   26 -
>  ...-yappi_1.4.0.bb =3D> python3-yappi_1.6.0.bb} |    8 +-
>  3 files changed, 2 insertions(+), 3927 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-yappi/000=
1-Fix-imports-for-ptests.patch
>  delete mode 100644 meta-python/recipes-devtools/python/python3-yappi/000=
2-add-3.11-to-the-setup.patch
>  rename meta-python/recipes-devtools/python/{python3-yappi_1.4.0.bb =3D> =
python3-yappi_1.6.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-i=
mports-for-ptests.patch b/meta-python/recipes-devtools/python/python3-yappi=
/0001-Fix-imports-for-ptests.patch
> deleted file mode 100644
> index 476db4b7d..000000000
> --- a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-=
for-ptests.patch
> +++ /dev/null
> @@ -1,3895 +0,0 @@
> -From 0dedc1c573ddc4e87475eb03c64555cd54a72e92 Mon Sep 17 00:00:00 2001
> -From: Trevor Gamblin <trevor.gamblin@windriver.com>
> -Date: Mon, 7 Jun 2021 09:40:20 -0400
> -Subject: [PATCH] Fix imports for tests
> -
> -Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ----
> -Upstream-Status: Pending
> -
> - tests/test_asyncio.py              | 2 +-
> - tests/test_asyncio_context_vars.py | 2 +-
> - tests/test_functionality.py        | 2 +-
> - tests/test_hooks.py                | 2 +-
> - tests/test_tags.py                 | 2 +-
> - 5 files changed, 6 insertions(+), 6 deletions(-)
> -
> ---- a/tests/test_asyncio.py
> -+++ b/tests/test_asyncio.py
> -@@ -2,7 +2,7 @@ import unittest
> - import yappi
> - import asyncio
> - import threading
> --from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_=
io
> -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn=
_io
> -
> -
> - async def async_sleep(sec):
> ---- a/tests/test_asyncio_context_vars.py
> -+++ b/tests/test_asyncio_context_vars.py
> -@@ -5,7 +5,7 @@ import contextvars
> - import functools
> - import time
> - import os
> --import utils
> -+import tests.utils as utils
> - import yappi
> -
> - async_context_id =3D contextvars.ContextVar('async_context_id')
> ---- a/tests/test_functionality.py
> -+++ b/tests/test_functionality.py
> -@@ -1,1916 +1,1916 @@
> --import os
> --import sys
> --import time
> --import threading
> --import unittest
> --import yappi
> --import _yappi
> --import utils
> --import multiprocessing  # added to fix http://bugs.python.org/issue1588=
1 for > Py2.6
> --import subprocess
> --
> --_counter =3D 0
> --
> --
> --class BasicUsage(utils.YappiUnitTestCase):
> --
> --    def test_callback_function_int_return_overflow(self):
> --        # this test is just here to check if any errors are generated, =
as the err
> --        # is printed in C side, I did not include it here. THere are wa=
ys to test
> --        # this deterministically, I did not bother
> --        import ctypes
> --
> --        def _unsigned_overflow_margin():
> --            return 2**(ctypes.sizeof(ctypes.c_void_p) * 8) - 1
> --
> --        def foo():
> --            pass
> --
> --        #with utils.captured_output() as (out, err):
> --        yappi.set_context_id_callback(_unsigned_overflow_margin)
> --        yappi.set_tag_callback(_unsigned_overflow_margin)
> --        yappi.start()
> --        foo()
> --
> --    def test_issue60(self):
> --
> --        def foo():
> --            buf =3D bytearray()
> --            buf +=3D b't' * 200
> --            view =3D memoryview(buf)[10:]
> --            view =3D view.tobytes()
> --            del buf[:10]  # this throws exception
> --            return view
> --
> --        yappi.start(builtins=3DTrue)
> --        foo()
> --        self.assertTrue(
> --            len(
> --                yappi.get_func_stats(
> --                    filter_callback=3Dlambda x: yappi.
> --                    func_matches(x, [memoryview.tobytes])
> --                )
> --            ) > 0
> --        )
> --        yappi.stop()
> --
> --    def test_issue54(self):
> --
> --        def _tag_cbk():
> --            global _counter
> --            _counter +=3D 1
> --            return _counter
> --
> --        def a():
> --            pass
> --
> --        def b():
> --            pass
> --
> --        yappi.set_tag_callback(_tag_cbk)
> --        yappi.start()
> --        a()
> --        a()
> --        a()
> --        yappi.stop()
> --        stats =3D yappi.get_func_stats()
> --        self.assertEqual(stats.pop().ncall, 3)  # aggregated if no tag =
is given
> --        stats =3D yappi.get_func_stats(tag=3D1)
> --
> --        for i in range(1, 3):
> --            stats =3D yappi.get_func_stats(tag=3Di)
> --            stats =3D yappi.get_func_stats(
> --                tag=3Di, filter_callback=3Dlambda x: yappi.func_matches=
(x, [a])
> --            )
> --
> --            stat =3D stats.pop()
> --            self.assertEqual(stat.ncall, 1)
> --
> --        yappi.set_tag_callback(None)
> --        yappi.clear_stats()
> --        yappi.start()
> --        b()
> --        b()
> --        stats =3D yappi.get_func_stats()
> --        self.assertEqual(len(stats), 1)
> --        stat =3D stats.pop()
> --        self.assertEqual(stat.ncall, 2)
> --
> --    def test_filter(self):
> --
> --        def a():
> --            pass
> --
> --        def b():
> --            a()
> --
> --        def c():
> --            b()
> --
> --        _TCOUNT =3D 5
> --
> --        ts =3D []
> --        yappi.start()
> --        for i in range(_TCOUNT):
> --            t =3D threading.Thread(target=3Dc)
> --            t.start()
> --            ts.append(t)
> --
> --        for t in ts:
> --            t.join()
> --
> --        yappi.stop()
> --
> --        ctx_ids =3D []
> --        for tstat in yappi.get_thread_stats():
> --            if tstat.name =3D=3D '_MainThread':
> --                main_ctx_id =3D tstat.id
> --            else:
> --                ctx_ids.append(tstat.id)
> --
> --        fstats =3D yappi.get_func_stats(filter=3D{"ctx_id": 9})
> --        self.assertTrue(fstats.empty())
> --        fstats =3D yappi.get_func_stats(
> --            filter=3D{
> --                "ctx_id": main_ctx_id,
> --                "name": "c"
> --            }
> --        )  # main thread
> --        self.assertTrue(fstats.empty())
> --
> --        for i in ctx_ids:
> --            fstats =3D yappi.get_func_stats(
> --                filter=3D{
> --                    "ctx_id": i,
> --                    "name": "a",
> --                    "ncall": 1
> --                }
> --            )
> --            self.assertEqual(fstats.pop().ncall, 1)
> --            fstats =3D yappi.get_func_stats(filter=3D{"ctx_id": i, "nam=
e": "b"})
> --            self.assertEqual(fstats.pop().ncall, 1)
> --            fstats =3D yappi.get_func_stats(filter=3D{"ctx_id": i, "nam=
e": "c"})
> --            self.assertEqual(fstats.pop().ncall, 1)
> --
> --        yappi.clear_stats()
> --        yappi.start(builtins=3DTrue)
> --        time.sleep(0.1)
> --        yappi.stop()
> --        fstats =3D yappi.get_func_stats(filter=3D{"module": "time"})
> --        self.assertEqual(len(fstats), 1)
> --
> --        # invalid filters`
> --        self.assertRaises(
> --            Exception, yappi.get_func_stats, filter=3D{'tag': "sss"}
> --        )
> --        self.assertRaises(
> --            Exception, yappi.get_func_stats, filter=3D{'ctx_id': "None"=
}
> --        )
> --
> --    def test_filter_callback(self):
> --
> --        def a():
> --            time.sleep(0.1)
> --
> --        def b():
> --            a()
> --
> --        def c():
> --            pass
> --
> --        def d():
> --            pass
> --
> --        yappi.set_clock_type("wall")
> --        yappi.start(builtins=3DTrue)
> --        a()
> --        b()
> --        c()
> --        d()
> --        stats =3D yappi.get_func_stats(
> --            filter_callback=3Dlambda x: yappi.func_matches(x, [a, b])
> --        )
> --        #stats.print_all()
> --        r1 =3D '''
> --        tests/test_functionality.py:98 a      2      0.000000  0.200350=
  0.100175
> --        tests/test_functionality.py:101 b     1      0.000000  0.120000=
  0.100197
> --        '''
> --        self.assert_traces_almost_equal(r1, stats)
> --        self.assertEqual(len(stats), 2)
> --        stats =3D yappi.get_func_stats(
> --            filter_callback=3Dlambda x: yappi.
> --            module_matches(x, [sys.modules[__name__]])
> --        )
> --        r1 =3D '''
> --        tests/test_functionality.py:98 a      2      0.000000  0.230130=
  0.115065
> --        tests/test_functionality.py:101 b     1      0.000000  0.120000=
  0.109011
> --        tests/test_functionality.py:104 c     1      0.000000  0.000002=
  0.000002
> --        tests/test_functionality.py:107 d     1      0.000000  0.000001=
  0.000001
> --        '''
> --        self.assert_traces_almost_equal(r1, stats)
> --        self.assertEqual(len(stats), 4)
> --
> --        stats =3D yappi.get_func_stats(
> --            filter_callback=3Dlambda x: yappi.func_matches(x, [time.sle=
ep])
> --        )
> --        self.assertEqual(len(stats), 1)
> --        r1 =3D '''
> --        time.sleep                            2      0.206804  0.220000=
  0.103402
> --        '''
> --        self.assert_traces_almost_equal(r1, stats)
> --
> --    def test_print_formatting(self):
> --
> --        def a():
> --            pass
> --
> --        def b():
> --            a()
> --
> --        func_cols =3D {
> --            1: ("name", 48),
> --            0: ("ncall", 5),
> --            2: ("tsub", 8),
> --        }
> --        thread_cols =3D {
> --            1: ("name", 48),
> --            0: ("ttot", 8),
> --        }
> --
> --        yappi.start()
> --        a()
> --        b()
> --        yappi.stop()
> --        fs =3D yappi.get_func_stats()
> --        cs =3D fs[1].children
> --        ts =3D yappi.get_thread_stats()
> --        #fs.print_all(out=3Dsys.stderr, columns=3D{1:("name", 70), })
> --        #cs.print_all(out=3Dsys.stderr, columns=3Dfunc_cols)
> --        #ts.print_all(out=3Dsys.stderr, columns=3Dthread_cols)
> --        #cs.print_all(out=3Dsys.stderr, columns=3D{})
> --
> --        self.assertRaises(
> --            yappi.YappiError, fs.print_all, columns=3D{1: ("namee", 9)}
> --        )
> --        self.assertRaises(
> --            yappi.YappiError, cs.print_all, columns=3D{1: ("dd", 0)}
> --        )
> --        self.assertRaises(
> --            yappi.YappiError, ts.print_all, columns=3D{1: ("tidd", 0)}
> --        )
> --
> --    def test_get_clock(self):
> --        yappi.set_clock_type('cpu')
> --        self.assertEqual('cpu', yappi.get_clock_type())
> --        clock_info =3D yappi.get_clock_info()
> --        self.assertTrue('api' in clock_info)
> --        self.assertTrue('resolution' in clock_info)
> --
> --        yappi.set_clock_type('wall')
> --        self.assertEqual('wall', yappi.get_clock_type())
> --
> --        t0 =3D yappi.get_clock_time()
> --        time.sleep(0.1)
> --        duration =3D yappi.get_clock_time() - t0
> --        self.assertTrue(0.05 < duration < 0.3)
> --
> --    def test_profile_decorator(self):
> --
> --        def aggregate(func, stats):
> --            fname =3D "tests/%s.profile" % (func.__name__)
> --            try:
> --                stats.add(fname)
> --            except IOError:
> --                pass
> --            stats.save(fname)
> --            raise Exception("messing around")
> --
> --        @yappi.profile(return_callback=3Daggregate)
> --        def a(x, y):
> --            if x + y =3D=3D 25:
> --                raise Exception("")
> --            return x + y
> --
> --        def b():
> --            pass
> --
> --        try:
> --            os.remove(
> --                "tests/a.profile"
> --            )  # remove the one from prev test, if available
> --        except:
> --            pass
> --
> --        # global profile is on to mess things up
> --        yappi.start()
> --        b()
> --
> --        # assert functionality and call function at same time
> --        try:
> --            self.assertEqual(a(1, 2), 3)
> --        except:
> --            pass
> --        try:
> --            self.assertEqual(a(2, 5), 7)
> --        except:
> --            pass
> --        try:
> --            a(4, 21)
> --        except:
> --            pass
> --        stats =3D yappi.get_func_stats().add("tests/a.profile")
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        self.assertEqual(fsa.ncall, 3)
> --        self.assertEqual(len(stats), 1)  # b() should be cleared out.
> --
> --        @yappi.profile(return_callback=3Daggregate)
> --        def count_down_rec(n):
> --            if n =3D=3D 0:
> --                return
> --            count_down_rec(n - 1)
> --
> --        try:
> --            os.remove(
> --                "tests/count_down_rec.profile"
> --            )  # remove the one from prev test, if available
> --        except:
> --            pass
> --
> --        try:
> --            count_down_rec(4)
> --        except:
> --            pass
> --        try:
> --            count_down_rec(3)
> --        except:
> --            pass
> --
> --        stats =3D yappi.YFuncStats("tests/count_down_rec.profile")
> --        fsrec =3D utils.find_stat_by_name(stats, 'count_down_rec')
> --        self.assertEqual(fsrec.ncall, 9)
> --        self.assertEqual(fsrec.nactualcall, 2)
> --
> --    def test_strip_dirs(self):
> --
> --        def a():
> --            pass
> --
> --        stats =3D utils.run_and_get_func_stats(a, )
> --        stats.strip_dirs()
> --        fsa =3D utils.find_stat_by_name(stats, "a")
> --        self.assertEqual(fsa.module, os.path.basename(fsa.module))
> --
> --    @unittest.skipIf(os.name =3D=3D "nt", "do not run on Windows")
> --    def test_run_as_script(self):
> --        import re
> --        p =3D subprocess.Popen(
> --            ['yappi', os.path.join('./tests', 'run_as_script.py')],
> --            stdout=3Dsubprocess.PIPE
> --        )
> --        out, err =3D p.communicate()
> --        self.assertEqual(p.returncode, 0)
> --        func_stats, thread_stats =3D re.split(
> --            b'name\\s+id\\s+tid\\s+ttot\\s+scnt\\s*\n', out
> --        )
> --        self.assertTrue(b'FancyThread' in thread_stats)
> --
> --    def test_yappi_overhead(self):
> --        LOOP_COUNT =3D 100000
> --
> --        def a():
> --            pass
> --
> --        def b():
> --            for i in range(LOOP_COUNT):
> --                a()
> --
> --        t0 =3D time.time()
> --        yappi.start()
> --        b()
> --        yappi.stop()
> --        time_with_yappi =3D time.time() - t0
> --        t0 =3D time.time()
> --        b()
> --        time_without_yappi =3D time.time() - t0
> --        if time_without_yappi =3D=3D 0:
> --            time_without_yappi =3D 0.000001
> --
> --        # in latest v0.82, I calculated this as close to "7.0" in my ma=
chine.
> --        # however, %83 of this overhead is coming from tickcount(). The=
 other %17
> --        # seems to have been evenly distributed to the internal bookkee=
ping
> --        # structures/algorithms which seems acceptable. Note that our t=
est only
> --        # tests one function being profiled at-a-time in a short interv=
al.
> --        # profiling high number of functions in a small time
> --        # is a different beast, (which is pretty unlikely in most appli=
cations)
> --        # So as a conclusion: I cannot see any optimization window for =
Yappi that
> --        # is worth implementing as we will only optimize %17 of the tim=
e.
> --        sys.stderr.write("\r\nYappi puts %0.1f times overhead to the pr=
ofiled application in average.\r\n" % \
> --            (time_with_yappi / time_without_yappi))
> --
> --    def test_clear_stats_while_running(self):
> --
> --        def a():
> --            pass
> --
> --        yappi.start()
> --        a()
> --        yappi.clear_stats()
> --        a()
> --        stats =3D yappi.get_func_stats()
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        self.assertEqual(fsa.ncall, 1)
> --
> --    def test_generator(self):
> --
> --        def _gen(n):
> --            while (n > 0):
> --                yield n
> --                n -=3D 1
> --
> --        yappi.start()
> --        for x in _gen(5):
> --            pass
> --        self.assertTrue(
> --            yappi.convert2pstats(yappi.get_func_stats()) is not None
> --        )
> --
> --    def test_slice_child_stats_and_strip_dirs(self):
> --
> --        def b():
> --            for i in range(10000000):
> --                pass
> --
> --        def a():
> --            b()
> --
> --        yappi.start(builtins=3DTrue)
> --        a()
> --        stats =3D yappi.get_func_stats()
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        self.assertTrue(fsa.children[0:1] is not None)
> --        prev_afullname =3D fsa.full_name
> --        prev_bchildfullname =3D fsa.children[fsb].full_name
> --        stats.strip_dirs()
> --        self.assertTrue(len(prev_afullname) > len(fsa.full_name))
> --        self.assertTrue(
> --            len(prev_bchildfullname) > len(fsa.children[fsb].full_name)
> --        )
> --
> --    def test_children_stat_functions(self):
> --        _timings =3D {"a_1": 5, "b_1": 3, "c_1": 1}
> --        _yappi._set_test_timings(_timings)
> --
> --        def b():
> --            pass
> --
> --        def c():
> --            pass
> --
> --        def a():
> --            b()
> --            c()
> --
> --        yappi.start()
> --        a()
> --        b()  # non-child call
> --        c()  # non-child call
> --        stats =3D yappi.get_func_stats()
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        childs_of_a =3D fsa.children.get().sort("tavg", "desc")
> --        prev_item =3D None
> --        for item in childs_of_a:
> --            if prev_item:
> --                self.assertTrue(prev_item.tavg > item.tavg)
> --            prev_item =3D item
> --        childs_of_a.sort("name", "desc")
> --        prev_item =3D None
> --        for item in childs_of_a:
> --            if prev_item:
> --                self.assertTrue(prev_item.name > item.name)
> --            prev_item =3D item
> --        childs_of_a.clear()
> --        self.assertTrue(childs_of_a.empty())
> --
> --    def test_no_stats_different_clock_type_load(self):
> --
> --        def a():
> --            pass
> --
> --        yappi.start()
> --        a()
> --        yappi.stop()
> --        yappi.get_func_stats().save("tests/ystats1.ys")
> --        yappi.clear_stats()
> --        yappi.set_clock_type("WALL")
> --        yappi.start()
> --        yappi.stop()
> --        stats =3D yappi.get_func_stats().add("tests/ystats1.ys")
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        self.assertTrue(fsa is not None)
> --
> --    def test_subsequent_profile(self):
> --        _timings =3D {"a_1": 1, "b_1": 1}
> --        _yappi._set_test_timings(_timings)
> --
> --        def a():
> --            pass
> --
> --        def b():
> --            pass
> --
> --        yappi.start()
> --        a()
> --        yappi.stop()
> --        yappi.start()
> --        b()
> --        yappi.stop()
> --        stats =3D yappi.get_func_stats()
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        self.assertTrue(fsa is not None)
> --        self.assertTrue(fsb is not None)
> --        self.assertEqual(fsa.ttot, 1)
> --        self.assertEqual(fsb.ttot, 1)
> --
> --    def test_lambda(self):
> --        f =3D lambda: time.sleep(0.3)
> --        yappi.set_clock_type("wall")
> --        yappi.start()
> --        f()
> --        stats =3D yappi.get_func_stats()
> --        fsa =3D utils.find_stat_by_name(stats, '<lambda>')
> --        self.assertTrue(fsa.ttot > 0.1)
> --
> --    def test_module_stress(self):
> --        self.assertEqual(yappi.is_running(), False)
> --
> --        yappi.start()
> --        yappi.clear_stats()
> --        self.assertRaises(_yappi.error, yappi.set_clock_type, "wall")
> --
> --        yappi.stop()
> --        yappi.clear_stats()
> --        yappi.set_clock_type("cpu")
> --        self.assertRaises(yappi.YappiError, yappi.set_clock_type, "dumm=
y")
> --        self.assertEqual(yappi.is_running(), False)
> --        yappi.clear_stats()
> --        yappi.clear_stats()
> --
> --    def test_stat_sorting(self):
> --        _timings =3D {"a_1": 13, "b_1": 10, "a_2": 6, "b_2": 1}
> --        _yappi._set_test_timings(_timings)
> --
> --        self._ncall =3D 1
> --
> --        def a():
> --            b()
> --
> --        def b():
> --            if self._ncall =3D=3D 2:
> --                return
> --            self._ncall +=3D 1
> --            a()
> --
> --        stats =3D utils.run_and_get_func_stats(a)
> --        stats =3D stats.sort("totaltime", "desc")
> --        prev_stat =3D None
> --        for stat in stats:
> --            if prev_stat:
> --                self.assertTrue(prev_stat.ttot >=3D stat.ttot)
> --            prev_stat =3D stat
> --        stats =3D stats.sort("totaltime", "asc")
> --        prev_stat =3D None
> --        for stat in stats:
> --            if prev_stat:
> --                self.assertTrue(prev_stat.ttot <=3D stat.ttot)
> --            prev_stat =3D stat
> --        stats =3D stats.sort("avgtime", "asc")
> --        prev_stat =3D None
> --        for stat in stats:
> --            if prev_stat:
> --                self.assertTrue(prev_stat.tavg <=3D stat.tavg)
> --            prev_stat =3D stat
> --        stats =3D stats.sort("name", "asc")
> --        prev_stat =3D None
> --        for stat in stats:
> --            if prev_stat:
> --                self.assertTrue(prev_stat.name <=3D stat.name)
> --            prev_stat =3D stat
> --        stats =3D stats.sort("subtime", "asc")
> --        prev_stat =3D None
> --        for stat in stats:
> --            if prev_stat:
> --                self.assertTrue(prev_stat.tsub <=3D stat.tsub)
> --            prev_stat =3D stat
> --
> --        self.assertRaises(
> --            yappi.YappiError, stats.sort, "invalid_func_sorttype_arg"
> --        )
> --        self.assertRaises(
> --            yappi.YappiError, stats.sort, "totaltime",
> --            "invalid_func_sortorder_arg"
> --        )
> --
> --    def test_start_flags(self):
> --        self.assertEqual(_yappi._get_start_flags(), None)
> --        yappi.start()
> --
> --        def a():
> --            pass
> --
> --        a()
> --        self.assertEqual(_yappi._get_start_flags()["profile_builtins"],=
 0)
> --        self.assertEqual(_yappi._get_start_flags()["profile_multicontex=
t"], 1)
> --        self.assertEqual(len(yappi.get_thread_stats()), 1)
> --
> --    def test_builtin_profiling(self):
> --
> --        def a():
> --            time.sleep(0.4)  # is a builtin function
> --
> --        yappi.set_clock_type('wall')
> --
> --        yappi.start(builtins=3DTrue)
> --        a()
> --        stats =3D yappi.get_func_stats()
> --        fsa =3D utils.find_stat_by_name(stats, 'sleep')
> --        self.assertTrue(fsa is not None)
> --        self.assertTrue(fsa.ttot > 0.3)
> --        yappi.stop()
> --        yappi.clear_stats()
> --
> --        def a():
> --            pass
> --
> --        yappi.start()
> --        t =3D threading.Thread(target=3Da)
> --        t.start()
> --        t.join()
> --        stats =3D yappi.get_func_stats()
> --
> --    def test_singlethread_profiling(self):
> --        yappi.set_clock_type('wall')
> --
> --        def a():
> --            time.sleep(0.2)
> --
> --        class Worker1(threading.Thread):
> --
> --            def a(self):
> --                time.sleep(0.3)
> --
> --            def run(self):
> --                self.a()
> --
> --        yappi.start(profile_threads=3DFalse)
> --
> --        c =3D Worker1()
> --        c.start()
> --        c.join()
> --        a()
> --        stats =3D yappi.get_func_stats()
> --        fsa1 =3D utils.find_stat_by_name(stats, 'Worker1.a')
> --        fsa2 =3D utils.find_stat_by_name(stats, 'a')
> --        self.assertTrue(fsa1 is None)
> --        self.assertTrue(fsa2 is not None)
> --        self.assertTrue(fsa2.ttot > 0.1)
> --
> --    def test_run(self):
> --
> --        def profiled():
> --            pass
> --
> --        yappi.clear_stats()
> --        try:
> --            with yappi.run():
> --                profiled()
> --            stats =3D yappi.get_func_stats()
> --        finally:
> --            yappi.clear_stats()
> --
> --        self.assertIsNotNone(utils.find_stat_by_name(stats, 'profiled')=
)
> --
> --    def test_run_recursive(self):
> --
> --        def profiled():
> --            pass
> --
> --        def not_profiled():
> --            pass
> --
> --        yappi.clear_stats()
> --        try:
> --            with yappi.run():
> --                with yappi.run():
> --                    profiled()
> --                # Profiling stopped here
> --                not_profiled()
> --            stats =3D yappi.get_func_stats()
> --        finally:
> --            yappi.clear_stats()
> --
> --        self.assertIsNotNone(utils.find_stat_by_name(stats, 'profiled')=
)
> --        self.assertIsNone(utils.find_stat_by_name(stats, 'not_profiled'=
))
> --
> --
> --class StatSaveScenarios(utils.YappiUnitTestCase):
> --
> --    def test_pstats_conversion(self):
> --
> --        def pstat_id(fs):
> --            return (fs.module, fs.lineno, fs.name)
> --
> --        def a():
> --            d()
> --
> --        def b():
> --            d()
> --
> --        def c():
> --            pass
> --
> --        def d():
> --            pass
> --
> --        _timings =3D {"a_1": 12, "b_1": 7, "c_1": 5, "d_1": 2}
> --        _yappi._set_test_timings(_timings)
> --        stats =3D utils.run_and_get_func_stats(a, )
> --        stats.strip_dirs()
> --        stats.save("tests/a1.pstats", type=3D"pstat")
> --        fsa_pid =3D pstat_id(utils.find_stat_by_name(stats, "a"))
> --        fsd_pid =3D pstat_id(utils.find_stat_by_name(stats, "d"))
> --        yappi.clear_stats()
> --        _yappi._set_test_timings(_timings)
> --        stats =3D utils.run_and_get_func_stats(a, )
> --        stats.strip_dirs()
> --        stats.save("tests/a2.pstats", type=3D"pstat")
> --        yappi.clear_stats()
> --        _yappi._set_test_timings(_timings)
> --        stats =3D utils.run_and_get_func_stats(b, )
> --        stats.strip_dirs()
> --        stats.save("tests/b1.pstats", type=3D"pstat")
> --        fsb_pid =3D pstat_id(utils.find_stat_by_name(stats, "b"))
> --        yappi.clear_stats()
> --        _yappi._set_test_timings(_timings)
> --        stats =3D utils.run_and_get_func_stats(c, )
> --        stats.strip_dirs()
> --        stats.save("tests/c1.pstats", type=3D"pstat")
> --        fsc_pid =3D pstat_id(utils.find_stat_by_name(stats, "c"))
> --
> --        # merge saved stats and check pstats values are correct
> --        import pstats
> --        p =3D pstats.Stats(
> --            'tests/a1.pstats', 'tests/a2.pstats', 'tests/b1.pstats',
> --            'tests/c1.pstats'
> --        )
> --        p.strip_dirs()
> --        # ct =3D ttot, tt =3D tsub
> --        (cc, nc, tt, ct, callers) =3D p.stats[fsa_pid]
> --        self.assertEqual(cc, nc, 2)
> --        self.assertEqual(tt, 20)
> --        self.assertEqual(ct, 24)
> --        (cc, nc, tt, ct, callers) =3D p.stats[fsd_pid]
> --        self.assertEqual(cc, nc, 3)
> --        self.assertEqual(tt, 6)
> --        self.assertEqual(ct, 6)
> --        self.assertEqual(len(callers), 2)
> --        (cc, nc, tt, ct) =3D callers[fsa_pid]
> --        self.assertEqual(cc, nc, 2)
> --        self.assertEqual(tt, 4)
> --        self.assertEqual(ct, 4)
> --        (cc, nc, tt, ct) =3D callers[fsb_pid]
> --        self.assertEqual(cc, nc, 1)
> --        self.assertEqual(tt, 2)
> --        self.assertEqual(ct, 2)
> --
> --    def test_merge_stats(self):
> --        _timings =3D {
> --            "a_1": 15,
> --            "b_1": 14,
> --            "c_1": 12,
> --            "d_1": 10,
> --            "e_1": 9,
> --            "f_1": 7,
> --            "g_1": 6,
> --            "h_1": 5,
> --            "i_1": 1
> --        }
> --        _yappi._set_test_timings(_timings)
> --
> --        def a():
> --            b()
> --
> --        def b():
> --            c()
> --
> --        def c():
> --            d()
> --
> --        def d():
> --            e()
> --
> --        def e():
> --            f()
> --
> --        def f():
> --            g()
> --
> --        def g():
> --            h()
> --
> --        def h():
> --            i()
> --
> --        def i():
> --            pass
> --
> --        yappi.start()
> --        a()
> --        a()
> --        yappi.stop()
> --        stats =3D yappi.get_func_stats()
> --        self.assertRaises(
> --            NotImplementedError, stats.save, "", "INVALID_SAVE_TYPE"
> --        )
> --        stats.save("tests/ystats2.ys")
> --        yappi.clear_stats()
> --        _yappi._set_test_timings(_timings)
> --        yappi.start()
> --        a()
> --        stats =3D yappi.get_func_stats().add("tests/ystats2.ys")
> --        fsa =3D utils.find_stat_by_name(stats, "a")
> --        fsb =3D utils.find_stat_by_name(stats, "b")
> --        fsc =3D utils.find_stat_by_name(stats, "c")
> --        fsd =3D utils.find_stat_by_name(stats, "d")
> --        fse =3D utils.find_stat_by_name(stats, "e")
> --        fsf =3D utils.find_stat_by_name(stats, "f")
> --        fsg =3D utils.find_stat_by_name(stats, "g")
> --        fsh =3D utils.find_stat_by_name(stats, "h")
> --        fsi =3D utils.find_stat_by_name(stats, "i")
> --        self.assertEqual(fsa.ttot, 45)
> --        self.assertEqual(fsa.ncall, 3)
> --        self.assertEqual(fsa.nactualcall, 3)
> --        self.assertEqual(fsa.tsub, 3)
> --        self.assertEqual(fsa.children[fsb].ttot, fsb.ttot)
> --        self.assertEqual(fsa.children[fsb].tsub, fsb.tsub)
> --        self.assertEqual(fsb.children[fsc].ttot, fsc.ttot)
> --        self.assertEqual(fsb.children[fsc].tsub, fsc.tsub)
> --        self.assertEqual(fsc.tsub, 6)
> --        self.assertEqual(fsc.children[fsd].ttot, fsd.ttot)
> --        self.assertEqual(fsc.children[fsd].tsub, fsd.tsub)
> --        self.assertEqual(fsd.children[fse].ttot, fse.ttot)
> --        self.assertEqual(fsd.children[fse].tsub, fse.tsub)
> --        self.assertEqual(fse.children[fsf].ttot, fsf.ttot)
> --        self.assertEqual(fse.children[fsf].tsub, fsf.tsub)
> --        self.assertEqual(fsf.children[fsg].ttot, fsg.ttot)
> --        self.assertEqual(fsf.children[fsg].tsub, fsg.tsub)
> --        self.assertEqual(fsg.ttot, 18)
> --        self.assertEqual(fsg.tsub, 3)
> --        self.assertEqual(fsg.children[fsh].ttot, fsh.ttot)
> --        self.assertEqual(fsg.children[fsh].tsub, fsh.tsub)
> --        self.assertEqual(fsh.ttot, 15)
> --        self.assertEqual(fsh.tsub, 12)
> --        self.assertEqual(fsh.tavg, 5)
> --        self.assertEqual(fsh.children[fsi].ttot, fsi.ttot)
> --        self.assertEqual(fsh.children[fsi].tsub, fsi.tsub)
> --        #stats.debug_print()
> --
> --    def test_merge_multithreaded_stats(self):
> --        import _yappi
> --        timings =3D {"a_1": 2, "b_1": 1}
> --        _yappi._set_test_timings(timings)
> --
> --        def a():
> --            pass
> --
> --        def b():
> --            pass
> --
> --        yappi.start()
> --        t =3D threading.Thread(target=3Da)
> --        t.start()
> --        t.join()
> --        t =3D threading.Thread(target=3Db)
> --        t.start()
> --        t.join()
> --        yappi.get_func_stats().save("tests/ystats1.ys")
> --        yappi.clear_stats()
> --        _yappi._set_test_timings(timings)
> --        self.assertEqual(len(yappi.get_func_stats()), 0)
> --        self.assertEqual(len(yappi.get_thread_stats()), 1)
> --        t =3D threading.Thread(target=3Da)
> --        t.start()
> --        t.join()
> --
> --        self.assertEqual(_yappi._get_start_flags()["profile_builtins"],=
 0)
> --        self.assertEqual(_yappi._get_start_flags()["profile_multicontex=
t"], 1)
> --        yappi.get_func_stats().save("tests/ystats2.ys")
> --
> --        stats =3D yappi.YFuncStats([
> --            "tests/ystats1.ys",
> --            "tests/ystats2.ys",
> --        ])
> --        fsa =3D utils.find_stat_by_name(stats, "a")
> --        fsb =3D utils.find_stat_by_name(stats, "b")
> --        self.assertEqual(fsa.ncall, 2)
> --        self.assertEqual(fsb.ncall, 1)
> --        self.assertEqual(fsa.tsub, fsa.ttot, 4)
> --        self.assertEqual(fsb.tsub, fsb.ttot, 1)
> --
> --    def test_merge_load_different_clock_types(self):
> --        yappi.start(builtins=3DTrue)
> --
> --        def a():
> --            b()
> --
> --        def b():
> --            c()
> --
> --        def c():
> --            pass
> --
> --        t =3D threading.Thread(target=3Da)
> --        t.start()
> --        t.join()
> --        yappi.get_func_stats().sort("name", "asc").save("tests/ystats1.=
ys")
> --        yappi.stop()
> --        yappi.clear_stats()
> --        yappi.start(builtins=3DFalse)
> --        t =3D threading.Thread(target=3Da)
> --        t.start()
> --        t.join()
> --        yappi.get_func_stats().save("tests/ystats2.ys")
> --        yappi.stop()
> --        self.assertRaises(_yappi.error, yappi.set_clock_type, "wall")
> --        yappi.clear_stats()
> --        yappi.set_clock_type("wall")
> --        yappi.start()
> --        t =3D threading.Thread(target=3Da)
> --        t.start()
> --        t.join()
> --        yappi.get_func_stats().save("tests/ystats3.ys")
> --        self.assertRaises(
> --            yappi.YappiError,
> --            yappi.YFuncStats().add("tests/ystats1.ys").add, "tests/ysta=
ts3.ys"
> --        )
> --        stats =3D yappi.YFuncStats(["tests/ystats1.ys",
> --                                  "tests/ystats2.ys"]).sort("name")
> --        fsa =3D utils.find_stat_by_name(stats, "a")
> --        fsb =3D utils.find_stat_by_name(stats, "b")
> --        fsc =3D utils.find_stat_by_name(stats, "c")
> --        self.assertEqual(fsa.ncall, 2)
> --        self.assertEqual(fsa.ncall, fsb.ncall, fsc.ncall)
> --
> --    def test_merge_aabab_aabbc(self):
> --        _timings =3D {
> --            "a_1": 15,
> --            "a_2": 14,
> --            "b_1": 12,
> --            "a_3": 10,
> --            "b_2": 9,
> --            "c_1": 4
> --        }
> --        _yappi._set_test_timings(_timings)
> --
> --        def a():
> --            if self._ncall =3D=3D 1:
> --                self._ncall +=3D 1
> --                a()
> --            elif self._ncall =3D=3D 5:
> --                self._ncall +=3D 1
> --                a()
> --            else:
> --                b()
> --
> --        def b():
> --            if self._ncall =3D=3D 2:
> --                self._ncall +=3D 1
> --                a()
> --            elif self._ncall =3D=3D 6:
> --                self._ncall +=3D 1
> --                b()
> --            elif self._ncall =3D=3D 7:
> --                c()
> --            else:
> --                return
> --
> --        def c():
> --            pass
> --
> --        self._ncall =3D 1
> --        stats =3D utils.run_and_get_func_stats(a, )
> --        stats.save("tests/ystats1.ys")
> --        yappi.clear_stats()
> --        _yappi._set_test_timings(_timings)
> --        #stats.print_all()
> --
> --        self._ncall =3D 5
> --        stats =3D utils.run_and_get_func_stats(a, )
> --        stats.save("tests/ystats2.ys")
> --
> --        #stats.print_all()
> --
> --        def a():  # same name but another function(code object)
> --            pass
> --
> --        yappi.start()
> --        a()
> --        stats =3D yappi.get_func_stats().add(
> --            ["tests/ystats1.ys", "tests/ystats2.ys"]
> --        )
> --        #stats.print_all()
> --        self.assertEqual(len(stats), 4)
> --
> --        fsa =3D None
> --        for stat in stats:
> --            if stat.name =3D=3D "a" and stat.ttot =3D=3D 45:
> --                fsa =3D stat
> --                break
> --        self.assertTrue(fsa is not None)
> --
> --        self.assertEqual(fsa.ncall, 7)
> --        self.assertEqual(fsa.nactualcall, 3)
> --        self.assertEqual(fsa.ttot, 45)
> --        self.assertEqual(fsa.tsub, 10)
> --        fsb =3D utils.find_stat_by_name(stats, "b")
> --        fsc =3D utils.find_stat_by_name(stats, "c")
> --        self.assertEqual(fsb.ncall, 6)
> --        self.assertEqual(fsb.nactualcall, 3)
> --        self.assertEqual(fsb.ttot, 36)
> --        self.assertEqual(fsb.tsub, 27)
> --        self.assertEqual(fsb.tavg, 6)
> --        self.assertEqual(fsc.ttot, 8)
> --        self.assertEqual(fsc.tsub, 8)
> --        self.assertEqual(fsc.tavg, 4)
> --        self.assertEqual(fsc.nactualcall, fsc.ncall, 2)
> --
> --
> --class MultithreadedScenarios(utils.YappiUnitTestCase):
> --
> --    def test_issue_32(self):
> --        '''
> --        Start yappi from different thread and we get Internal Error(15)=
 as
> --        the current_ctx_id() called while enumerating the threads in st=
art()
> --        and as it does not swap to the enumerated ThreadState* the THre=
adState_GetDict()
> --        returns wrong object and thus sets an invalid id for the _ctx s=
tructure.
> --
> --        When this issue happens multiple Threads have same tid as the i=
nternal ts_ptr
> --        will be same for different contexts. So, let's see if that happ=
ens
> --        '''
> --
> --        def foo():
> --            time.sleep(0.2)
> --
> --        def bar():
> --            time.sleep(0.1)
> --
> --        def thread_func():
> --            yappi.set_clock_type("wall")
> --            yappi.start()
> --
> --            bar()
> --
> --        t =3D threading.Thread(target=3Dthread_func)
> --        t.start()
> --        t.join()
> --
> --        foo()
> --
> --        yappi.stop()
> --
> --        thread_ids =3D set()
> --        for tstat in yappi.get_thread_stats():
> --            self.assertTrue(tstat.tid not in thread_ids)
> --            thread_ids.add(tstat.tid)
> --
> --    def test_subsequent_profile(self):
> --        WORKER_COUNT =3D 5
> --
> --        def a():
> --            pass
> --
> --        def b():
> --            pass
> --
> --        def c():
> --            pass
> --
> --        _timings =3D {
> --            "a_1": 3,
> --            "b_1": 2,
> --            "c_1": 1,
> --        }
> --
> --        yappi.start()
> --
> --        def g():
> --            pass
> --
> --        g()
> --        yappi.stop()
> --        yappi.clear_stats()
> --        _yappi._set_test_timings(_timings)
> --        yappi.start()
> --
> --        _dummy =3D []
> --        for i in range(WORKER_COUNT):
> --            t =3D threading.Thread(target=3Da)
> --            t.start()
> --            t.join()
> --        for i in range(WORKER_COUNT):
> --            t =3D threading.Thread(target=3Db)
> --            t.start()
> --            _dummy.append(t)
> --            t.join()
> --        for i in range(WORKER_COUNT):
> --            t =3D threading.Thread(target=3Da)
> --            t.start()
> --            t.join()
> --        for i in range(WORKER_COUNT):
> --            t =3D threading.Thread(target=3Dc)
> --            t.start()
> --            t.join()
> --        yappi.stop()
> --        yappi.start()
> --
> --        def f():
> --            pass
> --
> --        f()
> --        stats =3D yappi.get_func_stats()
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        fsc =3D utils.find_stat_by_name(stats, 'c')
> --        self.assertEqual(fsa.ncall, 10)
> --        self.assertEqual(fsb.ncall, 5)
> --        self.assertEqual(fsc.ncall, 5)
> --        self.assertEqual(fsa.ttot, fsa.tsub, 30)
> --        self.assertEqual(fsb.ttot, fsb.tsub, 10)
> --        self.assertEqual(fsc.ttot, fsc.tsub, 5)
> --
> --        # MACOSx optimizes by only creating one worker thread
> --        self.assertTrue(len(yappi.get_thread_stats()) >=3D 2)
> --
> --    def test_basic(self):
> --        yappi.set_clock_type('wall')
> --
> --        def dummy():
> --            pass
> --
> --        def a():
> --            time.sleep(0.2)
> --
> --        class Worker1(threading.Thread):
> --
> --            def a(self):
> --                time.sleep(0.3)
> --
> --            def run(self):
> --                self.a()
> --
> --        yappi.start(builtins=3DFalse, profile_threads=3DTrue)
> --
> --        c =3D Worker1()
> --        c.start()
> --        c.join()
> --        a()
> --        stats =3D yappi.get_func_stats()
> --        fsa1 =3D utils.find_stat_by_name(stats, 'Worker1.a')
> --        fsa2 =3D utils.find_stat_by_name(stats, 'a')
> --        self.assertTrue(fsa1 is not None)
> --        self.assertTrue(fsa2 is not None)
> --        self.assertTrue(fsa1.ttot > 0.2)
> --        self.assertTrue(fsa2.ttot > 0.1)
> --        tstats =3D yappi.get_thread_stats()
> --        self.assertEqual(len(tstats), 2)
> --        tsa =3D utils.find_stat_by_name(tstats, 'Worker1')
> --        tsm =3D utils.find_stat_by_name(tstats, '_MainThread')
> --        dummy()  # call dummy to force ctx name to be retrieved again.
> --        self.assertTrue(tsa is not None)
> --        # TODO: I put dummy() to fix below, remove the comments after a=
 while.
> --        self.assertTrue( # FIX: I see this fails sometimes?
> --            tsm is not None,
> --            'Could not find "_MainThread". Found: %s' % (', '.join(util=
s.get_stat_names(tstats))))
> --
> --    def test_ctx_stats(self):
> --        from threading import Thread
> --        DUMMY_WORKER_COUNT =3D 5
> --        yappi.start()
> --
> --        class DummyThread(Thread):
> --            pass
> --
> --        def dummy():
> --            pass
> --
> --        def dummy_worker():
> --            pass
> --
> --        for i in range(DUMMY_WORKER_COUNT):
> --            t =3D DummyThread(target=3Ddummy_worker)
> --            t.start()
> --            t.join()
> --        yappi.stop()
> --        stats =3D yappi.get_thread_stats()
> --        tsa =3D utils.find_stat_by_name(stats, "DummyThread")
> --        self.assertTrue(tsa is not None)
> --        yappi.clear_stats()
> --        time.sleep(1.0)
> --        _timings =3D {
> --            "a_1": 6,
> --            "b_1": 5,
> --            "c_1": 3,
> --            "d_1": 1,
> --            "a_2": 4,
> --            "b_2": 3,
> --            "c_2": 2,
> --            "d_2": 1
> --        }
> --        _yappi._set_test_timings(_timings)
> --
> --        class Thread1(Thread):
> --            pass
> --
> --        class Thread2(Thread):
> --            pass
> --
> --        def a():
> --            b()
> --
> --        def b():
> --            c()
> --
> --        def c():
> --            d()
> --
> --        def d():
> --            time.sleep(0.6)
> --
> --        yappi.set_clock_type("wall")
> --        yappi.start()
> --        t1 =3D Thread1(target=3Da)
> --        t1.start()
> --        t2 =3D Thread2(target=3Da)
> --        t2.start()
> --        t1.join()
> --        t2.join()
> --        stats =3D yappi.get_thread_stats()
> --
> --        # the fist clear_stats clears the context table?
> --        tsa =3D utils.find_stat_by_name(stats, "DummyThread")
> --        self.assertTrue(tsa is None)
> --
> --        tst1 =3D utils.find_stat_by_name(stats, "Thread1")
> --        tst2 =3D utils.find_stat_by_name(stats, "Thread2")
> --        tsmain =3D utils.find_stat_by_name(stats, "_MainThread")
> --        dummy()  # call dummy to force ctx name to be retrieved again.
> --        self.assertTrue(len(stats) =3D=3D 3)
> --        self.assertTrue(tst1 is not None)
> --        self.assertTrue(tst2 is not None)
> --        # TODO: I put dummy() to fix below, remove the comments after a=
 while.
> --        self.assertTrue( # FIX: I see this fails sometimes
> --            tsmain is not None,
> --            'Could not find "_MainThread". Found: %s' % (', '.join(util=
s.get_stat_names(stats))))
> --        self.assertTrue(1.0 > tst2.ttot >=3D 0.5)
> --        self.assertTrue(1.0 > tst1.ttot >=3D 0.5)
> --
> --        # test sorting of the ctx stats
> --        stats =3D stats.sort("totaltime", "desc")
> --        prev_stat =3D None
> --        for stat in stats:
> --            if prev_stat:
> --                self.assertTrue(prev_stat.ttot >=3D stat.ttot)
> --            prev_stat =3D stat
> --        stats =3D stats.sort("totaltime", "asc")
> --        prev_stat =3D None
> --        for stat in stats:
> --            if prev_stat:
> --                self.assertTrue(prev_stat.ttot <=3D stat.ttot)
> --            prev_stat =3D stat
> --        stats =3D stats.sort("schedcount", "desc")
> --        prev_stat =3D None
> --        for stat in stats:
> --            if prev_stat:
> --                self.assertTrue(prev_stat.sched_count >=3D stat.sched_c=
ount)
> --            prev_stat =3D stat
> --        stats =3D stats.sort("name", "desc")
> --        prev_stat =3D None
> --        for stat in stats:
> --            if prev_stat:
> --                self.assertTrue(prev_stat.name.lower() >=3D stat.name.l=
ower())
> --            prev_stat =3D stat
> --        self.assertRaises(
> --            yappi.YappiError, stats.sort, "invalid_thread_sorttype_arg"
> --        )
> --        self.assertRaises(
> --            yappi.YappiError, stats.sort, "invalid_thread_sortorder_arg=
"
> --        )
> --
> --    def test_ctx_stats_cpu(self):
> --
> --        def get_thread_name():
> --            try:
> --                return threading.current_thread().name
> --            except AttributeError:
> --                return "Anonymous"
> --
> --        def burn_cpu(sec):
> --            t0 =3D yappi.get_clock_time()
> --            elapsed =3D 0
> --            while (elapsed < sec):
> --                for _ in range(1000):
> --                    pass
> --                elapsed =3D yappi.get_clock_time() - t0
> --
> --        def test():
> --
> --            ts =3D []
> --            for i in (0.01, 0.05, 0.1):
> --                t =3D threading.Thread(target=3Dburn_cpu, args=3D(i, ))
> --                t.name =3D "burn_cpu-%s" % str(i)
> --                t.start()
> --                ts.append(t)
> --            for t in ts:
> --                t.join()
> --
> --        yappi.set_clock_type("cpu")
> --        yappi.set_context_name_callback(get_thread_name)
> --
> --        yappi.start()
> --
> --        test()
> --
> --        yappi.stop()
> --
> --        tstats =3D yappi.get_thread_stats()
> --        r1 =3D '''
> --        burn_cpu-0.1      3      123145356058624  0.100105  8
> --        burn_cpu-0.05     2      123145361313792  0.050149  8
> --        burn_cpu-0.01     1      123145356058624  0.010127  2
> --        MainThread        0      4321620864       0.001632  6
> --        '''
> --        self.assert_ctx_stats_almost_equal(r1, tstats)
> --
> --    def test_producer_consumer_with_queues(self):
> --        # we currently just stress yappi, no functionality test is done=
 here.
> --        yappi.start()
> --        if utils.is_py3x():
> --            from queue import Queue
> --        else:
> --            from Queue import Queue
> --        from threading import Thread
> --        WORKER_THREAD_COUNT =3D 50
> --        WORK_ITEM_COUNT =3D 2000
> --
> --        def worker():
> --            while True:
> --                item =3D q.get()
> --                # do the work with item
> --                q.task_done()
> --
> --        q =3D Queue()
> --        for i in range(WORKER_THREAD_COUNT):
> --            t =3D Thread(target=3Dworker)
> --            t.daemon =3D True
> --            t.start()
> --
> --        for item in range(WORK_ITEM_COUNT):
> --            q.put(item)
> --        q.join()  # block until all tasks are done
> --        #yappi.get_func_stats().sort("callcount").print_all()
> --        yappi.stop()
> --
> --    def test_temporary_lock_waiting(self):
> --        yappi.start()
> --        _lock =3D threading.Lock()
> --
> --        def worker():
> --            _lock.acquire()
> --            try:
> --                time.sleep(1.0)
> --            finally:
> --                _lock.release()
> --
> --        t1 =3D threading.Thread(target=3Dworker)
> --        t2 =3D threading.Thread(target=3Dworker)
> --        t1.start()
> --        t2.start()
> --        t1.join()
> --        t2.join()
> --        #yappi.get_func_stats().sort("callcount").print_all()
> --        yappi.stop()
> --
> --    @unittest.skipIf(os.name !=3D "posix", "requires Posix compliant OS=
")
> --    def test_signals_with_blocking_calls(self):
> --        import signal, os, time
> --
> --        # just to verify if signal is handled correctly and stats/yappi=
 are not corrupted.
> --        def handler(signum, frame):
> --            raise Exception("Signal handler executed!")
> --
> --        yappi.start()
> --        signal.signal(signal.SIGALRM, handler)
> --        signal.alarm(1)
> --        self.assertRaises(Exception, time.sleep, 2)
> --        stats =3D yappi.get_func_stats()
> --        fsh =3D utils.find_stat_by_name(stats, "handler")
> --        self.assertTrue(fsh is not None)
> --
> --    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Python=
 3.2")
> --    def test_concurrent_futures(self):
> --        yappi.start()
> --        from concurrent.futures import ThreadPoolExecutor
> --        with ThreadPoolExecutor(max_workers=3D5) as executor:
> --            f =3D executor.submit(pow, 5, 2)
> --            self.assertEqual(f.result(), 25)
> --        time.sleep(1.0)
> --        yappi.stop()
> --
> --    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Python=
 3.2")
> --    def test_barrier(self):
> --        yappi.start()
> --        b =3D threading.Barrier(2, timeout=3D1)
> --
> --        def worker():
> --            try:
> --                b.wait()
> --            except threading.BrokenBarrierError:
> --                pass
> --            except Exception:
> --                raise Exception("BrokenBarrierError not raised")
> --
> --        t1 =3D threading.Thread(target=3Dworker)
> --        t1.start()
> --        #b.wait()
> --        t1.join()
> --        yappi.stop()
> --
> --
> --class NonRecursiveFunctions(utils.YappiUnitTestCase):
> --
> --    def test_abcd(self):
> --        _timings =3D {"a_1": 6, "b_1": 5, "c_1": 3, "d_1": 1}
> --        _yappi._set_test_timings(_timings)
> --
> --        def a():
> --            b()
> --
> --        def b():
> --            c()
> --
> --        def c():
> --            d()
> --
> --        def d():
> --            pass
> --
> --        stats =3D utils.run_and_get_func_stats(a)
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        fsc =3D utils.find_stat_by_name(stats, 'c')
> --        fsd =3D utils.find_stat_by_name(stats, 'd')
> --        cfsab =3D fsa.children[fsb]
> --        cfsbc =3D fsb.children[fsc]
> --        cfscd =3D fsc.children[fsd]
> --
> --        self.assertEqual(fsa.ttot, 6)
> --        self.assertEqual(fsa.tsub, 1)
> --        self.assertEqual(fsb.ttot, 5)
> --        self.assertEqual(fsb.tsub, 2)
> --        self.assertEqual(fsc.ttot, 3)
> --        self.assertEqual(fsc.tsub, 2)
> --        self.assertEqual(fsd.ttot, 1)
> --        self.assertEqual(fsd.tsub, 1)
> --        self.assertEqual(cfsab.ttot, 5)
> --        self.assertEqual(cfsab.tsub, 2)
> --        self.assertEqual(cfsbc.ttot, 3)
> --        self.assertEqual(cfsbc.tsub, 2)
> --        self.assertEqual(cfscd.ttot, 1)
> --        self.assertEqual(cfscd.tsub, 1)
> --
> --    def test_stop_in_middle(self):
> --        _timings =3D {"a_1": 6, "b_1": 4}
> --        _yappi._set_test_timings(_timings)
> --
> --        def a():
> --            b()
> --            yappi.stop()
> --
> --        def b():
> --            time.sleep(0.2)
> --
> --        yappi.start()
> --        a()
> --        stats =3D yappi.get_func_stats()
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --
> --        self.assertEqual(fsa.ncall, 1)
> --        self.assertEqual(fsa.nactualcall, 0)
> --        self.assertEqual(fsa.ttot, 0)  # no call_leave called
> --        self.assertEqual(fsa.tsub, 0)  # no call_leave called
> --        self.assertEqual(fsb.ttot, 4)
> --
> --
> --class RecursiveFunctions(utils.YappiUnitTestCase):
> --
> --    def test_fibonacci(self):
> --
> --        def fib(n):
> --            if n > 1:
> --                return fib(n - 1) + fib(n - 2)
> --            else:
> --                return n
> --
> --        stats =3D utils.run_and_get_func_stats(fib, 22)
> --        fs =3D utils.find_stat_by_name(stats, 'fib')
> --        self.assertEqual(fs.ncall, 57313)
> --        self.assertEqual(fs.ttot, fs.tsub)
> --
> --    def test_abcadc(self):
> --        _timings =3D {
> --            "a_1": 20,
> --            "b_1": 19,
> --            "c_1": 17,
> --            "a_2": 13,
> --            "d_1": 12,
> --            "c_2": 10,
> --            "a_3": 5
> --        }
> --        _yappi._set_test_timings(_timings)
> --
> --        def a(n):
> --            if n =3D=3D 3:
> --                return
> --            if n =3D=3D 1 + 1:
> --                d(n)
> --            else:
> --                b(n)
> --
> --        def b(n):
> --            c(n)
> --
> --        def c(n):
> --            a(n + 1)
> --
> --        def d(n):
> --            c(n)
> --
> --        stats =3D utils.run_and_get_func_stats(a, 1)
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        fsc =3D utils.find_stat_by_name(stats, 'c')
> --        fsd =3D utils.find_stat_by_name(stats, 'd')
> --        self.assertEqual(fsa.ncall, 3)
> --        self.assertEqual(fsa.nactualcall, 1)
> --        self.assertEqual(fsa.ttot, 20)
> --        self.assertEqual(fsa.tsub, 7)
> --        self.assertEqual(fsb.ttot, 19)
> --        self.assertEqual(fsb.tsub, 2)
> --        self.assertEqual(fsc.ttot, 17)
> --        self.assertEqual(fsc.tsub, 9)
> --        self.assertEqual(fsd.ttot, 12)
> --        self.assertEqual(fsd.tsub, 2)
> --        cfsca =3D fsc.children[fsa]
> --        self.assertEqual(cfsca.nactualcall, 0)
> --        self.assertEqual(cfsca.ncall, 2)
> --        self.assertEqual(cfsca.ttot, 13)
> --        self.assertEqual(cfsca.tsub, 6)
> --
> --    def test_aaaa(self):
> --        _timings =3D {"d_1": 9, "d_2": 7, "d_3": 3, "d_4": 2}
> --        _yappi._set_test_timings(_timings)
> --
> --        def d(n):
> --            if n =3D=3D 3:
> --                return
> --            d(n + 1)
> --
> --        stats =3D utils.run_and_get_func_stats(d, 0)
> --        fsd =3D utils.find_stat_by_name(stats, 'd')
> --        self.assertEqual(fsd.ncall, 4)
> --        self.assertEqual(fsd.nactualcall, 1)
> --        self.assertEqual(fsd.ttot, 9)
> --        self.assertEqual(fsd.tsub, 9)
> --        cfsdd =3D fsd.children[fsd]
> --        self.assertEqual(cfsdd.ttot, 7)
> --        self.assertEqual(cfsdd.tsub, 7)
> --        self.assertEqual(cfsdd.ncall, 3)
> --        self.assertEqual(cfsdd.nactualcall, 0)
> --
> --    def test_abcabc(self):
> --        _timings =3D {
> --            "a_1": 20,
> --            "b_1": 19,
> --            "c_1": 17,
> --            "a_2": 13,
> --            "b_2": 11,
> --            "c_2": 9,
> --            "a_3": 6
> --        }
> --        _yappi._set_test_timings(_timings)
> --
> --        def a(n):
> --            if n =3D=3D 3:
> --                return
> --            else:
> --                b(n)
> --
> --        def b(n):
> --            c(n)
> --
> --        def c(n):
> --            a(n + 1)
> --
> --        stats =3D utils.run_and_get_func_stats(a, 1)
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        fsc =3D utils.find_stat_by_name(stats, 'c')
> --        self.assertEqual(fsa.ncall, 3)
> --        self.assertEqual(fsa.nactualcall, 1)
> --        self.assertEqual(fsa.ttot, 20)
> --        self.assertEqual(fsa.tsub, 9)
> --        self.assertEqual(fsb.ttot, 19)
> --        self.assertEqual(fsb.tsub, 4)
> --        self.assertEqual(fsc.ttot, 17)
> --        self.assertEqual(fsc.tsub, 7)
> --        cfsab =3D fsa.children[fsb]
> --        cfsbc =3D fsb.children[fsc]
> --        cfsca =3D fsc.children[fsa]
> --        self.assertEqual(cfsab.ttot, 19)
> --        self.assertEqual(cfsab.tsub, 4)
> --        self.assertEqual(cfsbc.ttot, 17)
> --        self.assertEqual(cfsbc.tsub, 7)
> --        self.assertEqual(cfsca.ttot, 13)
> --        self.assertEqual(cfsca.tsub, 8)
> --
> --    def test_abcbca(self):
> --        _timings =3D {"a_1": 10, "b_1": 9, "c_1": 7, "b_2": 4, "c_2": 2=
, "a_2": 1}
> --        _yappi._set_test_timings(_timings)
> --        self._ncall =3D 1
> --
> --        def a():
> --            if self._ncall =3D=3D 1:
> --                b()
> --            else:
> --                return
> --
> --        def b():
> --            c()
> --
> --        def c():
> --            if self._ncall =3D=3D 1:
> --                self._ncall +=3D 1
> --                b()
> --            else:
> --                a()
> --
> --        stats =3D utils.run_and_get_func_stats(a)
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        fsc =3D utils.find_stat_by_name(stats, 'c')
> --        cfsab =3D fsa.children[fsb]
> --        cfsbc =3D fsb.children[fsc]
> --        cfsca =3D fsc.children[fsa]
> --        self.assertEqual(fsa.ttot, 10)
> --        self.assertEqual(fsa.tsub, 2)
> --        self.assertEqual(fsb.ttot, 9)
> --        self.assertEqual(fsb.tsub, 4)
> --        self.assertEqual(fsc.ttot, 7)
> --        self.assertEqual(fsc.tsub, 4)
> --        self.assertEqual(cfsab.ttot, 9)
> --        self.assertEqual(cfsab.tsub, 2)
> --        self.assertEqual(cfsbc.ttot, 7)
> --        self.assertEqual(cfsbc.tsub, 4)
> --        self.assertEqual(cfsca.ttot, 1)
> --        self.assertEqual(cfsca.tsub, 1)
> --        self.assertEqual(cfsca.ncall, 1)
> --        self.assertEqual(cfsca.nactualcall, 0)
> --
> --    def test_aabccb(self):
> --        _timings =3D {
> --            "a_1": 13,
> --            "a_2": 11,
> --            "b_1": 9,
> --            "c_1": 5,
> --            "c_2": 3,
> --            "b_2": 1
> --        }
> --        _yappi._set_test_timings(_timings)
> --        self._ncall =3D 1
> --
> --        def a():
> --            if self._ncall =3D=3D 1:
> --                self._ncall +=3D 1
> --                a()
> --            else:
> --                b()
> --
> --        def b():
> --            if self._ncall =3D=3D 3:
> --                return
> --            else:
> --                c()
> --
> --        def c():
> --            if self._ncall =3D=3D 2:
> --                self._ncall +=3D 1
> --                c()
> --            else:
> --                b()
> --
> --        stats =3D utils.run_and_get_func_stats(a)
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        fsc =3D utils.find_stat_by_name(stats, 'c')
> --        cfsaa =3D fsa.children[fsa.index]
> --        cfsab =3D fsa.children[fsb]
> --        cfsbc =3D fsb.children[fsc.full_name]
> --        cfscc =3D fsc.children[fsc]
> --        cfscb =3D fsc.children[fsb]
> --        self.assertEqual(fsb.ttot, 9)
> --        self.assertEqual(fsb.tsub, 5)
> --        self.assertEqual(cfsbc.ttot, 5)
> --        self.assertEqual(cfsbc.tsub, 2)
> --        self.assertEqual(fsa.ttot, 13)
> --        self.assertEqual(fsa.tsub, 4)
> --        self.assertEqual(cfsab.ttot, 9)
> --        self.assertEqual(cfsab.tsub, 4)
> --        self.assertEqual(cfsaa.ttot, 11)
> --        self.assertEqual(cfsaa.tsub, 2)
> --        self.assertEqual(fsc.ttot, 5)
> --        self.assertEqual(fsc.tsub, 4)
> --
> --    def test_abaa(self):
> --        _timings =3D {"a_1": 13, "b_1": 10, "a_2": 9, "a_3": 5}
> --        _yappi._set_test_timings(_timings)
> --
> --        self._ncall =3D 1
> --
> --        def a():
> --            if self._ncall =3D=3D 1:
> --                b()
> --            elif self._ncall =3D=3D 2:
> --                self._ncall +=3D 1
> --                a()
> --            else:
> --                return
> --
> --        def b():
> --            self._ncall +=3D 1
> --            a()
> --
> --        stats =3D utils.run_and_get_func_stats(a)
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        cfsaa =3D fsa.children[fsa]
> --        cfsba =3D fsb.children[fsa]
> --        self.assertEqual(fsb.ttot, 10)
> --        self.assertEqual(fsb.tsub, 1)
> --        self.assertEqual(fsa.ttot, 13)
> --        self.assertEqual(fsa.tsub, 12)
> --        self.assertEqual(cfsaa.ttot, 5)
> --        self.assertEqual(cfsaa.tsub, 5)
> --        self.assertEqual(cfsba.ttot, 9)
> --        self.assertEqual(cfsba.tsub, 4)
> --
> --    def test_aabb(self):
> --        _timings =3D {"a_1": 13, "a_2": 10, "b_1": 9, "b_2": 5}
> --        _yappi._set_test_timings(_timings)
> --
> --        self._ncall =3D 1
> --
> --        def a():
> --            if self._ncall =3D=3D 1:
> --                self._ncall +=3D 1
> --                a()
> --            elif self._ncall =3D=3D 2:
> --                b()
> --            else:
> --                return
> --
> --        def b():
> --            if self._ncall =3D=3D 2:
> --                self._ncall +=3D 1
> --                b()
> --            else:
> --                return
> --
> --        stats =3D utils.run_and_get_func_stats(a)
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        cfsaa =3D fsa.children[fsa]
> --        cfsab =3D fsa.children[fsb]
> --        cfsbb =3D fsb.children[fsb]
> --        self.assertEqual(fsa.ttot, 13)
> --        self.assertEqual(fsa.tsub, 4)
> --        self.assertEqual(fsb.ttot, 9)
> --        self.assertEqual(fsb.tsub, 9)
> --        self.assertEqual(cfsaa.ttot, 10)
> --        self.assertEqual(cfsaa.tsub, 1)
> --        self.assertEqual(cfsab.ttot, 9)
> --        self.assertEqual(cfsab.tsub, 4)
> --        self.assertEqual(cfsbb.ttot, 5)
> --        self.assertEqual(cfsbb.tsub, 5)
> --
> --    def test_abbb(self):
> --        _timings =3D {"a_1": 13, "b_1": 10, "b_2": 6, "b_3": 1}
> --        _yappi._set_test_timings(_timings)
> --
> --        self._ncall =3D 1
> --
> --        def a():
> --            if self._ncall =3D=3D 1:
> --                b()
> --
> --        def b():
> --            if self._ncall =3D=3D 3:
> --                return
> --            self._ncall +=3D 1
> --            b()
> --
> --        stats =3D utils.run_and_get_func_stats(a)
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        cfsab =3D fsa.children[fsb]
> --        cfsbb =3D fsb.children[fsb]
> --        self.assertEqual(fsa.ttot, 13)
> --        self.assertEqual(fsa.tsub, 3)
> --        self.assertEqual(fsb.ttot, 10)
> --        self.assertEqual(fsb.tsub, 10)
> --        self.assertEqual(fsb.ncall, 3)
> --        self.assertEqual(fsb.nactualcall, 1)
> --        self.assertEqual(cfsab.ttot, 10)
> --        self.assertEqual(cfsab.tsub, 4)
> --        self.assertEqual(cfsbb.ttot, 6)
> --        self.assertEqual(cfsbb.tsub, 6)
> --        self.assertEqual(cfsbb.nactualcall, 0)
> --        self.assertEqual(cfsbb.ncall, 2)
> --
> --    def test_aaab(self):
> --        _timings =3D {"a_1": 13, "a_2": 10, "a_3": 6, "b_1": 1}
> --        _yappi._set_test_timings(_timings)
> --
> --        self._ncall =3D 1
> --
> --        def a():
> --            if self._ncall =3D=3D 3:
> --                b()
> --                return
> --            self._ncall +=3D 1
> --            a()
> --
> --        def b():
> --            return
> --
> --        stats =3D utils.run_and_get_func_stats(a)
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        cfsaa =3D fsa.children[fsa]
> --        cfsab =3D fsa.children[fsb]
> --        self.assertEqual(fsa.ttot, 13)
> --        self.assertEqual(fsa.tsub, 12)
> --        self.assertEqual(fsb.ttot, 1)
> --        self.assertEqual(fsb.tsub, 1)
> --        self.assertEqual(cfsaa.ttot, 10)
> --        self.assertEqual(cfsaa.tsub, 9)
> --        self.assertEqual(cfsab.ttot, 1)
> --        self.assertEqual(cfsab.tsub, 1)
> --
> --    def test_abab(self):
> --        _timings =3D {"a_1": 13, "b_1": 10, "a_2": 6, "b_2": 1}
> --        _yappi._set_test_timings(_timings)
> --
> --        self._ncall =3D 1
> --
> --        def a():
> --            b()
> --
> --        def b():
> --            if self._ncall =3D=3D 2:
> --                return
> --            self._ncall +=3D 1
> --            a()
> --
> --        stats =3D utils.run_and_get_func_stats(a)
> --        fsa =3D utils.find_stat_by_name(stats, 'a')
> --        fsb =3D utils.find_stat_by_name(stats, 'b')
> --        cfsab =3D fsa.children[fsb]
> --        cfsba =3D fsb.children[fsa]
> --        self.assertEqual(fsa.ttot, 13)
> --        self.assertEqual(fsa.tsub, 8)
> --        self.assertEqual(fsb.ttot, 10)
> --        self.assertEqual(fsb.tsub, 5)
> --        self.assertEqual(cfsab.ttot, 10)
> --        self.assertEqual(cfsab.tsub, 5)
> --        self.assertEqual(cfsab.ncall, 2)
> --        self.assertEqual(cfsab.nactualcall, 1)
> --        self.assertEqual(cfsba.ttot, 6)
> --        self.assertEqual(cfsba.tsub, 5)
> --
> --
> --if __name__ =3D=3D '__main__':
> --    #     import sys;sys.argv =3D ['', 'BasicUsage.test_run_as_script']
> --    #     import sys;sys.argv =3D ['', 'MultithreadedScenarios.test_sub=
sequent_profile']
> --    unittest.main()
> -+import os
> -+import sys
> -+import time
> -+import threading
> -+import unittest
> -+import yappi
> -+import _yappi
> -+import tests.utils as utils
> -+import multiprocessing  # added to fix http://bugs.python.org/issue1588=
1 for > Py2.6
> -+import subprocess
> -+
> -+_counter =3D 0
> -+
> -+
> -+class BasicUsage(utils.YappiUnitTestCase):
> -+
> -+    def test_callback_function_int_return_overflow(self):
> -+        # this test is just here to check if any errors are generated, =
as the err
> -+        # is printed in C side, I did not include it here. THere are wa=
ys to test
> -+        # this deterministically, I did not bother
> -+        import ctypes
> -+
> -+        def _unsigned_overflow_margin():
> -+            return 2**(ctypes.sizeof(ctypes.c_void_p) * 8) - 1
> -+
> -+        def foo():
> -+            pass
> -+
> -+        #with utils.captured_output() as (out, err):
> -+        yappi.set_context_id_callback(_unsigned_overflow_margin)
> -+        yappi.set_tag_callback(_unsigned_overflow_margin)
> -+        yappi.start()
> -+        foo()
> -+
> -+    def test_issue60(self):
> -+
> -+        def foo():
> -+            buf =3D bytearray()
> -+            buf +=3D b't' * 200
> -+            view =3D memoryview(buf)[10:]
> -+            view =3D view.tobytes()
> -+            del buf[:10]  # this throws exception
> -+            return view
> -+
> -+        yappi.start(builtins=3DTrue)
> -+        foo()
> -+        self.assertTrue(
> -+            len(
> -+                yappi.get_func_stats(
> -+                    filter_callback=3Dlambda x: yappi.
> -+                    func_matches(x, [memoryview.tobytes])
> -+                )
> -+            ) > 0
> -+        )
> -+        yappi.stop()
> -+
> -+    def test_issue54(self):
> -+
> -+        def _tag_cbk():
> -+            global _counter
> -+            _counter +=3D 1
> -+            return _counter
> -+
> -+        def a():
> -+            pass
> -+
> -+        def b():
> -+            pass
> -+
> -+        yappi.set_tag_callback(_tag_cbk)
> -+        yappi.start()
> -+        a()
> -+        a()
> -+        a()
> -+        yappi.stop()
> -+        stats =3D yappi.get_func_stats()
> -+        self.assertEqual(stats.pop().ncall, 3)  # aggregated if no tag =
is given
> -+        stats =3D yappi.get_func_stats(tag=3D1)
> -+
> -+        for i in range(1, 3):
> -+            stats =3D yappi.get_func_stats(tag=3Di)
> -+            stats =3D yappi.get_func_stats(
> -+                tag=3Di, filter_callback=3Dlambda x: yappi.func_matches=
(x, [a])
> -+            )
> -+
> -+            stat =3D stats.pop()
> -+            self.assertEqual(stat.ncall, 1)
> -+
> -+        yappi.set_tag_callback(None)
> -+        yappi.clear_stats()
> -+        yappi.start()
> -+        b()
> -+        b()
> -+        stats =3D yappi.get_func_stats()
> -+        self.assertEqual(len(stats), 1)
> -+        stat =3D stats.pop()
> -+        self.assertEqual(stat.ncall, 2)
> -+
> -+    def test_filter(self):
> -+
> -+        def a():
> -+            pass
> -+
> -+        def b():
> -+            a()
> -+
> -+        def c():
> -+            b()
> -+
> -+        _TCOUNT =3D 5
> -+
> -+        ts =3D []
> -+        yappi.start()
> -+        for i in range(_TCOUNT):
> -+            t =3D threading.Thread(target=3Dc)
> -+            t.start()
> -+            ts.append(t)
> -+
> -+        for t in ts:
> -+            t.join()
> -+
> -+        yappi.stop()
> -+
> -+        ctx_ids =3D []
> -+        for tstat in yappi.get_thread_stats():
> -+            if tstat.name =3D=3D '_MainThread':
> -+                main_ctx_id =3D tstat.id
> -+            else:
> -+                ctx_ids.append(tstat.id)
> -+
> -+        fstats =3D yappi.get_func_stats(filter=3D{"ctx_id": 9})
> -+        self.assertTrue(fstats.empty())
> -+        fstats =3D yappi.get_func_stats(
> -+            filter=3D{
> -+                "ctx_id": main_ctx_id,
> -+                "name": "c"
> -+            }
> -+        )  # main thread
> -+        self.assertTrue(fstats.empty())
> -+
> -+        for i in ctx_ids:
> -+            fstats =3D yappi.get_func_stats(
> -+                filter=3D{
> -+                    "ctx_id": i,
> -+                    "name": "a",
> -+                    "ncall": 1
> -+                }
> -+            )
> -+            self.assertEqual(fstats.pop().ncall, 1)
> -+            fstats =3D yappi.get_func_stats(filter=3D{"ctx_id": i, "nam=
e": "b"})
> -+            self.assertEqual(fstats.pop().ncall, 1)
> -+            fstats =3D yappi.get_func_stats(filter=3D{"ctx_id": i, "nam=
e": "c"})
> -+            self.assertEqual(fstats.pop().ncall, 1)
> -+
> -+        yappi.clear_stats()
> -+        yappi.start(builtins=3DTrue)
> -+        time.sleep(0.1)
> -+        yappi.stop()
> -+        fstats =3D yappi.get_func_stats(filter=3D{"module": "time"})
> -+        self.assertEqual(len(fstats), 1)
> -+
> -+        # invalid filters`
> -+        self.assertRaises(
> -+            Exception, yappi.get_func_stats, filter=3D{'tag': "sss"}
> -+        )
> -+        self.assertRaises(
> -+            Exception, yappi.get_func_stats, filter=3D{'ctx_id': "None"=
}
> -+        )
> -+
> -+    def test_filter_callback(self):
> -+
> -+        def a():
> -+            time.sleep(0.1)
> -+
> -+        def b():
> -+            a()
> -+
> -+        def c():
> -+            pass
> -+
> -+        def d():
> -+            pass
> -+
> -+        yappi.set_clock_type("wall")
> -+        yappi.start(builtins=3DTrue)
> -+        a()
> -+        b()
> -+        c()
> -+        d()
> -+        stats =3D yappi.get_func_stats(
> -+            filter_callback=3Dlambda x: yappi.func_matches(x, [a, b])
> -+        )
> -+        #stats.print_all()
> -+        r1 =3D '''
> -+        tests/test_functionality.py:98 a      2      0.000000  0.200350=
  0.100175
> -+        tests/test_functionality.py:101 b     1      0.000000  0.120000=
  0.100197
> -+        '''
> -+        self.assert_traces_almost_equal(r1, stats)
> -+        self.assertEqual(len(stats), 2)
> -+        stats =3D yappi.get_func_stats(
> -+            filter_callback=3Dlambda x: yappi.
> -+            module_matches(x, [sys.modules[__name__]])
> -+        )
> -+        r1 =3D '''
> -+        tests/test_functionality.py:98 a      2      0.000000  0.230130=
  0.115065
> -+        tests/test_functionality.py:101 b     1      0.000000  0.120000=
  0.109011
> -+        tests/test_functionality.py:104 c     1      0.000000  0.000002=
  0.000002
> -+        tests/test_functionality.py:107 d     1      0.000000  0.000001=
  0.000001
> -+        '''
> -+        self.assert_traces_almost_equal(r1, stats)
> -+        self.assertEqual(len(stats), 4)
> -+
> -+        stats =3D yappi.get_func_stats(
> -+            filter_callback=3Dlambda x: yappi.func_matches(x, [time.sle=
ep])
> -+        )
> -+        self.assertEqual(len(stats), 1)
> -+        r1 =3D '''
> -+        time.sleep                            2      0.206804  0.220000=
  0.103402
> -+        '''
> -+        self.assert_traces_almost_equal(r1, stats)
> -+
> -+    def test_print_formatting(self):
> -+
> -+        def a():
> -+            pass
> -+
> -+        def b():
> -+            a()
> -+
> -+        func_cols =3D {
> -+            1: ("name", 48),
> -+            0: ("ncall", 5),
> -+            2: ("tsub", 8),
> -+        }
> -+        thread_cols =3D {
> -+            1: ("name", 48),
> -+            0: ("ttot", 8),
> -+        }
> -+
> -+        yappi.start()
> -+        a()
> -+        b()
> -+        yappi.stop()
> -+        fs =3D yappi.get_func_stats()
> -+        cs =3D fs[1].children
> -+        ts =3D yappi.get_thread_stats()
> -+        #fs.print_all(out=3Dsys.stderr, columns=3D{1:("name", 70), })
> -+        #cs.print_all(out=3Dsys.stderr, columns=3Dfunc_cols)
> -+        #ts.print_all(out=3Dsys.stderr, columns=3Dthread_cols)
> -+        #cs.print_all(out=3Dsys.stderr, columns=3D{})
> -+
> -+        self.assertRaises(
> -+            yappi.YappiError, fs.print_all, columns=3D{1: ("namee", 9)}
> -+        )
> -+        self.assertRaises(
> -+            yappi.YappiError, cs.print_all, columns=3D{1: ("dd", 0)}
> -+        )
> -+        self.assertRaises(
> -+            yappi.YappiError, ts.print_all, columns=3D{1: ("tidd", 0)}
> -+        )
> -+
> -+    def test_get_clock(self):
> -+        yappi.set_clock_type('cpu')
> -+        self.assertEqual('cpu', yappi.get_clock_type())
> -+        clock_info =3D yappi.get_clock_info()
> -+        self.assertTrue('api' in clock_info)
> -+        self.assertTrue('resolution' in clock_info)
> -+
> -+        yappi.set_clock_type('wall')
> -+        self.assertEqual('wall', yappi.get_clock_type())
> -+
> -+        t0 =3D yappi.get_clock_time()
> -+        time.sleep(0.1)
> -+        duration =3D yappi.get_clock_time() - t0
> -+        self.assertTrue(0.05 < duration < 0.3)
> -+
> -+    def test_profile_decorator(self):
> -+
> -+        def aggregate(func, stats):
> -+            fname =3D "tests/%s.profile" % (func.__name__)
> -+            try:
> -+                stats.add(fname)
> -+            except IOError:
> -+                pass
> -+            stats.save(fname)
> -+            raise Exception("messing around")
> -+
> -+        @yappi.profile(return_callback=3Daggregate)
> -+        def a(x, y):
> -+            if x + y =3D=3D 25:
> -+                raise Exception("")
> -+            return x + y
> -+
> -+        def b():
> -+            pass
> -+
> -+        try:
> -+            os.remove(
> -+                "tests/a.profile"
> -+            )  # remove the one from prev test, if available
> -+        except:
> -+            pass
> -+
> -+        # global profile is on to mess things up
> -+        yappi.start()
> -+        b()
> -+
> -+        # assert functionality and call function at same time
> -+        try:
> -+            self.assertEqual(a(1, 2), 3)
> -+        except:
> -+            pass
> -+        try:
> -+            self.assertEqual(a(2, 5), 7)
> -+        except:
> -+            pass
> -+        try:
> -+            a(4, 21)
> -+        except:
> -+            pass
> -+        stats =3D yappi.get_func_stats().add("tests/a.profile")
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        self.assertEqual(fsa.ncall, 3)
> -+        self.assertEqual(len(stats), 1)  # b() should be cleared out.
> -+
> -+        @yappi.profile(return_callback=3Daggregate)
> -+        def count_down_rec(n):
> -+            if n =3D=3D 0:
> -+                return
> -+            count_down_rec(n - 1)
> -+
> -+        try:
> -+            os.remove(
> -+                "tests/count_down_rec.profile"
> -+            )  # remove the one from prev test, if available
> -+        except:
> -+            pass
> -+
> -+        try:
> -+            count_down_rec(4)
> -+        except:
> -+            pass
> -+        try:
> -+            count_down_rec(3)
> -+        except:
> -+            pass
> -+
> -+        stats =3D yappi.YFuncStats("tests/count_down_rec.profile")
> -+        fsrec =3D utils.find_stat_by_name(stats, 'count_down_rec')
> -+        self.assertEqual(fsrec.ncall, 9)
> -+        self.assertEqual(fsrec.nactualcall, 2)
> -+
> -+    def test_strip_dirs(self):
> -+
> -+        def a():
> -+            pass
> -+
> -+        stats =3D utils.run_and_get_func_stats(a, )
> -+        stats.strip_dirs()
> -+        fsa =3D utils.find_stat_by_name(stats, "a")
> -+        self.assertEqual(fsa.module, os.path.basename(fsa.module))
> -+
> -+    @unittest.skipIf(os.name =3D=3D "nt", "do not run on Windows")
> -+    def test_run_as_script(self):
> -+        import re
> -+        p =3D subprocess.Popen(
> -+            ['yappi', os.path.join('./tests', 'run_as_script.py')],
> -+            stdout=3Dsubprocess.PIPE
> -+        )
> -+        out, err =3D p.communicate()
> -+        self.assertEqual(p.returncode, 0)
> -+        func_stats, thread_stats =3D re.split(
> -+            b'name\\s+id\\s+tid\\s+ttot\\s+scnt\\s*\n', out
> -+        )
> -+        self.assertTrue(b'FancyThread' in thread_stats)
> -+
> -+    def test_yappi_overhead(self):
> -+        LOOP_COUNT =3D 100000
> -+
> -+        def a():
> -+            pass
> -+
> -+        def b():
> -+            for i in range(LOOP_COUNT):
> -+                a()
> -+
> -+        t0 =3D time.time()
> -+        yappi.start()
> -+        b()
> -+        yappi.stop()
> -+        time_with_yappi =3D time.time() - t0
> -+        t0 =3D time.time()
> -+        b()
> -+        time_without_yappi =3D time.time() - t0
> -+        if time_without_yappi =3D=3D 0:
> -+            time_without_yappi =3D 0.000001
> -+
> -+        # in latest v0.82, I calculated this as close to "7.0" in my ma=
chine.
> -+        # however, %83 of this overhead is coming from tickcount(). The=
 other %17
> -+        # seems to have been evenly distributed to the internal bookkee=
ping
> -+        # structures/algorithms which seems acceptable. Note that our t=
est only
> -+        # tests one function being profiled at-a-time in a short interv=
al.
> -+        # profiling high number of functions in a small time
> -+        # is a different beast, (which is pretty unlikely in most appli=
cations)
> -+        # So as a conclusion: I cannot see any optimization window for =
Yappi that
> -+        # is worth implementing as we will only optimize %17 of the tim=
e.
> -+        sys.stderr.write("\r\nYappi puts %0.1f times overhead to the pr=
ofiled application in average.\r\n" % \
> -+            (time_with_yappi / time_without_yappi))
> -+
> -+    def test_clear_stats_while_running(self):
> -+
> -+        def a():
> -+            pass
> -+
> -+        yappi.start()
> -+        a()
> -+        yappi.clear_stats()
> -+        a()
> -+        stats =3D yappi.get_func_stats()
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        self.assertEqual(fsa.ncall, 1)
> -+
> -+    def test_generator(self):
> -+
> -+        def _gen(n):
> -+            while (n > 0):
> -+                yield n
> -+                n -=3D 1
> -+
> -+        yappi.start()
> -+        for x in _gen(5):
> -+            pass
> -+        self.assertTrue(
> -+            yappi.convert2pstats(yappi.get_func_stats()) is not None
> -+        )
> -+
> -+    def test_slice_child_stats_and_strip_dirs(self):
> -+
> -+        def b():
> -+            for i in range(10000000):
> -+                pass
> -+
> -+        def a():
> -+            b()
> -+
> -+        yappi.start(builtins=3DTrue)
> -+        a()
> -+        stats =3D yappi.get_func_stats()
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        self.assertTrue(fsa.children[0:1] is not None)
> -+        prev_afullname =3D fsa.full_name
> -+        prev_bchildfullname =3D fsa.children[fsb].full_name
> -+        stats.strip_dirs()
> -+        self.assertTrue(len(prev_afullname) > len(fsa.full_name))
> -+        self.assertTrue(
> -+            len(prev_bchildfullname) > len(fsa.children[fsb].full_name)
> -+        )
> -+
> -+    def test_children_stat_functions(self):
> -+        _timings =3D {"a_1": 5, "b_1": 3, "c_1": 1}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        def b():
> -+            pass
> -+
> -+        def c():
> -+            pass
> -+
> -+        def a():
> -+            b()
> -+            c()
> -+
> -+        yappi.start()
> -+        a()
> -+        b()  # non-child call
> -+        c()  # non-child call
> -+        stats =3D yappi.get_func_stats()
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        childs_of_a =3D fsa.children.get().sort("tavg", "desc")
> -+        prev_item =3D None
> -+        for item in childs_of_a:
> -+            if prev_item:
> -+                self.assertTrue(prev_item.tavg > item.tavg)
> -+            prev_item =3D item
> -+        childs_of_a.sort("name", "desc")
> -+        prev_item =3D None
> -+        for item in childs_of_a:
> -+            if prev_item:
> -+                self.assertTrue(prev_item.name > item.name)
> -+            prev_item =3D item
> -+        childs_of_a.clear()
> -+        self.assertTrue(childs_of_a.empty())
> -+
> -+    def test_no_stats_different_clock_type_load(self):
> -+
> -+        def a():
> -+            pass
> -+
> -+        yappi.start()
> -+        a()
> -+        yappi.stop()
> -+        yappi.get_func_stats().save("tests/ystats1.ys")
> -+        yappi.clear_stats()
> -+        yappi.set_clock_type("WALL")
> -+        yappi.start()
> -+        yappi.stop()
> -+        stats =3D yappi.get_func_stats().add("tests/ystats1.ys")
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        self.assertTrue(fsa is not None)
> -+
> -+    def test_subsequent_profile(self):
> -+        _timings =3D {"a_1": 1, "b_1": 1}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        def a():
> -+            pass
> -+
> -+        def b():
> -+            pass
> -+
> -+        yappi.start()
> -+        a()
> -+        yappi.stop()
> -+        yappi.start()
> -+        b()
> -+        yappi.stop()
> -+        stats =3D yappi.get_func_stats()
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        self.assertTrue(fsa is not None)
> -+        self.assertTrue(fsb is not None)
> -+        self.assertEqual(fsa.ttot, 1)
> -+        self.assertEqual(fsb.ttot, 1)
> -+
> -+    def test_lambda(self):
> -+        f =3D lambda: time.sleep(0.3)
> -+        yappi.set_clock_type("wall")
> -+        yappi.start()
> -+        f()
> -+        stats =3D yappi.get_func_stats()
> -+        fsa =3D utils.find_stat_by_name(stats, '<lambda>')
> -+        self.assertTrue(fsa.ttot > 0.1)
> -+
> -+    def test_module_stress(self):
> -+        self.assertEqual(yappi.is_running(), False)
> -+
> -+        yappi.start()
> -+        yappi.clear_stats()
> -+        self.assertRaises(_yappi.error, yappi.set_clock_type, "wall")
> -+
> -+        yappi.stop()
> -+        yappi.clear_stats()
> -+        yappi.set_clock_type("cpu")
> -+        self.assertRaises(yappi.YappiError, yappi.set_clock_type, "dumm=
y")
> -+        self.assertEqual(yappi.is_running(), False)
> -+        yappi.clear_stats()
> -+        yappi.clear_stats()
> -+
> -+    def test_stat_sorting(self):
> -+        _timings =3D {"a_1": 13, "b_1": 10, "a_2": 6, "b_2": 1}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        self._ncall =3D 1
> -+
> -+        def a():
> -+            b()
> -+
> -+        def b():
> -+            if self._ncall =3D=3D 2:
> -+                return
> -+            self._ncall +=3D 1
> -+            a()
> -+
> -+        stats =3D utils.run_and_get_func_stats(a)
> -+        stats =3D stats.sort("totaltime", "desc")
> -+        prev_stat =3D None
> -+        for stat in stats:
> -+            if prev_stat:
> -+                self.assertTrue(prev_stat.ttot >=3D stat.ttot)
> -+            prev_stat =3D stat
> -+        stats =3D stats.sort("totaltime", "asc")
> -+        prev_stat =3D None
> -+        for stat in stats:
> -+            if prev_stat:
> -+                self.assertTrue(prev_stat.ttot <=3D stat.ttot)
> -+            prev_stat =3D stat
> -+        stats =3D stats.sort("avgtime", "asc")
> -+        prev_stat =3D None
> -+        for stat in stats:
> -+            if prev_stat:
> -+                self.assertTrue(prev_stat.tavg <=3D stat.tavg)
> -+            prev_stat =3D stat
> -+        stats =3D stats.sort("name", "asc")
> -+        prev_stat =3D None
> -+        for stat in stats:
> -+            if prev_stat:
> -+                self.assertTrue(prev_stat.name <=3D stat.name)
> -+            prev_stat =3D stat
> -+        stats =3D stats.sort("subtime", "asc")
> -+        prev_stat =3D None
> -+        for stat in stats:
> -+            if prev_stat:
> -+                self.assertTrue(prev_stat.tsub <=3D stat.tsub)
> -+            prev_stat =3D stat
> -+
> -+        self.assertRaises(
> -+            yappi.YappiError, stats.sort, "invalid_func_sorttype_arg"
> -+        )
> -+        self.assertRaises(
> -+            yappi.YappiError, stats.sort, "totaltime",
> -+            "invalid_func_sortorder_arg"
> -+        )
> -+
> -+    def test_start_flags(self):
> -+        self.assertEqual(_yappi._get_start_flags(), None)
> -+        yappi.start()
> -+
> -+        def a():
> -+            pass
> -+
> -+        a()
> -+        self.assertEqual(_yappi._get_start_flags()["profile_builtins"],=
 0)
> -+        self.assertEqual(_yappi._get_start_flags()["profile_multicontex=
t"], 1)
> -+        self.assertEqual(len(yappi.get_thread_stats()), 1)
> -+
> -+    def test_builtin_profiling(self):
> -+
> -+        def a():
> -+            time.sleep(0.4)  # is a builtin function
> -+
> -+        yappi.set_clock_type('wall')
> -+
> -+        yappi.start(builtins=3DTrue)
> -+        a()
> -+        stats =3D yappi.get_func_stats()
> -+        fsa =3D utils.find_stat_by_name(stats, 'sleep')
> -+        self.assertTrue(fsa is not None)
> -+        self.assertTrue(fsa.ttot > 0.3)
> -+        yappi.stop()
> -+        yappi.clear_stats()
> -+
> -+        def a():
> -+            pass
> -+
> -+        yappi.start()
> -+        t =3D threading.Thread(target=3Da)
> -+        t.start()
> -+        t.join()
> -+        stats =3D yappi.get_func_stats()
> -+
> -+    def test_singlethread_profiling(self):
> -+        yappi.set_clock_type('wall')
> -+
> -+        def a():
> -+            time.sleep(0.2)
> -+
> -+        class Worker1(threading.Thread):
> -+
> -+            def a(self):
> -+                time.sleep(0.3)
> -+
> -+            def run(self):
> -+                self.a()
> -+
> -+        yappi.start(profile_threads=3DFalse)
> -+
> -+        c =3D Worker1()
> -+        c.start()
> -+        c.join()
> -+        a()
> -+        stats =3D yappi.get_func_stats()
> -+        fsa1 =3D utils.find_stat_by_name(stats, 'Worker1.a')
> -+        fsa2 =3D utils.find_stat_by_name(stats, 'a')
> -+        self.assertTrue(fsa1 is None)
> -+        self.assertTrue(fsa2 is not None)
> -+        self.assertTrue(fsa2.ttot > 0.1)
> -+
> -+    def test_run(self):
> -+
> -+        def profiled():
> -+            pass
> -+
> -+        yappi.clear_stats()
> -+        try:
> -+            with yappi.run():
> -+                profiled()
> -+            stats =3D yappi.get_func_stats()
> -+        finally:
> -+            yappi.clear_stats()
> -+
> -+        self.assertIsNotNone(utils.find_stat_by_name(stats, 'profiled')=
)
> -+
> -+    def test_run_recursive(self):
> -+
> -+        def profiled():
> -+            pass
> -+
> -+        def not_profiled():
> -+            pass
> -+
> -+        yappi.clear_stats()
> -+        try:
> -+            with yappi.run():
> -+                with yappi.run():
> -+                    profiled()
> -+                # Profiling stopped here
> -+                not_profiled()
> -+            stats =3D yappi.get_func_stats()
> -+        finally:
> -+            yappi.clear_stats()
> -+
> -+        self.assertIsNotNone(utils.find_stat_by_name(stats, 'profiled')=
)
> -+        self.assertIsNone(utils.find_stat_by_name(stats, 'not_profiled'=
))
> -+
> -+
> -+class StatSaveScenarios(utils.YappiUnitTestCase):
> -+
> -+    def test_pstats_conversion(self):
> -+
> -+        def pstat_id(fs):
> -+            return (fs.module, fs.lineno, fs.name)
> -+
> -+        def a():
> -+            d()
> -+
> -+        def b():
> -+            d()
> -+
> -+        def c():
> -+            pass
> -+
> -+        def d():
> -+            pass
> -+
> -+        _timings =3D {"a_1": 12, "b_1": 7, "c_1": 5, "d_1": 2}
> -+        _yappi._set_test_timings(_timings)
> -+        stats =3D utils.run_and_get_func_stats(a, )
> -+        stats.strip_dirs()
> -+        stats.save("tests/a1.pstats", type=3D"pstat")
> -+        fsa_pid =3D pstat_id(utils.find_stat_by_name(stats, "a"))
> -+        fsd_pid =3D pstat_id(utils.find_stat_by_name(stats, "d"))
> -+        yappi.clear_stats()
> -+        _yappi._set_test_timings(_timings)
> -+        stats =3D utils.run_and_get_func_stats(a, )
> -+        stats.strip_dirs()
> -+        stats.save("tests/a2.pstats", type=3D"pstat")
> -+        yappi.clear_stats()
> -+        _yappi._set_test_timings(_timings)
> -+        stats =3D utils.run_and_get_func_stats(b, )
> -+        stats.strip_dirs()
> -+        stats.save("tests/b1.pstats", type=3D"pstat")
> -+        fsb_pid =3D pstat_id(utils.find_stat_by_name(stats, "b"))
> -+        yappi.clear_stats()
> -+        _yappi._set_test_timings(_timings)
> -+        stats =3D utils.run_and_get_func_stats(c, )
> -+        stats.strip_dirs()
> -+        stats.save("tests/c1.pstats", type=3D"pstat")
> -+        fsc_pid =3D pstat_id(utils.find_stat_by_name(stats, "c"))
> -+
> -+        # merge saved stats and check pstats values are correct
> -+        import pstats
> -+        p =3D pstats.Stats(
> -+            'tests/a1.pstats', 'tests/a2.pstats', 'tests/b1.pstats',
> -+            'tests/c1.pstats'
> -+        )
> -+        p.strip_dirs()
> -+        # ct =3D ttot, tt =3D tsub
> -+        (cc, nc, tt, ct, callers) =3D p.stats[fsa_pid]
> -+        self.assertEqual(cc, nc, 2)
> -+        self.assertEqual(tt, 20)
> -+        self.assertEqual(ct, 24)
> -+        (cc, nc, tt, ct, callers) =3D p.stats[fsd_pid]
> -+        self.assertEqual(cc, nc, 3)
> -+        self.assertEqual(tt, 6)
> -+        self.assertEqual(ct, 6)
> -+        self.assertEqual(len(callers), 2)
> -+        (cc, nc, tt, ct) =3D callers[fsa_pid]
> -+        self.assertEqual(cc, nc, 2)
> -+        self.assertEqual(tt, 4)
> -+        self.assertEqual(ct, 4)
> -+        (cc, nc, tt, ct) =3D callers[fsb_pid]
> -+        self.assertEqual(cc, nc, 1)
> -+        self.assertEqual(tt, 2)
> -+        self.assertEqual(ct, 2)
> -+
> -+    def test_merge_stats(self):
> -+        _timings =3D {
> -+            "a_1": 15,
> -+            "b_1": 14,
> -+            "c_1": 12,
> -+            "d_1": 10,
> -+            "e_1": 9,
> -+            "f_1": 7,
> -+            "g_1": 6,
> -+            "h_1": 5,
> -+            "i_1": 1
> -+        }
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        def a():
> -+            b()
> -+
> -+        def b():
> -+            c()
> -+
> -+        def c():
> -+            d()
> -+
> -+        def d():
> -+            e()
> -+
> -+        def e():
> -+            f()
> -+
> -+        def f():
> -+            g()
> -+
> -+        def g():
> -+            h()
> -+
> -+        def h():
> -+            i()
> -+
> -+        def i():
> -+            pass
> -+
> -+        yappi.start()
> -+        a()
> -+        a()
> -+        yappi.stop()
> -+        stats =3D yappi.get_func_stats()
> -+        self.assertRaises(
> -+            NotImplementedError, stats.save, "", "INVALID_SAVE_TYPE"
> -+        )
> -+        stats.save("tests/ystats2.ys")
> -+        yappi.clear_stats()
> -+        _yappi._set_test_timings(_timings)
> -+        yappi.start()
> -+        a()
> -+        stats =3D yappi.get_func_stats().add("tests/ystats2.ys")
> -+        fsa =3D utils.find_stat_by_name(stats, "a")
> -+        fsb =3D utils.find_stat_by_name(stats, "b")
> -+        fsc =3D utils.find_stat_by_name(stats, "c")
> -+        fsd =3D utils.find_stat_by_name(stats, "d")
> -+        fse =3D utils.find_stat_by_name(stats, "e")
> -+        fsf =3D utils.find_stat_by_name(stats, "f")
> -+        fsg =3D utils.find_stat_by_name(stats, "g")
> -+        fsh =3D utils.find_stat_by_name(stats, "h")
> -+        fsi =3D utils.find_stat_by_name(stats, "i")
> -+        self.assertEqual(fsa.ttot, 45)
> -+        self.assertEqual(fsa.ncall, 3)
> -+        self.assertEqual(fsa.nactualcall, 3)
> -+        self.assertEqual(fsa.tsub, 3)
> -+        self.assertEqual(fsa.children[fsb].ttot, fsb.ttot)
> -+        self.assertEqual(fsa.children[fsb].tsub, fsb.tsub)
> -+        self.assertEqual(fsb.children[fsc].ttot, fsc.ttot)
> -+        self.assertEqual(fsb.children[fsc].tsub, fsc.tsub)
> -+        self.assertEqual(fsc.tsub, 6)
> -+        self.assertEqual(fsc.children[fsd].ttot, fsd.ttot)
> -+        self.assertEqual(fsc.children[fsd].tsub, fsd.tsub)
> -+        self.assertEqual(fsd.children[fse].ttot, fse.ttot)
> -+        self.assertEqual(fsd.children[fse].tsub, fse.tsub)
> -+        self.assertEqual(fse.children[fsf].ttot, fsf.ttot)
> -+        self.assertEqual(fse.children[fsf].tsub, fsf.tsub)
> -+        self.assertEqual(fsf.children[fsg].ttot, fsg.ttot)
> -+        self.assertEqual(fsf.children[fsg].tsub, fsg.tsub)
> -+        self.assertEqual(fsg.ttot, 18)
> -+        self.assertEqual(fsg.tsub, 3)
> -+        self.assertEqual(fsg.children[fsh].ttot, fsh.ttot)
> -+        self.assertEqual(fsg.children[fsh].tsub, fsh.tsub)
> -+        self.assertEqual(fsh.ttot, 15)
> -+        self.assertEqual(fsh.tsub, 12)
> -+        self.assertEqual(fsh.tavg, 5)
> -+        self.assertEqual(fsh.children[fsi].ttot, fsi.ttot)
> -+        self.assertEqual(fsh.children[fsi].tsub, fsi.tsub)
> -+        #stats.debug_print()
> -+
> -+    def test_merge_multithreaded_stats(self):
> -+        import _yappi
> -+        timings =3D {"a_1": 2, "b_1": 1}
> -+        _yappi._set_test_timings(timings)
> -+
> -+        def a():
> -+            pass
> -+
> -+        def b():
> -+            pass
> -+
> -+        yappi.start()
> -+        t =3D threading.Thread(target=3Da)
> -+        t.start()
> -+        t.join()
> -+        t =3D threading.Thread(target=3Db)
> -+        t.start()
> -+        t.join()
> -+        yappi.get_func_stats().save("tests/ystats1.ys")
> -+        yappi.clear_stats()
> -+        _yappi._set_test_timings(timings)
> -+        self.assertEqual(len(yappi.get_func_stats()), 0)
> -+        self.assertEqual(len(yappi.get_thread_stats()), 1)
> -+        t =3D threading.Thread(target=3Da)
> -+        t.start()
> -+        t.join()
> -+
> -+        self.assertEqual(_yappi._get_start_flags()["profile_builtins"],=
 0)
> -+        self.assertEqual(_yappi._get_start_flags()["profile_multicontex=
t"], 1)
> -+        yappi.get_func_stats().save("tests/ystats2.ys")
> -+
> -+        stats =3D yappi.YFuncStats([
> -+            "tests/ystats1.ys",
> -+            "tests/ystats2.ys",
> -+        ])
> -+        fsa =3D utils.find_stat_by_name(stats, "a")
> -+        fsb =3D utils.find_stat_by_name(stats, "b")
> -+        self.assertEqual(fsa.ncall, 2)
> -+        self.assertEqual(fsb.ncall, 1)
> -+        self.assertEqual(fsa.tsub, fsa.ttot, 4)
> -+        self.assertEqual(fsb.tsub, fsb.ttot, 1)
> -+
> -+    def test_merge_load_different_clock_types(self):
> -+        yappi.start(builtins=3DTrue)
> -+
> -+        def a():
> -+            b()
> -+
> -+        def b():
> -+            c()
> -+
> -+        def c():
> -+            pass
> -+
> -+        t =3D threading.Thread(target=3Da)
> -+        t.start()
> -+        t.join()
> -+        yappi.get_func_stats().sort("name", "asc").save("tests/ystats1.=
ys")
> -+        yappi.stop()
> -+        yappi.clear_stats()
> -+        yappi.start(builtins=3DFalse)
> -+        t =3D threading.Thread(target=3Da)
> -+        t.start()
> -+        t.join()
> -+        yappi.get_func_stats().save("tests/ystats2.ys")
> -+        yappi.stop()
> -+        self.assertRaises(_yappi.error, yappi.set_clock_type, "wall")
> -+        yappi.clear_stats()
> -+        yappi.set_clock_type("wall")
> -+        yappi.start()
> -+        t =3D threading.Thread(target=3Da)
> -+        t.start()
> -+        t.join()
> -+        yappi.get_func_stats().save("tests/ystats3.ys")
> -+        self.assertRaises(
> -+            yappi.YappiError,
> -+            yappi.YFuncStats().add("tests/ystats1.ys").add, "tests/ysta=
ts3.ys"
> -+        )
> -+        stats =3D yappi.YFuncStats(["tests/ystats1.ys",
> -+                                  "tests/ystats2.ys"]).sort("name")
> -+        fsa =3D utils.find_stat_by_name(stats, "a")
> -+        fsb =3D utils.find_stat_by_name(stats, "b")
> -+        fsc =3D utils.find_stat_by_name(stats, "c")
> -+        self.assertEqual(fsa.ncall, 2)
> -+        self.assertEqual(fsa.ncall, fsb.ncall, fsc.ncall)
> -+
> -+    def test_merge_aabab_aabbc(self):
> -+        _timings =3D {
> -+            "a_1": 15,
> -+            "a_2": 14,
> -+            "b_1": 12,
> -+            "a_3": 10,
> -+            "b_2": 9,
> -+            "c_1": 4
> -+        }
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        def a():
> -+            if self._ncall =3D=3D 1:
> -+                self._ncall +=3D 1
> -+                a()
> -+            elif self._ncall =3D=3D 5:
> -+                self._ncall +=3D 1
> -+                a()
> -+            else:
> -+                b()
> -+
> -+        def b():
> -+            if self._ncall =3D=3D 2:
> -+                self._ncall +=3D 1
> -+                a()
> -+            elif self._ncall =3D=3D 6:
> -+                self._ncall +=3D 1
> -+                b()
> -+            elif self._ncall =3D=3D 7:
> -+                c()
> -+            else:
> -+                return
> -+
> -+        def c():
> -+            pass
> -+
> -+        self._ncall =3D 1
> -+        stats =3D utils.run_and_get_func_stats(a, )
> -+        stats.save("tests/ystats1.ys")
> -+        yappi.clear_stats()
> -+        _yappi._set_test_timings(_timings)
> -+        #stats.print_all()
> -+
> -+        self._ncall =3D 5
> -+        stats =3D utils.run_and_get_func_stats(a, )
> -+        stats.save("tests/ystats2.ys")
> -+
> -+        #stats.print_all()
> -+
> -+        def a():  # same name but another function(code object)
> -+            pass
> -+
> -+        yappi.start()
> -+        a()
> -+        stats =3D yappi.get_func_stats().add(
> -+            ["tests/ystats1.ys", "tests/ystats2.ys"]
> -+        )
> -+        #stats.print_all()
> -+        self.assertEqual(len(stats), 4)
> -+
> -+        fsa =3D None
> -+        for stat in stats:
> -+            if stat.name =3D=3D "a" and stat.ttot =3D=3D 45:
> -+                fsa =3D stat
> -+                break
> -+        self.assertTrue(fsa is not None)
> -+
> -+        self.assertEqual(fsa.ncall, 7)
> -+        self.assertEqual(fsa.nactualcall, 3)
> -+        self.assertEqual(fsa.ttot, 45)
> -+        self.assertEqual(fsa.tsub, 10)
> -+        fsb =3D utils.find_stat_by_name(stats, "b")
> -+        fsc =3D utils.find_stat_by_name(stats, "c")
> -+        self.assertEqual(fsb.ncall, 6)
> -+        self.assertEqual(fsb.nactualcall, 3)
> -+        self.assertEqual(fsb.ttot, 36)
> -+        self.assertEqual(fsb.tsub, 27)
> -+        self.assertEqual(fsb.tavg, 6)
> -+        self.assertEqual(fsc.ttot, 8)
> -+        self.assertEqual(fsc.tsub, 8)
> -+        self.assertEqual(fsc.tavg, 4)
> -+        self.assertEqual(fsc.nactualcall, fsc.ncall, 2)
> -+
> -+
> -+class MultithreadedScenarios(utils.YappiUnitTestCase):
> -+
> -+    def test_issue_32(self):
> -+        '''
> -+        Start yappi from different thread and we get Internal Error(15)=
 as
> -+        the current_ctx_id() called while enumerating the threads in st=
art()
> -+        and as it does not swap to the enumerated ThreadState* the THre=
adState_GetDict()
> -+        returns wrong object and thus sets an invalid id for the _ctx s=
tructure.
> -+
> -+        When this issue happens multiple Threads have same tid as the i=
nternal ts_ptr
> -+        will be same for different contexts. So, let's see if that happ=
ens
> -+        '''
> -+
> -+        def foo():
> -+            time.sleep(0.2)
> -+
> -+        def bar():
> -+            time.sleep(0.1)
> -+
> -+        def thread_func():
> -+            yappi.set_clock_type("wall")
> -+            yappi.start()
> -+
> -+            bar()
> -+
> -+        t =3D threading.Thread(target=3Dthread_func)
> -+        t.start()
> -+        t.join()
> -+
> -+        foo()
> -+
> -+        yappi.stop()
> -+
> -+        thread_ids =3D set()
> -+        for tstat in yappi.get_thread_stats():
> -+            self.assertTrue(tstat.tid not in thread_ids)
> -+            thread_ids.add(tstat.tid)
> -+
> -+    def test_subsequent_profile(self):
> -+        WORKER_COUNT =3D 5
> -+
> -+        def a():
> -+            pass
> -+
> -+        def b():
> -+            pass
> -+
> -+        def c():
> -+            pass
> -+
> -+        _timings =3D {
> -+            "a_1": 3,
> -+            "b_1": 2,
> -+            "c_1": 1,
> -+        }
> -+
> -+        yappi.start()
> -+
> -+        def g():
> -+            pass
> -+
> -+        g()
> -+        yappi.stop()
> -+        yappi.clear_stats()
> -+        _yappi._set_test_timings(_timings)
> -+        yappi.start()
> -+
> -+        _dummy =3D []
> -+        for i in range(WORKER_COUNT):
> -+            t =3D threading.Thread(target=3Da)
> -+            t.start()
> -+            t.join()
> -+        for i in range(WORKER_COUNT):
> -+            t =3D threading.Thread(target=3Db)
> -+            t.start()
> -+            _dummy.append(t)
> -+            t.join()
> -+        for i in range(WORKER_COUNT):
> -+            t =3D threading.Thread(target=3Da)
> -+            t.start()
> -+            t.join()
> -+        for i in range(WORKER_COUNT):
> -+            t =3D threading.Thread(target=3Dc)
> -+            t.start()
> -+            t.join()
> -+        yappi.stop()
> -+        yappi.start()
> -+
> -+        def f():
> -+            pass
> -+
> -+        f()
> -+        stats =3D yappi.get_func_stats()
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        fsc =3D utils.find_stat_by_name(stats, 'c')
> -+        self.assertEqual(fsa.ncall, 10)
> -+        self.assertEqual(fsb.ncall, 5)
> -+        self.assertEqual(fsc.ncall, 5)
> -+        self.assertEqual(fsa.ttot, fsa.tsub, 30)
> -+        self.assertEqual(fsb.ttot, fsb.tsub, 10)
> -+        self.assertEqual(fsc.ttot, fsc.tsub, 5)
> -+
> -+        # MACOSx optimizes by only creating one worker thread
> -+        self.assertTrue(len(yappi.get_thread_stats()) >=3D 2)
> -+
> -+    def test_basic(self):
> -+        yappi.set_clock_type('wall')
> -+
> -+        def dummy():
> -+            pass
> -+
> -+        def a():
> -+            time.sleep(0.2)
> -+
> -+        class Worker1(threading.Thread):
> -+
> -+            def a(self):
> -+                time.sleep(0.3)
> -+
> -+            def run(self):
> -+                self.a()
> -+
> -+        yappi.start(builtins=3DFalse, profile_threads=3DTrue)
> -+
> -+        c =3D Worker1()
> -+        c.start()
> -+        c.join()
> -+        a()
> -+        stats =3D yappi.get_func_stats()
> -+        fsa1 =3D utils.find_stat_by_name(stats, 'Worker1.a')
> -+        fsa2 =3D utils.find_stat_by_name(stats, 'a')
> -+        self.assertTrue(fsa1 is not None)
> -+        self.assertTrue(fsa2 is not None)
> -+        self.assertTrue(fsa1.ttot > 0.2)
> -+        self.assertTrue(fsa2.ttot > 0.1)
> -+        tstats =3D yappi.get_thread_stats()
> -+        self.assertEqual(len(tstats), 2)
> -+        tsa =3D utils.find_stat_by_name(tstats, 'Worker1')
> -+        tsm =3D utils.find_stat_by_name(tstats, '_MainThread')
> -+        dummy()  # call dummy to force ctx name to be retrieved again.
> -+        self.assertTrue(tsa is not None)
> -+        # TODO: I put dummy() to fix below, remove the comments after a=
 while.
> -+        self.assertTrue( # FIX: I see this fails sometimes?
> -+            tsm is not None,
> -+            'Could not find "_MainThread". Found: %s' % (', '.join(util=
s.get_stat_names(tstats))))
> -+
> -+    def test_ctx_stats(self):
> -+        from threading import Thread
> -+        DUMMY_WORKER_COUNT =3D 5
> -+        yappi.start()
> -+
> -+        class DummyThread(Thread):
> -+            pass
> -+
> -+        def dummy():
> -+            pass
> -+
> -+        def dummy_worker():
> -+            pass
> -+
> -+        for i in range(DUMMY_WORKER_COUNT):
> -+            t =3D DummyThread(target=3Ddummy_worker)
> -+            t.start()
> -+            t.join()
> -+        yappi.stop()
> -+        stats =3D yappi.get_thread_stats()
> -+        tsa =3D utils.find_stat_by_name(stats, "DummyThread")
> -+        self.assertTrue(tsa is not None)
> -+        yappi.clear_stats()
> -+        time.sleep(1.0)
> -+        _timings =3D {
> -+            "a_1": 6,
> -+            "b_1": 5,
> -+            "c_1": 3,
> -+            "d_1": 1,
> -+            "a_2": 4,
> -+            "b_2": 3,
> -+            "c_2": 2,
> -+            "d_2": 1
> -+        }
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        class Thread1(Thread):
> -+            pass
> -+
> -+        class Thread2(Thread):
> -+            pass
> -+
> -+        def a():
> -+            b()
> -+
> -+        def b():
> -+            c()
> -+
> -+        def c():
> -+            d()
> -+
> -+        def d():
> -+            time.sleep(0.6)
> -+
> -+        yappi.set_clock_type("wall")
> -+        yappi.start()
> -+        t1 =3D Thread1(target=3Da)
> -+        t1.start()
> -+        t2 =3D Thread2(target=3Da)
> -+        t2.start()
> -+        t1.join()
> -+        t2.join()
> -+        stats =3D yappi.get_thread_stats()
> -+
> -+        # the fist clear_stats clears the context table?
> -+        tsa =3D utils.find_stat_by_name(stats, "DummyThread")
> -+        self.assertTrue(tsa is None)
> -+
> -+        tst1 =3D utils.find_stat_by_name(stats, "Thread1")
> -+        tst2 =3D utils.find_stat_by_name(stats, "Thread2")
> -+        tsmain =3D utils.find_stat_by_name(stats, "_MainThread")
> -+        dummy()  # call dummy to force ctx name to be retrieved again.
> -+        self.assertTrue(len(stats) =3D=3D 3)
> -+        self.assertTrue(tst1 is not None)
> -+        self.assertTrue(tst2 is not None)
> -+        # TODO: I put dummy() to fix below, remove the comments after a=
 while.
> -+        self.assertTrue( # FIX: I see this fails sometimes
> -+            tsmain is not None,
> -+            'Could not find "_MainThread". Found: %s' % (', '.join(util=
s.get_stat_names(stats))))
> -+        self.assertTrue(1.0 > tst2.ttot >=3D 0.5)
> -+        self.assertTrue(1.0 > tst1.ttot >=3D 0.5)
> -+
> -+        # test sorting of the ctx stats
> -+        stats =3D stats.sort("totaltime", "desc")
> -+        prev_stat =3D None
> -+        for stat in stats:
> -+            if prev_stat:
> -+                self.assertTrue(prev_stat.ttot >=3D stat.ttot)
> -+            prev_stat =3D stat
> -+        stats =3D stats.sort("totaltime", "asc")
> -+        prev_stat =3D None
> -+        for stat in stats:
> -+            if prev_stat:
> -+                self.assertTrue(prev_stat.ttot <=3D stat.ttot)
> -+            prev_stat =3D stat
> -+        stats =3D stats.sort("schedcount", "desc")
> -+        prev_stat =3D None
> -+        for stat in stats:
> -+            if prev_stat:
> -+                self.assertTrue(prev_stat.sched_count >=3D stat.sched_c=
ount)
> -+            prev_stat =3D stat
> -+        stats =3D stats.sort("name", "desc")
> -+        prev_stat =3D None
> -+        for stat in stats:
> -+            if prev_stat:
> -+                self.assertTrue(prev_stat.name.lower() >=3D stat.name.l=
ower())
> -+            prev_stat =3D stat
> -+        self.assertRaises(
> -+            yappi.YappiError, stats.sort, "invalid_thread_sorttype_arg"
> -+        )
> -+        self.assertRaises(
> -+            yappi.YappiError, stats.sort, "invalid_thread_sortorder_arg=
"
> -+        )
> -+
> -+    def test_ctx_stats_cpu(self):
> -+
> -+        def get_thread_name():
> -+            try:
> -+                return threading.current_thread().name
> -+            except AttributeError:
> -+                return "Anonymous"
> -+
> -+        def burn_cpu(sec):
> -+            t0 =3D yappi.get_clock_time()
> -+            elapsed =3D 0
> -+            while (elapsed < sec):
> -+                for _ in range(1000):
> -+                    pass
> -+                elapsed =3D yappi.get_clock_time() - t0
> -+
> -+        def test():
> -+
> -+            ts =3D []
> -+            for i in (0.01, 0.05, 0.1):
> -+                t =3D threading.Thread(target=3Dburn_cpu, args=3D(i, ))
> -+                t.name =3D "burn_cpu-%s" % str(i)
> -+                t.start()
> -+                ts.append(t)
> -+            for t in ts:
> -+                t.join()
> -+
> -+        yappi.set_clock_type("cpu")
> -+        yappi.set_context_name_callback(get_thread_name)
> -+
> -+        yappi.start()
> -+
> -+        test()
> -+
> -+        yappi.stop()
> -+
> -+        tstats =3D yappi.get_thread_stats()
> -+        r1 =3D '''
> -+        burn_cpu-0.1      3      123145356058624  0.100105  8
> -+        burn_cpu-0.05     2      123145361313792  0.050149  8
> -+        burn_cpu-0.01     1      123145356058624  0.010127  2
> -+        MainThread        0      4321620864       0.001632  6
> -+        '''
> -+        self.assert_ctx_stats_almost_equal(r1, tstats)
> -+
> -+    def test_producer_consumer_with_queues(self):
> -+        # we currently just stress yappi, no functionality test is done=
 here.
> -+        yappi.start()
> -+        if utils.is_py3x():
> -+            from queue import Queue
> -+        else:
> -+            from Queue import Queue
> -+        from threading import Thread
> -+        WORKER_THREAD_COUNT =3D 50
> -+        WORK_ITEM_COUNT =3D 2000
> -+
> -+        def worker():
> -+            while True:
> -+                item =3D q.get()
> -+                # do the work with item
> -+                q.task_done()
> -+
> -+        q =3D Queue()
> -+        for i in range(WORKER_THREAD_COUNT):
> -+            t =3D Thread(target=3Dworker)
> -+            t.daemon =3D True
> -+            t.start()
> -+
> -+        for item in range(WORK_ITEM_COUNT):
> -+            q.put(item)
> -+        q.join()  # block until all tasks are done
> -+        #yappi.get_func_stats().sort("callcount").print_all()
> -+        yappi.stop()
> -+
> -+    def test_temporary_lock_waiting(self):
> -+        yappi.start()
> -+        _lock =3D threading.Lock()
> -+
> -+        def worker():
> -+            _lock.acquire()
> -+            try:
> -+                time.sleep(1.0)
> -+            finally:
> -+                _lock.release()
> -+
> -+        t1 =3D threading.Thread(target=3Dworker)
> -+        t2 =3D threading.Thread(target=3Dworker)
> -+        t1.start()
> -+        t2.start()
> -+        t1.join()
> -+        t2.join()
> -+        #yappi.get_func_stats().sort("callcount").print_all()
> -+        yappi.stop()
> -+
> -+    @unittest.skipIf(os.name !=3D "posix", "requires Posix compliant OS=
")
> -+    def test_signals_with_blocking_calls(self):
> -+        import signal, os, time
> -+
> -+        # just to verify if signal is handled correctly and stats/yappi=
 are not corrupted.
> -+        def handler(signum, frame):
> -+            raise Exception("Signal handler executed!")
> -+
> -+        yappi.start()
> -+        signal.signal(signal.SIGALRM, handler)
> -+        signal.alarm(1)
> -+        self.assertRaises(Exception, time.sleep, 2)
> -+        stats =3D yappi.get_func_stats()
> -+        fsh =3D utils.find_stat_by_name(stats, "handler")
> -+        self.assertTrue(fsh is not None)
> -+
> -+    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Python=
 3.2")
> -+    def test_concurrent_futures(self):
> -+        yappi.start()
> -+        from concurrent.futures import ThreadPoolExecutor
> -+        with ThreadPoolExecutor(max_workers=3D5) as executor:
> -+            f =3D executor.submit(pow, 5, 2)
> -+            self.assertEqual(f.result(), 25)
> -+        time.sleep(1.0)
> -+        yappi.stop()
> -+
> -+    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Python=
 3.2")
> -+    def test_barrier(self):
> -+        yappi.start()
> -+        b =3D threading.Barrier(2, timeout=3D1)
> -+
> -+        def worker():
> -+            try:
> -+                b.wait()
> -+            except threading.BrokenBarrierError:
> -+                pass
> -+            except Exception:
> -+                raise Exception("BrokenBarrierError not raised")
> -+
> -+        t1 =3D threading.Thread(target=3Dworker)
> -+        t1.start()
> -+        #b.wait()
> -+        t1.join()
> -+        yappi.stop()
> -+
> -+
> -+class NonRecursiveFunctions(utils.YappiUnitTestCase):
> -+
> -+    def test_abcd(self):
> -+        _timings =3D {"a_1": 6, "b_1": 5, "c_1": 3, "d_1": 1}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        def a():
> -+            b()
> -+
> -+        def b():
> -+            c()
> -+
> -+        def c():
> -+            d()
> -+
> -+        def d():
> -+            pass
> -+
> -+        stats =3D utils.run_and_get_func_stats(a)
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        fsc =3D utils.find_stat_by_name(stats, 'c')
> -+        fsd =3D utils.find_stat_by_name(stats, 'd')
> -+        cfsab =3D fsa.children[fsb]
> -+        cfsbc =3D fsb.children[fsc]
> -+        cfscd =3D fsc.children[fsd]
> -+
> -+        self.assertEqual(fsa.ttot, 6)
> -+        self.assertEqual(fsa.tsub, 1)
> -+        self.assertEqual(fsb.ttot, 5)
> -+        self.assertEqual(fsb.tsub, 2)
> -+        self.assertEqual(fsc.ttot, 3)
> -+        self.assertEqual(fsc.tsub, 2)
> -+        self.assertEqual(fsd.ttot, 1)
> -+        self.assertEqual(fsd.tsub, 1)
> -+        self.assertEqual(cfsab.ttot, 5)
> -+        self.assertEqual(cfsab.tsub, 2)
> -+        self.assertEqual(cfsbc.ttot, 3)
> -+        self.assertEqual(cfsbc.tsub, 2)
> -+        self.assertEqual(cfscd.ttot, 1)
> -+        self.assertEqual(cfscd.tsub, 1)
> -+
> -+    def test_stop_in_middle(self):
> -+        _timings =3D {"a_1": 6, "b_1": 4}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        def a():
> -+            b()
> -+            yappi.stop()
> -+
> -+        def b():
> -+            time.sleep(0.2)
> -+
> -+        yappi.start()
> -+        a()
> -+        stats =3D yappi.get_func_stats()
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+
> -+        self.assertEqual(fsa.ncall, 1)
> -+        self.assertEqual(fsa.nactualcall, 0)
> -+        self.assertEqual(fsa.ttot, 0)  # no call_leave called
> -+        self.assertEqual(fsa.tsub, 0)  # no call_leave called
> -+        self.assertEqual(fsb.ttot, 4)
> -+
> -+
> -+class RecursiveFunctions(utils.YappiUnitTestCase):
> -+
> -+    def test_fibonacci(self):
> -+
> -+        def fib(n):
> -+            if n > 1:
> -+                return fib(n - 1) + fib(n - 2)
> -+            else:
> -+                return n
> -+
> -+        stats =3D utils.run_and_get_func_stats(fib, 22)
> -+        fs =3D utils.find_stat_by_name(stats, 'fib')
> -+        self.assertEqual(fs.ncall, 57313)
> -+        self.assertEqual(fs.ttot, fs.tsub)
> -+
> -+    def test_abcadc(self):
> -+        _timings =3D {
> -+            "a_1": 20,
> -+            "b_1": 19,
> -+            "c_1": 17,
> -+            "a_2": 13,
> -+            "d_1": 12,
> -+            "c_2": 10,
> -+            "a_3": 5
> -+        }
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        def a(n):
> -+            if n =3D=3D 3:
> -+                return
> -+            if n =3D=3D 1 + 1:
> -+                d(n)
> -+            else:
> -+                b(n)
> -+
> -+        def b(n):
> -+            c(n)
> -+
> -+        def c(n):
> -+            a(n + 1)
> -+
> -+        def d(n):
> -+            c(n)
> -+
> -+        stats =3D utils.run_and_get_func_stats(a, 1)
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        fsc =3D utils.find_stat_by_name(stats, 'c')
> -+        fsd =3D utils.find_stat_by_name(stats, 'd')
> -+        self.assertEqual(fsa.ncall, 3)
> -+        self.assertEqual(fsa.nactualcall, 1)
> -+        self.assertEqual(fsa.ttot, 20)
> -+        self.assertEqual(fsa.tsub, 7)
> -+        self.assertEqual(fsb.ttot, 19)
> -+        self.assertEqual(fsb.tsub, 2)
> -+        self.assertEqual(fsc.ttot, 17)
> -+        self.assertEqual(fsc.tsub, 9)
> -+        self.assertEqual(fsd.ttot, 12)
> -+        self.assertEqual(fsd.tsub, 2)
> -+        cfsca =3D fsc.children[fsa]
> -+        self.assertEqual(cfsca.nactualcall, 0)
> -+        self.assertEqual(cfsca.ncall, 2)
> -+        self.assertEqual(cfsca.ttot, 13)
> -+        self.assertEqual(cfsca.tsub, 6)
> -+
> -+    def test_aaaa(self):
> -+        _timings =3D {"d_1": 9, "d_2": 7, "d_3": 3, "d_4": 2}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        def d(n):
> -+            if n =3D=3D 3:
> -+                return
> -+            d(n + 1)
> -+
> -+        stats =3D utils.run_and_get_func_stats(d, 0)
> -+        fsd =3D utils.find_stat_by_name(stats, 'd')
> -+        self.assertEqual(fsd.ncall, 4)
> -+        self.assertEqual(fsd.nactualcall, 1)
> -+        self.assertEqual(fsd.ttot, 9)
> -+        self.assertEqual(fsd.tsub, 9)
> -+        cfsdd =3D fsd.children[fsd]
> -+        self.assertEqual(cfsdd.ttot, 7)
> -+        self.assertEqual(cfsdd.tsub, 7)
> -+        self.assertEqual(cfsdd.ncall, 3)
> -+        self.assertEqual(cfsdd.nactualcall, 0)
> -+
> -+    def test_abcabc(self):
> -+        _timings =3D {
> -+            "a_1": 20,
> -+            "b_1": 19,
> -+            "c_1": 17,
> -+            "a_2": 13,
> -+            "b_2": 11,
> -+            "c_2": 9,
> -+            "a_3": 6
> -+        }
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        def a(n):
> -+            if n =3D=3D 3:
> -+                return
> -+            else:
> -+                b(n)
> -+
> -+        def b(n):
> -+            c(n)
> -+
> -+        def c(n):
> -+            a(n + 1)
> -+
> -+        stats =3D utils.run_and_get_func_stats(a, 1)
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        fsc =3D utils.find_stat_by_name(stats, 'c')
> -+        self.assertEqual(fsa.ncall, 3)
> -+        self.assertEqual(fsa.nactualcall, 1)
> -+        self.assertEqual(fsa.ttot, 20)
> -+        self.assertEqual(fsa.tsub, 9)
> -+        self.assertEqual(fsb.ttot, 19)
> -+        self.assertEqual(fsb.tsub, 4)
> -+        self.assertEqual(fsc.ttot, 17)
> -+        self.assertEqual(fsc.tsub, 7)
> -+        cfsab =3D fsa.children[fsb]
> -+        cfsbc =3D fsb.children[fsc]
> -+        cfsca =3D fsc.children[fsa]
> -+        self.assertEqual(cfsab.ttot, 19)
> -+        self.assertEqual(cfsab.tsub, 4)
> -+        self.assertEqual(cfsbc.ttot, 17)
> -+        self.assertEqual(cfsbc.tsub, 7)
> -+        self.assertEqual(cfsca.ttot, 13)
> -+        self.assertEqual(cfsca.tsub, 8)
> -+
> -+    def test_abcbca(self):
> -+        _timings =3D {"a_1": 10, "b_1": 9, "c_1": 7, "b_2": 4, "c_2": 2=
, "a_2": 1}
> -+        _yappi._set_test_timings(_timings)
> -+        self._ncall =3D 1
> -+
> -+        def a():
> -+            if self._ncall =3D=3D 1:
> -+                b()
> -+            else:
> -+                return
> -+
> -+        def b():
> -+            c()
> -+
> -+        def c():
> -+            if self._ncall =3D=3D 1:
> -+                self._ncall +=3D 1
> -+                b()
> -+            else:
> -+                a()
> -+
> -+        stats =3D utils.run_and_get_func_stats(a)
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        fsc =3D utils.find_stat_by_name(stats, 'c')
> -+        cfsab =3D fsa.children[fsb]
> -+        cfsbc =3D fsb.children[fsc]
> -+        cfsca =3D fsc.children[fsa]
> -+        self.assertEqual(fsa.ttot, 10)
> -+        self.assertEqual(fsa.tsub, 2)
> -+        self.assertEqual(fsb.ttot, 9)
> -+        self.assertEqual(fsb.tsub, 4)
> -+        self.assertEqual(fsc.ttot, 7)
> -+        self.assertEqual(fsc.tsub, 4)
> -+        self.assertEqual(cfsab.ttot, 9)
> -+        self.assertEqual(cfsab.tsub, 2)
> -+        self.assertEqual(cfsbc.ttot, 7)
> -+        self.assertEqual(cfsbc.tsub, 4)
> -+        self.assertEqual(cfsca.ttot, 1)
> -+        self.assertEqual(cfsca.tsub, 1)
> -+        self.assertEqual(cfsca.ncall, 1)
> -+        self.assertEqual(cfsca.nactualcall, 0)
> -+
> -+    def test_aabccb(self):
> -+        _timings =3D {
> -+            "a_1": 13,
> -+            "a_2": 11,
> -+            "b_1": 9,
> -+            "c_1": 5,
> -+            "c_2": 3,
> -+            "b_2": 1
> -+        }
> -+        _yappi._set_test_timings(_timings)
> -+        self._ncall =3D 1
> -+
> -+        def a():
> -+            if self._ncall =3D=3D 1:
> -+                self._ncall +=3D 1
> -+                a()
> -+            else:
> -+                b()
> -+
> -+        def b():
> -+            if self._ncall =3D=3D 3:
> -+                return
> -+            else:
> -+                c()
> -+
> -+        def c():
> -+            if self._ncall =3D=3D 2:
> -+                self._ncall +=3D 1
> -+                c()
> -+            else:
> -+                b()
> -+
> -+        stats =3D utils.run_and_get_func_stats(a)
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        fsc =3D utils.find_stat_by_name(stats, 'c')
> -+        cfsaa =3D fsa.children[fsa.index]
> -+        cfsab =3D fsa.children[fsb]
> -+        cfsbc =3D fsb.children[fsc.full_name]
> -+        cfscc =3D fsc.children[fsc]
> -+        cfscb =3D fsc.children[fsb]
> -+        self.assertEqual(fsb.ttot, 9)
> -+        self.assertEqual(fsb.tsub, 5)
> -+        self.assertEqual(cfsbc.ttot, 5)
> -+        self.assertEqual(cfsbc.tsub, 2)
> -+        self.assertEqual(fsa.ttot, 13)
> -+        self.assertEqual(fsa.tsub, 4)
> -+        self.assertEqual(cfsab.ttot, 9)
> -+        self.assertEqual(cfsab.tsub, 4)
> -+        self.assertEqual(cfsaa.ttot, 11)
> -+        self.assertEqual(cfsaa.tsub, 2)
> -+        self.assertEqual(fsc.ttot, 5)
> -+        self.assertEqual(fsc.tsub, 4)
> -+
> -+    def test_abaa(self):
> -+        _timings =3D {"a_1": 13, "b_1": 10, "a_2": 9, "a_3": 5}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        self._ncall =3D 1
> -+
> -+        def a():
> -+            if self._ncall =3D=3D 1:
> -+                b()
> -+            elif self._ncall =3D=3D 2:
> -+                self._ncall +=3D 1
> -+                a()
> -+            else:
> -+                return
> -+
> -+        def b():
> -+            self._ncall +=3D 1
> -+            a()
> -+
> -+        stats =3D utils.run_and_get_func_stats(a)
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        cfsaa =3D fsa.children[fsa]
> -+        cfsba =3D fsb.children[fsa]
> -+        self.assertEqual(fsb.ttot, 10)
> -+        self.assertEqual(fsb.tsub, 1)
> -+        self.assertEqual(fsa.ttot, 13)
> -+        self.assertEqual(fsa.tsub, 12)
> -+        self.assertEqual(cfsaa.ttot, 5)
> -+        self.assertEqual(cfsaa.tsub, 5)
> -+        self.assertEqual(cfsba.ttot, 9)
> -+        self.assertEqual(cfsba.tsub, 4)
> -+
> -+    def test_aabb(self):
> -+        _timings =3D {"a_1": 13, "a_2": 10, "b_1": 9, "b_2": 5}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        self._ncall =3D 1
> -+
> -+        def a():
> -+            if self._ncall =3D=3D 1:
> -+                self._ncall +=3D 1
> -+                a()
> -+            elif self._ncall =3D=3D 2:
> -+                b()
> -+            else:
> -+                return
> -+
> -+        def b():
> -+            if self._ncall =3D=3D 2:
> -+                self._ncall +=3D 1
> -+                b()
> -+            else:
> -+                return
> -+
> -+        stats =3D utils.run_and_get_func_stats(a)
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        cfsaa =3D fsa.children[fsa]
> -+        cfsab =3D fsa.children[fsb]
> -+        cfsbb =3D fsb.children[fsb]
> -+        self.assertEqual(fsa.ttot, 13)
> -+        self.assertEqual(fsa.tsub, 4)
> -+        self.assertEqual(fsb.ttot, 9)
> -+        self.assertEqual(fsb.tsub, 9)
> -+        self.assertEqual(cfsaa.ttot, 10)
> -+        self.assertEqual(cfsaa.tsub, 1)
> -+        self.assertEqual(cfsab.ttot, 9)
> -+        self.assertEqual(cfsab.tsub, 4)
> -+        self.assertEqual(cfsbb.ttot, 5)
> -+        self.assertEqual(cfsbb.tsub, 5)
> -+
> -+    def test_abbb(self):
> -+        _timings =3D {"a_1": 13, "b_1": 10, "b_2": 6, "b_3": 1}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        self._ncall =3D 1
> -+
> -+        def a():
> -+            if self._ncall =3D=3D 1:
> -+                b()
> -+
> -+        def b():
> -+            if self._ncall =3D=3D 3:
> -+                return
> -+            self._ncall +=3D 1
> -+            b()
> -+
> -+        stats =3D utils.run_and_get_func_stats(a)
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        cfsab =3D fsa.children[fsb]
> -+        cfsbb =3D fsb.children[fsb]
> -+        self.assertEqual(fsa.ttot, 13)
> -+        self.assertEqual(fsa.tsub, 3)
> -+        self.assertEqual(fsb.ttot, 10)
> -+        self.assertEqual(fsb.tsub, 10)
> -+        self.assertEqual(fsb.ncall, 3)
> -+        self.assertEqual(fsb.nactualcall, 1)
> -+        self.assertEqual(cfsab.ttot, 10)
> -+        self.assertEqual(cfsab.tsub, 4)
> -+        self.assertEqual(cfsbb.ttot, 6)
> -+        self.assertEqual(cfsbb.tsub, 6)
> -+        self.assertEqual(cfsbb.nactualcall, 0)
> -+        self.assertEqual(cfsbb.ncall, 2)
> -+
> -+    def test_aaab(self):
> -+        _timings =3D {"a_1": 13, "a_2": 10, "a_3": 6, "b_1": 1}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        self._ncall =3D 1
> -+
> -+        def a():
> -+            if self._ncall =3D=3D 3:
> -+                b()
> -+                return
> -+            self._ncall +=3D 1
> -+            a()
> -+
> -+        def b():
> -+            return
> -+
> -+        stats =3D utils.run_and_get_func_stats(a)
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        cfsaa =3D fsa.children[fsa]
> -+        cfsab =3D fsa.children[fsb]
> -+        self.assertEqual(fsa.ttot, 13)
> -+        self.assertEqual(fsa.tsub, 12)
> -+        self.assertEqual(fsb.ttot, 1)
> -+        self.assertEqual(fsb.tsub, 1)
> -+        self.assertEqual(cfsaa.ttot, 10)
> -+        self.assertEqual(cfsaa.tsub, 9)
> -+        self.assertEqual(cfsab.ttot, 1)
> -+        self.assertEqual(cfsab.tsub, 1)
> -+
> -+    def test_abab(self):
> -+        _timings =3D {"a_1": 13, "b_1": 10, "a_2": 6, "b_2": 1}
> -+        _yappi._set_test_timings(_timings)
> -+
> -+        self._ncall =3D 1
> -+
> -+        def a():
> -+            b()
> -+
> -+        def b():
> -+            if self._ncall =3D=3D 2:
> -+                return
> -+            self._ncall +=3D 1
> -+            a()
> -+
> -+        stats =3D utils.run_and_get_func_stats(a)
> -+        fsa =3D utils.find_stat_by_name(stats, 'a')
> -+        fsb =3D utils.find_stat_by_name(stats, 'b')
> -+        cfsab =3D fsa.children[fsb]
> -+        cfsba =3D fsb.children[fsa]
> -+        self.assertEqual(fsa.ttot, 13)
> -+        self.assertEqual(fsa.tsub, 8)
> -+        self.assertEqual(fsb.ttot, 10)
> -+        self.assertEqual(fsb.tsub, 5)
> -+        self.assertEqual(cfsab.ttot, 10)
> -+        self.assertEqual(cfsab.tsub, 5)
> -+        self.assertEqual(cfsab.ncall, 2)
> -+        self.assertEqual(cfsab.nactualcall, 1)
> -+        self.assertEqual(cfsba.ttot, 6)
> -+        self.assertEqual(cfsba.tsub, 5)
> -+
> -+
> -+if __name__ =3D=3D '__main__':
> -+    #     import sys;sys.argv =3D ['', 'BasicUsage.test_run_as_script']
> -+    #     import sys;sys.argv =3D ['', 'MultithreadedScenarios.test_sub=
sequent_profile']
> -+    unittest.main()
> ---- a/tests/test_hooks.py
> -+++ b/tests/test_hooks.py
> -@@ -5,7 +5,7 @@ import unittest
> - import time
> -
> - import yappi
> --import utils
> -+import tests.utils as utils
> -
> -
> - def a():
> ---- a/tests/test_tags.py
> -+++ b/tests/test_tags.py
> -@@ -2,7 +2,7 @@ import unittest
> - import yappi
> - import threading
> - import time
> --from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_=
io
> -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn=
_io
> -
> -
> - class MultiThreadTests(YappiUnitTestCase):
> diff --git a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3=
.11-to-the-setup.patch b/meta-python/recipes-devtools/python/python3-yappi/=
0002-add-3.11-to-the-setup.patch
> deleted file mode 100644
> index d40bd2b7c..000000000
> --- a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-=
the-setup.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 38afdacf526410f970afc58e147c7377c6c7112c Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?S=3DC3=3DBCmer=3D20Cip?=3D <sumer.cip@platform.sh>
> -Date: Fri, 25 Nov 2022 15:58:03 +0300
> -Subject: [PATCH 2/2] add 3.11 to the setup
> -
> ----
> -Upstream-Status: Pending
> -
> - setup.py | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/setup.py b/setup.py
> -index d006787..96e2a66 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -56,6 +56,7 @@ CLASSIFIERS =3D [
> -     'Programming Language :: Python :: 3.8',
> -     'Programming Language :: Python :: 3.9',
> -     'Programming Language :: Python :: 3.10',
> -+    'Programming Language :: Python :: 3.11',
> -     'Programming Language :: Python :: Implementation :: CPython',
> -     'Operating System :: OS Independent',
> -     'Topic :: Software Development :: Libraries',
> ---
> -2.30.2
> -
> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb b=
/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
> index 71e74e86f..435dc11bb 100644
> --- a/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
> @@ -4,13 +4,9 @@ HOMEPAGE =3D "https://github.com/sumerc/yappi"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D71c208c9a4fd864385eb69ad4caa3=
bee"
>
> -SRC_URI[sha256sum] =3D "504b5d8fc7433736cb5e257991d2e7f2946019174f1faec7=
b2fe947881a17fc0"
> +SRC_URI[sha256sum] =3D "a9aaf72009d8c03067294151ee0470ac7a6dfa7b33baab40=
b198d6c1ef00430a"
>
> -SRC_URI +=3D " \
> -    file://run-ptest \
> -    file://0001-Fix-imports-for-ptests.patch \
> -    file://0002-add-3.11-to-the-setup.patch \
> -"
> +SRC_URI +=3D "file://run-ptest"
>
>  inherit pypi setuptools3 ptest
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107753): https://lists.openembedded.org/g/openembedde=
d-devel/message/107753
> Mute This Topic: https://lists.openembedded.org/mt/103319780/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

