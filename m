Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80905E9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:27:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10896.1771417662090042695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I8YH/DnH;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so37931905e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 04:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771417660; x=1772022460; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HUrM9qWPvtM4Uof0CHDHAM5r86zJm+7CV1yBo17/GBA=;
        b=I8YH/DnH9I2LntRVRoMw+hjq9qddT3pmn32LbjYoJh+2D5SAptMyX6qQ5QG4y5DaO8
         HJj85FIM3wbk2UPzPW+xCeJv2a3/muWMrTTR8omuPRXxnkcemxbVJl/bTZxzgay/I+Qe
         0N3istcbKxOmI/dd5SqXyvqwqG9+hJtAUpChKXU6TqwgjaywVBlkCadPs7MujRvqX+gn
         EErZzjv2qBqrQ8OZqH/eKfjSIc+jCuE7XmpmDMQDxEnrSAM4MqVoRTdjt/R4rufme0en
         kR5/AAUz8l8d7zID1DxM58ddqkNL207leKIkSwaCjeyoY5ri1nR080klQxyAJULA2n/m
         vNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771417660; x=1772022460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUrM9qWPvtM4Uof0CHDHAM5r86zJm+7CV1yBo17/GBA=;
        b=uBue8PemrcPWS/E+2ElytoaI+Ow2gC12+qFQrSh+Q+E3wVBO5J+Br9LZhE/uR4szOJ
         yvXEUGkr74ZcxJzw4W2RSrH5HG/ORqcTmK+wu1T2T0AYQpkzITBipxuteXcr2MnaQr0i
         x7yym5QwJrqBMGJFT0i4zwW4Fikg0DtjvI+IQ1iW39AtIgvgY8UTdHza7N3/HOXlA6Aq
         ORpO1qm05beu3m/PDixMtM+rEp/4fgY78tp5qQx6Phol8nW2TKYrZXkP2ZS3J1fX/zJO
         xygdijAtimrt/vGkf1lyz8X8KRN6qYUGUfopObH22KP2u/hKNIbcUwTLiABJB7uOx0DW
         o1qw==
X-Forwarded-Encrypted: i=1; AJvYcCUSjOvqqZqoZuNplkRN/shNCQUf6nYnIjuzl80eM8RyD5fZlaKHWCwVD7Ww0O51KDrhFlsC3hDfBDbZwmszXimeSgA=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyr4lMn9Sc2rd9bEsRMrg4H9+S9PesVpC/yP6QM6Ym5G3MBkocc
	bc7BkkwpyImDExSIjRfHgZfeLB2XU7J+UicTq631cw16m0IRrSTHLpzm
X-Gm-Gg: AZuq6aICEz09oMUUgeHaAp18FYcfPu2DV+3pAgsGOL03y55mdHfsNjsfPqa+j7BkUgW
	63ubUfIGB0ZyMTU6jTyT0qbwI/+oO31aJVuH4ewkLyR4CJczcXGFRvZ53Yp+bKU4IWUd4UJrwky
	1PQgM4kCymRXIR/Wwpdnj8KiQbtJsoJtzSid48E5jC9tzu3hKBDd5k99fOjx3dfRy4Sre862CYP
	N7ktuaERH5bkXfGzesrZ4dtuuJHRpTJ3sJww2IX791LVvn0EJICAm4VTBcU/R3pzxPaWwAKVHen
	HEXhF7cpHq3Ix9OzGYCk1NgQCWC3W+XcSt0T6ws3ytWaFwXQz3Qmw6AJFhmscqSRZ3d1SjaZezn
	ojLYuG9gjg+U8yyyIPW/3JsMVhQDooQaIJmBRjgKKvceBopBT0jbyYDMAp2QHbV92Er9DKUJbzx
	/1c/IljzmG2QdEXSB8j7TMAMIVs8lYD4s=
X-Received: by 2002:a05:600c:5248:b0:471:1717:411 with SMTP id 5b1f17b1804b1-48373a3f1f4mr308470965e9.24.1771417659916;
        Wed, 18 Feb 2026 04:27:39 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99e194sm450786985e9.8.2026.02.18.04.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 04:27:39 -0800 (PST)
Message-ID: <30534f31-f58a-4e8e-bace-1dac58ed59b0@gmail.com>
Date: Wed, 18 Feb 2026 13:27:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-python][kirkstone][PATCH] python3-cbor2: fix CVE-2025-68131
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20260218120306.51096-1-hprajapati@mvista.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260218120306.51096-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 12:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124480

On 2/18/26 13:03, Hitendra Prajapati wrote:
> Added a read-ahead buffer to the C decoder.
>
> Upstream-Status: Backport from https://github.com/agronholm/cbor2/commit/fb4ee1612a8a1ac0dbd8cf2f2f6f931a4e06d824

Is this the correct fix for this vulnerability? I mean I see that NVD
advisory refers to this, but I wonder if that report has correct data.
This commit looks unrelated to the description of the vulnerability -
but please correct me if I'm wrong with anything in this mail.

The vulnerability is about marking a shareable CBORDecoder objects to
persist in memory, and leak information between uses, but this patch
seems to be a performance improvement, without security implications (at
least it's not obvious to me).

Looking in the recent code changes, there are two suspicious commits:
https://github.com/agronholm/cbor2/commit/f1d701cd2c411ee40bb1fe383afe7f365f35abf0
https://github.com/agronholm/cbor2/commit/403c2ce3d61ce5ddc2d2143127baf31b7ab4a75c

The first one seems to implement the solution that was recommended in
the related github advisory[1], some magic with the share-indicator
flags (and the second one fixes a bug introduced by the first one)

What do you think? Or am I going in a wrong direction?

[1]:
https://github.com/agronholm/cbor2/security/advisories/GHSA-wcj4-jw5j-44wh

>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../python/python3-cbor2/CVE-2025-68131.patch | 494 ++++++++++++++++++
>  .../python/python3-cbor2_5.4.2.bb             |   1 +
>  2 files changed, 495 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
> new file mode 100644
> index 0000000000..38cb04b14f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
> @@ -0,0 +1,494 @@
> +From fb4ee1612a8a1ac0dbd8cf2f2f6f931a4e06d824 Mon Sep 17 00:00:00 2001
> +From: Andreas Eriksen <andreer@vespa.ai>
> +Date: Mon, 29 Dec 2025 14:01:52 +0100
> +Subject: [PATCH] Added a read-ahead buffer to the C decoder (#268) 
> +
> +CVE: CVE-2025-68131
> +Upstream-Status: Backport [https://github.com/agronholm/cbor2/commit/fb4ee1612a8a1ac0dbd8cf2f2f6f931a4e06d824]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + source/decoder.c      | 250 ++++++++++++++++++++++++++++++++++++------
> + source/decoder.h      |   9 ++
> + tests/test_decoder.py |  86 +++++++++++++++
> + 3 files changed, 310 insertions(+), 35 deletions(-)
> +
> +diff --git a/source/decoder.c b/source/decoder.c
> +index d4da393..34d07a6 100644
> +--- a/source/decoder.c
> ++++ b/source/decoder.c
> +@@ -41,6 +41,7 @@ enum DecodeOption {
> + typedef uint8_t DecodeOptions;
> + 
> + static int _CBORDecoder_set_fp(CBORDecoderObject *, PyObject *, void *);
> ++static int _CBORDecoder_set_fp_with_read_size(CBORDecoderObject *, PyObject *, Py_ssize_t);
> + static int _CBORDecoder_set_tag_hook(CBORDecoderObject *, PyObject *, void *);
> + static int _CBORDecoder_set_object_hook(CBORDecoderObject *, PyObject *, void *);
> + static int _CBORDecoder_set_str_errors(CBORDecoderObject *, PyObject *, void *);
> +@@ -98,6 +99,13 @@ CBORDecoder_clear(CBORDecoderObject *self)
> +     Py_CLEAR(self->shareables);
> +     Py_CLEAR(self->stringref_namespace);
> +     Py_CLEAR(self->str_errors);
> ++    if (self->readahead) {
> ++        PyMem_Free(self->readahead);
> ++        self->readahead = NULL;
> ++        self->readahead_size = 0;
> ++    }
> ++    self->read_pos = 0;
> ++    self->read_len = 0;
> +     return 0;
> + }
> + 
> +@@ -139,6 +147,10 @@ CBORDecoder_new(PyTypeObject *type, PyObject *args, PyObject *kwargs)
> +         self->str_errors = PyBytes_FromString("strict");
> +         self->immutable = false;
> +         self->shared_index = -1;
> ++        self->readahead = NULL;
> ++        self->readahead_size = 0;
> ++        self->read_pos = 0;
> ++        self->read_len = 0;
> +     }
> +     return (PyObject *) self;
> + error:
> +@@ -148,21 +160,27 @@ error:
> + 
> + 
> + // CBORDecoder.__init__(self, fp=None, tag_hook=None, object_hook=None,
> +-//                      str_errors='strict')
> ++//                      str_errors='strict', read_size=4096)
> + int
> + CBORDecoder_init(CBORDecoderObject *self, PyObject *args, PyObject *kwargs)
> + {
> +     static char *keywords[] = {
> +-        "fp", "tag_hook", "object_hook", "str_errors", NULL
> ++        "fp", "tag_hook", "object_hook", "str_errors", "read_size", NULL
> +     };
> +     PyObject *fp = NULL, *tag_hook = NULL, *object_hook = NULL,
> +              *str_errors = NULL;
> ++    Py_ssize_t read_size = CBOR2_DEFAULT_READ_SIZE;
> + 
> +-    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|OOO", keywords,
> +-                &fp, &tag_hook, &object_hook, &str_errors))
> ++    if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O|OOOn", keywords,
> ++                &fp, &tag_hook, &object_hook, &str_errors, &read_size))
> +         return -1;
> + 
> +-    if (_CBORDecoder_set_fp(self, fp, NULL) == -1)
> ++    if (read_size < 1) {
> ++        PyErr_SetString(PyExc_ValueError, "read_size must be at least 1");
> ++        return -1;
> ++    }
> ++
> ++    if (_CBORDecoder_set_fp_with_read_size(self, fp, read_size) == -1)
> +         return -1;
> +     if (tag_hook && _CBORDecoder_set_tag_hook(self, tag_hook, NULL) == -1)
> +         return -1;
> +@@ -190,11 +208,12 @@ _CBORDecoder_get_fp(CBORDecoderObject *self, void *closure)
> + }
> + 
> + 
> +-// CBORDecoder._set_fp(self, value)
> ++// Internal: set fp with configurable read size
> + static int
> +-_CBORDecoder_set_fp(CBORDecoderObject *self, PyObject *value, void *closure)
> ++_CBORDecoder_set_fp_with_read_size(CBORDecoderObject *self, PyObject *value, Py_ssize_t read_size)
> + {
> +     PyObject *tmp, *read;
> ++    char *new_buffer = NULL;
> + 
> +     if (!value) {
> +         PyErr_SetString(PyExc_AttributeError, "cannot delete fp attribute");
> +@@ -207,13 +226,43 @@ _CBORDecoder_set_fp(CBORDecoderObject *self, PyObject *value, void *closure)
> +         return -1;
> +     }
> + 
> ++    if (self->readahead == NULL || self->readahead_size != read_size) {
> ++        new_buffer = (char *)PyMem_Malloc(read_size);
> ++        if (!new_buffer) {
> ++            Py_DECREF(read);
> ++            PyErr_NoMemory();
> ++            return -1;
> ++        }
> ++    }
> ++
> +     // See notes in encoder.c / _CBOREncoder_set_fp
> +     tmp = self->read;
> +     self->read = read;
> +     Py_DECREF(tmp);
> ++
> ++    self->read_pos = 0;
> ++    self->read_len = 0;
> ++
> ++    // Replace buffer (size changed or was NULL)
> ++    if (new_buffer) {
> ++        PyMem_Free(self->readahead);
> ++        self->readahead = new_buffer;
> ++        self->readahead_size = read_size;
> ++    }
> ++
> +     return 0;
> + }
> + 
> ++// CBORDecoder._set_fp(self, value) - property setter uses default read size
> ++static int
> ++_CBORDecoder_set_fp(CBORDecoderObject *self, PyObject *value, void *closure)
> ++{
> ++    // Use existing readahead_size if already allocated, otherwise use default
> ++    Py_ssize_t read_size = (self->readahead_size > 0) ?
> ++                           self->readahead_size : CBOR2_DEFAULT_READ_SIZE;
> ++    return _CBORDecoder_set_fp_with_read_size(self, value, read_size);
> ++}
> ++
> + 
> + // CBORDecoder._get_tag_hook(self)
> + static PyObject *
> +@@ -340,38 +389,123 @@ _CBORDecoder_get_immutable(CBORDecoderObject *self, void *closure)
> +         Py_RETURN_FALSE;
> + }
> + 
> +-
> + // Utility functions /////////////////////////////////////////////////////////
> + 
> ++static void
> ++raise_from(PyObject *new_exc_type, const char *message) {
> ++    // This requires the error indicator to be set
> ++    PyObject *cause;
> ++#if PY_VERSION_HEX >= 0x030c0000
> ++    cause = PyErr_GetRaisedException();
> ++#else
> ++    PyObject *exc_type, *exc_traceback;
> ++    PyErr_Fetch(&exc_type, &cause, &exc_traceback);
> ++    PyErr_NormalizeException(&exc_type, &cause, &exc_traceback);
> ++    Py_XDECREF(exc_type);
> ++    Py_XDECREF(exc_traceback);
> ++#endif
> ++
> ++    PyObject *msg_obj = PyUnicode_FromString(message);
> ++    if (message) {
> ++        PyObject *new_exception = PyObject_CallFunctionObjArgs(
> ++            new_exc_type, msg_obj, NULL);
> ++        if (new_exception) {
> ++            PyException_SetCause(new_exception, cause);
> ++            PyErr_SetObject(new_exc_type, new_exception);
> ++        }
> ++        Py_DECREF(msg_obj);
> ++    }
> ++}
> ++
> ++// Read directly into caller's buffer (bypassing readahead buffer)
> ++static Py_ssize_t
> ++fp_read_bytes(CBORDecoderObject *self, char *buf, Py_ssize_t size)
> ++{
> ++    PyObject *size_obj = PyLong_FromSsize_t(size);
> ++    if (!size_obj)
> ++        return -1;
> ++
> ++    PyObject *obj = PyObject_CallFunctionObjArgs(self->read, size_obj, NULL);
> ++    Py_DECREF(size_obj);
> ++    if (!obj)
> ++        return -1;
> ++
> ++    assert(PyBytes_CheckExact(obj));
> ++    Py_ssize_t bytes_read = PyBytes_GET_SIZE(obj);
> ++    if (bytes_read > 0)
> ++        memcpy(buf, PyBytes_AS_STRING(obj), bytes_read);
> ++
> ++    Py_DECREF(obj);
> ++    return bytes_read;
> ++}
> ++
> ++// Read into caller's buffer using the readahead buffer
> + static int
> + fp_read(CBORDecoderObject *self, char *buf, const Py_ssize_t size)
> + {
> +-    PyObject *obj, *size_obj;
> +-    char *data;
> +-    int ret = -1;
> +-
> +-    size_obj = PyLong_FromSsize_t(size);
> +-    if (size_obj) {
> +-        obj = PyObject_CallFunctionObjArgs(self->read, size_obj, NULL);
> +-        if (obj) {
> +-            assert(PyBytes_CheckExact(obj));
> +-            if (PyBytes_GET_SIZE(obj) == (Py_ssize_t) size) {
> +-                data = PyBytes_AS_STRING(obj);
> +-                memcpy(buf, data, size);
> +-                ret = 0;
> ++    Py_ssize_t available, to_copy, remaining, total_copied;
> ++
> ++    remaining = size;
> ++    total_copied = 0;
> ++
> ++    while (remaining > 0) {
> ++        available = self->read_len - self->read_pos;
> ++
> ++        if (available > 0) {
> ++            // Copy from buffer
> ++            to_copy = (available < remaining) ? available : remaining;
> ++            memcpy(buf + total_copied, self->readahead + self->read_pos, to_copy);
> ++            self->read_pos += to_copy;
> ++            total_copied += to_copy;
> ++            remaining -= to_copy;
> ++        } else {
> ++            Py_ssize_t bytes_read;
> ++
> ++            if (remaining >= self->readahead_size) {
> ++                // Large remaining: read directly into destination, bypass buffer
> ++                bytes_read = fp_read_bytes(self, buf + total_copied, remaining);
> ++                if (bytes_read > 0) {
> ++                    total_copied += bytes_read;
> ++                    remaining -= bytes_read;
> ++                }
> +             } else {
> +-                PyErr_Format(
> +-                    _CBOR2_CBORDecodeEOF,
> +-                    "premature end of stream (expected to read %zd bytes, "
> +-                    "got %zd instead)", size, PyBytes_GET_SIZE(obj));
> ++                // Small remaining: refill buffer
> ++                self->read_pos = 0;
> ++                self->read_len = 0;
> ++                bytes_read = fp_read_bytes(self, self->readahead, self->readahead_size);
> ++                if (bytes_read > 0)
> ++                    self->read_len = bytes_read;
> ++            }
> ++
> ++            if (bytes_read <= 0) {
> ++                if (bytes_read == 0)
> ++                    PyErr_Format(
> ++                        _CBOR2_CBORDecodeEOF,
> ++                        "premature end of stream (expected to read %zd bytes, "
> ++                        "got %zd instead)", size, total_copied);
> ++                return -1;
> +             }
> +-            Py_DECREF(obj);
> +         }
> +-        Py_DECREF(size_obj);
> +     }
> +-    return ret;
> ++
> ++    return 0;
> + }
> + 
> ++// Read and return as PyBytes object
> ++static PyObject *
> ++fp_read_object(CBORDecoderObject *self, const Py_ssize_t size)
> ++{
> ++    PyObject *ret = PyBytes_FromStringAndSize(NULL, size);
> ++    if (!ret)
> ++        return NULL;
> ++
> ++    if (fp_read(self, PyBytes_AS_STRING(ret), size) == -1) {
> ++        Py_DECREF(ret);
> ++        return NULL;
> ++    }
> ++
> ++    return ret;
> ++}
> + 
> + // CBORDecoder.read(self, length) -> bytes
> + static PyObject *
> +@@ -1760,21 +1894,59 @@ static PyObject *
> + CBORDecoder_decode_from_bytes(CBORDecoderObject *self, PyObject *data)
> + {
> +     PyObject *save_read, *buf, *ret = NULL;
> ++    bool is_nested = (self->decode_depth > 0);
> ++    Py_ssize_t save_read_pos = 0, save_read_len = 0;
> ++    char *save_buffer = NULL;
> + 
> +     if (!_CBOR2_BytesIO && _CBOR2_init_BytesIO() == -1)
> +         return NULL;
> + 
> +-    save_read = self->read;
> +     buf = PyObject_CallFunctionObjArgs(_CBOR2_BytesIO, data, NULL);
> +-    if (buf) {
> +-        self->read = PyObject_GetAttr(buf, _CBOR2_str_read);
> +-        if (self->read) {
> +-            ret = decode(self, DECODE_NORMAL);
> +-            Py_DECREF(self->read);
> ++    if (!buf)
> ++        return NULL;
> ++
> ++    self->decode_depth++;
> ++    save_read = self->read;
> ++    Py_INCREF(save_read);  // Keep alive while we use a different read method
> ++    save_read_pos = self->read_pos;
> ++    save_read_len = self->read_len;
> ++
> ++    // Save buffer pointer if nested
> ++    if (is_nested) {
> ++        save_buffer = self->readahead;
> ++        self->readahead = NULL;  // Prevent setter from freeing saved buffer
> ++    }
> ++
> ++    // Set up BytesIO decoder - setter handles buffer allocation
> ++    if (_CBORDecoder_set_fp_with_read_size(self, buf, self->readahead_size) == -1) {
> ++        if (is_nested) {
> ++            PyMem_Free(self->readahead);
> ++            self->readahead = save_buffer;
> +         }
> ++        Py_DECREF(save_read);
> +         Py_DECREF(buf);
> ++        self->decode_depth--;
> ++        return NULL;
> ++    }
> ++
> ++    ret = decode(self, DECODE_NORMAL);
> ++
> ++    Py_XDECREF(self->read);  // Decrement BytesIO read method
> ++    self->read = save_read;  // Restore saved read (already has correct refcount)
> ++    Py_DECREF(buf);
> ++    self->decode_depth--;
> ++
> ++    if (is_nested) {
> ++        PyMem_Free(self->readahead);
> ++        self->readahead = save_buffer;
> ++    }
> ++    self->read_pos = save_read_pos;
> ++    self->read_len = save_read_len;
> ++
> ++    assert(self->decode_depth >= 0);
> ++    if (self->decode_depth == 0) {
> ++        clear_shareable_state(self);
> +     }
> +-    self->read = save_read;
> +     return ret;
> + }
> + 
> +@@ -1920,6 +2092,14 @@ PyDoc_STRVAR(CBORDecoder__doc__,
> + "    dictionary. This callback is invoked for each deserialized\n"
> + "    :class:`dict` object. The return value is substituted for the dict\n"
> + "    in the deserialized output.\n"
> ++":param read_size:\n"
> ++"    the size of the read buffer (default 4096). The decoder reads from\n"
> ++"    the stream in chunks of this size for performance. This means the\n"
> ++"    stream position may advance beyond the bytes actually decoded. For\n"
> ++"    large values (bytestrings, text strings), reads may be larger than\n"
> ++"    ``read_size``. Code that needs to read from the stream after\n"
> ++"    decoding should use :meth:`decode_from_bytes` instead, or set\n"
> ++"    ``read_size=1`` to disable buffering (at a performance cost).\n"
> + "\n"
> + ".. _CBOR: https://cbor.io/\n"
> + );
> +diff --git a/source/decoder.h b/source/decoder.h
> +index 6bb6d52..8a3393a 100644
> +--- a/source/decoder.h
> ++++ b/source/decoder.h
> +@@ -3,6 +3,9 @@
> + #include <stdbool.h>
> + #include <stdint.h>
> + 
> ++// Default readahead buffer size for streaming reads
> ++#define CBOR2_DEFAULT_READ_SIZE 4096
> ++
> + typedef struct {
> +     PyObject_HEAD
> +     PyObject *read;    // cached read() method of fp
> +@@ -13,6 +16,12 @@ typedef struct {
> +     PyObject *str_errors;
> +     bool immutable;
> +     Py_ssize_t shared_index;
> ++
> ++    // Readahead buffer for streaming
> ++    char *readahead;            // allocated buffer
> ++    Py_ssize_t readahead_size;  // size of allocated buffer
> ++    Py_ssize_t read_pos;        // current position in buffer
> ++    Py_ssize_t read_len;        // valid bytes in buffer
> + } CBORDecoderObject;
> + 
> + extern PyTypeObject CBORDecoderType;
> +diff --git a/tests/test_decoder.py b/tests/test_decoder.py
> +index d03e288..b153971 100644
> +--- a/tests/test_decoder.py
> ++++ b/tests/test_decoder.py
> +@@ -717,3 +717,89 @@ def test_decimal_payload_unpacking(impl, data, expected):
> +     with pytest.raises(impl.CBORDecodeValueError) as exc_info:
> +         impl.loads(unhexlify(data))
> +     assert exc_info.value.args[0] == f"Incorrect tag {expected} payload"
> ++
> ++
> ++def test_decode_from_bytes_in_hook_preserves_buffer(impl):
> ++    """Test that calling decode_from_bytes from a hook preserves stream buffer state.
> ++
> ++    This is a documented use case from docs/customizing.rst where hooks decode
> ++    embedded CBOR data. Before the fix, the stream's readahead buffer would be
> ++    corrupted, causing subsequent reads to fail or return wrong data.
> ++    """
> ++
> ++    def tag_hook(decoder, tag):
> ++        if tag.tag == 999:
> ++            # Decode embedded CBOR (documented pattern)
> ++            return decoder.decode_from_bytes(tag.value)
> ++        return tag
> ++
> ++    # Test data: array with [tag(999, embedded_cbor), "after_hook", "final"]
> ++    # embedded_cbor encodes: [1, 2, 3]
> ++    data = unhexlify(
> ++        "83"  # array(3)
> ++        "d903e7"  # tag(999)
> ++        "44"  # bytes(4)
> ++        "83010203"  # embedded: array [1, 2, 3]
> ++        "6a"  # text(10)
> ++        "61667465725f686f6f6b"  # "after_hook"
> ++        "65"  # text(5)
> ++        "66696e616c"  # "final"
> ++    )
> ++
> ++    # Decode from stream (not bytes) to use readahead buffer
> ++    stream = BytesIO(data)
> ++    decoder = impl.CBORDecoder(stream, tag_hook=tag_hook)
> ++    result = decoder.decode()
> ++
> ++    # Verify all values decoded correctly
> ++    assert result == [[1, 2, 3], "after_hook", "final"]
> ++
> ++    # First element should be the decoded embedded CBOR
> ++    assert result[0] == [1, 2, 3]
> ++    # Second element should be "after_hook" (not corrupted)
> ++    assert result[1] == "after_hook"
> ++    # Third element should be "final"
> ++    assert result[2] == "final"
> ++
> ++
> ++def test_decode_from_bytes_deeply_nested_in_hook(impl):
> ++    """Test deeply nested decode_from_bytes calls preserve buffer state.
> ++
> ++    This tests tag(999, tag(888, tag(777, [1,2,3]))) where each tag value
> ++    is embedded CBOR that triggers the hook recursively.
> ++
> ++    Before the fix, even a single level would corrupt the buffer. With multiple
> ++    levels, the buffer would be completely corrupted, mixing data from different
> ++    BytesIO objects and the original stream.
> ++    """
> ++
> ++    def tag_hook(decoder, tag):
> ++        if tag.tag in [999, 888, 777]:
> ++            # Recursively decode embedded CBOR
> ++            return decoder.decode_from_bytes(tag.value)
> ++        return tag
> ++
> ++    # Test data: [tag(999, tag(888, tag(777, [1,2,3]))), "after", "final"]
> ++    # Each tag contains embedded CBOR
> ++    data = unhexlify(
> ++        "83"  # array(3)
> ++        "d903e7"  # tag(999)
> ++        "4c"  # bytes(12)
> ++        "d9037848d903094483010203"  # embedded: tag(888, tag(777, [1,2,3]))
> ++        "65"  # text(5)
> ++        "6166746572"  # "after"
> ++        "65"  # text(5)
> ++        "66696e616c"  # "final"
> ++    )
> ++
> ++    # Decode from stream to use readahead buffer
> ++    stream = BytesIO(data)
> ++    decoder = impl.CBORDecoder(stream, tag_hook=tag_hook)
> ++    result = decoder.decode()
> ++
> ++    # With the fix: all three levels of nesting work correctly
> ++    # Without the fix: buffer corruption at each level, test fails
> ++    assert result == [[1, 2, 3], "after", "final"]
> ++    assert result[0] == [1, 2, 3]
> ++    assert result[1] == "after"
> ++    assert result[2] == "final"
> +-- 
> +2.50.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
> index bbdeca7adb..5aeb82b992 100644
> --- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.2.bb
> @@ -10,6 +10,7 @@ inherit pypi python_setuptools_build_meta ptest
>  
>  SRC_URI += " \
>          file://run-ptest \
> +        file://CVE-2025-68131.patch \
>  "
>  
>  # not vulnerable yet, vulnerability was introduced in v5.6.0


