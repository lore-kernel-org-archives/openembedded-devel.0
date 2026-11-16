Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34279.1794851643757138748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OUNJNbQx;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37628596783so6268806eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851643; x=1795456443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkJRCBO2QnV6rZuspChrVD7/YxPB7J925xriyJjQLC0=;
        b=OUNJNbQx+uRZ0oUTRok615t1EOSt9dqem8MGhH+QeVmd1nP/QMx1L+KSJYp7bV6NHT
         uAcjlQYq+T1Xu+9NtRB5oIgEP1+cBabo75ZKODsurkI+4igAcWdQGrH+8uI5/9o1fiH1
         3/TA0bHmpAKrIVV4InD4II9nxqylq7r/+iMjUHumBWxaf9tCx5k3oT7C80OMAc/5jDcI
         dnebKfKJd9HfqT05S+AyVelvT5JU5U76jh0/zmtzCUWEoX2H2i0gi3jARfKRnGxrZ0+J
         EEjniTXpzYeRkWtaFBCS3V3XnosKlGtUnYEsxs0kwp97DyzGhteNETIZb9ZvFaDGC4lC
         IypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851643; x=1795456443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkJRCBO2QnV6rZuspChrVD7/YxPB7J925xriyJjQLC0=;
        b=1jib/AWwGBmWTMeRE82M9qE7O6J2T3qrGqgrHZWjLFcfXd6awI2TLNaNwAKW9bEn2R
         6ewdePhUjeAtMw0F1y1Rf7r8NBNll1Qs8ThpdDz5oWsLSYBXCd5L/PTKOianHV2Zl63t
         Hbqqfu/Fevi90rlC6f01LfiDHjY9oG5JVm+xPLJLCuHNNQwqKJoQe7Jze8NPxVv+WwhB
         lUQLMmDabNZMf2LI8u0uXHTNjvGtilqmO3g8JBj78AkJT5ULxRgaZZEQzcVeHTASNXh+
         p/uRNVhwK5U8ppRk0fzqB9QiH/2xtte8v1zOeGq+o6lJy5S6pDXHs4kdVMVBG5yihN9P
         i/2Q==
X-Gm-Message-State: APuU4Z94QvChVnp0R/tVJDP4ul4XbB4kICX0/26jNU1LgiXfV048KrPy
	xL4/4GxsrGjKxBdEo97QgSeMb7YvXMlIu1/NCUN7869MQhy/1PUFjIwTvu4lHsnO
X-Gm-Gg: AYBFou0pc5wvIeXYZjzJX4ygIO1QQAG4bbHd2Lk39bYVwRByqCE3C+XN5PJxKndjmvI
	RGoR9SwsntjS2dvBNoX8mbPbRnbydjnSu8NnboeQITp0E7BT7QU6V8WW7x9/Gvtc3OxFbU5p+vC
	QEZEWIZPGE365y1W/ActLPrvIsS8TwNiEHKmNBJGGhByJc2DQjXW0UQ6BZAT00PUtOAxGjf0fs1
	6zaDV7PsNjevrRl7KdqSNdJZSzG+5A1eJY9El1Um/hCziN+WohhciGgiILAGRLKE3OwHIvfM7Ud
	n4Jf5fn2WKxIaWqIBOmtQwpcCZXfPLwGu2RnVKKzK1+OXAmNwfSi77mA4Ln0SiSqFxzKOrh3qfA
	W/0LZeG+aG3tNTKd3E3iJqosF4CAocMHMbNcNLebxE39Ny0dFYjUu4gzoMeN4+NIrHSVurxkSjQ
	AzOHnFE12PxYNTEhsGLdskmIhRR1hENBZHOlEPLsIxTmhEUFV/eKD34GEOucNkwzIevTsOaOCOU
	Es8bPrQ/KB/eYBoP++rqT30UVLAkwVdyfN1U8dVURVWIDyXW0FFKk6qDer4EE0ZrZnb7pQpPl7J
	aKrpacAfvL9HKxON8LS+W33t/+8LUvGuW70MJPxOuHNOKq9fvv5pE0jPcD9PWtJhYmdZ6DMCUBV
	knD8huLSQKdkROov+MIqZiPKM/dYX2SB+I8f0ntsbrLi5QIeihLXtI8NXlVr0VfJImWr0iIqmPU
	6qnsBZowlLG5KL/xHUWUJlfSCJ9usGf2jhcFu9yJQa4tQPdNrl+EQlyXyOGMioD3Dv9wuwwZjjz
	TvlrH+kRCsvewjz2ouAkqR3OrdXw1lfKywtexmb10LeYrtDaQNY1j2dClQV/jlmbjumQ0INg2rP
	Ja0f
X-Received: by 2002:a05:693c:80da:b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-37e9a3b7e51mr5470206eec.11.1794851642838;
        Mon, 16 Nov 2026 09:54:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 001/105] python3-absl: upgrade 2.1.0 -> 2.5.1
Date: Mon, 16 Nov 2026 09:52:13 -0800
Message-ID: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132457
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py and builds with hatchling; inherit
python_hatchling.

Changes:
- 2.4.0: add Python 3.14 support; drop Python 3.8 and 3.9.
- 2.5.0: add --only_check_flags built-in flag, async support in
  flagsaver, ABSL_PYTHON_PROFILE_FILE env var, and TestCase
  record_property/get_recorded_properties.
- 2.5.1: add assertIsSubclass/assertNotIsSubclass to absltest.TestCase
  and ABSL_RELOAD_DETECTOR env var to disable ReloadDetector.
- Fixes: duplicate flag definition on module reload, type stubs and
  annotations, ANSI escapes in xml_reporter output.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-absl_2.1.0.bb => python3-absl_2.5.1.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-absl_2.1.0.bb => python3-absl_2.5.1.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb b/meta-python/recipes-devtools/python/python3-absl_2.5.1.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_2.5.1.bb
index 96bd8d37fc..67d1397ee6 100644
--- a/meta-python/recipes-devtools/python/python3-absl_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_2.5.1.bb
@@ -4,11 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "7820790efbb316739cde8b4e19357243fc3608a152024288513dd968d7d959ff"
+SRC_URI[sha256sum] = "286e71c82c1a38e75bbcf185f9b37d0305ad7786535107cb49bf4df9ff2e1f95"
 
 PYPI_PACKAGE = "absl-py"
-PYPI_PACKAGE_SDIST = "absl-py"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
 BBCLASSEXTEND = "native"
