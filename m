Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12.1794851765929386558
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=X4r9Wrtb;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so9840875eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851765; x=1795456565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLDVTFcIL82YGp8TY8bMTaEqsAoMl55aEmnVoXipWak=;
        b=X4r9Wrtb59q6xRfXX1HFvjYbEmizsn375URih2Fe1jTUX0FuBk0nzGAZySWiM4j1ca
         6nwjhCI8FMyjQv5y+BSb8lznCkoatFmkJXwRRuUZB2SF/gdlHMAOu8JSt8vy3CIwtPSX
         sY9SvQ91L+Xdq5kI8JypMFyF2xegy3X18Gs1NmM76q3D59e9fEmeKqP9nOuImu5XM0WK
         gzC5W+wH74By3zLoz5loeftV5xTqM2v/HDtRWTlf0nOUcmAx3f1hfi63a7QNfWEqnMZw
         HCSCoTTq1f7j9qKKj9+s+IOuyRAlX+PfWcOA7EJvwn8g7fPpDFARpdz7ukeiYt3bpX5q
         Zm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851765; x=1795456565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XLDVTFcIL82YGp8TY8bMTaEqsAoMl55aEmnVoXipWak=;
        b=1Polc8wya37TIoo586iv6jzEA/buqIV1C8Q91vjoc+L32uE9Xo6lE8YeKD/ZUDNG0p
         XuWUBxGQyXThy2qZCO5v9QW8JPopB839Si03w/uHNs4FCDo10FMbFeBtqRhGz29FC/he
         +tC5MSquNNwXnRtn68gsO7wYMwOnBLNp4mEsdLySkWFncI13JNC8kue3wQNZ+0kRZlpk
         +SfiAWMnJW6gsmX9f7uBU5PtIL/huI2eXK0gnXl3SOQbr6Mne3V0b9hhbCc5XdLmsa3I
         NfZAVAvqbeJeLORaJRuMT6l9PkAJV4SOlgMfJWSa0nCRsyCgkzsma74C81KzgtDwdb1p
         91oQ==
X-Gm-Message-State: APuU4Z+Ahhoot5BXwSCWuv9b4wh3tiNzIVljOLUHPAEfKh4oVu4M79M2
	kY9iEajchSop5n4FtLmOxviZyttqNWksY/eMmYAPRtWiAfo3UNeW8EVKdbQ8AuA2
X-Gm-Gg: AYBFou3dq6MjJ2HkQUE/WD1qNK8e10wf4nk9SypmKzffQVULOiEX6jKNO/vk2I2BMmr
	egC4XLSN8ANMMzLxdnoCs60/nlwQAAYv5xDzj0FAj+qaA2ItRArt7CRhRs3UE5aU9a16qdaWmK2
	HjdIFUO3sHACiKIi8/aKzCgZMjKR2+DyLEp5uembZqHJB/JF85zmLC+d6sezDgRfauL2Ih6XT1o
	HI1nqY3izx+cHavC5vIU4LkSSBboJ28QNhZY+tBLGBuwnm+p9IcKYMkeWJbfSUVK17Plll2qI3l
	dRA8lYzsS9oHKjOHDdntFRvLIlrYhVMKpA2F4ll3df93FANc1wI2RiRcbdDgE9rf2P4SHq+r3eC
	Ql8u5hHalI+wWE8dTsPuTuQKudVDYcspfyAinsKx5wobI1Dh2c/AmoeMcP4ueccIa86oQ+Mwl/d
	AdzUjo9KQYsuxSBilc0k9lapEPKUhsLdz0CGdCPDFkysAp7zM5ynnXE88UMQJmZjCzVxUv9b0dG
	wPfeEp1nfX+pj+TBolEjAd8TstFswYXwzHToKZwJCP3yxoMVDjQWnB20HLbWz2TwBA8/W/tONoo
	OpixcJ3nI41ys0eRzQmdPPjMi4FNAnpEMqD/iawrNcHDEPlmWdOCqajWqTyFMiH7VvbL/yfDoPJ
	ktLHF8SvlL8GvIeAQjz5xulnKlX65pvdq6dlgw1mwAL9uP8uBH5H9+lU8UvPkuNuWBDjorXHCiO
	MlSGLYPlLyaLu3AOs38yBuZuPAQDzqu4wFZA9nbcFTdGIS9MxaBJFbU9d1xxJwKCjgsmQFMOljE
	mWmviteBbaXEgRndvMcTpCEG5PaRrnBxfQO9cRe+Q8hWwrk9HRyaR9rWagAr63EsOvrwBH3JNKk
	3GJH
X-Received: by 2002:a05:7300:680e:b0:369:21a:dcca with SMTP id 5a478bee46e88-37966387e53mr11552399eec.10.1794851765098;
        Mon, 16 Nov 2026 09:56:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 091/105] python3-tenacity: upgrade 9.1.4 -> 9.2.1
Date: Mon, 16 Nov 2026 09:53:43 -0800
Message-ID: <20261116175359.342679-91-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132546
Content-Type: text/plain; charset="utf-8"

Upstream moved to hatchling with hatch-vcs; inherit python_hatchling.
Refresh the ptest skip patch.

Changes:
- 9.2.0 never reached PyPI (bad package description); 9.2.1 is the
  first release including both.
- New: name parameter for Retrying (log output), enabled parameter to
  disable retrying, async context manager support in AttemptManager,
  min parameter and timedelta support in wait_exponential_jitter
  (its "initial" argument is deprecated in favour of "multiplier").
- Fixes: Retrying and strategies are picklable, no hang on cyclic
  exception __cause__ chains, wait_chain([]) raises ValueError,
  ordinal suffix for numbers ending in 11-13, falsy wait values,
  enabled=False respected in iterators, many typing fixes.
- Tornado floor for the optional integration raised to >=6.0.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...st-skip-a-test-that-does-not-pass-on-qemu.patch | 14 +++++---------
 ...tenacity_9.1.4.bb => python3-tenacity_9.2.1.bb} |  6 +++---
 2 files changed, 8 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tenacity_9.1.4.bb => python3-tenacity_9.2.1.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-tenacity/0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch b/meta-python/recipes-devtools/python/python3-tenacity/0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch
index 7fb9458a32..2c98f61ad5 100644
--- a/meta-python/recipes-devtools/python/python3-tenacity/0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch
+++ b/meta-python/recipes-devtools/python/python3-tenacity/0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch
@@ -7,21 +7,17 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Jan Vermaete <jan.vermaete@oip.be>
 ---
- tests/test_asyncio.py | 1 +
+ tests/test_asyncio.py |    1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/tests/test_asyncio.py b/tests/test_asyncio.py
-index 0b74476..2da0784 100644
 --- a/tests/test_asyncio.py
 +++ b/tests/test_asyncio.py
-@@ -192,6 +192,7 @@ class TestContextManager(unittest.TestCase):
-         else:
-             raise Exception
+@@ -365,6 +365,7 @@
+             await retrying(_test)
+         self.assertEqual(2, retrying.statistics["attempt_number"])
  
 +    @unittest.skip("Failing in ptest with qemu")
      @asynctest
-     async def test_sleeps(self):
+     async def test_sleeps(self) -> None:
          start = current_time_ms()
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb b/meta-python/recipes-devtools/python/python3-tenacity_9.2.1.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
rename to meta-python/recipes-devtools/python/python3-tenacity_9.2.1.bb
index 13c50dc258..9363e3c45b 100644
--- a/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tenacity_9.2.1.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "https://github.com/jd/tenacity"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
 
-SRC_URI[sha256sum] = "adb31d4c263f2bd041081ab33b498309a57c77f9acf2db65aadf0898179cf93a"
+SRC_URI[sha256sum] = "a606b5c808d0cded4a359d5b9932d867ff2a6a6b64d37350260fd01bbdf83839"
 
 SRC_URI:append = " file://0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch"
 
-DEPENDS += "python3-setuptools-scm-native"
+DEPENDS += "python3-hatch-vcs-native"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_hatchling ptest-python-pytest
 
 
 RDEPENDS:${PN}-ptest += "\
