Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.7618.1622857342775281461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 18:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i/WbGpOR;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id 76so11216714qkn.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 18:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qXmkWoAIxDv9rSkxWLxWRfBARYpYdjNf3cPYNmGSfao=;
        b=i/WbGpORYBAwHqU6fI7gUBcpn+J0CHoke/lcTGloKbLL3sApVpDddfuHIT4wCnfNs6
         jJQuOO/mlPfVIblavgRDZcrnLsUOVEdpbze9q7mwWHmBJ93Aok2mlDxaP1XJf5zVxi2p
         PdbVDC5Sq5wh+FQKe5d1pcsWBsL5wr1TkmxnByqWDh5cMuhtTcF66llusT4mJM4vfZYr
         6hoi2XB589TOEFxsvdus3JUl0r5RFpb//I9b868MvfUuodOLXiSgkb6Kl5K6/TtkqiAc
         XXuUQxJuFwSxndR/lwnZ3V2Gm4a4IVbZiKz7zyTNJg0CSg5X60dqcozK9S7mojOoJNb6
         rIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qXmkWoAIxDv9rSkxWLxWRfBARYpYdjNf3cPYNmGSfao=;
        b=GrVN1qHkIgFRerkxsxnLNwgqwZe6PO+1zh1JDr9RE2+Ik+/EhnG5xNuo7bYxVKpkPI
         /HALG56NJtwBi+UDC4SnA8WwGaL4ijkz3p066fec7IJYwNFgI2oVAwZeHYFMVZDiUXfc
         3bY3f+y81O8LMl1oMFdL9qms7lBWg4ojBsKxJF39YkpcUDftze3CsL7K5kayBTuJtMWA
         a6/ulGXh4P2DkXoJ0QjQaI1TD0yM8HN31ih/QBZUxR/hYTim6zXXBFTyIyehd9NHG9d8
         vvypIze3QgLLbEFBsG3ESzWR/Jr6yQOX2mJcb7kerDNym12jts6NI0XacQiIgTtlgAcP
         Mj2g==
X-Gm-Message-State: AOAM531P+mKJSpP/JmdbpwdIcJYtmb1hDGr6Zbmn8ACbIc2yrDNJZRW+
	wZyVok/MEjGxADhSgSztq5p8b32JEVU2TGq17fo=
X-Google-Smtp-Source: ABdhPJx6FaUqfnB9i99G3Ig8Im/TjICZvRcyvkYD4oJuXvcaRf3/48Ix9UZR7/0WP2V5lh1ImjjOMgray5FUjboUCXA=
X-Received: by 2002:ae9:e40f:: with SMTP id q15mr7132514qkc.125.1622857341788;
 Fri, 04 Jun 2021 18:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210604135143.1215766-1-trevor.gamblin@windriver.com>
In-Reply-To: <20210604135143.1215766-1-trevor.gamblin@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 4 Jun 2021 18:41:56 -0700
Message-ID: <CAMKF1srh94uNbM85ffaoEE_0RvoOO8xWT3WTU5TTqk0Z64+xTQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-yappi: fix ptests
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Fails to patch

https://errors.yoctoproject.org/Errors/Details/586001/

On Fri, Jun 4, 2021 at 6:52 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> - Add a patch to fix imports in unit tests
> - Add python3-gevent and python3-zopeinterface to ptest RDEPENDS
> - Sort ptest RDEPENDS alphabetically
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../0001-Fix-imports-for-ptests.patch         | 102 ++++++++++++++++++
>  .../python/python3-yappi_1.3.2.bb             |   5 +-
>  2 files changed, 106 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch b/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
> new file mode 100644
> index 000000000..e00b7a818
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-yappi/0001-Fix-imports-for-ptests.patch
> @@ -0,0 +1,102 @@
> +From f27b40e9824615ce5b61b37f58a279703ee04712 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <trevor.gamblin@windriver.com>
> +Date: Fri, 4 Jun 2021 09:17:38 -0400
> +Subject: [PATCH] Fix imports for ptests
> +
> +yappi's ptests are failing because the import statements for the "utils"
> +module are not properly given as relative imports and/or aliased. Fix
> +this here for 1.3.2 while trying to get it submitted upstream.
> +
> +Upstream-Status: Submitted (https://github.com/sumerc/yappi/pull/84)
> +
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
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
> +index 4ac4c5f..4de94cf 100644
> +--- a/tests/test_asyncio.py
> ++++ b/tests/test_asyncio.py
> +@@ -2,7 +2,7 @@ import unittest
> + import yappi
> + import asyncio
> + import threading
> +-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io
> ++from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io
> +
> +
> + @asyncio.coroutine
> +diff --git a/tests/test_asyncio_context_vars.py b/tests/test_asyncio_context_vars.py
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
> + async_context_id = contextvars.ContextVar('async_context_id')
> +diff --git a/tests/test_functionality.py b/tests/test_functionality.py
> +index a73cb63..2ab273f 100644
> +--- a/tests/test_functionality.py
> ++++ b/tests/test_functionality.py
> +@@ -5,7 +5,7 @@ import threading
> + import unittest
> + import yappi
> + import _yappi
> +-import utils
> ++import tests.utils as utils
> + import multiprocessing  # added to fix http://bugs.python.org/issue15881 for > Py2.6
> + import subprocess
> +
> +diff --git a/tests/test_gevent.py b/tests/test_gevent.py
> +index 8569712..fe15b29 100644
> +--- a/tests/test_gevent.py
> ++++ b/tests/test_gevent.py
> +@@ -4,7 +4,7 @@ import yappi
> + import gevent
> + from gevent.event import Event
> + import threading
> +-from utils import (
> ++from .utils import (
> +     YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io,
> +     burn_io_gevent
> + )
> +diff --git a/tests/test_hooks.py b/tests/test_hooks.py
> +index a96a4f1..e4177ba 100644
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
> +index b0b531d..1928888 100644
> +--- a/tests/test_tags.py
> ++++ b/tests/test_tags.py
> +@@ -2,7 +2,7 @@ import unittest
> + import yappi
> + import threading
> + import time
> +-from utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io
> ++from .utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io
> +
> +
> + class MultiThreadTests(YappiUnitTestCase):
> +--
> +2.31.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
> index 7c3f0fd4b..8a1aca21f 100644
> --- a/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
> @@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "a51d3e6e5563cc74b5bb82ed6e7bd44a9c1a7eae3d97e4d52e9465edb3
>
>  SRC_URI += " \
>      file://run-ptest \
> +    file://0001-Fix-imports-for-ptests.patch \
>  "
>
>  inherit pypi setuptools3 ptest
> @@ -19,9 +20,11 @@ RDEPENDS_${PN} += "\
>  "
>
>  RDEPENDS_${PN}-ptest += " \
> -    ${PYTHON_PN}-pytest \
> +    ${PYTHON_PN}-gevent \
>      ${PYTHON_PN}-multiprocessing \
> +    ${PYTHON_PN}-pytest \
>      ${PYTHON_PN}-profile \
> +    ${PYTHON_PN}-zopeinterface \
>  "
>
>  do_install_ptest() {
> --
> 2.31.1
>
>
> 
>
