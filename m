Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22.1794851776682801621
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wXhy5s9b;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3791619605cso7088733eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851776; x=1795456576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsnQy5fqIXNLR9tsdrWZG0cYE6pM/X7oNPahxbvwyJc=;
        b=wXhy5s9bDVk8nnXzL45jHTUqi5dU7TXqRwu68OUewTbkFXUIwwgL75srnQ8AVpOeON
         3g5kJf/3UckxmZWLNcvKaVfReONUuekQlCld8Kv/f4/G7yOZP5yNqMiSkqKalMPr1Int
         LWNMCc/g0h/TBO39LmqNgrtIwKoYQCuOsnGq1MJ1T/RJq85asWAX1y3CoVVjfLXXaeke
         RlkxTnq9klk9lSnXGlk6sEEvLik9HhJGM0bMKOCGR9tSB1EJ/D3kS4o1w7nWInfefp+R
         setvQjfYVOcv7HNUBXFAFuTlqz9xA9sF9YlMxuRg4wTewQPZiBSm44Nq0fhMzm9x4e3/
         T/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851776; x=1795456576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OsnQy5fqIXNLR9tsdrWZG0cYE6pM/X7oNPahxbvwyJc=;
        b=TfTcP7Ogx8hiJ+72M0uooTXMNF0dCVRW7q0b7QTDQZv2WfktrQAIdmy0puTdsGTWya
         yApsQfmra5lWFaInZkQLbj0AK+P2THVOQv9WCwQTMtfTVVDdwS1Y+x1qjEhKqPDNO5DM
         U7JLe2EHeO3DK+uh+PTPX3BNRl5Ue+Kf3OamZwEwxxRiN0/UhetvMG0gZ5JEiSyTO04u
         FmE5q7NhO5nJRLHye8qPqSDJOGLUZZLNmJInWKPGfLynT3UP4jPAljXplLCpb8itp5Ft
         rXQrKpjKFY0PoKYhZS5CIQ7o6EfHIUO7qpnFF3TamINP54vR1nrOX5OozFbylio41Ja8
         mRiw==
X-Gm-Message-State: APuU4Z8Y2/qL/YVC6GhFqey2LhM64RQL03K2aH4EooMoDzg1cP1nKrcX
	oqjZR6T+MWahiPzGA+BhFIxnVjKJoIBRcIfg1Q2lb0gNoD6Rg2xz4vl3lnELybII
X-Gm-Gg: AZFdTZchJLPsqwOfCBhOqStXtaZ8LYz3MR4s1FjTDFN0yMK4MKK91ea4oYNPCdJ4gOD
	ICLTn6CHxH+KDAsnnYQukX7Rlz5EZdl3473d0sSivhxWdeT0tSkbbWp6XuEKFhJD1HRHoIirAmH
	YOsf2aqmKNRpE5mP39e2PsLT8VKDlPSpcTyapTPNyX4DQhUqgT+YX/BSXjKMJi0WiGppi/ii3YI
	E+tQhlu/IHh0AmPhziV9u8+J8NfskjatT7KKftuCQ5CJQfz29xrKlwt9lPWByw3rAl0oD4LtGRh
	XnFm02nF7sxN3MD80e2D3GGZSkn7cNKo41WDgBL5FouNeaxlVTlz4n8V/EIx57G8TLHOPG8HHId
	bl4QN1/1ErHNgAThII5JXegOlKdbMZ9mdYJpw9WwzwNhYh8EvR6AUtMHlP3LBtM0LO20BBtbru7
	cYmiPkMU70QP39AiDm9nrtUEqLQ6e46vPGpbRZgPOKJl7WjKEdZYPU+jVlcPYj7EzY+NNUR8fDV
	N6ZDZ280xuhJiH5N9F9abvMlqEm369DTUM1GXYGZ5Y9OAomZMV181I/FiAh246v31NjFn+l1nDj
	tL1mZVDv1eQOxqZ5QGZieufGuh52PP3J/8W3bTfwH+nz6hABp9A7+jw3mfCLB0WoOBXoqVlQ3QZ
	OW9m8c4qlVl4fgEvJq8a1JXeBfIRuY5W1S2NZwQuu0X7+wa12shetKDLmRdNq7L8rmumlFxWS2R
	JqUjumBNOhP0aLIEVr5O+gkwXQDQmNO0vgforBb+QvISJT8lhd3zGcXugRrY8dZmEXO2fkmARnZ
	dvQbZZu9ApbTsAALlsuHfhfRUvsmCw2n0CXsSKpbenzl7C+fjPxYXzh8qCZkyCa3P6uRqTvoYMA
	+B85
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr12388768eec.22.1794851775970;
        Mon, 16 Nov 2026 09:56:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 099/105] python3-uefi-firmware: upgrade 1.16 -> 1.17
Date: Mon, 16 Nov 2026 09:53:51 -0800
Message-ID: <20261116175359.342679-99-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132554
Content-Type: text/plain; charset="utf-8"

Upstream renamed its default branch to main.

License-Update: The checksum covered setup.py; point it at the MIT
LICENSE file instead. setup.py now declares MIT (it said BSD-3-Clause,
while LICENSE has always been MIT); the bundled EDK2/LZMA code stays
BSD, so LICENSE becomes "MIT AND BSD-2-Clause AND BSD-3-Clause".

Changes:
- Hardened parsing and extraction: bounded parsing loops, recursion
  and decompression, clean failure on truncated/inconsistent headers,
  hardened C decompression extension, new safe_path utility.
- The "future" dependency was removed.
- Added AMI capsule, PFS (AutoParser) and PaddingObject support;
  duplicate volume names supported; fixed NVAR, ME, PFS and CPD
  handling and FFS rebuild.
- Performance: _FVH magic search 8.9x faster (bytes.find/finditer).
- build() round-trips and FDF generator fixed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...efi-firmware_1.16.bb => python3-uefi-firmware_1.17.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-uefi-firmware_1.16.bb => python3-uefi-firmware_1.17.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.17.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
rename to meta-python/recipes-devtools/python/python3-uefi-firmware_1.17.bb
index a5d9011094..d36cd0de99 100644
--- a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.16.bb
+++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.17.bb
@@ -4,12 +4,12 @@ UEFI firmware parser is a simple module and set of scripts for parsing, \
 extracting, and recreating UEFI firmware volumes. This includes parsing \
 modules for BIOS, OptionROM, Intel ME and other formats too."
 HOMEPAGE = "https://github.com/theopolis/uefi-firmware-parser"
-LICENSE = "BSD-2-Clause AND BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://setup.py;md5=f3ddb5c3a389eada068ddcf6b89f62b2"
+LICENSE = "MIT AND BSD-2-Clause AND BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7befe9c63bf87929cff5a8b0c5a62bfb"
 
-SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/theopolis/uefi-firmware-parser;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "e202e576cefd1fefb3f510237bbd0aea8aedca07"
+SRCREV = "4942c4865da22000f4bb484830e26019ec061498"
 
 DEPENDS += "python3-setuptools-scm-native"
 
