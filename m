Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F04C83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:35:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26768.1693931720014108196
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=o1bqyU7S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=761287e60f=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385BRmfH032190
	for <openembedded-devel@lists.openembedded.org>; Tue, 5 Sep 2023 09:35:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=Vt+v0mp91V/2YdywE0
	y4xZ2egQWPsAVeRvbLz7GrcHU=; b=o1bqyU7SmvTiIw8oTC9+qhUyDEyiyDfV2r
	gzRsKIH41MqcyM3uk/T/oXKZ26kSfoW0/+TWiK/DU0j06h1NiRPZvW8hGWJtPeHa
	PNmFKpTGDtlJSzI7aptucgCPHEeZaJBg24GEx1kVeTYAJqdprNNT3ZueBldvBn+9
	1BPKMAfCtG78OX1xJn+gS90ZBrSTL3TncW+KaO2fuhT81f/45oWd8UnxjzJ8/JGO
	0QCshUOCwYB2RYjWk9p5MaKvtoAlKbTdgT5yjSCdoUi0iFpD5Gbhlb5bfrfMBZXQ
	E9IiGsjeGtQjVoxEDrO08Esk0FD4tDrFjzmI8rgZXtVn+kYWne6A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b02hkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 09:35:19 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 09:35:17 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 09:35:17 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v2][meta-python][PATCH 1/1] python3-inotify: fix tests
Date: Tue, 5 Sep 2023 09:35:18 -0700
Message-ID: <20230905163518.3688071-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: cbBmEIU_g3XdN3qoLWvqdSu8YjwPA0Mu
X-Proofpoint-GUID: cbBmEIU_g3XdN3qoLWvqdSu8YjwPA0Mu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=932
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309050145
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 385BRmfH032190
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 16:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104727

From: Joe Slater <joe.slater@windriver.com>

Some tests in test-inotify.py assume values for watch
descriptors.  This is not safe, so we retrieve the
assigned values to compare with event information generated.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../python3-inotify/new-test-inotify.patch    | 620 ++++++++++++++++++
 .../python/python3-inotify_git.bb             |   1 +
 2 files changed, 621 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-inotify/n=
ew-test-inotify.patch

diff --git a/meta-python/recipes-devtools/python/python3-inotify/new-test=
-inotify.patch b/meta-python/recipes-devtools/python/python3-inotify/new-=
test-inotify.patch
new file mode 100644
index 0000000000..e462615e14
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inotify/new-test-inotif=
y.patch
@@ -0,0 +1,620 @@
+From 80010e27d774e8b722d569384492eaab2bc4ac61 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 27 Jul 2023 15:01:04 +0000
+Subject: [PATCH] working commit
+
+It is not safe to assume the values returned by add_watch(),
+so we add a local helper get_wd() to retrieve them.  This fixes
+a problem in TestInotifyTree.test__cycle() where the
+wd's for the 'aa' and 'bb' paths are not '2' and '3',
+respectively.
+
+A second issue is that Inotify._get_event_names() should
+return a set or sorted list to avoid comparison problems,
+but that is not addressed here since it could be viewed as
+changing the API.
+
+This test_inotify.py is based on the version in the fix_tests branch of
+pyinotify as of commit d7d3c58...
+
+Upstream-Status: Submitted [github.com/dsoprea/PyInotify/pull/104]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ tests/test_inotify.py | 346 ++++++++++++++++++++++++++++++++----------
+ 1 file changed, 262 insertions(+), 84 deletions(-)
+
+diff --git a/tests/test_inotify.py b/tests/test_inotify.py
+index d9f1f84..d89a49e 100644
+--- a/tests/test_inotify.py
++++ b/tests/test_inotify.py
+@@ -2,6 +2,7 @@
+=20
+ import os
+ import unittest
++import time
+=20
+ import inotify.constants
+ import inotify.calls
+@@ -15,6 +16,11 @@ except NameError:
+ else:
+     _HAS_PYTHON2_UNICODE_SUPPORT =3D True
+=20
++# Inotify does not have a get for watch descriptors
++#=20
++def get_wd(i, path):
++    return i._Inotify__watches[path]
++
+=20
+ class TestInotify(unittest.TestCase):
+     def __init__(self, *args, **kwargs):
+@@ -29,11 +35,11 @@ class TestInotify(unittest.TestCase):
+     @unittest.skipIf(_HAS_PYTHON2_UNICODE_SUPPORT is True, "Not in Pyth=
on 3")
+     def test__international_naming_python3(self):
+         with inotify.test_support.temp_path() as path:
+-            inner_path =3D os.path.join(path, '=E6=96=B0=E5=A2=9E=E8=B3=
=87=E6=96=99=E5=A4=BE')
++            inner_path =3D os.path.join(path, u'=E6=96=B0=E5=A2=9E=E8=B3=
=87=E6=96=99=E5=A4=BE')
+             os.mkdir(inner_path)
+=20
+             i =3D inotify.adapters.Inotify()
+-            i.add_watch(inner_path)
++            wd =3D i.add_watch(inner_path)
+=20
+             with open(os.path.join(inner_path, 'filename'), 'w'):
+                 pass
+@@ -41,12 +47,27 @@ class TestInotify(unittest.TestCase):
+             events =3D self.__read_all_events(i)
+=20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], inner_path, 'filename'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], inner_path, 'filename'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, 'filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256, c=
ookie=3D0, len=3D16), ['IN_CREATE'], inner_path, 'filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32, co=
okie=3D0, len=3D16), ['IN_OPEN'], inner_path, 'filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, coo=
kie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, 'filename'),
+             ]
+=20
+-            self.assertEquals(events, expected)
++            if events !=3D expected:
++                print("ACTUAL:")
++                print("")
++
++                for i, event in enumerate(events):
++                    print(event)
++
++                print("")
++
++                print("EXPECTED:")
++                print("")
++
++                for i, event in enumerate(expected):
++                    print(event)
++
++                raise Exception("Events not correct.")
+=20
+     @unittest.skipIf(_HAS_PYTHON2_UNICODE_SUPPORT is False, "Not in Pyt=
hon 2")
+     def test__international_naming_python2(self):
+@@ -55,7 +76,7 @@ class TestInotify(unittest.TestCase):
+             os.mkdir(inner_path)
+=20
+             i =3D inotify.adapters.Inotify()
+-            i.add_watch(inner_path)
++            wd =3D i.add_watch(inner_path)
+=20
+             with open(os.path.join(inner_path, u'filename=E6=96=99=E5=A4=
=BE'), 'w'):
+                 pass
+@@ -63,12 +84,28 @@ class TestInotify(unittest.TestCase):
+             events =3D self.__read_all_events(i)
+=20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], inner_path, u'filename=E6=96=99=E5=A4=
=BE'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], inner_path, u'filename=E6=96=99=E5=A4=BE=
'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, u'filename=E6=96=99=E5=
=A4=BE'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256, c=
ookie=3D0, len=3D16), ['IN_CREATE'], inner_path, u'filename=E6=96=99=E5=A4=
=BE'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32, co=
okie=3D0, len=3D16), ['IN_OPEN'], inner_path, u'filename=E6=96=99=E5=A4=BE=
'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, coo=
kie=3D0, len=3D16), ['IN_CLOSE_WRITE'], inner_path, u'filename=E6=96=99=E5=
=A4=BE'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D16, co=
okie=3D0, len=3D16), ['IN_CLOSE_NOWRITE'], inner_path, u'filename=E6=96=99=
=E5=A4=BE'),
+             ]
+=20
+-            self.assertEquals(events, expected)
++            if events !=3D expected:
++                print("ACTUAL:")
++                print("")
++
++                for i, event in enumerate(events):
++                    print(event)
++
++                print("")
++
++                print("EXPECTED:")
++                print("")
++
++                for i, event in enumerate(expected):
++                    print(event)
++
++                raise Exception("Events not correct.")
+=20
+     def test__cycle(self):
+         with inotify.test_support.temp_path() as path:
+@@ -79,7 +116,7 @@ class TestInotify(unittest.TestCase):
+             os.mkdir(path2)
+=20
+             i =3D inotify.adapters.Inotify()
+-            i.add_watch(path1)
++            wd =3D i.add_watch(path1)
+=20
+             with open('ignored_new_file', 'w'):
+                 pass
+@@ -96,32 +133,47 @@ class TestInotify(unittest.TestCase):
+=20
+             expected =3D [
+                 (
+-                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256,=
 cookie=3D0, len=3D16),
++                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256=
, cookie=3D0, len=3D16),
+                     ['IN_CREATE'],
+                     path1,
+                     'seen_new_file'
+                 ),
+                 (
+-                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, =
cookie=3D0, len=3D16),
++                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32,=
 cookie=3D0, len=3D16),
+                     ['IN_OPEN'],
+                     path1,
+                     'seen_new_file'
+                 ),
+                 (
+-                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, c=
ookie=3D0, len=3D16),
++                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, =
cookie=3D0, len=3D16),
+                     ['IN_CLOSE_WRITE'],
+                     path1,
+                     'seen_new_file'
+                 ),
+                 (
+-                    inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D512,=
 cookie=3D0, len=3D16),
++                    inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D512=
, cookie=3D0, len=3D16),
+                     ['IN_DELETE'],
+                     path1,
+                     'seen_new_file'
+                 )
+             ]
+=20
+-            self.assertEquals(events, expected)
++            if events !=3D expected:
++                print("ACTUAL:")
++                print("")
++
++                for i, event in enumerate(events):
++                    print(event)
++
++                print("")
++
++                print("EXPECTED:")
++                print("")
++
++                for i, event in enumerate(expected):
++                    print(event)
++
++                raise Exception("Events not correct.")
+=20
+             # This can't be removed until *after* we've read the events=
 because
+             # they'll be flushed the moment we remove the watch.
+@@ -131,7 +183,7 @@ class TestInotify(unittest.TestCase):
+                 pass
+=20
+             events =3D self.__read_all_events(i)
+-            self.assertEquals(events, [])
++            self.assertEqual(events, [])
+=20
+     @staticmethod
+     def _open_write_close(*args):
+@@ -167,23 +219,47 @@ class TestInotify(unittest.TestCase):
+         with inotify.test_support.temp_path() as path:
+             path1 =3D TestInotify._make_temp_path(path, 'aa')
+             path2 =3D TestInotify._make_temp_path(path, 'bb')
++
+             i =3D inotify.adapters.Inotify([path1, path2])
++
+             TestInotify._open_write_close('ignored_new_file')
+             TestInotify._open_write_close(path1, 'seen_new_file')
+             TestInotify._open_write_close(path2, 'seen_new_file2')
++           =20
++            wd_path1 =3D get_wd(i, path1)
++            wd_path2 =3D get_wd(i, path2)
++
++
+             os.remove(os.path.join(path1, 'seen_new_file'))
++
+             events =3D self.__read_all_events(i)
++
+             expected =3D [
+-                TestInotify._event_create(wd=3D1, path=3Dpath1, filenam=
e=3D'seen_new_file'),
+-                TestInotify._event_open(wd=3D1, path=3Dpath1, filename=3D=
'seen_new_file'),
+-                TestInotify._event_close_write(wd=3D1, path=3Dpath1, fi=
lename=3D'seen_new_file'),
+-                TestInotify._event_create(wd=3D2, path=3Dpath2, filenam=
e=3D'seen_new_file2'),
+-                TestInotify._event_open(wd=3D2, path=3Dpath2, filename=3D=
'seen_new_file2'),
+-                TestInotify._event_close_write(wd=3D2, path=3Dpath2, fi=
lename=3D'seen_new_file2'),
+-                TestInotify._event_general(wd=3D1, mask=3D512, type_nam=
e=3D'IN_DELETE',
+-                                           path=3Dpath1, filename=3D'se=
en_new_file')
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path1, u'seen_new_file'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path1, u'seen_new_file'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, u'seen_new_file'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, u'seen_new_file2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, u'seen_new_file2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, u'seen_new_file2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
512, cookie=3D0, len=3D16), ['IN_DELETE'], path1, u'seen_new_file'),
+             ]
+-            self.assertEquals(events, expected)
++
++            if events !=3D expected:
++                print("ACTUAL:")
++                print("")
++
++                for i, event in enumerate(events):
++                    print(event)
++
++                print("")
++
++                print("EXPECTED:")
++                print("")
++
++                for i, event in enumerate(expected):
++                    print(event)
++
++                raise Exception("Events not correct.")
+=20
+     def test__error_on_watch_nonexistent_folder(self):
+         i =3D inotify.adapters.Inotify()
+@@ -201,7 +277,7 @@ class TestInotify(unittest.TestCase):
+         i =3D inotify.adapters.Inotify()
+         names =3D i._get_event_names(all_mask)
+=20
+-        self.assertEquals(names, all_names)
++        self.assertEqual(names, all_names)
+=20
+=20
+ class TestInotifyTree(unittest.TestCase):
+@@ -219,56 +295,101 @@ class TestInotifyTree(unittest.TestCase):
+             path1 =3D os.path.join(path, 'aa')
+             os.mkdir(path1)
+=20
++            time.sleep(.10)
++
+             path2 =3D os.path.join(path, 'bb')
+             os.mkdir(path2)
+=20
++            time.sleep(.10)
++
+             i =3D inotify.adapters.InotifyTree(path)
+=20
+             with open('seen_new_file1', 'w'):
+                 pass
+=20
++            time.sleep(.10)
++
+             with open(os.path.join(path1, 'seen_new_file2'), 'w'):
+                 pass
+=20
++            time.sleep(.10)
++
+             with open(os.path.join(path2, 'seen_new_file3'), 'w'):
+                 pass
+=20
++            time.sleep(.10)
++           =20
++            wd_path  =3D get_wd(i.inotify, path)
++            wd_path1 =3D get_wd(i.inotify, path1)
++            wd_path2 =3D get_wd(i.inotify, path2)
++
+             os.remove(os.path.join(path, 'seen_new_file1'))
++
++            time.sleep(.10)
++
+             os.remove(os.path.join(path1, 'seen_new_file2'))
++
++            time.sleep(.10)
++
+             os.remove(os.path.join(path2, 'seen_new_file3'))
+=20
++            time.sleep(.10)
++
+             os.rmdir(path1)
++
++            time.sleep(.10)
++
+             os.rmdir(path2)
+=20
+-            events =3D self.__read_all_events(i)
++            time.sleep(.10)
+=20
++            events =3D self.__read_all_events(i)
++            events =3D sorted(events)
++           =20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path, 'seen_new_file1'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path, 'seen_new_file1'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path, 'seen_new_file1'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D2=
56, cookie=3D0, len=3D16), ['IN_CREATE'], path, 'seen_new_file1'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D3=
2, cookie=3D0, len=3D16), ['IN_OPEN'], path, 'seen_new_file1'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D8=
, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path, 'seen_new_file1'),
+=20
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file2'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file2'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file2'),
+=20
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file3'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file3'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file3'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file3'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file3'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file3'),
+=20
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], path, 'seen_new_file1'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], path1, 'seen_new_file2'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], path2, 'seen_new_file3'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D5=
12, cookie=3D0, len=3D16), ['IN_DELETE'], path, 'seen_new_file1'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
512, cookie=3D0, len=3D16), ['IN_DELETE'], path1, 'seen_new_file2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
512, cookie=3D0, len=3D16), ['IN_DELETE'], path2, 'seen_new_file3'),
+=20
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D1024, c=
ookie=3D0, len=3D0), ['IN_DELETE_SELF'], path1, ''),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D32768, =
cookie=3D0, len=3D0), ['IN_IGNORED'], path1, ''),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
336, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_DELETE'], path, 'aa'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
1024, cookie=3D0, len=3D0), ['IN_DELETE_SELF'], path1, ''),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32768, cookie=3D0, len=3D0), ['IN_IGNORED'], path1, ''),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742336, cookie=3D0, len=3D16), ['IN_DELETE', 'IN_ISDIR'], path, 'aa'),
+=20
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D1024, c=
ookie=3D0, len=3D0), ['IN_DELETE_SELF'], path2, ''),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32768, =
cookie=3D0, len=3D0), ['IN_IGNORED'], path2, ''),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
336, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_DELETE'], path, 'bb'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
1024, cookie=3D0, len=3D0), ['IN_DELETE_SELF'], path2, ''),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32768, cookie=3D0, len=3D0), ['IN_IGNORED'], path2, ''),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742336, cookie=3D0, len=3D16), ['IN_DELETE', 'IN_ISDIR'], path, 'bb'),
+             ]
+=20
+-            self.assertEquals(events, expected)
++            expected =3D sorted(expected)
++
++            if events !=3D expected:
++                print("ACTUAL:")
++                print("")
++
++                for i, event in enumerate(events):
++                    print(event)
++
++                print("")
++
++                print("EXPECTED:")
++                print("")
++
++                for i, event in enumerate(expected):
++                    print(event)
++
++                raise Exception("Events not correct.")
+=20
+     def test__renames(self):
+=20
+@@ -283,26 +404,30 @@ class TestInotifyTree(unittest.TestCase):
+             new_path =3D os.path.join(path, 'new_folder')
+=20
+             os.mkdir(old_path)
++           =20
++            wd_path =3D get_wd(i.inotify, path)
+=20
+             events1 =3D self.__read_all_events(i)
+=20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
080, cookie=3Devents1[0][0].cookie, len=3D16), ['IN_ISDIR', 'IN_CREATE'],=
 path, 'old_folder'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742080, cookie=3Devents1[0][0].cookie, len=3D16), ['IN_CREATE', 'IN_IS=
DIR'], path, 'old_folder'),
+             ]
+=20
+-            self.assertEquals(events1, expected)
+-
++            self.assertEqual(events1, expected)
+=20
+             os.rename(old_path, new_path)
+=20
++            wd_old_path =3D get_wd(i.inotify, old_path)
++
+             events2 =3D self.__read_all_events(i)
+=20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073741=
888, cookie=3Devents2[0][0].cookie, len=3D16), ['IN_MOVED_FROM', 'IN_ISDI=
R'], path, 'old_folder'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073741=
952, cookie=3Devents2[1][0].cookie, len=3D16), ['IN_MOVED_TO', 'IN_ISDIR'=
], path, 'new_folder'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073741888, cookie=3Devents2[0][0].cookie, len=3D16), ['IN_MOVED_FROM', 'I=
N_ISDIR'], path, 'old_folder'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073741952, cookie=3Devents2[1][0].cookie, len=3D16), ['IN_MOVED_TO', 'IN_=
ISDIR'], path, 'new_folder'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D2048, cookie=3D0, len=3D0), ['IN_MOVE_SELF'], new_path, '')
+             ]
+=20
+-            self.assertEquals(events2, expected)
++            self.assertEqual(events2, expected)
+=20
+=20
+             with open(os.path.join(new_path, 'old_filename'), 'w'):
+@@ -318,21 +443,33 @@ class TestInotifyTree(unittest.TestCase):
+             events3 =3D self.__read_all_events(i)
+=20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], new_path, 'old_filename'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], new_path, 'old_filename'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], new_path, 'old_filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D256, cookie=3D0, len=3D16), ['IN_CREATE'], new_path, 'old_filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D32, cookie=3D0, len=3D16), ['IN_OPEN'], new_path, 'old_filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], new_path, 'old_filename'=
),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D64, cookie=3Devents3[3][0].cookie, len=3D16), ['IN_MOVED_FROM'], new_p=
ath, 'old_filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D128, cookie=3Devents3[4][0].cookie, len=3D16), ['IN_MOVED_TO'], new_pa=
th, 'new_filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D512, cookie=3D0, len=3D16), ['IN_DELETE'], new_path, 'new_filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D1024, cookie=3D0, len=3D0), ['IN_DELETE_SELF'], new_path, ''),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_old_path, mask=
=3D32768, cookie=3D0, len=3D0), ['IN_IGNORED'], new_path, ''),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742336, cookie=3D0, len=3D16), ['IN_DELETE', 'IN_ISDIR'], path, 'new_f=
older'),
++            ]
+=20
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D64, coo=
kie=3Devents3[3][0].cookie, len=3D16), ['IN_MOVED_FROM'], new_path, 'old_=
filename'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D128, co=
okie=3Devents3[4][0].cookie, len=3D16), ['IN_MOVED_TO'], new_path, 'new_f=
ilename'),
++            if events3 !=3D expected:
++                print("ACTUAL:")
++                print("")
+=20
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D512, co=
okie=3D0, len=3D16), ['IN_DELETE'], new_path, 'new_filename'),
++                for i, event in enumerate(events3):
++                    print(event)
+=20
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D1024, c=
ookie=3D0, len=3D0), ['IN_DELETE_SELF'], new_path, ''),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32768, =
cookie=3D0, len=3D0), ['IN_IGNORED'], new_path, ''),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
336, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_DELETE'], path, 'new_folder'=
),
+-            ]
++                print("")
++
++                print("EXPECTED:")
++                print("")
+=20
+-            self.assertEquals(events3, expected)
++                for i, event in enumerate(expected):
++                    print(event)
++
++                raise Exception("Events not correct.")
+=20
+     def test__automatic_new_watches_on_new_paths(self):
+=20
+@@ -346,39 +483,60 @@ class TestInotifyTree(unittest.TestCase):
+             path2 =3D os.path.join(path1, 'folder2')
+=20
+             os.mkdir(path1)
++=20
++            wd_path =3D get_wd(i.inotify, path)
+=20
+             events =3D self.__read_all_events(i)
+=20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D1073742=
080, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_CREATE'], path, 'folder1'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path, mask=3D1=
073742080, cookie=3D0, len=3D16), ['IN_CREATE', 'IN_ISDIR'], path, 'folde=
r1'),
+             ]
+=20
+-            self.assertEquals(events, expected)
++            self.assertEqual(events, expected)
+=20
+=20
+             os.mkdir(path2)
+=20
++            wd_path1 =3D get_wd(i.inotify, path1)
++
+             events =3D self.__read_all_events(i)
+=20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D1073742=
080, cookie=3D0, len=3D16), ['IN_ISDIR', 'IN_CREATE'], path1, 'folder2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
1073742080, cookie=3D0, len=3D16), ['IN_CREATE', 'IN_ISDIR'], path1, 'fol=
der2'),
+             ]
+=20
+-            self.assertEquals(events, expected)
++            self.assertEqual(events, expected)
+=20
+=20
+             with open(os.path.join(path2,'filename'), 'w'):
+                 pass
+=20
++            wd_path2 =3D get_wd(i.inotify, path2)
++
+             events =3D self.__read_all_events(i)
+=20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
+             ]
+=20
+-            self.assertEquals(events, expected)
++            if events !=3D expected:
++                print("ACTUAL:")
++                print("")
++
++                for i, event in enumerate(events):
++                    print(event)
++
++                print("")
++
++                print("EXPECTED:")
++                print("")
++
++                for i, event in enumerate(expected):
++                    print(event)
++
++                raise Exception("Events not correct.")
+=20
+     def test__automatic_new_watches_on_existing_paths(self):
+=20
+@@ -396,16 +554,33 @@ class TestInotifyTree(unittest.TestCase):
+=20
+             with open(os.path.join(path2,'filename'), 'w'):
+                 pass
++               =20
++            wd =3D get_wd(i.inotify, path2)
+=20
+             events =3D self.__read_all_events(i)
+=20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D3, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D256, c=
ookie=3D0, len=3D16), ['IN_CREATE'], path2, 'filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D32, co=
okie=3D0, len=3D16), ['IN_OPEN'], path2, 'filename'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd, mask=3D8, coo=
kie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'filename'),
+             ]
+=20
+-            self.assertEquals(events, expected)
++            if events !=3D expected:
++                print("ACTUAL:")
++                print("")
++
++                for i, event in enumerate(events):
++                    print(event)
++
++                print("")
++
++                print("EXPECTED:")
++                print("")
++
++                for i, event in enumerate(expected):
++                    print(event)
++
++                raise Exception("Events not correct.")
+=20
+=20
+ class TestInotifyTrees(unittest.TestCase):
+@@ -428,6 +603,9 @@ class TestInotifyTrees(unittest.TestCase):
+=20
+             i =3D inotify.adapters.InotifyTrees([path1, path2])
+=20
++            wd_path1 =3D get_wd(i.inotify, path1)
++            wd_path2 =3D get_wd(i.inotify, path2)
++
+             with open(os.path.join(path1, 'seen_new_file1'), 'w'):
+                 pass
+=20
+@@ -437,13 +615,13 @@ class TestInotifyTrees(unittest.TestCase):
+             events =3D self.__read_all_events(i)
+=20
+             expected =3D [
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file1'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file1'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D1, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file1'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path1, 'seen_new_file1'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path1, 'seen_new_file1'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path1, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path1, 'seen_new_file1'),
+=20
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D256, co=
okie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file2'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D32, coo=
kie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file2'),
+-                (inotify.adapters._INOTIFY_EVENT(wd=3D2, mask=3D8, cook=
ie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
256, cookie=3D0, len=3D16), ['IN_CREATE'], path2, 'seen_new_file2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
32, cookie=3D0, len=3D16), ['IN_OPEN'], path2, 'seen_new_file2'),
++                (inotify.adapters._INOTIFY_EVENT(wd=3Dwd_path2, mask=3D=
8, cookie=3D0, len=3D16), ['IN_CLOSE_WRITE'], path2, 'seen_new_file2'),
+             ]
+=20
+-            self.assertEquals(events, expected)
++            self.assertEqual(events, expected)
+--=20
+2.35.5
+
diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b=
/meta-python/recipes-devtools/python/python3-inotify_git.bb
index 9e35c7ba5b..2e189ddace 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] =3D "974a623a338482b62e16d4eb705fb863e=
d33ec178680fc3e96ccdf0df6
=20
 SRC_URI =3D " \
     git://github.com/dsoprea/pyinotify.git;branch=3Dmaster;protocol=3Dht=
tps \
+    file://new-test-inotify.patch \
     file://run-ptest \
 "
=20
--=20
2.25.1


