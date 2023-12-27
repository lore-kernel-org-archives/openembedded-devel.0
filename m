Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556CEC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 21:46:24 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.110897.1703713579444400552
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 13:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jxkNKivs;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-204e1203a22so407343fac.1
        for <Openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 13:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703713579; x=1704318379; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4WgzOEi0rayNSjWiJoyY8Ny2yMFt7rF1HRYjuz/nWE=;
        b=jxkNKivsglev/Eho0sql366wLaLkH8QO/VBnHb8xjSoDcpcJ97qu2YSezcwAM1bSdu
         I6QMrVn4xZ/2f3jpJYNW1KGBwNz2UO7qx9JzbDWEFLDaIZ53ZozwsMLYz6gRp44BKOCH
         KYtVDyfTqqfSbhkehTfJnyEzLZB8gmSRwEr3WdUJxxDiaL1Hd3XhbHIJ3po/joIroXzn
         BF9pG2/fPruhB9jsckPn2tT+xUkHBO3zfAVbolCfu+P41sm5BWajjr+GzZ7UVXbVBn09
         cYbUaODr5Jo15yr++EH5rVOqmb1QDN0Ozo/WqxPeIU9M9pj0QLtyLxrl5tdKXwp6l39+
         /cWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703713579; x=1704318379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4WgzOEi0rayNSjWiJoyY8Ny2yMFt7rF1HRYjuz/nWE=;
        b=eLhmm+VXmutQaALuLsiZZvrnwHJX5Os/vrIrtldhlHJtP/MiKxU5ejDtqWJMcv2/Bx
         uIYvhHpHfFiYftxP6ikROcroL15K8l0tcBNLW1v9YZJ5NlSmRlPT3MejJaQixU4G2cL/
         wD/x3p3GRet9I4lxJuQh3s+etkokQpJyWL3RI1RLt5C3fQEU9a5UTQxATdf4sTIbIo7t
         W0P0Z1JjyLtRhTYq1nQzheTHBbm7LhmaIxs77Rj27NETM+wx87FTriMxE0b9G4OLsHqu
         g5gzxU9vSCGDxiTI1EbCRUYc9KWOFm1WA6KPfmit5SuE9qbWMlNQxSaSfbdSDEgntTRm
         9HSg==
X-Gm-Message-State: AOJu0YwAhIPxhBxnrdYU9BeopJLOFziGJrKAhbhOqM46LRGKftcQ1UDq
	sYmmGrHFOWyf2JMoCmWDhPDu2uowQnmUq5qIo7Q=
X-Google-Smtp-Source: AGHT+IEicEIIoryYN+i3vvlEvUJw4qAGCIfFQE3J5tyPkSk78cD9gdccUGavkUo3/sBg1nnq+ZRgo46HGj1/hhPEMFc=
X-Received: by 2002:a05:6871:5827:b0:204:254a:44fc with SMTP id
 oj39-20020a056871582700b00204254a44fcmr8102114oac.13.1703713578538; Wed, 27
 Dec 2023 13:46:18 -0800 (PST)
MIME-Version: 1.0
References: <17A3D724672C20F7.18684@lists.openembedded.org> <CANx9H-ChW547oCmp36u9vOh08BEdiLH6rFu++BuF8EF8kVsfzA@mail.gmail.com>
In-Reply-To: <CANx9H-ChW547oCmp36u9vOh08BEdiLH6rFu++BuF8EF8kVsfzA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Dec 2023 13:45:52 -0800
Message-ID: <CAMKF1spf8ZLbtr6ZCTyy+H9X4YcXk3-4QreXoASjHqRR4H-9rw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-yappi: upgrade 1.4.0 -> 1.6.0;
 fix ptests
To: Tim Orling <ticotimo@gmail.com>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 21:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107871

right, its in master-next already.

On Wed, Dec 27, 2023 at 1:23=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
>
> Gentle ping. This one supersedes the on from Alex, since it fixes the pri=
ests.
>
> On Sun, Dec 24, 2023 at 10:13=E2=80=AFAM Tim Orling via lists.openembedde=
d.org <ticotimo=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> * Switch to the python_setuptools_build_meta PEP-517 backend
>> * Refactor and submit 0001-Fix-imports-for-ptests.patch
>>   - split out the Windows -> Unix line endings conversion
>>   - https://github.com/sumerc/yappi/pull/164
>> * Drop 0002-add-3.11-to-the-setup.patch; upstream added 3.11 and 3.12
>> * Drop install of yappi.py in ptest; use site-packages as intended
>> * Drop complex run-ptest and simply run 'pytest --automake'
>> * Move out of "problems" group to "slow" group in ptest-packageslists-me=
ta-python.inc
>>   - can now build meta-python-image-ptest-python3-yappi
>>   - tests take about 45 seconds
>>
>> https://github.com/sumerc/yappi/blob/1.6.0/CHANGELOG
>>
>> 1.6.0 (2023-12-07)
>>
>> - Drop support 2.7-3.5 and clean backward compatible code (pull/152)
>> - Add Python 3.12 wheels
>>
>> 1.5.1 (2023-12-06)
>>
>> - Add support for Python 3.12
>> - Fix child callgrind functions disappear
>>
>> Signed-off-by: Tim Orling <ticotimo@gmail.com>
>> ---
>> All tests pass on qemux86-64
>> Upstream GitHub Actions CI also passed with submitted patches
>>
>>  .../ptest-packagelists-meta-python.inc        |   2 +-
>>  ...nality-convert-line-endings-to-Unix.patch} | 120 +++++-------------
>>  ...port-of-tests.utils-to-enable-pytest.patch | 101 +++++++++++++++
>>  .../0002-add-3.11-to-the-setup.patch          |  26 ----
>>  .../python/python3-yappi/run-ptest            |   2 +-
>>  .../python/python3-yappi_1.4.0.bb             |  36 ------
>>  .../python/python3-yappi_1.6.0.bb             |  37 ++++++
>>  7 files changed, 175 insertions(+), 149 deletions(-)
>>  rename meta-python/recipes-devtools/python/python3-yappi/{0001-Fix-impo=
rts-for-ptests.patch =3D> 0001-test_functionality-convert-line-endings-to-U=
nix.patch} (95%)
>>  create mode 100644 meta-python/recipes-devtools/python/python3-yappi/00=
02-Fix-import-of-tests.utils-to-enable-pytest.patch
>>  delete mode 100644 meta-python/recipes-devtools/python/python3-yappi/00=
02-add-3.11-to-the-setup.patch
>>  delete mode 100644 meta-python/recipes-devtools/python/python3-yappi_1.=
4.0.bb
>>  create mode 100644 meta-python/recipes-devtools/python/python3-yappi_1.=
6.0.bb
>>
>> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc=
 b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> index 3272d98192..e1732c6177 100644
>> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>> @@ -54,6 +54,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>>
>>  PTESTS_SLOW_META_PYTHON =3D "\
>>      python3-lz4 \
>> +    python3-yappi \
>>  "
>>
>>  PTESTS_PROBLEMS_META_PYTHON =3D"\
>> @@ -82,6 +83,5 @@ PTESTS_PROBLEMS_META_PYTHON =3D"\
>>      python3-whoosh \
>>      python3-ujson \
>>      python3-xlrd \
>> -    python3-yappi \
>>      python3-yarl \
>>  "
>> diff --git a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-=
imports-for-ptests.patch b/meta-python/recipes-devtools/python/python3-yapp=
i/0001-test_functionality-convert-line-endings-to-Unix.patch
>> similarity index 95%
>> rename from meta-python/recipes-devtools/python/python3-yappi/0001-Fix-i=
mports-for-ptests.patch
>> rename to meta-python/recipes-devtools/python/python3-yappi/0001-test_fu=
nctionality-convert-line-endings-to-Unix.patch
>> index 476db4b7d0..70d4607c29 100644
>> --- a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports=
-for-ptests.patch
>> +++ b/meta-python/recipes-devtools/python/python3-yappi/0001-test_functi=
onality-convert-line-endings-to-Unix.patch
>> @@ -1,44 +1,23 @@
>> -From 0dedc1c573ddc4e87475eb03c64555cd54a72e92 Mon Sep 17 00:00:00 2001
>> -From: Trevor Gamblin <trevor.gamblin@windriver.com>
>> -Date: Mon, 7 Jun 2021 09:40:20 -0400
>> -Subject: [PATCH] Fix imports for tests
>> +From 0136ca731cba8b056b3f2ff0e7df3953b94f1e87 Mon Sep 17 00:00:00 2001
>> +From: Tim Orling <tim.orling@konsulko.com>
>> +Date: Sun, 24 Dec 2023 09:41:57 -0800
>> +Subject: [PATCH 1/2] test_functionality: convert line endings to Unix
>>
>> -Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ----
>> -Upstream-Status: Pending
>> +Convert the Windows line endings with dos2unix to be like the
>> +other files in tests/*
>> +
>> +Upstream-Status: Submitted [https://github.com/sumerc/yappi/pull/164]
>>
>> - tests/test_asyncio.py              | 2 +-
>> - tests/test_asyncio_context_vars.py | 2 +-
>> - tests/test_functionality.py        | 2 +-
>> - tests/test_hooks.py                | 2 +-
>> - tests/test_tags.py                 | 2 +-
>> - 5 files changed, 6 insertions(+), 6 deletions(-)
>> +Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> +---
>> + tests/test_functionality.py | 3822 +++++++++++++++++------------------
>> + 1 file changed, 1911 insertions(+), 1911 deletions(-)
>>
>> ---- a/tests/test_asyncio.py
>> -+++ b/tests/test_asyncio.py
>> -@@ -2,7 +2,7 @@ import unittest
>> - import yappi
>> - import asyncio
>> - import threading
>> --from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn=
_io
>> -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, bur=
n_io
>> -
>> -
>> - async def async_sleep(sec):
>> ---- a/tests/test_asyncio_context_vars.py
>> -+++ b/tests/test_asyncio_context_vars.py
>> -@@ -5,7 +5,7 @@ import contextvars
>> - import functools
>> - import time
>> - import os
>> --import utils
>> -+import tests.utils as utils
>> - import yappi
>> -
>> - async_context_id =3D contextvars.ContextVar('async_context_id')
>> +diff --git a/tests/test_functionality.py b/tests/test_functionality.py
>> +index 0e99c47..38bbe67 100644
>>  --- a/tests/test_functionality.py
>>  +++ b/tests/test_functionality.py
>> -@@ -1,1916 +1,1916 @@
>> +@@ -1,1911 +1,1911 @@
>>  -import os
>>  -import sys
>>  -import time
>> @@ -47,7 +26,7 @@ Upstream-Status: Pending
>>  -import yappi
>>  -import _yappi
>>  -import utils
>> --import multiprocessing  # added to fix http://bugs.python.org/issue158=
81 for > Py2.6
>> +-import multiprocessing
>>  -import subprocess
>>  -
>>  -_counter =3D 0
>> @@ -318,10 +297,10 @@ Upstream-Status: Pending
>>  -    def test_profile_decorator(self):
>>  -
>>  -        def aggregate(func, stats):
>> --            fname =3D "tests/%s.profile" % (func.__name__)
>> +-            fname =3D f"tests/{func.__name__}.profile"
>>  -            try:
>>  -                stats.add(fname)
>> --            except IOError:
>> +-            except OSError:
>>  -                pass
>>  -            stats.save(fname)
>>  -            raise Exception("messing around")
>> @@ -1232,7 +1211,7 @@ Upstream-Status: Pending
>>  -        # TODO: I put dummy() to fix below, remove the comments after =
a while.
>>  -        self.assertTrue( # FIX: I see this fails sometimes?
>>  -            tsm is not None,
>> --            'Could not find "_MainThread". Found: %s' % (', '.join(uti=
ls.get_stat_names(tstats))))
>> +-            f"Could not find \"_MainThread\". Found: {', '.join(utils.=
get_stat_names(tstats))}")
>>  -
>>  -    def test_ctx_stats(self):
>>  -        from threading import Thread
>> @@ -1312,7 +1291,7 @@ Upstream-Status: Pending
>>  -        # TODO: I put dummy() to fix below, remove the comments after =
a while.
>>  -        self.assertTrue( # FIX: I see this fails sometimes
>>  -            tsmain is not None,
>> --            'Could not find "_MainThread". Found: %s' % (', '.join(uti=
ls.get_stat_names(stats))))
>> +-            f"Could not find \"_MainThread\". Found: {', '.join(utils.=
get_stat_names(stats))}")
>>  -        self.assertTrue(1.0 > tst2.ttot >=3D 0.5)
>>  -        self.assertTrue(1.0 > tst1.ttot >=3D 0.5)
>>  -
>> @@ -1369,7 +1348,7 @@ Upstream-Status: Pending
>>  -            ts =3D []
>>  -            for i in (0.01, 0.05, 0.1):
>>  -                t =3D threading.Thread(target=3Dburn_cpu, args=3D(i, )=
)
>> --                t.name =3D "burn_cpu-%s" % str(i)
>> +-                t.name =3D f"burn_cpu-{str(i)}"
>>  -                t.start()
>>  -                ts.append(t)
>>  -            for t in ts:
>> @@ -1396,10 +1375,7 @@ Upstream-Status: Pending
>>  -    def test_producer_consumer_with_queues(self):
>>  -        # we currently just stress yappi, no functionality test is don=
e here.
>>  -        yappi.start()
>> --        if utils.is_py3x():
>> --            from queue import Queue
>> --        else:
>> --            from Queue import Queue
>> +-        from queue import Queue
>>  -        from threading import Thread
>>  -        WORKER_THREAD_COUNT =3D 50
>>  -        WORK_ITEM_COUNT =3D 2000
>> @@ -1458,7 +1434,6 @@ Upstream-Status: Pending
>>  -        fsh =3D utils.find_stat_by_name(stats, "handler")
>>  -        self.assertTrue(fsh is not None)
>>  -
>> --    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Pytho=
n 3.2")
>>  -    def test_concurrent_futures(self):
>>  -        yappi.start()
>>  -        from concurrent.futures import ThreadPoolExecutor
>> @@ -1468,7 +1443,6 @@ Upstream-Status: Pending
>>  -        time.sleep(1.0)
>>  -        yappi.stop()
>>  -
>> --    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Pytho=
n 3.2")
>>  -    def test_barrier(self):
>>  -        yappi.start()
>>  -        b =3D threading.Barrier(2, timeout=3D1)
>> @@ -1962,8 +1936,8 @@ Upstream-Status: Pending
>>  +import unittest
>>  +import yappi
>>  +import _yappi
>> -+import tests.utils as utils
>> -+import multiprocessing  # added to fix http://bugs.python.org/issue158=
81 for > Py2.6
>> ++import utils
>> ++import multiprocessing
>>  +import subprocess
>>  +
>>  +_counter =3D 0
>> @@ -2234,10 +2208,10 @@ Upstream-Status: Pending
>>  +    def test_profile_decorator(self):
>>  +
>>  +        def aggregate(func, stats):
>> -+            fname =3D "tests/%s.profile" % (func.__name__)
>> ++            fname =3D f"tests/{func.__name__}.profile"
>>  +            try:
>>  +                stats.add(fname)
>> -+            except IOError:
>> ++            except OSError:
>>  +                pass
>>  +            stats.save(fname)
>>  +            raise Exception("messing around")
>> @@ -3007,8 +2981,8 @@ Upstream-Status: Pending
>>  +
>>  +    def test_issue_32(self):
>>  +        '''
>> -+        Start yappi from different thread and we get Internal Error(15=
) as
>> -+        the current_ctx_id() called while enumerating the threads in s=
tart()
>> ++        Start yappi from different thread and we get Internal Error(15=
) as
>> ++        the current_ctx_id() called while enumerating the threads in s=
tart()
>>  +        and as it does not swap to the enumerated ThreadState* the THr=
eadState_GetDict()
>>  +        returns wrong object and thus sets an invalid id for the _ctx =
structure.
>>  +
>> @@ -3148,7 +3122,7 @@ Upstream-Status: Pending
>>  +        # TODO: I put dummy() to fix below, remove the comments after =
a while.
>>  +        self.assertTrue( # FIX: I see this fails sometimes?
>>  +            tsm is not None,
>> -+            'Could not find "_MainThread". Found: %s' % (', '.join(uti=
ls.get_stat_names(tstats))))
>> ++            f"Could not find \"_MainThread\". Found: {', '.join(utils.=
get_stat_names(tstats))}")
>>  +
>>  +    def test_ctx_stats(self):
>>  +        from threading import Thread
>> @@ -3228,7 +3202,7 @@ Upstream-Status: Pending
>>  +        # TODO: I put dummy() to fix below, remove the comments after =
a while.
>>  +        self.assertTrue( # FIX: I see this fails sometimes
>>  +            tsmain is not None,
>> -+            'Could not find "_MainThread". Found: %s' % (', '.join(uti=
ls.get_stat_names(stats))))
>> ++            f"Could not find \"_MainThread\". Found: {', '.join(utils.=
get_stat_names(stats))}")
>>  +        self.assertTrue(1.0 > tst2.ttot >=3D 0.5)
>>  +        self.assertTrue(1.0 > tst1.ttot >=3D 0.5)
>>  +
>> @@ -3285,7 +3259,7 @@ Upstream-Status: Pending
>>  +            ts =3D []
>>  +            for i in (0.01, 0.05, 0.1):
>>  +                t =3D threading.Thread(target=3Dburn_cpu, args=3D(i, )=
)
>> -+                t.name =3D "burn_cpu-%s" % str(i)
>> ++                t.name =3D f"burn_cpu-{str(i)}"
>>  +                t.start()
>>  +                ts.append(t)
>>  +            for t in ts:
>> @@ -3312,10 +3286,7 @@ Upstream-Status: Pending
>>  +    def test_producer_consumer_with_queues(self):
>>  +        # we currently just stress yappi, no functionality test is don=
e here.
>>  +        yappi.start()
>> -+        if utils.is_py3x():
>> -+            from queue import Queue
>> -+        else:
>> -+            from Queue import Queue
>> ++        from queue import Queue
>>  +        from threading import Thread
>>  +        WORKER_THREAD_COUNT =3D 50
>>  +        WORK_ITEM_COUNT =3D 2000
>> @@ -3374,7 +3345,6 @@ Upstream-Status: Pending
>>  +        fsh =3D utils.find_stat_by_name(stats, "handler")
>>  +        self.assertTrue(fsh is not None)
>>  +
>> -+    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Pytho=
n 3.2")
>>  +    def test_concurrent_futures(self):
>>  +        yappi.start()
>>  +        from concurrent.futures import ThreadPoolExecutor
>> @@ -3384,7 +3354,6 @@ Upstream-Status: Pending
>>  +        time.sleep(1.0)
>>  +        yappi.stop()
>>  +
>> -+    @unittest.skipIf(not sys.version_info >=3D (3, 2), "requires Pytho=
n 3.2")
>>  +    def test_barrier(self):
>>  +        yappi.start()
>>  +        b =3D threading.Barrier(2, timeout=3D1)
>> @@ -3871,25 +3840,6 @@ Upstream-Status: Pending
>>  +    #     import sys;sys.argv =3D ['', 'BasicUsage.test_run_as_script'=
]
>>  +    #     import sys;sys.argv =3D ['', 'MultithreadedScenarios.test_su=
bsequent_profile']
>>  +    unittest.main()
>> ---- a/tests/test_hooks.py
>> -+++ b/tests/test_hooks.py
>> -@@ -5,7 +5,7 @@ import unittest
>> - import time
>> -
>> - import yappi
>> --import utils
>> -+import tests.utils as utils
>> -
>> -
>> - def a():
>> ---- a/tests/test_tags.py
>> -+++ b/tests/test_tags.py
>> -@@ -2,7 +2,7 @@ import unittest
>> - import yappi
>> - import threading
>> - import time
>> --from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn=
_io
>> -+from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, bur=
n_io
>> -
>> -
>> - class MultiThreadTests(YappiUnitTestCase):
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-=
import-of-tests.utils-to-enable-pytest.patch b/meta-python/recipes-devtools=
/python/python3-yappi/0002-Fix-import-of-tests.utils-to-enable-pytest.patch
>> new file mode 100644
>> index 0000000000..96dd024125
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-=
of-tests.utils-to-enable-pytest.patch
>> @@ -0,0 +1,101 @@
>> +From 28eac38566327091221aabbc164ea8e433c66e7e Mon Sep 17 00:00:00 2001
>> +From: Tim Orling <tim.orling@konsulko.com>
>> +Date: Sun, 24 Dec 2023 09:27:50 -0800
>> +Subject: [PATCH 2/2] Fix import of tests.utils to enable pytest
>> +
>> +Running the test cases with pytest leads to importlib errors
>> +because the "utils" module cannot be found.
>> +
>> +Upstream-Status: Submitted [https://github.com/sumerc/yappi/pull/164]
>> +
>> +Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> +---
>> + tests/test_asyncio.py              | 2 +-
>> + tests/test_asyncio_context_vars.py | 2 +-
>> + tests/test_functionality.py        | 2 +-
>> + tests/test_gevent.py               | 2 +-
>> + tests/test_hooks.py                | 2 +-
>> + tests/test_tags.py                 | 2 +-
>> + 6 files changed, 6 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/tests/test_asyncio.py b/tests/test_asyncio.py
>> +index 8e9e631..bb36f4a 100644
>> +--- a/tests/test_asyncio.py
>> ++++ b/tests/test_asyncio.py
>> +@@ -2,7 +2,7 @@ import unittest
>> + import yappi
>> + import asyncio
>> + import threading
>> +-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn=
_io
>> ++from tests.utils import YappiUnitTestCase, find_stat_by_name, burn_cpu=
, burn_io
>> +
>> +
>> + async def async_sleep(sec):
>> +diff --git a/tests/test_asyncio_context_vars.py b/tests/test_asyncio_co=
ntext_vars.py
>> +index 5bd750c..9a253c0 100644
>> +--- a/tests/test_asyncio_context_vars.py
>> ++++ b/tests/test_asyncio_context_vars.py
>> +@@ -5,7 +5,7 @@ import contextvars
>> + import functools
>> + import time
>> + import os
>> +-import utils
>> ++import tests.utils as utils
>> + import yappi
>> +
>> + async_context_id =3D contextvars.ContextVar('async_context_id')
>> +diff --git a/tests/test_functionality.py b/tests/test_functionality.py
>> +index 38bbe67..8098f17 100644
>> +--- a/tests/test_functionality.py
>> ++++ b/tests/test_functionality.py
>> +@@ -5,7 +5,7 @@ import threading
>> + import unittest
>> + import yappi
>> + import _yappi
>> +-import utils
>> ++import tests.utils as utils
>> + import multiprocessing
>> + import subprocess
>> +
>> +diff --git a/tests/test_gevent.py b/tests/test_gevent.py
>> +index ed9e6ae..502af5f 100644
>> +--- a/tests/test_gevent.py
>> ++++ b/tests/test_gevent.py
>> +@@ -2,7 +2,7 @@ import unittest
>> + import _yappi
>> + import yappi
>> + import threading
>> +-from utils import (
>> ++from tests.utils import (
>> +     YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io, burn_io_g=
event
>> + )
>> +
>> +diff --git a/tests/test_hooks.py b/tests/test_hooks.py
>> +index 297c643..8c387fc 100644
>> +--- a/tests/test_hooks.py
>> ++++ b/tests/test_hooks.py
>> +@@ -5,7 +5,7 @@ import unittest
>> + import time
>> +
>> + import yappi
>> +-import utils
>> ++import tests.utils as utils
>> +
>> +
>> + def a():
>> +diff --git a/tests/test_tags.py b/tests/test_tags.py
>> +index b0b531d..b5a4016 100644
>> +--- a/tests/test_tags.py
>> ++++ b/tests/test_tags.py
>> +@@ -2,7 +2,7 @@ import unittest
>> + import yappi
>> + import threading
>> + import time
>> +-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn=
_io
>> ++from tests.utils import YappiUnitTestCase, find_stat_by_name, burn_cpu=
, burn_io
>> +
>> +
>> + class MultiThreadTests(YappiUnitTestCase):
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-yappi/0002-add-=
3.11-to-the-setup.patch b/meta-python/recipes-devtools/python/python3-yappi=
/0002-add-3.11-to-the-setup.patch
>> deleted file mode 100644
>> index d40bd2b7cc..0000000000
>> --- a/meta-python/recipes-devtools/python/python3-yappi/0002-add-3.11-to=
-the-setup.patch
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -From 38afdacf526410f970afc58e147c7377c6c7112c Mon Sep 17 00:00:00 2001
>> -From: =3D?UTF-8?q?S=3DC3=3DBCmer=3D20Cip?=3D <sumer.cip@platform.sh>
>> -Date: Fri, 25 Nov 2022 15:58:03 +0300
>> -Subject: [PATCH 2/2] add 3.11 to the setup
>> -
>> ----
>> -Upstream-Status: Pending
>> -
>> - setup.py | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/setup.py b/setup.py
>> -index d006787..96e2a66 100644
>> ---- a/setup.py
>> -+++ b/setup.py
>> -@@ -56,6 +56,7 @@ CLASSIFIERS =3D [
>> -     'Programming Language :: Python :: 3.8',
>> -     'Programming Language :: Python :: 3.9',
>> -     'Programming Language :: Python :: 3.10',
>> -+    'Programming Language :: Python :: 3.11',
>> -     'Programming Language :: Python :: Implementation :: CPython',
>> -     'Operating System :: OS Independent',
>> -     'Topic :: Software Development :: Libraries',
>> ---
>> -2.30.2
>> -
>> diff --git a/meta-python/recipes-devtools/python/python3-yappi/run-ptest=
 b/meta-python/recipes-devtools/python/python3-yappi/run-ptest
>> index 3385d68939..8d2017d39c 100644
>> --- a/meta-python/recipes-devtools/python/python3-yappi/run-ptest
>> +++ b/meta-python/recipes-devtools/python/python3-yappi/run-ptest
>> @@ -1,3 +1,3 @@
>>  #!/bin/sh
>>
>> -pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//=
g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKI=
P/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $N=
F=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}}=
'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
>> +pytest --automake
>> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb =
b/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
>> deleted file mode 100644
>> index 71e74e86f2..0000000000
>> --- a/meta-python/recipes-devtools/python/python3-yappi_1.4.0.bb
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -SUMMARY  =3D "Yet Another Python Profiler"
>> -HOMEPAGE =3D "https://github.com/sumerc/yappi"
>> -
>> -LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D71c208c9a4fd864385eb69ad4caa=
3bee"
>> -
>> -SRC_URI[sha256sum] =3D "504b5d8fc7433736cb5e257991d2e7f2946019174f1faec=
7b2fe947881a17fc0"
>> -
>> -SRC_URI +=3D " \
>> -    file://run-ptest \
>> -    file://0001-Fix-imports-for-ptests.patch \
>> -    file://0002-add-3.11-to-the-setup.patch \
>> -"
>> -
>> -inherit pypi setuptools3 ptest
>> -
>> -RDEPENDS:${PN} +=3D "\
>> -    ${PYTHON_PN}-datetime \
>> -    ${PYTHON_PN}-pickle \
>> -    ${PYTHON_PN}-threading \
>> -"
>> -
>> -RDEPENDS:${PN}-ptest +=3D " \
>> -    ${PYTHON_PN}-gevent \
>> -    ${PYTHON_PN}-multiprocessing \
>> -    ${PYTHON_PN}-pytest \
>> -    ${PYTHON_PN}-profile \
>> -    ${PYTHON_PN}-zopeinterface \
>> -"
>> -
>> -do_install_ptest() {
>> -    install -d ${D}${PTEST_PATH}/tests
>> -    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>> -    cp -f ${S}/yappi/yappi.py ${D}/${PTEST_PATH}/
>> -}
>> -
>> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb =
b/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
>> new file mode 100644
>> index 0000000000..4349cab1e7
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
>> @@ -0,0 +1,37 @@
>> +SUMMARY  =3D "Yet Another Python Profiler"
>> +HOMEPAGE =3D "https://github.com/sumerc/yappi"
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D71c208c9a4fd864385eb69ad4caa=
3bee"
>> +
>> +SRC_URI[sha256sum] =3D "a9aaf72009d8c03067294151ee0470ac7a6dfa7b33baab4=
0b198d6c1ef00430a"
>> +
>> +SRC_URI +=3D " \
>> +    file://run-ptest \
>> +    file://0001-test_functionality-convert-line-endings-to-Unix.patch \
>> +    file://0002-Fix-import-of-tests.utils-to-enable-pytest.patch \
>> +"
>> +
>> +inherit pypi python_setuptools_build_meta ptest
>> +
>> +RDEPENDS:${PN} +=3D "\
>> +    python3-datetime \
>> +    python3-pickle \
>> +    python3-threading \
>> +"
>> +
>> +RDEPENDS:${PN}-ptest +=3D " \
>> +    python3-gevent \
>> +    python3-multiprocessing \
>> +    python3-pytest \
>> +    python3-profile \
>> +    python3-unittest-automake-output \
>> +    python3-zopeinterface \
>> +"
>> +
>> +do_install_ptest() {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    cp -rf ${S}/tests ${D}${PTEST_PATH}
>> +    cp -f ${S}/run_tests.py ${D}${PTEST_PATH}
>> +}
>> +
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#107782): https://lists.openembedded.org/g/openembedd=
ed-devel/message/107782
>> Mute This Topic: https://lists.openembedded.org/mt/103350816/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

