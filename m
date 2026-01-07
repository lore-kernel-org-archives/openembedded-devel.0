Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3E0CDC198
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:28:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2338.1767778071750290218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k3AgJatp;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so8787465e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767778070; x=1768382870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KAeL4NkJgFKllRwH2Q8cPB33/7uOR35ZLMjEPRlsa4s=;
        b=k3AgJatpO3CpXwypBXjqKHCLJK1dl/NxpNiELFilfdHvgjQnFYa1Tda7N5hNmKcnSm
         SrV87XN3lG3WlsX5N24G0UH/VwenSjb3OOZqA8juc8u1C3kgbh7VG8VXN8jQIcJX3gOY
         08WbihSvE4f6qsCd7c13nz5E3TaHKdXqrz4Eqam/VD68cUvs83LdVRzWWvuAXWLcD/EN
         /x2xwJDYGGKx4/eYguzHZNPfcJhIwmUEC59d8ee5apyamDVw7KrgGZMU2zd0BCoqdaLk
         FRxtB+yzzbRrH6wMr2LZrQVY/CpCPq2/osr/+RR60nWl/pCdv94eF7lZvuR0xWDqDFit
         0cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778070; x=1768382870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAeL4NkJgFKllRwH2Q8cPB33/7uOR35ZLMjEPRlsa4s=;
        b=SjLWzp0V9fHw2iQUY9rLK+IkaGZIqGnARgRE/mUXzDLQGpsjmOQZ7zd7Jc6iNZBSsl
         CloXt0AMwfH8c3OkUVGe64ljBOKhFu0sg1XTI7QDVsXs0Cg2jRTiI/scvqZsY5B+4nrr
         zp0Eqc9IxaBiEP8rPlKzjpxXDfGSYWMne8oxsonRyU8kpQQ6+JC2dZGTvU2uHxEWLbb6
         9D7j51w99kMMzM0u1OsfZReWbCeWXdBr9RP17X4Pcb/Kq7AadrvaAlOwMGjegR8d4k75
         qWnVg5hmYbVhlU+00JbSL2D35Gpbop9Q36vyuT+ohyAT/Xm8GjVtyNwBZjUeYagq8VPw
         6pYA==
X-Gm-Message-State: AOJu0YxVzN7TtHK4w27A84P/k6k52t0mLIeN9ITK4FU4lHF9u5xA98uD
	S4ZcGpVvV5dvBqRfxlHIAE13jb3+CnN9qiSA5xW/zpcuAwujB34bSzkjh4X5YA==
X-Gm-Gg: AY/fxX6eVWjXDN8qTjyojjdp33//GAksPyup/KuzhdqPOzaCCHIk11oR9TmOGR7QVgt
	53IM8KilFskPDCR8y45Ntrk9tkVL3kf4NbDugWJiBVZpdeh/YxuTKVYIZ76PjWHejqgcCIF32Me
	ao6F05hvB0VTduxXoETi2lEwS57jxtzp6OUA+a7V4QVNPmRroqwrxDIeP9Mw4u6EdZBmC2/nbGJ
	Xn9dI3Az/BEJtwgxTnATDG5X593lRehqQZmpfHdP1zmJsfXJl5wTeS0ydi+5Umib+o/WMgjUTwa
	0e7nHtsAel+HlT5dToQcmD4WhSh33RqHq2j1BWkzv711Z7hK5ZFkzr5aJX/ZmzT/xYlvirs87zk
	+EbigA5Jh5cbkQhzyByQHzE0w9oZ7NYV0D9niiKNZ96u7PpMLz86QC/ZWH219irZnzoWGcbiDVy
	rr4xs62XFX
X-Google-Smtp-Source: AGHT+IGswg6Za0DxkZAFeZANIiSgQXzaENglcitJLZnvYY14TOAJ4HkZWQGlYsMu73nJ8AtlF+x6tQ==
X-Received: by 2002:a05:600c:5391:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-47d84b614b8mr18710645e9.36.1767778069886;
        Wed, 07 Jan 2026 01:27:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719d057sm7236255e9.16.2026.01.07.01.27.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:27:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/5] python3-waitress: upgrade 2.1.1 -> 2.1.2
Date: Wed,  7 Jan 2026 10:27:44 +0100
Message-ID: <20260107092748.1930960-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123184

From: wangmy <wangmy@fujitsu.com>

Remove change of default for clear_untrusted_proxy_headers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ef4e48c7a06b16755181a11d1d2d0d823353a95d)

Contains fix for CVE-2022-31015

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-waitress_2.1.1.bb => python3-waitress_2.1.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_2.1.1.bb => python3-waitress_2.1.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.1.1.bb b/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-waitress_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
index b7f8099790..061586b5df 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
@@ -10,6 +10,6 @@ RDEPENDS:${PN} += " \
         python3-logging \
 "
 
-SRC_URI[sha256sum] = "e2e60576cf14a1539da79f7b7ee1e79a71e64f366a0b47db54a15e971f57bb16"
+SRC_URI[sha256sum] = "780a4082c5fbc0fde6a2fcfe5e26e6efc1e8f425730863c04085769781f51eba"
 
 inherit python_setuptools_build_meta pypi

