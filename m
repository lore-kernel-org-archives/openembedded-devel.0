Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E95CCA1004
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 18:43:27 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.15749.1756579401690066044
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Aug 2025 11:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IPCabwic;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-327f8726b95so1407340a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579401; x=1757184201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UsfBObZDOr6jyIX5K2UXkexOJBfgB/9Qasg5b4q+mc=;
        b=IPCabwicalA+RtTTgH7JUwo0E47w4E3KjnB6SQ9kN/W0NkqST3WfvO7pKXkvlcUQQR
         E45sSajkTasn4kSzMgzaSB3mdWDubPjIbLTOfkleqPoF1ijDumfa09KDJFUsiYDIb2Q9
         PIvxfztErxwJdowCbFY/X2aRffNHIB0vRUj2q6l6s0Sc74A9ai8gtUSMim3CSVaMRx+r
         H8YyJ72JN5TABGtdP1vmU9EoLMiDD82LBowxQSEBDZ4qH+1WlC0aEF/0IpcWzRdb5e6T
         bN4PLQUULzwWkBFKFV4hsXqI8ThgFgWiNdRUqqz3PKU1nEgWeENF5IeHkeRKUazPpi9X
         p21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579401; x=1757184201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UsfBObZDOr6jyIX5K2UXkexOJBfgB/9Qasg5b4q+mc=;
        b=ksbPXDH/kdUJS4Ta7bZJAzw2siux5WIkvz/Y2fLQRasIuBiyPdRhgRrXdcVTiNpQpl
         tLlaki8zWlsX9mTXC5UoOjLSXrhd5ipsnp8dCkyh6F7GbxTpd0nqHr+y13Ry+Ghja1UE
         nMFlPVXbMWxiAbInkIlSTdhAapm9thHhZWnbSuWaYncN4m9dYm+V0gAfudHrYmMRZ7FS
         VlX6mzcLFIOUp67yhEvbppyxBYRqOHpbK2CC8T69h2Dl7bMtvTxsQYH7/6MLD8Xi21LT
         v8pyuQTDwKqsMPcF01n59OEZJPUPwLa/In7CclT8yLMBevBZdQAbhOTAwN287Aa4/JQK
         X88A==
X-Gm-Message-State: AOJu0Yxx+KQqrEKks7lThmHQAvmWnMkKVG1dGAfywUEOclK0AhzcpCwU
	h/KvrclkTMlD9YJbh52MpQ5Gx/Ul9P2vTHgeZck3W7EzTAyf3v5Lm8MHACkIn3eZ
X-Gm-Gg: ASbGncsJMPs/h3YWdXlcezM69OPDB9ej7n48UfSYgg36HeN0neyg8rb8JVAjkpn7ODa
	+6OTQk8b6ztFqObl2hKf/XQVs/7VXcU3vANrVc+9mhFwwLty+xjE1WwY4M7OdakQVw5aBIe3aiK
	LzkaUzU6jrbE4DHe7ztQGsWu4XbzxEcQ+g9loxcTaR6zKlDswTpdyQoiNwxxlPyehqLg4rvQhGt
	7x8PuoycIiXW/IFuYM4RfhjIova3urSW22yzK3KtBbXDHDLXIPUVjfkfsGdnsdoo9+h+5QhROAT
	wzdbso18M+aMsoQJXQlijJTbWMZcsutaAVDV6MsMb+BdTwE2QJmbcvsTHcZMt0qbpbic55vqTnx
	hoOiiJyUonxo5LTl+zdEwtfokNQ/Mv6wGRin0QBsZSBtTJRU0pWY+iBBIPirTZNsIKWTlTZU3L7
	iSZ91Gu0kh8d2HANpxlyKQSIJ+2hQQauYKdZv3CAwcdTFwDh304ds=
X-Google-Smtp-Source: AGHT+IFwRkgoR5VCfz397DLOybVy1koNzMKimcGG1Uei84uvGQtwvu/q0dFxpG1celwfHATKdXuQig==
X-Received: by 2002:a17:90b:3d4d:b0:327:be20:cd8a with SMTP id 98e67ed59e1d1-3280d381b25mr4687837a91.17.1756579400734;
        Sat, 30 Aug 2025 11:43:20 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d9330b73sm6462091a91.4.2025.08.30.11.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/8] minifi-cpp: Include cstdlib in fmt for free/malloc
Date: Sat, 30 Aug 2025 11:43:08 -0700
Message-ID: <20250830184311.1018374-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830184311.1018374-1-raj.khem@gmail.com>
References: <20250830184311.1018374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Aug 2025 18:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119148

This helps in compiling with clang-21

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Add-missing-include-for-malloc-free.patch | 38 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.99.1.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-include-for-malloc-free.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-include-for-malloc-free.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-include-for-malloc-free.patch
new file mode 100644
index 0000000000..e844bf9b7d
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-include-for-malloc-free.patch
@@ -0,0 +1,38 @@
+From f01a1ae37d3e502a900b5a6cfa5be217003cf7d4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Aug 2025 21:46:26 -0700
+Subject: [PATCH] Add missing include for malloc/free
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/fmt/format.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/include/fmt/format.h b/include/fmt/format.h
+index 287e7163..0412812f 100644
+--- a/include/fmt/format.h
++++ b/include/fmt/format.h
+@@ -44,6 +44,7 @@
+ #  include <cmath>    // std::signbit
+ #  include <cstddef>  // std::byte
+ #  include <cstdint>  // uint32_t
++#  include <cstdlib>  // std::malloc, std::free
+ #  include <cstring>  // std::memcpy
+ #  include <limits>   // std::numeric_limits
+ #  include <new>      // std::bad_alloc
+@@ -744,12 +745,12 @@ template <typename T> struct allocator {
+ 
+   T* allocate(size_t n) {
+     FMT_ASSERT(n <= max_value<size_t>() / sizeof(T), "");
+-    T* p = static_cast<T*>(malloc(n * sizeof(T)));
++    T* p = static_cast<T*>(std::malloc(n * sizeof(T)));
+     if (!p) FMT_THROW(std::bad_alloc());
+     return p;
+   }
+ 
+-  void deallocate(T* p, size_t) { free(p); }
++  void deallocate(T* p, size_t) { std::free(p); }
+ };
+ 
+ }  // namespace detail
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
index 16dc46275a..0d9a503793 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;protocol=https;branch=mai
            file://0006-CMakeLists.txt-do-not-use-ccache.patch \
            file://0007-libsodium-aarch64-set-compiler-attributes-after-including-arm_.patch \
            file://0008-MINIFICPP-2553-CMP0065-OLD-removed-in-cmake-4.0-remo.patch \
+           file://0001-Add-missing-include-for-malloc-free.patch;patchdir=thirdparty/fmt-src \
            file://systemd-volatile.conf \
            file://sysvinit-volatile.conf \
           "

