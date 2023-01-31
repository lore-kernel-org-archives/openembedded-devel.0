Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99850C63797
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 01:52:10 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.2805.1675129924315990764
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 17:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jEd6hEuy;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id v23so13597656plo.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 17:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/d4U4hyYz3XRLqM47aLor6IgViFrFvo6TIiSckujmj4=;
        b=jEd6hEuy1+D80GlkmO1jRkM/OIT0x4HuyH4BjEy69/gk6ISIZMbWsRyyBzPwsAqoAs
         N2LqTw85W4sGKvjq00a39nRsLIfaeg7IOziizvMorB6UNnV95wQ+3p3ssw7pFEHQbTOV
         wbYNbT9EDJRzYCiyvI6gqe+42N9yVRs8bAkYlA6dynDNdvhgcIbpi9Xhs4BdsHqMe3by
         +jZv5hrmyoM//MgZQhaQAiwa4pxUqx9pvPKVSrDFJDZzVqUErIZ5XSpwbfZbPsjuuw04
         LhiqkC/2pcPencb5mduQ4Add1MiwnI3O4eXj2RqHQ0zEj5xiIkMgHf9Lcraek9v8inf5
         ixCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/d4U4hyYz3XRLqM47aLor6IgViFrFvo6TIiSckujmj4=;
        b=lyu3+rOScgu5O8qiNSjSg55wXZOsMDHd87oqJDubDTGRZZFckkOKA5rBRSdFy5aqJA
         +Ec2zvK3McJXPc1T09zkm16sbwwxWqn4fiZ/oaDUl4AMlvD+3yl/0yKD2da/hUu3W5X4
         fQqLAzUU5/OUeRTmvGN+dbFOm3N6dnnIaQwn++7W7Mz/yUAgPrFV89YP0VN5WdGdzll2
         qqx0XuWnniwWoomFvcV5porRu97t0tS/bYeA3mOln28ujgYTRrozMNgMi+UPwIsSIKJ9
         cPeERczepDak1LYYnOzllOwhG0q3TtYw4+fAcYAfe4u/3iqL5r3/SqBkuDXr/9OT5Tvu
         AHzQ==
X-Gm-Message-State: AFqh2kryUATTAvme6dT/ZiXdsoexcWR1CwpZ8Ra6JkPCLHboO3f3Hw8I
	ejfCRYDV7fOR8cSacZur9/YDrJT8DtcMzg==
X-Google-Smtp-Source: AMrXdXtdTve6oai6yR8UcoahfH0dDoGh38NVRL99SSeG1HnopkMXJVTPD1eYgtSKb38atUiCrLh3TQ==
X-Received: by 2002:a17:90a:4587:b0:229:bc1:7cd1 with SMTP id v7-20020a17090a458700b002290bc17cd1mr55623634pjg.33.1675129923069;
        Mon, 30 Jan 2023 17:52:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id mj8-20020a17090b368800b0021900ba8eeesm10096859pjb.2.2023.01.30.17.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 17:52:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/8] zeromq: Fix build with gcc13
Date: Mon, 30 Jan 2023 17:51:53 -0800
Message-Id: <20230131015200.3862532-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100862

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cator.hpp-define-missing-rebind-type.patch | 64 +++++++++++++++++++
 .../zeromq/zeromq_4.3.4.bb                    |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zeromq/files/0001-src-secure_allocator.hpp-define-missing-rebind-type.patch

diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-src-secure_allocator.hpp-define-missing-rebind-type.patch b/meta-oe/recipes-connectivity/zeromq/files/0001-src-secure_allocator.hpp-define-missing-rebind-type.patch
new file mode 100644
index 0000000000..d32190818b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zeromq/files/0001-src-secure_allocator.hpp-define-missing-rebind-type.patch
@@ -0,0 +1,64 @@
+From 66e72389cc90625ed74e8ba1ea3a65234bdb06b5 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Tue, 20 Dec 2022 21:45:16 +0000
+Subject: [PATCH] src/secure_allocator.hpp: define missing 'rebind' type
+
+`gcc-13` added an assert to standard headers to make sure custom
+allocators have intended implementation of rebind type instead
+of inherited rebind. gcc change:
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=64c986b49558a7
+
+Without the fix build fails on this week's `gcc-13` as:
+
+    [ 92%] Building CXX object tests/CMakeFiles/test_security_curve.dir/test_security_curve.cpp.o
+    In file included from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/ext/alloc_traits.h:34,
+                     from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_uninitialized.h:64,
+                     from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/memory:69,
+                     from tests/../src/secure_allocator.hpp:42,
+                     from tests/../src/curve_client_tools.hpp:49,
+                     from tests/test_security_curve.cpp:53:
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h: In instantiation of 'struct std::__allocator_traits_base::__rebind<zmq::secure_allocator_t<unsigned char>, unsigned char, void>':
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:94:11:   required by substitution of 'template<class _Alloc, class _Up> using std::__alloc_rebind = typename std::__allocator_traits_base::__rebind<_Alloc, _Up>::type [with _Alloc = zmq::secure_allocator_t<unsigned char>; _Up = unsigned char]'
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:228:8:   required by substitution of 'template<class _Alloc> template<class _Tp> using std::allocator_traits< <template-parameter-1-1> >::rebind_alloc = std::__alloc_rebind<_Alloc, _Tp> [with _Tp = unsigned char; _Alloc = zmq::secure_allocator_t<unsigned char>]'
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/ext/alloc_traits.h:126:65:   required from 'struct __gnu_cxx::__alloc_traits<zmq::secure_allocator_t<unsigned char>, unsigned char>::rebind<unsigned char>'
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_vector.h:88:21:   required from 'struct std::_Vector_base<unsigned char, zmq::secure_allocator_t<unsigned char> >'
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_vector.h:423:11:   required from 'class std::vector<unsigned char, zmq::secure_allocator_t<unsigned char> >'
+    tests/../src/curve_client_tools.hpp:64:76:   required from here
+    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:70:31: error: static assertion failed: allocator_traits<A>::rebind_alloc<A::value_type> must be A
+       70 |                         _Tp>::value,
+          |                               ^~~~~
+
+The change adds trivial `rebind` definition with expected return type
+and satisfies conversion requirements.
+
+Upstream-Status: Backport [https://github.com/zeromq/libzmq/commit/438d5d88]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/secure_allocator.hpp | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/src/secure_allocator.hpp b/src/secure_allocator.hpp
+index 0d37e7ed..5b8de9e2 100644
+--- a/src/secure_allocator.hpp
++++ b/src/secure_allocator.hpp
+@@ -95,6 +95,17 @@ bool operator!= (const secure_allocator_t<T> &, const secure_allocator_t<U> &)
+ #else
+ template <typename T> struct secure_allocator_t : std::allocator<T>
+ {
++    secure_allocator_t () ZMQ_DEFAULT;
++
++    template <class U>
++    secure_allocator_t (const secure_allocator_t<U> &) ZMQ_NOEXCEPT
++    {
++    }
++
++    template <class U> struct rebind
++    {
++        typedef secure_allocator_t<U> other;
++    };
+ };
+ #endif
+ }
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
index 697bc47137..bf25d56ee9 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
@@ -8,6 +8,7 @@ PACKAGECONFIG[libsodium] = "-DWITH_LIBSODIUM=ON,-DWITH_LIBSODIUM=OFF, libsodium"
 
 SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
     file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch \
+    file://0001-src-secure_allocator.hpp-define-missing-rebind-type.patch \
     file://run-ptest \
 "
 SRC_URI[md5sum] = "c897d4005a3f0b8276b00b7921412379"
-- 
2.39.1


