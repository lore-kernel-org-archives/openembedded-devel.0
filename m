Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10290.1795753077401084464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dC4MXFi4;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b563e32936so3515264c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753077; x=1796357877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBF613LHQ8UDXaRg6gZpfnQ5nLBhhjbYqIO8ZnqWDgA=;
        b=dC4MXFi4uTnJzr+Rp9aDOtHEyFwGM1SxPRS4p63gaw1PpIiath0d5qynxkMRRiEQC7
         P3EWxB0W65pdiBl/6YvZzvRxqG9U8xWxx9smEtUXotxY3ggVl8/f0Wn/k4k0b74MQ8NG
         UtSiSmiSVYffiegsH/QeCP2ZqVuhH6vioBKid1SvKUPcRU2Cj/XMAXtLBpcLajwtKUyI
         w1WeXr4S/0B5FcXmZXNdD9KBtsy0ctvOwAlrAhiJW5hmbj8Zy1y3Zr64EwHVIGvDiwLX
         PpovCdacJ30iwzgFWf/pOWfR7Jc1mUHeDsl/Mt59Mt8+FIOzcn0wanYwsBqcrr15+C5G
         9f7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753077; x=1796357877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBF613LHQ8UDXaRg6gZpfnQ5nLBhhjbYqIO8ZnqWDgA=;
        b=Z7/eXZ2XyjSt9NnHlDX8d/o/sXpIouYNRDgW37QK8TtSEoTuirblqoUwECvfYes6Be
         mDArjy9mv8d1ChOHLWvH1ZYPGzt35xpN63Yt7Vna2GXpUEXedA5EO3xz7FGhvDqIPFcO
         uhKcsdQ6MbLguWAfT89069IicYO/0Ft88uLMar9BuMqbOAnvuvxHaIK7oK3Gr6szoq9b
         EShy3+zgEF1FBYt2emwOdXukRHt9xUiV2rkIMlJIBsOSqqVOazWuLLUjvBPmTwzNbEFq
         +DRIzEUrcgYE2esypsLlaBr8/yAW0KD5xlUQHGUvAju5oTwZKvBgy63ebGBEEvxr1gRv
         Ed3Q==
X-Gm-Message-State: APuU4Z8LR49qtjljIcWAgcnozNwe2DdDqwiFuV2Gn7Z9PpbbOxB9j6BX
	StkSxd5/vnYLQ+kXqjjl62IWWPh5SvziHFd/O4zT7lKO5NzXzb82PJgYyji01/qE
X-Gm-Gg: AZFdTZefXYjUqSkoG2gISOw1Tmj0OfsLO27DYqauiy15X6Y7abkVrM+t80YoHbk9Skj
	td+jNQ3RnXvxkImEGDv9FACGchcGLdWJW1rULWjRyKuB86YUefKh146W/nOlnpnJg/XF8LRP0Yn
	oGKPGC7h05W3cnKgNPxMmSNQTHEPZMNQikEkI+ph2QrVkUXlBqm+0mEAi/uR1aDsjr0vw9lJ1/Z
	rweZcHJDa6fa72dUxu98qxlAlC8DNh34uSxV2UaVCw2yNa+gehSD7V1pp9xMhvSObFAdbtaQmnP
	sgyVyb3VPeezPy2tFSr7wv3ht1lBCOIKtJepbc6Cj8uWGbkom6UwZqtyyIL+vHJmk1sJqjzWFYu
	NEXFl8+pdFA/vMh0rl4/SKsyyqUZ9qPtWd3Qrl00RwxRDfX1sWsNcQiTeKa51U6Q/X/CW5tj3M9
	2n8nehAWN1srf6JX5qkYQXyThErn9OrveNlSCmFIFpbGGYK6zAg172gl+RdboloAjgtkTZof41t
	kqXIvCmu6B2lRbUxrzSkWni2/ZUyGx7cEn42y4U7Y2vrTWEX2SMY3yRnWP+LXlqtrGL3l7klaKC
	gbUWSPiQO7zPPPlA2SYlHu6k5ZmngWyE5vAl5gEwHp+goTUkCe3jiBWAlfV2ArgbJXL7MigE10z
	znLn4mOHbZLXXDhuxGQANpS4kiRSqq6vZ7Iiv5bYpEjpLEcgWuNPVtGftqp++stpf9klpQYAiUm
	JsYNIzKrDKeowar0M4kMXlnzjwWEEsyUzFOtr94sLRKXy5TibQrbBJNA9KR2EUdA2YIg15Ti2qX
	S3JG5PIh7CODrsY4keCEW0A+hnPyZb2B/WF6SyVIEWyj0zRTPv0SujONtw3Epu3T0fBSX5EHVCf
	SO4C
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id a92af1059eb24-1b55689fcb2mr21112246c88.12.1795753076789;
        Thu, 26 Nov 2026 20:17:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 35/35] ndpi: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:15 -0800
Message-ID: <20261127041715.1776485-36-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133287
Content-Type: text/plain; charset="utf-8"

The upstream check reported 6.1 from the "6.1-qubitowl" tag. That tag
is a development snapshot on the dev branch (configure.ac says 6.1.0,
no GitHub release, no 6.1-stable branch), not a stable release, so the
recipe stays on the 6.0 stable series. Anchor the tag regex to plain
numeric release tags so only stable releases are matched.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/ntopng/ndpi_6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntopng/ndpi_6.0.bb b/meta-networking/recipes-support/ntopng/ndpi_6.0.bb
index 91828495f3..a6526f125d 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_6.0.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_6.0.bb
@@ -13,6 +13,8 @@ SRC_URI = "git://github.com/ntop/nDPI.git;branch=6.0-stable;protocol=https;tag=$
            file://CVE-2026-116744.patch \
           "
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+
 inherit autotools pkgconfig
 
 CPPFLAGS += "${SELECTED_OPTIMIZATION}"
