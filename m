Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24815C46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 21:23:54 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.110370.1703712226394759784
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 13:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PMOzNiXX;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5e89ba9810aso44261327b3.2
        for <Openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 13:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703712225; x=1704317025; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq+oB9NTkEBMPIztPlS5dGazDqISd6wM8sMi4LVsPsA=;
        b=PMOzNiXXPBOX91iGUe+zt1gZgpLU9L03Z/xVmB9SyHK85qGO1/juyyYQEHsOGyzMHY
         kOPcmScqJlkA/8U/pdq8Ywc4KwEXaPhM2hwmMh99opY7GAgxy3YgrM8qeBHCzQtoagts
         T9KdyHYDkMlX9lEzNfB+9c1wX5WXHCwVrX7HnKz+XXvStUgr5sSm7zvNiYowjvkKGLmo
         kDDsZAzJf07aObNz99dAs9219f+0YuQZVyvQaWNRbIiqTjAK5TK63GkJFwdpIyCeiHfG
         YrQjHysdfOE4GWQQkNA7QHhJOPQuNHrriJxo1sdwgcVVnmrQY3s2Saf5tKp5VyyOY+A1
         f36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703712225; x=1704317025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wq+oB9NTkEBMPIztPlS5dGazDqISd6wM8sMi4LVsPsA=;
        b=nd3Ud7xp4F23GmAIIscf4KafhdDIMMXTDSCEDK4BmFPIQKpNX5Eu+rtytpXT9GxNH9
         EWVXf5RqR1tJ/wTopLoNhQ2tp9jS7Q+svN52Hw6ihALv0QhiZmNhCsqoRj5HSclzYk8Q
         tPfz5b02l/R+mLZfB4P01eSfAPgpw1WoJD7PbufwndldpYwnYJzGi+NcgX6zXPcyWD4H
         a6EG+QnMy+EMl/Jd5k5uxXtE+psG1sGOJyiz5xW6jZZ3AsCk8rYecxf1r/Jwrhn61gtm
         3HM+GvFKMUs/WrIk78QuLEhyMAqy41JKSuraxdQm0Iz+sAw+XQ6yrm1g3TgIZLQxNL68
         bamw==
X-Gm-Message-State: AOJu0YwMvtc8HKPM+vvvE8lKN/I7r81CsW1xXB2wSH7Xl1lIODqAIk5e
	fHYoZEbEQYsWllMZ6TaPTK7jGuoD016Ud3aRZlg=
X-Google-Smtp-Source: AGHT+IHmXJCTLS4imXHl3V22m+tBmZ9b9vZqUp1OI55s4SybZl0RUOqOSUILfRGmlQCavYUmTd5ggub3xoXvynMfR8Q=
X-Received: by 2002:a05:690c:2b13:b0:5eb:199:6251 with SMTP id
 em19-20020a05690c2b1300b005eb01996251mr3305128ywb.82.1703712225230; Wed, 27
 Dec 2023 13:23:45 -0800 (PST)
MIME-Version: 1.0
References: <17A3D724672C20F7.18684@lists.openembedded.org>
In-Reply-To: <17A3D724672C20F7.18684@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 27 Dec 2023 13:23:34 -0800
Message-ID: <CANx9H-ChW547oCmp36u9vOh08BEdiLH6rFu++BuF8EF8kVsfzA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-yappi: upgrade 1.4.0 -> 1.6.0;
 fix ptests
To: Khem Raj <raj.khem@gmail.com>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fc053b060d8469c6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 21:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107870

--000000000000fc053b060d8469c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping. This one supersedes the on from Alex, since it fixes the
priests.

On Sun, Dec 24, 2023 at 10:13=E2=80=AFAM Tim Orling via lists.openembedded.=
org
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

> * Switch to the python_setuptools_build_meta PEP-517 backend
> * Refactor and submit 0001-Fix-imports-for-ptests.patch
>   - split out the Windows -> Unix line endings conversion
>   - https://github.com/sumerc/yappi/pull/164
> * Drop 0002-add-3.11-to-the-setup.patch; upstream added 3.11 and 3.12
> * Drop install of yappi.py in ptest; use site-packages as intended
> * Drop complex run-ptest and simply run 'pytest --automake'
> * Move out of "problems" group to "slow" group in
> ptest-packageslists-meta-python.inc
>   - can now build meta-python-image-ptest-python3-yappi
>   - tests take about 45 seconds
>
> https://github.com/sumerc/yappi/blob/1.6.0/CHANGELOG
>
> 1.6.0 (2023-12-07)
>
> - Drop support 2.7-3.5 and clean backward compatible code (pull/152)
> - Add Python 3.12 wheels
>
> 1.5.1 (2023-12-06)
>
> - Add support for Python 3.12
> - Fix child callgrind functions disappear
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
> All tests pass on qemux86-64
> Upstream GitHub Actions CI also passed with submitted patches
>
>  .../ptest-packagelists-meta-python.inc        |   2 +-
>  ...nality-convert-line-endings-to-Unix.patch} | 120 +++++-------------
>  ...port-of-tests.utils-to-enable-pytest.patch | 101 +++++++++++++++
>  .../0002-add-3.11-to-the-setup.patch          |  26 ----
>  .../python/python3-yappi/run-ptest            |   2 +-
>  .../python/python3-yappi_1.4.0.bb             |  36 ------
>  .../python/python3-yappi_1.6.0.bb             |  37 ++++++
>  7 files changed, 175 insertions(+), 149 deletions(-)
>  rename
> meta-python/recipes-devtools/python/python3-yappi/{0001-Fix-imports-for-p=
tests.patch
> =3D> 0001-test_functionality-convert-line-endings-to-Unix.patch} (95%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-test=
s.utils-to-enable-pytest.patch
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-se=
tup.patch
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-yappi_1.4.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-yappi_1.6.0.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 3272d98192..e1732c6177 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -54,6 +54,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>
>  PTESTS_SLOW_META_PYTHON =3D "\
>      python3-lz4 \
> +    python3-yappi \
>  "
>
>  PTESTS_PROBLEMS_META_PYTHON =3D"\
> @@ -82,6 +83,5 @@ PTESTS_PROBLEMS_META_PYTHON =3D"\
>      python3-whoosh \
>      python3-ujson \
>      python3-xlrd \
> -    python3-yappi \
>      python3-yarl \
>  "
> diff --git
> a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-=
ptests.patch
> b/meta-python/recipes-devtools/python/python3-yappi/0001-test_functionali=
ty-convert-line-endings-to-Unix.patch
> similarity index 95%
> rename from
> meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-pt=
ests.patch
> rename to
> meta-python/recipes-devtools/python/python3-yappi/0001-test_functionality=
-convert-line-endings-to-Unix.patch
> index 476db4b7d0..70d4607c29 100644
> ---
> a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-=
ptests.patch
> +++
> b/meta-python/recipes-devtools/python/python3-yappi/0001-test_functionali=
ty-convert-line-endings-to-Unix.patch
> @@ -1,44 +1,23 @@
> -From 0dedc1c573ddc4e87475eb03c64555cd54a72e92 Mon Sep 17 00:00:00 2001
> -From: Trevor Gamblin <trevor.gamblin@windriver.com>
> -Date: Mon, 7 Jun 2021 09:40:20 -0400
> -Subject: [PATCH] Fix imports for tests
> +From 0136ca731cba8b056b3f2ff0e7df3953b94f1e87 Mon Sep 17 00:00:00 2001
> +From: Tim Orling <tim.orling@konsulko.com>
> +Date: Sun, 24 Dec 2023 09:41:57 -0800
> +Subject: [PATCH 1/2] test_functionality: convert line endings to Unix
>
> -Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ----
> -Upstream-Status: Pending
> +Convert the Windows line endings with dos2unix to be like the
> +other files in tests/*
> +
> +Upstream-Status: Submitted [https://github.com/sumerc/yappi/pull/164]
>
> - tests/test_asyncio.py              | 2 +-
> - tests/test_asyncio_context_vars.py | 2 +-
> - tests/test_functionality.py        | 2 +-
> - tests/test_hooks.py                | 2 +-
> - tests/test_tags.py                 | 2 +-
> - 5 files changed, 6 insertions(+), 6 deletions(-)
> +Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> +---
> + tests/test_functionality.py | 3822 +++++++++++++++++------------------
> + 1 file changed, 1911 insertions(+), 1911 deletions(-)
>
> ---- a/tests/test_asyncio.py
> -+++ b/tests/test_asyncio.py
> -@@ -2,7 +2,7 @@ import unittest
> - import yappi
> - import asyncio
> - import threading
> --from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_=
io
> -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
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
> +diff --git a/tests/test_functionality.py b/tests/test_functionality.py
> +index 0e99c47..38bbe67 100644
>  --- a/tests/test_functionality.py
>  +++ b/tests/test_functionality.py
> -@@ -1,1916 +1,1916 @@
> +@@ -1,1911 +1,1911 @@
>  -import os
>  -import sys
>  -import time
> @@ -47,7 +26,7 @@ Upstream-Status: Pending
>  -import yappi
>  -import _yappi
>  -import utils
> --import multiprocessing  # added to fix http://bugs.python.org/issue1588=
1
> for > Py2.6
> +-import multiprocessing
>  -import subprocess
>  -
>  -_counter =3D 0
> @@ -318,10 +297,10 @@ Upstream-Status: Pending
>  -    def test_profile_decorator(self):
>  -
>  -        def aggregate(func, stats):
> --            fname =3D "tests/%s.profile" % (func.__name__)
> +-            fname =3D f"tests/{func.__name__}.profile"
>  -            try:
>  -                stats.add(fname)
> --            except IOError:
> +-            except OSError:
>  -                pass
>  -            stats.save(fname)
>  -            raise Exception("messing around")
> @@ -1232,7 +1211,7 @@ Upstream-Status: Pending
>  -        # TODO: I put dummy() to fix below, remove the comments after a
> while.
>  -        self.assertTrue( # FIX: I see this fails sometimes?
>  -            tsm is not None,
> --            'Could not find "_MainThread". Found: %s' % (',
> '.join(utils.get_stat_names(tstats))))
> +-            f"Could not find \"_MainThread\". Found: {',
> '.join(utils.get_stat_names(tstats))}")
>  -
>  -    def test_ctx_stats(self):
>  -        from threading import Thread
> @@ -1312,7 +1291,7 @@ Upstream-Status: Pending
>  -        # TODO: I put dummy() to fix below, remove the comments after a
> while.
>  -        self.assertTrue( # FIX: I see this fails sometimes
>  -            tsmain is not None,
> --            'Could not find "_MainThread". Found: %s' % (',
> '.join(utils.get_stat_names(stats))))
> +-            f"Could not find \"_MainThread\". Found: {',
> '.join(utils.get_stat_names(stats))}")
>  -        self.assertTrue(1.0 > tst2.ttot >=3D 0.5)
>  -        self.assertTrue(1.0 > tst1.ttot >=3D 0.5)
>  -
> @@ -1369,7 +1348,7 @@ Upstream-Status: Pending
>  -            ts =3D []
>  -            for i in (0.01, 0.05, 0.1):
>  -                t =3D threading.Thread(target=3Dburn_cpu, args=3D(i, ))
> --                t.name =3D "burn_cpu-%s" % str(i)
> +-                t.name =3D f"burn_cpu-{str(i)}"
>  -                t.start()
>  -                ts.append(t)
>  -            for t in ts:
> @@ -1396,10 +1375,7 @@ Upstream-Status: Pending
>  -    def test_producer_consumer_with_queues(self):
>  -        # we currently just stress yappi, no functionality test is done
> here.
>  -        yappi.start()
> --        if utils.is_py3x():
> --            from queue import Queue
> --        else:
> --            from Queue import Queue
> +-        from queue import Queue
>  -        from threading import Thread
>  -        WORKER_THREAD_COUNT =3D 50
>  -        WORK_ITEM_COUNT =3D 2000
> @@ -1458,7 +1434,6 @@ Upstream-Status: Pending
>  -        fsh =3D utils.find_stat_by_name(stats, "handler")
>  -        self.assertTrue(fsh is not None)
>  -
> --    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Python
> 3.2")
>  -    def test_concurrent_futures(self):
>  -        yappi.start()
>  -        from concurrent.futures import ThreadPoolExecutor
> @@ -1468,7 +1443,6 @@ Upstream-Status: Pending
>  -        time.sleep(1.0)
>  -        yappi.stop()
>  -
> --    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Python
> 3.2")
>  -    def test_barrier(self):
>  -        yappi.start()
>  -        b =3D threading.Barrier(2, timeout=3D1)
> @@ -1962,8 +1936,8 @@ Upstream-Status: Pending
>  +import unittest
>  +import yappi
>  +import _yappi
> -+import tests.utils as utils
> -+import multiprocessing  # added to fix http://bugs.python.org/issue1588=
1
> for > Py2.6
> ++import utils
> ++import multiprocessing
>  +import subprocess
>  +
>  +_counter =3D 0
> @@ -2234,10 +2208,10 @@ Upstream-Status: Pending
>  +    def test_profile_decorator(self):
>  +
>  +        def aggregate(func, stats):
> -+            fname =3D "tests/%s.profile" % (func.__name__)
> ++            fname =3D f"tests/{func.__name__}.profile"
>  +            try:
>  +                stats.add(fname)
> -+            except IOError:
> ++            except OSError:
>  +                pass
>  +            stats.save(fname)
>  +            raise Exception("messing around")
> @@ -3007,8 +2981,8 @@ Upstream-Status: Pending
>  +
>  +    def test_issue_32(self):
>  +        '''
> -+        Start yappi from different thread and we get Internal Error(15)
> as
> -+        the current_ctx_id() called while enumerating the threads in
> start()
> ++        Start yappi from different thread and we get Internal Error(15)
> as
> ++        the current_ctx_id() called while enumerating the threads in
> start()
>  +        and as it does not swap to the enumerated ThreadState* the
> THreadState_GetDict()
>  +        returns wrong object and thus sets an invalid id for the _ctx
> structure.
>  +
> @@ -3148,7 +3122,7 @@ Upstream-Status: Pending
>  +        # TODO: I put dummy() to fix below, remove the comments after a
> while.
>  +        self.assertTrue( # FIX: I see this fails sometimes?
>  +            tsm is not None,
> -+            'Could not find "_MainThread". Found: %s' % (',
> '.join(utils.get_stat_names(tstats))))
> ++            f"Could not find \"_MainThread\". Found: {',
> '.join(utils.get_stat_names(tstats))}")
>  +
>  +    def test_ctx_stats(self):
>  +        from threading import Thread
> @@ -3228,7 +3202,7 @@ Upstream-Status: Pending
>  +        # TODO: I put dummy() to fix below, remove the comments after a
> while.
>  +        self.assertTrue( # FIX: I see this fails sometimes
>  +            tsmain is not None,
> -+            'Could not find "_MainThread". Found: %s' % (',
> '.join(utils.get_stat_names(stats))))
> ++            f"Could not find \"_MainThread\". Found: {',
> '.join(utils.get_stat_names(stats))}")
>  +        self.assertTrue(1.0 > tst2.ttot >=3D 0.5)
>  +        self.assertTrue(1.0 > tst1.ttot >=3D 0.5)
>  +
> @@ -3285,7 +3259,7 @@ Upstream-Status: Pending
>  +            ts =3D []
>  +            for i in (0.01, 0.05, 0.1):
>  +                t =3D threading.Thread(target=3Dburn_cpu, args=3D(i, ))
> -+                t.name =3D "burn_cpu-%s" % str(i)
> ++                t.name =3D f"burn_cpu-{str(i)}"
>  +                t.start()
>  +                ts.append(t)
>  +            for t in ts:
> @@ -3312,10 +3286,7 @@ Upstream-Status: Pending
>  +    def test_producer_consumer_with_queues(self):
>  +        # we currently just stress yappi, no functionality test is done
> here.
>  +        yappi.start()
> -+        if utils.is_py3x():
> -+            from queue import Queue
> -+        else:
> -+            from Queue import Queue
> ++        from queue import Queue
>  +        from threading import Thread
>  +        WORKER_THREAD_COUNT =3D 50
>  +        WORK_ITEM_COUNT =3D 2000
> @@ -3374,7 +3345,6 @@ Upstream-Status: Pending
>  +        fsh =3D utils.find_stat_by_name(stats, "handler")
>  +        self.assertTrue(fsh is not None)
>  +
> -+    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Python
> 3.2")
>  +    def test_concurrent_futures(self):
>  +        yappi.start()
>  +        from concurrent.futures import ThreadPoolExecutor
> @@ -3384,7 +3354,6 @@ Upstream-Status: Pending
>  +        time.sleep(1.0)
>  +        yappi.stop()
>  +
> -+    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Python
> 3.2")
>  +    def test_barrier(self):
>  +        yappi.start()
>  +        b =3D threading.Barrier(2, timeout=3D1)
> @@ -3871,25 +3840,6 @@ Upstream-Status: Pending
>  +    #     import sys;sys.argv =3D ['', 'BasicUsage.test_run_as_script']
>  +    #     import sys;sys.argv =3D ['',
> 'MultithreadedScenarios.test_subsequent_profile']
>  +    unittest.main()
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
> -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> -
> -
> - class MultiThreadTests(YappiUnitTestCase):
> +--
> +2.34.1
> +
> diff --git
> a/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-te=
sts.utils-to-enable-pytest.patch
> b/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-te=
sts.utils-to-enable-pytest.patch
> new file mode 100644
> index 0000000000..96dd024125
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-te=
sts.utils-to-enable-pytest.patch
> @@ -0,0 +1,101 @@
> +From 28eac38566327091221aabbc164ea8e433c66e7e Mon Sep 17 00:00:00 2001
> +From: Tim Orling <tim.orling@konsulko.com>
> +Date: Sun, 24 Dec 2023 09:27:50 -0800
> +Subject: [PATCH 2/2] Fix import of tests.utils to enable pytest
> +
> +Running the test cases with pytest leads to importlib errors
> +because the "utils" module cannot be found.
> +
> +Upstream-Status: Submitted [https://github.com/sumerc/yappi/pull/164]
> +
> +Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> +---
> + tests/test_asyncio.py              | 2 +-
> + tests/test_asyncio_context_vars.py | 2 +-
> + tests/test_functionality.py        | 2 +-
> + tests/test_gevent.py               | 2 +-
> + tests/test_hooks.py                | 2 +-
> + tests/test_tags.py                 | 2 +-
> + 6 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/tests/test_asyncio.py b/tests/test_asyncio.py
> +index 8e9e631..bb36f4a 100644
> +--- a/tests/test_asyncio.py
> ++++ b/tests/test_asyncio.py
> +@@ -2,7 +2,7 @@ import unittest
> + import yappi
> + import asyncio
> + import threading
> +-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_=
io
> ++from tests.utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> +
> +
> + async def async_sleep(sec):
> +diff --git a/tests/test_asyncio_context_vars.py
> b/tests/test_asyncio_context_vars.py
> +index 5bd750c..9a253c0 100644
> +--- a/tests/test_asyncio_context_vars.py
> ++++ b/tests/test_asyncio_context_vars.py
> +@@ -5,7 +5,7 @@ import contextvars
> + import functools
> + import time
> + import os
> +-import utils
> ++import tests.utils as utils
> + import yappi
> +
> + async_context_id =3D contextvars.ContextVar('async_context_id')
> +diff --git a/tests/test_functionality.py b/tests/test_functionality.py
> +index 38bbe67..8098f17 100644
> +--- a/tests/test_functionality.py
> ++++ b/tests/test_functionality.py
> +@@ -5,7 +5,7 @@ import threading
> + import unittest
> + import yappi
> + import _yappi
> +-import utils
> ++import tests.utils as utils
> + import multiprocessing
> + import subprocess
> +
> +diff --git a/tests/test_gevent.py b/tests/test_gevent.py
> +index ed9e6ae..502af5f 100644
> +--- a/tests/test_gevent.py
> ++++ b/tests/test_gevent.py
> +@@ -2,7 +2,7 @@ import unittest
> + import _yappi
> + import yappi
> + import threading
> +-from utils import (
> ++from tests.utils import (
> +     YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io,
> burn_io_gevent
> + )
> +
> +diff --git a/tests/test_hooks.py b/tests/test_hooks.py
> +index 297c643..8c387fc 100644
> +--- a/tests/test_hooks.py
> ++++ b/tests/test_hooks.py
> +@@ -5,7 +5,7 @@ import unittest
> + import time
> +
> + import yappi
> +-import utils
> ++import tests.utils as utils
> +
> +
> + def a():
> +diff --git a/tests/test_tags.py b/tests/test_tags.py
> +index b0b531d..b5a4016 100644
> +--- a/tests/test_tags.py
> ++++ b/tests/test_tags.py
> +@@ -2,7 +2,7 @@ import unittest
> + import yappi
> + import threading
> + import time
> +-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_=
io
> ++from tests.utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> +
> +
> + class MultiThreadTests(YappiUnitTestCase):
> +--
> +2.34.1
> +
> diff --git
> a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-=
setup.patch
> b/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-=
setup.patch
> deleted file mode 100644
> index d40bd2b7cc..0000000000
> ---
> a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-=
setup.patch
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
> diff --git a/meta-python/recipes-devtools/python/python3-yappi/run-ptest
> b/meta-python/recipes-devtools/python/python3-yappi/run-ptest
> index 3385d68939..8d2017d39c 100644
> --- a/meta-python/recipes-devtools/python/python3-yappi/run-ptest
> +++ b/meta-python/recipes-devtools/python/python3-yappi/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/sh
>
> -pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'|
> sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e
> 's/SKIPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=
=3D"SKIP" ||
> $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{pri=
nt}}'| awk
> '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"=
XFAIL" ||
> $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> +pytest --automake
> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
> b/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
> deleted file mode 100644
> index 71e74e86f2..0000000000
> --- a/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -SUMMARY  =3D "Yet Another Python Profiler"
> -HOMEPAGE =3D "https://github.com/sumerc/yappi"
> -
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D71c208c9a4fd864385eb69ad4caa3=
bee"
> -
> -SRC_URI[sha256sum] =3D
> "504b5d8fc7433736cb5e257991d2e7f2946019174f1faec7b2fe947881a17fc0"
> -
> -SRC_URI +=3D " \
> -    file://run-ptest \
> -    file://0001-Fix-imports-for-ptests.patch \
> -    file://0002-add-3.11-to-the-setup.patch \
> -"
> -
> -inherit pypi setuptools3 ptest
> -
> -RDEPENDS:${PN} +=3D "\
> -    ${PYTHON_PN}-datetime \
> -    ${PYTHON_PN}-pickle \
> -    ${PYTHON_PN}-threading \
> -"
> -
> -RDEPENDS:${PN}-ptest +=3D " \
> -    ${PYTHON_PN}-gevent \
> -    ${PYTHON_PN}-multiprocessing \
> -    ${PYTHON_PN}-pytest \
> -    ${PYTHON_PN}-profile \
> -    ${PYTHON_PN}-zopeinterface \
> -"
> -
> -do_install_ptest() {
> -    install -d ${D}${PTEST_PATH}/tests
> -    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -    cp -f ${S}/yappi/yappi.py ${D}/${PTEST_PATH}/
> -}
> -
> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
> b/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
> new file mode 100644
> index 0000000000..4349cab1e7
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
> @@ -0,0 +1,37 @@
> +SUMMARY  =3D "Yet Another Python Profiler"
> +HOMEPAGE =3D "https://github.com/sumerc/yappi"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D71c208c9a4fd864385eb69ad4caa3=
bee"
> +
> +SRC_URI[sha256sum] =3D
> "a9aaf72009d8c03067294151ee0470ac7a6dfa7b33baab40b198d6c1ef00430a"
> +
> +SRC_URI +=3D " \
> +    file://run-ptest \
> +    file://0001-test_functionality-convert-line-endings-to-Unix.patch \
> +    file://0002-Fix-import-of-tests.utils-to-enable-pytest.patch \
> +"
> +
> +inherit pypi python_setuptools_build_meta ptest
> +
> +RDEPENDS:${PN} +=3D "\
> +    python3-datetime \
> +    python3-pickle \
> +    python3-threading \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    python3-gevent \
> +    python3-multiprocessing \
> +    python3-pytest \
> +    python3-profile \
> +    python3-unittest-automake-output \
> +    python3-zopeinterface \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests ${D}${PTEST_PATH}
> +    cp -f ${S}/run_tests.py ${D}${PTEST_PATH}
> +}
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107782):
> https://lists.openembedded.org/g/openembedded-devel/message/107782
> Mute This Topic: https://lists.openembedded.org/mt/103350816/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fc053b060d8469c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Gentle ping. This one supersedes the on from Alex, since =
it fixes the priests.</div><div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, Dec 24, 2023 at 10:13=E2=80=AFAM Tim Orli=
ng via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a>=
 &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">* Switch=
 to the python_setuptools_build_meta PEP-517 backend<br>
* Refactor and submit 0001-Fix-imports-for-ptests.patch<br>
=C2=A0 - split out the Windows -&gt; Unix line endings conversion<br>
=C2=A0 - <a href=3D"https://github.com/sumerc/yappi/pull/164" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/sumerc/yappi/pull/164</a><br>
* Drop 0002-add-3.11-to-the-setup.patch; upstream added 3.11 and 3.12<br>
* Drop install of yappi.py in ptest; use site-packages as intended<br>
* Drop complex run-ptest and simply run &#39;pytest --automake&#39;<br>
* Move out of &quot;problems&quot; group to &quot;slow&quot; group in ptest=
-packageslists-meta-python.inc<br>
=C2=A0 - can now build meta-python-image-ptest-python3-yappi<br>
=C2=A0 - tests take about 45 seconds<br>
<br>
<a href=3D"https://github.com/sumerc/yappi/blob/1.6.0/CHANGELOG" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/sumerc/yappi/blob/1.6.0/CHANG=
ELOG</a><br>
<br>
1.6.0 (2023-12-07)<br>
<br>
- Drop support 2.7-3.5 and clean backward compatible code (pull/152)<br>
- Add Python 3.12 wheels<br>
<br>
1.5.1 (2023-12-06)<br>
<br>
- Add support for Python 3.12<br>
- Fix child callgrind functions disappear<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
---<br>
All tests pass on qemux86-64<br>
Upstream GitHub Actions CI also passed with submitted patches<br>
<br>
=C2=A0.../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0...nality-convert-line-endings-to-Unix.patch} | 120 +++++------------=
-<br>
=C2=A0...port-of-tests.utils-to-enable-pytest.patch | 101 +++++++++++++++<b=
r>
=C2=A0.../0002-add-3.11-to-the-setup.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 26 ----<br>
=C2=A0.../python/python3-yappi/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-yappi_1.4.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-yappi_1.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 36 ------<br>
=C2=A0.../python/<a href=3D"http://python3-yappi_1.6.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-yappi_1.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 37 ++++++<br>
=C2=A07 files changed, 175 insertions(+), 149 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/python3-yappi/{0001-Fix-im=
ports-for-ptests.patch =3D&gt; 0001-test_functionality-convert-line-endings=
-to-Unix.patch} (95%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-yappi/=
0002-Fix-import-of-tests.utils-to-enable-pytest.patch<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-yappi/=
0002-add-3.11-to-the-setup.patch<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-yappi_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ya=
ppi_1.4.0.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-yappi_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-ya=
ppi_1.6.0.bb</a><br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index 3272d98192..e1732c6177 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -54,6 +54,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
<br>
=C2=A0PTESTS_SLOW_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-lz4 \<br>
+=C2=A0 =C2=A0 python3-yappi \<br>
=C2=A0&quot;<br>
<br>
=C2=A0PTESTS_PROBLEMS_META_PYTHON =3D&quot;\<br>
@@ -82,6 +83,5 @@ PTESTS_PROBLEMS_META_PYTHON =3D&quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-whoosh \<br>
=C2=A0 =C2=A0 =C2=A0python3-ujson \<br>
=C2=A0 =C2=A0 =C2=A0python3-xlrd \<br>
-=C2=A0 =C2=A0 python3-yappi \<br>
=C2=A0 =C2=A0 =C2=A0python3-yarl \<br>
=C2=A0&quot;<br>
diff --git a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imp=
orts-for-ptests.patch b/meta-python/recipes-devtools/python/python3-yappi/0=
001-test_functionality-convert-line-endings-to-Unix.patch<br>
similarity index 95%<br>
rename from meta-python/recipes-devtools/python/python3-yappi/0001-Fix-impo=
rts-for-ptests.patch<br>
rename to meta-python/recipes-devtools/python/python3-yappi/0001-test_funct=
ionality-convert-line-endings-to-Unix.patch<br>
index 476db4b7d0..70d4607c29 100644<br>
--- a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-fo=
r-ptests.patch<br>
+++ b/meta-python/recipes-devtools/python/python3-yappi/0001-test_functiona=
lity-convert-line-endings-to-Unix.patch<br>
@@ -1,44 +1,23 @@<br>
-From 0dedc1c573ddc4e87475eb03c64555cd54a72e92 Mon Sep 17 00:00:00 2001<br>
-From: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" t=
arget=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
-Date: Mon, 7 Jun 2021 09:40:20 -0400<br>
-Subject: [PATCH] Fix imports for tests<br>
+From 0136ca731cba8b056b3f2ff0e7df3953b94f1e87 Mon Sep 17 00:00:00 2001<br>
+From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"=
_blank">tim.orling@konsulko.com</a>&gt;<br>
+Date: Sun, 24 Dec 2023 09:41:57 -0800<br>
+Subject: [PATCH 1/2] test_functionality: convert line endings to Unix<br>
<br>
-Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriv=
er.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
+Convert the Windows line endings with dos2unix to be like the<br>
+other files in tests/*<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/sumerc/yappi/pul=
l/164" rel=3D"noreferrer" target=3D"_blank">https://github.com/sumerc/yappi=
/pull/164</a>]<br>
<br>
- tests/test_asyncio.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
 +-<br>
- tests/test_asyncio_context_vars.py | 2 +-<br>
- tests/test_functionality.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- tests/test_hooks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
- tests/test_tags.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 2 +-<br>
- 5 files changed, 6 insertions(+), 6 deletions(-)<br>
+Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" t=
arget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
+---<br>
+ tests/test_functionality.py | 3822 +++++++++++++++++------------------<br=
>
+ 1 file changed, 1911 insertions(+), 1911 deletions(-)<br>
<br>
---- a/tests/test_asyncio.py<br>
-+++ b/tests/test_asyncio.py<br>
-@@ -2,7 +2,7 @@ import unittest<br>
- import yappi<br>
- import asyncio<br>
- import threading<br>
--from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io=
<br>
-+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_i=
o<br>
- <br>
- <br>
- async def async_sleep(sec):<br>
---- a/tests/test_asyncio_context_vars.py<br>
-+++ b/tests/test_asyncio_context_vars.py<br>
-@@ -5,7 +5,7 @@ import contextvars<br>
- import functools<br>
- import time<br>
- import os<br>
--import utils<br>
-+import tests.utils as utils<br>
- import yappi<br>
- <br>
- async_context_id =3D contextvars.ContextVar(&#39;async_context_id&#39;)<b=
r>
+diff --git a/tests/test_functionality.py b/tests/test_functionality.py<br>
+index 0e99c47..38bbe67 100644<br>
=C2=A0--- a/tests/test_functionality.py<br>
=C2=A0+++ b/tests/test_functionality.py<br>
-@@ -1,1916 +1,1916 @@<br>
+@@ -1,1911 +1,1911 @@<br>
=C2=A0-import os<br>
=C2=A0-import sys<br>
=C2=A0-import time<br>
@@ -47,7 +26,7 @@ Upstream-Status: Pending<br>
=C2=A0-import yappi<br>
=C2=A0-import _yappi<br>
=C2=A0-import utils<br>
--import multiprocessing=C2=A0 # added to fix <a href=3D"http://bugs.python=
.org/issue15881" rel=3D"noreferrer" target=3D"_blank">http://bugs.python.or=
g/issue15881</a> for &gt; Py2.6<br>
+-import multiprocessing<br>
=C2=A0-import subprocess<br>
=C2=A0-<br>
=C2=A0-_counter =3D 0<br>
@@ -318,10 +297,10 @@ Upstream-Status: Pending<br>
=C2=A0-=C2=A0 =C2=A0 def test_profile_decorator(self):<br>
=C2=A0-<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 def aggregate(func, stats):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D &quot;tests/%s.profil=
e&quot; % (func.__name__)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D f&quot;tests/{func.__=
name__}.profile&quot;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.add(fn=
ame)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError:<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(fname)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&quot;mess=
ing around&quot;)<br>
@@ -1232,7 +1211,7 @@ Upstream-Status: Pending<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: I put dummy() to fix below, remo=
ve the comments after a while.<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue( # FIX: I see this fails=
 sometimes?<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsm is not None,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Could not find &quot;_Main=
Thread&quot;. Found: %s&#39; % (&#39;, &#39;.join(utils.get_stat_names(tsta=
ts))))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Could not find \&quot;_M=
ainThread\&quot;. Found: {&#39;, &#39;.join(utils.get_stat_names(tstats))}&=
quot;)<br>
=C2=A0-<br>
=C2=A0-=C2=A0 =C2=A0 def test_ctx_stats(self):<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 from threading import Thread<br>
@@ -1312,7 +1291,7 @@ Upstream-Status: Pending<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: I put dummy() to fix below, remo=
ve the comments after a while.<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue( # FIX: I see this fails=
 sometimes<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsmain is not None,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Could not find &quot;_Main=
Thread&quot;. Found: %s&#39; % (&#39;, &#39;.join(utils.get_stat_names(stat=
s))))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Could not find \&quot;_M=
ainThread\&quot;. Found: {&#39;, &#39;.join(utils.get_stat_names(stats))}&q=
uot;)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(1.0 &gt; tst2.ttot &gt;=
=3D 0.5)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(1.0 &gt; tst1.ttot &gt;=
=3D 0.5)<br>
=C2=A0-<br>
@@ -1369,7 +1348,7 @@ Upstream-Status: Pending<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts =3D []<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in (0.01, 0.05, 0.1)=
:<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D thread=
ing.Thread(target=3Dburn_cpu, args=3D(i, ))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http:/=
/t.name" rel=3D"noreferrer" target=3D"_blank">t.name</a> =3D &quot;burn_cpu=
-%s&quot; % str(i)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http:/=
/t.name" rel=3D"noreferrer" target=3D"_blank">t.name</a> =3D f&quot;burn_cp=
u-{str(i)}&quot;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br=
>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.append(t)=
<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in ts:<br>
@@ -1396,10 +1375,7 @@ Upstream-Status: Pending<br>
=C2=A0-=C2=A0 =C2=A0 def test_producer_consumer_with_queues(self):<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # we currently just stress yappi, no fun=
ctionality test is done here.<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if utils.is_py3x():<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue import Queue<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from Queue import Queue<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue import Queue<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 from threading import Thread<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORKER_THREAD_COUNT =3D 50<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORK_ITEM_COUNT =3D 2000<br>
@@ -1458,7 +1434,6 @@ Upstream-Status: Pending<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsh =3D utils.find_stat_by_name(stats, &=
quot;handler&quot;)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsh is not None)<br>
=C2=A0-<br>
--=C2=A0 =C2=A0 @unittest.skipIf(not sys.version_info &gt;=3D (3, 2), &quot=
;requires Python 3.2&quot;)<br>
=C2=A0-=C2=A0 =C2=A0 def test_concurrent_futures(self):<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 from concurrent.futures import ThreadPoo=
lExecutor<br>
@@ -1468,7 +1443,6 @@ Upstream-Status: Pending<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1.0)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
=C2=A0-<br>
--=C2=A0 =C2=A0 @unittest.skipIf(not sys.version_info &gt;=3D (3, 2), &quot=
;requires Python 3.2&quot;)<br>
=C2=A0-=C2=A0 =C2=A0 def test_barrier(self):<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D threading.Barrier(2, timeout=3D1)<=
br>
@@ -1962,8 +1936,8 @@ Upstream-Status: Pending<br>
=C2=A0+import unittest<br>
=C2=A0+import yappi<br>
=C2=A0+import _yappi<br>
-+import tests.utils as utils<br>
-+import multiprocessing=C2=A0 # added to fix <a href=3D"http://bugs.python=
.org/issue15881" rel=3D"noreferrer" target=3D"_blank">http://bugs.python.or=
g/issue15881</a> for &gt; Py2.6<br>
++import utils<br>
++import multiprocessing<br>
=C2=A0+import subprocess<br>
=C2=A0+<br>
=C2=A0+_counter =3D 0<br>
@@ -2234,10 +2208,10 @@ Upstream-Status: Pending<br>
=C2=A0+=C2=A0 =C2=A0 def test_profile_decorator(self):<br>
=C2=A0+<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def aggregate(func, stats):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D &quot;tests/%s.profil=
e&quot; % (func.__name__)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D f&quot;tests/{func.__=
name__}.profile&quot;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.add(fn=
ame)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError:<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(fname)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&quot;mess=
ing around&quot;)<br>
@@ -3007,8 +2981,8 @@ Upstream-Status: Pending<br>
=C2=A0+<br>
=C2=A0+=C2=A0 =C2=A0 def test_issue_32(self):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Start yappi from different thread and we get =
Internal Error(15) as<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 the current_ctx_id() called while enumerating=
 the threads in start()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Start yappi from different thread and we get =
Internal Error(15) as <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 the current_ctx_id() called while enumerating=
 the threads in start() <br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 and as it does not swap to the enumerate=
d ThreadState* the THreadState_GetDict()<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 returns wrong object and thus sets an in=
valid id for the _ctx structure.<br>
=C2=A0+<br>
@@ -3148,7 +3122,7 @@ Upstream-Status: Pending<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: I put dummy() to fix below, remo=
ve the comments after a while.<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue( # FIX: I see this fails=
 sometimes?<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsm is not None,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Could not find &quot;_Main=
Thread&quot;. Found: %s&#39; % (&#39;, &#39;.join(utils.get_stat_names(tsta=
ts))))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Could not find \&quot;_M=
ainThread\&quot;. Found: {&#39;, &#39;.join(utils.get_stat_names(tstats))}&=
quot;)<br>
=C2=A0+<br>
=C2=A0+=C2=A0 =C2=A0 def test_ctx_stats(self):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 from threading import Thread<br>
@@ -3228,7 +3202,7 @@ Upstream-Status: Pending<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: I put dummy() to fix below, remo=
ve the comments after a while.<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue( # FIX: I see this fails=
 sometimes<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsmain is not None,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Could not find &quot;_Main=
Thread&quot;. Found: %s&#39; % (&#39;, &#39;.join(utils.get_stat_names(stat=
s))))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Could not find \&quot;_M=
ainThread\&quot;. Found: {&#39;, &#39;.join(utils.get_stat_names(stats))}&q=
uot;)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(1.0 &gt; tst2.ttot &gt;=
=3D 0.5)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(1.0 &gt; tst1.ttot &gt;=
=3D 0.5)<br>
=C2=A0+<br>
@@ -3285,7 +3259,7 @@ Upstream-Status: Pending<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts =3D []<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in (0.01, 0.05, 0.1)=
:<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D thread=
ing.Thread(target=3Dburn_cpu, args=3D(i, ))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http:/=
/t.name" rel=3D"noreferrer" target=3D"_blank">t.name</a> =3D &quot;burn_cpu=
-%s&quot; % str(i)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http:/=
/t.name" rel=3D"noreferrer" target=3D"_blank">t.name</a> =3D f&quot;burn_cp=
u-{str(i)}&quot;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.start()<br=
>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.append(t)=
<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in ts:<br>
@@ -3312,10 +3286,7 @@ Upstream-Status: Pending<br>
=C2=A0+=C2=A0 =C2=A0 def test_producer_consumer_with_queues(self):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # we currently just stress yappi, no fun=
ctionality test is done here.<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if utils.is_py3x():<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue import Queue<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from Queue import Queue<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue import Queue<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 from threading import Thread<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORKER_THREAD_COUNT =3D 50<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORK_ITEM_COUNT =3D 2000<br>
@@ -3374,7 +3345,6 @@ Upstream-Status: Pending<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsh =3D utils.find_stat_by_name(stats, &=
quot;handler&quot;)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsh is not None)<br>
=C2=A0+<br>
-+=C2=A0 =C2=A0 @unittest.skipIf(not sys.version_info &gt;=3D (3, 2), &quot=
;requires Python 3.2&quot;)<br>
=C2=A0+=C2=A0 =C2=A0 def test_concurrent_futures(self):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 from concurrent.futures import ThreadPoo=
lExecutor<br>
@@ -3384,7 +3354,6 @@ Upstream-Status: Pending<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1.0)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
=C2=A0+<br>
-+=C2=A0 =C2=A0 @unittest.skipIf(not sys.version_info &gt;=3D (3, 2), &quot=
;requires Python 3.2&quot;)<br>
=C2=A0+=C2=A0 =C2=A0 def test_barrier(self):<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D threading.Barrier(2, timeout=3D1)<=
br>
@@ -3871,25 +3840,6 @@ Upstream-Status: Pending<br>
=C2=A0+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0import sys;sys.argv =3D [&#39;&#3=
9;, &#39;BasicUsage.test_run_as_script&#39;]<br>
=C2=A0+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0import sys;sys.argv =3D [&#39;&#3=
9;, &#39;MultithreadedScenarios.test_subsequent_profile&#39;]<br>
=C2=A0+=C2=A0 =C2=A0 unittest.main()<br>
---- a/tests/test_hooks.py<br>
-+++ b/tests/test_hooks.py<br>
-@@ -5,7 +5,7 @@ import unittest<br>
- import time<br>
- <br>
- import yappi<br>
--import utils<br>
-+import tests.utils as utils<br>
- <br>
- <br>
- def a():<br>
---- a/tests/test_tags.py<br>
-+++ b/tests/test_tags.py<br>
-@@ -2,7 +2,7 @@ import unittest<br>
- import yappi<br>
- import threading<br>
- import time<br>
--from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io=
<br>
-+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_i=
o<br>
- <br>
- <br>
- class MultiThreadTests(YappiUnitTestCase):<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-imp=
ort-of-tests.utils-to-enable-pytest.patch b/meta-python/recipes-devtools/py=
thon/python3-yappi/0002-Fix-import-of-tests.utils-to-enable-pytest.patch<br=
>
new file mode 100644<br>
index 0000000000..96dd024125<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-=
tests.utils-to-enable-pytest.patch<br>
@@ -0,0 +1,101 @@<br>
+From 28eac38566327091221aabbc164ea8e433c66e7e Mon Sep 17 00:00:00 2001<br>
+From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"=
_blank">tim.orling@konsulko.com</a>&gt;<br>
+Date: Sun, 24 Dec 2023 09:27:50 -0800<br>
+Subject: [PATCH 2/2] Fix import of tests.utils to enable pytest<br>
+<br>
+Running the test cases with pytest leads to importlib errors<br>
+because the &quot;utils&quot; module cannot be found.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/sumerc/yappi/pul=
l/164" rel=3D"noreferrer" target=3D"_blank">https://github.com/sumerc/yappi=
/pull/164</a>]<br>
+<br>
+Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" t=
arget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
+---<br>
+ tests/test_asyncio.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
 +-<br>
+ tests/test_asyncio_context_vars.py | 2 +-<br>
+ tests/test_functionality.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ tests/test_gevent.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
+ tests/test_hooks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
+ tests/test_tags.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 2 +-<br>
+ 6 files changed, 6 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/tests/test_asyncio.py b/tests/test_asyncio.py<br>
+index 8e9e631..bb36f4a 100644<br>
+--- a/tests/test_asyncio.py<br>
++++ b/tests/test_asyncio.py<br>
+@@ -2,7 +2,7 @@ import unittest<br>
+ import yappi<br>
+ import asyncio<br>
+ import threading<br>
+-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io=
<br>
++from tests.utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, b=
urn_io<br>
+ <br>
+ <br>
+ async def async_sleep(sec):<br>
+diff --git a/tests/test_asyncio_context_vars.py b/tests/test_asyncio_conte=
xt_vars.py<br>
+index 5bd750c..9a253c0 100644<br>
+--- a/tests/test_asyncio_context_vars.py<br>
++++ b/tests/test_asyncio_context_vars.py<br>
+@@ -5,7 +5,7 @@ import contextvars<br>
+ import functools<br>
+ import time<br>
+ import os<br>
+-import utils<br>
++import tests.utils as utils<br>
+ import yappi<br>
+ <br>
+ async_context_id =3D contextvars.ContextVar(&#39;async_context_id&#39;)<b=
r>
+diff --git a/tests/test_functionality.py b/tests/test_functionality.py<br>
+index 38bbe67..8098f17 100644<br>
+--- a/tests/test_functionality.py<br>
++++ b/tests/test_functionality.py<br>
+@@ -5,7 +5,7 @@ import threading<br>
+ import unittest<br>
+ import yappi<br>
+ import _yappi<br>
+-import utils<br>
++import tests.utils as utils<br>
+ import multiprocessing<br>
+ import subprocess<br>
+ <br>
+diff --git a/tests/test_gevent.py b/tests/test_gevent.py<br>
+index ed9e6ae..502af5f 100644<br>
+--- a/tests/test_gevent.py<br>
++++ b/tests/test_gevent.py<br>
+@@ -2,7 +2,7 @@ import unittest<br>
+ import _yappi<br>
+ import yappi<br>
+ import threading<br>
+-from utils import (<br>
++from tests.utils import (<br>
+=C2=A0 =C2=A0 =C2=A0YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_i=
o, burn_io_gevent<br>
+ )<br>
+ <br>
+diff --git a/tests/test_hooks.py b/tests/test_hooks.py<br>
+index 297c643..8c387fc 100644<br>
+--- a/tests/test_hooks.py<br>
++++ b/tests/test_hooks.py<br>
+@@ -5,7 +5,7 @@ import unittest<br>
+ import time<br>
+ <br>
+ import yappi<br>
+-import utils<br>
++import tests.utils as utils<br>
+ <br>
+ <br>
+ def a():<br>
+diff --git a/tests/test_tags.py b/tests/test_tags.py<br>
+index b0b531d..b5a4016 100644<br>
+--- a/tests/test_tags.py<br>
++++ b/tests/test_tags.py<br>
+@@ -2,7 +2,7 @@ import unittest<br>
+ import yappi<br>
+ import threading<br>
+ import time<br>
+-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io=
<br>
++from tests.utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, b=
urn_io<br>
+ <br>
+ <br>
+ class MultiThreadTests(YappiUnitTestCase):<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.1=
1-to-the-setup.patch b/meta-python/recipes-devtools/python/python3-yappi/00=
02-add-3.11-to-the-setup.patch<br>
deleted file mode 100644<br>
index d40bd2b7cc..0000000000<br>
--- a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-th=
e-setup.patch<br>
+++ /dev/null<br>
@@ -1,26 +0,0 @@<br>
-From 38afdacf526410f970afc58e147c7377c6c7112c Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?S=3DC3=3DBCmer=3D20Cip?=3D &lt;<a href=3D"mailto:sumer.c=
ip@platform.sh" target=3D"_blank">sumer.cip@platform.sh</a>&gt;<br>
-Date: Fri, 25 Nov 2022 15:58:03 +0300<br>
-Subject: [PATCH 2/2] add 3.11 to the setup<br>
-<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- setup.py | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/setup.py b/setup.py<br>
-index d006787..96e2a66 100644<br>
---- a/setup.py<br>
-+++ b/setup.py<br>
-@@ -56,6 +56,7 @@ CLASSIFIERS =3D [<br>
-=C2=A0 =C2=A0 =C2=A0&#39;Programming Language :: Python :: 3.8&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0&#39;Programming Language :: Python :: 3.9&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0&#39;Programming Language :: Python :: 3.10&#39;,<br>
-+=C2=A0 =C2=A0 &#39;Programming Language :: Python :: 3.11&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0&#39;Programming Language :: Python :: Implementation =
:: CPython&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0&#39;Operating System :: OS Independent&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0&#39;Topic :: Software Development :: Libraries&#39;,<=
br>
--- <br>
-2.30.2<br>
-<br>
diff --git a/meta-python/recipes-devtools/python/python3-yappi/run-ptest b/=
meta-python/recipes-devtools/python/python3-yappi/run-ptest<br>
index 3385d68939..8d2017d39c 100644<br>
--- a/meta-python/recipes-devtools/python/python3-yappi/run-ptest<br>
+++ b/meta-python/recipes-devtools/python/python3-yappi/run-ptest<br>
@@ -1,3 +1,3 @@<br>
=C2=A0#!/bin/sh<br>
<br>
-pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e &#39;s/\[...%\]/=
/g&#39;| sed -e &#39;s/PASSED/PASS/g&#39;| sed -e &#39;s/FAILED/FAIL/g&#39;=
|sed -e &#39;s/SKIPED/SKIP/g&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&quot; =
|| $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot=
;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;){printf &quot;%s: %s\n&quot;, $N=
F, $0}else{print}}&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&quot; || $NF=3D=
=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;XFAIL&qu=
ot; || $NF=3D=3D&quot;XPASS&quot;) {$NF=3D&quot;&quot;;print $0}else{print}=
}&#39;<br>
+pytest --automake<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
yappi_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.4.0.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-yappi_=
1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.4.0.bb</a><b=
r>
deleted file mode 100644<br>
index 71e74e86f2..0000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-yappi_1=
.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.4.0.bb</a><br=
>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-SUMMARY=C2=A0 =3D &quot;Yet Another Python Profiler&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/sumerc/yappi" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/sumerc/yappi</a>&quot;<br>
-<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D71c208c9a4fd864385eb69ad4c=
aa3bee&quot;<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;504b5d8fc7433736cb5e257991d2e7f2946019174f1fa=
ec7b2fe947881a17fc0&quot;<br>
-<br>
-SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 file://0001-Fix-imports-for-ptests.patch \<br>
-=C2=A0 =C2=A0 file://0002-add-3.11-to-the-setup.patch \<br>
-&quot;<br>
-<br>
-inherit pypi setuptools3 ptest<br>
-<br>
-RDEPENDS:${PN} +=3D &quot;\<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-datetime \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-pickle \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-threading \<br>
-&quot;<br>
-<br>
-RDEPENDS:${PN}-ptest +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-gevent \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-multiprocessing \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-profile \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-zopeinterface \<br>
-&quot;<br>
-<br>
-do_install_ptest() {<br>
-=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
-=C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
-=C2=A0 =C2=A0 cp -f ${S}/yappi/yappi.py ${D}/${PTEST_PATH}/<br>
-}<br>
-<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
yappi_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.6.0.bb=
</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-yappi_=
1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.6.0.bb</a><b=
r>
new file mode 100644<br>
index 0000000000..4349cab1e7<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-yappi_1=
.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.6.0.bb</a><br=
>
@@ -0,0 +1,37 @@<br>
+SUMMARY=C2=A0 =3D &quot;Yet Another Python Profiler&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/sumerc/yappi" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/sumerc/yappi</a>&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D71c208c9a4fd864385eb69ad4c=
aa3bee&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;a9aaf72009d8c03067294151ee0470ac7a6dfa7b33baa=
b40b198d6c1ef00430a&quot;<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 file://0001-test_functionality-convert-line-endings-to-Unix.=
patch \<br>
+=C2=A0 =C2=A0 file://0002-Fix-import-of-tests.utils-to-enable-pytest.patch=
 \<br>
+&quot;<br>
+<br>
+inherit pypi python_setuptools_build_meta ptest<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 python3-datetime \<br>
+=C2=A0 =C2=A0 python3-pickle \<br>
+=C2=A0 =C2=A0 python3-threading \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 python3-gevent \<br>
+=C2=A0 =C2=A0 python3-multiprocessing \<br>
+=C2=A0 =C2=A0 python3-pytest \<br>
+=C2=A0 =C2=A0 python3-profile \<br>
+=C2=A0 =C2=A0 python3-unittest-automake-output \<br>
+=C2=A0 =C2=A0 python3-zopeinterface \<br>
+&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 cp -rf ${S}/tests ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 cp -f ${S}/run_tests.py ${D}${PTEST_PATH}<br>
+}<br>
+<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107782): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107782" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107782</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103350816/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103350816/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000fc053b060d8469c6--

