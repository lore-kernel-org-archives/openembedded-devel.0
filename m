Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43651CAC5BE
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:33:26 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.6895.1758954796693455928
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+eOGiVr;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-889b846c314so84817339f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954796; x=1759559596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvZCCHoAel+5+Qm3oKIgG8cGBrCFKJrqbcq3a++7gfg=;
        b=X+eOGiVrf9OeIocNnEDbg65BrY9VPbugKeeuFFrXtSstVTym1oS2vFGS3GMLDgZFxz
         D1x5m8jxNfO9lgvU0xdELIHShuTX5NJvutWlBszVvsZrVet1P7v5+Me+lgIDnhBF3pz/
         M6gANLOP20pWA1tkXWRXGvPjF4MUwXKjDLZl5LqOB4/qICZ6pwoiMsTe2rK8TaT+d1dV
         MtgSAw0uAHmm9dyK3a/x58XBrmN+fhb70E/048oNpxKE1fTynpkIIhyRKn50cBdpck0n
         u71+6tmxlaYKEvIzJidKtH27V/BvF+W3SOIKf75U15DcrL6rKDM9l9/ck3vjnihCphYd
         19zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954796; x=1759559596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvZCCHoAel+5+Qm3oKIgG8cGBrCFKJrqbcq3a++7gfg=;
        b=Z3rDAcobas+rHabhGddJ2TTNn2eTwzjW1aQN3Uw7/ZWzrL8MgdfKPVOpbE7a+0X/BU
         op7YEO4mF13vXtjv84JeC4rUqRQZLbz60ARFGbXkJUeAYzzodJMgbbD7A6soq/dNaisd
         hRBIDefg5W1IFM9MRDiBxufDtLML+R5c9pa0Ag9aTHZx1xGVomU5RwV5SZadNwLMuac7
         Tk3tufJnxZnw8X71XG81LcbBw8iA8+rXPMcp8It50CkRd4uPq3/zzpslH+vmc6GFfhIT
         REoYK13+Ob9ZoYLpYGAiD08Xpyee6Ycy8ldbpxzmerP67NlkM7Hwe5owaJxj1KvEexob
         pqjQ==
X-Gm-Message-State: AOJu0YwaSfZDDHm87IYqEze4IQUsJKdD8KpoyjMGgW12MELtZNy/uyyT
	dGCFnEoJBlTEtp9nxnMiMgYFuvalmM4gwumEVvnPNEZr+yLBdZ884LkPRxHGNkPt
X-Gm-Gg: ASbGncsxt7+H7XJ4RyiBKUwmUPQiHb0lnuiE1VA8ikFoqFbgBhBDvnqpsclgar4J2RT
	t+ohPrihXqNlRazVTR27WWtX2MrdHrpHcyKwtKn0xO1qckebntAVNCLV2//PCj5RvLh+AM9/ZmJ
	DuRo8vPGIKtaMiPciBvi5RdDJtjuVIQ/3tg0hy3bV4RtdO5MqapciZQvN1koPQbXlGPK9gXfhnh
	celfSd1IwqKTXBIwVi/5gWgKbI6ljqNQDwSOlREzTlUXr47q38wi3WbinZMGL0Oo1Ztyc+WjnPl
	LIbuB+TVj2wcYbXJkELheMm8GiQffjoFJYdQ95Og0HAAx5ahLo/G/Y8j01nU9RoPppC0oqWyOUd
	MeQHc+eSid5qDb2hrYGBfH/sp4OqXX/8MjE+HMp0chnOzQdwsrw05/b906u8/hg==
X-Google-Smtp-Source: AGHT+IFqLVrCw5PxZ7jjvhmyykeP+X9ihx9IzqIooR9Rufmpbh7DMWiAjHhlcU6jVsFFoFMc6NQc/Q==
X-Received: by 2002:a05:6e02:19c9:b0:41e:dc1e:614b with SMTP id e9e14a558f8ab-4259566e744mr149620245ab.32.1758954795752;
        Fri, 26 Sep 2025 23:33:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:33:15 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 20/21] tomlplusplus: Fix test failures with clang/libcxx
Date: Sat, 27 Sep 2025 18:32:15 +1200
Message-ID: <20250927063216.1865627-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119974

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 63584aeba977af0a63f97b9902dc3429bdf1e738)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
index a6ec89a2ff..abe7ed84e2 100644
--- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
+++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
@@ -18,6 +18,10 @@ inherit meson ptest pkgconfig
 EXTRA_OEMESON += "-Dbuild_tests=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "true", "false", d)} \
 "
 
+# See - https://github.com/marzer/tomlplusplus/issues/279
+CXXFLAGS:append:toolchain-clang = " -stdlib=libstdc++"
+LDFLAGS:append:toolchain-clang = " -stdlib=libstdc++"
+
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests

