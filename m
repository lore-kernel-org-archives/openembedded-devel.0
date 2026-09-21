Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A6FC982FD
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:56:10 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47166.1789991765126308922
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Ro4DPL9D;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd91.aul.t-online.de (fwd91.aul.t-online.de [10.223.144.117])
	by mailout09.t-online.de (Postfix) with SMTP id A5D7238170
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 13:55:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd91.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8cc8-04X1z10; Mon, 21 Sep 2026 13:55:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/24] python3-dateutil: drop the six dependency
Date: Mon, 21 Sep 2026 13:54:40 +0200
Message-ID: <20260921115500.53770-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921115500.53770-1-f_l_k@t-online.de>
References: <20260921115500.53770-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789991717-767F3A93-FDD1DCD4/0/0 CLEAN NORMAL
X-TOI-MSGID: 31cf55da-e8dd-4a77-9595-8f2c7d35d123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789991721; i=f_l_k@t-online.de;
	bh=HD9kW1W6ZmDZYbebkm42pT6ghztg9+lkQUWPlOL4JK8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ro4DPL9DqLrmUEIdDiiaB8KCg/urWVfLhWmja+TxyKTGeNyiXbT34bQo8Y8hCUim2
	 iETlso1sfl8dojewZoAvidI8VvjeceFkgp0JOM/VvD3vRcVDQDONkILc4uxkcRPkTH
	 lM5qptVRhDyjDnKbDRqPoB9GtE0yZL8u2lKhHr0/NbNp+Ww06b2Wpg6lSOK2sgUsrd
	 1/Rl8aYwogmmzri7fIgVbYI/FzTtgAONu/S7R3X8jHCK7sAqzEOz0dxc2pnoKHCqM8
	 qiSx6VlNRirxryCfsPfZbB+nIRw35oqGGQzQynRUYAIUJR40OBEvMwe1DbLIPnJSNI
	 MP0MtNLJaMbCg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130140

Patch dateutil to use the standard library instead of the six metaclass
decorators, type aliases, raise_from and six.moves imports, and drop the
runtime dependency.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-drop-the-six-dependency.patch        | 751 ++++++++++++++++++
 .../python/python3-dateutil_2.9.0.bb          |   2 +-
 2 files changed, 752 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-dateutil/=
0001-drop-the-six-dependency.patch

diff --git a/meta-python/recipes-devtools/python/python3-dateutil/0001-dr=
op-the-six-dependency.patch b/meta-python/recipes-devtools/python/python3=
-dateutil/0001-drop-the-six-dependency.patch
new file mode 100644
index 0000000000..94ada60075
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dateutil/0001-drop-the-=
six-dependency.patch
@@ -0,0 +1,751 @@
+From 81e23b3bffdb1ec451b2ed02bc377b1be53b2b5f Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 21 Sep 2026 12:30:09 +0200
+Subject: [PATCH] drop the six dependency
+
+six is a Python 2 compatibility shim and dateutil no longer needs it on
+Python 3: the metaclass decorators, the string and integer type aliases,
+raise_from and the six.moves imports of _thread, range and winreg all
+have direct equivalents in the standard library.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Opus 5)
+---
+ pyproject.toml                   | 1 -
+ setup.cfg                        | 1 -
+ src/dateutil/parser/_parser.py   | 14 ++++++--------
+ src/dateutil/parser/isoparser.py | 5 ++---
+ src/dateutil/relativedelta.py    | 3 +--
+ src/dateutil/rrule.py            | 41 ++++++++++++++++++++-------------=
--------
+ src/dateutil/tz/_common.py       | 15 +--------------
+ src/dateutil/tz/_factories.py    | 2 +-
+ src/dateutil/tz/tz.py            | 19 +++++++------------
+ src/dateutil/tz/win.py           | 7 +++----
+ tests/property/test_tz_prop.py   | 6 +-----
+ tests/test_imports.py            | 9 ++-------
+ tests/test_isoparser.py          | 16 +++++-----------
+ tests/test_parser.py             | 13 +++----------
+ tests/test_rrule.py              | 38 ---------------------------------=
-----
+ tests/test_tz.py                 | 6 ------
+ updatezinfo.py                   | 4 ++--
+ 17 files changed, 54 insertions(+), 146 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 67ad619..12da1f4 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -57,7 +57,6 @@ known_first_party =3D ["dateutil"]
+ known_third_party=3D[
+     "pytest",
+     "hypothesis",
+-    "six",
+     "freezegun",
+     "mock",
+ ]
+diff --git a/setup.cfg b/setup.cfg
+index 4f91e34..84f19f3 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -39,7 +39,6 @@ classifiers =3D
+ [options]
+ zip_safe =3D True
+ setup_requires =3D setuptools_scm
+-install_requires =3D six >=3D 1.5
+ package_dir =3D=20
+ 	=3Dsrc
+ python_requires =3D >=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*
+diff --git a/src/dateutil/parser/_parser.py b/src/dateutil/parser/_parse=
r.py
+index 37d1663..41d3d9f 100644
+--- a/src/dateutil/parser/_parser.py
++++ b/src/dateutil/parser/_parser.py
+@@ -39,8 +39,6 @@ import warnings
+ from calendar import monthrange
+ from io import StringIO
+=20
+-import six
+-from six import integer_types, text_type
+=20
+ from decimal import Decimal
+=20
+@@ -63,7 +61,7 @@ class _timelex(object):
+         if isinstance(instream, (bytes, bytearray)):
+             instream =3D instream.decode()
+=20
+-        if isinstance(instream, text_type):
++        if isinstance(instream, str):
+             instream =3D StringIO(instream)
+         elif getattr(instream, 'read', None) is None:
+             raise TypeError('Parser must be a string or character strea=
m, not '
+@@ -648,7 +646,7 @@ class parser(object):
+         try:
+             ret =3D self._build_naive(res, default)
+         except ValueError as e:
+-            six.raise_from(ParserError(str(e) + ": %s", timestr), e)
++            raise ParserError(str(e) + ": %s", timestr) from e
+=20
+         if not ignoretz:
+             ret =3D self._build_tzaware(ret, res, tzinfos)
+@@ -878,7 +876,7 @@ class parser(object):
+         try:
+             value =3D self._to_decimal(value_repr)
+         except Exception as e:
+-            six.raise_from(ValueError('Unknown numeric token'), e)
++            raise ValueError('Unknown numeric token') from e
+=20
+         len_li =3D len(value_repr)
+=20
+@@ -1147,7 +1145,7 @@ class parser(object):
+                 raise ValueError("Converted decimal value is infinite o=
r NaN")
+         except Exception as e:
+             msg =3D "Could not convert %s to decimal" % val
+-            six.raise_from(ValueError(msg), e)
++            raise ValueError(msg) from e
+         else:
+             return decimal_value
+=20
+@@ -1165,9 +1163,9 @@ class parser(object):
+         # eg tzinfos =3D {'BRST' : None}
+         if isinstance(tzdata, datetime.tzinfo) or tzdata is None:
+             tzinfo =3D tzdata
+-        elif isinstance(tzdata, text_type):
++        elif isinstance(tzdata, str):
+             tzinfo =3D tz.tzstr(tzdata)
+-        elif isinstance(tzdata, integer_types):
++        elif isinstance(tzdata, int):
+             tzinfo =3D tz.tzoffset(tzname, tzdata)
+         else:
+             raise TypeError("Offset must be tzinfo subclass, tz string,=
 "
+diff --git a/src/dateutil/parser/isoparser.py b/src/dateutil/parser/isop=
arser.py
+index 7060087..d296948 100644
+--- a/src/dateutil/parser/isoparser.py
++++ b/src/dateutil/parser/isoparser.py
+@@ -14,7 +14,6 @@ from dateutil import tz
+ from functools import wraps
+=20
+ import re
+-import six
+=20
+ __all__ =3D ["isoparse", "isoparser"]
+=20
+@@ -26,13 +25,13 @@ def _takes_ascii(f):
+         str_in =3D getattr(str_in, 'read', lambda: str_in)()
+=20
+         # If it's unicode, turn it into bytes, since ISO-8601 only cove=
rs ASCII
+-        if isinstance(str_in, six.text_type):
++        if isinstance(str_in, str):
+             # ASCII is the same in UTF-8
+             try:
+                 str_in =3D str_in.encode('ascii')
+             except UnicodeEncodeError as e:
+                 msg =3D 'ISO-8601 strings should contain only ASCII cha=
racters'
+-                six.raise_from(ValueError(msg), e)
++                raise ValueError(msg) from e
+=20
+         return f(self, str_in, *args, **kwargs)
+=20
+diff --git a/src/dateutil/relativedelta.py b/src/dateutil/relativedelta.=
py
+index cd323a5..8283d7e 100644
+--- a/src/dateutil/relativedelta.py
++++ b/src/dateutil/relativedelta.py
+@@ -5,7 +5,6 @@ import calendar
+ import operator
+ from math import copysign
+=20
+-from six import integer_types
+ from warnings import warn
+=20
+ from ._common import weekday
+@@ -200,7 +199,7 @@ class relativedelta(object):
+                      "This is not a well-defined condition and will rai=
se " +
+                      "errors in future versions.", DeprecationWarning)
+=20
+-            if isinstance(weekday, integer_types):
++            if isinstance(weekday, int):
+                 self.weekday =3D weekdays[weekday]
+             else:
+                 self.weekday =3D weekday
+diff --git a/src/dateutil/rrule.py b/src/dateutil/rrule.py
+index 571a0d2..d4ebac8 100644
+--- a/src/dateutil/rrule.py
++++ b/src/dateutil/rrule.py
+@@ -15,9 +15,8 @@ from functools import wraps
+ # For warning about deprecation of until and count
+ from warnings import warn
+=20
+-from six import advance_iterator, integer_types
+=20
+-from six.moves import _thread, range
++import _thread
+=20
+ from ._common import weekday as weekdaybase
+=20
+@@ -134,7 +133,7 @@ class rrulebase(object):
+                     break
+                 try:
+                     for j in range(10):
+-                        cache.append(advance_iterator(gen))
++                        cache.append(next(gen))
+                 except StopIteration:
+                     self._cache_gen =3D gen =3D None
+                     self._cache_complete =3D True
+@@ -161,7 +160,7 @@ class rrulebase(object):
+             gen =3D iter(self)
+             try:
+                 for i in range(item+1):
+-                    res =3D advance_iterator(gen)
++                    res =3D next(gen)
+             except StopIteration:
+                 raise IndexError
+             return res
+@@ -479,14 +478,14 @@ class rrule(rrulebase):
+=20
+         if wkst is None:
+             self._wkst =3D calendar.firstweekday()
+-        elif isinstance(wkst, integer_types):
++        elif isinstance(wkst, int):
+             self._wkst =3D wkst
+         else:
+             self._wkst =3D wkst.weekday
+=20
+         if bysetpos is None:
+             self._bysetpos =3D None
+-        elif isinstance(bysetpos, integer_types):
++        elif isinstance(bysetpos, int):
+             if bysetpos =3D=3D 0 or not (-366 <=3D bysetpos <=3D 366):
+                 raise ValueError("bysetpos must be between 1 and 366, "
+                                  "or between -366 and -1")
+@@ -520,7 +519,7 @@ class rrule(rrulebase):
+         if bymonth is None:
+             self._bymonth =3D None
+         else:
+-            if isinstance(bymonth, integer_types):
++            if isinstance(bymonth, int):
+                 bymonth =3D (bymonth,)
+=20
+             self._bymonth =3D tuple(sorted(set(bymonth)))
+@@ -532,7 +531,7 @@ class rrule(rrulebase):
+         if byyearday is None:
+             self._byyearday =3D None
+         else:
+-            if isinstance(byyearday, integer_types):
++            if isinstance(byyearday, int):
+                 byyearday =3D (byyearday,)
+=20
+             self._byyearday =3D tuple(sorted(set(byyearday)))
+@@ -542,7 +541,7 @@ class rrule(rrulebase):
+         if byeaster is not None:
+             if not easter:
+                 from dateutil import easter
+-            if isinstance(byeaster, integer_types):
++            if isinstance(byeaster, int):
+                 self._byeaster =3D (byeaster,)
+             else:
+                 self._byeaster =3D tuple(sorted(byeaster))
+@@ -556,7 +555,7 @@ class rrule(rrulebase):
+             self._bymonthday =3D ()
+             self._bynmonthday =3D ()
+         else:
+-            if isinstance(bymonthday, integer_types):
++            if isinstance(bymonthday, int):
+                 bymonthday =3D (bymonthday,)
+=20
+             bymonthday =3D set(bymonthday)            # Ensure it's uni=
que
+@@ -573,7 +572,7 @@ class rrule(rrulebase):
+         if byweekno is None:
+             self._byweekno =3D None
+         else:
+-            if isinstance(byweekno, integer_types):
++            if isinstance(byweekno, int):
+                 byweekno =3D (byweekno,)
+=20
+             self._byweekno =3D tuple(sorted(set(byweekno)))
+@@ -588,13 +587,13 @@ class rrule(rrulebase):
+             # If it's one of the valid non-sequence types, convert to a
+             # single-element sequence before the iterator that builds t=
he
+             # byweekday set.
+-            if isinstance(byweekday, integer_types) or hasattr(byweekda=
y, "n"):
++            if isinstance(byweekday, int) or hasattr(byweekday, "n"):
+                 byweekday =3D (byweekday,)
+=20
+             self._byweekday =3D set()
+             self._bynweekday =3D set()
+             for wday in byweekday:
+-                if isinstance(wday, integer_types):
++                if isinstance(wday, int):
+                     self._byweekday.add(wday)
+                 elif not wday.n or freq > MONTHLY:
+                     self._byweekday.add(wday.weekday)
+@@ -629,7 +628,7 @@ class rrule(rrulebase):
+             else:
+                 self._byhour =3D None
+         else:
+-            if isinstance(byhour, integer_types):
++            if isinstance(byhour, int):
+                 byhour =3D (byhour,)
+=20
+             if freq =3D=3D HOURLY:
+@@ -649,7 +648,7 @@ class rrule(rrulebase):
+             else:
+                 self._byminute =3D None
+         else:
+-            if isinstance(byminute, integer_types):
++            if isinstance(byminute, int):
+                 byminute =3D (byminute,)
+=20
+             if freq =3D=3D MINUTELY:
+@@ -669,7 +668,7 @@ class rrule(rrulebase):
+             else:
+                 self._bysecond =3D None
+         else:
+-            if isinstance(bysecond, integer_types):
++            if isinstance(bysecond, int):
+                 bysecond =3D (bysecond,)
+=20
+             self._bysecond =3D set(bysecond)
+@@ -1062,7 +1061,7 @@ class rrule(rrulebase):
+         cset =3D set()
+=20
+         # Support a single byxxx value.
+-        if isinstance(byxxx, integer_types):
++        if isinstance(byxxx, int):
+             byxxx =3D (byxxx, )
+=20
+         for num in byxxx:
+@@ -1315,7 +1314,7 @@ class rruleset(rrulebase):
+     class _genitem(object):
+         def __init__(self, genlist, gen):
+             try:
+-                self.dt =3D advance_iterator(gen)
++                self.dt =3D next(gen)
+                 genlist.append(self)
+             except StopIteration:
+                 pass
+@@ -1324,7 +1323,7 @@ class rruleset(rrulebase):
+=20
+         def __next__(self):
+             try:
+-                self.dt =3D advance_iterator(self.gen)
++                self.dt =3D next(self.gen)
+             except StopIteration:
+                 if self.genlist[0] is self:
+                     heapq.heappop(self.genlist)
+@@ -1400,14 +1399,14 @@ class rruleset(rrulebase):
+             if not lastdt or lastdt !=3D ritem.dt:
+                 while exlist and exlist[0] < ritem:
+                     exitem =3D exlist[0]
+-                    advance_iterator(exitem)
++                    next(exitem)
+                     if exlist and exlist[0] is exitem:
+                         heapq.heapreplace(exlist, exitem)
+                 if not exlist or ritem !=3D exlist[0]:
+                     total +=3D 1
+                     yield ritem.dt
+                 lastdt =3D ritem.dt
+-            advance_iterator(ritem)
++            next(ritem)
+             if rlist and rlist[0] is ritem:
+                 heapq.heapreplace(rlist, ritem)
+         self._len =3D total
+diff --git a/src/dateutil/tz/_common.py b/src/dateutil/tz/_common.py
+index e6ac118..d70f8a4 100644
+--- a/src/dateutil/tz/_common.py
++++ b/src/dateutil/tz/_common.py
+@@ -1,5 +1,3 @@
+-from six import PY2
+-
+ from functools import wraps
+=20
+ from datetime import datetime, timedelta, tzinfo
+@@ -16,18 +14,7 @@ def tzname_in_python2(namefunc):
+     tzname() API changed in Python 3. It used to return bytes, but was =
changed
+     to unicode strings
+     """
+-    if PY2:
+-        @wraps(namefunc)
+-        def adjust_encoding(*args, **kwargs):
+-            name =3D namefunc(*args, **kwargs)
+-            if name is not None:
+-                name =3D name.encode()
+-
+-            return name
+-
+-        return adjust_encoding
+-    else:
+-        return namefunc
++    return namefunc
+=20
+=20
+ # The following is adapted from Alexander Belopolsky's tz library
+diff --git a/src/dateutil/tz/_factories.py b/src/dateutil/tz/_factories.=
py
+index f8a6589..97a28d2 100644
+--- a/src/dateutil/tz/_factories.py
++++ b/src/dateutil/tz/_factories.py
+@@ -2,7 +2,7 @@ from datetime import timedelta
+ import weakref
+ from collections import OrderedDict
+=20
+-from six.moves import _thread
++import _thread
+=20
+=20
+ class _TzSingleton(type):
+diff --git a/src/dateutil/tz/tz.py b/src/dateutil/tz/tz.py
+index 6175914..69b8763 100644
+--- a/src/dateutil/tz/tz.py
++++ b/src/dateutil/tz/tz.py
+@@ -16,9 +16,7 @@ import bisect
+ import weakref
+ from collections import OrderedDict
+=20
+-import six
+-from six import string_types
+-from six.moves import _thread
++import _thread
+ from ._common import tzname_in_python2, _tzinfo
+ from ._common import tzrangebase, enfold
+ from ._common import _validate_fromutc_inputs
+@@ -38,8 +36,7 @@ EPOCH =3D datetime.datetime(1970, 1, 1, 0, 0)
+ EPOCHORDINAL =3D EPOCH.toordinal()
+=20
+=20
+-@six.add_metaclass(_TzSingleton)
+-class tzutc(datetime.tzinfo):
++class tzutc(datetime.tzinfo, metaclass=3D_TzSingleton):
+     """
+     This is a tzinfo object that represents the UTC time zone.
+=20
+@@ -129,8 +126,7 @@ class tzutc(datetime.tzinfo):
+ UTC =3D tzutc()
+=20
+=20
+-@six.add_metaclass(_TzOffsetFactory)
+-class tzoffset(datetime.tzinfo):
++class tzoffset(datetime.tzinfo, metaclass=3D_TzOffsetFactory):
+     """
+     A simple class for representing a fixed offset from UTC.
+=20
+@@ -459,7 +455,7 @@ class tzfile(_tzinfo):
+         super(tzfile, self).__init__()
+=20
+         file_opened_here =3D False
+-        if isinstance(fileobj, string_types):
++        if isinstance(fileobj, str):
+             self._filename =3D fileobj
+             fileobj =3D open(fileobj, 'rb')
+             file_opened_here =3D True
+@@ -1033,8 +1029,7 @@ class tzrange(tzrangebase):
+         return self._dst_base_offset_
+=20
+=20
+-@six.add_metaclass(_TzStrFactory)
+-class tzstr(tzrange):
++class tzstr(tzrange, metaclass=3D_TzStrFactory):
+     """
+     ``tzstr`` objects are time zone objects specified by a time-zone st=
ring as
+     it would be passed to a ``TZ`` variable on POSIX-style systems (see
+@@ -1265,7 +1260,7 @@ class tzical(object):
+         global rrule
+         from dateutil import rrule
+=20
+-        if isinstance(fileobj, string_types):
++        if isinstance(fileobj, str):
+             self._s =3D fileobj
+             # ical should be encoded in UTF-8 with CRLF
+             fileobj =3D open(fileobj, 'r')
+@@ -1621,7 +1616,7 @@ def __get_gettz():
+                 except TypeError as e:
+                     if isinstance(name, bytes):
+                         new_msg =3D "gettz argument should be str, not =
bytes"
+-                        six.raise_from(TypeError(new_msg), e)
++                        raise TypeError(new_msg) from e
+                     else:
+                         raise
+                 if os.path.isabs(name):
+diff --git a/src/dateutil/tz/win.py b/src/dateutil/tz/win.py
+index cde07ba..7fdd15d 100644
+--- a/src/dateutil/tz/win.py
++++ b/src/dateutil/tz/win.py
+@@ -10,8 +10,7 @@ Attempting to import this module on a non-Windows plat=
form will raise an
+ import datetime
+ import struct
+=20
+-from six.moves import winreg
+-from six import text_type
++import winreg
+=20
+ try:
+     import ctypes
+@@ -216,7 +215,7 @@ class tzwin(tzwinbase):
+         self._name =3D name
+=20
+         with winreg.ConnectRegistry(None, winreg.HKEY_LOCAL_MACHINE) as=
 handle:
+-            tzkeyname =3D text_type("{kn}\\{name}").format(kn=3DTZKEYNA=
ME, name=3Dname)
++            tzkeyname =3D str("{kn}\\{name}").format(kn=3DTZKEYNAME, na=
me=3Dname)
+             with winreg.OpenKey(handle, tzkeyname) as tzkey:
+                 keydict =3D valuestodict(tzkey)
+=20
+@@ -282,7 +281,7 @@ class tzwinlocal(tzwinbase):
+             self._dst_abbr =3D keydict["DaylightName"]
+=20
+             try:
+-                tzkeyname =3D text_type('{kn}\\{sn}').format(kn=3DTZKEY=
NAME,
++                tzkeyname =3D str('{kn}\\{sn}').format(kn=3DTZKEYNAME,
+                                                           sn=3Dself._st=
d_abbr)
+                 with winreg.OpenKey(handle, tzkeyname) as tzkey:
+                     _keydict =3D valuestodict(tzkey)
+diff --git a/tests/property/test_tz_prop.py b/tests/property/test_tz_pro=
p.py
+index ec6d271..d5806b6 100644
+--- a/tests/property/test_tz_prop.py
++++ b/tests/property/test_tz_prop.py
+@@ -1,7 +1,6 @@
+ from datetime import datetime, timedelta
+=20
+ import pytest
+-import six
+ from hypothesis import assume, given
+ from hypothesis import strategies as st
+=20
+@@ -25,10 +24,7 @@ def test_gettz_returns_local(gettz_arg, dt):
+         return
+=20
+     dt_act =3D dt.astimezone(tz.gettz(gettz_arg))
+-    if six.PY2:
+-        dt_exp =3D dt.astimezone(tz.tzlocal())
+-    else:
+-        dt_exp =3D dt.astimezone()
++    dt_exp =3D dt.astimezone()
+=20
+     assert dt_act =3D=3D dt_exp
+     assert dt_act.tzname() =3D=3D dt_exp.tzname()
+diff --git a/tests/test_imports.py b/tests/test_imports.py
+index 7d0749e..caad793 100644
+--- a/tests/test_imports.py
++++ b/tests/test_imports.py
+@@ -1,7 +1,6 @@
+ import sys
+ import unittest
+ import pytest
+-import six
+=20
+ MODULE_TYPE =3D type(sys)
+=20
+@@ -10,12 +9,8 @@ MODULE_TYPE =3D type(sys)
+ # But since we expect lazy imports tests to fail for Python < 3.7  we'l=
l ignore those
+ # warnings with this filter.
+=20
+-if six.PY2:
+-    filter_import_warning =3D pytest.mark.filterwarnings("ignore::Runti=
meWarning")
+-else:
+-
+-    def filter_import_warning(f):
+-        return f
++def filter_import_warning(f):
++    return f
+=20
+=20
+ @pytest.fixture(scope=3D"function")
+diff --git a/tests/test_isoparser.py b/tests/test_isoparser.py
+index c33881f..874070c 100644
+--- a/tests/test_isoparser.py
++++ b/tests/test_isoparser.py
+@@ -9,7 +9,6 @@ from dateutil.tz import UTC
+ from dateutil.parser import isoparser, isoparse
+=20
+ import pytest
+-import six
+=20
+=20
+ def _generate_tzoffsets(limited):
+@@ -297,7 +296,7 @@ def test_isoparser_invalid_sep(sep):
+=20
+=20
+ # This only fails on Python 3
+-@pytest.mark.xfail(not six.PY2, reason=3D"Fails on Python 3 only")
++@pytest.mark.xfail(reason=3D"Fails on Python 3 only")
+ def test_isoparser_byte_sep():
+     dt =3D datetime(2017, 12, 6, 12, 30, 45)
+     dt_str =3D dt.isoformat(sep=3Dstr('T'))
+@@ -347,9 +346,7 @@ def __make_date_examples():
+         date(2016, 2, 1)
+     ]
+=20
+-    if not six.PY2:
+-        # strftime does not support dates before 1900 in Python 2
+-        dates_no_day.append(date(1000, 11, 1))
++    dates_no_day.append(date(1000, 11, 1))
+=20
+     # Only one supported format for dates with no day
+     o =3D zip(dates_no_day, it.repeat('%Y-%m'))
+@@ -371,7 +368,7 @@ def __make_date_examples():
+ @pytest.mark.parametrize('as_bytes', [True, False])
+ def test_parse_isodate(d, dt_fmt, as_bytes):
+     d_str =3D d.strftime(dt_fmt)
+-    if isinstance(d_str, six.text_type) and as_bytes:
++    if isinstance(d_str, str) and as_bytes:
+         d_str =3D d_str.encode('ascii')
+     elif isinstance(d_str, bytes) and not as_bytes:
+         d_str =3D d_str.decode('ascii')
+@@ -400,10 +397,7 @@ def test_parse_isodate_error_text():
+         isoparser().parse_isodate('2014-0423')
+=20
+     # ensure the error message does not contain b' prefixes
+-    if six.PY2:
+-        expected_error =3D "String contains unknown ISO components: u'2=
014-0423'"
+-    else:
+-        expected_error =3D "String contains unknown ISO components: '20=
14-0423'"
++    expected_error =3D "String contains unknown ISO components: '2014-0=
423'"
+     assert expected_error =3D=3D str(excinfo.value)
+=20
+=20
+@@ -458,7 +452,7 @@ def __make_time_examples():
+ @pytest.mark.parametrize('as_bytes', [True, False])
+ def test_isotime(time_val, time_fmt, as_bytes):
+     tstr =3D time_val.strftime(time_fmt)
+-    if isinstance(tstr, six.text_type) and as_bytes:
++    if isinstance(tstr, str) and as_bytes:
+         tstr =3D tstr.encode('ascii')
+     elif isinstance(tstr, bytes) and not as_bytes:
+         tstr =3D tstr.decode('ascii')
+diff --git a/tests/test_parser.py b/tests/test_parser.py
+index 08a34da..c66850e 100644
+--- a/tests/test_parser.py
++++ b/tests/test_parser.py
+@@ -14,7 +14,6 @@ from dateutil.parser import UnknownTimezoneWarning
+=20
+ from ._common import TZEnvContext
+=20
+-from six import assertRaisesRegex, PY2
+ from io import StringIO
+=20
+ import pytest
+@@ -462,12 +461,6 @@ class ParserTest(unittest.TestCase):
+                          datetime(2003, 9, 25, 10, 36, 28,
+                                   tzinfo=3Dself.brsttz))
+=20
+-    def testDateCommandFormatWithLong(self):
+-        if PY2:
+-            self.assertEqual(parse("Thu Sep 25 10:36:28 BRST 2003",
+-                                   tzinfos=3D{"BRST": long(-10800)}),
+-                             datetime(2003, 9, 25, 10, 36, 28,
+-                                      tzinfo=3Dself.brsttz))
+=20
+     def testISOFormatStrip2(self):
+         self.assertEqual(parse("2003-09-25T10:49:41+03:00"),
+@@ -570,11 +563,11 @@ class ParserTest(unittest.TestCase):
+             parse('shouldfail')
+=20
+     def testCorrectErrorOnFuzzyWithTokens(self):
+-        assertRaisesRegex(self, ParserError, 'Unknown string format',
++        self.assertRaisesRegex(ParserError, 'Unknown string format',
+                           parse, '04/04/32/423', fuzzy_with_tokens=3DTr=
ue)
+-        assertRaisesRegex(self, ParserError, 'Unknown string format',
++        self.assertRaisesRegex(ParserError, 'Unknown string format',
+                           parse, '04/04/04 +32423', fuzzy_with_tokens=3D=
True)
+-        assertRaisesRegex(self, ParserError, 'Unknown string format',
++        self.assertRaisesRegex(ParserError, 'Unknown string format',
+                           parse, '04/04/0d4', fuzzy_with_tokens=3DTrue)
+=20
+     def testIncreasingCTime(self):
+diff --git a/tests/test_rrule.py b/tests/test_rrule.py
+index 52673ec..f50b24e 100644
+--- a/tests/test_rrule.py
++++ b/tests/test_rrule.py
+@@ -3,7 +3,6 @@ from __future__ import unicode_literals
+=20
+ from datetime import datetime, date
+ import unittest
+-from six import PY2
+=20
+ from dateutil import tz
+ from dateutil.rrule import (
+@@ -2282,26 +2281,6 @@ class RRuleTest(unittest.TestCase):
+                           datetime(2010, 3, 22, 13, 1),
+                           datetime(2010, 3, 22, 14, 1)])
+=20
+-    def testLongIntegers(self):
+-        if PY2:  # There are no longs in python3
+-            self.assertEqual(list(rrule(MINUTELY,
+-                                  count=3Dlong(2),
+-                                  interval=3Dlong(2),
+-                                  bymonth=3Dlong(2),
+-                                  byweekday=3Dlong(3),
+-                                  byhour=3Dlong(6),
+-                                  byminute=3Dlong(6),
+-                                  bysecond=3Dlong(6),
+-                                  dtstart=3Ddatetime(1997, 9, 2, 9, 0))=
),
+-                             [datetime(1998, 2, 5, 6, 6, 6),
+-                              datetime(1998, 2, 12, 6, 6, 6)])
+-            self.assertEqual(list(rrule(YEARLY,
+-                                  count=3Dlong(2),
+-                                  bymonthday=3Dlong(5),
+-                                  byweekno=3Dlong(2),
+-                                  dtstart=3Ddatetime(1997, 9, 2, 9, 0))=
),
+-                             [datetime(1998, 1, 5, 9, 0),
+-                              datetime(2004, 1, 5, 9, 0)])
+=20
+     def testHourlyBadRRule(self):
+         """
+@@ -4577,23 +4556,6 @@ class RRuleTest(unittest.TestCase):
+                               wkst=3DSU,
+                               dtstart=3Ddatetime(1997, 9, 2, 9, 0)))
+=20
+-    def testToStrLongIntegers(self):
+-        if PY2:  # There are no longs in python3
+-            self._rrulestr_reverse_test(rrule(MINUTELY,
+-                                  count=3Dlong(2),
+-                                  interval=3Dlong(2),
+-                                  bymonth=3Dlong(2),
+-                                  byweekday=3Dlong(3),
+-                                  byhour=3Dlong(6),
+-                                  byminute=3Dlong(6),
+-                                  bysecond=3Dlong(6),
+-                                  dtstart=3Ddatetime(1997, 9, 2, 9, 0))=
)
+-
+-            self._rrulestr_reverse_test(rrule(YEARLY,
+-                                  count=3Dlong(2),
+-                                  bymonthday=3Dlong(5),
+-                                  byweekno=3Dlong(2),
+-                                  dtstart=3Ddatetime(1997, 9, 2, 9, 0))=
)
+=20
+     def testReplaceIfSet(self):
+         rr =3D rrule(YEARLY,
+diff --git a/tests/test_tz.py b/tests/test_tz.py
+index e5e4772..41c17ff 100644
+--- a/tests/test_tz.py
++++ b/tests/test_tz.py
+@@ -7,7 +7,6 @@ from ._common import ComparesEqual
+ from datetime import datetime, timedelta
+ from datetime import time as dt_time
+ from datetime import tzinfo
+-from six import PY2
+ from io import BytesIO, StringIO
+ import unittest
+=20
+@@ -1114,11 +1113,6 @@ def test_gettz_badzone_unicode():
+             b"America/New_York",
+             ".*should be str, not bytes.*",
+             id=3D"bytes on Python 3",
+-            marks=3D[
+-                pytest.mark.skipif(
+-                    PY2, reason=3D"bytes arguments accepted in Python 2=
"
+-                )
+-            ],
+         ),
+         pytest.param(
+             object(),
+diff --git a/updatezinfo.py b/updatezinfo.py
+index bba53d5..f77dfa1 100644
+--- a/updatezinfo.py
++++ b/updatezinfo.py
+@@ -4,8 +4,8 @@ import hashlib
+ import json
+ import io
+=20
+-from six.moves.urllib import request
+-from six.moves.urllib import error as urllib_error
++from urllib import request
++from urllib import error as urllib_error
+=20
+ try:
+     import dateutil
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.b=
b b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
index 2999606e06..dd3f55edf9 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
@@ -4,6 +4,7 @@ HOMEPAGE =3D "https://dateutil.readthedocs.org"
 LICENSE =3D "Apache-2.0 AND BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3155c7bdc71f66e02678411d2abf=
996"
=20
+SRC_URI +=3D "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] =3D "78e73e19c63f5b20ffa567001531680d939dc042bf785043=
1877645523c66709"
=20
 PYPI_PACKAGE =3D "python-dateutil"
@@ -19,7 +20,6 @@ DEPENDS +=3D "python3-setuptools-scm-native"
 RDEPENDS:${PN} =3D "\
     python3-datetime \
     python3-numbers \
-    python3-six \
     python3-stringold \
 "
=20
--=20
2.55.0


