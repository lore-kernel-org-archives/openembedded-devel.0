Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF23E9126F
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15250.1770274798581824381
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 22:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lGxEAO0k;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so3805785e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 22:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274797; x=1770879597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2+C6zwyodrxBdy2Xl2uGBaECyGcEh3zttQeD+ZzGOU=;
        b=lGxEAO0kFl3pvCz2EbuPAUVoLytWNwTQzZdKHxW+tfVq2jjjC0cW/psk3xsJA18jgf
         TulSfBq/lGBmwqSrO9XUVRW2Vp3keLm3nCEs5+o+vK/KtpFlf4zY/xXv31bMajnlc1/s
         929xI75E3irR6UXBOBr9l4XxgwVABy+aFMyuFSV9Nn8kS3agQ/ngfCap3iIPtp8kvBZB
         iWHPLf3FnFNgQxTXhV6cPB4EgkTF6KpnxvOYXkgEaF73F+5SATxJMCe2RhmnnjAN7ZPj
         MM0AoTP6jIp6wUg3zCfppvl65TAXIGdwzpyQHJ4G9GFgxngJNSvgPwj0jT/2iTigLP5E
         pltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274797; x=1770879597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2+C6zwyodrxBdy2Xl2uGBaECyGcEh3zttQeD+ZzGOU=;
        b=kSY4xCgeKJoSdfF6zOsI4RNn1l+Gke6qJUH8/SRGaSIQiX3BWaZ93h3uoQWu9bT+vv
         jnye4Fg2ywOOEVcEyqTXlNva0xJTDqu39Md5rNWLSeTpY4aW6Khb8MAmISQOr8tcgLQi
         5SX7F1eRj5LxV/Xws+Rm3uWUXb/c9Zx3H2t/DMZkGaH/Z/4DrbYcsLEgj/MPJZGL/0qW
         8LFReIufyvIRBgD3ct5ZzFJ6CyZf1uqVELapjcYxOJCNiUEowabhSKoepiZ9Mhjy4AS2
         be2p57pvxaZgkp5hUpjrZ80SW9uUqJR3H/x2cw8imngTAsEiOUe4gd4sPMmaqDy3vDZ3
         OF1Q==
X-Gm-Message-State: AOJu0YwL30/UC8dF5DzwUlGJgNzz/lyN+u3uvP+aXQD4GLMAUS1qNCOg
	s38cLV3kll7ZDAeKkvenU3CdtSlq76Sn9EAcdKr52/SzY841r+tDjhPOf4xb7w==
X-Gm-Gg: AZuq6aKo5K2cLqPYN3GnufhpKVEnKLkIrUGmSpzqybaWZzd58s46BXkqmxwFwO1Edr6
	Q8a2KI9QsJCGBKZXGVMf1/hY+9hfjFHvnJS+95Hh0if/TaST8BsQJNlA3NmNYLffGh+Oj4cq+b5
	/L7JEbTbWMPfdSmK5eBbCuS1jsRgI/+mApMYmLgZMtErKs7UxkYDfh55W88zGq2kiTGzz8G0KoE
	hyix5yMmgq33guTPfBbFjDxeccNPWwq/rG2zGQ9clRCQkNgW9l3Oo95rXt0W+MfTauxdw+kj1o5
	j8FRKGWb0Il1KJitahI4OBNATUoVzo6ofgGCFhOq6c+2J/1IFdgd2s1dlqK4oRe1CIpWWFtBRZB
	ZtJl12OEe2NWvlVxIeNitCLvnq1/31BZj43e3nSRc4+2RnYyF9rurtjR8mz7pL20CJepcCXBTmU
	7PLKBh62Tw
X-Received: by 2002:a05:600c:8b8a:b0:480:68ed:1e70 with SMTP id 5b1f17b1804b1-4830e99d515mr68320585e9.35.1770274796501;
        Wed, 04 Feb 2026 22:59:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.22.59.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 22:59:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 01/20] python3-cbor2: patch CVE-2025-68131
Date: Thu,  5 Feb 2026 07:59:36 +0100
Message-ID: <20260205065955.1267785-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124177

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68131

The NVD report mentions a PR as the solution, however
in the discussion of that PR it turned out that this
is incorrect, and another patch is the solution. That
patch was picked.

Ptests passed successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-cbor2/CVE-2025-68131.patch | 515 ++++++++++++++++++
 .../python/python3-cbor2_5.7.1.bb             |   1 +
 2 files changed, 516 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
new file mode 100644
index 0000000000..bf6819eebe
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
@@ -0,0 +1,515 @@
+From 60b74e9842e83318efccf0f4eed6a94a07ac5677 Mon Sep 17 00:00:00 2001
+From: Andreas Eriksen <andreer@vespa.ai>
+Date: Thu, 18 Dec 2025 16:48:26 +0100
+Subject: [PATCH] Merge commit from fork
+
+* track depth of recursive encode/decode, clear shared refs on start
+
+* test that shared refs are cleared on start
+
+* add fix-shared-state-reset to version history
+
+* clear shared state _after_ encode/decode
+
+* use PY_SSIZE_T_MAX to clear shareables list
+
+* use context manager for python decoder depth tracking
+
+* use context manager for python encoder depth tracking
+
+CVE: CVE-2025-68131
+Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/f1d701cd2c411ee40bb1fe383afe7f365f35abf0]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ cbor2/_decoder.py       | 38 +++++++++++++++++-----
+ cbor2/_encoder.py       | 44 +++++++++++++++++++++-----
+ source/decoder.c        | 28 ++++++++++++++++-
+ source/decoder.h        |  1 +
+ source/encoder.c        | 23 ++++++++++++--
+ source/encoder.h        |  1 +
+ tests/test_decoder.py   | 62 ++++++++++++++++++++++++++++++++++++
+ tests/test_encoder.py   | 70 +++++++++++++++++++++++++++++++++++++++++
+ 8 files changed, 250 insertions(+), 17 deletions(-)
+
+diff --git a/cbor2/_decoder.py b/cbor2/_decoder.py
+index 42a9740..b552492 100644
+--- a/cbor2/_decoder.py
++++ b/cbor2/_decoder.py
+@@ -5,6 +5,7 @@ import struct
+ import sys
+ from codecs import getincrementaldecoder
+ from collections.abc import Callable, Mapping, Sequence
++from contextlib import contextmanager
+ from datetime import date, datetime, timedelta, timezone
+ from io import BytesIO
+ from typing import IO, TYPE_CHECKING, Any, TypeVar, cast, overload
+@@ -59,6 +60,7 @@ class CBORDecoder:
+         "_immutable",
+         "_str_errors",
+         "_stringref_namespace",
++        "_decode_depth",
+     )
+ 
+     _fp: IO[bytes]
+@@ -100,6 +102,7 @@ class CBORDecoder:
+         self._shareables: list[object] = []
+         self._stringref_namespace: list[str | bytes] | None = None
+         self._immutable = False
++        self._decode_depth = 0
+ 
+     @property
+     def immutable(self) -> bool:
+@@ -225,13 +228,33 @@ class CBORDecoder:
+             if unshared:
+                 self._share_index = old_index
+ 
++    @contextmanager
++    def _decoding_context(self):
++        """
++        Context manager for tracking decode depth and clearing shared state.
++
++        Shared state is cleared at the end of each top-level decode to prevent
++        shared references from leaking between independent decode operations.
++        Nested calls (from hooks) must preserve the state.
++        """
++        self._decode_depth += 1
++        try:
++            yield
++        finally:
++            self._decode_depth -= 1
++            assert self._decode_depth >= 0
++            if self._decode_depth == 0:
++                self._shareables.clear()
++                self._share_index = None
++
+     def decode(self) -> object:
+         """
+         Decode the next value from the stream.
+ 
+         :raises CBORDecodeError: if there is any problem decoding the stream
+         """
+-        return self._decode()
++        with self._decoding_context():
++            return self._decode()
+ 
+     def decode_from_bytes(self, buf: bytes) -> object:
+         """
+@@ -242,12 +265,13 @@ class CBORDecoder:
+         object needs to be decoded separately from the rest but while still
+         taking advantage of the shared value registry.
+         """
+-        with BytesIO(buf) as fp:
+-            old_fp = self.fp
+-            self.fp = fp
+-            retval = self._decode()
+-            self.fp = old_fp
+-            return retval
++        with self._decoding_context():
++            with BytesIO(buf) as fp:
++                old_fp = self.fp
++                self.fp = fp
++                retval = self._decode()
++                self.fp = old_fp
++                return retval
+ 
+     @overload
+     def _decode_length(self, subtype: int) -> int: ...
+diff --git a/cbor2/_encoder.py b/cbor2/_encoder.py
+index fe65763..5b9609c 100644
+--- a/cbor2/_encoder.py
++++ b/cbor2/_encoder.py
+@@ -124,6 +124,7 @@ class CBOREncoder:
+         "string_namespacing",
+         "_string_references",
+         "indefinite_containers",
++        "_encode_depth",
+     )
+ 
+     _fp: IO[bytes]
+@@ -188,6 +189,7 @@ class CBOREncoder:
+             int, tuple[object, int | None]
+         ] = {}  # indexes used for value sharing
+         self._string_references: dict[str | bytes, int] = {}  # indexes used for string references
++        self._encode_depth = 0
+         self._encoders = default_encoders.copy()
+         if canonical:
+             self._encoders.update(canonical_encoders)
+@@ -303,6 +305,24 @@ class CBOREncoder:
+         """
+         self._fp_write(data)
+ 
++    @contextmanager
++    def _encoding_context(self):
++        """
++        Context manager for tracking encode depth and clearing shared state.
++
++        Shared state is cleared at the end of each top-level encode to prevent
++        shared references from leaking between independent encode operations.
++        Nested calls (from hooks) must preserve the state.
++        """
++        self._encode_depth += 1
++        try:
++            yield
++        finally:
++            self._encode_depth -= 1
++            if self._encode_depth == 0:
++                self._shared_containers.clear()
++                self._string_references.clear()
++
+     def encode(self, obj: Any) -> None:
+         """
+         Encode the given object using CBOR.
+@@ -310,6 +330,16 @@ class CBOREncoder:
+         :param obj:
+             the object to encode
+         """
++        with self._encoding_context():
++            self._encode_value(obj)
++
++    def _encode_value(self, obj: Any) -> None:
++        """
++        Internal fast path for encoding - used by built-in encoders.
++
++        External code should use encode() instead, which properly manages
++        shared state between independent encode operations.
++        """
+         obj_type = obj.__class__
+         encoder = self._encoders.get(obj_type) or self._find_encoder(obj_type) or self._default
+         if not encoder:
+@@ -459,7 +489,7 @@ class CBOREncoder:
+     def encode_array(self, value: Sequence[Any]) -> None:
+         self.encode_length(4, len(value) if not self.indefinite_containers else None)
+         for item in value:
+-            self.encode(item)
++            self._encode_value(item)
+ 
+         if self.indefinite_containers:
+             self.encode_break()
+@@ -468,8 +498,8 @@ class CBOREncoder:
+     def encode_map(self, value: Mapping[Any, Any]) -> None:
+         self.encode_length(5, len(value) if not self.indefinite_containers else None)
+         for key, val in value.items():
+-            self.encode(key)
+-            self.encode(val)
++            self._encode_value(key)
++            self._encode_value(val)
+ 
+         if self.indefinite_containers:
+             self.encode_break()
+@@ -494,10 +524,10 @@ class CBOREncoder:
+                 # String referencing requires that the order encoded is
+                 # the same as the order emitted so string references are
+                 # generated after an order is determined
+-                self.encode(realkey)
++                self._encode_value(realkey)
+             else:
+                 self._fp_write(sortkey[1])
+-            self.encode(value)
++            self._encode_value(value)
+ 
+         if self.indefinite_containers:
+             self.encode_break()
+@@ -511,7 +541,7 @@ class CBOREncoder:
+             self._string_references = {}
+ 
+         self.encode_length(6, value.tag)
+-        self.encode(value.value)
++        self._encode_value(value.value)
+ 
+         self.string_referencing = old_string_referencing
+         self._string_references = old_string_references
+@@ -574,7 +604,7 @@ class CBOREncoder:
+     def encode_stringref(self, value: str | bytes) -> None:
+         # Semantic tag 25
+         if not self._stringref(value):
+-            self.encode(value)
++            self._encode_value(value)
+ 
+     def encode_rational(self, value: Fraction) -> None:
+         # Semantic tag 30
+diff --git a/source/decoder.c b/source/decoder.c
+index 8b6b842..b0bdb9a 100644
+--- a/source/decoder.c
++++ b/source/decoder.c
+@@ -143,6 +143,7 @@ CBORDecoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+         self->str_errors = PyBytes_FromString("strict");
+         self->immutable = false;
+         self->shared_index = -1;
++        self->decode_depth = 0;
+     }
+     return (PyObject *) self;
+ error:
+@@ -2083,11 +2084,30 @@ decode(CBORDecoderObject *self, DecodeOptions options)
+ }
+ 
+ 
++// Reset shared state at the end of each top-level decode to prevent
++// shared references from leaking between independent decode operations.
++// Nested calls (from hooks) must preserve the state.
++static inline void
++clear_shareable_state(CBORDecoderObject *self)
++{
++    PyList_SetSlice(self->shareables, 0, PY_SSIZE_T_MAX, NULL);
++    self->shared_index = -1;
++}
++
++
+ // CBORDecoder.decode(self) -> obj
+ PyObject *
+ CBORDecoder_decode(CBORDecoderObject *self)
+ {
+-    return decode(self, DECODE_NORMAL);
++    PyObject *ret;
++    self->decode_depth++;
++    ret = decode(self, DECODE_NORMAL);
++    self->decode_depth--;
++    assert(self->decode_depth >= 0);
++    if (self->decode_depth == 0) {
++        clear_shareable_state(self);
++    }
++    return ret;
+ }
+ 
+ 
+@@ -2100,6 +2120,7 @@ CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
+     if (!_CBOR2_BytesIO && _CBOR2_init_BytesIO() == -1)
+         return NULL;
+ 
++    self->decode_depth++;
+     save_read = self->read;
+     buf = PyObject_CallFunctionObjArgs(_CBOR2_BytesIO, data, NULL);
+     if (buf) {
+@@ -2111,6 +2132,11 @@ CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
+         Py_DECREF(buf);
+     }
+     self->read = save_read;
++    self->decode_depth--;
++    assert(self->decode_depth >= 0);
++    if (self->decode_depth == 0) {
++        clear_shareable_state(self);
++    }
+     return ret;
+ }
+ 
+diff --git a/source/decoder.h b/source/decoder.h
+index 6bb6d52..a2f1bcb 100644
+--- a/source/decoder.h
++++ b/source/decoder.h
+@@ -13,6 +13,7 @@ typedef struct {
+     PyObject *str_errors;
+     bool immutable;
+     Py_ssize_t shared_index;
++    Py_ssize_t decode_depth;
+ } CBORDecoderObject;
+ 
+ extern PyTypeObject CBORDecoderType;
+diff --git a/source/encoder.c b/source/encoder.c
+index 4dc3c6b..e87670d 100644
+--- a/source/encoder.c
++++ b/source/encoder.c
+@@ -114,6 +114,7 @@ CBOREncoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+         self->string_referencing = false;
+         self->string_namespacing = false;
+         self->indefinite_containers = false;
++        self->encode_depth = 0;
+     }
+     return (PyObject *) self;
+ }
+@@ -2132,17 +2133,35 @@ encode(CBOREncoderObject *self, PyObject *value)
+ }
+ 
+ 
++// Reset shared state at the end of each top-level encode to prevent
++// shared references from leaking between independent encode operations.
++// Nested calls (from hooks or recursive encoding) must preserve the state.
++static inline void
++clear_shared_state(CBOREncoderObject *self)
++{
++    PyDict_Clear(self->shared);
++    PyDict_Clear(self->string_references);
++}
++
++
+ // CBOREncoder.encode(self, value)
+ PyObject *
+ CBOREncoder_encode(CBOREncoderObject *self, PyObject *value)
+ {
+     PyObject *ret;
+ 
+-    // TODO reset shared dict?
+-    if (Py_EnterRecursiveCall(" in CBOREncoder.encode"))
++    self->encode_depth++;
++    if (Py_EnterRecursiveCall(" in CBOREncoder.encode")) {
++        self->encode_depth--;
+         return NULL;
++    }
+     ret = encode(self, value);
+     Py_LeaveRecursiveCall();
++    self->encode_depth--;
++    assert(self->encode_depth >= 0);
++    if (self->encode_depth == 0) {
++        clear_shared_state(self);
++    }
+     return ret;
+ }
+ 
+diff --git a/source/encoder.h b/source/encoder.h
+index abc6560..915f1f2 100644
+--- a/source/encoder.h
++++ b/source/encoder.h
+@@ -25,6 +25,7 @@ typedef struct {
+     bool string_referencing;
+     bool string_namespacing;
+     bool indefinite_containers;
++    Py_ssize_t encode_depth;
+ } CBOREncoderObject;
+ 
+ extern PyTypeObject CBOREncoderType;
+diff --git a/tests/test_decoder.py b/tests/test_decoder.py
+index 0f4af4d..c8b47d5 100644
+--- a/tests/test_decoder.py
++++ b/tests/test_decoder.py
+@@ -1022,3 +1022,65 @@ def test_oversized_read(impl, payload: bytes, tmp_path: Path) -> None:
+         dummy_path.write_bytes(payload)
+         with dummy_path.open("rb") as f:
+             impl.load(f)
++
++
++class TestDecoderReuse:
++    """
++    Tests for correct behavior when reusing CBORDecoder instances.
++    """
++
++    def test_decoder_reuse_resets_shared_refs(self, impl):
++        """
++        Shared references should be scoped to a single decode operation,
++        not persist across multiple decodes on the same decoder instance.
++        """
++        # Message with shareable tag (28)
++        msg1 = impl.dumps(impl.CBORTag(28, "first_value"))
++
++        # Message with sharedref tag (29) referencing index 0
++        msg2 = impl.dumps(impl.CBORTag(29, 0))
++
++        # Reuse decoder across messages
++        decoder = impl.CBORDecoder(BytesIO(msg1))
++        result1 = decoder.decode()
++        assert result1 == "first_value"
++
++        # Second decode should fail - sharedref(0) doesn't exist in this context
++        decoder.fp = BytesIO(msg2)
++        with pytest.raises(impl.CBORDecodeValueError, match="shared reference"):
++            decoder.decode()
++
++    def test_decode_from_bytes_resets_shared_refs(self, impl):
++        """
++        decode_from_bytes should also reset shared references between calls.
++        """
++        msg1 = impl.dumps(impl.CBORTag(28, "value"))
++        msg2 = impl.dumps(impl.CBORTag(29, 0))
++
++        decoder = impl.CBORDecoder(BytesIO(b""))
++        decoder.decode_from_bytes(msg1)
++
++        with pytest.raises(impl.CBORDecodeValueError, match="shared reference"):
++            decoder.decode_from_bytes(msg2)
++
++    def test_shared_refs_within_single_decode(self, impl):
++        """
++        Shared references must work correctly within a single decode operation.
++
++        Note: This tests non-cyclic sibling references [shareable(x), sharedref(0)],
++        which is a different pattern from test_cyclic_array/test_cyclic_map that
++        test self-referencing structures like shareable([sharedref(0)]).
++        """
++        # [shareable("hello"), sharedref(0)] -> ["hello", "hello"]
++        data = unhexlify(
++            "82"  # array(2)
++            "d81c"  # tag(28) shareable
++            "65"  # text(5)
++            "68656c6c6f"  # "hello"
++            "d81d"  # tag(29) sharedref
++            "00"  # unsigned(0)
++        )
++
++        result = impl.loads(data)
++        assert result == ["hello", "hello"]
++        assert result[0] is result[1]  # Same object reference
+diff --git a/tests/test_encoder.py b/tests/test_encoder.py
+index cbb4295..e6adc08 100644
+--- a/tests/test_encoder.py
++++ b/tests/test_encoder.py
+@@ -717,3 +717,73 @@ def test_indefinite_containers(impl):
+     expected = b"\xbf\xff"
+     assert impl.dumps({}, indefinite_containers=True) == expected
+     assert impl.dumps({}, indefinite_containers=True, canonical=True) == expected
++
++
++class TestEncoderReuse:
++    """
++    Tests for correct behavior when reusing CBOREncoder instances.
++    """
++
++    def test_encoder_reuse_resets_shared_containers(self, impl):
++        """
++        Shared container tracking should be scoped to a single encode operation,
++        not persist across multiple encodes on the same encoder instance.
++        """
++        fp = BytesIO()
++        encoder = impl.CBOREncoder(fp, value_sharing=True)
++        shared_obj = ["hello"]
++
++        # First encode: object is tracked in shared containers
++        encoder.encode([shared_obj, shared_obj])
++
++        # Second encode on new fp: should produce valid standalone CBOR
++        # (not a sharedref pointing to stale first-encode data)
++        encoder.fp = BytesIO()
++        encoder.encode(shared_obj)
++        second_output = encoder.fp.getvalue()
++
++        # The second output must be decodable on its own
++        result = impl.loads(second_output)
++        assert result == ["hello"]
++
++    def test_encode_to_bytes_resets_shared_containers(self, impl):
++        """
++        encode_to_bytes should also reset shared container tracking between calls.
++        """
++        fp = BytesIO()
++        encoder = impl.CBOREncoder(fp, value_sharing=True)
++        shared_obj = ["hello"]
++
++        # First encode
++        encoder.encode_to_bytes([shared_obj, shared_obj])
++
++        # Second encode should produce valid standalone CBOR
++        result_bytes = encoder.encode_to_bytes(shared_obj)
++        result = impl.loads(result_bytes)
++        assert result == ["hello"]
++
++    def test_encoder_hook_does_not_reset_state(self, impl):
++        """
++        When a custom encoder hook calls encode(), the shared container
++        tracking should be preserved (not reset mid-operation).
++        """
++
++        class Custom:
++            def __init__(self, value):
++                self.value = value
++
++        def custom_encoder(encoder, obj):
++            # Hook encodes the wrapped value
++            encoder.encode(obj.value)
++
++        # Encode a Custom wrapping a list
++        data = impl.dumps(Custom(["a", "b"]), default=custom_encoder)
++
++        # Verify the output decodes correctly
++        result = impl.loads(data)
++        assert result == ["a", "b"]
++
++        # Test nested Custom objects - hook should work recursively
++        data2 = impl.dumps(Custom(Custom(["x"])), default=custom_encoder)
++        result2 = impl.loads(data2)
++        assert result2 == ["x"]
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
index e124207cbf..5aa5ba599f 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.7.1.bb
@@ -3,6 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
+SRC_URI += "file://CVE-2025-68131.patch"
 SRC_URI[sha256sum] = "7a405a1d7c8230ee9acf240aad48ae947ef584e8af05f169f3c1bde8f01f8b71"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest

