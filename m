Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1650.1792738443925774425
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fsDNfyHX;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a058f74a54so217911b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738443; x=1793343243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUNjnEBu9ZY/7mFSzKlt6mg9z3xmIa+2hccMBoLTOUk=;
        b=fsDNfyHXlWWzDopz5G6NMtFme2j2QauNUAWr0I4Zen5gxYSr+2F/veJ25z7Z8vC517
         OyNMSNs1kMS9t8t49L4EAo4gU1/HE1nuE+CeDt+5Lo8sj+duhInvFTHBqG93vqcS91As
         d/GPWE+TCsDw33JIDqYxsoiyLe0xHjUffAuJcvRY1YZZvYWT0rgUbN+6yXv0fXbE12bm
         pYGnPbQ70lzcO5sD14xJkYnkq8ZpX/ThwziektQJS6GIdOLwU6KA5B6/j/Tz2Qd9r236
         AoT/e45R9KvXUsv15zJT4S8r+KMbdRNo+N2DJifH7FUZ7e3KD91gcb7GZsXMQzS7Dcu9
         FHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738443; x=1793343243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zUNjnEBu9ZY/7mFSzKlt6mg9z3xmIa+2hccMBoLTOUk=;
        b=A/cK3gUy205c9GKARTcmoEFFuUr5h3ozIcrLConYCaCs+6Gjpvr9ZOhnN5AnImQAuP
         JSdS0LXXUAHRI0U1hFkz5yJOirPbVR+EX+n+d6GBIyFLXH7OcTVv/4aQs4/8gpaMzb5V
         TEIvT4o4og2T2ZmQ9iXAGdgOfkRqiOIDtw8kVkLLdN8SJxWMWi2LXKsB9x6w+FC8DnIf
         nxKh0rgWb0d2fgRRAsParMblEWgJaJmeRofmmFjdWac8GVo0Oc8jR7tbVDSMIoEeiOAI
         yAmpELvsY4OcP+PtnXMXJbi2OJ7A5pQgGmJaZyRaLIgpBM17k0LrVF+iv4MjuQfkapUl
         f5kw==
X-Gm-Message-State: AFq9FYL32LbSbEdTrz12nM7Ur9spaHjWkQcgVGEdUFdSbehtJqTHkoaF
	k8gb1Phxfp9zgZQJKqZNo/iHGglG2MFwOpx06t62E2r4n11xQFaIsRRvKNGcPMwM8Dw=
X-Gm-Gg: AYBFou2WOz10ZlYe2SRYqZcJ6tbqxFfbQrqsVSWi8XiKAw0mfROwsPAiiBqAsWF3gug
	C/nkh9lvKCyC/FSis56vmCB8Q78lQkSaMQ4SxGyz/8GOdA99F7i6KrnmWAgURbWgUKGu4wN1d8m
	U7E8L50QHQYrUQnJoM0Nxd9BL1Tfv5kSzuvJbdAPDvGigaaBqrs9s22zNmxA8/UkcDriKbGHF0Y
	YCDRSdb9Lzhenu8J8SF6W3AcLZpR2y3DjXgODXANGADExMnhuNbJaojVdxevr7iKzbCObLlsIiL
	QTigLjh2hsfHey9tA7BHqWYn87PV8rY9ONlMp5kIeRvbHYcK5G4gz9L2EJZuKbYVmDwmwDzSS5I
	DOYGneddtWFHz5GIcv1Fvj6/t6yjezyjgwFbpvvJrYD6Jloi4HEFpCBSCd33xeYC2ZUhOqMOE6n
	k5wlJI1JYf4YWlBawN5bbOQ7BKqJLgpd5PhXbpATadErXa98Be4NtxXIDyh1w4WNNJRJawKab6h
	6dI8BtRDQmwvQ2qjGoiBk3G7zvz9IEGqYqj8lTzBMj0TFqBTt7ukZeOfDIX/kXeTEzONVVOLo9F
	VnEWvmJquFFWbCwGg73KHOwW8qeuW2F1MLWU7sEYVYjycl03BGnPCTOMxj/NokeXnCenqXVhs/5
	OBcN0wCgUM4/GJStMY7+f20D5pVlZLQat6qWEK7A0/KL4KHZ/iZYejsEMfuSMpQfLJaZzbHnF+n
	9zhl9xKLY/6aLt8pmfukdC4jJRZUpel8/1/BIyZn/NIJ3R7A2LtBoVuSGp/xCBg6CNcapsQZ7fQ
	Kydg2D9mvev7L3yFJ3rlEtMmmiHr1A=
X-Received: by 2002:a05:6a00:2192:b0:899:74d0:8a72 with SMTP id d2e1a72fcca58-8a2c62984famr1350415b3a.59.1792738443157;
        Thu, 22 Oct 2026 23:54:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 08/29] ngtcp2: Fix example server build on 32-bit targets
Date: Thu, 22 Oct 2026 23:53:29 -0700
Message-ID: <20261023065350.3228996-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131332
Content-Type: text/plain; charset="utf-8"

The example server keeps the file size in a uint64_t and uses it as the
size of a std::span, which clang rejects as narrowing on targets with a
32-bit size_t, such as riscv32:

  examples/server.cc:236:54: error: non-constant-expression cannot be
  narrowed from type 'uint64_t' (aka 'unsigned long long') to
  'size_type' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]

Add a patch that stores the length as a size_t and rejects files too
large to map instead of truncating their size.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Do-not-truncate-file-sizes-on-32-bit.patch | 63 +++++++++++++++++++
 .../recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb |  4 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/ngtcp2/ngtcp2/0001-examples-server-Do-not-truncate-file-sizes-on-32-bit.patch

diff --git a/meta-networking/recipes-protocols/ngtcp2/ngtcp2/0001-examples-server-Do-not-truncate-file-sizes-on-32-bit.patch b/meta-networking/recipes-protocols/ngtcp2/ngtcp2/0001-examples-server-Do-not-truncate-file-sizes-on-32-bit.patch
new file mode 100644
index 0000000000..746663dc20
--- /dev/null
+++ b/meta-networking/recipes-protocols/ngtcp2/ngtcp2/0001-examples-server-Do-not-truncate-file-sizes-on-32-bit.patch
@@ -0,0 +1,63 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 09:00:00 -0700
+Subject: [PATCH] examples/server: Do not truncate file sizes on 32-bit
+ targets
+
+FileEntry::len is a uint64_t, but it is used for mmap() and as the size
+of the resp_data std::span, both of which take a size_t. On targets
+where size_t is 32 bits, such as riscv32, clang rejects the narrowing in
+the span initializer:
+
+  examples/server.cc:236:54: error: non-constant-expression cannot be
+  narrowed from type 'uint64_t' (aka 'unsigned long long') to
+  'size_type' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
+
+The value is already truncated earlier, where st_size is cast to size_t
+before mmap(), so a file larger than the address space would be served
+with the wrong length.
+
+Store the length as a size_t, and fail open_file() with
+Error::INTEGER_OVERFLOW when the file is too large to map, instead of
+truncating its size.
+
+Upstream-Status: Submitted [https://github.com/ngtcp2/ngtcp2/pull/2330]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ examples/server.cc | 7 +++++++
+ examples/server.h  | 2 +-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+--- a/examples/server.cc
++++ b/examples/server.cc
+@@ -31,6 +31,8 @@
+ #include <memory>
+ #include <fstream>
+ #include <iomanip>
++#include <limits>
++#include <utility>
+
+ #include <unistd.h>
+ #include <getopt.h>
+@@ -216,6 +218,11 @@
+     close(fd);
+   } else {
+     fe.fd = fd;
++    // A file larger than the address space cannot be mapped.
++    if (std::cmp_greater(st.st_size, std::numeric_limits<size_t>::max())) {
++      close(fd);
++      return std::unexpected{Error::INTEGER_OVERFLOW};
++    }
+     fe.len = static_cast<size_t>(st.st_size);
+     if (fe.len) {
+       fe.map = mmap(nullptr, fe.len, PROT_READ, MAP_SHARED, fd, 0);
+--- a/examples/server.h
++++ b/examples/server.h
+@@ -68,7 +68,7 @@
+ };
+
+ struct FileEntry {
+-  uint64_t len{};
++  size_t len{};
+   void *map{};
+   int fd{};
+   uint8_t flags{};
diff --git a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb
index 2f91ec9318..a9d834a1b2 100644
--- a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb
+++ b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.25.0.bb
@@ -4,7 +4,9 @@ BUGTRACKER = "https://github.com/ngtcp2/ngtcp2/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de0966c8ff4f62661a3da92967a75434"

-SRC_URI = "gitsm://github.com/ngtcp2/ngtcp2;protocol=https;branch=main;tag=v${PV}"
+SRC_URI = "gitsm://github.com/ngtcp2/ngtcp2;protocol=https;branch=main;tag=v${PV} \
+           file://0001-examples-server-Do-not-truncate-file-sizes-on-32-bit.patch \
+           "
 SRCREV = "f9e9ff01ad2c8116bc09de4f644b0028a61486a6"

 DEPENDS = "brotli libev nghttp3"
