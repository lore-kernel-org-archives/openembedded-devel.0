Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6834FCCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 09:33:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.27869.1761557577241973665
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 02:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=D9EOhrha;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-475de184058so6901335e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 02:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761557575; x=1762162375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNMDbG+3Cist1DEe2Zoczg6qL5Dk7vSlT/zaIyaxKK4=;
        b=D9EOhrhaK4SfEnb3CQYNnZuC1HX4+RdQNTnD6ucxjbhXnzBZVT6wAlPq+QTVmIpYpO
         ezckvt2eQTV4A3Q4EB3MrsP7J+RVNFATL/yOF64IyWSriTPCJmsO8d12u7VWvQX+H/Vv
         a6k3duQ6ilLEbfFPCKykpSY4dx7JIkkmfPbFc/e0b1hvsGEbqTkcLj9TpjKmSR9xRj2y
         FN1JMgkR84xAcTUakNDeSX/yZ3Leg7NdhSaSIgEJ4p5vINLPYohlCGtzj+HiEQWOEw6Q
         hdkhKZ1VP72V5xamgTByFa02vfpBaDWK0Oua0tBpKnT8gjkFOPasWEqgsyCzccFvedys
         P2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557575; x=1762162375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNMDbG+3Cist1DEe2Zoczg6qL5Dk7vSlT/zaIyaxKK4=;
        b=GX+9N75rHLiKPpgi7QbNE4JeNjC/GrAm2IlVWkKMEs3rOPOAidl8Dc8lGZg57U0EEL
         fukfovfB096Uh4vMjiSn/9HsFLIApB4vdnjI8PU2ObB+siBGqtLVspd9E2Hbdz7v0v92
         +Qca8C5ZA68WK+fHTX3OADkYYU+e3abssLyGHCmCrHTqsvaBNoKgMqaFKkSl6eIZ5dXq
         nOSMYfY7Yl9gffj9NcT7tvnbyE6QCS6ZF6Vtg41SrvAPEPDFxXanV2/bTKtYXj60n4dF
         2e7p+vB5fonx7iUQ9fVdkTfAItdpfQ5leIDhvW9Kdy+z5mxPAWvNU1Mc12e9Yw9p5Fou
         7tKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvkWL/9RLCzrI7tABq5SzrRwVmfnsKF501a/UqoZBQb5uD+xuvbOK5nPMJaJPxzpeP9E4++KkeKmvEkemNbO0HBpE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzMhQSSf7b061fbXuHePiq/RF2xtuW3Q4jzMDUjDRgiBLBL41I3
	54NW8wxuipqZ+fO7unc5ykMzBolAb4B2BR/gMRa2+8yBnpAoZs0aoMqOBzLaA+frOXk=
X-Gm-Gg: ASbGnctBHkAynMg4f2wJK0dZKF+OgTxszhvyzrhzBkNkLzTyY/g2lHa9wqxXw/3VNsX
	o745YnPguvAqsB9NJiBZdbxQJbawdWmvaoojMVTv0gadDJVO7iWuKt61szAHihf19jHXnqkXZXm
	I/13XAePYRddjp4VC2ALFWYJtT4ONh9oNIJQiPyfTL/IclGgGpX3fgfclOO7IjIZbc/uGU6M3WY
	p4x43PUbVvPIJzWPRUsyMEW9L9qd/uYQAxXm6nP0QuOEipDocGdXyJ0JfdBj8KlwXfEA1Qh0Dhl
	GHGDIIAZS9/basvhljKxoL9KyNwGJfkLLOGSv+0LmFRHl3H7Yj1D1n6eeOHc8Z0+EwrblWtmKA4
	hVSXFLqYP7JBNYFP6TgFVYsUk7yUkxgqfeHY6QY+3oOv+P5tPNHkldoIrHjYv42kPFGKUJPg7m/
	cR
X-Google-Smtp-Source: AGHT+IFuLBndn/U0uxPw6IcJUbDDDZbuT4TPOpFO5344arTPxtLs7df2S7B0wDnSZSBv9OOt4oypYw==
X-Received: by 2002:a05:600c:8b6c:b0:477:cb6:805e with SMTP id 5b1f17b1804b1-4770cb683a0mr34494545e9.18.1761557575415;
        Mon, 27 Oct 2025 02:32:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd02cbc6sm129275285e9.1.2025.10.27.02.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH v2] python3-gpiod: update to v2.4.0
Date: Mon, 27 Oct 2025 10:32:51 +0100
Message-ID: <20251027093251.16133-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 09:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121029

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Changelog:
- make request and reconfigure behavior for lines requested by names
  consistent with that of lines requested by offsets
- fix parsing non-tuple keys when requesting a line
- disable UP045 linter check
- use quoted types when casting
- generate wheels for CPython 3.14
- issue a warning when reconfiguring a line not in the original request
- update dependencies for wheel generation
- update licensing information
- coding style fixes
- minor performance improvements

License-Update: Follow the PEP 639 specification and remove the
deprecated license classifier in pyproject.toml. Make the license key
a top-level string. No changes in the license type.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- add the License-Update tag

 .../python/{python3-gpiod_2.3.0.bb => python3-gpiod_2.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.3.0.bb => python3-gpiod_2.4.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.3.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
index cd05b40010..405951fe0c 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
@@ -3,11 +3,11 @@ SUMMARY = "Python bindings for libgpiod."
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
 # The actual license files live in the upstream libgpiod from which the pypi
 # package is spun out.
-LIC_FILES_CHKSUM = "file://pyproject.toml;beginline=13;endline=13;md5=fca786987ac89b59c767e55467de581e"
+LIC_FILES_CHKSUM = "file://pyproject.toml;beginline=13;endline=13;md5=0fbc720d3e48432ee239eedb6adb0f07"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "daa840ed5b691e7078a9cf21c79fe813b9a91c3ed0bdbafae0181c7b98b80300"
+SRC_URI[sha256sum] = "9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 
-- 
2.48.1


