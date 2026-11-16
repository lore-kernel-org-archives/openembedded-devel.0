Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34307.1794851682348898720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=abtAfkc2;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37628596783so6270075eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851682; x=1795456482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A1gXnOZpDIxT/htGmqjHDWN4xwMzL9y+elgiplgNy4o=;
        b=abtAfkc2F2gXDicL1x1cZDBeLPMm6g3rhRCjB4BTpASOUnbOhqiANVSetYLp7/vIeF
         Mr97lTkdD6Pys9fx9Z7jzU+78fCfq9xXsF+shnIejkvyOEFjJimGuO9f25vYk8/nLf8Y
         cOzLvOkMvPosBRSXFyqaBwGUrfysQDoMfs1w1heCfqzEeUGOFk31Ryys2ZFkNu6g+FLG
         RjpDFNx+R9J2dWZAOlE8RLipICJBvShGWF09Yi48ucOv9qT1xvbgPvios8ULImn7rq26
         k843eO48yIxYu61NbFEwoXfs0QcgkbRV9uUjBp/xTarkiC3ouipp4vAIYvpbtn0Y1+G2
         F7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851682; x=1795456482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A1gXnOZpDIxT/htGmqjHDWN4xwMzL9y+elgiplgNy4o=;
        b=h3JoTRaS7OOwWp5pRzzwJPsEwybd2XtW/o2u/DnfuwHFX3jpb2z0+ep6NNds557MWP
         maE2uWKK1/DT3hR4BQ8aID2Bfdml3wyPsCgqDE34bs6VP+WK/ptjkQLNf/qal7T5wLEe
         uPlkgVPwijlUfZA5Cu2N60Cf3A5fueqYb6Powv4EFXFepHefIG8oNexQH+2ey8OiqbOP
         pLohHRRBhfpBA1yfkgVL7WsIM4uxT20erbgb9rxn+WPwGFS0TuKuUH/2NvoGzCvDz0NN
         AmPq9m7zhbo9AbTxXZJJfTExMrTGGpaOEBe6Z9cSaGEV0Ykr0e8/Xu/xjh3FIstQv8CH
         xynw==
X-Gm-Message-State: APuU4Z88O44wY3UUfIh4Rfke7Zo6cvz5jOHNyUFcdcW1DgFCd3tJsDTi
	un4m5AUvOQ41gDP9spUtL9721YVGPuB/qqTWB7A/psWHUuMITlrybmsq/v8ZdMyz
X-Gm-Gg: AZFdTZeUdQF2VE8cS9d44v1zAF3ngUHC5f8NROWySO/IXaQusWFJpimb0K7+BWwWSfO
	qzSNAijJ8RAHyCTjCVD+6QtzsyqT211ei+CEGTtSEuCuawA9jRUFhkb8g5s/ZoGgdTvQJNUug/a
	meliw9bfbZ/LQif5Z2fuD9MlxoXSOCPxZbozUdFCJNeM7xu9P9WZT6dHN3kdHm/AA05zkw8StqU
	MzHGxtpbwMLjLumrNWAWSb7t9wd2VUnY6hUg3nt0u+XoDkSvt5+AjhgBM85tHUBEj9ETyFxyMAM
	zUIVs8unSqt83p5Bzegfq751Vlhh40xpPBavEwCVu6oLry+K3yALOvE+6f/7brCZGCwn15q3aPi
	JfwzLpvvJAsiYx0O6uZZ77cqVNYpqON8UfIqImma5UOVXoai+pUSKlwIotNuutcpHOk3FZTYWWV
	JgmR2hV7jiYMvnThvnBg/L6589ZwIJfKGBdWzwIsmiWTRK1f3rLRVlQ/1O2kt+rUUdT2hZy+v35
	KAFyyPuwHwG0mMLBLVm2gvHw3RYBn0f+9Hh5w/mm2bicyjPuZBhR4Ti1kLTJhmcViaMc6KOzrJ2
	tdON2BYGaRftamfRKepR6gmuhW6b4YW5Cnw5O7ZKz30Y26Q1Q9YdN2Re40lWl3CmxB5PtnCzrUB
	VgP2skku59/BxGLCy/WD1iv95AwG7VbKtegE9+KarKbhGAAY54p1vQwieZ6KvJHMVztCPWSGYIM
	wBO4GZIuyp8JATT07RFZteYwAixUnuyJPzVuRRB7YRbOVzHtKN5UW2v2eHGkD4K9lt60Cqlfn88
	KUkXE1lYETvX9ibUi7nfq5nDSWaexbxRsx7rgzuD4d25m6lFqaQGNYSWAf7Z3swV1T8vN7Q0AcI
	UeylaaLxljp1H2CEV+3C/tf8Wg==
X-Received: by 2002:a05:7300:fd0f:b0:36c:da71:37e0 with SMTP id 5a478bee46e88-37963564bc7mr15284841eec.2.1794851681594;
        Mon, 16 Nov 2026 09:54:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 026/105] python3-email-validator: upgrade 2.3.0 -> 2.4.0
Date: Mon, 16 Nov 2026 09:52:38 -0800
Message-ID: <20261116175359.342679-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132482
Content-Type: text/plain; charset="utf-8"

Changes:
- Drops Python 3.8 and 3.9; adds 3.14 and 3.15 to testing.
- Stricter validation: reject IPv6 zone indexes, multiple trailing
  angle brackets in display names, IDNA Bidi Rule violations, and IDN
  domains over 253 characters before encoding.
- IPv6 domain literal tag is case-insensitive; "original" field no
  longer wrongly un-escapes the local part; quoted local parts with
  U+037E handled correctly.
- Faster validation of non-Punycode domains; CLI reads boolean and
  DEFAULT_TIMEOUT environment variables correctly.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...mail-validator_2.3.0.bb => python3-email-validator_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-email-validator_2.3.0.bb => python3-email-validator_2.4.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_2.3.0.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.4.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-email-validator_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-email-validator_2.4.0.bb
index 40c727944a..77a0edc21d 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.4.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2890aee62bd2a4c3197e2059016a397e"
 
-SRC_URI[sha256sum] = "9fc05c37f2f6cf439ff414f8fc46d917929974a82244c20eb10231ba60c54426"
+SRC_URI[sha256sum] = "be487bc50bc3bd832a98515a55a15649d9bec06d954fa178663190714b6c4ee1"
 
 inherit pypi setuptools3
 
