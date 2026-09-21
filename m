Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AAAC982F1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:22:32 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47827.1789993351982438043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iccPKR/h;
 spf=pass (domain: konsulko.com, ip: 74.125.225.141, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so21576575e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789993350; x=1790598150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJGBglAQac/E8tCP0o+6iJTrYkrRZOwSbU8CSX6RAng=;
        b=iccPKR/hKXWylmoQqPQZMrFr0GKHCb3k33/I6TtFq62Tr7sqypuL1L7oXgGUJDY30Y
         NEsPnb0XazneXb10PzkEzZAiYVZuqnr5EnAgs+OZ3ppfpZ5I34ZjAJBIaAwiwEgc0S7m
         zdievRvn72rrS05xkLSWrsDLrIzAJWDrzEjp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993350; x=1790598150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJGBglAQac/E8tCP0o+6iJTrYkrRZOwSbU8CSX6RAng=;
        b=dyKYuo9cvW9LoELfaTqQML28/YoZUpZiMNZST87mlrCxMmkFntjO5Hq4dJt1GPvHMw
         5F3hvbNpnph2dQvX/uwmm0Vc4t6HZ9y4II2rijuG52m4wC6ULSKrPGIgCOlNlbjgwrD+
         OlneUaiHU6ruCIUuFox8evz+3vjnefwKO4bTV5l1VedyNdjR559rlzlCHI++5Nlwj7Sl
         +CVHCHIC0qTRxAvXM6Yqh5Vwy2TYZCY4faHOWxikYk1St0ejmPsUXyK3ODdXfs/X7jZl
         e8PdOjEGZ50mdZb5jg+w8R0LNj23wg6LKdxjdHqueqEOf/QmmvxU1YA/kYcN5bcoLhZC
         1FGg==
X-Gm-Message-State: AFuF++n185R50h++6RCPqcKE0Hiix/cRK+T7zlVNfer18Uzp07MS55Jw
	E+FX5o98HlRV7bSnv9lT4eF9/55iGtfxTVHoOIqS4SZ/Bu5Ppshfp7P28UesanOCR/kdQx5eEUG
	T0sQ/
X-Gm-Gg: AYBFou0WEddmP1DMT1XoPsf80A1pNQSCyEzHgnnRgfxsT6VNrZuOebsec0NYNK0bV/y
	PV9AgNlr3HbZxYehm0AS2WNczLCu2qGupm5klRZdL5dViQzuUCrXjHgCmPvN/xqDVKpIQO//FYR
	3hIUQq0O3pIB1uXuugMiMZ10wOj3Om5+RfrXB+s2B5og1zSn+CGaEuKsiRkVngWERvICesqXepB
	/eT6kJPWP37/PI2LB+bs6irdLpOXouD6Jqwn52UqPUAoVxVRwVZxgN7TGStIKhDrdLweOmb1bub
	BAMj6pNXSrtq9ENxbwybL/NdDAGW92TGen4GuTTQns5755HVpugDaLuyTTzGKeownQpKTlSe+fc
	qcMG4RAPDc9x+Ts5U6wx7lDa39nPE3ZnBlPmYVDU01jvoh4IHtQXKp9gWmdfVH2JtXSiKO0oUJH
	hvrflYN8AVUnhxIVkL0qb7tU+vrHR7AXsfB624NpFK/jNh/JHHmT1Bwf8YuFYpJoyIWEFz+1HcM
	//6YN9VkMJlXqeksJz4+aDUmF+xXpv473R4XXMpS8g2U/QCN7j0Bv/jsuXyQ375sINg991NGTl+
	kalO9ABw18Bqws0Jt021XzSaSk6d/akxLvw=
X-Received: by 2002:a05:600c:46cb:b0:49e:660a:935e with SMTP id 5b1f17b1804b1-49fc586827cmr129330375e9.29.1789993349998;
        Mon, 21 Sep 2026 05:22:29 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm208150005e9.2.2026.09.21.05.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:22:29 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pybind11: Upgrade 3.0.4 -> 3.1.0
Date: Mon, 21 Sep 2026 15:22:23 +0300
Message-ID: <20260921122224.4185627-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921122224.4185627-1-leon.anavi@konsulko.com>
References: <20260921122224.4185627-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130165

Upgrade to release 3.1.0:

- Support for Python 3.8 was removed. The minimum supported version
  is now Python 3.9.
- Support for MSVC 2017 has been dropped. #6110
- Changed strict-mode numeric conversions for PEP 484 compatibility:
  float now accepts int, and complex now accepts int and float.
- Small extra features added to the pybind11 command line tool
  based on python-config.
- Added subinterpreter_thread_state, an RAII wrapper that owns a
  reusable PyThreadState for a sub-interpreter, together with a
  subinterpreter_scoped_activate overload that activates it. This
  lets an OS thread re-enter one or more sub-interpreters without
  creating and destroying a PyThreadState on every activation.
- Add py::mod_gil_used() as replacement spelling to
  py::mod_gil_not_used(false).
- Fixed a crash in py::subinterpreter::create() when called without
  a current PyThreadState, which its documentation explicitly allows
  - for example from an embedder that ended initialization with
  PyEval_SaveThread(), or from a worker thread that has never
  touched Python. error_scope is now constructed after a thread
  state has been attached instead of before.
- Make py::print delegate to the current frame/interpreter built-ins
  print entry, fixing handling of sys.stdout = None, following the
  active runtime's stream, keyword, and error semantics, and
  remaining a no-op if the entry is unavailable during teardown.
- Include the builtin complex type in the input annotation of the
  std::complex<T> type caster.
- String views (e.g. std::string_view) are now kept alive only when
  loaded from a transient source (such as a generator), fixing both
  a use-after-free and a regression where casting a view from a
  durable object outside a bound function would throw.
- Drop Python 2 prepend to evaluated source, causing errors to be
  off by one.
- Fix data race on last_storage_ptr_ cache in
  gil_safe_call_once_and_store.
- Allow user defined __str__ on enum_.
- Fix generated Callable type annotations for Python callbacks
  passed into C++ by inverting the callback's argument/return I/O
  context relative to the enclosing function signature.
- Correct __delitem__ for negative-step slices and re-enable
  contiguous erase fast path.
- Do not pass -fno-fat-lto-objects to GCC on macOS, which made all
  LTO probes fail and silently disabled LTO.
- Fixed cross-compilation to Emscripten/Pyodide with CMake >= 4.1
  by no longer overriding an explicitly set
  PYBIND11_USE_CROSSCOMPILING when CMAKE_CROSSCOMPILING_EMULATOR
  is defined.
- Unset stale PYTHON_MODULE_DEBUG_POSTFIX and correct
  USE_PYTHON_INCLUDE_DIR variable.
- Apply -undefined dynamic_lookup to all Apple platforms.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pybind11_3.0.4.bb => python3-pybind11_3.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11_3.0.4.bb => python3-pybind11_3.1.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_3.0.4.bb b/meta-python/recipes-devtools/python/python3-pybind11_3.1.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pybind11_3.0.4.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_3.1.0.bb
index f3efed38b6..a032fc34d7 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_3.1.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "\
     python3-ninja-native \
 "
 
-SRCREV = "d03662f0984f652b60e7ddce53d3868002275197"
+SRCREV = "97bf890db679505a14dfe547a5e77bb2bd05dc90"
 SRC_URI = "\
     git://github.com/pybind/pybind11.git;branch=stable;protocol=https \
 "
-- 
2.47.3


