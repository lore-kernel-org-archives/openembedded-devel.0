Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34348.1794851736270494074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vqh0oKnH;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36dbde64409so5474457eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851736; x=1795456536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lTTfxQabsfkd6V8D54bstP+eStWjLAJkBiAHe6Zwxw=;
        b=vqh0oKnHenTxvct7BM3GxgTh1Q/N0YWP3VOmHhasoT3ViesxyOoQKBQLKe/iRuuSaE
         dmXP/vhRpTer0uGZE8xKw0Vb0XJkIdwScbH+KCZBsc5vle7PpqbWSkY0zYoNrKnyDmMx
         rzkYHBePM9DFZDLCCM3q6sYVd8/EyLkRiOuf3KlOOFckj65f0IJbi1BiH2uJAaoFOKHL
         aEWJhn/SGOj7RQHIOrg/2Pe0rSjBIWpBNw3YjMwCGz5qn6BZrF92NYWjJxsFEkaQ9l/D
         893VMX8JPRCcn+3mXD0cYg+DSCDUfI92JW+4rZ7UnzuxB9LR889DxKJPk5fYUrH8PSU1
         YD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851736; x=1795456536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lTTfxQabsfkd6V8D54bstP+eStWjLAJkBiAHe6Zwxw=;
        b=pko0PybCRPIDU/6oJMbHc7FlNPfL8VZyIxDhXXkypoZEpgoxd5Xlc3D1aNYBCoTbId
         wGKCULZs/LeGt2rShrfjwvV+6yex2ePFvbQQbZtJElKCdPBP6p5LJyYz1CguQqikKNcw
         Kami0bkC05qo4LbQzxG3JUCge/jnm0FQjakEqJsaKQ2UFOf4yseTqdJdGLeez3ebq8Oo
         oKP8W1JjUTwIAk+mXvEsyej5wgKvrKgeU85TCoY7tf3s1kHU++O1zM4hQGNYyUel2l3x
         EHkpWTYK28H/O8NaENfpBgGQoDpv7kqBFe2f9IxMlKU8uZH4Yf0yEAo8GGmcwG/ZOZxl
         kySQ==
X-Gm-Message-State: APuU4Z90eIX06/JAzMM3UFcVCJ92g8/i53EpqWM9ia2BnZXrX3oJU2U3
	466oLpVhy2P7JMsMcm4fbRbekfzXzhEvJTd7a3pbibbq4xzAjdBNZJN9fDuO9VFr
X-Gm-Gg: AZFdTZcaJKGCAX4GmKmnvwltVWBoXF9iUXy5Abtu2iCmRnC7IwGuMD6+HECdTkYut0l
	vEKaK8aHWkwP2AQelq1WLoN7UMrT9JnEVMDkYy3r2WhnOFMqVP/j/VBSYihvb522FjXzm/bYlSO
	WVszoT3vM5E6P727/TJlleUfW+2DusHi3gGXkPrA/Yv5x/WQAXsnaYDYvTA8sWJdJhjcX4Rtwot
	FPeWEnZBKn9cvQGLmbEtc7bTdRF7KfffhiTHXmyjaOo3ionMUqtpj0lIHfWL2WgcUdzBIz8xjyA
	JDeD9fz6uebyzXe7BjWnTX6j3Dg0auC/vKsthsY8AhLZHT1orFwQAdAenSDkFZMgY6qi+I2vJzK
	Kcd+LtJtQrJAl4XlvI7VwpH3X7DXUn636/Sd/HdCCdw5RkRu/HsbuV4PAOBUHV3Ca8noc6Iz8hn
	42rYT57L/7UzwbQruMupAOuCZ+3eB991lYbOORB9ITx4bqztkIp9JG9qPtnczH2KjgWpsm17WCc
	GqefKUkrvgqQ01Pw5ExNEjGoJxIqnEn68ajuiK7C+VIe2d2PoAAjlTPYyqVK/48lcj4/oJV7bks
	x6Bss41KeTmqCzo1bBUL5PGLSNkc4t2tFontq/T2p+b38zqrxsko0ioPCwQhLR20ojI/xE0yhh4
	k/cYSX7nubYAuc+Dy2PaaywpsPYLM1fVxRwXKWnj/5pkMFbROjIXKjrUeAFVrQ38NGibJ/zHWQU
	8fwKKEef+iFlQAgx1PUvLiwlDUwnwm5Gi05NY/TO4cIWICGqXKtoeOLfi3/SCni7b/sR0UIVR+J
	kv11Oj+GfED2kOOhFkzPlbmR+8XeJhifciq+595djtFCmuX2Orlj1AHj5SEntFlJCiBx0uPLzui
	NI8n
X-Received: by 2002:a05:693c:83cb:20b0:375:388:a6d5 with SMTP id 5a478bee46e88-379675fc8fbmr10186940eec.32.1794851735497;
        Mon, 16 Nov 2026 09:55:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 067/105] python3-pydantic: upgrade 2.14.1 -> 2.14.3
Date: Mon, 16 Nov 2026 09:53:19 -0800
Message-ID: <20261116175359.342679-67-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132523
Content-Type: text/plain; charset="utf-8"

Upgrade together with python3-pydantic-core 2.50.4.

Changes:
- 2.14.2 security: validation bypass of extra data keys in JSON model
  validation (GHSA-qpmf-fgh3-ff25) and of aliased fields in TypedDict
  and dataclasses with extra=allow (GHSA-3r8g-cqwr-jr29). No CVE ID
  is listed in the advisories.
- Behavior change: JSON validation now does field lookup like Python
  validation; keys matching only an unused alias or field name are
  treated as extra data (ValidationError with extra='forbid').
- 2.14.3: non-string extra keys disallowed during validation.
- Packaging: PyO3 0.30.1, jiter 0.18.0, speedate 0.18.0; PyPy 8.0 and
  GraalPy 3.13 wheels (GraalPy 3.11 wheels were broken in 2.14.2).
- Many fixes (generics, pickling, deepcopy, recursion guards) and
  serialization/schema generation performance improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-pydantic_2.14.1.bb => python3-pydantic_2.14.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.14.1.bb => python3-pydantic_2.14.3.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.14.3.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.14.3.bb
index eb8e42198e..e660a3851a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.14.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit python_hatchling ptest-python-pytest
 
-SRCREV = "b2212c787fb5c73386dc770681ec49cd09da8e73"
+SRCREV = "ea492e04654ab7f7a1f9287ea912419452ead4dd"
 SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=v${@oe.utils.trim_version('${PV}', 2)}-fixes;tag=v${PV}"
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
