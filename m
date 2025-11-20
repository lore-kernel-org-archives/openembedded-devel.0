Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614E9CF9C5C
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 16:59:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1472.1763657941132057322
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 08:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ht4mrPh8;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47755de027eso6691995e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 08:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763657939; x=1764262739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCeL6pWChpoDTaTgOzqXAxV6ioMlbfLQGhMws0RdG+k=;
        b=ht4mrPh80U0fvgqdhBlaZpeRgpilZzu94454f54N2qGvsUyTBlwLyOhyzEOJ60uBtl
         D2VVezOkSQdDN5pHaWl065IvcbrZDUY4tTXCs11F8Z0qp1HATsRwsljJeGPq2uP1GL12
         RhqcCGjPITlfFmTVLdJuxXs4jELDZRi0/+jsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763657939; x=1764262739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCeL6pWChpoDTaTgOzqXAxV6ioMlbfLQGhMws0RdG+k=;
        b=NAGAPSzFULKUaJVSDrIRfi/ZwusCPCYLAyI+Tcgu5YGuG4NLaqRZFW2ySkfPa0VndY
         8QVAFK1roshdg4cKc/h68ySHEGOdpM/tCjdbuaanxQq+aVcp5qNyaFEvyLJkl/zwspEF
         jVxHKEjrGChM8Ra9K+repbeiZqyxBBc/jU9OoZ9LWEasXu/YCT+ur74P33+XwHs3oMZz
         5t3w6pCQolGJVPVFUrtILxQ0BVI7Qx7+xtLPyI+cAf80VIlQZWcD4Us6raJhRG5Tlx7z
         vfxZ8gsnTadcaMZaAYj4Bwun3ZUholY+ez9Q3I7MFL4fg7+tXTaomJazXFhEFfR7unV1
         egwA==
X-Gm-Message-State: AOJu0YxnD2Rzo6jsNV0nnNtNYIuYPl70VsGjlRhHOBLvpUm2oP8rWYSf
	7XJ/3JDaCFY368N8O1mK/J4tXTgKxb9sbbLxG7fcpaT1B9fe3DXO5Ydyd7xnQHkvPIkbfkUpByj
	gTNmV
X-Gm-Gg: ASbGncv4DTxC8Hv+oE72/Z9tm9k9iSdTSrLkuQ+3A8SgWznHPy+2qa/ao2Im5zIol/3
	1sI6lEXdCd3vZRb5xazCNTqd/NbjIxokZKyJbo8phNxb0ejCaIQjjYlpBWgjoULpgjX0bDy9HqO
	XOfuW/FT9WDNYtQeh1yN1OJpkzQarrsAtE4CiQqnzIGqyJcctO+xRsSq2WanTPPKK0QMZFAVcZx
	jaX+KBWCUprmsJygfjLTUwUzlMA/5xkxan3li5BkZFfTZgKfaGScBR4SevjLcOUJBX3dur1eaHg
	KrX3Rs6pbqquzxWuyLWe6X2MSphJYWdml+sFJ8vrybJX2bP8PWlWsrfTfvKJlFG5J91QEp1wk3M
	GWM6e9tInmrGoUwVgg6DO66IrA8I6vCuj929XgkgNmv3WbCDDgagkjNpC95GU72bzASmjwK89Ox
	xsG/m2E8pZz/+m6ZbsvC3gBUxT
X-Google-Smtp-Source: AGHT+IEny3S2NANjxgrzeI1LcAmw+hEqS5aEUW9II9BXjwlVOgMT4v31q5G1n83ay0/xLpH//6uDkA==
X-Received: by 2002:a05:600c:3504:b0:477:9e8f:dae8 with SMTP id 5b1f17b1804b1-477b835b953mr39971565e9.0.1763657939204;
        Thu, 20 Nov 2025 08:58:59 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b106a9b0sm117946095e9.11.2025.11.20.08.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 08:58:58 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pydantic: Upgrade 2.12.0 -> 2.12.4
Date: Thu, 20 Nov 2025 18:58:53 +0200
Message-ID: <20251120165854.2763894-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120165854.2763894-1-leon.anavi@konsulko.com>
References: <20251120165854.2763894-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 16:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121952

Upgrade to release python3-pydantic:

- Fix issue with forward references in parent TypedDict classes
- Exclude fields with exclude_if from JSON Schema required fields
- Revert URL percent-encoding of credentials in the build() method
  of the AnyUrl and Dsn types
- Add type inference for IP address types
- Avoid getting default values from defaultdict
- Fix issue with field serializers on nested typed dictionaries
- Add more pydantic-core builds for the three-threaded version of
  Python 3.14

This work was sponsored by GOVCERT.LU

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pydantic_2.12.0.bb => python3-pydantic_2.12.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.12.0.bb => python3-pydantic_2.12.4.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb
index 8016b55dfe..13035f4808 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.12.4.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "a7928e692e5a7841c4379d1af1fd37966941dade"
+SRCREV = "5c842dfc9c245fb37aa1f5ec5b55c1aed10bd7e6"
 PV .= "+git"
-SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=main"
+SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v2.12-fixes"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
 RECIPE_NO_UPDATE_REASON = "Must be updated in sync with python3-pydantic-core."
-- 
2.47.3


