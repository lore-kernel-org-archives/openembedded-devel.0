Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14682.1793092898282066647
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GIvMvX9o;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14667145e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092896; x=1793697696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOseyoxFw803c5i5xpUVamjhYTMp+Di5UXHwBfm+wW8=;
        b=GIvMvX9oHZBKuhLzxW1SwTjcLcnjc0zM1K1v3A7T9FhzU3WQhoyiMPAmLJ94yaXJUh
         B5QneRYtVNYaWc6CNb4zLUNRJqhwAYK7CI8v3pU/gduWnueR9aSTXBrogjqDGrdsF7+H
         UK9SeInTk+I89Zmk2krxRRdKlsR4K53DJXDt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092896; x=1793697696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOseyoxFw803c5i5xpUVamjhYTMp+Di5UXHwBfm+wW8=;
        b=IMy6/0KF2CAaEb0wVaCt1DM8WfkP5bpHn9sHm+NqaV7Dp8ICZkkhRJUuCB3P+nKe2B
         ym+Hb7yBjrLq9/vCrvCa7AyJDA7qLhYjH0Q1+61GN6iOrS7TkDjTIoteZC/LLNfaJNVG
         ywCIDqUd+t8NRaS2t+oo38HqQgaWXtOwZaFNHFU5obanMuCRe1kA1IhC1JhDrz0UVAir
         XhLFNNm1bHlcOP7c396pFWLv0fLsc4uGxX+oVkDFTXwkmcfBn6xLyyssUHz8QwxdArir
         1KJ28v/aGoHjhcnvxfFk4+jIf2oWA7sRCr6ZtxF5b2lhV2lh7IfakikiuuMckevpbFh9
         3csA==
X-Gm-Message-State: AFq9FYJ16jUvnKrVmfwBg9Qk9hkmdCo0PpWByTudCSxzWm9hh1Qss27a
	+RZVW2NX1FHj0AuXXKRoqNTPin+VUxFYKbT2GAkotN7gl7m0WZfG+k5JBtxpm0NGw2pGL+oKEAx
	rlQ0F
X-Gm-Gg: AYBFou0rEsJ5EooIcChe9iulx9+U0jPrKX44Vs2zPU7R/HAiOFplPxzV5w/iF7HbKcc
	X21NNiUA8Fn+3QLT1TOo3gPT5VgS3DcSXJbSTRkbBVOr6pr/TVEddFMaTplGv0HI6BVYtliR4k4
	8XtkSUb2BcjCiMYwO9PBM6ue4c6hi8lTgPtQsqVAvVUe6ZF0RK4OYdcvmUuj9UIQy2qgmbqJAYW
	aweLFWHRqnchbdPl5ZM+y29V7/6jaSa9/GoWwElsZBVQ0Y+Ly+LLkN+cITut+7AsTW3l+813e34
	t/0LJ471pAgkEEjXHmOILIUL5papMgm0a1iABB5tT8jZQozkd75G8+BRUlC8ef4axPiqiz0W1Kb
	r4NN+IIozUz8WlgJ/BA2ZVHqKRs7RlwBL3p9kDF2LsJ0mGKWRIFTiKaohXHDusPJUU/EUbfy1lr
	Cu0t4kTPd86kF+bMW3Pu6dT8ejYzqqch8jg6HjMm4EcjRmUo4JyzVNt5VOKiOsCGky/JEOXvoMh
	BKRjyZhJTLasunpd1WhJcVNw/nkUDlsRMVG5R8PuX+gcl3AM6u7qjXA0+WA65jczxe/2sAzgxtJ
	BQfiSufuMRcDez6LamALHewZaLFUqYbLnACaAZLL9RSMkpLnQWamVEvNHklb3alSAdgMhn/SOsj
	jsCnrtfDVsHTKhsQKuUVOG3hxOw==
X-Received: by 2002:a05:600d:82f1:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4a7a5dba949mr44108875e9.4.1793092896553;
        Tue, 27 Oct 2026 02:21:36 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:35 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 54/61] python3-validators: Upgrade 0.35.0 -> 0.36.0
Date: Tue, 27 Oct 2026 11:20:21 +0200
Message-ID: <20261027092028.782979-54-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131518
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.36.0:

Breaking changes:

- Drops support for Python v3.9 and v3.10. Python v3.11 or newer is
  required.
- Stricter validation: the following inputs, previously accepted by
  mistake, are now rejected.
    - isin() now verifies the check digit, which was previously
      ignored. Lowercase ISINs are still accepted.
    - cusip() and sedol() require a numeric check digit.
    - md5(), sha1(), sha224(), sha256(), sha384(), sha512(),
      base16(), base32(), base58() and base64() reject trailing
      characters, such as a trailing newline.
    - ind_pan() requires a full-string match.
    - fr_ssn() no longer accepts a comma as the gender or Corsica
      department character.
    - domain() rejects an underscore in the last label and names
      longer than 253 octets once IDNA-encoded, as defined by RFC
      1035.
    - mastercard() accepts only the 2221-2720 range of the 2-series
      BINs.
    - eth_address() rejects non-hexadecimal characters.
    - mac_address() rejects mixed separators.
    - slug() rejects a trailing newline, and telnet URIs reject
      control characters.

Features:

- feat(uri): add telnet URI validation per RFC 4248
- Accept file:// URLs per RFC 8089
- cron: accept a step over a range (e.g. 1-5/2) and in list items
- Accept lowercase IBANs in iban()
- fix(cron): accept day-of-week 7 as a Sunday alias
- Accept a trailing dot on simple hostnames with rfc_1034
- fix(crypto_addresses): accept testnet (tb) segwit addresses

Maintenance:

- chore(deps): bump requests from 2.32.3 to 2.32.4 in /package
- fix: reject MAC addresses with mixed separators
- feat: Optimize slug. Extend tests.
- chore: update codebase to reflect new username
- docs: correct PossibleValueTypes note in between to include None
- chore!: drop Python 3.9 and 3.10, bump vulnerable dev
  dependencies
- fix: restore certifi and jinja2 pins downgraded by stale lock
- chore: use native pyproject config for tox and pytest
- test: cover RFC length limits for domain() and hostname()
- chore!: adopt uv and PEP 735 dependency groups
- ci: update GitHub Actions to their latest versions
- docs: explain why the documentation is hosted on the maintainer's
  fork
- docs: hide badges from the man page; upgrade docs tooling to
  latest stable
- ci: deploy versioned documentation with mike from the fork
- docs!: build and version the online documentation with Zensical
- ci: publish to PyPI with trusted publishing

License-Update: Copyright years updated

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-validators_0.35.0.bb => python3-validators_0.36.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-validators_0.35.0.bb => python3-validators_0.36.0.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.35.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.36.0.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-validators_0.35.0.bb
rename to meta-python/recipes-devtools/python/python3-validators_0.36.0.bb
index 79950f945c..a758fc1a8b 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.36.0.bb
@@ -1,9 +1,10 @@
 SUMMARY = "Python Data Validation for Humans"
+DESCRIPTION = "Python Data Validation for Humans"
 HOMEPAGE = "https://python-validators.github.io/validators"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78327e3919fcd4e9a4a07299899c634c"
-SRC_URI[sha256sum] = "992d6c48a4e77c81f1b4daba10d16c3a9bb0dbb79b3a19ea847ff0928e70497a"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=728e6b6dd8ebb4906421b89b00645e6e"
+SRC_URI[sha256sum] = "92ad9ed00bbed320b784cec0ea90b213cf08904cf605b3d0852cfa4108e32a2c"
 
 CVE_PRODUCT = "validators"
 
-- 
2.47.3

