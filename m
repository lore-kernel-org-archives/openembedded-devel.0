Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF73C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 10:04:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3271.1785492277061392013
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 03:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ye77Jrzs;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de008b020so523508f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785492275; x=1786097075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=13kTAPkwgGPniUE53lgWhMa0uTzzB9WwDog7Ho8cGTw=;
        b=Ye77JrzsjOkc7HuWcxze/Oj3fWSdVLMlIW1w6mgognW04AJFyTJR6nDf/5M2sDIPW0
         NarHN0Vkp0LeJy1ct6f8i4/Tptkkg9LdiYTe0GJ0FFfcp5kHJJ3Zytsy32WBqIwBCtmS
         vQU+3riFuYHVK5PEoVu9CqeFsPL8M1/DIVdmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785492275; x=1786097075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13kTAPkwgGPniUE53lgWhMa0uTzzB9WwDog7Ho8cGTw=;
        b=b+Y2XtvDD6W0kOoAgI62aw3UmU72i32hgMk5klh9HF3Ny1I4GIILgJx+yuDobjJV4j
         xwBX1KbBbZ57LDAPZroFGA2Dq9NwLOnXJn5E3167a8xytdXhnJn8EcikVaiyKgO9gGSz
         lhPyoWLvleTjgrBiTnwtHV4wfkkB+Xf4LnaEEzAZQBPt1o9nurTjiVIax9LmZkRwVnxi
         k3mHowG6WyKTGXu4USTW/CfU565G4JyT2GToI/0qh3XC8+ykhgKOo0gDUlLuIo3RVIvt
         gTNBee79oFnZ2YPvfp03RMZq8vQGXjpxEMsBuF2zvY/20GjZACRjyW5DNBsI/atHuR0U
         sPmw==
X-Gm-Message-State: AOJu0YwjsmbW1pzDHIOynPPveZ8/VX/nXquNaRZtJrZ59YHgwQ8YysbT
	QMHDuDQhroDVN9piL1yu8TIXsP13ILBKmCBXxkp+HZq8bu2MugeqZiX2/ndZs3ha9H8KWbgEyoN
	1joQ2
X-Gm-Gg: AR+sD11pNmva8yzau/knlqNe2N1AwgVYdLTw152PxrrmnGNFjOVKCR4scm8OT1DncrZ
	dGc9pPIuw/xFU+mfKYpL2IM0/LiEm4ergsRGEwZJJ7km6qDzVFp3pC4D98pkTajAFnak1tPY7pq
	xnA7ZWs3Wtj688I2yGChS2BJLZdPv0VVnpYaF7R7ZJQjgt4XagMC75H8H/EPikRXf57rijmFuER
	UBVgTelU4wJ4erjLbTioMvqZOvtoghO7S7HOlMOdicvGRYDRezcZbQ0f2BBe89rOTQ2Zp6Uxx6D
	F+Y5YYmhXP+jKwbHDIsdlbm5RZ+qdDDWA+IO290rQFu0kJTG3FMeBWjIxnT8j6etFT7r+T15gcz
	Bu1xhwnYP8pA2bAYCYF1nZRpDJ7NVhX8x7wufKrdfOO+IVYhb5kolqKxFx5xjvHlitB/bGQsDkQ
	gIldsVEVDvuJakR4xcy7pn1C0XcgZ7zhM55E3jAKlZiH29O0xboBJ+4q3MkAMlW+6aCWTlIl9eI
	l/AhsVIYsORkC1X+HxXEa80yNxEW0Ro7fUhoDiafbg8SCA9oVsPh1MeILRgBWo/kL4B5Y86ZqTz
	qKwXqJlgw7EkHw==
X-Received: by 2002:a05:6000:615:b0:47f:72c3:a320 with SMTP id ffacd0b85a97d-47fd32ea056mr2602704f8f.20.1785492275002;
        Fri, 31 Jul 2026 03:04:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e296csm3119808f8f.12.2026.07.31.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:04:34 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-unidiff: Upgrade 0.7.5 -> 1.0.0
Date: Fri, 31 Jul 2026 13:04:28 +0300
Message-ID: <20260731100430.3141022-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 10:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128581

Upgrade to release 1.0.0:

- Minimum supported Python is now 3.9 (Python 2 dropped).
- PatchedFile.path now also strips git mnemonic prefixes (c/ i/ o/
  w/ and 1/ 2/), so git diff --cached paths resolve to the plain
  filename (c/README.md -> README.md). Standard a//b/ diffs are
  unaffected.
- File modes via source_mode/target_mode + an is_symlink property.
- PatchedFile.diff_line_no to locate hunkless/binary entries.
- Accept bytes input directly (decoded with the given encoding,
  default UTF-8).
- Real PEP 484 type annotations + generics (typed iteration) and a
  py.typed marker.
- Parse difflib empty-filename output and fix a trailing-newline
  error on hunkless git format-patch files; includes the
  quoted-filename fix missing from 0.7.5
- from_filename/from_string gain metadata_only; python -m unidiff
  works; packaging on pyproject.toml with GitHub Actions CI.

Fixes:

WARNING: python3-unidiff-1.0.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-unidiff_0.7.5.bb => python3-unidiff_1.0.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-unidiff_0.7.5.bb => python3-unidiff_1.0.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb b/meta-python/recipes-devtools/python/python3-unidiff_1.0.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
rename to meta-python/recipes-devtools/python/python3-unidiff_1.0.0.bb
index afe74947f5..ddc39da626 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_1.0.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/matiasb/python-unidiff"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
-SRC_URI[sha256sum] = "2e5f0162052248946b9f0970a40e9e124236bf86c82b70821143a6fc1dea2574"
+SRC_URI[sha256sum] = "5e5d5cfab2dc98be819b74747ab7d9f5af8695369ec8710b93f9ab0f0ae6a449"
 
-inherit pypi setuptools3 ptest-python-pytest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += " \
     python3-codecs \
-- 
2.47.3


