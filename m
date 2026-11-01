Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16845.1793547258814871972
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 07:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qNwzw8J9;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550c917fd3so3061860eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 07:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793547258; x=1794152058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjkNqXULgDt+fKkyn/2gBvlrirt/sUiAc0tW6Lr7CcQ=;
        b=qNwzw8J9JhcyP6pXsAgu/0yYK3U9rJmBh29LW6yDadNlm2TctDo7nYEBWG+agCa+2B
         zRwQ0vZj+BKC+e5g9LcO5kdu+qqLuOV9qYaLx/d0LckvKxjAqdhHxGo3l5RCxYOdtY9Y
         kgQI70im0HG0qWrWQlXo5KVElRQdxjUuhf6PMY1Udr+2oqUyihgSRIx29uVBklrpxPsm
         h7YmORgME/2P6HHfP+tSlRU28rGHR5tOLc6SR5d4i3BMAIAXBDrDK2jTYSuAwot5fI9/
         XFybeeUoi0EaLJ1Ieda5mq9VQh5VqeyGW/93x0l+Wj4uZykO8jfKNzQzjJyDAT/6Xb5n
         NIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793547258; x=1794152058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjkNqXULgDt+fKkyn/2gBvlrirt/sUiAc0tW6Lr7CcQ=;
        b=iNvlP9jmCCg58IvDrbpqQoe6nfiE7LYwq+B8J90VKZT3NPa094k9J32Ea8HKUxLoRp
         aEQ97i9fx7rT3hfku4sr6jNm8DIXG21LtDn4Y5dXx8B//x1zA1eiNs4CLANcAkvgc40Y
         5Jk2ScMNLeinx+b5rYU3+sokkA21etWBb+Wsg/6wyUF6/B7TaVqEycYENyUQn8tr8fD1
         eZ9XGuohnDgtizsizhjopFUzQ1ujeliDk5/om975X6NIEhfxSo8XWUOwQCfTPjs/cwle
         IU0BpO7VBwzNOZiaD8glFj+Fr+sr7um7QANbYouVdX2NRf3HqnlveZ8J/6hgmcn895fz
         27MA==
X-Gm-Message-State: APuU4Z/0eIkGCUb59gVotyTWDLZH45ZxvpSQOBywPHRhj006G1+FKMMd
	Ra6KyXtj8blisizmO1+ZNAuBV08IQ0Sb3R6J5vzgQmgbdbkRo18JedUsFoEFLYSdBi4=
X-Gm-Gg: AYBFou0XSJHvK3hM2fXbObjo8nGfMAFrHu46RjckkOq4F2k+q5ctzWxqKsD1PD/AFkc
	vCRNaC6+LES0Y236UqqhU8g2ewOcqHXKrYkI1nIJHrRafiaG/6Ra6fCTRwMP6aY3J+y/d3XrK0O
	5XojqgSSviFnTUZLK5NePNq3pRFrg4+s1PeeJBGBQ9agZbmcB/1X3/yqLThXrKAUgrL4Cl0FyI5
	0sf72vwYublRAyqCkiMg9peat4IdmP3S/msMkCtGNmXcPgPO5SKxGRaMRO/N8hWI/6K3zmzD0Tt
	zho5kTjC5ylNhuM/Q26jvrNTUsz66T+zBlEs2MlngV7QPoEpCkpDY6ss3GfRlS0uNjhmK0odpOC
	zb5/Vev+muW3ZegKAeF9KqhuTz9UPE9POhTfwvvobFIz69wIGBfFh0FhFETLbqEZYXABKFoXROL
	n6N6s5/cy3Q5RS/2aAgLJLDAGdezrLXbDm3fymeoWeri914Xa7TxutVIY0cPnid42/Uz3hFZSRB
	A3Nk53TiFNs7XuwdMsXL58gqJMSxiYbzfWpZA3I7cdNReNpAmPV8dHEX60tt7be/EThVcEiNwVD
	imWfzHUXaMK6UWYMKyZ1MLUISIV2Uo1DxB9Zfhlr8/la6oDaduZUpRkxjZgPnuPdrmEs0qnoh69
	3ENFbZOlA88SOxj16rp/vPk8WHcyPXGcGX3jT4G5jGoGr+0UGwST60iMsBBFGENw5WwGzjmy+nT
	q99uiYqf7DqRqUqe2LeyXyE49qRGshv0YVdL6V5awCSGK1Sm2bVqvtcEa/tl408+FkhRrD4/oNA
	c9yUXQlYx+OEdIBMRevqdeV7ajWNcSeXPQooNxdI31xyos3dM9qGvcXCcj5fJY6QcWALVprttSj
	uyLzcKYfLyuP1xlPA8fOfRe5oQ==
X-Received: by 2002:a05:693c:8353:b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-36a4242f5b8mr10051461eec.15.1793547257904;
        Sun, 01 Nov 2026 07:34:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm31448224eec.29.2026.11.01.07.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:34:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/3] uutils-coreutils: Only provide coreutils when selected
Date: Sun,  1 Nov 2026 07:34:12 -0800
Message-ID: <20261101153414.1370959-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 15:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131727
Content-Type: text/plain; charset="utf-8"

Universe builds every recipe and ignores EXCLUDE_FROM_WORLD, so the
unconditional PROVIDES puts this recipe and GNU coreutils in the same
build, and bitbake -c fetch universe reports that multiple .bb files
provide coreutils, coreutils-native and nativesdk-coreutils.

Claim the name only when this recipe is the preferred provider, checked
separately for the target, native and nativesdk variants so they can
still be selected independently.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
index 53866d6f80..c647b7764b 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
@@ -15,7 +15,10 @@ SRCREV = "dc1efd89948a9ca4c78c3a4b9a6ac891019a8c69"

 require ${BPN}-crates.inc

-PROVIDES = "coreutils"
+# Only claim coreutils when selected, separately for each of the target, native
+# and nativesdk variants. Unlike world, universe builds every recipe, so an
+# unconditional PROVIDES makes both recipes provide coreutils in the same build.
+PROVIDES = "${@'coreutils' if d.getVar('PREFERRED_PROVIDER_' + d.getVar('PN').replace('uutils-', '')) == d.getVar('PN') else ''}"
 RPROVIDES:${PN} = "coreutils"

 # This recipe is a drop-in replacement for coreutils and cannot coexist with it,
