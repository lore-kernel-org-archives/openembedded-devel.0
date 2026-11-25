Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43326.1795618272976597984
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 06:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gINoUXlR;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49412eb1474so3806392f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795618268; x=1796223068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDTuixcs7QqxUKfWE9WDAFPbglo4dPvASg3d6Hq3Abs=;
        b=gINoUXlRN6yDW8wpplpVGQDVhkaxieJtrIrU0zOEtQ5Slky6N1PShj4aQ7HA6wQ7dI
         5nsOVArY6byn0/vBs9CIFipDT0NvTnWGsZqq0HC+gvwgfOKwSn/Z27Q83DKFgEqui17e
         BlgVUPF+eNQ9XMPJMsHjCpZu7qpnbx9ujk2pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618268; x=1796223068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDTuixcs7QqxUKfWE9WDAFPbglo4dPvASg3d6Hq3Abs=;
        b=y7/OJ5gc+F/3lIJytjktAdxZT7/M2jJLdhzJbeSLy5BHSOnBJfXExTskUgpG+s5HEo
         tE8yubcazZiZHn9Rw8IM/WfHve28BXKQ+8SXVE3lHg5yVyngrvdtRw3BPCcZw/3h7xjh
         YRMr1yFQJGZAm48Jx01M2ObWoi58MKH/5VQf6ohWtKZVi9c3mLt2tMr57x98CN0TkNix
         TR3RuZmnnTHSKx4zZBa/HV+1zRHMKbjo8in0zkDpAw2RimUQoXAYrcQqHjTyBqQf7xL5
         AX/ccFm8Ltp6hP22hpHoNLwXEJ3GnaCJidilA0nk5HbLls8r3op5/Oc3f4bxdnF0OTLs
         OuZA==
X-Gm-Message-State: APuU4Z8iOSMBr9b/7Xc9dmw+opcM11TO5tsBq9reQR7Tk30e5/RJIAo4
	aD3cbHCaDTWgYalN/AOxuo2Zg7dmQglPJ7RLtldmXy94kVU3iXnN6yKmKd4PwizmnS/d7CkezTp
	SXo5b
X-Gm-Gg: AZFdTZcCK68wU/CxKqwAl3zbocHxhMNfKNugy8Lg8Da1O16FRP4RHR/ZEDilnIi+iNf
	ISaBkatZNOl8rjdC0ok5J0kD5zcxEU9FwzsxqJsiokxCldLqEXcCmil6TgYcQhjw5bunhOL5YNv
	9P69RAOi2zzVC7u8UeTJsiIhFyYNMuGuNHxjr8vEveehqdc3Hg96DMafsEU4ZfvNVRTefC1/HAH
	+scDQClDm2Pe3C8nch4xXEgu3pOccA8Pp0BXCHiqtVrzVFgqxHuBrMudq1GcxUmcNoWy8LTmJ7p
	YJ3EKN05AIMK5pnn7Mp01EXOq8vodb6Po96ftmDMwfAoW77QmR/RD9amK/aJid7eAJ8Et4Xxvo1
	/QYbJ5iAABAICCTpE6QQrMWhI5Sv2WqZSL6vgopu2y2YX8V168C2BE79mdbzWXLR2uX1/G0cdSO
	4UXC0Xfe5XNGsiDG4eJIPHPqqTh3t4ebmHsuV9m6F8E1zNjbF08JiZT4+dMouQLtt/1dEuAhG4C
	OsZdjVk9+XSipHIwfFS5kLpiQzPBVAA8Yk7XCpCDSbdHP6+QDJYdgLRfEAthBu+bvHQlmXXGvbB
	pw+HsYUXmS7gWmBnFTYva7X/DLjyCzFfXgTzb3aJW8D0xa9hSUXr/5TFM/FfAnkUrdlvnPVgo/3
	31Hg+0upxRYgxG9YkB9XDXq3zNIezMJdNlaboeEu2PjXCC8IvypFwbQ==
X-Received: by 2002:a05:6000:26ca:b0:491:36b3:22c with SMTP id ffacd0b85a97d-4abad6a1762mr31843704f8f.1.1795618268085;
        Wed, 25 Nov 2026 06:51:08 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm31426145f8f.17.2026.11.25.06.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:51:07 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-charset-normalizer: Upgrade 3.5.2 -> 3.5.3
Date: Wed, 25 Nov 2026 16:51:05 +0200
Message-ID: <20261125145105.1808222-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 14:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133082
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.5.3:

Changed:

- Faster noise scoring in both the pure-Python and Cython
  implementations by reusing Unicode character properties. The
  Cython extensions also speed up language ranking and checks for
  suspicious transitions between Unicode blocks.  Reduced detection
  overhead by skipping redundant UTF-8 sample alignment checks and
  repeated logging checks when tracing is disabled.

Fixed:

- Fixed detection of registered multibyte codecs when a sample
  boundary splits a character. The detector now strictly decodes
  the full input with the custom codec before sampling the resulting
  text.
- Kept single-byte candidates in consideration when a Chinese,
  Japanese or Korean decoding has measurable noise and no matching
  language.
- Recognized ASCII information separators (0x1C through 0x1F) as
  whitespace when scoring text, including record-separated JSON.
- Removed the leading GB18030 signature from lazily decoded matches
  on large inputs.
- Fixed UTF-7 text with a signature being misidentified as ASCII
  when a sample started in the middle of a long encoded sequence.
- Fixed language detection returning names such as English when
  only an alternative language profile met the coherence threshold.
- CharsetMatch.output() now updates a UTF-8 declaration when
  transcoding to another encoding and preserves the last successful
  output if a later conversion fails. (#819, #814)
- The legacy detect() function now reports ISO-8859-1 for Latin-1
  by default.
- Both python -m charset_normalizer and python -m
  charset_normalizer.cli now propagate the CLI exit status.
- CLI JSON output with --with-alternative now always uses a
  top-level array, including for a single result or a file with no
  match.
- normalizer --normalize now appends the detected encoding to
  extensionless filenames when creating a copy (for example, README
  becomes README.cp1252).
- Excluded Python 3.16's utf_7_imap mailbox codec from detection to
  prevent errors when probing unrelated encodings.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-pyproject.toml-relax-setuptools-upper-bound.patch   | 5 +++--
 ...rmalizer_3.5.2.bb => python3-charset-normalizer_3.5.3.bb} | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.5.2.bb => python3-charset-normalizer_3.5.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
index f73a6ef803..5193632b6a 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer/0001-pyproject.toml-relax-setuptools-upper-bound.patch
@@ -5,10 +5,11 @@ Subject: [PATCH] pyproject.toml: relax setuptools upper bound
 
 OE provides setuptools via DEPENDS and builds with --no-isolation, so the
 upstream upper cap on setuptools is spurious and breaks the build whenever
-oe-core ships a newer setuptools (currently 84.0.0).
+oe-core ships a newer setuptools.
 
 Upstream-Status: Inappropriate [oe-core specific setuptools version]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com> 
 ---
  pyproject.toml | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -19,6 +20,6 @@ index 1111111..2222222 100644
 +++ b/pyproject.toml
 @@ -1,3 +1,3 @@
  [build-system]
--requires = ["setuptools>=68,<84.1"]
+-requires = ["setuptools>=68,<84.3"]
 +requires = ["setuptools>=68"]
  build-backend = "backend"
diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.2.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.2.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.3.bb
index 1d02fd7fca..5958dc8e0a 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
 SRC_URI += "file://0001-pyproject.toml-relax-setuptools-upper-bound.patch"
-SRC_URI[sha256sum] = "39de2a259fc954455c57274dc94c79d5842774e1247a016aff30bc0efed0f4ef"
+SRC_URI[sha256sum] = "a250888753faa289e2997962fbb17c4960cbdb58575533ca6fceee68c224bdff"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
 
-- 
2.47.3

