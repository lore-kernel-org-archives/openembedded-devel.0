Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2076FF60CF
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 06:15:31 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13916.1774937727785512819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 23:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cLnojOtJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aaed195901so22964695ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 23:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774937727; x=1775542527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dJQw02fP53BlVp0fTUlO+aFXvSSvScQb9DtavGbuU7Y=;
        b=cLnojOtJorpUM8t10uETfvEhq/KUwp5YuZx/DPs49ufWwbV3+ZPS4j8VXApe9Pxd5Q
         MHt0B0g66Tau+3IifNNX3PC7yBfwkak7Uaec3QWdL5kNnJmnj4CVLy3iwNy59ywos6rU
         Nc/MMiARLZrvTs5hiCUOfsrnfTnUNMAnN7M3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937727; x=1775542527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJQw02fP53BlVp0fTUlO+aFXvSSvScQb9DtavGbuU7Y=;
        b=QgH5K9deYbUYPHh/6CgbGo4DHlzGMWrRFWGmyQ/7d0+Ifslsb1KInZt6D2HU7MH9dy
         RXCSQu+6m8pkNcMc6xbg444cosNfKuUtRpCD0w5z+II9XVd+qVqN5yTfYqNYkkxy+sTh
         ldG5yLEImFCoX9JvfqBl2nGJTfKQN7I3467eUZ6zkwyo3v218hhXL38Zi+LWVfsluXEQ
         x2DZ5As0aeiTQRLPJIeb/XtLPFb8E4advj8bjndrhCMogfRsq+OvJl2or/t1XNsjUagt
         t8II46/SJDmiyTA3TF7eH6/FuyzZKg/pxmCyCv17tuGBbR3xw5zRLI6/ueVkkoJZ8CO6
         HgHw==
X-Gm-Message-State: AOJu0Yz2EuTXSfawkRqPBYVw0aMtxGFuBv4ayRMz0VHbIdOvnVjGdLby
	2RBkvMQDSZDDPlpN+7G6SaD3AC/j6G9S6ZySZIExSTUbBfc5H+GhwmED9L4YS+Y9ubt2WxAKn6e
	mumOtZmc=
X-Gm-Gg: ATEYQzw1YxMq6EkRn9DS92pbQXmSe2lSq7HuW6OSU8sptuxAii82hnOT2PzMpbdbD2x
	74oop0/23+mRG+capv8GSn6CvVKBpQpf6NF5iJ3wdPv8c6mwLrCVyeY86uxJkPpNfw8+nCx+Azw
	KXSjIaXNtnckjeuViKiQ33oV/bXsP8TH3lU7AY2ZMOJF5GWaURn4yEvY2pB+VHngiqBKYbq6Kp8
	F08EYQcaZWGO7yAh+UcjAI9MKxliCepnqFFdivkwAR3Ir0O+pSQKJoa6dEbiFQl0NeKIG3gC8CX
	y5tZzjqRMyWtD7HxxmUJBjFuIdDgGU73G/5GMTvhi9DfE7Jnfy3guIcq23Cg2cj6TUm2ws3fnhH
	2LxNE8fVP4IrjZSBi3OzWXL2zN4vPrraSlyD9coyB+DLlHvHR3Zv6gDEQw+Qu0xvjGXQi5YbbTP
	eN+kK67NT/swkc9U5ciOvKJT2cHb531edU5/g=
X-Received: by 2002:a17:902:f60a:b0:2b2:4e5c:69a9 with SMTP id d9443c01a7336-2b24e5c6d3emr78523565ad.5.1774937726237;
        Mon, 30 Mar 2026 23:15:26 -0700 (PDT)
Received: from MVIN00013.mvista.com ([43.249.234.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b02a11esm90754805ad.65.2026.03.30.23.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:15:25 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-python][scarthgap][PATCH] python3-cbor2: patch CVE-2026-26209
Date: Tue, 31 Mar 2026 11:45:06 +0530
Message-ID: <20260331061506.37634-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 06:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125877

Backport the patch[1] which fixes this vulnerability as mentioned in the
comment[3].

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-26209

[1] https://github.com/agronholm/cbor2/commit/e61a5f365ba610d5907a0ae1bc72769bba34294b
[2] https://github.com/agronholm/cbor2/commit/fb4ee1612a8a1ac0dbd8cf2f2f6f931a4e06d824 (pre patch)
[3] https://github.com/agronholm/cbor2/pull/275

Dropped changes to the changelog from the original commit.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../python3-cbor2/CVE-2026-26209-pre1.patch   | 469 ++++++++++++++++++
 .../python/python3-cbor2/CVE-2026-26209.patch | 415 ++++++++++++++++
 .../python/python3-cbor2_5.6.4.bb             |   2 +
 3 files changed, 886 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-pre1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209.patch

diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-pre1.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-pre1.patch
new file mode 100644
index 0000000000..3ff275c247
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-pre1.patch
@@ -0,0 +1,469 @@
+From fb4ee1612a8a1ac0dbd8cf2f2f6f931a4e06d824 Mon Sep 17 00:00:00 2001
+From: Andreas Eriksen <andreer@vespa.ai>
+Date: Mon, 29 Dec 2025 14:01:52 +0100
+Subject: [PATCH] Added a read-ahead buffer to the C decoder (#268)
+
+CVE: CVE-2026-26209
+Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/fb4ee1612a8a1ac0dbd8cf2f2f6f931a4e06d824]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ source/decoder.c      | 225 +++++++++++++++++++++++++++++++++---------
+ source/decoder.h      |   9 ++
+ tests/test_decoder.py |  85 +++++++++++++++-
+ 3 files changed, 274 insertions(+), 45 deletions(-)
+
+diff --git a/source/decoder.c b/source/decoder.c
+index 4f7ee5d..9cd1596 100644
+--- a/source/decoder.c
++++ b/source/decoder.c
+@@ -42,6 +42,7 @@ enum DecodeOption {
+ typedef uint8_t DecodeOptions;
+ 
+ static int _CBORDecoder_set_fp(CBORDecoderObject *, PyObject *, void *);
++static int _CBORDecoder_set_fp_with_read_size(CBORDecoderObject *, PyObject *, Py_ssize_t);
+ static int _CBORDecoder_set_tag_hook(CBORDecoderObject *, PyObject *, void *);
+ static int _CBORDecoder_set_object_hook(CBORDecoderObject *, PyObject *, void *);
+ static int _CBORDecoder_set_str_errors(CBORDecoderObject *, PyObject *, void *);
+@@ -101,6 +102,13 @@ CBORDecoder_clear(CBORDecoderObject *self)
+     Py_CLEAR(self->shareables);
+     Py_CLEAR(self->stringref_namespace);
+     Py_CLEAR(self->str_errors);
++    if (self->readahead) {
++        PyMem_Free(self->readahead);
++        self->readahead = NULL;
++        self->readahead_size = 0;
++    }
++    self->read_pos = 0;
++    self->read_len = 0;
+     return 0;
+ }
+ 
+@@ -143,6 +151,10 @@ CBORDecoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+         self->immutable = false;
+         self->shared_index = -1;
+         self->decode_depth = 0;
++        self->readahead = NULL;
++        self->readahead_size = 0;
++        self->read_pos = 0;
++        self->read_len = 0;
+     }
+     return (PyObject *) self;
+ error:
+@@ -152,21 +164,27 @@ error:
+ 
+ 
+ // CBORDecoder.__init__(self, fp=None, tag_hook=None, object_hook=None,
+-//                      str_errors='strict')
++//                      str_errors='strict', read_size=4096)
+ int
+ CBORDecoder_init(CBORDecoderObject *self, PyObject *args, PyObject *kwargs)
+ {
+     static char *keywords[] = {
+-        "fp", "tag_hook", "object_hook", "str_errors", NULL
++        "fp", "tag_hook", "object_hook", "str_errors", "read_size", NULL
+     };
+     PyObject *fp = NULL, *tag_hook = NULL, *object_hook = NULL,
+              *str_errors = NULL;
++    Py_ssize_t read_size = CBOR2_DEFAULT_READ_SIZE;
+ 
+-    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|OOO", keywords,
+-                &fp, &tag_hook, &object_hook, &str_errors))
++    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|OOOn", keywords,
++                &fp, &tag_hook, &object_hook, &str_errors, &read_size))
+         return -1;
+ 
+-    if (_CBORDecoder_set_fp(self, fp, NULL) == -1)
++    if (read_size < 1) {
++        PyErr_SetString(PyExc_ValueError, "read_size must be at least 1");
++        return -1;
++    }
++
++    if (_CBORDecoder_set_fp_with_read_size(self, fp, read_size) == -1)
+         return -1;
+     if (tag_hook && _CBORDecoder_set_tag_hook(self, tag_hook, NULL) == -1)
+         return -1;
+@@ -197,11 +215,12 @@ _CBORDecoder_get_fp(CBORDecoderObject *self, void *closure)
+ }
+ 
+ 
+-// CBORDecoder._set_fp(self, value)
++// Internal: set fp with configurable read size
+ static int
+-_CBORDecoder_set_fp(CBORDecoderObject *self, PyObject *value, void *closure)
++_CBORDecoder_set_fp_with_read_size(CBORDecoderObject *self, PyObject *value, Py_ssize_t read_size)
+ {
+     PyObject *tmp, *read;
++    char *new_buffer = NULL;
+ 
+     if (!value) {
+         PyErr_SetString(PyExc_AttributeError, "cannot delete fp attribute");
+@@ -214,13 +233,43 @@ _CBORDecoder_set_fp(CBORDecoderObject *self, PyObject *value, void *closure)
+         return -1;
+     }
+ 
++    if (self->readahead == NULL || self->readahead_size != read_size) {
++        new_buffer = (char *)PyMem_Malloc(read_size);
++        if (!new_buffer) {
++            Py_DECREF(read);
++            PyErr_NoMemory();
++            return -1;
++        }
++    }
++
+     // See notes in encoder.c / _CBOREncoder_set_fp
+     tmp = self->read;
+     self->read = read;
+     Py_DECREF(tmp);
++
++    self->read_pos = 0;
++    self->read_len = 0;
++
++    // Replace buffer (size changed or was NULL)
++    if (new_buffer) {
++        PyMem_Free(self->readahead);
++        self->readahead = new_buffer;
++        self->readahead_size = read_size;
++    }
++
+     return 0;
+ }
+ 
++// CBORDecoder._set_fp(self, value) - property setter uses default read size
++static int
++_CBORDecoder_set_fp(CBORDecoderObject *self, PyObject *value, void *closure)
++{
++    // Use existing readahead_size if already allocated, otherwise use default
++    Py_ssize_t read_size = (self->readahead_size > 0) ?
++                           self->readahead_size : CBOR2_DEFAULT_READ_SIZE;
++    return _CBORDecoder_set_fp_with_read_size(self, value, read_size);
++}
++
+ 
+ // CBORDecoder._get_tag_hook(self)
+ static PyObject *
+@@ -376,45 +425,93 @@ raise_from(PyObject *new_exc_type, const char *message) {
+     }
+ }
+ 
+-static PyObject *
+-fp_read_object(CBORDecoderObject *self, const Py_ssize_t size)
++// Read directly into caller's buffer (bypassing readahead buffer)
++static Py_ssize_t
++fp_read_bytes(CBORDecoderObject *self, char *buf, Py_ssize_t size)
+ {
+-    PyObject *ret = NULL;
+-    PyObject *obj, *size_obj;
+-    size_obj = PyLong_FromSsize_t(size);
+-    if (size_obj) {
+-        obj = PyObject_CallFunctionObjArgs(self->read, size_obj, NULL);
+-        Py_DECREF(size_obj);
+-        if (obj) {
+-            assert(PyBytes_CheckExact(obj));
+-            if (PyBytes_GET_SIZE(obj) == (Py_ssize_t) size) {
+-                ret = obj;
++    PyObject *size_obj = PyLong_FromSsize_t(size);
++    if (!size_obj)
++        return -1;
++
++    PyObject *obj = PyObject_CallFunctionObjArgs(self->read, size_obj, NULL);
++    Py_DECREF(size_obj);
++    if (!obj)
++        return -1;
++
++    assert(PyBytes_CheckExact(obj));
++    Py_ssize_t bytes_read = PyBytes_GET_SIZE(obj);
++    if (bytes_read > 0)
++        memcpy(buf, PyBytes_AS_STRING(obj), bytes_read);
++
++    Py_DECREF(obj);
++    return bytes_read;
++}
++
++// Read into caller's buffer using the readahead buffer
++static int
++fp_read(CBORDecoderObject *self, char *buf, const Py_ssize_t size)
++{
++    Py_ssize_t available, to_copy, remaining, total_copied;
++
++    remaining = size;
++    total_copied = 0;
++
++    while (remaining > 0) {
++        available = self->read_len - self->read_pos;
++
++        if (available > 0) {
++            // Copy from buffer
++            to_copy = (available < remaining) ? available : remaining;
++            memcpy(buf + total_copied, self->readahead + self->read_pos, to_copy);
++            self->read_pos += to_copy;
++            total_copied += to_copy;
++            remaining -= to_copy;
++        } else {
++            Py_ssize_t bytes_read;
++
++            if (remaining >= self->readahead_size) {
++                // Large remaining: read directly into destination, bypass buffer
++                bytes_read = fp_read_bytes(self, buf + total_copied, remaining);
++                if (bytes_read > 0) {
++                    total_copied += bytes_read;
++                    remaining -= bytes_read;
++                }
+             } else {
+-                PyErr_Format(
+-                    _CBOR2_CBORDecodeEOF,
+-                    "premature end of stream (expected to read %zd bytes, "
+-                    "got %zd instead)", size, PyBytes_GET_SIZE(obj));
+-                Py_DECREF(obj);
++                // Small remaining: refill buffer
++                self->read_pos = 0;
++                self->read_len = 0;
++                bytes_read = fp_read_bytes(self, self->readahead, self->readahead_size);
++                if (bytes_read > 0)
++                    self->read_len = bytes_read;
++            }
++
++            if (bytes_read <= 0) {
++                if (bytes_read == 0)
++                    PyErr_Format(
++                        _CBOR2_CBORDecodeEOF,
++                        "premature end of stream (expected to read %zd bytes, "
++                        "got %zd instead)", size, total_copied);
++                return -1;
+             }
+         }
+     }
+-    return ret;
+-}
+ 
++    return 0;
++}
+ 
+-static int
+-fp_read(CBORDecoderObject *self, char *buf, const Py_ssize_t size)
++// Read and return as PyBytes object
++static PyObject *
++fp_read_object(CBORDecoderObject *self, const Py_ssize_t size)
+ {
+-    int ret = -1;
+-    PyObject *obj = fp_read_object(self, size);
+-    if (obj) {
+-        char *data = PyBytes_AS_STRING(obj);
+-        if (data) {
+-            memcpy(buf, data, size);
+-            ret = 0;
+-        }
+-        Py_DECREF(obj);
++    PyObject *ret = PyBytes_FromStringAndSize(NULL, size);
++    if (!ret)
++        return NULL;
++
++    if (fp_read(self, PyBytes_AS_STRING(ret), size) == -1) {
++        Py_DECREF(ret);
++        return NULL;
+     }
++
+     return ret;
+ }
+ 
+@@ -2091,23 +2188,55 @@ static PyObject *
+ CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
+ {
+     PyObject *save_read, *buf, *ret = NULL;
++    bool is_nested = (self->decode_depth > 0);
++    Py_ssize_t save_read_pos = 0, save_read_len = 0;
++    char *save_buffer = NULL;
+ 
+     if (!_CBOR2_BytesIO && _CBOR2_init_BytesIO() == -1)
+         return NULL;
+ 
++    buf = PyObject_CallFunctionObjArgs(_CBOR2_BytesIO, data, NULL);
++    if (!buf)
++        return NULL;
++
+     self->decode_depth++;
+     save_read = self->read;
+-    buf = PyObject_CallFunctionObjArgs(_CBOR2_BytesIO, data, NULL);
+-    if (buf) {
+-        self->read = PyObject_GetAttr(buf, _CBOR2_str_read);
+-        if (self->read) {
+-            ret = decode(self, DECODE_NORMAL);
+-            Py_DECREF(self->read);
++    Py_INCREF(save_read);  // Keep alive while we use a different read method
++    save_read_pos = self->read_pos;
++    save_read_len = self->read_len;
++
++    // Save buffer pointer if nested
++    if (is_nested) {
++        save_buffer = self->readahead;
++        self->readahead = NULL;  // Prevent setter from freeing saved buffer
++    }
++
++    // Set up BytesIO decoder - setter handles buffer allocation
++    if (_CBORDecoder_set_fp_with_read_size(self, buf, self->readahead_size) == -1) {
++        if (is_nested) {
++            PyMem_Free(self->readahead);
++            self->readahead = save_buffer;
+         }
++        Py_DECREF(save_read);
+         Py_DECREF(buf);
++        self->decode_depth--;
++        return NULL;
+     }
+-    self->read = save_read;
++
++    ret = decode(self, DECODE_NORMAL);
++
++    Py_XDECREF(self->read);  // Decrement BytesIO read method
++    self->read = save_read;  // Restore saved read (already has correct refcount)
++    Py_DECREF(buf);
+     self->decode_depth--;
++
++    if (is_nested) {
++        PyMem_Free(self->readahead);
++        self->readahead = save_buffer;
++    }
++    self->read_pos = save_read_pos;
++    self->read_len = save_read_len;
++
+     assert(self->decode_depth >= 0);
+     if (self->decode_depth == 0) {
+         clear_shareable_state(self);
+@@ -2257,6 +2386,14 @@ PyDoc_STRVAR(CBORDecoder__doc__,
+ "    dictionary. This callback is invoked for each deserialized\n"
+ "    :class:`dict` object. The return value is substituted for the dict\n"
+ "    in the deserialized output.\n"
++":param read_size:\n"
++"    the size of the read buffer (default 4096). The decoder reads from\n"
++"    the stream in chunks of this size for performance. This means the\n"
++"    stream position may advance beyond the bytes actually decoded. For\n"
++"    large values (bytestrings, text strings), reads may be larger than\n"
++"    ``read_size``. Code that needs to read from the stream after\n"
++"    decoding should use :meth:`decode_from_bytes` instead, or set\n"
++"    ``read_size=1`` to disable buffering (at a performance cost).\n"
+ "\n"
+ ".. _CBOR: https://cbor.io/\n"
+ );
+diff --git a/source/decoder.h b/source/decoder.h
+index a2f1bcb..a2f4bf1 100644
+--- a/source/decoder.h
++++ b/source/decoder.h
+@@ -3,6 +3,9 @@
+ #include <stdbool.h>
+ #include <stdint.h>
+ 
++// Default readahead buffer size for streaming reads
++#define CBOR2_DEFAULT_READ_SIZE 4096
++
+ typedef struct {
+     PyObject_HEAD
+     PyObject *read;    // cached read() method of fp
+@@ -14,6 +17,12 @@ typedef struct {
+     bool immutable;
+     Py_ssize_t shared_index;
+     Py_ssize_t decode_depth;
++
++    // Readahead buffer for streaming
++    char *readahead;            // allocated buffer
++    Py_ssize_t readahead_size;  // size of allocated buffer
++    Py_ssize_t read_pos;        // current position in buffer
++    Py_ssize_t read_len;        // valid bytes in buffer
+ } CBORDecoderObject;
+ 
+ extern PyTypeObject CBORDecoderType;
+diff --git a/tests/test_decoder.py b/tests/test_decoder.py
+index 3b4455a..9bf5a10 100644
+--- a/tests/test_decoder.py
++++ b/tests/test_decoder.py
+@@ -1043,4 +1043,87 @@ class TestDecoderReuse:
+ 
+         result = impl.loads(data)
+         assert result == ["hello", "hello"]
+-        assert result[0] is result[1]  # Same object reference
+\ No newline at end of file
++        assert result[0] is result[1]  # Same object reference
++
++
++def test_decode_from_bytes_in_hook_preserves_buffer(impl):
++    """Test that calling decode_from_bytes from a hook preserves stream buffer state.
++    This is a documented use case from docs/customizing.rst where hooks decode
++    embedded CBOR data. Before the fix, the stream's readahead buffer would be
++    corrupted, causing subsequent reads to fail or return wrong data.
++    """
++
++    def tag_hook(decoder, tag):
++        if tag.tag == 999:
++            # Decode embedded CBOR (documented pattern)
++            return decoder.decode_from_bytes(tag.value)
++        return tag
++
++    # Test data: array with [tag(999, embedded_cbor), "after_hook", "final"]
++    # embedded_cbor encodes: [1, 2, 3]
++    data = unhexlify(
++        "83"  # array(3)
++        "d903e7"  # tag(999)
++        "44"  # bytes(4)
++        "83010203"  # embedded: array [1, 2, 3]
++        "6a"  # text(10)
++        "61667465725f686f6f6b"  # "after_hook"
++        "65"  # text(5)
++        "66696e616c"  # "final"
++    )
++
++    # Decode from stream (not bytes) to use readahead buffer
++    stream = BytesIO(data)
++    decoder = impl.CBORDecoder(stream, tag_hook=tag_hook)
++    result = decoder.decode()
++
++    # Verify all values decoded correctly
++    assert result == [[1, 2, 3], "after_hook", "final"]
++
++    # First element should be the decoded embedded CBOR
++    assert result[0] == [1, 2, 3]
++    # Second element should be "after_hook" (not corrupted)
++    assert result[1] == "after_hook"
++    # Third element should be "final"
++    assert result[2] == "final"
++
++
++def test_decode_from_bytes_deeply_nested_in_hook(impl):
++    """Test deeply nested decode_from_bytes calls preserve buffer state.
++    This tests tag(999, tag(888, tag(777, [1,2,3]))) where each tag value
++    is embedded CBOR that triggers the hook recursively.
++    Before the fix, even a single level would corrupt the buffer. With multiple
++    levels, the buffer would be completely corrupted, mixing data from different
++    BytesIO objects and the original stream.
++    """
++
++    def tag_hook(decoder, tag):
++        if tag.tag in [999, 888, 777]:
++            # Recursively decode embedded CBOR
++            return decoder.decode_from_bytes(tag.value)
++        return tag
++
++    # Test data: [tag(999, tag(888, tag(777, [1,2,3]))), "after", "final"]
++    # Each tag contains embedded CBOR
++    data = unhexlify(
++        "83"  # array(3)
++        "d903e7"  # tag(999)
++        "4c"  # bytes(12)
++        "d9037848d903094483010203"  # embedded: tag(888, tag(777, [1,2,3]))
++        "65"  # text(5)
++        "6166746572"  # "after"
++        "65"  # text(5)
++        "66696e616c"  # "final"
++    )
++
++    # Decode from stream to use readahead buffer
++    stream = BytesIO(data)
++    decoder = impl.CBORDecoder(stream, tag_hook=tag_hook)
++    result = decoder.decode()
++
++    # With the fix: all three levels of nesting work correctly
++    # Without the fix: buffer corruption at each level, test fails
++    assert result == [[1, 2, 3], "after", "final"]
++    assert result[0] == [1, 2, 3]
++    assert result[1] == "after"
++    assert result[2] == "final"
+-- 
+2.50.1
+
diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209.patch
new file mode 100644
index 0000000000..1a9c5a3995
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209.patch
@@ -0,0 +1,415 @@
+From e61a5f365ba610d5907a0ae1bc72769bba34294b Mon Sep 17 00:00:00 2001
+From: Andreas Eriksen <andreer@vespa.ai>
+Date: Sat, 28 Feb 2026 22:21:06 +0100
+Subject: [PATCH] Set default read_size to 1 for backwards compatibility (#275)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The buffered reads introduced in 5.8.0 could cause issues when code needs to access the stream position after decoding. This changes the default back to 1 (matching 5.7.1 behavior) while allowing users to opt-in to faster decoding by passing read_size=4096.
+
+Implementation details:
+- Use function pointer dispatch to eliminate runtime checks for read_size=1
+- Skip buffer allocation entirely for unbuffered path
+- Add read_size parameter to load() and loads() for API completeness
+
+CVE: CVE-2026-26209
+Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/e61a5f365ba610d5907a0ae1bc72769bba34294b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ cbor2/_decoder.py     | 33 ++++++++++++++++--
+ docs/usage.rst        | 11 ++++++
+ source/decoder.c      | 78 +++++++++++++++++++++++++++++--------------
+ source/decoder.h      | 16 +++++++--
+ tests/test_decoder.py | 15 +++++++++
+ 5 files changed, 123 insertions(+), 30 deletions(-)
+
+diff --git a/cbor2/_decoder.py b/cbor2/_decoder.py
+index 4aeadcf..5a1f65b 100644
+--- a/cbor2/_decoder.py
++++ b/cbor2/_decoder.py
+@@ -72,6 +72,7 @@ class CBORDecoder:
+         tag_hook: Callable[[CBORDecoder, CBORTag], Any] | None = None,
+         object_hook: Callable[[CBORDecoder, dict[Any, Any]], Any] | None = None,
+         str_errors: Literal["strict", "error", "replace"] = "strict",
++        read_size: int = 1,
+     ):
+         """
+         :param fp:
+@@ -90,6 +91,13 @@ class CBORDecoder:
+         :param str_errors:
+             determines how to handle unicode decoding errors (see the `Error Handlers`_
+             section in the standard library documentation for details)
++        :param read_size:
++            the minimum number of bytes to read at a time.
++            Setting this to a higher value like 4096 improves performance,
++            but is likely to read past the end of the CBOR value, advancing the stream
++            position beyond the decoded data. This only matters if you need to reuse the
++            stream after decoding.
++            Ignored in the pure Python implementation, but included for API compatibility.
+ 
+         .. _Error Handlers: https://docs.python.org/3/library/codecs.html#error-handlers
+ 
+@@ -813,6 +821,7 @@ def loads(
+     tag_hook: Callable[[CBORDecoder, CBORTag], Any] | None = None,
+     object_hook: Callable[[CBORDecoder, dict[Any, Any]], Any] | None = None,
+     str_errors: Literal["strict", "error", "replace"] = "strict",
++    read_size: int = 1,
+ ) -> Any:
+     """
+     Deserialize an object from a bytestring.
+@@ -831,6 +840,10 @@ def loads(
+     :param str_errors:
+         determines how to handle unicode decoding errors (see the `Error Handlers`_
+         section in the standard library documentation for details)
++    :param read_size:
++        the minimum number of bytes to read at a time.
++        Setting this to a higher value like 4096 improves performance.
++        Ignored in the pure Python implementation, but included for API compatibility.
+     :return:
+         the deserialized object
+ 
+@@ -839,7 +852,11 @@ def loads(
+     """
+     with BytesIO(s) as fp:
+         return CBORDecoder(
+-            fp, tag_hook=tag_hook, object_hook=object_hook, str_errors=str_errors
++            fp,
++            tag_hook=tag_hook,
++            object_hook=object_hook,
++            str_errors=str_errors,
++            read_size=read_size,
+         ).decode()
+ 
+ 
+@@ -848,6 +865,7 @@ def load(
+     tag_hook: Callable[[CBORDecoder, CBORTag], Any] | None = None,
+     object_hook: Callable[[CBORDecoder, dict[Any, Any]], Any] | None = None,
+     str_errors: Literal["strict", "error", "replace"] = "strict",
++    read_size: int = 1,
+ ) -> Any:
+     """
+     Deserialize an object from an open file.
+@@ -866,6 +884,13 @@ def load(
+     :param str_errors:
+         determines how to handle unicode decoding errors (see the `Error Handlers`_
+         section in the standard library documentation for details)
++    :param read_size:
++        the minimum number of bytes to read at a time.
++        Setting this to a higher value like 4096 improves performance,
++        but is likely to read past the end of the CBOR value, advancing the stream
++        position beyond the decoded data. This only matters if you need to reuse the
++        stream after decoding.
++        Ignored in the pure Python implementation, but included for API compatibility.
+     :return:
+         the deserialized object
+ 
+@@ -873,5 +898,9 @@ def load(
+ 
+     """
+     return CBORDecoder(
+-        fp, tag_hook=tag_hook, object_hook=object_hook, str_errors=str_errors
++        fp,
++        tag_hook=tag_hook,
++        object_hook=object_hook,
++        str_errors=str_errors,
++        read_size=read_size,
+     ).decode()
+diff --git a/docs/usage.rst b/docs/usage.rst
+index 797db59..6f53174 100644
+--- a/docs/usage.rst
++++ b/docs/usage.rst
+@@ -74,6 +74,17 @@ instead encodes a reference to the nth sufficiently long string already encoded.
+ .. warning:: Support for string referencing is rare in other CBOR implementations, so think carefully
+     whether you want to enable it.
+ 
++Performance tuning
++------------------
++
++By default, the decoder only reads the exact amount of bytes it needs. But this can negatively
++impact the performance due to the potentially large number of individual read operations.
++To make it faster, you can pass a different ``read_size`` parameter (say, 4096), to :func:`load`,
++:func:`loads` or :class:`CBORDecoder`.
++
++.. warning:: If the input stream contains data other than the CBOR stream, that data (or parts of)
++    may be lost.
++
+ Tag support
+ -----------
+ 
+diff --git a/source/decoder.c b/source/decoder.c
+index 9cd1596..f8adc93 100644
+--- a/source/decoder.c
++++ b/source/decoder.c
+@@ -47,6 +47,10 @@ static int _CBORDecoder_set_tag_hook(CBORDecoderObject *, PyObject *, void *);
+ static int _CBORDecoder_set_object_hook(CBORDecoderObject *, PyObject *, void *);
+ static int _CBORDecoder_set_str_errors(CBORDecoderObject *, PyObject *, void *);
+ 
++// Forward declarations for read dispatch functions
++static int fp_read_unbuffered(CBORDecoderObject *, char *, Py_ssize_t);
++static int fp_read_buffered(CBORDecoderObject *, char *, Py_ssize_t);
++
+ static PyObject * decode(CBORDecoderObject *, DecodeOptions);
+ static PyObject * decode_bytestring(CBORDecoderObject *, uint8_t);
+ static PyObject * decode_string(CBORDecoderObject *, uint8_t);
+@@ -155,6 +159,7 @@ CBORDecoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
+         self->readahead_size = 0;
+         self->read_pos = 0;
+         self->read_len = 0;
++        self->fp_read = fp_read_unbuffered;  // default, will be set properly in init
+     }
+     return (PyObject *) self;
+ error:
+@@ -164,7 +169,7 @@ error:
+ 
+ 
+ // CBORDecoder.__init__(self, fp=None, tag_hook=None, object_hook=None,
+-//                      str_errors='strict', read_size=4096)
++//                      str_errors='strict', read_size=1)
+ int
+ CBORDecoder_init(CBORDecoderObject *self, PyObject *args, PyObject *kwargs)
+ {
+@@ -233,7 +238,8 @@ _CBORDecoder_set_fp_with_read_size(CBORDecoderObject *self, PyObject *value, Py_
+         return -1;
+     }
+ 
+-    if (self->readahead == NULL || self->readahead_size != read_size) {
++    // Skip buffer allocation for read_size=1 (direct read path doesn't use buffer)
++    if (read_size > 1 && (self->readahead == NULL || self->readahead_size != read_size)) {
+         new_buffer = (char *)PyMem_Malloc(read_size);
+         if (!new_buffer) {
+             Py_DECREF(read);
+@@ -254,8 +260,15 @@ _CBORDecoder_set_fp_with_read_size(CBORDecoderObject *self, PyObject *value, Py_
+     if (new_buffer) {
+         PyMem_Free(self->readahead);
+         self->readahead = new_buffer;
+-        self->readahead_size = read_size;
++    } else if (read_size == 1 && self->readahead != NULL) {
++        // Free existing buffer when switching to direct read path (read_size=1)
++        PyMem_Free(self->readahead);
++        self->readahead = NULL;
+     }
++    self->readahead_size = read_size;
++
++    // Set read dispatch function - eliminates runtime check on every read
++    self->fp_read = (read_size == 1) ? fp_read_unbuffered : fp_read_buffered;
+ 
+     return 0;
+ }
+@@ -447,9 +460,25 @@ fp_read_bytes(CBORDecoderObject *self, char *buf, Py_ssize_t size)
+     return bytes_read;
+ }
+ 
+-// Read into caller's buffer using the readahead buffer
++// Unbuffered read - used when read_size=1 (backwards compatible mode)
++// This matches the 5.7.1 behavior with no runtime overhead
++static int
++fp_read_unbuffered(CBORDecoderObject *self, char *buf, Py_ssize_t size)
++{
++    Py_ssize_t bytes_read = fp_read_bytes(self, buf, size);
++    if (bytes_read == size)
++        return 0;
++    if (bytes_read >= 0)
++        PyErr_Format(
++            _CBOR2_CBORDecodeEOF,
++            "premature end of stream (expected to read %zd bytes, "
++            "got %zd instead)", size, bytes_read);
++    return -1;
++}
++
++// Buffered read - used when read_size > 1 for improved performance
+ static int
+-fp_read(CBORDecoderObject *self, char *buf, const Py_ssize_t size)
++fp_read_buffered(CBORDecoderObject *self, char *buf, Py_ssize_t size)
+ {
+     Py_ssize_t available, to_copy, remaining, total_copied;
+ 
+@@ -507,7 +536,7 @@ fp_read_object(CBORDecoderObject *self, const Py_ssize_t size)
+     if (!ret)
+         return NULL;
+ 
+-    if (fp_read(self, PyBytes_AS_STRING(ret), size) == -1) {
++    if (self->fp_read(self, PyBytes_AS_STRING(ret), size) == -1) {
+         Py_DECREF(ret);
+         return NULL;
+     }
+@@ -528,7 +557,7 @@ CBORDecoder_read(CBORDecoderObject *self, PyObject *length)
+         return NULL;
+     ret = PyBytes_FromStringAndSize(NULL, len);
+     if (ret) {
+-        if (fp_read(self, PyBytes_AS_STRING(ret), len) == -1) {
++        if (self->fp_read(self, PyBytes_AS_STRING(ret), len) == -1) {
+             Py_DECREF(ret);
+             ret = NULL;
+         }
+@@ -576,19 +605,19 @@ decode_length(CBORDecoderObject *self, uint8_t subtype,
+         if (subtype < 24) {
+             *length = subtype;
+         } else if (subtype == 24) {
+-            if (fp_read(self, value.u8.buf, sizeof(uint8_t)) == -1)
++            if (self->fp_read(self, value.u8.buf, sizeof(uint8_t)) == -1)
+                 return -1;
+             *length = value.u8.value;
+         } else if (subtype == 25) {
+-            if (fp_read(self, value.u16.buf, sizeof(uint16_t)) == -1)
++            if (self->fp_read(self, value.u16.buf, sizeof(uint16_t)) == -1)
+                 return -1;
+             *length = be16toh(value.u16.value);
+         } else if (subtype == 26) {
+-            if (fp_read(self, value.u32.buf, sizeof(uint32_t)) == -1)
++            if (self->fp_read(self, value.u32.buf, sizeof(uint32_t)) == -1)
+                 return -1;
+             *length = be32toh(value.u32.value);
+         } else {
+-            if (fp_read(self, value.u64.buf, sizeof(uint64_t)) == -1)
++            if (self->fp_read(self, value.u64.buf, sizeof(uint64_t)) == -1)
+                 return -1;
+             *length = be64toh(value.u64.value);
+         }
+@@ -752,7 +781,7 @@ decode_indefinite_bytestrings(CBORDecoderObject *self)
+     list = PyList_New(0);
+     if (list) {
+         while (1) {
+-            if (fp_read(self, &lead.byte, 1) == -1)
++            if (self->fp_read(self, &lead.byte, 1) == -1)
+                 break;
+             if (lead.major == 2 && lead.subtype != 31) {
+                 ret = decode_bytestring(self, lead.subtype);
+@@ -959,7 +988,7 @@ decode_indefinite_strings(CBORDecoderObject *self)
+     list = PyList_New(0);
+     if (list) {
+         while (1) {
+-            if (fp_read(self, &lead.byte, 1) == -1)
++            if (self->fp_read(self, &lead.byte, 1) == -1)
+                 break;
+             if (lead.major == 3 && lead.subtype != 31) {
+                 ret = decode_string(self, lead.subtype);
+@@ -2040,7 +2069,7 @@ CBORDecoder_decode_simple_value(CBORDecoderObject *self)
+     PyObject *tag, *ret = NULL;
+     uint8_t buf;
+ 
+-    if (fp_read(self, (char*)&buf, sizeof(uint8_t)) == 0) {
++    if (self->fp_read(self, (char*)&buf, sizeof(uint8_t)) == 0) {
+         tag = PyStructSequence_New(&CBORSimpleValueType);
+         if (tag) {
+             PyStructSequence_SET_ITEM(tag, 0, PyLong_FromLong(buf));
+@@ -2066,7 +2095,7 @@ CBORDecoder_decode_float16(CBORDecoderObject *self)
+         char buf[sizeof(uint16_t)];
+     } u;
+ 
+-    if (fp_read(self, u.buf, sizeof(uint16_t)) == 0)
++    if (self->fp_read(self, u.buf, sizeof(uint16_t)) == 0)
+         ret = PyFloat_FromDouble(unpack_float16(u.i));
+     set_shareable(self, ret);
+     return ret;
+@@ -2084,7 +2113,7 @@ CBORDecoder_decode_float32(CBORDecoderObject *self)
+         char buf[sizeof(float)];
+     } u;
+ 
+-    if (fp_read(self, u.buf, sizeof(float)) == 0) {
++    if (self->fp_read(self, u.buf, sizeof(float)) == 0) {
+         u.i = be32toh(u.i);
+         ret = PyFloat_FromDouble(u.f);
+     }
+@@ -2104,7 +2133,7 @@ CBORDecoder_decode_float64(CBORDecoderObject *self)
+         char buf[sizeof(double)];
+     } u;
+ 
+-    if (fp_read(self, u.buf, sizeof(double)) == 0) {
++    if (self->fp_read(self, u.buf, sizeof(double)) == 0) {
+         u.i = be64toh(u.i);
+         ret = PyFloat_FromDouble(u.f);
+     }
+@@ -2133,7 +2162,7 @@ decode(CBORDecoderObject *self, DecodeOptions options)
+     if (Py_EnterRecursiveCall(" in CBORDecoder.decode"))
+         return NULL;
+ 
+-    if (fp_read(self, &lead.byte, 1) == 0) {
++    if (self->fp_read(self, &lead.byte, 1) == 0) {
+         switch (lead.major) {
+             case 0: ret = decode_uint(self, lead.subtype);       break;
+             case 1: ret = decode_negint(self, lead.subtype);     break;
+@@ -2387,13 +2416,12 @@ PyDoc_STRVAR(CBORDecoder__doc__,
+ "    :class:`dict` object. The return value is substituted for the dict\n"
+ "    in the deserialized output.\n"
+ ":param read_size:\n"
+-"    the size of the read buffer (default 4096). The decoder reads from\n"
+-"    the stream in chunks of this size for performance. This means the\n"
+-"    stream position may advance beyond the bytes actually decoded. For\n"
+-"    large values (bytestrings, text strings), reads may be larger than\n"
+-"    ``read_size``. Code that needs to read from the stream after\n"
+-"    decoding should use :meth:`decode_from_bytes` instead, or set\n"
+-"    ``read_size=1`` to disable buffering (at a performance cost).\n"
++"    the minimum number of bytes to read at a time.\n"
++"    Setting this to a higher value like 4096 improves performance,\n"
++"    but is likely to read past the end of the CBOR value, advancing the stream\n"
++"    position beyond the decoded data. This only matters if you need to reuse the\n"
++"    stream after decoding.\n"
++"    Ignored in the pure Python implementation, but included for API compatibility.\n"
+ "\n"
+ ".. _CBOR: https://cbor.io/\n"
+ );
+diff --git a/source/decoder.h b/source/decoder.h
+index a2f4bf1..3efff8b 100644
+--- a/source/decoder.h
++++ b/source/decoder.h
+@@ -3,10 +3,17 @@
+ #include <stdbool.h>
+ #include <stdint.h>
+ 
+-// Default readahead buffer size for streaming reads
+-#define CBOR2_DEFAULT_READ_SIZE 4096
++// Default readahead buffer size for streaming reads.
++// Set to 1 for backwards compatibility (no buffering).
++#define CBOR2_DEFAULT_READ_SIZE 1
+ 
+-typedef struct {
++// Forward declaration for function pointer typedef
++struct CBORDecoderObject_;
++
++// Function pointer type for read dispatch (eliminates runtime check)
++typedef int (*fp_read_fn)(struct CBORDecoderObject_ *, char *, Py_ssize_t);
++
++typedef struct CBORDecoderObject_ {
+     PyObject_HEAD
+     PyObject *read;    // cached read() method of fp
+     PyObject *tag_hook;
+@@ -23,6 +30,9 @@ typedef struct {
+     Py_ssize_t readahead_size;  // size of allocated buffer
+     Py_ssize_t read_pos;        // current position in buffer
+     Py_ssize_t read_len;        // valid bytes in buffer
++
++    // Read dispatch - points to unbuffered or buffered implementation
++    fp_read_fn fp_read;
+ } CBORDecoderObject;
+ 
+ extern PyTypeObject CBORDecoderType;
+diff --git a/tests/test_decoder.py b/tests/test_decoder.py
+index 9bf5a10..c5d1a9c 100644
+--- a/tests/test_decoder.py
++++ b/tests/test_decoder.py
+@@ -123,6 +123,21 @@ def test_load(impl):
+         assert impl.load(fp=stream) == 1
+ 
+ 
++def test_stream_position_after_decode(impl):
++    """Test that stream position is exactly at end of decoded CBOR value."""
++    # CBOR: integer 1 (1 byte: 0x01) followed by extra data
++    cbor_data = b"\x01"
++    extra_data = b"extra"
++    with BytesIO(cbor_data + extra_data) as stream:
++        decoder = impl.CBORDecoder(stream)
++        result = decoder.decode()
++        assert result == 1
++        # Stream position should be exactly at end of CBOR data
++        assert stream.tell() == len(cbor_data)
++        # Should be able to read the extra data
++        assert stream.read() == extra_data
++
++
+ @pytest.mark.parametrize(
+     "payload, expected",
+     [
+-- 
+2.50.1
+
diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
index 69e5daba2a..90688ced20 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.4.bb
@@ -14,6 +14,8 @@ SRC_URI += " \
         file://run-ptest \
         file://CVE-2025-64076.patch \
         file://CVE-2025-68131.patch \
+        file://CVE-2026-26209-pre1.patch \
+        file://CVE-2026-26209.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.50.1


