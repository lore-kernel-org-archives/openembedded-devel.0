Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ABECA1016
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 21:53:29 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.6734.1757368023268303870
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Sep 2025 14:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b34vZwkE;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: rmmuniz@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8943501ba3dso3152567241.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 14:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757368022; x=1757972822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJVH8FfOGDs33RjB3DS7ix+hLnsHytIBGkJYkMxXHAI=;
        b=b34vZwkEuxuV9aVSsqEHM4H37MB7k8goq0PXvuZH+IHPOX7NdLUgP1e6mj6zSajelO
         E4kuljGDn1E19KpxxZHDUJbODwJtl0txBHfNuaon9MLJWf0iMD4JRiVa/fJpUEgvm2rr
         Hli3rZcJHxdEbNBLjd4IclztMFDKjEKEgHy8yVjZejMklk3CT3cnBzRXhnSfAQBWgxOU
         JIPp81G2jEWtO+t1qKlwEdj5kBjz2mxLoS0UZjDoFI6ELHDaVipLzJM93hXkRECWVy0E
         o00psxSHLfANjsZNca7qpKRw4qcXZIhWXlvvmPh8N3QfenvpQsXA4Zg49qxAHt6mNPVI
         nIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757368022; x=1757972822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJVH8FfOGDs33RjB3DS7ix+hLnsHytIBGkJYkMxXHAI=;
        b=m37u8cTwK51goz2LJ4/eYX0TfbFEzSdh9bvDgQNxkS++JRvMMpknW85z4ug0Op2mEC
         NIQNSSggesPJw8bS9kAC6i/lLhDf5ZUrN+1WuV6/hubvAfPvA9TdPXs1W2noxJ7p3mAu
         2bLAPSuxbp/Vo/0V6g0JM6WCtTjwjpJETDcCR7zSgtCP3SnWFFjpDgDfeXmR2mdu/9Gt
         +LSTmg34MruOEaOtWZHcTgFwrwoiF8Rm+X6hP4sLMsxObYxP7QQClfKy13e+FXLKZo4T
         XYGmC2N6WZOYbT466/kvHTQbcTltbb/3SLl9BZWXxMjHDMmSNWlQLASvqIwM6gvv1qrf
         yWCw==
X-Gm-Message-State: AOJu0Yw6Ep+CT6Zuu8ET6C/B6elbyif2ELNVUIoffImgn5gi74FagimI
	Ttu7PjlsV4ohxESE22fxjw/KQ55uwC+68IGp77Lw9Z0DSgnU28Ryui106iBPxpjv
X-Gm-Gg: ASbGncuhBMlwE4UGxuuea/zZ2jueM1GDXaHjllzfnkfeJrNZTjj+wLIxLsp1cCgZhPp
	1DAKwVKIFY8DUGgxt8r3CiCM6a7rGgcGsDmSJddsqOM1fCxDhNcofj+SXDQGbhUZLMPOStI08nd
	Wl8kZYDZ8khqN/sbO+S+4kNWmc0Q3b7XCD2pKmI98YN31SKesLnfFexg13O4GMK5KUc6Ga9vKnZ
	6jhxeRUpvppFc3VXhBiPnR/lvXBGxhESWRwM6hjhcislFtlX7S7zgCzcclcXqUISVK/rA6HBfSV
	01utErRfkkKUj/1yn7LTqQljcMkiQjmdrQxy0QQGHCRTXZU72rc3kPcN9DhLeJneS/Tf6vUJgVP
	3ZTjCYqFAWI88wyQtHahopkBbSuHEvLhhCkl2JQFD
X-Google-Smtp-Source: AGHT+IHUsOkbeJUbeLHiYtlgDO3s2Jfh8aT3tfgy4Gu9WrCE1cd4fMc+K8s6UqgnNSpGqBaWrlCL8Q==
X-Received: by 2002:a05:622a:164a:b0:4b4:8f35:c902 with SMTP id d75a77b69052e-4b5f8386268mr102462401cf.4.1757367599731;
        Mon, 08 Sep 2025 14:39:59 -0700 (PDT)
Received: from rmuniz-SER5.. ([64.228.161.9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61bbf54f7sm680501cf.47.2025.09.08.14.39.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:39:59 -0700 (PDT)
From: Rene Muniz <rmmuniz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 3/3] python3-evdev: add ptest
Date: Mon,  8 Sep 2025 17:39:47 -0400
Message-Id: <20250908213947.481697-3-rmmuniz@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908213947.481697-1-rmmuniz@gmail.com>
References: <20250908213947.481697-1-rmmuniz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Sep 2025 21:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119338

From: Yoann Congal <yoann.congal@smile.fr>

root@qemux86-64:~# ptest-runner python3-evdev
START: ptest-runner
2025-05-02T22:19
BEGIN: /usr/lib/python3-evdev/ptest
[   61.988046] input: test-py-evdev-uinput as /devices/virtual/input/input18
[   61.990878] input: test-py-evdev-uinput as /devices/virtual/input/input19
[   61.993060] input: test-py-evdev-uinput as /devices/virtual/input/input20
[   61.994497] input: py-evdev-uinput as /devices/virtual/input/input21
[   61.996659] input: test-py-evdev-uinput as /devices/virtual/input/input22
PASS: tests/test_ecodes.py:test_equality
PASS: tests/test_ecodes.py:test_access
PASS: tests/test_ecodes.py:test_overlap
PASS: tests/test_ecodes.py:test_generated
PASS: tests/test_events.py:test_categorize
PASS: tests/test_events.py:test_keyevent
PASS: tests/test_uinput.py:test_open
PASS: tests/test_uinput.py:test_open_context
PASS: tests/test_uinput.py:test_maxnamelen
PASS: tests/test_uinput.py:test_enable_events
PASS: tests/test_uinput.py:test_abs_values
PASS: tests/test_uinput.py:test_write
PASS: tests/test_uinput.py:test_not_a_character_device
PASS: tests/test_uinput.py:test_not_a_character_device_2
PASS: tests/test_uinput.py:test_not_a_character_device_3
PASS: tests/test_util.py:test_match_ecodes_a
============================================================================
Testsuite summary
DURATION: 0
END: /usr/lib/python3-evdev/ptest
2025-05-02T22:19
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 +
 meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ca91065af0..8a82db0edc 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -21,6 +21,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-click \
     python3-dasbus \
     python3-dominate \
+    python3-evdev \
     python3-execnet \
     python3-flask \
     python3-flexcache \
diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
index dc777cb987..993dfca1e6 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d7bd1cc4c71b706c7e2d4053aef50f2a"
 
 SRC_URI[sha256sum] = "5d3278892ce1f92a74d6bf888cc8525d9f68af85dbe336c95d1c87fb8f423069"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 do_compile:prepend() {
     rm -rf ${S}/evdev/ecodes.c
-- 
2.34.1


