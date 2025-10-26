Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF45CCD1A5
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 14:54:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.11680.1761490489833680913
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 07:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=bhnnVG2C;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47114a40161so41635455e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 07:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761490488; x=1762095288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BbgXwUvQ4/nuR2Mm7zzBDveTqmGHyU02py2pZFJ6uF0=;
        b=bhnnVG2CQlCZXY2YnGXY9nuBPTzvDXV5xGGyBI8xUZi4DQIDzoYQn/o/OMSBASxXd4
         oBK00Wl+hf0e7uZtdYQdondnr1laFef71/ShMqzyH94W4KbL7YX3Ggajgho64DxZEm56
         PKun8LOsR1WnJmr4Kp8Oo0hqN3iAMcaLjEJ1PdQMK58L0r1TMP/0X6ay1JHG/Cbn5HlZ
         PUSTpkzROXxJvv+HW6CraGacqHDqxpVsHgdOnYjpII88mtOgCJtBYbJP/eXoCI6o4P/3
         zwhy/HY+9X7v12TTGkLAw26C2I/HrgiFWsTPA2eHV5aFsCttiJC8HeLyLCJUxvqwPawL
         NmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761490488; x=1762095288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbgXwUvQ4/nuR2Mm7zzBDveTqmGHyU02py2pZFJ6uF0=;
        b=h5irGrfYb98dSKw1PJxXaxizCv6EW5uKStLiZbVaUs6UwV3F+jp5FWN9knVLSV4RMl
         9lEfiffXB8Aq1piBqJU1+EHNZMRQ6pojs6NRpdbArIjkeNRjynG+c/PXNCaa9wmPIlac
         6dWdIIVVJAbnSwAXnk3o5N8MCtOeHlea1S/3xA/U8gLOHxkDaBbD186QismTZxPH1kE1
         F/Zs7mt128A/1lnR9ygygFhgnxQaV78/9xOj+6nCvpYWF11CVFVZtAglS7G1eJNzPbwM
         /1EktV8rwaEeCnnRe8TrdpJqpbns+jWqm90KjwQyzwu+WFiuquw2JDTfrdiyzC1dsGL5
         exYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9dxH+BXssMLJZZmUEWRha5W54mRT/WicGTCxzBxC7iqbrSXeyXbJsGqqnikGk/90T6RoTlb8OfsvskAV51p26Wbc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyB7f7Y05qO6RGKjwjbkm98oZDedE4yoOzfROCxf5AdGZBwKK7r
	zy1kzB+j5aRi/QomDXZ7OwdVJRet8oMY7Nd0ePuIkIPsv+Qk6fsdg0E7Lu/hIQfMzjU=
X-Gm-Gg: ASbGnctqglYPCV8vpemdGq3Ng2LVA3WB4/JihIKfGP3hM03A97GjXJ6Gm8fw35gLSKe
	mAABsylwBBje7ODERXoE7te73oKRPMEnfMuvdne+5ATu0lKJO8AU1bXpyDzdJLc4GjxRI8LpXFT
	jkM3WTpTqVkMpOayRE+sLnb29VtFssbiRHRJrL8q3smwo3bqIlQAe1BVEyaxQ2egmpmOy6X96vn
	YjMNtyBnS8uWdmRN6pjdH8gWwkEr+1+Oy3r2TAWV43YtkQM520YzHUg3VPD9KOkCFUCAyOpoWfO
	DaSxlnS0osHKawSF9sLJwkRqOQjX4Jb/GrsPJ3TKfDg9fgxT+fxmQ1tL9t6VUmhU19tobx24OxQ
	94J9kq85qFgrTfJPJznoI6MOfCrc8Rx73iCmLDBLkNwC7RHLZXo0e9F+OOkbRkIcv8pd9Vz8JI6
	BD
X-Google-Smtp-Source: AGHT+IF4GOEfq6KuI2AToQsroQWI2/Ovn7GfphrjWoookmDQtzI3A6i2dA7sy77fhPqjCvq9/Uk2Sg==
X-Received: by 2002:a05:600c:3b03:b0:468:86e0:de40 with SMTP id 5b1f17b1804b1-4711786c6b9mr269571145e9.4.1761490488035;
        Sun, 26 Oct 2025 07:54:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9564:dc1a:f8d6:8ec9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475ddd52079sm40608015e9.6.2025.10.26.07.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 07:54:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-gpiod: update to v2.4.0
Date: Sun, 26 Oct 2025 15:54:44 +0100
Message-ID: <20251026145444.7355-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 14:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121013

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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
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


