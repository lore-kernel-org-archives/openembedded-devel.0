Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D71CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 10:58:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.6576.1755773888109050756
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 03:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HKzotjBZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso4834495e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773886; x=1756378686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FR/QV4Anazw6lks9X59sRQZJtlahaegHV9+YQO3ANUY=;
        b=HKzotjBZGRSE5tmv5Xbpi6vmRFmYf6P/F1bfOgpV0HDlSuMYh6O4aP1tCkHaIY0aF/
         xhvBPHRl3p0njtiWgTdUdfGpDtJ8+Oc37uRFakyVNrUhfTwP+7OqbAFMs5FOqyxtGliw
         j98Cdoz1Ru2u65D1fC+WduTinyTaAB/avH+0etzcfRd80+9jx+uUlhD5PyB+eOYtS+5G
         adKD8PZDC0IgxlGcwd0uGHsXGYxQd8eNAoQNwR2RgQMrYdlb+UBT8lQ2w9F2sLeMI+kK
         glIT3J9UU7dJRrfyxNQpxmblQiJO/J5tcLbjHuPDVy6vuLzWlCdjFmpIBDcRx1k+8sNn
         R2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773886; x=1756378686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FR/QV4Anazw6lks9X59sRQZJtlahaegHV9+YQO3ANUY=;
        b=I0z2vXqsLRucT+6w1gQNp0iHhvaVM88aryNilnCd+6uxZKhaKgZxcSmB5oZuZoX4L8
         8qtOkJptoTrPfB5CskfnWf+hqh0gs1fhTaMtmrmvXoHgy8FCFu/zRXbNDjQDsUpdKqlE
         ztVcV5XPXZ0TjgplMqy6nDz1tSEJK7LWuX7MxcR0jASFA6vI97087WH0+Kg+G/x+zoQW
         jVZAEEQXwazr5gw9+wo8tO82cpbDZ5QiwdkRp8+tB8mLtKCPNa6Pc6kTGTWHQwLE3cXa
         dPGNywoXOFOkbEoLmMsvon6NJfYJITq8Lrn60Ey77yFdUWywXmmZQmMLAqms0TD3DHO1
         qh2A==
X-Gm-Message-State: AOJu0YyeJ30Vgvpb2VhF+hlp5P+WhSVWkRg6EDhs1q+5D9oLPfQsYOyG
	NDxkPgTKAyLjblVtPnCwsR1FYy+wmEnyscgcI/pFFIihfe0ewg/IgAvlY0lbeA==
X-Gm-Gg: ASbGnct/ccTVizAlLHhL/F93rYkTpsCKSeZMu9axK1oNaLYnd8b2ZEQNQgwIQsp6sOU
	3s4AEyOunQqYW2gvb9UzouIIjRrSBS3gSDX93Q6xFZ/X0yDhOrPPIM7gs/phvdgolh7EdLRm+Hw
	spPsPXQmhm+aDlg+jbnixGlbV4fhf/c8PcZ8Vf1xa1S2AreXeIi6WkpYvQkDWT1S6lJ0r+GT84W
	oUj7Auo95mcS7/H2AGq6JrkY3KCJIju7z8kJyhlfKxbAuz7AvgOaqMTNHcYNwTqJB7VO4HATP4/
	fobAEeeULl35+bOqc4ctOWJNxolKAmAw7B2r1Msnd0SonuX6zbKiPlveLR/8dmxDBs7UITI2Prk
	hhhV6htCHzcx8nJQgvgz787rrHGb48GX7XCJ9fFNZkGYJhT3JtXc5ufEb
X-Google-Smtp-Source: AGHT+IFIcBtDrPmIgVgUM1qoUYIDaf6T1pdRzgaweR2/ZESC3aIK/hxEGKOitO85f9z274ZVrg3vkg==
X-Received: by 2002:a05:600c:19c8:b0:45b:4a98:91cf with SMTP id 5b1f17b1804b1-45b4d7f819dmr22758715e9.15.1755773886176;
        Thu, 21 Aug 2025 03:58:06 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4dbfe983sm25711345e9.16.2025.08.21.03.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:58:05 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] abseil-cpp: fix build with gcc-15 on host
Date: Thu, 21 Aug 2025 12:57:59 +0200
Message-ID: <20250821105759.3026750-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 10:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119074

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...r-internal-Explicitly-include-cstdin.patch | 34 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_20240116.3.bb       |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-PR-1739-container-internal-Explicitly-include-cstdin.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-PR-1739-container-internal-Explicitly-include-cstdin.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-PR-1739-container-internal-Explicitly-include-cstdin.patch
new file mode 100644
index 0000000000..bb7afec2b5
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-PR-1739-container-internal-Explicitly-include-cstdin.patch
@@ -0,0 +1,34 @@
+From af8424e2788446224a8b790d4a87aa06f4193320 Mon Sep 17 00:00:00 2001
+From: Christopher Fore <csfore@posteo.net>
+Date: Mon, 5 Aug 2024 12:09:18 -0700
+Subject: [PATCH] PR #1739: container/internal: Explicitly include <cstdint>
+
+Imported from GitHub PR https://github.com/abseil/abseil-cpp/pull/1739
+
+GCC 15 will no longer include <cstdint> by default, resulting in build failures in projects that do not explicitly include it.
+
+Merge faf1b03a591f06933da02976119da5743f428e4f into 9cb5e5d15c142e5cc43a2c1db87c8e4e5b6d38a5
+
+Merging this change closes #1739
+
+COPYBARA_INTEGRATE_REVIEW=https://github.com/abseil/abseil-cpp/pull/1739 from csfore:gcc-15-fix faf1b03a591f06933da02976119da5743f428e4f
+PiperOrigin-RevId: 659637669
+Change-Id: If14cb0e3522774cb700bd5a74abffb75feb7a0f5
+
+Upstream-Status: Backport [20250127.0 809e5de7b92950849289236a5a09e9cb4f32c7b9]
+---
+ absl/container/internal/container_memory.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/absl/container/internal/container_memory.h b/absl/container/internal/container_memory.h
+index 3262d4eb..ac01989d 100644
+--- a/absl/container/internal/container_memory.h
++++ b/absl/container/internal/container_memory.h
+@@ -17,6 +17,7 @@
+ 
+ #include <cassert>
+ #include <cstddef>
++#include <cstdint>
+ #include <cstring>
+ #include <memory>
+ #include <new>
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
index 11f4f3f9b7..a11b5cbb53 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.3.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://abseil-ppc-fixes.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
            file://0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
+           file://0001-PR-1739-container-internal-Explicitly-include-cstdin.patch \
           "
 
 S = "${WORKDIR}/git"

