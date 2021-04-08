Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.248.1617899784548946298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d8aUooeL;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso2861036oti.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=DSD/MMjmTNaaYQosyBb05RnRICSGwq/i1TNT5tXakkE=;
        b=d8aUooeLAq2PI7F3VEumM4nddrPKDOdX4EDfjOnlUULV4xxwth6JRZ0FxdI7KZo2d3
         B33peqzQJGDRzivkMsncW1qrh3355sUQhbNZr0TodF2XN1B/c/APSBihEzDGNNljvL4c
         5q/U+gpIJZze/FYuMx4NyHR6ahBvgO7hbzUaU3/LhhT2Y7sMq5uoo6DgEUM17i+xvRmz
         kbvPcot8r5DEfQrYTCpLURwTnr0ThqErFtIWlmV5buVR2IgYWtUZKqCtKaJbz93mtR2P
         X6ayBF3z2VqvNuqy3QrLpPAs+VDl2xZhjiNKRRo9wBUPbTrRNW56kIlFDgkrBdmPbeB2
         v+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=DSD/MMjmTNaaYQosyBb05RnRICSGwq/i1TNT5tXakkE=;
        b=fTxuonTadnnkmkgWZfMQ+3JqA4dSgkdaVOIxrhqoc0bqnhnJ3FW54y31wymsViSb8l
         KUwjmCYE83llMev3smBU7xldsMlNaCo5D0wyq7MzF1m8xfwVARwIuBztNwanCTHT47dj
         fZBe8/qbqSe8oy987TX94ehTc2fSrixZoL+tjlQTc9MJ+vX1bzkDTDNmSB3u1SOXA0nU
         Vd2llZ2uZGTbjuvMlz37pKuu1ZolfQY99vExM1RNbib7P9rARjc9OoqUsvYrfz4XwOX5
         HT7lHaWkp+vSLa15GMdVjiVJsTiMRQLMD6SuAisanfMnJU7exm1CPNUlPD7BtxUNjTI+
         Rykw==
X-Gm-Message-State: AOAM5317LQaQBTAAflT3hc4buIAKHPKD501/THDQWAXpoWGpNONd8Kuw
	N8AcmMY9SRtmxclEdxWgNrjYoa6AS/A=
X-Google-Smtp-Source: ABdhPJwYfM4ZvSK5OTHB3c3B6zfIr1oOuocixv/GorpwRFVkR2Xha/tNJLv5tSoWO95k9yWDHJRaXg==
X-Received: by 2002:a9d:7419:: with SMTP id n25mr8122684otk.22.1617899783781;
        Thu, 08 Apr 2021 09:36:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:23 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 10/64] mpv: Exclude from world if commercial is not in inclusion list
Date: Thu,  8 Apr 2021 09:35:17 -0700
Message-Id: <0a354ceca3540460a881ed2f7aca2359628b4472.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0f6a40a6e504d52fde515f31f93e616005722a1f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
index 6a3fd97157b..171eef7b731 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -111,3 +111,4 @@ FILES_${PN} += " \
     ${datadir}/zsh \
     ${datadir}/bash-completion \
     "
+EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
-- 
2.17.1

