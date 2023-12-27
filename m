Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F44C46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 22:18:44 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.111480.1703715523081028979
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 14:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R1q0jQPJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbd715ed145so4036545276.1
        for <Openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 14:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703715522; x=1704320322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gSSWHulbMQq5AVdiV9xJJmgvM/MCfZWz5TnUEA2ZcVA=;
        b=R1q0jQPJfis11Zik/89pjxYJyBIMP//H4S69vEm0jbuGyH9W++P6GyEoHsPCLMgWFQ
         waIrP994qatA8nK/gNMYohNCgqo9pTPU1vwfVVBAm532HpCtYbfANsB4mr2o10CPZ8yb
         4NQl1eaOFpghr+CZ+PizpClxWUZclrqI+jJ0DhTRFH2V6i62T/he9OiJEPJkkBrSrwsV
         fWPK3+O+JFvs9wx/xJIoK2x4SCbHw7mO4ap4mxn1y+mgCI6Bn7qDOqnREQ4+JCxB2TJl
         E+IjGKZMbIUIAoTKF4Ef1YK21b67XMqYG4jsaRMGI4NgScCdNxDdvgGqX4O/kYtrbiwX
         cBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703715522; x=1704320322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSSWHulbMQq5AVdiV9xJJmgvM/MCfZWz5TnUEA2ZcVA=;
        b=TZrcMoEIJ4dwcqtBWNc4HzLY2s51eJfVWOYn+rxmoOjTzMYPW5FAYhge+rD3fON/n9
         Q5Q1p0y4ET3X/XUNWQsnjAVrYggEU7HAp9tlfaQSiNBJrCFldtQarmx+boPO9NGVwSnf
         F0Z9MQPWHvSMBQbNTwWmMhTYPvhR4zbcVAjxokeLoQsPKfIUY5hljzcgxQyTnLR+jcrF
         zPBtjQ19MJMuKxuyM+7ph638SFR1vb/MLstaJgRN1pLIsv8g1zPjNV4s8aUBAQSUepD+
         kSSQBrd/oYGTMDWjmlrtGGRsVTV7oZ3uwYJrULp9SxVAptsqnqtfZmvGfdeHUX0Gniur
         thhA==
X-Gm-Message-State: AOJu0Yx00NjSVmlKLGJMzLh1uW7lkSYQfQa/GS4004IcO5haSJm/EXu+
	Z+OJ14Wcngb2kV7hqUT1mwIxGRuAXnOZH/MUbLQ=
X-Google-Smtp-Source: AGHT+IHNN1EFwOu9M6fZ6nb0Cke6ihr3ew89X43KGgt8hChM90ewuKBQAxUVdS2BnCj6GhHc/YR7JMSrKuu7X6Xx30o=
X-Received: by 2002:a5b:c10:0:b0:db5:4dc8:60f5 with SMTP id
 f16-20020a5b0c10000000b00db54dc860f5mr3922676ybq.0.1703715522069; Wed, 27 Dec
 2023 14:18:42 -0800 (PST)
MIME-Version: 1.0
References: <17A3D724672C20F7.18684@lists.openembedded.org>
 <CANx9H-ChW547oCmp36u9vOh08BEdiLH6rFu++BuF8EF8kVsfzA@mail.gmail.com> <CAMKF1spf8ZLbtr6ZCTyy+H9X4YcXk3-4QreXoASjHqRR4H-9rw@mail.gmail.com>
In-Reply-To: <CAMKF1spf8ZLbtr6ZCTyy+H9X4YcXk3-4QreXoASjHqRR4H-9rw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 27 Dec 2023 14:18:30 -0800
Message-ID: <CANx9H-A2EYkayoMWZs19_qqZC-Qxrv5isE1MDi2fkK6HRbjgXA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-yappi: upgrade 1.4.0 -> 1.6.0;
 fix ptests
To: Khem Raj <raj.khem@gmail.com>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007dca6e060d852ed4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 22:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107872

--0000000000007dca6e060d852ed4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seems there was an issue with most likely Windows -> Unix line endings
causing the email patch to not apply. I had a similar problem with the
prior upgrade from Alex.

Pushed to a rebased branch on top of today's master-next:

https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dtimo/pyt=
hon3-yappi-ptest

On Wed, Dec 27, 2023 at 1:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> right, its in master-next already.
>
> On Wed, Dec 27, 2023 at 1:23=E2=80=AFPM Tim Orling <ticotimo@gmail.com> w=
rote:
> >
> > Gentle ping. This one supersedes the on from Alex, since it fixes the
> priests.
> >
> > On Sun, Dec 24, 2023 at 10:13=E2=80=AFAM Tim Orling via lists.openembed=
ded.org
> <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> * Switch to the python_setuptools_build_meta PEP-517 backend
> >> * Refactor and submit 0001-Fix-imports-for-ptests.patch
> >>   - split out the Windows -> Unix line endings conversion
> >>   - https://github.com/sumerc/yappi/pull/164
> >> * Drop 0002-add-3.11-to-the-setup.patch; upstream added 3.11 and 3.12
> >> * Drop install of yappi.py in ptest; use site-packages as intended
> >> * Drop complex run-ptest and simply run 'pytest --automake'
> >> * Move out of "problems" group to "slow" group in
> ptest-packageslists-meta-python.inc
> >>   - can now build meta-python-image-ptest-python3-yappi
> >>   - tests take about 45 seconds
> >>
> >> https://github.com/sumerc/yappi/blob/1.6.0/CHANGELOG
> >>
> >> 1.6.0 (2023-12-07)
> >>
> >> - Drop support 2.7-3.5 and clean backward compatible code (pull/152)
> >> - Add Python 3.12 wheels
> >>
> >> 1.5.1 (2023-12-06)
> >>
> >> - Add support for Python 3.12
> >> - Fix child callgrind functions disappear
> >>
> >> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> >> ---
> >> All tests pass on qemux86-64
> >> Upstream GitHub Actions CI also passed with submitted patches
> >>
> >>  .../ptest-packagelists-meta-python.inc        |   2 +-
> >>  ...nality-convert-line-endings-to-Unix.patch} | 120 +++++------------=
-
> >>  ...port-of-tests.utils-to-enable-pytest.patch | 101 +++++++++++++++
> >>  .../0002-add-3.11-to-the-setup.patch          |  26 ----
> >>  .../python/python3-yappi/run-ptest            |   2 +-
> >>  .../python/python3-yappi_1.4.0.bb             |  36 ------
> >>  .../python/python3-yappi_1.6.0.bb             |  37 ++++++
> >>  7 files changed, 175 insertions(+), 149 deletions(-)
> >>  rename
> meta-python/recipes-devtools/python/python3-yappi/{0001-Fix-imports-for-p=
tests.patch
> =3D> 0001-test_functionality-convert-line-endings-to-Unix.patch} (95%)
> >>  create mode 100644
> meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-test=
s.utils-to-enable-pytest.patch
> >>  delete mode 100644
> meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-se=
tup.patch
> >>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-yappi_1.4.0.bb
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-yappi_1.6.0.bb
> >>
> >> diff --git
> a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> >> index 3272d98192..e1732c6177 100644
> >> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> >> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> >> @@ -54,6 +54,7 @@ PTESTS_FAST_META_PYTHON =3D "\
> >>
> >>  PTESTS_SLOW_META_PYTHON =3D "\
> >>      python3-lz4 \
> >> +    python3-yappi \
> >>  "
> >>
> >>  PTESTS_PROBLEMS_META_PYTHON =3D"\
> >> @@ -82,6 +83,5 @@ PTESTS_PROBLEMS_META_PYTHON =3D"\
> >>      python3-whoosh \
> >>      python3-ujson \
> >>      python3-xlrd \
> >> -    python3-yappi \
> >>      python3-yarl \
> >>  "
> >> diff --git
> a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-=
ptests.patch
> b/meta-python/recipes-devtools/python/python3-yappi/0001-test_functionali=
ty-convert-line-endings-to-Unix.patch
> >> similarity index 95%
> >> rename from
> meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-pt=
ests.patch
> >> rename to
> meta-python/recipes-devtools/python/python3-yappi/0001-test_functionality=
-convert-line-endings-to-Unix.patch
> >> index 476db4b7d0..70d4607c29 100644
> >> ---
> a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-=
ptests.patch
> >> +++
> b/meta-python/recipes-devtools/python/python3-yappi/0001-test_functionali=
ty-convert-line-endings-to-Unix.patch
> >> @@ -1,44 +1,23 @@
> >> -From 0dedc1c573ddc4e87475eb03c64555cd54a72e92 Mon Sep 17 00:00:00 200=
1
> >> -From: Trevor Gamblin <trevor.gamblin@windriver.com>
> >> -Date: Mon, 7 Jun 2021 09:40:20 -0400
> >> -Subject: [PATCH] Fix imports for tests
> >> +From 0136ca731cba8b056b3f2ff0e7df3953b94f1e87 Mon Sep 17 00:00:00 200=
1
> >> +From: Tim Orling <tim.orling@konsulko.com>
> >> +Date: Sun, 24 Dec 2023 09:41:57 -0800
> >> +Subject: [PATCH 1/2] test_functionality: convert line endings to Unix
> >>
> >> -Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> >> ----
> >> -Upstream-Status: Pending
> >> +Convert the Windows line endings with dos2unix to be like the
> >> +other files in tests/*
> >> +
> >> +Upstream-Status: Submitted [https://github.com/sumerc/yappi/pull/164]
> >>
> >> - tests/test_asyncio.py              | 2 +-
> >> - tests/test_asyncio_context_vars.py | 2 +-
> >> - tests/test_functionality.py        | 2 +-
> >> - tests/test_hooks.py                | 2 +-
> >> - tests/test_tags.py                 | 2 +-
> >> - 5 files changed, 6 insertions(+), 6 deletions(-)
> >> +Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> >> +---
> >> + tests/test_functionality.py | 3822 +++++++++++++++++----------------=
--
> >> + 1 file changed, 1911 insertions(+), 1911 deletions(-)
> >>
> >> ---- a/tests/test_asyncio.py
> >> -+++ b/tests/test_asyncio.py
> >> -@@ -2,7 +2,7 @@ import unittest
> >> - import yappi
> >> - import asyncio
> >> - import threading
> >> --from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> >> -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> >> -
> >> -
> >> - async def async_sleep(sec):
> >> ---- a/tests/test_asyncio_context_vars.py
> >> -+++ b/tests/test_asyncio_context_vars.py
> >> -@@ -5,7 +5,7 @@ import contextvars
> >> - import functools
> >> - import time
> >> - import os
> >> --import utils
> >> -+import tests.utils as utils
> >> - import yappi
> >> -
> >> - async_context_id =3D contextvars.ContextVar('async_context_id')
> >> +diff --git a/tests/test_functionality.py b/tests/test_functionality.p=
y
> >> +index 0e99c47..38bbe67 100644
> >>  --- a/tests/test_functionality.py
> >>  +++ b/tests/test_functionality.py
> >> -@@ -1,1916 +1,1916 @@
> >> +@@ -1,1911 +1,1911 @@
> >>  -import os
> >>  -import sys
> >>  -import time
> >> @@ -47,7 +26,7 @@ Upstream-Status: Pending
> >>  -import yappi
> >>  -import _yappi
> >>  -import utils
> >> --import multiprocessing  # added to fix
> http://bugs.python.org/issue15881 for > Py2.6
> >> +-import multiprocessing
> >>  -import subprocess
> >>  -
> >>  -_counter =3D 0
> >> @@ -318,10 +297,10 @@ Upstream-Status: Pending
> >>  -    def test_profile_decorator(self):
> >>  -
> >>  -        def aggregate(func, stats):
> >> --            fname =3D "tests/%s.profile" % (func.__name__)
> >> +-            fname =3D f"tests/{func.__name__}.profile"
> >>  -            try:
> >>  -                stats.add(fname)
> >> --            except IOError:
> >> +-            except OSError:
> >>  -                pass
> >>  -            stats.save(fname)
> >>  -            raise Exception("messing around")
> >> @@ -1232,7 +1211,7 @@ Upstream-Status: Pending
> >>  -        # TODO: I put dummy() to fix below, remove the comments afte=
r
> a while.
> >>  -        self.assertTrue( # FIX: I see this fails sometimes?
> >>  -            tsm is not None,
> >> --            'Could not find "_MainThread". Found: %s' % (',
> '.join(utils.get_stat_names(tstats))))
> >> +-            f"Could not find \"_MainThread\". Found: {',
> '.join(utils.get_stat_names(tstats))}")
> >>  -
> >>  -    def test_ctx_stats(self):
> >>  -        from threading import Thread
> >> @@ -1312,7 +1291,7 @@ Upstream-Status: Pending
> >>  -        # TODO: I put dummy() to fix below, remove the comments afte=
r
> a while.
> >>  -        self.assertTrue( # FIX: I see this fails sometimes
> >>  -            tsmain is not None,
> >> --            'Could not find "_MainThread". Found: %s' % (',
> '.join(utils.get_stat_names(stats))))
> >> +-            f"Could not find \"_MainThread\". Found: {',
> '.join(utils.get_stat_names(stats))}")
> >>  -        self.assertTrue(1.0 > tst2.ttot >=3D 0.5)
> >>  -        self.assertTrue(1.0 > tst1.ttot >=3D 0.5)
> >>  -
> >> @@ -1369,7 +1348,7 @@ Upstream-Status: Pending
> >>  -            ts =3D []
> >>  -            for i in (0.01, 0.05, 0.1):
> >>  -                t =3D threading.Thread(target=3Dburn_cpu, args=3D(i,=
 ))
> >> --                t.name =3D "burn_cpu-%s" % str(i)
> >> +-                t.name =3D f"burn_cpu-{str(i)}"
> >>  -                t.start()
> >>  -                ts.append(t)
> >>  -            for t in ts:
> >> @@ -1396,10 +1375,7 @@ Upstream-Status: Pending
> >>  -    def test_producer_consumer_with_queues(self):
> >>  -        # we currently just stress yappi, no functionality test is
> done here.
> >>  -        yappi.start()
> >> --        if utils.is_py3x():
> >> --            from queue import Queue
> >> --        else:
> >> --            from Queue import Queue
> >> +-        from queue import Queue
> >>  -        from threading import Thread
> >>  -        WORKER_THREAD_COUNT =3D 50
> >>  -        WORK_ITEM_COUNT =3D 2000
> >> @@ -1458,7 +1434,6 @@ Upstream-Status: Pending
> >>  -        fsh =3D utils.find_stat_by_name(stats, "handler")
> >>  -        self.assertTrue(fsh is not None)
> >>  -
> >> --    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Pyt=
hon
> 3.2")
> >>  -    def test_concurrent_futures(self):
> >>  -        yappi.start()
> >>  -        from concurrent.futures import ThreadPoolExecutor
> >> @@ -1468,7 +1443,6 @@ Upstream-Status: Pending
> >>  -        time.sleep(1.0)
> >>  -        yappi.stop()
> >>  -
> >> --    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Pyt=
hon
> 3.2")
> >>  -    def test_barrier(self):
> >>  -        yappi.start()
> >>  -        b =3D threading.Barrier(2, timeout=3D1)
> >> @@ -1962,8 +1936,8 @@ Upstream-Status: Pending
> >>  +import unittest
> >>  +import yappi
> >>  +import _yappi
> >> -+import tests.utils as utils
> >> -+import multiprocessing  # added to fix
> http://bugs.python.org/issue15881 for > Py2.6
> >> ++import utils
> >> ++import multiprocessing
> >>  +import subprocess
> >>  +
> >>  +_counter =3D 0
> >> @@ -2234,10 +2208,10 @@ Upstream-Status: Pending
> >>  +    def test_profile_decorator(self):
> >>  +
> >>  +        def aggregate(func, stats):
> >> -+            fname =3D "tests/%s.profile" % (func.__name__)
> >> ++            fname =3D f"tests/{func.__name__}.profile"
> >>  +            try:
> >>  +                stats.add(fname)
> >> -+            except IOError:
> >> ++            except OSError:
> >>  +                pass
> >>  +            stats.save(fname)
> >>  +            raise Exception("messing around")
> >> @@ -3007,8 +2981,8 @@ Upstream-Status: Pending
> >>  +
> >>  +    def test_issue_32(self):
> >>  +        '''
> >> -+        Start yappi from different thread and we get Internal
> Error(15) as
> >> -+        the current_ctx_id() called while enumerating the threads in
> start()
> >> ++        Start yappi from different thread and we get Internal
> Error(15) as
> >> ++        the current_ctx_id() called while enumerating the threads in
> start()
> >>  +        and as it does not swap to the enumerated ThreadState* the
> THreadState_GetDict()
> >>  +        returns wrong object and thus sets an invalid id for the _ct=
x
> structure.
> >>  +
> >> @@ -3148,7 +3122,7 @@ Upstream-Status: Pending
> >>  +        # TODO: I put dummy() to fix below, remove the comments afte=
r
> a while.
> >>  +        self.assertTrue( # FIX: I see this fails sometimes?
> >>  +            tsm is not None,
> >> -+            'Could not find "_MainThread". Found: %s' % (',
> '.join(utils.get_stat_names(tstats))))
> >> ++            f"Could not find \"_MainThread\". Found: {',
> '.join(utils.get_stat_names(tstats))}")
> >>  +
> >>  +    def test_ctx_stats(self):
> >>  +        from threading import Thread
> >> @@ -3228,7 +3202,7 @@ Upstream-Status: Pending
> >>  +        # TODO: I put dummy() to fix below, remove the comments afte=
r
> a while.
> >>  +        self.assertTrue( # FIX: I see this fails sometimes
> >>  +            tsmain is not None,
> >> -+            'Could not find "_MainThread". Found: %s' % (',
> '.join(utils.get_stat_names(stats))))
> >> ++            f"Could not find \"_MainThread\". Found: {',
> '.join(utils.get_stat_names(stats))}")
> >>  +        self.assertTrue(1.0 > tst2.ttot >=3D 0.5)
> >>  +        self.assertTrue(1.0 > tst1.ttot >=3D 0.5)
> >>  +
> >> @@ -3285,7 +3259,7 @@ Upstream-Status: Pending
> >>  +            ts =3D []
> >>  +            for i in (0.01, 0.05, 0.1):
> >>  +                t =3D threading.Thread(target=3Dburn_cpu, args=3D(i,=
 ))
> >> -+                t.name =3D "burn_cpu-%s" % str(i)
> >> ++                t.name =3D f"burn_cpu-{str(i)}"
> >>  +                t.start()
> >>  +                ts.append(t)
> >>  +            for t in ts:
> >> @@ -3312,10 +3286,7 @@ Upstream-Status: Pending
> >>  +    def test_producer_consumer_with_queues(self):
> >>  +        # we currently just stress yappi, no functionality test is
> done here.
> >>  +        yappi.start()
> >> -+        if utils.is_py3x():
> >> -+            from queue import Queue
> >> -+        else:
> >> -+            from Queue import Queue
> >> ++        from queue import Queue
> >>  +        from threading import Thread
> >>  +        WORKER_THREAD_COUNT =3D 50
> >>  +        WORK_ITEM_COUNT =3D 2000
> >> @@ -3374,7 +3345,6 @@ Upstream-Status: Pending
> >>  +        fsh =3D utils.find_stat_by_name(stats, "handler")
> >>  +        self.assertTrue(fsh is not None)
> >>  +
> >> -+    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Pyt=
hon
> 3.2")
> >>  +    def test_concurrent_futures(self):
> >>  +        yappi.start()
> >>  +        from concurrent.futures import ThreadPoolExecutor
> >> @@ -3384,7 +3354,6 @@ Upstream-Status: Pending
> >>  +        time.sleep(1.0)
> >>  +        yappi.stop()
> >>  +
> >> -+    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Pyt=
hon
> 3.2")
> >>  +    def test_barrier(self):
> >>  +        yappi.start()
> >>  +        b =3D threading.Barrier(2, timeout=3D1)
> >> @@ -3871,25 +3840,6 @@ Upstream-Status: Pending
> >>  +    #     import sys;sys.argv =3D ['', 'BasicUsage.test_run_as_scrip=
t']
> >>  +    #     import sys;sys.argv =3D ['',
> 'MultithreadedScenarios.test_subsequent_profile']
> >>  +    unittest.main()
> >> ---- a/tests/test_hooks.py
> >> -+++ b/tests/test_hooks.py
> >> -@@ -5,7 +5,7 @@ import unittest
> >> - import time
> >> -
> >> - import yappi
> >> --import utils
> >> -+import tests.utils as utils
> >> -
> >> -
> >> - def a():
> >> ---- a/tests/test_tags.py
> >> -+++ b/tests/test_tags.py
> >> -@@ -2,7 +2,7 @@ import unittest
> >> - import yappi
> >> - import threading
> >> - import time
> >> --from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> >> -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> >> -
> >> -
> >> - class MultiThreadTests(YappiUnitTestCase):
> >> +--
> >> +2.34.1
> >> +
> >> diff --git
> a/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-te=
sts.utils-to-enable-pytest.patch
> b/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-te=
sts.utils-to-enable-pytest.patch
> >> new file mode 100644
> >> index 0000000000..96dd024125
> >> --- /dev/null
> >> +++
> b/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-te=
sts.utils-to-enable-pytest.patch
> >> @@ -0,0 +1,101 @@
> >> +From 28eac38566327091221aabbc164ea8e433c66e7e Mon Sep 17 00:00:00 200=
1
> >> +From: Tim Orling <tim.orling@konsulko.com>
> >> +Date: Sun, 24 Dec 2023 09:27:50 -0800
> >> +Subject: [PATCH 2/2] Fix import of tests.utils to enable pytest
> >> +
> >> +Running the test cases with pytest leads to importlib errors
> >> +because the "utils" module cannot be found.
> >> +
> >> +Upstream-Status: Submitted [https://github.com/sumerc/yappi/pull/164]
> >> +
> >> +Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> >> +---
> >> + tests/test_asyncio.py              | 2 +-
> >> + tests/test_asyncio_context_vars.py | 2 +-
> >> + tests/test_functionality.py        | 2 +-
> >> + tests/test_gevent.py               | 2 +-
> >> + tests/test_hooks.py                | 2 +-
> >> + tests/test_tags.py                 | 2 +-
> >> + 6 files changed, 6 insertions(+), 6 deletions(-)
> >> +
> >> +diff --git a/tests/test_asyncio.py b/tests/test_asyncio.py
> >> +index 8e9e631..bb36f4a 100644
> >> +--- a/tests/test_asyncio.py
> >> ++++ b/tests/test_asyncio.py
> >> +@@ -2,7 +2,7 @@ import unittest
> >> + import yappi
> >> + import asyncio
> >> + import threading
> >> +-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> >> ++from tests.utils import YappiUnitTestCase, find_stat_by_name,
> burn_cpu, burn_io
> >> +
> >> +
> >> + async def async_sleep(sec):
> >> +diff --git a/tests/test_asyncio_context_vars.py
> b/tests/test_asyncio_context_vars.py
> >> +index 5bd750c..9a253c0 100644
> >> +--- a/tests/test_asyncio_context_vars.py
> >> ++++ b/tests/test_asyncio_context_vars.py
> >> +@@ -5,7 +5,7 @@ import contextvars
> >> + import functools
> >> + import time
> >> + import os
> >> +-import utils
> >> ++import tests.utils as utils
> >> + import yappi
> >> +
> >> + async_context_id =3D contextvars.ContextVar('async_context_id')
> >> +diff --git a/tests/test_functionality.py b/tests/test_functionality.p=
y
> >> +index 38bbe67..8098f17 100644
> >> +--- a/tests/test_functionality.py
> >> ++++ b/tests/test_functionality.py
> >> +@@ -5,7 +5,7 @@ import threading
> >> + import unittest
> >> + import yappi
> >> + import _yappi
> >> +-import utils
> >> ++import tests.utils as utils
> >> + import multiprocessing
> >> + import subprocess
> >> +
> >> +diff --git a/tests/test_gevent.py b/tests/test_gevent.py
> >> +index ed9e6ae..502af5f 100644
> >> +--- a/tests/test_gevent.py
> >> ++++ b/tests/test_gevent.py
> >> +@@ -2,7 +2,7 @@ import unittest
> >> + import _yappi
> >> + import yappi
> >> + import threading
> >> +-from utils import (
> >> ++from tests.utils import (
> >> +     YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io,
> burn_io_gevent
> >> + )
> >> +
> >> +diff --git a/tests/test_hooks.py b/tests/test_hooks.py
> >> +index 297c643..8c387fc 100644
> >> +--- a/tests/test_hooks.py
> >> ++++ b/tests/test_hooks.py
> >> +@@ -5,7 +5,7 @@ import unittest
> >> + import time
> >> +
> >> + import yappi
> >> +-import utils
> >> ++import tests.utils as utils
> >> +
> >> +
> >> + def a():
> >> +diff --git a/tests/test_tags.py b/tests/test_tags.py
> >> +index b0b531d..b5a4016 100644
> >> +--- a/tests/test_tags.py
> >> ++++ b/tests/test_tags.py
> >> +@@ -2,7 +2,7 @@ import unittest
> >> + import yappi
> >> + import threading
> >> + import time
> >> +-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu,
> burn_io
> >> ++from tests.utils import YappiUnitTestCase, find_stat_by_name,
> burn_cpu, burn_io
> >> +
> >> +
> >> + class MultiThreadTests(YappiUnitTestCase):
> >> +--
> >> +2.34.1
> >> +
> >> diff --git
> a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-=
setup.patch
> b/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-=
setup.patch
> >> deleted file mode 100644
> >> index d40bd2b7cc..0000000000
> >> ---
> a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to-the-=
setup.patch
> >> +++ /dev/null
> >> @@ -1,26 +0,0 @@
> >> -From 38afdacf526410f970afc58e147c7377c6c7112c Mon Sep 17 00:00:00 200=
1
> >> -From: =3D?UTF-8?q?S=3DC3=3DBCmer=3D20Cip?=3D <sumer.cip@platform.sh>
> >> -Date: Fri, 25 Nov 2022 15:58:03 +0300
> >> -Subject: [PATCH 2/2] add 3.11 to the setup
> >> -
> >> ----
> >> -Upstream-Status: Pending
> >> -
> >> - setup.py | 1 +
> >> - 1 file changed, 1 insertion(+)
> >> -
> >> -diff --git a/setup.py b/setup.py
> >> -index d006787..96e2a66 100644
> >> ---- a/setup.py
> >> -+++ b/setup.py
> >> -@@ -56,6 +56,7 @@ CLASSIFIERS =3D [
> >> -     'Programming Language :: Python :: 3.8',
> >> -     'Programming Language :: Python :: 3.9',
> >> -     'Programming Language :: Python :: 3.10',
> >> -+    'Programming Language :: Python :: 3.11',
> >> -     'Programming Language :: Python :: Implementation :: CPython',
> >> -     'Operating System :: OS Independent',
> >> -     'Topic :: Software Development :: Libraries',
> >> ---
> >> -2.30.2
> >> -
> >> diff --git
> a/meta-python/recipes-devtools/python/python3-yappi/run-ptest
> b/meta-python/recipes-devtools/python/python3-yappi/run-ptest
> >> index 3385d68939..8d2017d39c 100644
> >> --- a/meta-python/recipes-devtools/python/python3-yappi/run-ptest
> >> +++ b/meta-python/recipes-devtools/python/python3-yappi/run-ptest
> >> @@ -1,3 +1,3 @@
> >>  #!/bin/sh
> >>
> >> -pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]=
//g'|
> sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e
> 's/SKIPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=
=3D"SKIP" ||
> $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{pri=
nt}}'| awk
> '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"=
XFAIL" ||
> $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> >> +pytest --automake
> >> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.4.0.b=
b
> b/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
> >> deleted file mode 100644
> >> index 71e74e86f2..0000000000
> >> --- a/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
> >> +++ /dev/null
> >> @@ -1,36 +0,0 @@
> >> -SUMMARY  =3D "Yet Another Python Profiler"
> >> -HOMEPAGE =3D "https://github.com/sumerc/yappi"
> >> -
> >> -LICENSE =3D "MIT"
> >> -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D71c208c9a4fd864385eb69ad4caa3bee"
> >> -
> >> -SRC_URI[sha256sum] =3D
> "504b5d8fc7433736cb5e257991d2e7f2946019174f1faec7b2fe947881a17fc0"
> >> -
> >> -SRC_URI +=3D " \
> >> -    file://run-ptest \
> >> -    file://0001-Fix-imports-for-ptests.patch \
> >> -    file://0002-add-3.11-to-the-setup.patch \
> >> -"
> >> -
> >> -inherit pypi setuptools3 ptest
> >> -
> >> -RDEPENDS:${PN} +=3D "\
> >> -    ${PYTHON_PN}-datetime \
> >> -    ${PYTHON_PN}-pickle \
> >> -    ${PYTHON_PN}-threading \
> >> -"
> >> -
> >> -RDEPENDS:${PN}-ptest +=3D " \
> >> -    ${PYTHON_PN}-gevent \
> >> -    ${PYTHON_PN}-multiprocessing \
> >> -    ${PYTHON_PN}-pytest \
> >> -    ${PYTHON_PN}-profile \
> >> -    ${PYTHON_PN}-zopeinterface \
> >> -"
> >> -
> >> -do_install_ptest() {
> >> -    install -d ${D}${PTEST_PATH}/tests
> >> -    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> >> -    cp -f ${S}/yappi/yappi.py ${D}/${PTEST_PATH}/
> >> -}
> >> -
> >> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.6.0.b=
b
> b/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
> >> new file mode 100644
> >> index 0000000000..4349cab1e7
> >> --- /dev/null
> >> +++ b/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
> >> @@ -0,0 +1,37 @@
> >> +SUMMARY  =3D "Yet Another Python Profiler"
> >> +HOMEPAGE =3D "https://github.com/sumerc/yappi"
> >> +
> >> +LICENSE =3D "MIT"
> >> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D71c208c9a4fd864385eb69ad4caa3bee"
> >> +
> >> +SRC_URI[sha256sum] =3D
> "a9aaf72009d8c03067294151ee0470ac7a6dfa7b33baab40b198d6c1ef00430a"
> >> +
> >> +SRC_URI +=3D " \
> >> +    file://run-ptest \
> >> +    file://0001-test_functionality-convert-line-endings-to-Unix.patch=
 \
> >> +    file://0002-Fix-import-of-tests.utils-to-enable-pytest.patch \
> >> +"
> >> +
> >> +inherit pypi python_setuptools_build_meta ptest
> >> +
> >> +RDEPENDS:${PN} +=3D "\
> >> +    python3-datetime \
> >> +    python3-pickle \
> >> +    python3-threading \
> >> +"
> >> +
> >> +RDEPENDS:${PN}-ptest +=3D " \
> >> +    python3-gevent \
> >> +    python3-multiprocessing \
> >> +    python3-pytest \
> >> +    python3-profile \
> >> +    python3-unittest-automake-output \
> >> +    python3-zopeinterface \
> >> +"
> >> +
> >> +do_install_ptest() {
> >> +    install -d ${D}${PTEST_PATH}/tests
> >> +    cp -rf ${S}/tests ${D}${PTEST_PATH}
> >> +    cp -f ${S}/run_tests.py ${D}${PTEST_PATH}
> >> +}
> >> +
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#107782):
> https://lists.openembedded.org/g/openembedded-devel/message/107782
> >> Mute This Topic: https://lists.openembedded.org/mt/103350816/924729
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [ticotimo@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--0000000000007dca6e060d852ed4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seems there was an issue with most likely Windows -&gt; Un=
ix line endings causing the email patch to not apply. I had a similar probl=
em with the prior upgrade from Alex.<br><br>Pushed to a rebased branch on t=
op of today&#39;s master-next:<div><br></div><div><a href=3D"https://git.op=
enembedded.org/meta-openembedded-contrib/commit/?h=3Dtimo/python3-yappi-pte=
st">https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dtimo=
/python3-yappi-ptest</a><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 27, 2023 at 1:46=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">right, =
its in master-next already.<br>
<br>
On Wed, Dec 27, 2023 at 1:23=E2=80=AFPM Tim Orling &lt;<a href=3D"mailto:ti=
cotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Gentle ping. This one supersedes the on from Alex, since it fixes the =
priests.<br>
&gt;<br>
&gt; On Sun, Dec 24, 2023 at 10:13=E2=80=AFAM Tim Orling via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; * Switch to the python_setuptools_build_meta PEP-517 backend<br>
&gt;&gt; * Refactor and submit 0001-Fix-imports-for-ptests.patch<br>
&gt;&gt;=C2=A0 =C2=A0- split out the Windows -&gt; Unix line endings conver=
sion<br>
&gt;&gt;=C2=A0 =C2=A0- <a href=3D"https://github.com/sumerc/yappi/pull/164"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/sumerc/yappi/pull/=
164</a><br>
&gt;&gt; * Drop 0002-add-3.11-to-the-setup.patch; upstream added 3.11 and 3=
.12<br>
&gt;&gt; * Drop install of yappi.py in ptest; use site-packages as intended=
<br>
&gt;&gt; * Drop complex run-ptest and simply run &#39;pytest --automake&#39=
;<br>
&gt;&gt; * Move out of &quot;problems&quot; group to &quot;slow&quot; group=
 in ptest-packageslists-meta-python.inc<br>
&gt;&gt;=C2=A0 =C2=A0- can now build meta-python-image-ptest-python3-yappi<=
br>
&gt;&gt;=C2=A0 =C2=A0- tests take about 45 seconds<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/sumerc/yappi/blob/1.6.0/CHANGELOG" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/sumerc/yappi/blob/1.=
6.0/CHANGELOG</a><br>
&gt;&gt;<br>
&gt;&gt; 1.6.0 (2023-12-07)<br>
&gt;&gt;<br>
&gt;&gt; - Drop support 2.7-3.5 and clean backward compatible code (pull/15=
2)<br>
&gt;&gt; - Add Python 3.12 wheels<br>
&gt;&gt;<br>
&gt;&gt; 1.5.1 (2023-12-06)<br>
&gt;&gt;<br>
&gt;&gt; - Add support for Python 3.12<br>
&gt;&gt; - Fix child callgrind functions disappear<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com=
" target=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; All tests pass on qemux86-64<br>
&gt;&gt; Upstream GitHub Actions CI also passed with submitted patches<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 .../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 ...nality-convert-line-endings-to-Unix.patch} | 120 +++++---=
----------<br>
&gt;&gt;=C2=A0 ...port-of-tests.utils-to-enable-pytest.patch | 101 ++++++++=
+++++++<br>
&gt;&gt;=C2=A0 .../0002-add-3.11-to-the-setup.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 26 ----<br>
&gt;&gt;=C2=A0 .../python/python3-yappi/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-yappi_1.4.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-yappi_1.4.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 36 ------<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-yappi_1.6.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-yappi_1.6.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 37 ++++++<br>
&gt;&gt;=C2=A0 7 files changed, 175 insertions(+), 149 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta-python/recipes-devtools/python/python3-yappi/{00=
01-Fix-imports-for-ptests.patch =3D&gt; 0001-test_functionality-convert-lin=
e-endings-to-Unix.patch} (95%)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/pytho=
n3-yappi/0002-Fix-import-of-tests.utils-to-enable-pytest.patch<br>
&gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/pytho=
n3-yappi/0002-add-3.11-to-the-setup.patch<br>
&gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-yappi_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-yappi_1.4.0.bb</a><br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-yappi_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-yappi_1.6.0.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-python/conf/include/ptest-packagelists-meta-pyth=
on.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
&gt;&gt; index 3272d98192..e1732c6177 100644<br>
&gt;&gt; --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<=
br>
&gt;&gt; +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<=
br>
&gt;&gt; @@ -54,6 +54,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PTESTS_SLOW_META_PYTHON =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 python3-lz4 \<br>
&gt;&gt; +=C2=A0 =C2=A0 python3-yappi \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PTESTS_PROBLEMS_META_PYTHON =3D&quot;\<br>
&gt;&gt; @@ -82,6 +83,5 @@ PTESTS_PROBLEMS_META_PYTHON =3D&quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 python3-whoosh \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 python3-ujson \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 python3-xlrd \<br>
&gt;&gt; -=C2=A0 =C2=A0 python3-yappi \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 python3-yarl \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3-yappi/000=
1-Fix-imports-for-ptests.patch b/meta-python/recipes-devtools/python/python=
3-yappi/0001-test_functionality-convert-line-endings-to-Unix.patch<br>
&gt;&gt; similarity index 95%<br>
&gt;&gt; rename from meta-python/recipes-devtools/python/python3-yappi/0001=
-Fix-imports-for-ptests.patch<br>
&gt;&gt; rename to meta-python/recipes-devtools/python/python3-yappi/0001-t=
est_functionality-convert-line-endings-to-Unix.patch<br>
&gt;&gt; index 476db4b7d0..70d4607c29 100644<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-i=
mports-for-ptests.patch<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-yappi/0001-test_=
functionality-convert-line-endings-to-Unix.patch<br>
&gt;&gt; @@ -1,44 +1,23 @@<br>
&gt;&gt; -From 0dedc1c573ddc4e87475eb03c64555cd54a72e92 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; -From: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriv=
er.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt;&gt; -Date: Mon, 7 Jun 2021 09:40:20 -0400<br>
&gt;&gt; -Subject: [PATCH] Fix imports for tests<br>
&gt;&gt; +From 0136ca731cba8b056b3f2ff0e7df3953b94f1e87 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" t=
arget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;&gt; +Date: Sun, 24 Dec 2023 09:41:57 -0800<br>
&gt;&gt; +Subject: [PATCH 1/2] test_functionality: convert line endings to =
Unix<br>
&gt;&gt;<br>
&gt;&gt; -Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gambli=
n@windriver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt;&gt; ----<br>
&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt; +Convert the Windows line endings with dos2unix to be like the<br>
&gt;&gt; +other files in tests/*<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/sumerc/=
yappi/pull/164" rel=3D"noreferrer" target=3D"_blank">https://github.com/sum=
erc/yappi/pull/164</a>]<br>
&gt;&gt;<br>
&gt;&gt; - tests/test_asyncio.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
&gt;&gt; - tests/test_asyncio_context_vars.py | 2 +-<br>
&gt;&gt; - tests/test_functionality.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br=
>
&gt;&gt; - tests/test_hooks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
&gt;&gt; - tests/test_tags.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt; - 5 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;&gt; +Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsul=
ko.com" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + tests/test_functionality.py | 3822 +++++++++++++++++------------=
------<br>
&gt;&gt; + 1 file changed, 1911 insertions(+), 1911 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; ---- a/tests/test_asyncio.py<br>
&gt;&gt; -+++ b/tests/test_asyncio.py<br>
&gt;&gt; -@@ -2,7 +2,7 @@ import unittest<br>
&gt;&gt; - import yappi<br>
&gt;&gt; - import asyncio<br>
&gt;&gt; - import threading<br>
&gt;&gt; --from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu=
, burn_io<br>
&gt;&gt; -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cp=
u, burn_io<br>
&gt;&gt; -<br>
&gt;&gt; -<br>
&gt;&gt; - async def async_sleep(sec):<br>
&gt;&gt; ---- a/tests/test_asyncio_context_vars.py<br>
&gt;&gt; -+++ b/tests/test_asyncio_context_vars.py<br>
&gt;&gt; -@@ -5,7 +5,7 @@ import contextvars<br>
&gt;&gt; - import functools<br>
&gt;&gt; - import time<br>
&gt;&gt; - import os<br>
&gt;&gt; --import utils<br>
&gt;&gt; -+import tests.utils as utils<br>
&gt;&gt; - import yappi<br>
&gt;&gt; -<br>
&gt;&gt; - async_context_id =3D contextvars.ContextVar(&#39;async_context_i=
d&#39;)<br>
&gt;&gt; +diff --git a/tests/test_functionality.py b/tests/test_functionali=
ty.py<br>
&gt;&gt; +index 0e99c47..38bbe67 100644<br>
&gt;&gt;=C2=A0 --- a/tests/test_functionality.py<br>
&gt;&gt;=C2=A0 +++ b/tests/test_functionality.py<br>
&gt;&gt; -@@ -1,1916 +1,1916 @@<br>
&gt;&gt; +@@ -1,1911 +1,1911 @@<br>
&gt;&gt;=C2=A0 -import os<br>
&gt;&gt;=C2=A0 -import sys<br>
&gt;&gt;=C2=A0 -import time<br>
&gt;&gt; @@ -47,7 +26,7 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 -import yappi<br>
&gt;&gt;=C2=A0 -import _yappi<br>
&gt;&gt;=C2=A0 -import utils<br>
&gt;&gt; --import multiprocessing=C2=A0 # added to fix <a href=3D"http://bu=
gs.python.org/issue15881" rel=3D"noreferrer" target=3D"_blank">http://bugs.=
python.org/issue15881</a> for &gt; Py2.6<br>
&gt;&gt; +-import multiprocessing<br>
&gt;&gt;=C2=A0 -import subprocess<br>
&gt;&gt;=C2=A0 -<br>
&gt;&gt;=C2=A0 -_counter =3D 0<br>
&gt;&gt; @@ -318,10 +297,10 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 def test_profile_decorator(self):<br>
&gt;&gt;=C2=A0 -<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def aggregate(func, stats):<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D &quot;tests/=
%s.profile&quot; % (func.__name__)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D f&quot;tests=
/{func.__name__}.profile&quot;<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sta=
ts.add(fname)<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError:<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pas=
s<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(fname)=
<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&=
quot;messing around&quot;)<br>
&gt;&gt; @@ -1232,7 +1211,7 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: I put dummy() to fix be=
low, remove the comments after a while.<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue( # FIX: I see t=
his fails sometimes?<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsm is not None,<=
br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Could not find &q=
uot;_MainThread&quot;. Found: %s&#39; % (&#39;, &#39;.join(utils.get_stat_n=
ames(tstats))))<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Could not find =
\&quot;_MainThread\&quot;. Found: {&#39;, &#39;.join(utils.get_stat_names(t=
stats))}&quot;)<br>
&gt;&gt;=C2=A0 -<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 def test_ctx_stats(self):<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 from threading import Thread<br=
>
&gt;&gt; @@ -1312,7 +1291,7 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: I put dummy() to fix be=
low, remove the comments after a while.<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue( # FIX: I see t=
his fails sometimes<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsmain is not Non=
e,<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Could not find &q=
uot;_MainThread&quot;. Found: %s&#39; % (&#39;, &#39;.join(utils.get_stat_n=
ames(stats))))<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Could not find =
\&quot;_MainThread\&quot;. Found: {&#39;, &#39;.join(utils.get_stat_names(s=
tats))}&quot;)<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(1.0 &gt; tst2.t=
tot &gt;=3D 0.5)<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(1.0 &gt; tst1.t=
tot &gt;=3D 0.5)<br>
&gt;&gt;=C2=A0 -<br>
&gt;&gt; @@ -1369,7 +1348,7 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts =3D []<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in (0.01, 0=
.05, 0.1):<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =
=3D threading.Thread(target=3Dburn_cpu, args=3D(i, ))<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://t.name" rel=3D"noreferrer" target=3D"_blank">t.name</a> =3D &quo=
t;burn_cpu-%s&quot; % str(i)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://t.name" rel=3D"noreferrer" target=3D"_blank">t.name</a> =3D f&qu=
ot;burn_cpu-{str(i)}&quot;<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.s=
tart()<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.=
append(t)<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in ts:<br>
&gt;&gt; @@ -1396,10 +1375,7 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 def test_producer_consumer_with_queues(self):=
<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # we currently just stress yapp=
i, no functionality test is done here.<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if utils.is_py3x():<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue import Queu=
e<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from Queue import Queu=
e<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue import Queue<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 from threading import Thread<br=
>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORKER_THREAD_COUNT =3D 50<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORK_ITEM_COUNT =3D 2000<br>
&gt;&gt; @@ -1458,7 +1434,6 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsh =3D utils.find_stat_by_name=
(stats, &quot;handler&quot;)<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsh is not None=
)<br>
&gt;&gt;=C2=A0 -<br>
&gt;&gt; --=C2=A0 =C2=A0 @unittest.skipIf(not sys.version_info &gt;=3D (3, =
2), &quot;requires Python 3.2&quot;)<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 def test_concurrent_futures(self):<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 from concurrent.futures import =
ThreadPoolExecutor<br>
&gt;&gt; @@ -1468,7 +1443,6 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1.0)<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt;&gt;=C2=A0 -<br>
&gt;&gt; --=C2=A0 =C2=A0 @unittest.skipIf(not sys.version_info &gt;=3D (3, =
2), &quot;requires Python 3.2&quot;)<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 def test_barrier(self):<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D threading.Barrier(2, time=
out=3D1)<br>
&gt;&gt; @@ -1962,8 +1936,8 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 +import unittest<br>
&gt;&gt;=C2=A0 +import yappi<br>
&gt;&gt;=C2=A0 +import _yappi<br>
&gt;&gt; -+import tests.utils as utils<br>
&gt;&gt; -+import multiprocessing=C2=A0 # added to fix <a href=3D"http://bu=
gs.python.org/issue15881" rel=3D"noreferrer" target=3D"_blank">http://bugs.=
python.org/issue15881</a> for &gt; Py2.6<br>
&gt;&gt; ++import utils<br>
&gt;&gt; ++import multiprocessing<br>
&gt;&gt;=C2=A0 +import subprocess<br>
&gt;&gt;=C2=A0 +<br>
&gt;&gt;=C2=A0 +_counter =3D 0<br>
&gt;&gt; @@ -2234,10 +2208,10 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 def test_profile_decorator(self):<br>
&gt;&gt;=C2=A0 +<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def aggregate(func, stats):<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D &quot;tests/=
%s.profile&quot; % (func.__name__)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fname =3D f&quot;tests=
/{func.__name__}.profile&quot;<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sta=
ts.add(fname)<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except IOError:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError:<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pas=
s<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stats.save(fname)=
<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&=
quot;messing around&quot;)<br>
&gt;&gt; @@ -3007,8 +2981,8 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 +<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 def test_issue_32(self):<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;&#39;<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Start yappi from different thread an=
d we get Internal Error(15) as<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 the current_ctx_id() called while en=
umerating the threads in start()<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Start yappi from different thread an=
d we get Internal Error(15) as<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 the current_ctx_id() called while en=
umerating the threads in start()<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and as it does not swap to the =
enumerated ThreadState* the THreadState_GetDict()<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 returns wrong object and thus s=
ets an invalid id for the _ctx structure.<br>
&gt;&gt;=C2=A0 +<br>
&gt;&gt; @@ -3148,7 +3122,7 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: I put dummy() to fix be=
low, remove the comments after a while.<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue( # FIX: I see t=
his fails sometimes?<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsm is not None,<=
br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Could not find &q=
uot;_MainThread&quot;. Found: %s&#39; % (&#39;, &#39;.join(utils.get_stat_n=
ames(tstats))))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Could not find =
\&quot;_MainThread\&quot;. Found: {&#39;, &#39;.join(utils.get_stat_names(t=
stats))}&quot;)<br>
&gt;&gt;=C2=A0 +<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 def test_ctx_stats(self):<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 from threading import Thread<br=
>
&gt;&gt; @@ -3228,7 +3202,7 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: I put dummy() to fix be=
low, remove the comments after a while.<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue( # FIX: I see t=
his fails sometimes<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tsmain is not Non=
e,<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Could not find &q=
uot;_MainThread&quot;. Found: %s&#39; % (&#39;, &#39;.join(utils.get_stat_n=
ames(stats))))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Could not find =
\&quot;_MainThread\&quot;. Found: {&#39;, &#39;.join(utils.get_stat_names(s=
tats))}&quot;)<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(1.0 &gt; tst2.t=
tot &gt;=3D 0.5)<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(1.0 &gt; tst1.t=
tot &gt;=3D 0.5)<br>
&gt;&gt;=C2=A0 +<br>
&gt;&gt; @@ -3285,7 +3259,7 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts =3D []<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in (0.01, 0=
.05, 0.1):<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t =
=3D threading.Thread(target=3Dburn_cpu, args=3D(i, ))<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://t.name" rel=3D"noreferrer" target=3D"_blank">t.name</a> =3D &quo=
t;burn_cpu-%s&quot; % str(i)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"http://t.name" rel=3D"noreferrer" target=3D"_blank">t.name</a> =3D f&qu=
ot;burn_cpu-{str(i)}&quot;<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t.s=
tart()<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts.=
append(t)<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in ts:<br>
&gt;&gt; @@ -3312,10 +3286,7 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 def test_producer_consumer_with_queues(self):=
<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # we currently just stress yapp=
i, no functionality test is done here.<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if utils.is_py3x():<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue import Queu=
e<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from Queue import Queu=
e<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 from queue import Queue<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 from threading import Thread<br=
>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORKER_THREAD_COUNT =3D 50<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 WORK_ITEM_COUNT =3D 2000<br>
&gt;&gt; @@ -3374,7 +3345,6 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsh =3D utils.find_stat_by_name=
(stats, &quot;handler&quot;)<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(fsh is not None=
)<br>
&gt;&gt;=C2=A0 +<br>
&gt;&gt; -+=C2=A0 =C2=A0 @unittest.skipIf(not sys.version_info &gt;=3D (3, =
2), &quot;requires Python 3.2&quot;)<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 def test_concurrent_futures(self):<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 from concurrent.futures import =
ThreadPoolExecutor<br>
&gt;&gt; @@ -3384,7 +3354,6 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1.0)<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.stop()<br>
&gt;&gt;=C2=A0 +<br>
&gt;&gt; -+=C2=A0 =C2=A0 @unittest.skipIf(not sys.version_info &gt;=3D (3, =
2), &quot;requires Python 3.2&quot;)<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 def test_barrier(self):<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 yappi.start()<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D threading.Barrier(2, time=
out=3D1)<br>
&gt;&gt; @@ -3871,25 +3840,6 @@ Upstream-Status: Pending<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0import sys;sys.argv =3D =
[&#39;&#39;, &#39;BasicUsage.test_run_as_script&#39;]<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0import sys;sys.argv =3D =
[&#39;&#39;, &#39;MultithreadedScenarios.test_subsequent_profile&#39;]<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 unittest.main()<br>
&gt;&gt; ---- a/tests/test_hooks.py<br>
&gt;&gt; -+++ b/tests/test_hooks.py<br>
&gt;&gt; -@@ -5,7 +5,7 @@ import unittest<br>
&gt;&gt; - import time<br>
&gt;&gt; -<br>
&gt;&gt; - import yappi<br>
&gt;&gt; --import utils<br>
&gt;&gt; -+import tests.utils as utils<br>
&gt;&gt; -<br>
&gt;&gt; -<br>
&gt;&gt; - def a():<br>
&gt;&gt; ---- a/tests/test_tags.py<br>
&gt;&gt; -+++ b/tests/test_tags.py<br>
&gt;&gt; -@@ -2,7 +2,7 @@ import unittest<br>
&gt;&gt; - import yappi<br>
&gt;&gt; - import threading<br>
&gt;&gt; - import time<br>
&gt;&gt; --from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu=
, burn_io<br>
&gt;&gt; -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cp=
u, burn_io<br>
&gt;&gt; -<br>
&gt;&gt; -<br>
&gt;&gt; - class MultiThreadTests(YappiUnitTestCase):<br>
&gt;&gt; +--<br>
&gt;&gt; +2.34.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3-yappi/000=
2-Fix-import-of-tests.utils-to-enable-pytest.patch b/meta-python/recipes-de=
vtools/python/python3-yappi/0002-Fix-import-of-tests.utils-to-enable-pytest=
.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..96dd024125<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-i=
mport-of-tests.utils-to-enable-pytest.patch<br>
&gt;&gt; @@ -0,0 +1,101 @@<br>
&gt;&gt; +From 28eac38566327091221aabbc164ea8e433c66e7e Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" t=
arget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;&gt; +Date: Sun, 24 Dec 2023 09:27:50 -0800<br>
&gt;&gt; +Subject: [PATCH 2/2] Fix import of tests.utils to enable pytest<b=
r>
&gt;&gt; +<br>
&gt;&gt; +Running the test cases with pytest leads to importlib errors<br>
&gt;&gt; +because the &quot;utils&quot; module cannot be found.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/sumerc/=
yappi/pull/164" rel=3D"noreferrer" target=3D"_blank">https://github.com/sum=
erc/yappi/pull/164</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsul=
ko.com" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + tests/test_asyncio.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
&gt;&gt; + tests/test_asyncio_context_vars.py | 2 +-<br>
&gt;&gt; + tests/test_functionality.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br=
>
&gt;&gt; + tests/test_gevent.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
&gt;&gt; + tests/test_hooks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
&gt;&gt; + tests/test_tags.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt; + 6 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/tests/test_asyncio.py b/tests/test_asyncio.py<br>
&gt;&gt; +index 8e9e631..bb36f4a 100644<br>
&gt;&gt; +--- a/tests/test_asyncio.py<br>
&gt;&gt; ++++ b/tests/test_asyncio.py<br>
&gt;&gt; +@@ -2,7 +2,7 @@ import unittest<br>
&gt;&gt; + import yappi<br>
&gt;&gt; + import asyncio<br>
&gt;&gt; + import threading<br>
&gt;&gt; +-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu=
, burn_io<br>
&gt;&gt; ++from tests.utils import YappiUnitTestCase, find_stat_by_name, bu=
rn_cpu, burn_io<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; + async def async_sleep(sec):<br>
&gt;&gt; +diff --git a/tests/test_asyncio_context_vars.py b/tests/test_asyn=
cio_context_vars.py<br>
&gt;&gt; +index 5bd750c..9a253c0 100644<br>
&gt;&gt; +--- a/tests/test_asyncio_context_vars.py<br>
&gt;&gt; ++++ b/tests/test_asyncio_context_vars.py<br>
&gt;&gt; +@@ -5,7 +5,7 @@ import contextvars<br>
&gt;&gt; + import functools<br>
&gt;&gt; + import time<br>
&gt;&gt; + import os<br>
&gt;&gt; +-import utils<br>
&gt;&gt; ++import tests.utils as utils<br>
&gt;&gt; + import yappi<br>
&gt;&gt; +<br>
&gt;&gt; + async_context_id =3D contextvars.ContextVar(&#39;async_context_i=
d&#39;)<br>
&gt;&gt; +diff --git a/tests/test_functionality.py b/tests/test_functionali=
ty.py<br>
&gt;&gt; +index 38bbe67..8098f17 100644<br>
&gt;&gt; +--- a/tests/test_functionality.py<br>
&gt;&gt; ++++ b/tests/test_functionality.py<br>
&gt;&gt; +@@ -5,7 +5,7 @@ import threading<br>
&gt;&gt; + import unittest<br>
&gt;&gt; + import yappi<br>
&gt;&gt; + import _yappi<br>
&gt;&gt; +-import utils<br>
&gt;&gt; ++import tests.utils as utils<br>
&gt;&gt; + import multiprocessing<br>
&gt;&gt; + import subprocess<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/tests/test_gevent.py b/tests/test_gevent.py<br>
&gt;&gt; +index ed9e6ae..502af5f 100644<br>
&gt;&gt; +--- a/tests/test_gevent.py<br>
&gt;&gt; ++++ b/tests/test_gevent.py<br>
&gt;&gt; +@@ -2,7 +2,7 @@ import unittest<br>
&gt;&gt; + import _yappi<br>
&gt;&gt; + import yappi<br>
&gt;&gt; + import threading<br>
&gt;&gt; +-from utils import (<br>
&gt;&gt; ++from tests.utils import (<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0YappiUnitTestCase, find_stat_by_name, burn_cp=
u, burn_io, burn_io_gevent<br>
&gt;&gt; + )<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/tests/test_hooks.py b/tests/test_hooks.py<br>
&gt;&gt; +index 297c643..8c387fc 100644<br>
&gt;&gt; +--- a/tests/test_hooks.py<br>
&gt;&gt; ++++ b/tests/test_hooks.py<br>
&gt;&gt; +@@ -5,7 +5,7 @@ import unittest<br>
&gt;&gt; + import time<br>
&gt;&gt; +<br>
&gt;&gt; + import yappi<br>
&gt;&gt; +-import utils<br>
&gt;&gt; ++import tests.utils as utils<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; + def a():<br>
&gt;&gt; +diff --git a/tests/test_tags.py b/tests/test_tags.py<br>
&gt;&gt; +index b0b531d..b5a4016 100644<br>
&gt;&gt; +--- a/tests/test_tags.py<br>
&gt;&gt; ++++ b/tests/test_tags.py<br>
&gt;&gt; +@@ -2,7 +2,7 @@ import unittest<br>
&gt;&gt; + import yappi<br>
&gt;&gt; + import threading<br>
&gt;&gt; + import time<br>
&gt;&gt; +-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu=
, burn_io<br>
&gt;&gt; ++from tests.utils import YappiUnitTestCase, find_stat_by_name, bu=
rn_cpu, burn_io<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; + class MultiThreadTests(YappiUnitTestCase):<br>
&gt;&gt; +--<br>
&gt;&gt; +2.34.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3-yappi/000=
2-add-3.11-to-the-setup.patch b/meta-python/recipes-devtools/python/python3=
-yappi/0002-add-3.11-to-the-setup.patch<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index d40bd2b7cc..0000000000<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3=
.11-to-the-setup.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,26 +0,0 @@<br>
&gt;&gt; -From 38afdacf526410f970afc58e147c7377c6c7112c Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; -From: =3D?UTF-8?q?S=3DC3=3DBCmer=3D20Cip?=3D &lt;<a href=3D"mailt=
o:sumer.cip@platform.sh" target=3D"_blank">sumer.cip@platform.sh</a>&gt;<br=
>
&gt;&gt; -Date: Fri, 25 Nov 2022 15:58:03 +0300<br>
&gt;&gt; -Subject: [PATCH 2/2] add 3.11 to the setup<br>
&gt;&gt; -<br>
&gt;&gt; ----<br>
&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt; -<br>
&gt;&gt; - setup.py | 1 +<br>
&gt;&gt; - 1 file changed, 1 insertion(+)<br>
&gt;&gt; -<br>
&gt;&gt; -diff --git a/setup.py b/setup.py<br>
&gt;&gt; -index d006787..96e2a66 100644<br>
&gt;&gt; ---- a/setup.py<br>
&gt;&gt; -+++ b/setup.py<br>
&gt;&gt; -@@ -56,6 +56,7 @@ CLASSIFIERS =3D [<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0&#39;Programming Language :: Python :: 3.8&#3=
9;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0&#39;Programming Language :: Python :: 3.9&#3=
9;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0&#39;Programming Language :: Python :: 3.10&#=
39;,<br>
&gt;&gt; -+=C2=A0 =C2=A0 &#39;Programming Language :: Python :: 3.11&#39;,<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0&#39;Programming Language :: Python :: Implem=
entation :: CPython&#39;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0&#39;Operating System :: OS Independent&#39;,=
<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0&#39;Topic :: Software Development :: Librari=
es&#39;,<br>
&gt;&gt; ---<br>
&gt;&gt; -2.30.2<br>
&gt;&gt; -<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3-yappi/run=
-ptest b/meta-python/recipes-devtools/python/python3-yappi/run-ptest<br>
&gt;&gt; index 3385d68939..8d2017d39c 100644<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/python3-yappi/run-ptest<=
br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-yappi/run-ptest<=
br>
&gt;&gt; @@ -1,3 +1,3 @@<br>
&gt;&gt;=C2=A0 #!/bin/sh<br>
&gt;&gt;<br>
&gt;&gt; -pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e &#39;s/=
\[...%\]//g&#39;| sed -e &#39;s/PASSED/PASS/g&#39;| sed -e &#39;s/FAILED/FA=
IL/g&#39;|sed -e &#39;s/SKIPED/SKIP/g&#39;| awk &#39;{if ($NF=3D=3D&quot;PA=
SS&quot; || $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=
=3D=3D&quot;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;){printf &quot;%s: %s\=
n&quot;, $NF, $0}else{print}}&#39;| awk &#39;{if ($NF=3D=3D&quot;PASS&quot;=
 || $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quo=
t;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;) {$NF=3D&quot;&quot;;print $0}e=
lse{print}}&#39;<br>
&gt;&gt; +pytest --automake<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-yappi_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi=
_1.4.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-yappi_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.4.0=
.bb</a><br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 71e74e86f2..0000000000<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-yappi_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.4.0.=
bb</a><br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,36 +0,0 @@<br>
&gt;&gt; -SUMMARY=C2=A0 =3D &quot;Yet Another Python Profiler&quot;<br>
&gt;&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/sumerc/yappi" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/sumerc/yappi</a>&quot=
;<br>
&gt;&gt; -<br>
&gt;&gt; -LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D71c208c9a4fd86438=
5eb69ad4caa3bee&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;504b5d8fc7433736cb5e257991d2e7f29460=
19174f1faec7b2fe947881a17fc0&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -SRC_URI +=3D &quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://run-ptest \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://0001-Fix-imports-for-ptests.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 file://0002-add-3.11-to-the-setup.patch \<br>
&gt;&gt; -&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -inherit pypi setuptools3 ptest<br>
&gt;&gt; -<br>
&gt;&gt; -RDEPENDS:${PN} +=3D &quot;\<br>
&gt;&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-datetime \<br>
&gt;&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-pickle \<br>
&gt;&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-threading \<br>
&gt;&gt; -&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt;&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-gevent \<br>
&gt;&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-multiprocessing \<br>
&gt;&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
&gt;&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-profile \<br>
&gt;&gt; -=C2=A0 =C2=A0 ${PYTHON_PN}-zopeinterface \<br>
&gt;&gt; -&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -do_install_ptest() {<br>
&gt;&gt; -=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
&gt;&gt; -=C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
&gt;&gt; -=C2=A0 =C2=A0 cp -f ${S}/yappi/yappi.py ${D}/${PTEST_PATH}/<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-yappi_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi=
_1.6.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-yappi_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.6.0=
.bb</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..4349cab1e7<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-yappi_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-yappi_1.6.0.=
bb</a><br>
&gt;&gt; @@ -0,0 +1,37 @@<br>
&gt;&gt; +SUMMARY=C2=A0 =3D &quot;Yet Another Python Profiler&quot;<br>
&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/sumerc/yappi" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/sumerc/yappi</a>&quot=
;<br>
&gt;&gt; +<br>
&gt;&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D71c208c9a4fd86438=
5eb69ad4caa3bee&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;a9aaf72009d8c03067294151ee0470ac7a6d=
fa7b33baab40b198d6c1ef00430a&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI +=3D &quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://run-ptest \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://0001-test_functionality-convert-line-endings=
-to-Unix.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 file://0002-Fix-import-of-tests.utils-to-enable-pyt=
est.patch \<br>
&gt;&gt; +&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit pypi python_setuptools_build_meta ptest<br>
&gt;&gt; +<br>
&gt;&gt; +RDEPENDS:${PN} +=3D &quot;\<br>
&gt;&gt; +=C2=A0 =C2=A0 python3-datetime \<br>
&gt;&gt; +=C2=A0 =C2=A0 python3-pickle \<br>
&gt;&gt; +=C2=A0 =C2=A0 python3-threading \<br>
&gt;&gt; +&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 python3-gevent \<br>
&gt;&gt; +=C2=A0 =C2=A0 python3-multiprocessing \<br>
&gt;&gt; +=C2=A0 =C2=A0 python3-pytest \<br>
&gt;&gt; +=C2=A0 =C2=A0 python3-profile \<br>
&gt;&gt; +=C2=A0 =C2=A0 python3-unittest-automake-output \<br>
&gt;&gt; +=C2=A0 =C2=A0 python3-zopeinterface \<br>
&gt;&gt; +&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +do_install_ptest() {<br>
&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
&gt;&gt; +=C2=A0 =C2=A0 cp -rf ${S}/tests ${D}${PTEST_PATH}<br>
&gt;&gt; +=C2=A0 =C2=A0 cp -f ${S}/run_tests.py ${D}${PTEST_PATH}<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#107782): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/107782" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/107782</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1033=
50816/924729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/103350816/924729</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.=
com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div>

--0000000000007dca6e060d852ed4--

