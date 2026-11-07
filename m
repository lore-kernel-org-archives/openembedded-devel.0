Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11957.1794070346141964863
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=CSLPssZX;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4922523d1afso911863f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070344; x=1794675144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jWFajFhdglE8Hpfwq7t/ETBT1NQPBZT988j3gthdutw=;
        b=CSLPssZXLrmC7DeA/knnpblh0Oxm5yg5JpchC5NU0utzFaodfbh7gbGsrAR9zNE38W
         2Wn0GAtNcY4UXn9c88h8GlHirp6t4KXEFCPp1R848ca2FIrPdlWKBYp97C+8Dgl01QQ6
         ALiBKrcZM32DXoFZxRxnK0gpG2lHsIIIC6EuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070344; x=1794675144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWFajFhdglE8Hpfwq7t/ETBT1NQPBZT988j3gthdutw=;
        b=pwdk7+3od8TPfZwH9APUEuTXI1XzpGDDlqwQyMWlipklNByZPBqpJTubqQKcbI8dla
         wjMW7Cnzs40L/C/fwaUYf43p8cDHNSjsC+8hn2tkJ+w91Opx5RWDP9tEFLddsod35cl2
         AHqQN0g3D1RPLGpbvuK/QHqnfqpmuAlROd2pZ26mQhpgJGN8bwIJKTHr/waJU55f1x5C
         WQBMBVYD8gr6eSJCLWgp2jLLrLN9iRqIbjoBkb8o4HMn6E5RGU8Jfl38jApHM0j2/XBK
         JfTvLifGl2eMbx/7tQC55cjxl0RMZW9FmZGsRPGBTdJNnNWQn5Up6KeGScjAby3mXqYA
         mnYg==
X-Gm-Message-State: APuU4Z9rqnRNnUbr0lqEfIX6RiZl3Oziy9NpUiZLy1AIb6xRI883OOax
	IcfDm7Uvll0bh43vDRQfmo1lr7rvyWDeK1MllKWEZX8HVFNd1Hg21TRFjElYfjudgb2OJKvdkAo
	rd36x
X-Gm-Gg: AYBFou3xJX9OiHPkTXqsj+1lDEiOyjyl/0yM30vHkIpcgDjq2kOdv2vLpA0QDhR5v+g
	GH3IytvGyt5lYa6DQsapp+fwj8pxuOihXlDc7bZ3HCDAZo0ukzh72S/MB1Mnl55uJJ1u7p50pE0
	FZZS9t0lx3LFPW1ty8M2idkkIVOIxpi7Mh575gpc8tMoELJ5uxSt3TNLUjbFAhqcXGKGmWqMPHw
	RUTMSj+tceyxEUy16Nn6Ycd8H/KhrGTQ0w32jyVneF6QejeCYsmU1OMvqi1hmsGluuARqaA/UIQ
	RuhJCbyYnd0AIUIIkK4+AhiFl8rrSRXuVxgQs2OXO7IpMYXtmfJxRHlXEM6Beli5ZVMCKICHFpN
	jFhgdojhXgmcWbqXWOPqk3D3mXfplxTnyA7Wx/M/zGhWg4TgryNQv7rF0Xtjqfpy8tpKynWp4bK
	LwLeJi3q9/sz67QC+eqQw/xoDZjweUubgTnlO5aC/HfzDRoI8iUVRocC+3tyLEE9z0Hyq4knH2p
	6GCcEfpHIfZ6E1ljGNcjw5McSgMwjXu3WwVtC1hezthMN44G9Eh33eBjt1Xon5S78jNDRnPj1PU
	evh0WwwTmVsphpw4aozL5bYPKoVs+G1NzIST4AYMkIWDweUQBDXXlvge4kId3DDIotbnIwZyzMh
	EFVrWg0uDh0j9Em4qwIK+3/pa2PT7tKu+Yg9/mO0aelbz2OKjGkoqoA==
X-Received: by 2002:a05:6000:381:b0:490:83b9:7888 with SMTP id ffacd0b85a97d-49278b08d1amr11837493f8f.52.1794070344090;
        Sat, 07 Nov 2026 08:52:24 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:23 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 01/22] asio: Upgrade 1.36.0 -> 1.38.2
Date: Sat,  7 Nov 2026 18:52:00 +0200
Message-ID: <20261107165221.122340-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131986
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.38.2:

- Added a `"scheduler"` / `"assume_continuation"` configuration
  parameter. When `true`, the scheduler assumes that all posted
  handlers are a continuation of the currently executing handler,
  allowing them to be added to a fast thread-local queue. This can
  improve performance for applications that exclusively use
  short-running handlers.
- Added a `"reactor"` / `"io_uring_ring_count"` configuration
  parameter.  This sets the number of independent io_uring
  instances ("rings") that a single execution context maintains
  internally. Increasing this parameter from its default of 1 may
  improve scalability when the execution context is used with
  multiple threads.
- Added a `"reactor"` / `"io_uring_ring_size"` configuration
  parameter, which is used to specify the number of entries in each
  io_uring instance.
- Added a `"reactor"` / `"io_uring_submit_batch_size"`
  configuration parameter.  This sets the number of pending
  io_uring submission queue entries at which they are submitted
  immediately, rather than deferred.
- Added a `"reactor"` / `"io_uring_iowait"` configuration
  parameter, which may be used to determine whether the thread is
  marked as being in iowait while io_uring operations are pending.
- Added the ability to configure `ssl::stream<>`'s internal buffer
  sizes.
- Added `asio/fwd.hpp`, as a way to safely forward declare some
  Asio class names, even when `ASIO_ENABLE_VERSION_NAMESPACE` or
  `ASIO_VERSION_NAMESPACE` are defined.
- Added an example for using `cancel_after` with coroutines.
- Changed all exception classes to use inline implementations, to
  fix an undefined symbol error on some platforms when using
  separate compilation.
- Changed constants and CPOs to use external linkage for C++17 and
  later.
- Changed "slim" mutexes to use futexes on Linux.
- Changed the reactor send/receive path to use `MSG_DONTWAIT`, if
  supported, rather than setting the socket to be non-blocking.
- Added a missing optimisation for `concurrency_hint == 1` in the
  `io_context` class's `poll_one()` function.
- Added support for `co_composed` under `ASIO_NO_EXCEPTIONS`.
- Fixed a `co_composed` crash on MSVC that occurs when using
  multiple completion signatures.
- Fixed a `co_composed` crash on MSVC by ensuring 16-byte block
  alignment in its internal coroutine representation.
- Fixed the return type on one `cancel_after` overload.
- Fixed integer truncation in `basic_streambuf::commit`/`consume`
  for sizes greater than or equal to `INT_MAX`.
- Fixed a buffer invalidation error triggered when SSL streams are
  moved, and clarified the buffer invalidation semantics in the
  documentation.
- Fixed a compilation error, seen with some compilers such as
  [^nvc++], that occurs when using `post`, `dispatch` or `defer`
  (or an asynchronous operation built on them) with a completion
  handler.
- Fixed `parallel_group` handling of non-terminal cancellation
  requests.
- Fixed thread sanitizer warnings due to atomic thread fences, and
  added thread sanitizer instrumentation to the io_uring backend.
- Fixed a signed/unsigned warning in `basic_resolver_results`.
- Fixed `experimental::channel` compilation with older versions of
  MSVC.
- Fixed the `multicast::enable_loopback` socket option size on
  NetBSD and OpenBSD.
- Suppressed case fall-through warnings in the SSL implementation.
- Fixed standard library coroutine detection when using
  [^clang-cl].
- Improved cross-referencing within the documentation.

License-Update: Update copyright years to 2003-2026

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-tests-Remove-blocking_adaptation.cpp.patch   | 11 ++++-------
 .../asio/{asio_1.36.0.bb => asio_1.38.2.bb}           |  4 ++--
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-support/asio/{asio_1.36.0.bb => asio_1.38.2.bb} (89%)

diff --git a/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch b/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
index 5aa502916d..b1e91d9981 100644
--- a/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
+++ b/meta-oe/recipes-support/asio/asio/0001-tests-Remove-blocking_adaptation.cpp.patch
@@ -1,4 +1,4 @@
-From 7d76513b82a67e117d195a1b5a0d6c2e8591488b Mon Sep 17 00:00:00 2001
+From 125f69ba681677d50061dcb2554dcb2970d9165d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 10 Oct 2024 13:58:38 +0800
 Subject: [PATCH] tests: Remove blocking_adaptation.cpp
@@ -21,17 +21,14 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/src/tests/Makefile.am b/src/tests/Makefile.am
-index 04f8a03..eab2d56 100644
+index 32b67f2..e972c7f 100644
 --- a/src/tests/Makefile.am
 +++ b/src/tests/Makefile.am
-@@ -68,7 +68,6 @@ check_PROGRAMS = \
+@@ -74,7 +74,6 @@ check_PROGRAMS = \
  	unit/error \
  	unit/execution/any_executor \
  	unit/execution/blocking \
 -	unit/execution/blocking_adaptation \
  	unit/execution/context_as \
  	unit/execution/executor \
- 	unit/execution/invocable_archetype \
--- 
-2.34.1
-
+ 	unit/execution/inline_exception_handling \
diff --git a/meta-oe/recipes-support/asio/asio_1.36.0.bb b/meta-oe/recipes-support/asio/asio_1.38.2.bb
similarity index 89%
rename from meta-oe/recipes-support/asio/asio_1.36.0.bb
rename to meta-oe/recipes-support/asio/asio_1.38.2.bb
index bd23e5b112..ef2341a67a 100644
--- a/meta-oe/recipes-support/asio/asio_1.36.0.bb
+++ b/meta-oe/recipes-support/asio/asio_1.38.2.bb
@@ -17,9 +17,9 @@ inherit autotools ptest
 
 ALLOW_EMPTY:${PN} = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=92db288d8a7d89bb9c5821c447c3052c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=068306999fcd4c4f2ba32622dae406ac"
 
-SRC_URI[sha256sum] = "7bf4dbe3c1ccd9cc4c94e6e6be026dcc2110f9201d286bb9500dc85d69825524"
+SRC_URI[sha256sum] = "c04e0e66ac29741faad763a56f3c50196421d4b968009fc237c53314769bf8ad"
 
 # Releases live in per-version directories named "<pver> (Stable)" / "<pver> (Development)",
 # so match only the stable ones.
-- 
2.47.3

