Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4DBCD98E3
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 15:13:27 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.131864.1781536403973252352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 08:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=s2uzl83A;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so22820085e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 08:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781536402; x=1782141202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GMMEuqKJi+Jt5C5yFj9gxAlogeJJVvLnWG6WciLRT8=;
        b=s2uzl83A4t8raOotQF0O0Kb8zQoxz6emV+r6tekXQY5CCSd3Ri3/aqcW2LHGNldYMt
         jaOaNK7CZbYgvWp1iTNGscV1agzpwd/l4QzhSdwQuqEWYKwF5bxeF+lIU5F4CK/c0Iqb
         i1qh73xwYYgoN8DQ7AEZ/WrpLvA1uxknXngu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536402; x=1782141202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0GMMEuqKJi+Jt5C5yFj9gxAlogeJJVvLnWG6WciLRT8=;
        b=C2jQeriKwKwBAKs9xieaFDc1S0hETO48n7rTRBYryvP1ted3CFvkLd4Pcc/i1GGNkQ
         nmMcJvNnqusrZ9imTDx5eeF09tz5fPFdI56sOgdfCQAERpk7o4P5XEcU2ETDXNfpDa+3
         9FZPwrbZb5TqnSR//sVQXpO436eiumof0mLmd1thMTKcGWnJ83euei5VXI7QcCR4QloU
         hqzJU+o35Cy1qeqaPaNX5GpNvqiLemzjZj2kcapUaX1GotHJ+YBr8LUNv/GHVRU5C/ea
         fNTdehCesrzz9q2u6KyMjWGRZiOXuCLlul39RhjTruO+StipEYwaoBPSJf+DJU7V3dHT
         +K9w==
X-Gm-Message-State: AOJu0Yyiw6ZovXymCHm3Lu++nTwq8cCNfRsP91erQHhmfVm0dhvZwDmo
	5ha/OkSN/4ldMPjCxmaO2sIytiTbzbMPrVw63avmkypYhcmv0f76ahA0hNgx7LeELeLkHtxmHZy
	Y0RyE
X-Gm-Gg: Acq92OGi3Ah/6HyN2J4Rm8DZw1gf5gTx3JAtCLYkMmXyRkCwVbgjVLY6xpLMfUBgfm6
	EuQnv2dg9tAEQmg58jlwn3Uu1NapVwzuNCks+P78kWSDISgQTpIV0F/w2qM5pBCa+0X1tJiM30s
	3K0e0HIilWAXsaUS68uSZd7ZYwvULDIxL6Lbiss3eHkZ3bNDOG6pi6n7+8MVGF3jxfa3ykS4Kc5
	29cNaeBRNZHScwDrgDNobg6IoKrU8pBbL/yyAoxuZRmcQV7HKmIWIQSzH6aIFUW8ABJ15FcESGr
	qY75dwX40kBay828s5+4qCXiRAeK/8bqsyYUxl1HDSwcV6x5+dQjE2hlEzGShBDrSkTqE9xHocW
	HwhCB/mSEFTvamFtnrmpYl6nKc3xI4m7QuF2HipGhW8W9yPSCekb5zTifBd59bVnaiD62i6llrH
	edlUP5tWQC+L3c31fJwHDIOq6fSFHvQInIDgDJ
X-Received: by 2002:a7b:ca42:0:b0:492:10e8:3f92 with SMTP id 5b1f17b1804b1-4922011dafcmr84971145e9.17.1781536402141;
        Mon, 15 Jun 2026 08:13:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4b2e8esm219066395e9.0.2026.06.15.08.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:13:21 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-portion: Upgrade 2.6.1 -> 2.6.2
Date: Mon, 15 Jun 2026 18:13:14 +0300
Message-ID: <20260615151316.3273340-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615151316.3273340-1-leon.anavi@konsulko.com>
References: <20260615151316.3273340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 15:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127588

Upgrade to release 2.6.2:

- Drop official support for Python 3.9 (EoL).
- Improve performance of Interval creation and union for large
  disjunctions of overlapping intervals
- Improve performance of Interval.__contains__ for values
- Improve performance of Interval.overlaps, __and__, and __contains__
  for large, complex intervals when applied to small subintervals
- Improve performance of IntervalDict.update and IntervalDict
  constructor for hashable values

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-portion_2.6.1.bb => python3-portion_2.6.2.bb}  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.6.1.bb => python3-portion_2.6.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.6.1.bb b/meta-python/recipes-devtools/python/python3-portion_2.6.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-portion_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.6.2.bb
index 942d7d5d4d..f72784e23b 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.6.2.bb
@@ -7,12 +7,16 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-SRC_URI[sha256sum] = "44b1f7d57e052993c4157e519dc447e57b87a4e5e00a77c1c50e7044104e53c6"
+SRC_URI[sha256sum] = "fbf334143dbac5d07ffa411784e2b29e4e1f21203385019a93e2c1a8f443da16"
 
 RDEPENDS:${PN} += "\
 	python3-sortedcontainers \
 "
 
+RDEPENDS:${PN}-ptest += "\
+	python3-pytest-benchmark \
+"
+
 do_install_ptest:append () {
 	# test_doc.py tests README.md.
 	install -Dm 0644 ${S}/README.md ${D}${PTEST_PATH}/README.md
-- 
2.47.3


