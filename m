Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F44C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 09:36:19 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2696.1784108170221722192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 02:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R1102pHF;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1339432f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784108168; x=1784712968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cK6SX5lhzqKVgteZCzusc+mcWGJF1ogpZODWAYxO7H8=;
        b=R1102pHFdcCrU9n3uF3oScKZDuw6Fap8rtkubq/Hlx3j2Dx4/wqi5I1W2Q1TuFU0E+
         JO86dggc/LTMi9sFO35jwXi8um7sm5LSCvL27lHHJQO6lwXcYtl8ZzSvCXa+ZWWstvu5
         +FThfMWHwZFXw6SSbMusDDDIJ1DZJetdBsOTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108168; x=1784712968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK6SX5lhzqKVgteZCzusc+mcWGJF1ogpZODWAYxO7H8=;
        b=U90iAfNpvMIBN/e2yiLzwAgIH9KTz4nhLr5eKsq5/z2/pkSb8FbyLxrTlvX+NTyNAq
         LqPawLzHYhRVGechf1lhYt4Lvp6HCWDDH9BbF9kjcTQgVRaf0upK8OwTQoU20UfjWkWw
         oewrRzym6kpYWSvABuW+KoT7JrjeCiqyZ8pCLDgZKmZib3V2Nx+9aNxkG37Jn0SArq9z
         wNOL12phpylj5zKm8CBFs52IEKft0MBTJTeVGz6KBUbulF3R1uBwwgjiXfHVRac9xmX1
         ecTvNzOCgLORW7OI04w42/WUf1M6GOjlJmpC2CJTjtDsCjpUs0Y5HEm0l+EraSwlyRM2
         SvZg==
X-Gm-Message-State: AOJu0Yzu8oXA/WdIgRj6zqzS393ePgiKcb3v94CUaDK72e1+HZpuK/GT
	RbAiqH1AZ9U3NZcnKgndWXgbJoNA87F+y6eqTs3TvgxszuJUsvDnP66ihqjHki2q1TeObOEmPo5
	6dZYk
X-Gm-Gg: AfdE7cncOxEyMMc6dIWV4kCFHr6zdBI2wu+VosikhjiY1Sdjvy7h2xOZ7nOhNspILMm
	WSXIz8gEllz6R7WPzH41TnL2gIYelitqqG38aWW9LfHtx9XoaNiYwWkleuAcavFU4p9InHLayrO
	I2SRyYqvwwHHk9II5biobtHpZLfVGbNaBXKhSdaIptr8Y0PKm++wDhZ8tyF4e5a4dz8rutFCW7H
	xFio50ulF9F6Ea7irF048crxzPElvLaMJbpSYGtoh90Dns2oMhmDhu7wyxpw8r1T2TzO1v6Bx1H
	AOWbhyM+YbGEAUevVw4rTC+nODkrQuXqPWpdBuKP5LPsYI+z8jf7sc547QHT65yAGAzdp0Msgx2
	7U2uFxTXpvAWwr72wFACvMLo3553Nx1OgJBlkdxaHEk/FBBylzf4+tZJKUmYuefLJ2FBU0Vziwe
	+3N44DA6swcrryx3Y75lhsEuCNLmzBc7oKpIC945SjUcqW87rj/EdTY6nIb7OPsWnbgkhh9F/71
	NjZC/RbYgfGyRZQUm29C12pU/3KltCrRlesJ9sx6g==
X-Received: by 2002:a05:6000:1a86:b0:45e:f439:9def with SMTP id ffacd0b85a97d-47f2dcbffdemr18965226f8f.15.1784108167758;
        Wed, 15 Jul 2026 02:36:07 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm15032791f8f.33.2026.07.15.02.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:36:07 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-asttokens: Upgrade 3.0.1 -> 3.0.2
Date: Wed, 15 Jul 2026 12:36:00 +0300
Message-ID: <20260715093602.2749784-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 09:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128171

Upgrade to release 3.0.2:

- Modernize type annotations
- Fix pypy CI by skipping redundant mypy runs on it
- Fix IndexError on source mixing lone CR with LF line endings
- Release modernization, and publish to PyPI from CI via trusted
  publishing

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-asttokens_3.0.1.bb => python3-asttokens_3.0.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_3.0.1.bb => python3-asttokens_3.0.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb b/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
index 5b6cf0624f..8f460cee8d 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_3.0.2.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "71a4ee5de0bde6a31d64f6b13f2293ac190344478f081c3d1bccfcf5eacb0cb7"
+SRC_URI[sha256sum] = "3ecdbd8f2cc195f53ccada3a613538bb5f9ef6f6869129f13e03c30a677b8fe2"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.3


