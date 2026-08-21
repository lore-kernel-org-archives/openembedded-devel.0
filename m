Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6189C5DF9C
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:02:35 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.706.1787335349244763711
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ErKnfhB+;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cace91f112so14775545ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 11:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787335349; x=1787940149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ws0vJBbhhJDCvHVXVT7Z9CX8tEkjMUKS3O8bX+KLtzc=;
        b=ErKnfhB+Q+7LYZ+/jQqwBSCJ7o04BfusnUS0c7vd4nuuBa32/bN00y1pUmGq5ZR81Y
         +OxsBHkVsoXhZ0sOwigDGtew3TW7X/7ydSNMqEzsATrPDfJ/4W71exgPSczxSIxt5VzG
         qq3K/LFfi4bMPcthjOJqBSMNGClZwwAnEyOw3gxtXePrUc1kOtbMLGsNqNOHpYkE64ce
         demIt8a8bfN37jukrPhi8p8G4FOFQ2sk6XV7eM3PEp9/uB19M+hSpP8hQVH08ZhYYHly
         TwSPEFBEFX1s9cY1mxPuFSypuW3LUVeGdzdxww/21hrYTTYbIKBHGYzMLaqgY7dzKIy6
         uEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335349; x=1787940149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ws0vJBbhhJDCvHVXVT7Z9CX8tEkjMUKS3O8bX+KLtzc=;
        b=VR5wrFKGoq0+Pkci/VicYPGhOVcAF9nB8j9KvHccHa6TREEmQNQeB3vyB6xs0x5GQU
         uaiuh3X/j9ucpfaKPEPwzT6FUg4uldSqhTN6VEuxN/vzu5OY+pHc07yd2oe5aPMMc6RD
         4r7gQbnzJXA0jg2olIiFXQOleonOws3liVwJjz2OmSTwntN5CRfW4Zl/58ri9r3y5CW0
         CHP2U6y57BPiSE5s9gvp/Vjb9HYN/uooYXMUdKWoRuf9U9RXi+tsBPekVHm4dJoKtL59
         9O6NC1TPzVy9FAK02RxAHCAq9RgKSezOv6zjOtfJ+rBKBhA8wmvHcwIwEuI3hZWnJRaI
         ADEw==
X-Gm-Message-State: AFuF++nX409ZSz/UD8nOWKiFVq4b1Gc2UZlO0hiTz5Xny42ATHjlvFAa
	zecfME6/padyBD6kDMOUmfpun8qhQReo/+A6q45vKi+xDA/e8JUyAP3Rs3sx/VbG
X-Gm-Gg: AR+sD12Vkt2gRvyGxLTmzAzp0k7/w8YfaTXW2ZNv6aH6HcohcqppVSMmKALfgy8jtmJ
	+0Ww+X1UEvS4O/wk3A4M0DXWjFy6jbfCXG8COKRfbZ82j75KQVn8j6PUIn4OGSaxImTFn8WcUot
	AccbXh/NgAL4aORDM3vq3FofhiENQ5CVmBbg9Q0IdgfMQMia5vCsr7rc9TCx1nD7SdageGYGtDu
	0I25vw/IihllC6jKbEZ9L9kurQQPCF6+y6lp55M/bg4zcXPtSbau0rGhplV73i2jMQ6OcGGwZmU
	4fzScOWzjVxGZYv6Kaokp4dtEpmscw2CjzGljOpHa3R4u1LFZKoNBA1oZ8TRthJ02YeMzFyN/Du
	vjVziDzCMYtZ/FFrIystbRLxHqCYhoAU0zowTvsDQ3KTEcyxzA5cozsez+q08ggfvXbwXuwM6Gs
	kYGbKOaxNIsPwalBUJY+kfWQ1otc0mUl1wjx2NO6fWdvMASkhT8arjyEXfJyrEO5EfsC/ps/YRF
	WB116ZZdVaVEHdB5DxUpIebFZWWfw25/eUpOsM9KjyWbkRdnPnmtdrL/Fw1sFy9baGTiwWXB4LC
	leuVVp9zWFJsqNaNshnHGC6bTrc+1PlX2hLbHf5tswCnJJZnNnZiDKrsMQPZDuYXl04OqB1BK0r
	y6jwJ7ai/5BVZME7Nu9BNsOYUtAkkiNbDRlIXHzgfNu+anw==
X-Received: by 2002:a17:903:2ec8:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d670b9ba58mr1474725ad.5.1787335348478;
        Fri, 21 Aug 2026 11:02:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm26102708eec.3.2026.08.21.11.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:02:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/9] xdg-dbus-proxy: skip ptest when dbus-daemon is unavailable
Date: Fri, 21 Aug 2026 11:02:09 -0700
Message-ID: <20260821180211.423633-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
References: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 18:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129431

From: Khem Raj <raj.khem@gmail.com>

tests/test-proxy.c setup() spawns the reference bus implementation
directly:

  g_subprocess_launcher_spawn (launcher, &error, "dbus-daemon",
                               "--session", "--print-address=1",
                               "--nofork", NULL);

so the test aborts on distros that select a different
VIRTUAL-RUNTIME_dbus:

  ERROR:../tests/test-proxy.c:75:setup: assertion failed (error == NULL):
  Failed to execute child process "dbus-daemon" (No such file or directory)
  FAIL: xdg-dbus-proxy/test-proxy.test (Child process killed by signal 6)

dbus-daemon is packaged only in dbus, and dbus-broker carries
"RCONFLICTS:dbus-broker: dbus", so the two cannot be co-installed;
dbus-broker-launch is not CLI-compatible and cannot stand in. The
existing RDEPENDS on ${VIRTUAL-RUNTIME_dbus} already pulls in dbus (and
hence dbus-daemon) on distros that use it, so report the test as skipped
rather than failed when the daemon genuinely is not installable.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xdg-dbus-proxy/xdg-dbus-proxy/run-ptest              | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/run-ptest b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/run-ptest
index ff4b0b49ad..b6f3614a42 100755
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/run-ptest
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/run-ptest
@@ -1,2 +1,11 @@
 #!/bin/sh
+# tests/test-proxy.c spawns the reference bus implementation directly as
+# "dbus-daemon --session --print-address=1 --nofork". Distros that select a
+# different VIRTUAL-RUNTIME_dbus (e.g. dbus-broker, which RCONFLICTS with dbus)
+# have no dbus-daemon and no CLI-compatible replacement, so the test cannot run.
+if ! command -v dbus-daemon >/dev/null 2>&1; then
+    echo "SKIP: xdg-dbus-proxy/test-proxy.test (no dbus-daemon; requires VIRTUAL-RUNTIME_dbus = dbus)"
+    exit 0
+fi
+
 gnome-desktop-testing-runner xdg-dbus-proxy

