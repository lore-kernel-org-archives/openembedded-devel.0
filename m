Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3132.1795169700360137826
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YriG90z7;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12393; q=dns/txt;
  s=iport01; t=1795169700; x=1796379300;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1B/8t2MTDxy7eAt+kR5BjYNQmgUzH9DbFV5mCMMdrUg=;
  b=YriG90z7RIyZo0cvufRXwRPtpwnVwocOuezWqwGKsw0U99zrwsDSFzDg
   7/mXhOQy/xwS5YrVgFR0o8t4FLcSZS0QDvJq0NpXihinMrDITCvYEwgdz
   QLBXLd2OdunEvVOLugreVVvI3RV9hDNAcIOe9A90tUOhEn9XFcJVGB6Ne
   WMUssPTNj6DLmiOX5hgxZI7WGFf0lpfUmKYKoIqIKIPU0GDa8OuvIkoPU
   +wHjLzJo78IuggWxzZ40B2PVHI93VIIBRW/EI3YD2ysrO4OZ+gj+2Gd13
   e6BwEHHoNjcHzOEF0UNW0pC+tEJkt2OJrQKflizNzXB8Am53iMXHXKJNQ
   g==;
X-CSE-ConnectionGUID: EkqgdQlxQlGobHUyycCyrA==
X-CSE-MsgGUID: UeX0aSFpRNOMjq5d6vzt/A==
X-IPAS-Result: =?us-ascii?q?A0AnAABHHABr/8tK/pBaHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YUJJA4xviG1sgRaKU5JDgX4PAQEBD0QNBAEBhQWOIwImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECASoLARgBLSwDAQJPC?=
 =?us-ascii?q?yMYCYMCAYI6AzcCARG5C4F5M4EBgykBMQWBHthMDYJaAQsUAQWBMwGFQYMAh?=
 =?us-ascii?q?SRdGAGEfScbG4FygRWBO4E5doEFgRpCAoEnhn8EgiKBDIFUHox5AoFPiCZIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyhdA?=
 =?us-ascii?q?SGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLG?=
 =?us-ascii?q?gVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBg0YDUgRLDcVGQQ+bgeTb?=
 =?us-ascii?q?IMSBy0CDjcHCQoBKxeBAQIBBSNBGw0ckxJDkgSBNZ5rcQoog3mMJI8+hXwaM?=
 =?us-ascii?q?4VbpRcLmH2OCoQKkkeEaoFoPIFZcBWDIglKGQ+OLgEKC4NghWTIdyM1AgkDL?=
 =?us-ascii?q?wEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:mXQcfq8iYNXvGp8vulQ0DrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GsfXjiBPK2NMTCgedlwOYuw9x4P6Mfcm9RnSwtqrn1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhMsvvrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kbPpQX9t9zEVhK2
 vsSCA0cfxuolviflefTpulE3qzPLeHiMZlavjRryivUSK58B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YOHWjOX9PYH46tO6znnDldjRCgFmUvqEwpWPUyWSd1ZCwYYqOJoXVHq25mG6lq
 1Ke9l/XGis8E/md0GeJrGy+mqjmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:4eF/966gFuZcgLhqOwPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:o3p+s2O+PGNQee5DdSp++0ItHtAcdlLaxlftMl6zIndzYejA
X-Talos-MUID: 9a23:FcrbzgilFB5qDAcgJfwQ78MpCcpYu62VJlg3t7IjudDZOXJuKSvapWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59834173"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:14:57 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id A1AB61800016C;
	Fri, 20 Nov 2026 10:14:57 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 49C04CC1634; Fri, 20 Nov 2026 02:14:56 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-python][wrynose][PATCH] python3-msgpack: fix CVE-2026-57585
Date: Fri, 20 Nov 2026 02:14:52 -0800
Message-Id: <20261120101452.2130919-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 12:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132772
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

MessagePack 1.1.2 retains parser context after unpacking errors, which
can cause a crash when the Unpacker is reused. The upstream fix [1],
described in [2], clears that context on failure.

Container-slot initialization and map-item reference transfer from [3]
ensure error cleanup only releases references still owned by the parser.
The backport includes the upstream tests and a skip-after-unpack
regression test.

The tarball's existing msgpack/_cmsgpack.c is regenerated during
configure from the patched Cython source. The cython class supplies the
native build dependency, so the patch contains only handwritten changes.

Wrynose provides Cython 3.2.4; the tarball C was generated with 3.1.4.
Upstream requirements.txt pins Cython 3.2.5 and adds pytest; this file
is absent from the 1.1.2 tarball. Yocto supplies these tools through
recipe and ptest metadata. Cython is a build-host dependency. The
package version and source checksum are unchanged.

[1] https://github.com/msgpack/msgpack-python/commit/2c56ddb5d0025ed481d962c0f5d62d19dec7476d
[2] https://github.com/msgpack/msgpack-python/security/advisories/GHSA-6v7p-g79w-8964
[3] https://github.com/msgpack/msgpack-python/commit/620b0eb4c89cd72d4098564537624d9dbb2ce141

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../python3-msgpack/CVE-2026-57585.patch      | 267 ++++++++++++++++++
 .../python/python3-msgpack_1.1.2.bb           |   9 +-
 2 files changed, 275 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-msgpack/CVE-2026-57585.patch

diff --git a/meta-python/recipes-devtools/python/python3-msgpack/CVE-2026-57585.patch b/meta-python/recipes-devtools/python/python3-msgpack/CVE-2026-57585.patch
new file mode 100644
index 0000000000..dc813572bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-msgpack/CVE-2026-57585.patch
@@ -0,0 +1,267 @@
+From 815dd23f321ae208b6cde5cc01a86571836fc9dd Mon Sep 17 00:00:00 2001
+From: Inada Naoki <songofacandy@gmail.com>
+Date: Fri, 19 Jun 2026 00:13:13 +0900
+Subject: [PATCH] Merge commit from fork
+
+* fix Unpacker crash after unpack failure.
+
+* fixup
+
+CVE: CVE-2026-57585
+Upstream-Status: Backport [https://github.com/msgpack/msgpack-python/commit/2c56ddb5d0025ed481d962c0f5d62d19dec7476d]
+
+Backport Changes:
+- The 1.1.2 unpack_clear() predates nested-frame cleanup from commit
+  4a077456754a060d2bb14578e03bcb1153d952cc, so the original hunk cannot
+  apply. The final upstream implementation supplies the cleanup needed
+  by this fix; the prerequisite's destructor and leak-test changes are
+  not required.
+- The regression tests use the 1.1.2 exception-test context because the
+  later surrounding tests are absent. Upstream assertions are unchanged.
+- The tarball ships msgpack/_cmsgpack.c, which setup.py compiles
+  directly. The recipe regenerates it from the patched Cython source
+  during do_configure, so the patch contains no generated C changes.
+- New container slots are initialized using the ownership rule from
+  620b0eb4c89cd72d4098564537624d9dbb2ce141. This prevents skip-error
+  cleanup from using stale references left by an earlier unpack. A
+  regression test covers this sequence.
+- The map-item ownership transfer and callback contract from the same
+  commit prevent cleanup of a key released during string interning. Key
+  and value slots are cleared before the callback, which consumes both
+  references on success and failure. The remaining result, mode and
+  destructor changes are not required by this backport.
+- requirements.txt is absent from the 1.1.2 sdist. Its upstream changes
+  pin Cython 3.2.5 and add pytest; Yocto supplies native Cython 3.2.4
+  and ptest pytest through recipe metadata.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ msgpack/_unpacker.pyx     |  8 ++++++--
+ msgpack/unpack.h          | 17 +++++++++--------
+ msgpack/unpack_template.h | 38 +++++++++++++++++++++++++++++++++-----
+ test/test_except.py       | 38 ++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 86 insertions(+), 15 deletions(-)
+
+diff --git a/msgpack/_unpacker.pyx b/msgpack/_unpacker.pyx
+index 34ff330..ba17be2 100644
+--- a/msgpack/_unpacker.pyx
++++ b/msgpack/_unpacker.pyx
+@@ -53,6 +53,7 @@ cdef extern from "unpack.h":
+     execute_fn unpack_skip
+     execute_fn read_array_header
+     execute_fn read_map_header
++
+     void unpack_init(unpack_context* ctx)
+     object unpack_data(unpack_context* ctx)
+     void unpack_clear(unpack_context* ctx)
+@@ -200,6 +201,7 @@ def unpackb(object packed, *, object object_hook=None, object list_hook=None,
+         if off < buf_len:
+             raise ExtraData(obj, PyBytes_FromStringAndSize(buf+off, buf_len-off))
+         return obj
++
+     unpack_clear(&ctx)
+     if ret == 0:
+         raise ValueError("Unpack failed: incomplete input")
+@@ -469,7 +471,7 @@ cdef class Unpacker:
+                 obj = unpack_data(&self.ctx)
+                 unpack_init(&self.ctx)
+                 return obj
+-            elif ret == 0:
++            if ret == 0:
+                 if self.file_like is not None:
+                     self.read_from_file()
+                     continue
+@@ -477,7 +479,9 @@ cdef class Unpacker:
+                     raise StopIteration("No more data to unpack.")
+                 else:
+                     raise OutOfData("No more data to unpack.")
+-            elif ret == -2:
++
++            unpack_clear(&self.ctx)
++            if ret == -2:
+                 raise FormatError
+             elif ret == -3:
+                 raise StackError
+diff --git a/msgpack/unpack.h b/msgpack/unpack.h
+index 58a2f4f..b81f2d4 100644
+--- a/msgpack/unpack.h
++++ b/msgpack/unpack.h
+@@ -190,10 +190,13 @@ static inline int unpack_callback_map(unpack_user* u, unsigned int n, msgpack_un
+     return 0;
+ }
+ 
++/* Consumes k and v on both success and failure; borrows the container. */
+ static inline int unpack_callback_map_item(unpack_user* u, unsigned int current, msgpack_unpack_object* c, msgpack_unpack_object k, msgpack_unpack_object v)
+ {
+     if (u->strict_map_key && !PyUnicode_CheckExact(k) && !PyBytes_CheckExact(k)) {
+         PyErr_Format(PyExc_ValueError, "%.100s is not allowed for map key when strict_map_key=True", Py_TYPE(k)->tp_name);
++        Py_DECREF(k);
++        Py_DECREF(v);
+         return -1;
+     }
+     if (PyUnicode_CheckExact(k)) {
+@@ -201,19 +204,17 @@ static inline int unpack_callback_map_item(unpack_user* u, unsigned int current,
+     }
+     if (u->has_pairs_hook) {
+         msgpack_unpack_object item = PyTuple_Pack(2, k, v);
+-        if (!item)
+-            return -1;
+         Py_DECREF(k);
+         Py_DECREF(v);
++        if (!item)
++            return -1;
+         PyList_SET_ITEM(*c, current, item);
+         return 0;
+     }
+-    else if (PyDict_SetItem(*c, k, v) == 0) {
+-        Py_DECREF(k);
+-        Py_DECREF(v);
+-        return 0;
+-    }
+-    return -1;
++    int ret = PyDict_SetItem(*c, k, v);
++    Py_DECREF(k);
++    Py_DECREF(v);
++    return ret;
+ }
+ 
+ static inline int unpack_callback_map_end(unpack_user* u, msgpack_unpack_object* c)
+diff --git a/msgpack/unpack_template.h b/msgpack/unpack_template.h
+index cce29e7..2c07ae2 100644
+--- a/msgpack/unpack_template.h
++++ b/msgpack/unpack_template.h
+@@ -44,6 +44,13 @@ struct unpack_context {
+ };
+ 
+ 
++static inline PyObject* unpack_take_ref(PyObject** slot)
++{
++    PyObject* obj = *slot;
++    *slot = NULL;
++    return obj;
++}
++
+ static inline void unpack_init(unpack_context* ctx)
+ {
+     ctx->cs = CS_HEADER;
+@@ -72,7 +79,14 @@ static inline PyObject* unpack_data(unpack_context* ctx)
+ 
+ static inline void unpack_clear(unpack_context *ctx)
+ {
+-    Py_CLEAR(ctx->stack[0].obj);
++    for (unsigned int i = 0; i < ctx->top; i++) {
++        /* map_key holds a live reference only while waiting for the value */
++        if (ctx->stack[i].ct == CT_MAP_VALUE) {
++            Py_CLEAR(ctx->stack[i].map_key);
++        }
++        Py_CLEAR(ctx->stack[i].obj);
++    }
++    unpack_init(ctx);
+ }
+ 
+ static inline int unpack_execute(bool construct, unpack_context* ctx, const char* data, Py_ssize_t len, Py_ssize_t* off)
+@@ -123,6 +137,7 @@ static inline int unpack_execute(bool construct, unpack_context* ctx, const char
+ 
+ #define start_container(func, count_, ct_) \
+     if(top >= MSGPACK_EMBED_STACK_SIZE) { ret = -3; goto _end; } \
++    stack[top].obj = NULL; \
+     if(construct_cb(func)(user, count_, &stack[top].obj) < 0) { goto _failed; } \
+     if((count_) == 0) { obj = stack[top].obj; \
+         if (construct_cb(func##_end)(user, &obj) < 0) { goto _failed; } \
+@@ -192,7 +207,7 @@ static inline int unpack_execute(bool construct, unpack_context* ctx, const char
+                 case 0xd5:  // fixext 2
+                 case 0xd6:  // fixext 4
+                 case 0xd7:  // fixext 8
+-                    again_fixed_trail_if_zero(ACS_EXT_VALUE, 
++                    again_fixed_trail_if_zero(ACS_EXT_VALUE,
+                                               (1 << (((unsigned int)*p) & 0x03))+1,
+                                               _ext_zero);
+                 case 0xd8:  // fixext 16
+@@ -335,7 +350,12 @@ _push:
+         c->ct = CT_MAP_VALUE;
+         goto _header_again;
+     case CT_MAP_VALUE:
+-        if(construct_cb(_map_item)(user, c->count, &c->obj, c->map_key, obj) < 0) { goto _failed; }
++        if (construct) {
++            if (unpack_callback_map_item(user, c->count, &c->obj,
++                                        unpack_take_ref(&c->map_key),
++                                        unpack_take_ref(&obj)) < 0) { goto _failed; }
++        }
++        c->map_key = NULL;
+         if(++c->count == c->size) {
+             obj = c->obj;
+             if (construct_cb(_map_end)(user, &obj) < 0) { goto _failed; }
+@@ -398,10 +418,18 @@ _end:
+ #undef start_container
+ 
+ static int unpack_construct(unpack_context *ctx, const char *data, Py_ssize_t len, Py_ssize_t *off) {
+-    return unpack_execute(1, ctx, data, len, off);
++    int ret = unpack_execute(1, ctx, data, len, off);
++    if (ret == -1) {
++        unpack_clear(ctx);
++    }
++    return ret;
+ }
+ static int unpack_skip(unpack_context *ctx, const char *data, Py_ssize_t len, Py_ssize_t *off) {
+-    return unpack_execute(0, ctx, data, len, off);
++    int ret = unpack_execute(0, ctx, data, len, off);
++    if (ret == -1) {
++        unpack_clear(ctx);
++    }
++    return ret;
+ }
+ 
+ #define unpack_container_header read_array_header
+diff --git a/test/test_except.py b/test/test_except.py
+index b77ac80..3e8da42 100644
+--- a/test/test_except.py
++++ b/test/test_except.py
+@@ -31,6 +31,22 @@ def test_raise_from_object_hook():
+         object_pairs_hook=hook,
+     )
+ 
++    up = Unpacker(object_hook=hook)
++
++    def up_unpack(x):
++        up.feed(x)
++        return up.unpack()
++
++    raises(DummyException, up_unpack, packb({}))
++    raises(DummyException, up_unpack, packb({"fizz": "buzz"}))
++    raises(DummyException, up_unpack, packb({"fizz": "buzz"}))
++    raises(DummyException, up_unpack, packb({"fizz": {"buzz": "spam"}}))
++    raises(
++        DummyException,
++        up_unpack,
++        packb({"fizz": {"buzz": "spam"}}),
++    )
++
+ 
+ def test_invalidvalue():
+     incomplete = b"\xd9\x97#DL_"  # raw8 - length=0x97
+@@ -61,3 +77,25 @@ def test_strict_map_key():
+     packed = packb(invalid, use_bin_type=True)
+     with raises(ValueError):
+         unpackb(packed, raw=False, strict_map_key=True)
++
++
++def test_unpacker_should_not_crash_after_exception():
++    up = Unpacker()  # default: strict_map_key=True
++    up.feed(b"\x83\x73\xc4\x00")  # fixmap(3): int key (rejected) + empty bin8
++    try:
++        up.unpack()  # ValueError: int is not allowed for map key ...
++    except Exception:
++        pass
++    up.skip()  # SIGSEGV (resumes from a corrupt parser context)
++
++
++
++def test_skip_after_prior_container():
++    up = Unpacker(raw=False)
++    up.feed(packb([["cached-value"]]))
++    value = up.unpack()
++    assert value == [["cached-value"]]
++    del value
++    up.feed(b"\x91\x91\xc1")
++    with raises(FormatError):
++        up.skip()
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
index 5b201a7554..94338c2216 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.1.2.bb
@@ -2,12 +2,19 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_setuptools_build_meta ptest-python-pytest cython
 
 PTEST_PYTEST_DIR = "test"
 
+SRC_URI += "file://CVE-2026-57585.patch"
 SRC_URI[sha256sum] = "3b60763c1373dd60f398488069bcdc703cd08a711477b5d480eecc9f9626f47e"
 
+# Regenerate the sdist's C from the patched Cython source.
+do_configure:prepend() {
+    cd ${S}
+    cython3 msgpack/_cmsgpack.pyx
+}
+
 RDEPENDS:${PN}:append:class-target = " \
     python3-io \
 "
-- 
2.35.6

