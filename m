Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.1842.1615249450178922758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 16:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BrTU+QlX;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id p21so7554706pgl.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Mar 2021 16:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4t/um8Fm8uTZnRKVyVdS9yupcQIpdTAkRSQ6AH0BH8=;
        b=BrTU+QlX31utgwrbTNvx4GYqgwdIrJAbkiKv65i5p5atEtODSF9mjC2l9lGKQRYlzu
         ytarUc6OjG2nbx3LOK6JjlvzIwuwZsXLx24SRn55lBmXcL2s5PT1ke0FoFdLwsyQR1jW
         a4iiqRN55CBFso/0MvSFesTw0mVOC5n5PI0eseHs4+91JoVkMQIw5EtJDcC/6yi0RAbM
         ookkqR/coQuKTRe+rX/DMnNXVv1dJk9fg0+CuIIvz1QCezq4WutUSgQ7W/q9O8AE8X2k
         PmUY/IQgcb8EjU0jLyYWZTl/QPVy9LvTu0AA+FLr2pukwPFJAd2TW1RyEJ9OnsHG/FGY
         U5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4t/um8Fm8uTZnRKVyVdS9yupcQIpdTAkRSQ6AH0BH8=;
        b=T8SGjIkqiwYtd06ViiGMpvA80oxmlYlgJQ2Zis+SIbntStyUnzw1b5Zh42RlQ3/Znb
         h0UrC11FsmvY2lHW4eGs5IEcfsJCxigOa/1faeXtZ5to+MX7HbPdPVXOwmUNBlt278Jl
         VToa6OtQqB7WYbyW0+nqibteBNkvHNPpyJaoKGgD74gZDMXzANDdo1195KHSK+IAavW7
         Lwe6rRSnnPAhb5mY/BnATWYcHTQJY8/n4JPJy4SSCp12uuKcuByAkv47BTzfXi70dHnE
         DHR6WYrm2IAT7/0bkORfVwaBF+6/F/sQex550uLY4TVnxrqdmdnMTVmvlmaTWdCCDbAI
         N9nA==
X-Gm-Message-State: AOAM530zU6stu6ljS6CM2vFrgHBf0SnHuaa2SsiSq0natn4wJoX/pnd1
	X+SGOGODrLhiJFxQfWdGM6Z5t6YSkvMBtQ==
X-Google-Smtp-Source: ABdhPJyf9g8fHrZ8pWx3615SfWbQyIS26ctfshjUYYbRkRh2jhzOv3/2KIcYoHKvFJbDmBOxEW0Bjg==
X-Received: by 2002:a63:2bc4:: with SMTP id r187mr22886464pgr.131.1615249449243;
        Mon, 08 Mar 2021 16:24:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id s200sm11316618pfs.53.2021.03.08.16.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 16:24:08 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mpv: Link libatomic on riscv64
Date: Mon,  8 Mar 2021 16:24:05 -0800
Message-Id: <20210309002406.2947396-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc uses __atomic_compare_exchange_1 which is not implemented for rv64

Fixes
video/out/vo_libmpv.c:186: undefined reference to `__atomic_compare_exchange_1'
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
index 973a978b1c..e04925d0f1 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -26,6 +26,8 @@ S = "${WORKDIR}/git"
 
 inherit waf pkgconfig mime-xdg
 
+LDFLAGS_append_riscv64 = " -latomic"
+
 LUA ?= "lua"
 LUA_mips64  = ""
 LUA_aarch64  = ""
-- 
2.30.1

