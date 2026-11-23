Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48528.1795411855073987586
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fj+5WhGH;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3b4944a0eso1953209c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411854; x=1796016654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkqUYORbmUDeDpuBPdQSTunblUR4wo3niUmGnQmKlKA=;
        b=fj+5WhGHl7MP0EK7bLq8BqmfvEFEe+ea9pGU3CvmPH7Pi4f4IcPpkpUmr0krdfSBJ8
         JZ7HY+E2YB0a1jV6Ck6nOL90u6X0As9X6R8lxD5FnTDMvrrCfG9jodoDh+wie5fkjZOt
         N1BVi4XepdDAqnoJ8zb0gHMIoynfNQDH4jxPYEyJBqa/VAGAv/7IviMGD2Bcup6eNZQe
         ReB+BYe7MR3XilXqP1xRDWnB2nA7V1Ls4bZqmxq1Apxskh6BF/8m5/RqOFtI3jZIh1Xu
         Il6q8XH6QdNixF+bWdtJg5/zh1UGhMYbFMX84OmRbqn+IANb7LjeNuHI9n2YdMR6toC5
         w9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411854; x=1796016654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkqUYORbmUDeDpuBPdQSTunblUR4wo3niUmGnQmKlKA=;
        b=rQdfinMpn1CUgtAMbPvC5BQi9ng/ep54RPVpOQvqZTnwC8UDjLS/PTZDmmeEYrRYMS
         6cQZjxekdp5tHQHzJKpLipKW08+WqhHz05rvK3LjQcflfD/FFlzfSUlTXDegKKAeSSmc
         btB92KVcEFqoZ8iSRukWWbyMwEDcTShMil2LprJZjohUL2SgeNGTV1jfe05x346yNc+j
         HmH0ut8RptgergVQh8PfRl0Rz4SQyj7CzK3SDpoGBqXsVivwpvXzAZ4t0A6Pgl4sxF3S
         N8raiG3MTHESoVnNn1p+raby4D0UllkbkQ9zLrNhjsJZSAOuP66aZnMxRKekEEZIGoSG
         O/nQ==
X-Gm-Message-State: APuU4Z+1UUGX9Ar9U1i8Q/n2QY4Pvo+C1EGa1VuQaY3NjZ/EdxsTT/Sh
	K5O5sMeCHt0QaiGyQChyjuT5EtkJcbn1IT7Jzb5GTVNFVtyx0xEvZBHQAlLMRM7FwTY=
X-Gm-Gg: AZFdTZfP1zZ3jQQXbRJoGaKMBZ0fzvGSaNF5QfKerXlDYMtxk41B27OebvM207G+sFj
	P060bL1c6kWWdewlzI1O+/5K+9pfV/XmQYBCEoU8MTippaEyxvOr5OHzYveYohFPDz2mbRgzAlw
	rCR2q3wF3f8o2nS+J9SWYeBbzypZ0++Qc5GiDxouQX1K4CcwzfpmZ34nvtZDzHoF7pgJo9P5MX2
	jAtTPbkTm2aEHAQVAQsP9v5MNoULw3NUPiwPxFb30qk7N36JPyyd2lbBKLslBX8RIGZNZ5koKlC
	Qlm3lmNrV5qpvPZw69zZ1k/sfJo24U8XIDZSa0qRXBbFwKvBGPaCEIBJy9y/6tsp8hcDWpAqUix
	nZ8Vt4G5Vd9S3enItY26r8uEja+jRTt41SFO7fBE0dsFxR6R9C3FZ0mkbuJeXSG/wzKOLqbgUSB
	5konQ6NRk9HaQsVLGfn5v4AKrfHhm/QxvOaD9wDGfeJJLerWF9rv8MfMUeV8vJ6pkAWf5iCSqKn
	F/datklfSamcHk4RJylGeiFhqOb9QlEjqtGDj4bN/yblexamCJD8Gr1/CTmvEX56uLcJuF0hlGp
	YlZ3wvBH01WjGGDG41Bbt8Bz51tNvcgFKWugBvr/EpKCtDhu8De4N1X10ImoksxNjQl1x/XjGKo
	gyoG8p8lQbDCAjpo7LO/wnvTlAC2aY9426ZA8SlRCi7TwNbVCKrMUBcamcuJIEA4A3tNyctkwgs
	zEw9zuN8AZ8IHYM6YnUz+Bn/cGoaD+ky4KuAVClv5F2AQqSxzpngzLCMd//uQTD/sWXinFlutLp
	uH80a2bvn7hTX3fA0P9CQ+S8OycSU//44BzKx9BGnwFQE2hyNPzcsHlJtTE35lXIfgqLIGhSBxp
	XC8k
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr13096162eec.14.1795411854318;
        Sun, 22 Nov 2026 21:30:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 20/42] libcbor: upgrade 0.14.0 -> 0.15.0
Date: Sun, 22 Nov 2026 21:29:04 -0800
Message-ID: <20261123052953.3658549-48-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132835
Content-Type: text/plain; charset="utf-8"

- Security (0.14.1): fix cbor_stream_decode string length bounds
  checks (GHSA-frh9-3gqx-pqg2, GHSA-pj89-8hch-p7vp)
- cbor_load no longer preallocates huge declared arrays/maps beyond
  what the input can hold; decoding is iterative, so nesting no longer
  uses native stack
- ABI break: cbor_incref/cbor_decref are now static inline and no
  longer exported; _cbor_map_add_key/_value are no longer exported
- Behaviour changes: all well-formed simple values are decoded (new
  simple_value callback), NaN payloads are preserved on encode, and
  empty items return NULL handles
- Fix cbor_encode_half for out-of-range values; no longer links libm
- New CBOR_TAG_* constants for RFC 8949 tags

The LICENSE.md change is only the copyright year.

License-Update: copyright year updated in LICENSE.md
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libcbor/{libcbor_0.14.0.bb => libcbor_0.15.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libcbor/{libcbor_0.14.0.bb => libcbor_0.15.0.bb} (72%)

diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.14.0.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.15.0.bb
similarity index 72%
rename from meta-oe/recipes-extended/libcbor/libcbor_0.14.0.bb
rename to meta-oe/recipes-extended/libcbor/libcbor_0.15.0.bb
index 7d65688384..7789c9d871 100755
--- a/meta-oe/recipes-extended/libcbor/libcbor_0.14.0.bb
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.15.0.bb
@@ -2,11 +2,11 @@ SUMMARY = "library for CBOR"
 DESCRIPTION = "C library for parsing and generating CBOR, the general-purpose schema-less binary data format."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=53e9bdfc4dfb4dfe40cd444d3554000b"
 
 SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "6730c20ab487c0b4dc5fb3fea918937085355bac"
+SRCREV = "cf5bd4bd293ce730b9455fa9cd822166c3dc4599"
 
 inherit cmake
 
