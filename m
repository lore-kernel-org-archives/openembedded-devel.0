Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D03C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 16:03:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.78.1751990588550736468
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 09:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cPn4fnRQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso1791953f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751990587; x=1752595387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CCsTbpM/p4jAiXU1J/BxIeOogQgkgZGkr4JMzYCrT9U=;
        b=cPn4fnRQMQ9X1X5+saCSRfqRaTKgIryqa4KZZg+xsuFpB2y9eMuHg1sA5o69ic4is4
         CNGT/CJlXnrHT7lb7DqlJSXN/v8jDDrFqnvrPkkwHGQowgFyf1NFCKiRI2Hb70TUiBVY
         uNr13MODp3HWrb59rhCSKzqkoeSp2cua/AaIjVxFvZnB/qdZ2VRtfVGLINFJ6xOyjqsP
         0UNcrHBuGtezPLmgnFyPuqliRMwnuBkLKA7wozB9rNs+M5sB7jXAC9Ae+heUyiuEwWYf
         5mWEbQx3rgC9l1mb0HuOdyNrty81Gij0JnRiExBuWhtAmebT4+C+NqEeFTWzTfeDC6tA
         80AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751990587; x=1752595387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCsTbpM/p4jAiXU1J/BxIeOogQgkgZGkr4JMzYCrT9U=;
        b=wHORFEzj5rfwuZriWZquUFj+ceR7XSLDQUajhBeY5UcScYiBqEUglII/tICbKGal8R
         FwILdVOK2jlWasvWM12OYhgxXugzcX8CnagyDZCJQ7tAEgTCOcNjAcAvLwwfLIPGWihV
         YGP9T3qyZw8jFBIOKAb/VYQBA3zJPK2SLeKwnSwN0efCkxKIXFqC74jmKZOZwYnCj41X
         uuZLMzm9dDxE0AEs2tOOSsdStne5vm1GmkvFolj2CdODWJfBGOQyJ2nYpWVTJ7zCPIM9
         MG20VDaCfCvK+CPLUkUQJGmE5Qv9h12Rc1Vv+pq9DKMZgi3kgtvGGI5Z4DFi8/L5bXWa
         BzOQ==
X-Gm-Message-State: AOJu0Yx8xQ85UaiNrDS2PzJPPuy5DwzT1nMg8XhV+e4yNwFFsuajsunS
	HRrTQP43QIMQktxQ0VguRpRtTdnsboRJKI2ciXiPN4Rxwa0+RnQ9+TBMHjlMhA==
X-Gm-Gg: ASbGnctFvqFBy9WLxYhDI1t9U0glTFzTrjBkJjQFdTeBnTdcmJHDf+knbJhE0wLve3D
	l6AidXxauwzNGkOU3siQqi0h0R1YfWVPM1IjxZGRR+ofb/fws/DuAuy62hmfvkHQDOWtXDa/awV
	+XfXbml6XcNw67sxalhsxgcgMoaa1OStw9DumVuYI5ya6QTBhAap78BNzE7yhsN7BWF/IxsAHT0
	AQy9Iq9RZUcgQhrlCqKMGBjwi7k/0rBslbBlwYhZpKu8Gre+O9raqcWFvxrleSB42XRuek7TNKK
	KL2sVS6ssMPImSU4I163RXbL2RbnRxcWwacTgi6KHkmsraZfP13RM3h977lizDxKXaPVFyLW4i5
	/+bWWRXDYmbjpchTwPCc=
X-Google-Smtp-Source: AGHT+IGsMZ/7GfdzPxHvaVenhef2dKVBoR8NgbwSFuabeSzQLCBN9oqW7KY0iAOJim6AgazGbVtWjg==
X-Received: by 2002:a05:6000:1a88:b0:3a4:fc37:70e4 with SMTP id ffacd0b85a97d-3b5ddf06175mr3436337f8f.58.1751990579190;
        Tue, 08 Jul 2025 09:02:59 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c4f9sm13225540f8f.88.2025.07.08.09.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:02:58 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] gpicview: add dependency on libx11 and require x11
Date: Tue,  8 Jul 2025 18:02:57 +0200
Message-ID: <20250708160257.3879135-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 16:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118315

From: Martin Jansa <martin.jansa@gmail.com>

* x11 doesn't seem to be optional:
  https://github.com/lxde/gpicview/blob/master/configure.ac#L57

| checking pkg-config is at least version 0.9.0... yes
| checking for gtk+-3.0 >= 3.0.0... yes
| checking for x11... no
| configure: error: Package requirements (x11) were not met:
|
| No package 'x11' found

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
index ace909fcf1..b4f100ffc4 100644
--- a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
+++ b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
@@ -8,12 +8,14 @@ SECTION = "x11"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "glib-2.0-native intltool-native jpeg"
+DEPENDS = "glib-2.0-native intltool-native jpeg libx11"
 
 SRC_URI = "git://github.com/lxde/gpicview.git;protocol=https;branch=master;tag=${PV}"
 SRCREV = "ca13623c6176585db4759ce4371fbf89c56fa630"
 
-inherit autotools mime-xdg pkgconfig
+inherit autotools mime-xdg pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk3', '', d)}"
 PACKAGECONFIG[gtk2] = ",,gtk+"

