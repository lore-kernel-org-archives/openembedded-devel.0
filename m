Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DA7C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 14:36:49 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.365.1752763007052579861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 07:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=eVDWwRJG;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae708b0e83eso183508566b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 07:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1752763005; x=1753367805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrFJhxyH2X2CCh2n0aN324cVUVF971qdIqwYXYdIT6E=;
        b=eVDWwRJGTB/v8V0rmQTnJYBGKZS+2uhkCtmBB9SdK64JxWGVWNL/CZb7mrqFuDN9H2
         qqcbDZ8JfWiYAEOvnnJKMXWAV/2MvIgtncwi0iEJIM2tFcETbjuC1f4RomAq57dIvlEX
         f+7+mBdVB+dlMLCwiTTN8jgJEpZPgjf/y9+N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763005; x=1753367805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrFJhxyH2X2CCh2n0aN324cVUVF971qdIqwYXYdIT6E=;
        b=Y5f4YZENxuU0MbJ1EA96V4UdA68LIr/P/u40lunhmniufpbe9ylza6aKpQgGgVS0l6
         f6B2a+/iKFl02mdbHsR/gUz4rdrgQTCARmXyX+80FZMYT48qYDZdru/vTA7V7wIjBqjD
         XO1OHMct4Hdkzic68/RSUy3p+Grswa+Zx4ChbeMsVEJfvdJeN0YXA4YhoTNk9QOaWkWd
         HBKB2CHKchRNx34ivacfPR03O4I+e86DvYjvaV6m7h6No7EwDnBtzMfGiOowDZeYPFMV
         V9xMM5OTj3NOnnT9AuecfJaZdZlJ2NlgBHDHux8EZKi5NIwSNutHXZbXM6xKNjsu4poE
         uKWw==
X-Gm-Message-State: AOJu0YyFWcVBQgVmA3KDCnrVt7clO0FRWgbl4stl8pwnDnCycz5+A0Oe
	b4WqbjNHR8gm0fh1R7vKo2zphoHbOZC9PCHDi2isYdGfVcdr/6mcpzpBEZe4/YRrrGPY6poCn4R
	b1YbL
X-Gm-Gg: ASbGncssW42O1stqsgY+8cMnZ5Zt8EsthZq4wCM6+fiUsR8ou3YpPl1qoILolGyEsgm
	SGRNw52aJa+ArKkkcZpsF/cvQjjUBrAAD0/yx00634OER29q3+dpSlgKU4RsbrBtU8Z3YN5Q9Kw
	BQL1J0X3MwY/nI6IIxqVZ5vJeCDC3DNuWxbke2hgMWP9i5j+eTQ9vd8lFFcjx8ydpkr9CNqnLoH
	EZiVF3rNKjPY65ux0vQDqM8hYih5b2JJNH6xLEHrseIc0otZdBnEi02CDOfoGpSG6KHRMIBbEid
	KX9/SvBHU868YNeYN7VdQnoadWmuuvnoBO6vWNBA+WAfUZBu2Aiuxp3AmlQNJkWvtZEi/+7W/Zm
	TWBnaaCd+uw/cM65GD3BwFSchGTaabu+XJ6ZCMObICaPdOFc=
X-Google-Smtp-Source: AGHT+IHf9zvNhcycPeiTdAMJGiKRJk2hYI4hXtJnzw1rkuj7P9MPNN56Roqr2K7jWE45e13tI+q6pg==
X-Received: by 2002:a17:906:eeca:b0:ae0:bd48:b9c2 with SMTP id a640c23a62f3a-ae9cdddb7c8mr533673766b.21.1752763004337;
        Thu, 17 Jul 2025 07:36:44 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df562sm1357696266b.164.2025.07.17.07.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:36:43 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 1/2] python3-mypy: Upgrade 1.15.0 -> 1.17.0
Date: Thu, 17 Jul 2025 17:36:38 +0300
Message-Id: <20250717143639.1004847-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118612

Upgrade to release 1.17.0:

- Mypy can now optionally generate an error if a match statement
  does not match exhaustively, without having to use
  assert_never(...). Enable this by using --enable-error-code
  exhaustive-match.
- Handle corner case: protocol/class variable/descriptor
- Fix a few inconsistencies in protocol/type object interactions
- Refactor/unify access to static attributes
- Remove inconsistencies in operator handling
- Make protocol subtyping more consistent
- Fix nondeterministic type checking by making join with explicit
  Protocol and type promotion commute
- Fix nondeterministic type checking caused by nonassociative of
  None joins
- Fix nondeterministic type checking caused by nonassociativity of
  joins
- Fix nondeterministic type checking by making join between type
  and TypeVar commute
- Mypy only supports Python 3.9+. The --force-uppercase-builtins
  flag is now deprecated as unnecessary, and a no-op. It will be
  removed in a future version.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-mypy_1.15.0.bb => python3-mypy_1.17.0.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.15.0.bb => python3-mypy_1.17.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
index ebcac51ea1..0d1e0bd16e 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.17.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "404534629d51d3efea5c800ee7c42b72a6554d6c400e6a79eafe15d11341fd43"
+SRC_URI[sha256sum] = "e5d7ccc08ba089c06e2f5629c660388ef1fee708444f1dee0b9203fa031dee03"
 
 BBCLASSEXTEND = "native"
 
@@ -14,6 +14,7 @@ DEPENDS += " \
     python3-types-psutil-native \
     python3-types-setuptools-native \
     python3-typing-extensions-native \
+    python3-pathspec-native \
 "
 
 RDEPENDS:${PN} += " \
-- 
2.39.5


