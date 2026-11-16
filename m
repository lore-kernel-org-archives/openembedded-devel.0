Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33671.1794851722152945927
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sJLnPQyH;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36f6295304dso3149397eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851721; x=1795456521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPW2FW4k9tlfZLyXjnhi78pUXgKZ9eD9RUDxsWyQOb8=;
        b=sJLnPQyHcbHwGSFISkBWYiUFX1N1kiu/0CS/uCZ+6y9FUsFBN7AMC1cmeifmlqS7z4
         IQGFpvWlUupKzjqTKMdl30NqPmPs4lpTyteCg2W+6Rr8p2CnxCkzS/VWJqI/4zNZXy2k
         PpsybJCfKh28hfPLCjBg3UNd2e45X34pe4mQqKuXVUk9d0KoC5XS4fNuB4xTroeZNhQm
         vFBygLmSnxig6ZxDMW0GT/G4R1y9+Ys8FXJRVDPfDvS9+OJk99mDypjs1EBiGyjINIuv
         zJmsQ1IOCG6Du+YlO+oHkV6lsrujytxH87rJXvU1IR+rUa6qS0nt/VMXpVgLFPMnNmaP
         NeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851721; x=1795456521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JPW2FW4k9tlfZLyXjnhi78pUXgKZ9eD9RUDxsWyQOb8=;
        b=WDHksmIc+V4cHKFMmyqotZnOMM1cUB15ytaD4oWpdE1KmWBrGrJi+znJZ2Ngo9duDe
         aFz+LozR+J04olWnAHjIzQRkXszD4eP8YPrzbkb7o2+YjqlMAU4HgBR6c1YhtSoh6yIi
         gqp4tjF6s9V5I9JtgP64DmqNbTkoOusY7vmldhIrH+Mxh7QsLj0CRNv/mbGvmqY0O9jH
         KkNL7chEUn5/GpfJKrZnlcj6ghRRJFG/tC3rHVOi1ZbMLX3SxMq6ALLro8Zkj+DS6s//
         DTDCQMHktzjggPGU9AmOfIlkWVSeH33B3cyMvubajSBkqlNDibbVsK11MbTd/GUxDwkr
         KQPQ==
X-Gm-Message-State: APuU4Z9zQSeV74bOL5kKCFTlF1tHu5Ow8tblgWyqu/zNREsR/Q+dhuid
	/eL1mD4i+wJgJ263WSF04RqqSXO4J3IKYaioJcDF6sLGLQGH3uImraF/irI4v9/h
X-Gm-Gg: AZFdTZfUtvDOVsvO20KQCRXDobiYhe355O0SG3vUQ75ZseXCBRDn7FrbgJb9rJ+2vrI
	odCKJC6ZEzrxWK+pN8Fkgt2a9WYtUwqxi5viSfCwSQVu7paID3D61h09+RQpupzUbPL67O8b548
	bPzLe24DRvOv4fQL9Km3u6Pr0EX7miofeA9UUGcEzZghtuAZN2u8wGhuiWpqhQENohCvJ0qoa/D
	u8zvxOJKiLSiyO5iqcHIqfhh3eXmBmTw1ztkULPsG1Lfq7XWdTdytlndLd8I4IUDlSE0uI/oZQE
	B64joT9Ucv08QPvWy3uqI5jNoQ9PeUOtjp1RO6ddHKHLiq0cqN9gYzmMh32mggF1SMM2RF0JCmU
	gZcooZVdmBL8RvXKJtylLfnL1commvYHwtoWG50y0amf6P3eeK9T6+xrZqpiRQgwJig7WMT+bq4
	car1IKo+rH986KRPu+T9aXJ34edrn+xv3IjdKcGoruSDu2DMfYtwZQgCPmtgQeHomj1kZ5qmnWS
	WtbzSzVyerM5MlA3Pcv39u47BxqrdurEF2nCdkiZj+J/w+NIu1G9pRQymVTylGjSdBZQSZr5XZ4
	AkdjSRsfAj1EJc8Y5hv67a0jQpQyYal8+kCh7Dovd/kGGYs5i+gOkPCcTsV1GMwQXpWmfBzqhuZ
	GfJB0k/PGZ8uIo93ziKcz6FqZjloDpyQaHoB/dvMcjHBZ0b4o8NF2V8V1Q/mAVC+IlPXebtgVtb
	RusK0pLGJJKWVDd9OeigWoCr1/CDx9w0JEURUCbVzQ8T557kBsTvnamGFB3jAgmUMUfo/EMX3od
	8hjF6lMV4UlbXXw8Ba8ruyHnBTCwB0hUPw8AnAYSkGtYUpLxHygOQTHyBznPaQfXFnrT4seiY3P
	829zujdCshE+t1NBaSKFUeh0tw==
X-Received: by 2002:a05:7301:d814:b0:36f:be1f:1191 with SMTP id 5a478bee46e88-37a8852abe3mr9896965eec.29.1794851721288;
        Mon, 16 Nov 2026 09:55:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 054/105] python3-dateutil: upgrade 2.9.0 -> 4.0.0
Date: Mon, 16 Nov 2026 09:53:06 -0800
Message-ID: <20261116175359.342679-54-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132510
Content-Type: text/plain; charset="utf-8"

Upstream dropped six and builds with hatchling; drop the six patch,
inherit python_hatchling and add the new tzdata runtime dependency.

Changes:
- 3.0.0: new runtime dependency on tzdata; the bundled zoneinfo
  database is no longer shipped and dateutil.zoneinfo is deprecated.
- 3.0.0: tz.tzfile rewritten (v2/v3 tzfile and slim binaries, times
  past 2038); nonexistent times now follow PEP 495, so offsets differ.
- 4.0.0: requires Python 3.11+; six dependency removed; build backend
  switched to Hatchling.
- 4.0.0: isoparse now rejects non-exact digit fields (breaking for
  sloppy input); fix cached rrule/rruleset hang, relativedelta
  yearday=366, tzutc/tzoffset unpickling; rrulestr ignores X- params.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-drop-the-six-dependency.patch        | 751 ------------------
 ...til_2.9.0.bb => python3-dateutil_4.0.0.bb} |  11 +-
 2 files changed, 4 insertions(+), 758 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dateutil/0001-drop-the-six-dependency.patch
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.9.0.bb => python3-dateutil_4.0.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-dateutil/0001-drop-the-six-dependency.patch b/meta-python/recipes-devtools/python/python3-dateutil/0001-drop-the-six-dependency.patch
deleted file mode 100644
index 94ada60075..0000000000
--- a/meta-python/recipes-devtools/python/python3-dateutil/0001-drop-the-six-dependency.patch
+++ /dev/null
@@ -1,751 +0,0 @@
-From 81e23b3bffdb1ec451b2ed02bc377b1be53b2b5f Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Mon, 21 Sep 2026 12:30:09 +0200
-Subject: [PATCH] drop the six dependency
-
-six is a Python 2 compatibility shim and dateutil no longer needs it on
-Python 3: the metaclass decorators, the string and integer type aliases,
-raise_from and the six.moves imports of _thread, range and winreg all
-have direct equivalents in the standard library.
-
-Upstream-Status: Pending
-
-AI-Generated: Uses Claude Code (Claude Opus 5)
----
- pyproject.toml                   | 1 -
- setup.cfg                        | 1 -
- src/dateutil/parser/_parser.py   | 14 ++++++--------
- src/dateutil/parser/isoparser.py | 5 ++---
- src/dateutil/relativedelta.py    | 3 +--
- src/dateutil/rrule.py            | 41 ++++++++++++++++++++---------------------
- src/dateutil/tz/_common.py       | 15 +--------------
- src/dateutil/tz/_factories.py    | 2 +-
- src/dateutil/tz/tz.py            | 19 +++++++------------
- src/dateutil/tz/win.py           | 7 +++----
- tests/property/test_tz_prop.py   | 6 +-----
- tests/test_imports.py            | 9 ++-------
- tests/test_isoparser.py          | 16 +++++-----------
- tests/test_parser.py             | 13 +++----------
- tests/test_rrule.py              | 38 --------------------------------------
- tests/test_tz.py                 | 6 ------
- updatezinfo.py                   | 4 ++--
- 17 files changed, 54 insertions(+), 146 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 67ad619..12da1f4 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -57,7 +57,6 @@ known_first_party = ["dateutil"]
- known_third_party=[
-     "pytest",
-     "hypothesis",
--    "six",
-     "freezegun",
-     "mock",
- ]
-diff --git a/setup.cfg b/setup.cfg
-index 4f91e34..84f19f3 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -39,7 +39,6 @@ classifiers =
- [options]
- zip_safe = True
- setup_requires = setuptools_scm
--install_requires = six >= 1.5
- package_dir = 
- 	=src
- python_requires = >=2.7, !=3.0.*, !=3.1.*, !=3.2.*
-diff --git a/src/dateutil/parser/_parser.py b/src/dateutil/parser/_parser.py
-index 37d1663..41d3d9f 100644
---- a/src/dateutil/parser/_parser.py
-+++ b/src/dateutil/parser/_parser.py
-@@ -39,8 +39,6 @@ import warnings
- from calendar import monthrange
- from io import StringIO
- 
--import six
--from six import integer_types, text_type
- 
- from decimal import Decimal
- 
-@@ -63,7 +61,7 @@ class _timelex(object):
-         if isinstance(instream, (bytes, bytearray)):
-             instream = instream.decode()
- 
--        if isinstance(instream, text_type):
-+        if isinstance(instream, str):
-             instream = StringIO(instream)
-         elif getattr(instream, 'read', None) is None:
-             raise TypeError('Parser must be a string or character stream, not '
-@@ -648,7 +646,7 @@ class parser(object):
-         try:
-             ret = self._build_naive(res, default)
-         except ValueError as e:
--            six.raise_from(ParserError(str(e) + ": %s", timestr), e)
-+            raise ParserError(str(e) + ": %s", timestr) from e
- 
-         if not ignoretz:
-             ret = self._build_tzaware(ret, res, tzinfos)
-@@ -878,7 +876,7 @@ class parser(object):
-         try:
-             value = self._to_decimal(value_repr)
-         except Exception as e:
--            six.raise_from(ValueError('Unknown numeric token'), e)
-+            raise ValueError('Unknown numeric token') from e
- 
-         len_li = len(value_repr)
- 
-@@ -1147,7 +1145,7 @@ class parser(object):
-                 raise ValueError("Converted decimal value is infinite or NaN")
-         except Exception as e:
-             msg = "Could not convert %s to decimal" % val
--            six.raise_from(ValueError(msg), e)
-+            raise ValueError(msg) from e
-         else:
-             return decimal_value
- 
-@@ -1165,9 +1163,9 @@ class parser(object):
-         # eg tzinfos = {'BRST' : None}
-         if isinstance(tzdata, datetime.tzinfo) or tzdata is None:
-             tzinfo = tzdata
--        elif isinstance(tzdata, text_type):
-+        elif isinstance(tzdata, str):
-             tzinfo = tz.tzstr(tzdata)
--        elif isinstance(tzdata, integer_types):
-+        elif isinstance(tzdata, int):
-             tzinfo = tz.tzoffset(tzname, tzdata)
-         else:
-             raise TypeError("Offset must be tzinfo subclass, tz string, "
-diff --git a/src/dateutil/parser/isoparser.py b/src/dateutil/parser/isoparser.py
-index 7060087..d296948 100644
---- a/src/dateutil/parser/isoparser.py
-+++ b/src/dateutil/parser/isoparser.py
-@@ -14,7 +14,6 @@ from dateutil import tz
- from functools import wraps
- 
- import re
--import six
- 
- __all__ = ["isoparse", "isoparser"]
- 
-@@ -26,13 +25,13 @@ def _takes_ascii(f):
-         str_in = getattr(str_in, 'read', lambda: str_in)()
- 
-         # If it's unicode, turn it into bytes, since ISO-8601 only covers ASCII
--        if isinstance(str_in, six.text_type):
-+        if isinstance(str_in, str):
-             # ASCII is the same in UTF-8
-             try:
-                 str_in = str_in.encode('ascii')
-             except UnicodeEncodeError as e:
-                 msg = 'ISO-8601 strings should contain only ASCII characters'
--                six.raise_from(ValueError(msg), e)
-+                raise ValueError(msg) from e
- 
-         return f(self, str_in, *args, **kwargs)
- 
-diff --git a/src/dateutil/relativedelta.py b/src/dateutil/relativedelta.py
-index cd323a5..8283d7e 100644
---- a/src/dateutil/relativedelta.py
-+++ b/src/dateutil/relativedelta.py
-@@ -5,7 +5,6 @@ import calendar
- import operator
- from math import copysign
- 
--from six import integer_types
- from warnings import warn
- 
- from ._common import weekday
-@@ -200,7 +199,7 @@ class relativedelta(object):
-                      "This is not a well-defined condition and will raise " +
-                      "errors in future versions.", DeprecationWarning)
- 
--            if isinstance(weekday, integer_types):
-+            if isinstance(weekday, int):
-                 self.weekday = weekdays[weekday]
-             else:
-                 self.weekday = weekday
-diff --git a/src/dateutil/rrule.py b/src/dateutil/rrule.py
-index 571a0d2..d4ebac8 100644
---- a/src/dateutil/rrule.py
-+++ b/src/dateutil/rrule.py
-@@ -15,9 +15,8 @@ from functools import wraps
- # For warning about deprecation of until and count
- from warnings import warn
- 
--from six import advance_iterator, integer_types
- 
--from six.moves import _thread, range
-+import _thread
- 
- from ._common import weekday as weekdaybase
- 
-@@ -134,7 +133,7 @@ class rrulebase(object):
-                     break
-                 try:
-                     for j in range(10):
--                        cache.append(advance_iterator(gen))
-+                        cache.append(next(gen))
-                 except StopIteration:
-                     self._cache_gen = gen = None
-                     self._cache_complete = True
-@@ -161,7 +160,7 @@ class rrulebase(object):
-             gen = iter(self)
-             try:
-                 for i in range(item+1):
--                    res = advance_iterator(gen)
-+                    res = next(gen)
-             except StopIteration:
-                 raise IndexError
-             return res
-@@ -479,14 +478,14 @@ class rrule(rrulebase):
- 
-         if wkst is None:
-             self._wkst = calendar.firstweekday()
--        elif isinstance(wkst, integer_types):
-+        elif isinstance(wkst, int):
-             self._wkst = wkst
-         else:
-             self._wkst = wkst.weekday
- 
-         if bysetpos is None:
-             self._bysetpos = None
--        elif isinstance(bysetpos, integer_types):
-+        elif isinstance(bysetpos, int):
-             if bysetpos == 0 or not (-366 <= bysetpos <= 366):
-                 raise ValueError("bysetpos must be between 1 and 366, "
-                                  "or between -366 and -1")
-@@ -520,7 +519,7 @@ class rrule(rrulebase):
-         if bymonth is None:
-             self._bymonth = None
-         else:
--            if isinstance(bymonth, integer_types):
-+            if isinstance(bymonth, int):
-                 bymonth = (bymonth,)
- 
-             self._bymonth = tuple(sorted(set(bymonth)))
-@@ -532,7 +531,7 @@ class rrule(rrulebase):
-         if byyearday is None:
-             self._byyearday = None
-         else:
--            if isinstance(byyearday, integer_types):
-+            if isinstance(byyearday, int):
-                 byyearday = (byyearday,)
- 
-             self._byyearday = tuple(sorted(set(byyearday)))
-@@ -542,7 +541,7 @@ class rrule(rrulebase):
-         if byeaster is not None:
-             if not easter:
-                 from dateutil import easter
--            if isinstance(byeaster, integer_types):
-+            if isinstance(byeaster, int):
-                 self._byeaster = (byeaster,)
-             else:
-                 self._byeaster = tuple(sorted(byeaster))
-@@ -556,7 +555,7 @@ class rrule(rrulebase):
-             self._bymonthday = ()
-             self._bynmonthday = ()
-         else:
--            if isinstance(bymonthday, integer_types):
-+            if isinstance(bymonthday, int):
-                 bymonthday = (bymonthday,)
- 
-             bymonthday = set(bymonthday)            # Ensure it's unique
-@@ -573,7 +572,7 @@ class rrule(rrulebase):
-         if byweekno is None:
-             self._byweekno = None
-         else:
--            if isinstance(byweekno, integer_types):
-+            if isinstance(byweekno, int):
-                 byweekno = (byweekno,)
- 
-             self._byweekno = tuple(sorted(set(byweekno)))
-@@ -588,13 +587,13 @@ class rrule(rrulebase):
-             # If it's one of the valid non-sequence types, convert to a
-             # single-element sequence before the iterator that builds the
-             # byweekday set.
--            if isinstance(byweekday, integer_types) or hasattr(byweekday, "n"):
-+            if isinstance(byweekday, int) or hasattr(byweekday, "n"):
-                 byweekday = (byweekday,)
- 
-             self._byweekday = set()
-             self._bynweekday = set()
-             for wday in byweekday:
--                if isinstance(wday, integer_types):
-+                if isinstance(wday, int):
-                     self._byweekday.add(wday)
-                 elif not wday.n or freq > MONTHLY:
-                     self._byweekday.add(wday.weekday)
-@@ -629,7 +628,7 @@ class rrule(rrulebase):
-             else:
-                 self._byhour = None
-         else:
--            if isinstance(byhour, integer_types):
-+            if isinstance(byhour, int):
-                 byhour = (byhour,)
- 
-             if freq == HOURLY:
-@@ -649,7 +648,7 @@ class rrule(rrulebase):
-             else:
-                 self._byminute = None
-         else:
--            if isinstance(byminute, integer_types):
-+            if isinstance(byminute, int):
-                 byminute = (byminute,)
- 
-             if freq == MINUTELY:
-@@ -669,7 +668,7 @@ class rrule(rrulebase):
-             else:
-                 self._bysecond = None
-         else:
--            if isinstance(bysecond, integer_types):
-+            if isinstance(bysecond, int):
-                 bysecond = (bysecond,)
- 
-             self._bysecond = set(bysecond)
-@@ -1062,7 +1061,7 @@ class rrule(rrulebase):
-         cset = set()
- 
-         # Support a single byxxx value.
--        if isinstance(byxxx, integer_types):
-+        if isinstance(byxxx, int):
-             byxxx = (byxxx, )
- 
-         for num in byxxx:
-@@ -1315,7 +1314,7 @@ class rruleset(rrulebase):
-     class _genitem(object):
-         def __init__(self, genlist, gen):
-             try:
--                self.dt = advance_iterator(gen)
-+                self.dt = next(gen)
-                 genlist.append(self)
-             except StopIteration:
-                 pass
-@@ -1324,7 +1323,7 @@ class rruleset(rrulebase):
- 
-         def __next__(self):
-             try:
--                self.dt = advance_iterator(self.gen)
-+                self.dt = next(self.gen)
-             except StopIteration:
-                 if self.genlist[0] is self:
-                     heapq.heappop(self.genlist)
-@@ -1400,14 +1399,14 @@ class rruleset(rrulebase):
-             if not lastdt or lastdt != ritem.dt:
-                 while exlist and exlist[0] < ritem:
-                     exitem = exlist[0]
--                    advance_iterator(exitem)
-+                    next(exitem)
-                     if exlist and exlist[0] is exitem:
-                         heapq.heapreplace(exlist, exitem)
-                 if not exlist or ritem != exlist[0]:
-                     total += 1
-                     yield ritem.dt
-                 lastdt = ritem.dt
--            advance_iterator(ritem)
-+            next(ritem)
-             if rlist and rlist[0] is ritem:
-                 heapq.heapreplace(rlist, ritem)
-         self._len = total
-diff --git a/src/dateutil/tz/_common.py b/src/dateutil/tz/_common.py
-index e6ac118..d70f8a4 100644
---- a/src/dateutil/tz/_common.py
-+++ b/src/dateutil/tz/_common.py
-@@ -1,5 +1,3 @@
--from six import PY2
--
- from functools import wraps
- 
- from datetime import datetime, timedelta, tzinfo
-@@ -16,18 +14,7 @@ def tzname_in_python2(namefunc):
-     tzname() API changed in Python 3. It used to return bytes, but was changed
-     to unicode strings
-     """
--    if PY2:
--        @wraps(namefunc)
--        def adjust_encoding(*args, **kwargs):
--            name = namefunc(*args, **kwargs)
--            if name is not None:
--                name = name.encode()
--
--            return name
--
--        return adjust_encoding
--    else:
--        return namefunc
-+    return namefunc
- 
- 
- # The following is adapted from Alexander Belopolsky's tz library
-diff --git a/src/dateutil/tz/_factories.py b/src/dateutil/tz/_factories.py
-index f8a6589..97a28d2 100644
---- a/src/dateutil/tz/_factories.py
-+++ b/src/dateutil/tz/_factories.py
-@@ -2,7 +2,7 @@ from datetime import timedelta
- import weakref
- from collections import OrderedDict
- 
--from six.moves import _thread
-+import _thread
- 
- 
- class _TzSingleton(type):
-diff --git a/src/dateutil/tz/tz.py b/src/dateutil/tz/tz.py
-index 6175914..69b8763 100644
---- a/src/dateutil/tz/tz.py
-+++ b/src/dateutil/tz/tz.py
-@@ -16,9 +16,7 @@ import bisect
- import weakref
- from collections import OrderedDict
- 
--import six
--from six import string_types
--from six.moves import _thread
-+import _thread
- from ._common import tzname_in_python2, _tzinfo
- from ._common import tzrangebase, enfold
- from ._common import _validate_fromutc_inputs
-@@ -38,8 +36,7 @@ EPOCH = datetime.datetime(1970, 1, 1, 0, 0)
- EPOCHORDINAL = EPOCH.toordinal()
- 
- 
--@six.add_metaclass(_TzSingleton)
--class tzutc(datetime.tzinfo):
-+class tzutc(datetime.tzinfo, metaclass=_TzSingleton):
-     """
-     This is a tzinfo object that represents the UTC time zone.
- 
-@@ -129,8 +126,7 @@ class tzutc(datetime.tzinfo):
- UTC = tzutc()
- 
- 
--@six.add_metaclass(_TzOffsetFactory)
--class tzoffset(datetime.tzinfo):
-+class tzoffset(datetime.tzinfo, metaclass=_TzOffsetFactory):
-     """
-     A simple class for representing a fixed offset from UTC.
- 
-@@ -459,7 +455,7 @@ class tzfile(_tzinfo):
-         super(tzfile, self).__init__()
- 
-         file_opened_here = False
--        if isinstance(fileobj, string_types):
-+        if isinstance(fileobj, str):
-             self._filename = fileobj
-             fileobj = open(fileobj, 'rb')
-             file_opened_here = True
-@@ -1033,8 +1029,7 @@ class tzrange(tzrangebase):
-         return self._dst_base_offset_
- 
- 
--@six.add_metaclass(_TzStrFactory)
--class tzstr(tzrange):
-+class tzstr(tzrange, metaclass=_TzStrFactory):
-     """
-     ``tzstr`` objects are time zone objects specified by a time-zone string as
-     it would be passed to a ``TZ`` variable on POSIX-style systems (see
-@@ -1265,7 +1260,7 @@ class tzical(object):
-         global rrule
-         from dateutil import rrule
- 
--        if isinstance(fileobj, string_types):
-+        if isinstance(fileobj, str):
-             self._s = fileobj
-             # ical should be encoded in UTF-8 with CRLF
-             fileobj = open(fileobj, 'r')
-@@ -1621,7 +1616,7 @@ def __get_gettz():
-                 except TypeError as e:
-                     if isinstance(name, bytes):
-                         new_msg = "gettz argument should be str, not bytes"
--                        six.raise_from(TypeError(new_msg), e)
-+                        raise TypeError(new_msg) from e
-                     else:
-                         raise
-                 if os.path.isabs(name):
-diff --git a/src/dateutil/tz/win.py b/src/dateutil/tz/win.py
-index cde07ba..7fdd15d 100644
---- a/src/dateutil/tz/win.py
-+++ b/src/dateutil/tz/win.py
-@@ -10,8 +10,7 @@ Attempting to import this module on a non-Windows platform will raise an
- import datetime
- import struct
- 
--from six.moves import winreg
--from six import text_type
-+import winreg
- 
- try:
-     import ctypes
-@@ -216,7 +215,7 @@ class tzwin(tzwinbase):
-         self._name = name
- 
-         with winreg.ConnectRegistry(None, winreg.HKEY_LOCAL_MACHINE) as handle:
--            tzkeyname = text_type("{kn}\\{name}").format(kn=TZKEYNAME, name=name)
-+            tzkeyname = str("{kn}\\{name}").format(kn=TZKEYNAME, name=name)
-             with winreg.OpenKey(handle, tzkeyname) as tzkey:
-                 keydict = valuestodict(tzkey)
- 
-@@ -282,7 +281,7 @@ class tzwinlocal(tzwinbase):
-             self._dst_abbr = keydict["DaylightName"]
- 
-             try:
--                tzkeyname = text_type('{kn}\\{sn}').format(kn=TZKEYNAME,
-+                tzkeyname = str('{kn}\\{sn}').format(kn=TZKEYNAME,
-                                                           sn=self._std_abbr)
-                 with winreg.OpenKey(handle, tzkeyname) as tzkey:
-                     _keydict = valuestodict(tzkey)
-diff --git a/tests/property/test_tz_prop.py b/tests/property/test_tz_prop.py
-index ec6d271..d5806b6 100644
---- a/tests/property/test_tz_prop.py
-+++ b/tests/property/test_tz_prop.py
-@@ -1,7 +1,6 @@
- from datetime import datetime, timedelta
- 
- import pytest
--import six
- from hypothesis import assume, given
- from hypothesis import strategies as st
- 
-@@ -25,10 +24,7 @@ def test_gettz_returns_local(gettz_arg, dt):
-         return
- 
-     dt_act = dt.astimezone(tz.gettz(gettz_arg))
--    if six.PY2:
--        dt_exp = dt.astimezone(tz.tzlocal())
--    else:
--        dt_exp = dt.astimezone()
-+    dt_exp = dt.astimezone()
- 
-     assert dt_act == dt_exp
-     assert dt_act.tzname() == dt_exp.tzname()
-diff --git a/tests/test_imports.py b/tests/test_imports.py
-index 7d0749e..caad793 100644
---- a/tests/test_imports.py
-+++ b/tests/test_imports.py
-@@ -1,7 +1,6 @@
- import sys
- import unittest
- import pytest
--import six
- 
- MODULE_TYPE = type(sys)
- 
-@@ -10,12 +9,8 @@ MODULE_TYPE = type(sys)
- # But since we expect lazy imports tests to fail for Python < 3.7  we'll ignore those
- # warnings with this filter.
- 
--if six.PY2:
--    filter_import_warning = pytest.mark.filterwarnings("ignore::RuntimeWarning")
--else:
--
--    def filter_import_warning(f):
--        return f
-+def filter_import_warning(f):
-+    return f
- 
- 
- @pytest.fixture(scope="function")
-diff --git a/tests/test_isoparser.py b/tests/test_isoparser.py
-index c33881f..874070c 100644
---- a/tests/test_isoparser.py
-+++ b/tests/test_isoparser.py
-@@ -9,7 +9,6 @@ from dateutil.tz import UTC
- from dateutil.parser import isoparser, isoparse
- 
- import pytest
--import six
- 
- 
- def _generate_tzoffsets(limited):
-@@ -297,7 +296,7 @@ def test_isoparser_invalid_sep(sep):
- 
- 
- # This only fails on Python 3
--@pytest.mark.xfail(not six.PY2, reason="Fails on Python 3 only")
-+@pytest.mark.xfail(reason="Fails on Python 3 only")
- def test_isoparser_byte_sep():
-     dt = datetime(2017, 12, 6, 12, 30, 45)
-     dt_str = dt.isoformat(sep=str('T'))
-@@ -347,9 +346,7 @@ def __make_date_examples():
-         date(2016, 2, 1)
-     ]
- 
--    if not six.PY2:
--        # strftime does not support dates before 1900 in Python 2
--        dates_no_day.append(date(1000, 11, 1))
-+    dates_no_day.append(date(1000, 11, 1))
- 
-     # Only one supported format for dates with no day
-     o = zip(dates_no_day, it.repeat('%Y-%m'))
-@@ -371,7 +368,7 @@ def __make_date_examples():
- @pytest.mark.parametrize('as_bytes', [True, False])
- def test_parse_isodate(d, dt_fmt, as_bytes):
-     d_str = d.strftime(dt_fmt)
--    if isinstance(d_str, six.text_type) and as_bytes:
-+    if isinstance(d_str, str) and as_bytes:
-         d_str = d_str.encode('ascii')
-     elif isinstance(d_str, bytes) and not as_bytes:
-         d_str = d_str.decode('ascii')
-@@ -400,10 +397,7 @@ def test_parse_isodate_error_text():
-         isoparser().parse_isodate('2014-0423')
- 
-     # ensure the error message does not contain b' prefixes
--    if six.PY2:
--        expected_error = "String contains unknown ISO components: u'2014-0423'"
--    else:
--        expected_error = "String contains unknown ISO components: '2014-0423'"
-+    expected_error = "String contains unknown ISO components: '2014-0423'"
-     assert expected_error == str(excinfo.value)
- 
- 
-@@ -458,7 +452,7 @@ def __make_time_examples():
- @pytest.mark.parametrize('as_bytes', [True, False])
- def test_isotime(time_val, time_fmt, as_bytes):
-     tstr = time_val.strftime(time_fmt)
--    if isinstance(tstr, six.text_type) and as_bytes:
-+    if isinstance(tstr, str) and as_bytes:
-         tstr = tstr.encode('ascii')
-     elif isinstance(tstr, bytes) and not as_bytes:
-         tstr = tstr.decode('ascii')
-diff --git a/tests/test_parser.py b/tests/test_parser.py
-index 08a34da..c66850e 100644
---- a/tests/test_parser.py
-+++ b/tests/test_parser.py
-@@ -14,7 +14,6 @@ from dateutil.parser import UnknownTimezoneWarning
- 
- from ._common import TZEnvContext
- 
--from six import assertRaisesRegex, PY2
- from io import StringIO
- 
- import pytest
-@@ -462,12 +461,6 @@ class ParserTest(unittest.TestCase):
-                          datetime(2003, 9, 25, 10, 36, 28,
-                                   tzinfo=self.brsttz))
- 
--    def testDateCommandFormatWithLong(self):
--        if PY2:
--            self.assertEqual(parse("Thu Sep 25 10:36:28 BRST 2003",
--                                   tzinfos={"BRST": long(-10800)}),
--                             datetime(2003, 9, 25, 10, 36, 28,
--                                      tzinfo=self.brsttz))
- 
-     def testISOFormatStrip2(self):
-         self.assertEqual(parse("2003-09-25T10:49:41+03:00"),
-@@ -570,11 +563,11 @@ class ParserTest(unittest.TestCase):
-             parse('shouldfail')
- 
-     def testCorrectErrorOnFuzzyWithTokens(self):
--        assertRaisesRegex(self, ParserError, 'Unknown string format',
-+        self.assertRaisesRegex(ParserError, 'Unknown string format',
-                           parse, '04/04/32/423', fuzzy_with_tokens=True)
--        assertRaisesRegex(self, ParserError, 'Unknown string format',
-+        self.assertRaisesRegex(ParserError, 'Unknown string format',
-                           parse, '04/04/04 +32423', fuzzy_with_tokens=True)
--        assertRaisesRegex(self, ParserError, 'Unknown string format',
-+        self.assertRaisesRegex(ParserError, 'Unknown string format',
-                           parse, '04/04/0d4', fuzzy_with_tokens=True)
- 
-     def testIncreasingCTime(self):
-diff --git a/tests/test_rrule.py b/tests/test_rrule.py
-index 52673ec..f50b24e 100644
---- a/tests/test_rrule.py
-+++ b/tests/test_rrule.py
-@@ -3,7 +3,6 @@ from __future__ import unicode_literals
- 
- from datetime import datetime, date
- import unittest
--from six import PY2
- 
- from dateutil import tz
- from dateutil.rrule import (
-@@ -2282,26 +2281,6 @@ class RRuleTest(unittest.TestCase):
-                           datetime(2010, 3, 22, 13, 1),
-                           datetime(2010, 3, 22, 14, 1)])
- 
--    def testLongIntegers(self):
--        if PY2:  # There are no longs in python3
--            self.assertEqual(list(rrule(MINUTELY,
--                                  count=long(2),
--                                  interval=long(2),
--                                  bymonth=long(2),
--                                  byweekday=long(3),
--                                  byhour=long(6),
--                                  byminute=long(6),
--                                  bysecond=long(6),
--                                  dtstart=datetime(1997, 9, 2, 9, 0))),
--                             [datetime(1998, 2, 5, 6, 6, 6),
--                              datetime(1998, 2, 12, 6, 6, 6)])
--            self.assertEqual(list(rrule(YEARLY,
--                                  count=long(2),
--                                  bymonthday=long(5),
--                                  byweekno=long(2),
--                                  dtstart=datetime(1997, 9, 2, 9, 0))),
--                             [datetime(1998, 1, 5, 9, 0),
--                              datetime(2004, 1, 5, 9, 0)])
- 
-     def testHourlyBadRRule(self):
-         """
-@@ -4577,23 +4556,6 @@ class RRuleTest(unittest.TestCase):
-                               wkst=SU,
-                               dtstart=datetime(1997, 9, 2, 9, 0)))
- 
--    def testToStrLongIntegers(self):
--        if PY2:  # There are no longs in python3
--            self._rrulestr_reverse_test(rrule(MINUTELY,
--                                  count=long(2),
--                                  interval=long(2),
--                                  bymonth=long(2),
--                                  byweekday=long(3),
--                                  byhour=long(6),
--                                  byminute=long(6),
--                                  bysecond=long(6),
--                                  dtstart=datetime(1997, 9, 2, 9, 0)))
--
--            self._rrulestr_reverse_test(rrule(YEARLY,
--                                  count=long(2),
--                                  bymonthday=long(5),
--                                  byweekno=long(2),
--                                  dtstart=datetime(1997, 9, 2, 9, 0)))
- 
-     def testReplaceIfSet(self):
-         rr = rrule(YEARLY,
-diff --git a/tests/test_tz.py b/tests/test_tz.py
-index e5e4772..41c17ff 100644
---- a/tests/test_tz.py
-+++ b/tests/test_tz.py
-@@ -7,7 +7,6 @@ from ._common import ComparesEqual
- from datetime import datetime, timedelta
- from datetime import time as dt_time
- from datetime import tzinfo
--from six import PY2
- from io import BytesIO, StringIO
- import unittest
- 
-@@ -1114,11 +1113,6 @@ def test_gettz_badzone_unicode():
-             b"America/New_York",
-             ".*should be str, not bytes.*",
-             id="bytes on Python 3",
--            marks=[
--                pytest.mark.skipif(
--                    PY2, reason="bytes arguments accepted in Python 2"
--                )
--            ],
-         ),
-         pytest.param(
-             object(),
-diff --git a/updatezinfo.py b/updatezinfo.py
-index bba53d5..f77dfa1 100644
---- a/updatezinfo.py
-+++ b/updatezinfo.py
-@@ -4,8 +4,8 @@ import hashlib
- import json
- import io
- 
--from six.moves.urllib import request
--from six.moves.urllib import error as urllib_error
-+from urllib import request
-+from urllib import error as urllib_error
- 
- try:
-     import dateutil
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb b/meta-python/recipes-devtools/python/python3-dateutil_4.0.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_4.0.0.bb
index 3b9460c843..fc7297401f 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_4.0.0.bb
@@ -4,25 +4,22 @@ HOMEPAGE = "https://dateutil.readthedocs.org"
 LICENSE = "Apache-2.0 AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
 
-SRC_URI += "file://0001-drop-the-six-dependency.patch"
-SRC_URI[sha256sum] = "78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709"
+SRC_URI[sha256sum] = "d7295ff14fdc0f92f662100bfb6c551d160ca090f2939f1ec5b9794265c03f06"
 
 PYPI_PACKAGE = "python-dateutil"
-PYPI_PACKAGE_SDIST = "python-dateutil"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
 
-DEPENDS += "python3-wheel-native"
+DEPENDS += "python3-hatch-fancy-pypi-readme-native python3-hatch-vcs-native"
 
 PACKAGES =+ "${PN}-zoneinfo"
 FILES:${PN}-zoneinfo = "${PYTHON_SITEPACKAGES_DIR}/dateutil/zoneinfo"
 
-DEPENDS += "python3-setuptools-scm-native"
-
 RDEPENDS:${PN} = "\
     python3-datetime \
     python3-numbers \
     python3-stringold \
+    python3-tzdata \
 "
 
 BBCLASSEXTEND = "native nativesdk"
