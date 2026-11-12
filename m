Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5135.1794450086738436793
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 18:21:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sLiBl0IZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37628596783so3470361eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 18:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794450086; x=1795054886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WdJlqllRFwbY4NTTpvihti2Y6zg7OtqFWbRsLKoNly8=;
        b=sLiBl0IZQvm9JFA2Zm9nzlpED+K+QbUfAE5aMobnPGqsjfEN257dzPMfXXUHv+SkIY
         HxykR2rPpQIv1XTTrTFnDOhME5LZFxqXHulRPNc9c/9DmGUraLc1tiuly6iVQkJi+3Yc
         yn+cIv11zvJqvz5th1TMmXbWoVCGcWJC7CYP4eESmw7TfYzPd+DpB9skZcVBnMtiwOr+
         eVywNZRSR7nSLpesAR3PoZMLd18reu0ciL4CvuZ9jb42zPzdySF4jmidpTZbc5a52sX8
         EiHnmBdi5qtS5kN2tg15jOvKoA+SeFuquSRQq5Z2viO5PJu1KFIw1nqzEvUArjIuoxQW
         2eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794450086; x=1795054886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdJlqllRFwbY4NTTpvihti2Y6zg7OtqFWbRsLKoNly8=;
        b=o/qsfSsGFyP/bPizmRwOkGQ3nBbY/EAdNjd4NYrLx7TqXFV8tJbGsN5Az2l3FxhRXr
         qBFm8ZCss9Tr0Ezg/Fdlr4fMu+4anyi79ViZGuGYsnEGH0tIQT3Jq55/3ifwVp8YpoeQ
         D8Vc90RYm1eww1cG1GnFpQA7aWxGNsvqcjf8I9HAxlJUvFX91n77vfxEJ2SuStLEKbm/
         hYAnABPp4MItkv0JqEmjpl/6wbAr9ew5fvEB8aPYhjLGK2aDF1MGnpBiAmARnk8N3mGG
         RXBV2kqUk3OcJJ2JXckBhmGiU2dOpfOro9RLmyIuRTfq685JJ/g9YsOmFmNLDVNZRXwZ
         C3IQ==
X-Gm-Message-State: APuU4Z//fwgZBtvA+jksnPZo16vUmuoAHlY+j4Zdl7AD9/d0W8uCZRrS
	H+SQkqdylSg6Z5/CZ2yZKUIoxLjXpAskptoyAw8fwHN9WADcTk6PeV/b8VbQrQa9xNQ=
X-Gm-Gg: AYBFou3dBPphEuFnMFJuwCS4NGM8bgxzdAy0SEkspkmk8yM2mStZa8WVsXE5xXs+fhj
	WsvH5XPGLczqkAipFVf9W4d3Q+p0oC5oSeUp/2bMMnz+zcxWylQhoIUjNWLlW0XLyhsfTK+I3va
	IDFnVQVwU18kVaPPtUeHufypIR8nlMU7Ppw8L9klvds6UAkIxOkdPhrLM0AONacIxtyp2esQapb
	3511dEVQgDBdvCl4wD354OOw8cYIbmraDQmdnC7NPlAg1aSVd9/WDMfDygeyWn7QREmif8VKCgk
	hAYjwmrInbtcr2Zflg+WNcWgrfS4mL9joCELaKm1NzPlifq7lWqnTsIEpzNj4sje312+yR1fVWi
	nmI91l6kpGjsKqx7/XyFOBvrwMdgPFnR24F5m61l9EYrYCUgFt1s6flk9VBxgdhXE0s1qWirpJn
	XCtrEdIr/jcJUzWl4fZQ26XYgRzOLoijaF5+vs4NRA3LoEsFY6KpY547kRYrUXSrt4l8kCo7dmE
	vKSeU/2LZvG9ujROBJl3eGapeAdINwJ2NpHQ8XnCzqR1IhycUjxW2hT3zfkWVRK2ZUwkrqX6Ilv
	MfB1cHuzkze6GiUwMnbNUiDPMnIQnQp5bf28lBsi4IqaGNZkpNv+Q5iDSrKsl8hzkIJSzVT0nKt
	eJcb0dJd112y2+38a5WEB869tQRaEFr4f3+lW2XjEz9i6s429+8864iOY6MSrbKzKT84FKMhe6c
	3pZUM4yA/XDxOoylMUxSM5b7NZX2/GF05uULV3Rsj35fqwp8+8d/DnB6zZarEewF0WxXCGLOlB5
	qtdusgg9r4j9fL5tMnWVkCQAW1JeziV0xo93xOZ69WhWZQM9baIpvWqnpQ5ehgRq/HqY8VPs7fx
	Or9w
X-Received: by 2002:a05:701b:2906:b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b3c0341324mr3512921c88.31.1794450085698;
        Wed, 11 Nov 2026 18:21:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm22148612c88.3.2026.11.11.18.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:21:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] bpftool-native: Fix build on arm64 hosts with linux-libc-dev 7.3
Date: Wed, 11 Nov 2026 18:21:18 -0800
Message-ID: <20261112022121.3643745-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 02:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132149
Content-Type: text/plain; charset="utf-8"

Debian 13 now ships linux-libc-dev 7.3, where the arm64 UAPI headers
(asm/ptrace.h, asm/sigcontext.h) use __u128 instead of __uint128_t.
bpftool-native builds against the host headers but puts
tools/include ahead of them, and the 6.16 tools linux/types.h does not
define __u128:

/usr/lib/linux/uapi/arm64/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?

Backport the upstream tools/include/linux/types.h fix that adds the
128-bit types.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../bpftool/bpftool-native_6.16.bb            |  1 +
 ...s.h-Add-128-bit-integer-types-for-ar.patch | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool/0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
index edc635517a..f174414200 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
@@ -12,6 +12,7 @@ inherit native bash-completion
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz \
     file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch \
+    file://0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch \
 "
 SRC_URI[sha256sum] = "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83"

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool/0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch b/meta-oe/recipes-kernel/bpftool/bpftool/0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch
new file mode 100644
index 0000000000..2181274430
--- /dev/null
+++ b/meta-oe/recipes-kernel/bpftool/bpftool/0002-tools-linux-types.h-Add-128-bit-integer-types-for-ar.patch
@@ -0,0 +1,47 @@
+From 10a47fb67340bca274276faf855d7d460afd9a7a Mon Sep 17 00:00:00 2001
+From: Will Deacon <will@kernel.org>
+Date: Fri, 26 Jun 2026 15:17:28 +0100
+Subject: [PATCH] tools: linux/types.h: Add 128-bit integer types for arm64 UAPI
+ structures
+
+The arm64 UAPI exposes some 128-bit integer types to represent things
+such as fpsimd registers in the sigcontext. In preparation for defining
+these using the '__u128' typedef implemented by uapi/linux/types.h, copy
+that typedef over to the private linux/types.h header used by the tools
+directory.
+
+Cc: Arnd Bergmann <arnd@arndb.de>
+Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
+Cc: David Matlack <dmatlack@google.com>
+Signed-off-by: Will Deacon <will@kernel.org>
+
+Debian 13 now ships linux-libc-dev 7.3, whose arm64 asm/ptrace.h and
+asm/sigcontext.h use __u128. bpftool-native picks up
+tools/include/linux/types.h ahead of the host linux/types.h, so the
+build fails on arm64 hosts with "unknown type name '__u128'".
+
+Upstream-Status: Backport [https://git.kernel.org/torvalds/c/10a47fb67340bca274276faf855d7d460afd9a7a]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/include/linux/types.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tools/include/linux/types.h b/tools/include/linux/types.h
+index d41f8a261bce8..b6c473b7920db 100644
+--- a/tools/include/linux/types.h
++++ b/tools/include/linux/types.h
+@@ -23,6 +23,11 @@ typedef enum {
+ 	__GFP_HIGH
+ } gfp_t;
+
++#ifdef __SIZEOF_INT128__
++typedef __signed__ __int128 __s128 __attribute__((aligned(16)));
++typedef unsigned __int128 __u128 __attribute__((aligned(16)));
++#endif
++
+ /*
+  * We define u64 as uint64_t for every architecture
+  * so that we can print it with "%"PRIx64 without getting warnings.
+--
+2.53.0
+
