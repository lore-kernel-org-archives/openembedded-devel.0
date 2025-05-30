Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD130C5B552
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 09:41:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.2670.1748598107159016372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 May 2025 02:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YAOahRnh;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ede096d73so13270095e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748598105; x=1749202905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FiyGRD5N6lxyP2A9KZnWK4E7s3m1ZtDr6wdhTGuVUE=;
        b=YAOahRnhdaK5HR0pvPLog7iaGXRH8DaLHC0QYUIxtgyxNSQSp2+q++yN/66qrJQGp5
         CZvPADtjR6lxyAWkSsD7Q3YbR1PNI2r7GG2waaf/66MQbTQSgYeVAsEGs/Klq7lH9Wx8
         iEK4MhO+bozvcj3g7o3W89urrvZ454oUNi/9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598105; x=1749202905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FiyGRD5N6lxyP2A9KZnWK4E7s3m1ZtDr6wdhTGuVUE=;
        b=ddtcqFAFd6ewHngAKO6p/ffEFywh+engxX2/YALkdemACyG4GshptrJspNAbYb8euz
         +F+Nbf1ENpx0RSUOiJCYlxRPfdl6FOT1HUYxWSR9eaFKNdaIvxpVdEXSlQS2eIGND0fM
         uF/25cyavT6rbz6ze/9yS6BPiEAtmxfZ2Pt3ZLRmCpQKI4CjvLPueR6dOSsW80tnl96a
         Xfw5EDNmWxvtkV4IKHiZ8gmeWAONa2qjxJS2CU75G16/lvQ/RAMk08zGL3r3jF6qvfSq
         ZSJXzdTLNj2qhUjI9uBqCCW0OoGR6Pa2lVSoDzBqIfx/Xmb04t9WP2DvqOwTM/X9UYFe
         /TQA==
X-Gm-Message-State: AOJu0Yzdud12kyTbWlrC8Z+/7PyMDEe5HcXlSmaXZCD+0fj/d2NMe2pH
	8hJYxcez/w5r9U3yF6QbGJour8dYAlmiPqq/guVZs5hxyypnDy6RJXu7vlvH7PDU/70aeu/zGf1
	JiNKg
X-Gm-Gg: ASbGnct13hJ8gXnFVQ/7TlJ1QvdLWYfiWiETlz9/WfHRcnus8JTuL1xFnAi84QQaVxZ
	SHd9wGa5uu5xSt8yR43JJ6dw2KWXJlEqYm4vlEMiB5K7QbGgt0AJHBraGjDqunXG9jKjpPvK04o
	60gNXddM57iZijBMfscp0OdWrTlK72stKHJeeu/YCs+Nc5/x48wLI7jr5TFjwnQFLeddeEigjZJ
	73VbxtGBDARSUuf4jUgs5SDvXCE68DXfeyYgJYy1t7qnjt2rtsHP5cqAX4DtQ+5Ni/FDYwtc/5a
	//cftl+DelLdJ/Rx6/hqMsWpWOLtqtldEyiZox+tCsfXh7TX42mhSZTc0JZrFGh5/Q==
X-Google-Smtp-Source: AGHT+IHP92syC/tix4leoiNG3zIxQEdS09/q9p9nr/ILSLeam5ARPavZvCrNKWp9p0HRbNaVEhM4Tw==
X-Received: by 2002:a05:600c:524a:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-450d651a1c3mr24517145e9.5.1748598105051;
        Fri, 30 May 2025 02:41:45 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb051bsm13149075e9.18.2025.05.30.02.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 02:41:44 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-portion: Upgrade 2.6.0 -> 2.6.1
Date: Fri, 30 May 2025 12:41:40 +0300
Message-Id: <20250530094142.2158572-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 09:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117672

Upgrade to release 2.6.1:

- A __version__ attribute relying on importlib.metadata.
- A uv.lock lock-file for reproducible builds.
- Drop official support for Python 3.8.
- Switch from black to ruff for code style.
- Fully migrate to a pyproject.toml-based project.
- Ensure code style consistency (see selected rules in pyproject.toml).
- Extra dependencies are part of the dev dependency group (PEP 735).
- Switch from setuptools to hatchling for building portion.
- Switch from coverage to pytest-cov for test coverage.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-portion_2.6.0.bb => python3-portion_2.6.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.6.0.bb => python3-portion_2.6.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb b/meta-python/recipes-devtools/python/python3-portion_2.6.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.6.1.bb
index 2c2e67579e..942d7d5d4d 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.6.1.bb
@@ -5,9 +5,9 @@ SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_hatchling ptest-python-pytest
 
-SRC_URI[sha256sum] = "6fb538b57a92058f0edd360667694448aa3fc028ab97e41e3091359d14ba4dd5"
+SRC_URI[sha256sum] = "44b1f7d57e052993c4157e519dc447e57b87a4e5e00a77c1c50e7044104e53c6"
 
 RDEPENDS:${PN} += "\
 	python3-sortedcontainers \
-- 
2.39.5


