Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10290.1795752840032135256
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UfZ5zKsv;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-385c497bf94so6997001eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752839; x=1796357639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNh4FRnlw3Qjb49MmBS8wKYSctyKa6bhkn0lm9m09M8=;
        b=UfZ5zKsv8MTBPj1CQ0DOeOyzvS58A+C3ues+C+izT4VyM8ZSfER29pvBcyg16HN3Py
         kg0yixWXzOKa0fnVQ363BQBRPa43LEfLFx9U2SQVPabiPo22Dc4xgK9JtHlEXyl+M/Av
         HZN6yx2TR6CZLsMm1Wrn5jv6LrGmRo6LmzsMfyxPAylMhfvBCCK+a/+6CTKVzVZ2Q/1f
         T86LNcTeUEhqeqytL7XnHu5ZFY0mTFsydbcp1RUEllfMX987sYG2n/16AjLZ4sGPcotb
         tJepETeNsZwxfLEJMygWwyMDgmcXKHFzyr5Hp93/RAlqHEv9wxepwghMIfjWiLQaJjJX
         gnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752839; x=1796357639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bNh4FRnlw3Qjb49MmBS8wKYSctyKa6bhkn0lm9m09M8=;
        b=Y8wqPMwYeYAcKKfZGzU2qfovsNnsTTXHDfaHUWhkfx/ODOCretmSEkBdREEnVP+3Y5
         3Js8azXe27NFUZ7wOvxhkw1wXVyS4NOe4qCLmkYAz/DjwNOaIwcmYgFXynlhxD8QIIsq
         EUHza7VXdgcTl6uzJvVJO5SCeags2xRRvlZ07Ndhy3QT06poVsu95fQ77TcyEtPX5YB9
         A2m9kw4CcHWlN8/ZiNPXLgYYGmr4unuuv447EXcit5NAQhpdOuJqgEEKoC18TwEgucwa
         V0fVN0T54ZhDxHyoUkhL/eMYC1Ryg+HS3mlq5EafUUPu+WUPKHdiJx4CZpXKWsb5h3ne
         k60Q==
X-Gm-Message-State: APuU4Z+aM2z5WmVbWOiQeLPcVf6ZNgmQ27ivppS7FCgA0S1n9IhcJS0o
	3mbCHjsm0Xgp2SpmlyribKmOnFPmX8035vBQjJjMNcyLLmUp2+hKNLygIx+iOCzj
X-Gm-Gg: AZFdTZdKMGK6QmmgnzoC29C4QswETb3IXkcyvuv9NuuJOZr5yT2UVMOTlbodluXxqNR
	LAi8/263f/QR37LCJLM8u9fiZV0NGkL3SXJbho6HPD4JsT0pXZcKsIKe1HzrfxmTpf4uR4ynAxL
	RM8flNLXsAH+9kraHwJ/eQO+ffFC2fwwSYzqTPpXm3t03UWqJOaFOeTPa7+2Xs8J7NFtQfelOLG
	nE+14uOoatN+5U8bpO/MeTrBiWOS9kXhXMjUy+e1+17wkrV86OdU0GfGmT5qCyiVjDA/xnz4iBc
	K5VRHx9Ow5l9fe/nMnmaAUKqGPt0jv3IElK6WvPz2ilh1l8iJNmEYwtauWZZQoQSn547YTpW8c/
	pyqGMKblxjvowJev+XTTlY3ESVXDPEzd3IXXHBCefQJV+8m0UJ45Q7spoOPmMsFey2sR3rlIxUe
	RcJnwdUeb9ETr688CS4o+BuAlbfMe9wKXq6QNe7hQT3NuIC1YXpz5IksPtFR3wdBNHUmyl9aeUU
	4sw9wrm+r2VmZuTY9iZ5ASDUwdgPkEAulSJRgHTLoH5tHI3mBR9Q9Xr3GZ87P0gTFv72g2Tl63Y
	Rt32surGfvKk/eMMMEF2QvWnyifyA5/AM+dGwwRv7LBbQlZx3Zh8ccYKQrpm0W2sVgeotRS4Ftd
	upqvrnwnDStXHenrM6lO8Rvg57xuKJ8K8YGT0Oom9a6OSorQdWEGDlaIvvSSTnJOdWwyjwTgp/6
	BLnsMH+NPl7ZsUEW+B88TrxT8sUuPKHaYll8oNpajftBrXNG5buxpU5raB2Fu3/cP1LxTmNlss+
	61TY0MRcV8njLYOiPuNNvfs+as2QdMby3tPQoVAldMfHXv6AYODi2iIPSkrnVaTtcndDdrHmCPR
	S2nB
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr14271231eec.40.1795752839314;
        Thu, 26 Nov 2026 20:13:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:13:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 37/39] sdbus-c++: Fix intermittent segfault in the awaitable integration tests
Date: Thu, 26 Nov 2026 20:13:41 -0800
Message-ID: <20261127041343.1772294-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
References: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133207
Content-Type: text/plain; charset="utf-8"

The Task type in DBusAwaitableMethodsTests.cpp completes its
std::promise inside final_suspend(), before the coroutine has
suspended. The test thread then returns from Task::get() and destroys
the coroutine in ~Task() while the event loop thread is still in
final_suspend(), which is undefined behaviour. The integration tests
segfault in the awaitable tests, often when the host is loaded as
during testimage.

Add a patch that completes the promise from the final awaiter's
await_suspend(), once the coroutine is suspended.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...aitable-test-tasks-only-after-final-.patch | 104 ++++++++++++++++++
 .../recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++/0004-test-complete-awaitable-test-tasks-only-after-final-.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0004-test-complete-awaitable-test-tasks-only-after-final-.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0004-test-complete-awaitable-test-tasks-only-after-final-.patch
new file mode 100644
index 0000000000..1845d88c96
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++/0004-test-complete-awaitable-test-tasks-only-after-final-.patch
@@ -0,0 +1,104 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 26 Nov 2026 04:08:14 -0800
+Subject: [PATCH] test: complete awaitable test tasks only after final
+ suspension
+
+The Task type used by the awaitable integration tests fulfilled its
+std::promise inside final_suspend(), before the coroutine had suspended.
+The test thread wakes up in Task::get(), finishes the test and destroys
+the coroutine in ~Task() while the event loop thread is still running
+the coroutine's final_suspend(). Destroying a coroutine that is not
+suspended is undefined behaviour; when the host is loaded, the tests
+segfault in InvokesMethodAsynchronouslyOnClientSideWithAwaitable and
+the other awaitable tests.
+
+Return an awaiter from final_suspend() that fulfils the promise in
+await_suspend(), when the coroutine is already suspended and may be
+destroyed.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ .../DBusAwaitableMethodsTests.cpp             | 56 ++++++++++++-------
+ 1 file changed, 35 insertions(+), 21 deletions(-)
+
+diff --git a/tests/integrationtests/DBusAwaitableMethodsTests.cpp b/tests/integrationtests/DBusAwaitableMethodsTests.cpp
+index 092dfc0..2be50d6 100644
+--- a/tests/integrationtests/DBusAwaitableMethodsTests.cpp
++++ b/tests/integrationtests/DBusAwaitableMethodsTests.cpp
+@@ -66,19 +66,27 @@ struct Task {
+         std::suspend_always initial_suspend() noexcept { return {}; }
+ 
+         // final_suspend suspends so that the test code can retrieve the result
+-        // or exception from the promise before the coroutine is destroyed
+-        std::suspend_always final_suspend() noexcept
+-        {
+-            if (exception)
++        // or exception from the promise before the coroutine is destroyed.
++        // Complete the future only once the coroutine is suspended: the test
++        // thread destroys the coroutine as soon as get() returns, which must
++        // not happen while the coroutine is still running on the event loop thread.
++        struct FinalAwaiter {
++            bool await_ready() const noexcept { return false; }
++            void await_suspend(std::coroutine_handle<promise_type> hnd) noexcept
+             {
+-                completion.set_exception(exception);
++                auto& promise = hnd.promise();
++                if (promise.exception)
++                {
++                    promise.completion.set_exception(promise.exception);
++                }
++                else
++                {
++                    promise.completion.set_value(std::move(promise.value));
++                }
+             }
+-            else
+-            {
+-                completion.set_value(std::move(value));
+-            }
+-            return {};
+-        }
++            void await_resume() const noexcept {}
++        };
++        FinalAwaiter final_suspend() noexcept { return {}; }
+ 
+         void return_value(T val) { value = std::move(val); }
+         void unhandled_exception() { exception = std::current_exception(); }
+@@ -121,18 +129,24 @@ struct Task<void> {
+ 
+         std::suspend_always initial_suspend() noexcept { return {}; } // NOLINT(readability-convert-member-functions-to-static)
+ 
+-        std::suspend_always final_suspend() noexcept
+-        {
+-            if (exception)
++        // See Task<T>: complete the future only once the coroutine is suspended
++        struct FinalAwaiter {
++            bool await_ready() const noexcept { return false; }
++            void await_suspend(std::coroutine_handle<promise_type> hnd) noexcept
+             {
+-                completion.set_exception(exception);
++                auto& promise = hnd.promise();
++                if (promise.exception)
++                {
++                    promise.completion.set_exception(promise.exception);
++                }
++                else
++                {
++                    promise.completion.set_value();
++                }
+             }
+-            else
+-            {
+-                completion.set_value();
+-            }
+-            return {};
+-        }
++            void await_resume() const noexcept {}
++        };
++        FinalAwaiter final_suspend() noexcept { return {}; }
+ 
+         void return_void() {}
+         void unhandled_exception() { exception = std::current_exception(); }
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
index a73508a082..ca728633bb 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.3.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=ma
            file://0001-test-Fix-error-factory-test-for-musl-libc-compatibil.patch \
            file://0002-tests-Use-a-longer-timeout-for-the-large-argument-me.patch \
            file://0003-tests-Relax-the-measured-timeout-bound-in-timeout-te.patch \
+           file://0004-test-complete-awaitable-test-tasks-only-after-final-.patch \
            file://run-ptest"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
