Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29083.1793862644878837719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=P3ALOEcF;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2672909eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 23:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862644; x=1794467444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inuCz6JEy9Cq+I9TL3js+7nx4BsQjYkwXWPDlgo28B0=;
        b=P3ALOEcFYgUvRgClrYoqPsfXyxbrchUG0oI8/ABa6bx7MGz3dUf4R39IhEkoHj3RUd
         dgKhGMfQktNsXrMWP9+FA39y/LlTqaJ+03cKVJY+XGr3ILgz561KBka4p268cWWBanXq
         QD2Qr1SC6rrQFax9HRuXgC7HsscQ768/XeSRlnEz2wzyTxD6Zp5knbG3I14HRpI5S011
         gsZdaYnMEfeJvZHcC2h9HXYero0d0GkAz6/dL299XVxUHm7JQ1XHyPLU4appLS2yJ48C
         HOcql5faTOuvQkmcSPC1fglxpiAENYBJQAzc7NGW037EvihCKiiNK+/d4x6AVX1qPaHo
         j9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862644; x=1794467444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=inuCz6JEy9Cq+I9TL3js+7nx4BsQjYkwXWPDlgo28B0=;
        b=zlqC8XuvSbRLrLy7Z5Edm2zI0wtwG6lH3vfTX1m8bUWZ0d4VSi3BLZWTMuGj+94shq
         UMftQs+AbKnn3159TdSawvjpb9atIEpx4CnAAl8wiVn1PCgpO7fdLuAl4dqshB+iVBM2
         DjFqLurwD7hy/XuMiRwYc94stEFcqNnwuK2NPMT3Ztu2HPTV6Gi5ESpGDt0Mrm4vjOaB
         iZ/7OSNa5I/P5C9ZrqK1sqeJc+pULj0Ejz52JTpSRZ8pul+1XefN9b+vRJ933pHpKUhX
         lA0R21WHK9JGsMUZ/epAWyv3PBZMdi/Z+p0h30sItVetwsoY4vGhrvW1I+qQdG7GLTMg
         FQxA==
X-Gm-Message-State: APuU4Z+DglaeMgtZ4lzod1yAEvWjs5jPynNi4d6I8wnk14knJC9yhuBF
	udjCbG705wXaT5dj6Sn1MAGqXD+/6JxYsaEROHqmtIYPcA9GLEbMIOaH7/o4zIKYNto=
X-Gm-Gg: AYBFou3D0vZuTKuQkU0Q96HPO9dqbNQW1EPddZVwCpUNpo4d0eJuZQjee7/+tHQAXDd
	ulTdsagbVVfkSo9JRmJfDw38Ms5fjBDhftYxVQ7MOyI05nGd6FKmgH671NrvEpddqMhGNVL0hFw
	3kzL6238vWWY5ppvDR3PUsVu9qYmTMHV39AZDWv+EedSfbRWYxzIHA0L3FWKN9BVRlKdCB80Gjn
	ZCJwJaWhRpXpEnipHXh9TGZVaSn3KG9ZHngH7pfgyobcpW+oIbUv0vwLL079f9t6BgCzKoEX2ZL
	es2pL8zgGPsL4Iafcx04HKGG3Ku5Chk2pM3xLH8WwZPOAWRGb6G19hMRkHhWaHZpXJKv5xY7BEB
	4/yuPywCR70RqWdqaSH+VsYVSZQD+Zu8qhIov+Et1Y2HHQdkclBw+dbA9CSshhJHvCMlBK+Wg+n
	plr99iSZ3jcRUVvtdCXgTRSNo6bT7Jvf/omL1ZUPUq8tB/cL2fi9VRieL/MHMeqMn9K5h31lyuJ
	45cf2cz6jPGNc6stoJ+MRrJwtzXY783fZQ8ieeh3K76qFvrQuk1g+UxBO0yCWe57WxELGlZYfnT
	bmupgKjVMxMJvs/ZvhlWMvcdrhhuSdN+qXz9IULUaCvCPxijMPgSsJAewfFtGKnM30g46WgKhzH
	hS3MDVcUU5dhTvABIpYnHQX1YrR/2hGfarey2a7snNYJSFNePoMaR4hYVfj/q3x8jl2b87Jqjln
	lB6xFT7um9aVUVI1oPzNrZvBY4hKUvIFf5fJNNquovr9d+Iul24HHn2xJODO6b8hFMBLIBd0DTC
	o7gXUP4+MnVoUdU8ueigAn3XXoEmBGLSczUXSU/7kl0/a76jxg2yS2AbdYnpHS0md5W0XwDjVze
	+bsA
X-Received: by 2002:a05:7301:82a:b0:351:dbc:b663 with SMTP id 5a478bee46e88-36a4244f9f6mr30545300eec.31.1793862643917;
        Wed, 04 Nov 2026 23:10:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm13132205eec.28.2026.11.04.23.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:10:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/4] python3-pytest-forked: Upgrade 1.6.0 -> 1.7.5
Date: Wed,  4 Nov 2026 23:10:37 -0800
Message-ID: <20261105071038.2029943-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105071038.2029943-1-khem.raj@oss.qualcomm.com>
References: <20261105071038.2029943-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131871
Content-Type: text/plain; charset="utf-8"

1.7.5 replaced py.process.ForkedFunc with multiprocessing, so swap the
python3-py runtime dependency for python3-multiprocessing. The sdist is
now named pytest_forked, the pypi class default, so drop
PYPI_PACKAGE_SDIST.

Backport the pending upstream fix for pytest 9.2, where TestReport
carries a NodeId object in _id that marshal cannot serialize; every
forked test crashed with "ValueError: unmarshallable object". This made
python3-starlette ptests report no results at all; all of them pass
now on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...report-serialization-with-pytest-9.2.patch | 142 ++++++++++++++++++
 ....6.0.bb => python3-pytest-forked_1.7.5.bb} |   8 +-
 2 files changed, 146 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-forked/0001-Fix-report-serialization-with-pytest-9.2.patch
 rename meta-python/recipes-devtools/python/{python3-pytest-forked_1.6.0.bb => python3-pytest-forked_1.7.5.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked/0001-Fix-report-serialization-with-pytest-9.2.patch b/meta-python/recipes-devtools/python/python3-pytest-forked/0001-Fix-report-serialization-with-pytest-9.2.patch
new file mode 100644
index 0000000000..55c7e8feee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-forked/0001-Fix-report-serialization-with-pytest-9.2.patch
@@ -0,0 +1,142 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Fish Wang <fishw@asu.edu>
+Date: Wed, 28 Oct 2026 01:55:59 +0000
+Subject: [PATCH] Fix report serialization with pytest 9.2.
+
+pytest 9.2 turned TestReport.nodeid into a property backed by a NodeId
+object. It is not marshalable, so pytest-forked breaks.
+
+- Now serialize_report emits a plain nodeid string.
+- Crash reports use the call phase; pytest 9.2 prints the phase in the
+  short summary, which exposed the ??? placeholder.
+- The forked child writes its traceback to the captured stderr file
+  before exiting with "status 3," so the next similar failure is easier
+  to spot.
+
+Upstream-Status: Submitted [https://github.com/pytest-dev/pytest-forked/pull/112]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CHANGELOG.rst                 |  9 ++++++++
+ src/pytest_forked/__init__.py | 19 +++++++++++-----
+ testing/test_boxed.py         | 43 +++++++++++++++++++++++++++++++++++
+ 3 files changed, 65 insertions(+), 6 deletions(-)
+
+diff --git a/CHANGELOG.rst b/CHANGELOG.rst
+index fe6e527..20d76c0 100644
+--- a/CHANGELOG.rst
++++ b/CHANGELOG.rst
+@@ -1,3 +1,12 @@
++Unreleased
++==========
++
++* Fix compatibility with pytest 9.2: reports now carry a ``NodeId`` object that
++  ``marshal`` cannot serialize, which made every forked test exit with status 3.
++* Report crashes as the ``call`` phase instead of ``???``.
++* Show the traceback when the forked child fails outside the test itself.
++
++
+ v1.7.5
+ ======
+ 
+diff --git a/src/pytest_forked/__init__.py b/src/pytest_forked/__init__.py
+index 6d135cb..2f53266 100644
+--- a/src/pytest_forked/__init__.py
++++ b/src/pytest_forked/__init__.py
+@@ -13,6 +13,10 @@ from _pytest import runner
+ # copied from xdist remote
+ def serialize_report(rep):
+     d = rep.__dict__.copy()
++    # pytest >= 9.2 stores a NodeId object in ``_id`` and exposes ``nodeid``
++    # as a property. convert it to a plain string.
++    if "_id" in d:
++        d["nodeid"] = str(d.pop("_id"))
+     if hasattr(rep.longrepr, "toterminal"):
+         d["longrepr"] = str(rep.longrepr)
+     else:
+@@ -97,6 +101,11 @@ def _worker(runforked_fn, stdout_path, stderr_path, retval_path):
+         code = e.code if e.code is not None else 0
+         os._exit(int(code))
+     except Exception:
++        import traceback
++
++        # pytest's capture has restored fd 2 by now; write to the file directly
++        with open(stderr_path, "a") as f:
++            traceback.print_exc(file=f)
+         os._exit(EXITSTATUS_EXCEPTION)
+     finally:
+         try:
+@@ -221,12 +230,10 @@ def report_process_crash(item, result):
+ 
+     from _pytest import runner
+ 
+-    # pytest >= 4.1
+-    has_from_call = getattr(runner.CallInfo, "from_call", None) is not None
+-    if has_from_call:
+-        call = runner.CallInfo.from_call(lambda: 0 / 0, "???")
+-    else:
+-        call = runner.CallInfo(lambda: 0 / 0, "???")
++    # The child died while running the test body, so report it as the
++    # "call" phase.
++    # pytest >= 9.2 prints the phase in the short summary; handle it here.
++    call = runner.CallInfo.from_call(lambda: 0 / 0, "call")
+     call.excinfo = info
+     rep = runner.pytest_runtest_makereport(item, call)
+     if result.out:
+diff --git a/testing/test_boxed.py b/testing/test_boxed.py
+index 3d67a9c..269c2a4 100644
+--- a/testing/test_boxed.py
++++ b/testing/test_boxed.py
+@@ -1,6 +1,10 @@
++import marshal
+ import os
+ 
+ import pytest
++from _pytest.reports import TestReport
++
++from pytest_forked import serialize_report
+ 
+ needsfork = pytest.mark.skipif(not hasattr(os, "fork"), reason="os.fork required")
+ 
+@@ -119,3 +123,42 @@ def test_forked_followed_by_other_test_tears_down(testdir):
+ def test_is_not_boxed_by_default(testdir):
+     config = testdir.parseconfig(testdir.tmpdir)
+     assert not config.option.forked
++
++
++def test_serialize_report_roundtrips_through_marshal():
++    rep = TestReport(
++        "test_x.py::test_y",
++        ("test_x.py", 1, "test_y"),
++        {},
++        "passed",
++        None,
++        "call",
++        [],
++        0.1,
++        0.0,
++        0.1,
++        [],
++    )
++    d = marshal.loads(marshal.dumps(serialize_report(rep)))
++    assert "_id" not in d
++    rebuilt = TestReport(**d)
++    assert rebuilt.nodeid == rep.nodeid
++    assert rebuilt.outcome == "passed"
++
++
++@needsfork
++def test_child_exception_traceback_is_reported(testdir):
++    p1 = testdir.makepyfile(
++        """
++        def test_function(record_property):
++            record_property("obj", object())
++        """
++    )
++    result = testdir.runpytest(p1, "--forked")
++    result.stdout.fnmatch_lines(
++        [
++            "*EXITED with status 3*",
++            "*ValueError: unmarshallable object*",
++            "*1 failed*",
++        ]
++    )
diff --git a/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb b/meta-python/recipes-devtools/python/python3-pytest-forked_1.7.5.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-forked_1.7.5.bb
index 825141faa2..e75443a431 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-forked_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-forked_1.7.5.bb
@@ -3,17 +3,17 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-forked"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
-SRC_URI[sha256sum] = "4dafd46a9a600f65d822b8f605133ecf5b3e1941ebb3588e943b4e3eb71a5a3f"
+SRC_URI += "file://0001-Fix-report-serialization-with-pytest-9.2.patch"
 
-inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "00f2bee51612f29b8e6b81eed2c3b2975e824c2693394f5bdaf7a1369078ba5f"
 
-PYPI_PACKAGE_SDIST = "pytest-forked"
+inherit pypi python_setuptools_build_meta
 
 PEP517_BUILD_OPTS = "--skip-dependency-check"
 
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
-    python3-py \
+    python3-multiprocessing \
     python3-pytest \
 "
