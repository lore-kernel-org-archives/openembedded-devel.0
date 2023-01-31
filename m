Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DC2C6379F
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 01:52:10 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2765.1675129924694740910
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 17:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kIK10ypJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id z1so6049041plg.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 17:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HITAxCK/6N1y04tYRd25Zr7xKUAq6Xbvjv0rB6lMQyc=;
        b=kIK10ypJMGF9JhWZtXUMaPMqbBtwdfJ7vvqs8+pLyrOSKxLlvuYh6h0v5NsVTw6eF3
         ShiBL+6ZW3kITvfLW3dWR/0ohBRUrX9YfpduVKd6VqKZBgBRwllgZBwAWCf0y5f9+pBo
         xhzoAYCcWsY0jQ5jXILWcd8SPp5t6wyLLsgrpOGa43+KmI7e9IMMBjdDoCTgi16ASDNp
         h7ec8D/lwedYCd9tM2uDb/eTzJ+0MJru/ejveWiFZVp/DXkNPOikuZqIgB1c0KCTqHkL
         EYyfIOpsaE2R+mD+b1rzSTCXKV93y1ym+JO0md9r6EBAT4iyS006edEYQCsxC6raYyV1
         otyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HITAxCK/6N1y04tYRd25Zr7xKUAq6Xbvjv0rB6lMQyc=;
        b=q7/GknoaFpVlrk2Zqwgk+RGcSZFS1+62fq8D/9CnaCo8plgnMBeIyAJHcUe6wtuYLd
         maPtctvliso63jTHGccEdg03jTjJtp2FdQa9FAVfBA6iO2z+wfeT41cO9r5aWw7mEOW6
         h7tir8TFxNlqOBiMzXs2/wrJIwIq2vOj1Btl8tZADgUWcVPJ3+mmRMOM6MAUBt0wUl+z
         lGMnN26fz4mEFkX0XjUG0L6p/SeRodKlD7N72V+eDjS4/6yE4RzeKfXKKzOaGnijVJrR
         XFxiAEoPseJXvl2Yk8cm8tbP8/RN76B87dH5W4ko608Hz8D35lqkNLIIbU4wM7C2f78G
         b9eA==
X-Gm-Message-State: AO0yUKUmNoqZOqopJJCv+86HWKMribohX4zm0hZQMs/vzi00CeteZSqL
	zInGuR4j/9JAtaibZCt4ffncJAAMZZagWg==
X-Google-Smtp-Source: AK7set/KLT4BRXNmBswoEA2KCzP0TE5/WzSoeIqHnyirQJCJcPx4xE19bIkm6WUUHLOmq19THTNFWQ==
X-Received: by 2002:a17:90b:4f87:b0:22c:5653:4d2f with SMTP id qe7-20020a17090b4f8700b0022c56534d2fmr11565526pjb.8.1675129923820;
        Mon, 30 Jan 2023 17:52:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id mj8-20020a17090b368800b0021900ba8eeesm10096859pjb.2.2023.01.30.17.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 17:52:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/8] python3-greenlet: Fix build with gcc13
Date: Mon, 30 Jan 2023 17:51:54 -0800
Message-Id: <20230131015200.3862532-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131015200.3862532-1-raj.khem@gmail.com>
References: <20230131015200.3862532-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100863

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Allocator-define-missing-rebind-type.patch | 56 +++++++++++++++++++
 .../python/python3-greenlet_2.0.1.bb          |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-greenlet/0001-PythonAllocator-define-missing-rebind-type.patch

diff --git a/meta-python/recipes-devtools/python/python3-greenlet/0001-PythonAllocator-define-missing-rebind-type.patch b/meta-python/recipes-devtools/python/python3-greenlet/0001-PythonAllocator-define-missing-rebind-type.patch
new file mode 100644
index 0000000000..01092025de
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-greenlet/0001-PythonAllocator-define-missing-rebind-type.patch
@@ -0,0 +1,56 @@
+From 18fb84bb041072503b783ae03c5252f26d2216b8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 29 Jan 2023 21:42:08 -0800
+Subject: [PATCH] PythonAllocator: define missing 'rebind' type
+
+`gcc-13` added an assert to standard headers to make sure custom
+allocators have intended implementation of rebind type instead
+of inherited rebind. gcc change:
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=64c986b49558a7
+
+Without the fix build fails on this week's `gcc-13` as:
+
+| In file included from ../recipe-sysroot/usr/include/c++/13.0.1/ext/alloc_traits.h:34,
+|                  from ../recipe-sysroot/usr/include/c++/13.0.1/bits/basic_string.h:39,
+|                  from ../recipe-sysroot/usr/include/c++/13.0.1/string:54,
+|                  from src/greenlet/greenlet.cpp:10:
+| ../recipe-sysroot/usr/include/c++/13.0.1/bits/alloc_traits.h: In instantiation of 'struct std::__allocator_traits_base::__rebind<greenlet::PythonAllocator<_greenlet*>, _greenlet*, void>':
+| ../recipe-sysroot/usr/include/c++/13.0.1/bits/alloc_traits.h:94:11:   required by substitution of 'template<class _Alloc, class _Up> using std::__alloc_rebind = typename std::__allocator_traits_base::__rebind<_Alloc, _Up>::type [with _Alloc = greenlet::PythonAllocator<_greenlet*>; _Up = _greenlet*]'
+| ../recipe-sysroot/usr/include/c++/13.0.1/bits/alloc_traits.h:228:8:   required by substitution of 'template<class _Alloc> template<class _Tp> using std::allocator_traits< <template-parameter-1-1> >::rebind_alloc = std::__alloc_rebind<_Alloc, _Tp> [with _Tp = _greenlet*; _Alloc = greenlet::PythonAllocator<_greenlet*>]'
+| ../recipe-sysroot/usr/include/c++/13.0.1/ext/alloc_traits.h:126:65:   required from 'struct __gnu_cxx::__alloc_traits<greenlet::PythonAllocator<_greenlet*>, _greenlet*>::rebind<_greenlet*>'
+| ../recipe-sysroot/usr/include/c++/13.0.1/bits/stl_vector.h:88:21:   required from 'struct std::_Vector_base<_greenlet*, greenlet::PythonAllocator<_greenlet*> >'
+| ../recipe-sysroot/usr/include/c++/13.0.1/bits/stl_vector.h:423:11:   required from 'class std::vector<_greenlet*, greenlet::PythonAllocator<_greenlet*> >'
+| src/greenlet/greenlet_thread_state.hpp:115:16:   required from here
+| ../recipe-sysroot/usr/include/c++/13.0.1/bits/alloc_traits.h:70:31: error: static assertion failed: allocator_traits<A>::rebind_alloc<A::value_type> must be A
+|    70 |                         _Tp>::value,
+|       |                               ^~~~~
+| ../recipe-sysroot/usr/include/c++/13.0.1/bits/alloc_traits.h:70:31: note: 'std::integral_constant<bool, false>::value' evaluates to false
+
+The change adds trivial `rebind` definition with expected return type
+and satisfies conversion requirements.
+
+Upstream-Status: Submitted [https://github.com/python-greenlet/greenlet/pull/344]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/greenlet/greenlet_allocator.hpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/greenlet/greenlet_allocator.hpp b/src/greenlet/greenlet_allocator.hpp
+index 666307d..beaa7ed 100644
+--- a/src/greenlet/greenlet_allocator.hpp
++++ b/src/greenlet/greenlet_allocator.hpp
+@@ -32,6 +32,11 @@ namespace greenlet
+ 
+         PythonAllocator() : std::allocator<T>() {}
+ 
++        template <class U> struct rebind
++        {
++            typedef PythonAllocator<U> other;
++        };
++
+         T* allocate(size_t number_objects, const void* UNUSED(hint)=0)
+         {
+             void* p;
+-- 
+2.39.1
+
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
index 4a50a24184..90b5d140d5 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
@@ -4,7 +4,8 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI += "file://0001-greenlet-Drop-using-register-storage-class-keyword.patch"
+SRC_URI += "file://0001-greenlet-Drop-using-register-storage-class-keyword.patch \
+            file://0001-PythonAllocator-define-missing-rebind-type.patch"
 
 SRC_URI[sha256sum] = "42e602564460da0e8ee67cb6d7236363ee5e131aa15943b6670e44e5c2ed0f67"
 
-- 
2.39.1


