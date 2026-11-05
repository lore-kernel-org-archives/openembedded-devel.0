Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32574.1793879732217346407
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=k3tkpWIA;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4923176309dso29178f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879730; x=1794484530; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0gBbv8aI3mi+vLi1o2vSS7B5V55V5fabTXJf0AzcTA=;
        b=k3tkpWIAghdrpDkPJKiRTDxIZ8BMs7XZVHh7GCjap3kQ4akAuc/JBAz6HpAa4N5o6Z
         +/4Ba2je+haMNikH4FZ6p6+LqHEVvVZAgOxIn4xfi92S4QUEA3zVBBpEeVWfNoSaJ9UE
         VB5q+Ugf+oQX6QDTyMPvCkZC49B9/NYfSj/8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879730; x=1794484530;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0gBbv8aI3mi+vLi1o2vSS7B5V55V5fabTXJf0AzcTA=;
        b=AEsyb3t8udrXuxy5SDMgzcBHVv1XWJzEeD7DjYmsI8Om0Eo0b4lp52J+IIvPjQst6L
         eW71OMt/1nJ5iN11Nh6U7P+3WUyi2j67X1ZxsEw4xcjjmd0YTKm5gL2evv+OAUGEPtC6
         /G292JaX7SvTdruKVKH8Ut735RkSKJqcgsOGhrAQ6kjr1dJ3enint/4/QRroikjN/vb2
         F5LdhtxHi4INMIDV/5eeyH/N8Ke7px4GWtFAAzNqCfFQW6b7Ix6df/HDLDftTtnxaTcv
         u1NqwVdCwfU33Ejx2wRHyTa2Le+pDBIib7yeciFYhfuL7s3vT2nY9GlN7Vz24awwn0we
         wMDg==
X-Gm-Message-State: APuU4Z9mDD+s91Wx5xY5ptRycnvndoo51oqWdwzLSlF9k+R41+OR7V+g
	e3liyTfTEjK9S0lvy/79E9NuQLinMN9tC8684QMM76eljdlXg4DAeiZq3R/U5yPhP/aQkgHIzcd
	zWyqO
X-Gm-Gg: AYBFou0QmfjK/nuQUsD9YzAdA6DpwRL+PXKF/PoOEUsQeezfDCab4PJeHe+O+Tdr0zq
	tWmfPlp4UbhOLO1doSfcMfGHjx1/kHEvw3AQisCkH1ekRFyoxjEk9k6YJSk/YWzfndNKw7f+jp+
	uaPTqqISvwiv43njG6MeOHmcRkiYiSTPtarmZ3H86VAyU8JZ4diTnWWQM7pL1e4j8o21vZVZ6CO
	2/j/uT0sZvKCtkZyz/AFnEti52jfNtG1Quz/CwLdgvI4b6g/JCRgZfUDIZ7/bvtkZuAWfn+K7Aj
	xxsZ3rruDhwBkdqvsiWfxGfkmRKWsiD+z9U90S4qv4r3iO+GCrVK0EeNXG1/fPkjjYaBblmvDjU
	YtWjnreZTFKPdCbf92hWG/Rlg7pxFId3Kr8NX3mp1ULwzoXle8YMi3PgP54HpXm/qYZhuPEjZ8c
	rgrW5MAlZBtGQPxeGtfGp/8nAfC27D6eSo0E11kafXTkGrqI6ql4afKHm2KK/BPseuaIGmIlohS
	8GBx/PIc8N5rrFa1U2KZQlpnXY7MV+nKy6oUmigUfn3Vh0crk7oOfJD0mmlauqC80ky1NgBidyi
	13udVsR1xAHlSoPux8v7Lg0l0B6w3brDUeddidDGRlHg/2ljcCF29i448bSxTzQ/tAPPZqU4RUl
	4KMay0aIjNISEmoZF2xITTT7sgHatid7Nnz7TzWI9/XbvhO0MInH6cw==
X-Received: by 2002:a05:600c:6087:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4ac17753befmr406323755e9.15.1793879730212;
        Thu, 05 Nov 2026 03:55:30 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:29 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/19] python3-autobahn: Upgrade 26.10.2 -> 26.11.1
Date: Thu,  5 Nov 2026 13:55:09 +0200
Message-ID: <20261105115526.634289-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131902
Content-Type: text/plain; charset="utf-8"

Upgrade to release 26.11.1:

- Security: parse the HTTP headers of the WebSocket opening
  handshake strictly (RFC 9112, RFC 9110). The header block was
  split with str.splitlines(), which also splits on VT, FF, FS, GS,
  RS, NEL and on a bare CR or LF, so a peer could make autobahn see
  header lines that a front proxy treats as part of a header value,
  for example an X-Forwarded-For used with trustXForwardedFor.
  Lines are now separated by CRLF only. ⚠ behaviour change — a
  header block with a bare CR or LF, obs-fold, whitespace before
  the colon, an invalid header name, a header line without a colon
  (was skipped), or a control character in a header value or the
  status line is rejected: the server fails the handshake with HTTP
  400, the client fails the handshake or the proxy CONNECT. A bare
  LF is rejected deliberately, although RFC 9112 allows accepting
  it as a line end. obs-text (0x80-0xFF) in header values is still
  allowed, and header values are trimmed of SP and HTAB only. This
  fixes advisory GHSA-2gqc-mwv3-66rp

- Security: raise the floors of the compress extra (and so all)
  to brotli>=1.2.1 (CPython) and brotlicffi>=1.2.1.0 (PyPy), the
  releases with the fix for CVE-2026-111497, an out-of-bounds write
  in the brotli decoder that permits remote code execution.
  permessage-brotli decodes data sent by the WebSocket peer; it is
  not used unless an application offers or accepts it. The brotli
  1.0.10 and 1.1.1 backports of the fix are not enough, since the
  permessage-brotli receive path needs the decompression limit of
  brotli 1.2. New tests check the declared floors and the installed
  version

- Add tests for the HTTP header parsing of the WebSocket opening
  handshake, on the server, the client and the explicit proxy
  CONNECT, run on Twisted and asyncio

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...0001-Skip-march-guessing-for-external-cross-toolchains.patch | 2 +-
 ...{python3-autobahn_26.10.2.bb => python3-autobahn_26.11.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_26.10.2.bb => python3-autobahn_26.11.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch b/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
index 7573b1f5a6..a5e1b0928b 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
+++ b/meta-python/recipes-devtools/python/python3-autobahn/0001-Skip-march-guessing-for-external-cross-toolchains.patch
@@ -1,4 +1,4 @@
-From bfcf66157dab06a8f4f718cc0016e799f6b9e284 Mon Sep 17 00:00:00 2001
+From 77c79aa0e048e4bea40eb794a623c36ff1ec3fbc Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 20 Jul 2026 15:52:32 +0300
 Subject: [PATCH] Skip -march guessing for external cross toolchains
diff --git a/meta-python/recipes-devtools/python/python3-autobahn_26.10.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_26.11.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-autobahn_26.10.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_26.11.1.bb
index 03ea85111f..681f46e5b2 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_26.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_26.11.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=49165a577911c4178e915dc26e2802a3"
 
 SRC_URI += "file://0001-Skip-march-guessing-for-external-cross-toolchains.patch"
 
-SRC_URI[sha256sum] = "6c69fca89106567060941c5568e67a5369738813d883db4e3d62b76f0a2c497e"
+SRC_URI[sha256sum] = "1a081ca27ad5a0a04d3c7ca07b2caa6d324b8004383e36ae6eede1d5053e23b0"
 
 CVE_PRODUCT = "autobahn"
 
-- 
2.47.3

