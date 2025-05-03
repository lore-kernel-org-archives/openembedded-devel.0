Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D193EC369C2
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 14:20:41 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.11340.1746280439178644100
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 May 2025 06:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fBKppJbd;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224100e9a5cso42576675ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 May 2025 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746280437; x=1746885237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdnPrE/lpwjGdTjftKcMqSJNSZMobRKjLpz0IdT6q8c=;
        b=fBKppJbd12Fnuu1K7OnA2/vZeymZ9UlpjK/WfZXtpHB1RG/cZ6hGtnLb/i7yL9UGp1
         8rRXglWkDYqChWZwczEJAieuw5VjvW7/enPFbo0f9gH/ZKsp/CUZUi7HiyYi2Ff/H3IK
         ZYU+jkAK3QxjOtCPscWMpIVuZfWEzwVqpAtMumOwaSur4kZ/O6lqT+/Cr87nhUXvRCsZ
         WiLeAIFPvCwVze2SX/5lnNDZ9s48nRtx69mX07ltp+bO8KO1YFgpQZ9nUUEaLgSx9E6o
         9e4UbYvu0NejHoVEixrk3utk5XP3n+ynf3ckiYnL1lmn0MlEkKh4UdmqKc0ShJQU5S7T
         2Iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746280437; x=1746885237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdnPrE/lpwjGdTjftKcMqSJNSZMobRKjLpz0IdT6q8c=;
        b=JeczJtm17iwrWp57m99GyLO/NqOZ1Znn4gbFTd0QibuVoaqgkT8snt7Ee7u2d/bFRh
         sCwaho5AgXNC1KTa//WLXILAEy414tNSPCG07pmniU6ShRLwC7Gm11c0FqKqytp1y3YI
         RAIFamMdpJrkzeBuMdv+wmCiQ13Jy3E0JuA+BUFM+OhkxasxyaxHBrgQ9Iy52Q3tCTFr
         jVSReuE43lKPCtlrIejQMgaExbn9tydfAYIHXRxAjw0aPRKLQhM3lUAX4c1MqUx1lMBO
         0PSs8u+Pawom4TvqQJP3GJ23itQ0mBeL8NFsskaNO00yx5R3PqS/Gz2SOK+hMVXa+HCk
         htIQ==
X-Gm-Message-State: AOJu0Yw9+iDfAuaPiyz1VCewwQzHHGq47ww939UAmETLf+F4LOQQUJ4q
	SOnWiCXSa/1vFKEJO7sv9ZlElGiJeDKQKWIGCGGHc5Y2nrDeeaUypTVmMw==
X-Gm-Gg: ASbGncsoHajgbT6zDvHdxEhaRbTrckKYFnpwdwgP5Jsxhl2pmTttzp9yTf96xbRxV+G
	OVCf0xJclQvB7jJ9TC3pL2fBSuUGqj6UE86GqTH7FdBWSef8EptVanBZVJRlhO53JezP73iMEp2
	q/yeAZhAvTgxtQOa3ByjJc+8t8c/rRXcMDviMqz0TVDLoxSj30hZoY3foPwC6yPMyPo2Mb/7Pmb
	ys8056GAKue/uiY0ho6PLaxXTrAyYTwzZ613FClCr+ojmRHUYiJxIYRcu80RRKsSz+9qGbyXNdj
	Ew41p68FGZaxwFAOjgoL9kFlblFjF5t3cQhyBfkHmOATAuKo3jRCtzT4YH2zpk0m1a4vaQ==
X-Google-Smtp-Source: AGHT+IGisYEt57o6BPvRaZxLRGHwVNRX3UE8bC84OLhmpLB7wwc/zkNa6Sfafa+FjsrGfpaL4jDEpw==
X-Received: by 2002:a17:903:2388:b0:224:191d:8a87 with SMTP id d9443c01a7336-22e1ea18705mr15083585ad.26.1746280437213;
        Sat, 03 May 2025 06:53:57 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90fa:f3a0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151ebc54sm24375125ad.98.2025.05.03.06.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 06:53:56 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: Add a versatile C/C++ logger.
Date: Sat,  3 May 2025 20:53:43 +0700
Message-ID: <20250503135343.2207393-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 May 2025 14:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117284

- Simple, stable, powerful.
- Apply for embedded devices to PC, server.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_1.0.6.bb        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb

diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
new file mode 100644
index 000000000..c159492aa
--- /dev/null
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
@@ -0,0 +1,19 @@
+
+SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
+DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
+HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v1.0.6"
+
+SRCREV = "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+
+
-- 
2.47.1


