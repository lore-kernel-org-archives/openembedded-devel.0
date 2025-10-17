Return-Path: <ghidoliemanuele@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C94CCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:40:59 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.12348.1760697658531171155
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 03:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kLmSbChI;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4270a3464bcso19382f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760697656; x=1761302456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRUjkrQOzPQUu/+JuOOI5c7QWQyFUoRL3ceveOzLD7E=;
        b=kLmSbChIIMVRO5z6mK1bewcTSCKPxJWkbXFfGGqlQp7q3l9Z/cXYfAp8IROHsxNLwh
         TJdlqYfr9q2frF7zTWAy9zjfAId066f6zYMeQAf/TVEmkaWjweBmGsHGKi/4sywRZqjO
         ahgbT8FH+YstlfkJt677GF62dVqqR2CRi1OXl8gdMbAy/EvpDXedkhIXVadlCJTBv/T+
         80emO2mkIUKA5fu7hx2MtmJLhHRsqbR94ae/+6cHUVlqP1zo9jSUIXsCrYS7GszZIs4z
         du5L4Na9O/mbEQ0wiLiPgany7/c/uBIgaKAN6CEL17hkrNVo4DeaiqIPdf95DeKimpkh
         /Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760697656; x=1761302456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRUjkrQOzPQUu/+JuOOI5c7QWQyFUoRL3ceveOzLD7E=;
        b=uJK7Qpu36OdZ6WswmZfYh8vlMS1i/YFKTRaR4dNZ5FfbRJOhwfAUJ1XcYMWxb3qM6X
         nITY6tkB+MjcQlfqNV3ylj3JEpEPMvH+hOcAvDaOTyGTI3Xu253iR1QMLEPcmMTBisj0
         Zb774TNHI02+Iqp0f+4az6q4ehWlYasejzQb8ETEoduWargaLEcOxUtWfyaEBnpQM3hd
         y7387s67pAhrNw90TVkt3TNrDZ0sPHsVe4DM8IQxT2W2V8bz0QqlJj4CN5cOHz+9RcTT
         CVdFWwE/FrrjvOVjCMM4kFkACi8cD8PdgxZ/DUfNGR55NSCR+6rCQxS0xKEd0Fz2FeDE
         CGlw==
X-Gm-Message-State: AOJu0Ywijsel/sIKTi/Z/fkq3S4jv67z6eOrpz6qfxPL6OctmsczbkoN
	59XYMOGo8qQstYYEIVkssqzGHOUOzURfW4q4d72gf103KzKrlVzjyWnM4XK7OEQE
X-Gm-Gg: ASbGncswq0LxEP8s7iQq+FGgwi1CSZ0lWBo5VYwTlKR4Zp4yh8q+kvC6YYktSnQA5Vb
	8SVRYwXNw91eoNYAES0HPODT8F716vJm1/9i92q0Aa25SYAnfB6dpzI4LmzortPu5UEZErABywm
	752Ld7YL2bQZ7EstM37hZ0+RqaX7qMAkvt7+e4I3wN4XWl572sMENBiLPMViHPzeI4sJ/XQlNOW
	xW+J9vzoTn1CFeY1Rfny6gS2C4qos1TTxXHpB6CN00Ey25y7P/Etg8xsCUYwLd4pfgBauayBEyY
	a1iu+W8LAjP3RpWcJFrSkl34K50vBDnrJsovoUt+u578CzbClC0vbxycbsKg8I6m9ViRxiWDkuB
	wftyS8opMsZphpaFZndQHGq+rrif6t479MWEP81B5V4bWzQoiNIhj8a9YChIRgqVK5gKEC0q9Tw
	rybOKtaoPsUAfLCSLt2z0A
X-Google-Smtp-Source: AGHT+IGeAQKNWAwi//2zE+bZnbz0lGRozrgbv/27VBBMH0xREwIfYXChKbARAAxu3hDTDfDWlxM7uQ==
X-Received: by 2002:a05:6000:2305:b0:3e7:d199:7889 with SMTP id ffacd0b85a97d-42704d8f207mr2339459f8f.27.1760697656236;
        Fri, 17 Oct 2025 03:40:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:aac:705d:ae36:2eb:35ce:6a7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42701a5f83bsm7799094f8f.16.2025.10.17.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:40:55 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: [meta-oe][master][PATCH 0/2] linux-serial-test: fix returned error code and potential hang in while loop
Date: Fri, 17 Oct 2025 12:40:50 +0200
Message-ID: <20251017104053.2983626-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120748

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

This series includes two patches for linux-serial-test to fix two regressions
introduced after commit 392f0f0ea76d ("linux-serial-test: Bump SRCREV to allow CMake 4+ compatibility").

Emanuele

Emanuele Ghidoli (2):
  linux-serial-test: add patch to fix returned error code
  linux-serial-test: add patch to fix potential hang in while loop

 ...erial-test.c-fix-returned-error-code.patch | 62 +++++++++++++++++++
 ...t.c-fix-potential-hang-in-while-loop.patch | 60 ++++++++++++++++++
 .../linux-serial-test_git.bb                  |  5 +-
 3 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch

-- 
2.43.0


