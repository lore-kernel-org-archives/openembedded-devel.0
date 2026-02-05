Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7583FEC1E92
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 10:20:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17485.1770286819463544022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 02:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ho8AxcAe;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso7902445e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 02:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1770286817; x=1770891617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TEB1kVvs4sVcL03rPUvC6KaJnwZIAS4FS+DXzCV7uGE=;
        b=ho8AxcAe5BGazQBjT6tt/SWQf6KY1TIvSNmAq+BEM5TR6u/rbhXQOD7h/6qWMMKqqV
         ifWVrOCG4h7GB5XNoVs+n9HoreoH25UJbE8e1K+cZhGp8bkfgfb2PQ6O6M+kGaocUgO/
         7jcao+Cy2+smYxDIhRKp0CDJV4Q6PnMin4w4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770286817; x=1770891617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEB1kVvs4sVcL03rPUvC6KaJnwZIAS4FS+DXzCV7uGE=;
        b=B/TblyDFzQkSgXFbHb37a0ZzjMJ6mQGLKuqUgutEqUGhBzMres0xa1i3v6K/FxnkBe
         BC48w7ngO01PqIbUTkKYAVNGWMiC1kz1TJhtdID39PSTtSgZsz8G1xGtWr87LoRWeraA
         +pKQhlAWbanexdrMqN530gYZgz95/AwUhHvwN/HLNBmMrIHJT6Qoy1T67uTYtOPmiP/i
         pHGTf/mCvlF0Iv2m84RipAPhU9Y9W5W55cvpgwUV0RxmNRPmgpmQA2i7CbahtdvgFGFV
         O1SRZcNXv4E2BTd6jUpFZ/spzM582NYw+0dio3TBHNrdqLK2ls2Dc7CUl0cezRzN7ikn
         ZZcw==
X-Gm-Message-State: AOJu0YysyCp3Vfd2uLVAxvhKZ6sFCbnoGLJ7ceFBrzrlvPDWUpjX7en1
	6TUJcl4BAoKRidlbe9KWV/5XMmgvwq+NVHSnuF7KLh9fXUe+EKAb7YR8MZNubTzx+KPWHqBhYeW
	yulSn
X-Gm-Gg: AZuq6aJLZgf+blg3928fe+Q/e40veDMS+hhh2RQdvEvZvDSpK3M+oXR/al//RLaZSph
	iVDbUyzn54C4v4RWzG7aUuzKtIRla0t+MPcg979J4qm+Z3g9eUB7ismv/SqXplcNkNnMphhpZcN
	MXIyfmBtWX38qoZ1X9alR97LlDBerzvhlr/PLLGxNkGlAC7v2e72I0u2+zEVLbleG0ajdSAPqSL
	XtGdPrytNHti29yq4qm9MkxNNTcmV1pH6yzRXjIQEjrzNktQOsY8DgyHkTIgo/litQSCIjTM+N+
	681HrlQxamEet36pAWbH9112n0gck5C/vJbf0/PMHL+ed2znIEQhibOo3R7VUTShRC8So3Hqllr
	sT38cYlDR3ySDQkZNAPReKVZVkPICPdo9k2vjG/vVI6AQO0yXp3G7GABPMqx2uRGGuoVqOyYrtd
	tM4U+GszaEB+sU9iBNaJfQ29EU
X-Received: by 2002:a05:600c:628b:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-4830e9415a2mr84608525e9.16.1770286817316;
        Thu, 05 Feb 2026 02:20:17 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a963sm40625055e9.9.2026.02.05.02.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:20:16 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-vector: Upgrade 1.7.0 -> 1.8.0
Date: Thu,  5 Feb 2026 12:20:12 +0200
Message-ID: <20260205102014.1462884-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 10:20:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124206

- chore: rm support for Python 3.9+ bump Numba
- feat: numba on python 3.14
- fix: pass atol, rtol and equal_nan as kwargs to awkward's isclose
  method
- docs: copyright should only include the year of creation
- chore: pytest log_level is better than log_cli_level
- chore: test on python 3.14
- chore: test on free-threaded Python

License-Update: Include the year of creation only

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-vector_1.7.0.bb => python3-vector_1.8.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-vector_1.7.0.bb => python3-vector_1.8.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-vector_1.7.0.bb b/meta-python/recipes-devtools/python/python3-vector_1.8.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-vector_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-vector_1.8.0.bb
index bb1e7eeed9..67312c4423 100644
--- a/meta-python/recipes-devtools/python/python3-vector_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-vector_1.8.0.bb
@@ -8,11 +8,11 @@ HOMEPAGE = "https://github.com/scikit-hep/vector"
 BUGTRACKER = "https://github.com/scikit-hep/vector/issues"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2963f0dc7a24919505850460dd1a785b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b9f683a957276148387db50971a7b3ef"
 
 DEPENDS += "python3-hatch-vcs-native"
 
-SRC_URI[sha256sum] = "8b05ea2953322c74c49d2af180f7eac73ad0aa3d4c391cab896175ec4fa3d642"
+SRC_URI[sha256sum] = "58f95e9e24463851ca34176a20df2fd2e80b41d78615e5b1f7ae4bf313424ca6"
 
 inherit pypi python_hatchling
 
-- 
2.47.3


