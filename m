Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14838.1793092851211429883
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tCwIAGI+;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so21433735e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092849; x=1793697649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRMQB8bWKIKXhnV9PI4/oi0tH5QUu/1Vqxr2TuBrrv8=;
        b=tCwIAGI+ec+3lS87lbD3NeR5lHMh21xIgz07cg6266O0KqBA9y8DdHIYZUn2W+WB/B
         zDFp50JlU8xi5j2ABmRxzX/a29xractIvoFOpSaq5FDRaFoCrhT0SxGYY+WmvEqf5zsM
         hWJuLQhst15IAE5hAV6F2JyeVnQlF8PnwTeXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092849; x=1793697649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRMQB8bWKIKXhnV9PI4/oi0tH5QUu/1Vqxr2TuBrrv8=;
        b=SRoA7EsD60M4yFo8m4u64ov+v4cV+K85LoRVUZ1zu99+h0a30tPVNkdzTaVvU3iF4c
         lyeHdnb1qeZlHl2BknjDpUm7guMnKCQ2Wcaj6sknjYVcxXOMP9Fj1NqchNNCxYYhYOzh
         3RnTGSfm7kC3YDMOvy2ZOom692EuJMX7raueGVR1RnSxxlnojucugvnxhNdLxw/HNIGv
         q+m5CMH62yqsRImHH+foa6MQtKKtNJXMKmrzkSZJmeZtXX+oX4YYfJ/crTFAf15IE/3r
         l4UwC0TRL2vLfLEH52c901AUPZnNIb4hdRRjXh5rPPrznBJuZA/YcGQSUccYy9g1G7mn
         bKWQ==
X-Gm-Message-State: AFq9FYI/vWMVPCfa7y2rTAGYtV8HHzRZzxDyGoqIuQq9w06umU58VI3E
	W3kAnPFMwQtnuuTWynW8KoYMpsfXeqXpJ/z9ZiUNb0E7A7HVAC4dYp3HL18rEmTVELcaoahCWXg
	5omRL
X-Gm-Gg: AYBFou3ENT9fETQOKYhQfRBf7u9lI+o7ZJWTFz8MDflOAOPX/9IKwaTPJf9X9eccObY
	AqqIV9bZ+UcPNi1TqhEdWez6t2e4b2GLWdRViNl1bQNgXL2ThrrhIi2LrtGIgt3QReHFe2fckuD
	siezz/Lb8pXNHogMxHoCGa5XFzp3zcQVICmoFCcjE75fUBG3g4oi2DDS9TMpEFr1yKIArK/SHqk
	4xLB7Abbb7aMUPZgQyveR4U+bcD8HAOItZx05Tsv83mMyp1qcIFvJI8TOEHqMA3Uivkxya1sdsP
	cpL4k6K25FOLjtFqTUGSShtd8kHeLAcRIG07IkdWKhYhPMhTe8dymjYGBsVTlOiIO94eg8rv3eM
	DO4hH9Hj4Mwlp8k/ifWpyZEuwlEaClqL0HBrMiUQhnQQGqcfxtBrKGzkH5uCqncyWMl2jT4Sj6j
	8eN3ntbztbtG0uskgAsr/KofrTer7O3qeA/DYtkoNCLK3gGpF/j9QuLWrnm9hktxNP5LI8On0B3
	zaB2b+KZZBKgJ55d2gTXx9i+VyTt0W+JjJrer/GHtAN/crXcqlSyw+VnephiR5UZ4dWF1OgJuPj
	2gmSMdMS+npWz2uRLJYfdJR7yDnmkNCd5w9zNlnamYE0/yAyV7GRZXDJVtqAAY2Rwhv5PZZpaBv
	1bW0q
X-Received: by 2002:a05:600c:870f:b0:4a2:150f:1613 with SMTP id 5b1f17b1804b1-4a35ac9983emr170772785e9.7.1793092849453;
        Tue, 27 Oct 2026 02:20:49 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:48 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 17/61] python3-pycurl: Upgrade 7.47.0 -> 7.48.0
Date: Tue, 27 Oct 2026 11:19:44 +0200
Message-ID: <20261027092028.782979-17-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131481
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.48.0:

- Expose more CURLOPT_SSL_OPTIONS (patch by Scott Talbert)
- Read long description from README.rst instead of duplicating it
  in setup.py (patch by Scott Talbert)
- Fix test_redir_protocols_setopt (patch by Scott Talbert)
- Add CURL_LOCK_DATA_HSTS as a CurlShare option (patch by Scott
  Talbert)
- Add libpsl support to vcpkg installs for CI and wheel builds
  (patch by Scott Talbert)
- Configure nuget repo access as read-only from PRs (patch by Scott
  Talbert)
- Officially change project URL to https://pycurl.github.io/ (patch
  by Scott Talbert)
- Replace bare except clauses in examples with specific exception
  types (patch by Kotesh Kumar Yelamati)
- Add HTTP/3 support in libcurl wheel (patch by Will Noble)
- Fix segfault when calling duphandle() on a closed Curl handle
  (patch by Jorge Rocamora)
- Fix abort on non-text string arguments (patch by Jorge Rocamora)
- Fix CurlShare leak when close() detaches attached handles (patch
  by Jorge Rocamora)
- Document that views derived from the callback memoryview are not
  released (patch by Jorge Rocamora)
- Fix crash when duplicating a handle that uses set_ca_certs()
  (patch by Jorge Rocamora)
- Add CurlUrl object wrapping libcurl's URL API, with CURLOPT_CURLU
  support (patch by Jorge Rocamora)
- Fix callback exceptions being replaced by SystemError (patch by
  Jorge Rocamora)
- Fix test guard silently passing on real libcurl errors (patch by
  Jorge Rocamora)
- Update the docstring and manifest source lists (patch by Jorge
  Rocamora)
- Refuse pause() from a thread other than the performing one (patch
  by Jorge Rocamora)
- Add support for Python 3.15 (patch by Scott Talbert)
- Refuse integers for blob options instead of crashing (patch by
  Jorge Rocamora)
- Accept buffer objects for blob options (patch by Jorge Rocamora)
- Release all httppost encoded values and unset the form before
  MIMEPOST (patch by Jorge Rocamora)
- Reject callback return values that do not fit in an int (patch by
  Jorge Rocamora)
- Clear CurlMulti callbacks before deallocating attached handles
  (patch by Eric Buehl)
- Serve the test apps from a threaded WSGI server (patch by Jorge
  Rocamora)
- Add support for missing CURL options (patch by Khavish Anshudass
  Bhundoo)
- Add CURLOPT_SSL_EC_CURVES & CURLOPT_SSL_SIGNATURE_ALGORITHMS
  options (patch by Khavish Anshudass Bhundoo)
- Remove unused variable from do_curl_setopt_httppost (patch by
  Scott Talbert)
- test: silence WSGI test server access logging to stderr (patch by
  Scott Talbert)
- test: pin down oversized mime data_cb error assertions (patch by
  Scott Talbert)
- Give vendored OpenSSL a private OPENSSLDIR on Linux manylinux
  wheels (patch by Scott Talbert)
- Enable -Werror for the pycurl build in cibuildwheel without
  affecting vcpkg (patch by Scott Talbert)
- Handle libcurl options deprecated in 8.22.0 (patch by Scott
  Talbert)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pycurl_7.47.0.bb => python3-pycurl_7.48.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.47.0.bb => python3-pycurl_7.48.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.48.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.48.0.bb
index b81547f055..1a941d86d5 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.48.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "5e3cf357939da8d4ceefe3c7f305afcf9b47cba66cfd95e7768ca43b38445e14"
+SRC_URI[sha256sum] = "b70961a76c412cd34f9cc2c9558e63f89fb37045c59eee396c585b52973be280"
 
 SRC_URI += " file://run-ptest"
 
-- 
2.47.3

