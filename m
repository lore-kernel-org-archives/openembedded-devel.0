Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D980FC6FA82
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 23:58:39 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.3111.1663027114888011554
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Sep 2022 16:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VqWMyu3D;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id z187so10124485pfb.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Sep 2022 16:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=OT7hN4xRCtVJ57mQuJsYcZFsyntzf/l1KPpx1yXloow=;
        b=VqWMyu3D+bgWFZQB9ztzczrBoFCFmuOEGnXjl4h2Yo0FGyhng1BiVAQFOlADQPZwz0
         YFX8hawfX6k0nPLxCYopUu3gLon9SbtJByY4JPDQLbyIrAyvdxebBvbf7CJ9n+xL+G+x
         UDbb2m6bZugR5wfP3NPqtAifbzW9OymSOFWwkmXXmhtbTP0LTu4LpTRn5nDg83srycxg
         gKPz5GUAlXWamRxUcQ1fy00dOgrkvC6dUn2gRhfkCulGQok66T5Aa5qOyw8/2j9AG/lV
         VmzmLUFvjXh6Tmec3mRuY5kPVlHUknFehOyBp9fn62JaFopuhgrt2Dd9gNlPvlj51b5d
         LmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=OT7hN4xRCtVJ57mQuJsYcZFsyntzf/l1KPpx1yXloow=;
        b=LUC4ax9Mz80Tm/CHXFyNz/pMNkWTYaTMpkAe2bc6IHaRaanDiapUG5qMMpKLCErg/p
         qXmztE8OZrmQ0TS58qtF108qpsjlB1B77u5xuhQnwRD7cKAqVLTXfVNES7M5JglqQ05O
         0CZUtnKS8HCcZq58H3XLhdUJTWFVv/fjFR1V77Wp7flmpsxMrrCSPavD3NTEDdoNBE1Z
         BwM4GTEnuQsSgnWzb8vV6lTjjWkH/e0JbiAw08XAgYMzow1ljvMVTupHAJUjHh7ULJSw
         QKdBr8GtnoXlXalUxLYcsp20DRewPSXfrJDjclVa1WajyVgTJQmUL09rIodkOcpH3g5V
         uJcQ==
X-Gm-Message-State: ACgBeo3W158slIZRDq+iaRs9nHxXe5KuZxufesvynbExUkIRlqmbKfR9
	5ZNPO8PPbMPGTYy8R+EOAeY17EpCmt3qbA==
X-Google-Smtp-Source: 
 AA6agR6GcCtXyuBy4PQ6lhOa3Oi3bnFfxwMlWMUTtnm/99nyLddMtXJrH+WGKvvgpgge51UqtUYCkg==
X-Received: by 2002:a05:6a00:b8b:b0:536:71f7:4ce3 with SMTP id
 g11-20020a056a000b8b00b0053671f74ce3mr29875163pfj.74.1663027114011;
        Mon, 12 Sep 2022 16:58:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a170902e74c00b001769cfa5cd4sm6712206plf.49.2022.09.12.16.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 16:58:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] sox: Enable -D_FILE_OFFSET_BITS=64 and
 depend on libtool
Date: Mon, 12 Sep 2022 16:58:31 -0700
Message-Id: <20220912235831.2212289-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 23:58:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98754

We use 'dyn' for plugins and the logic depends on libltdl support
therefore add the missing depenendency

Fixes
| configure: error: not using libltdl; cannot load alsa dynamically
| See `config.log' for more details

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 0791c85f74..ace8743f3a 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -4,7 +4,7 @@ and can apply different effects and filters to the audio data."
 HOMEPAGE = "http://sox.sourceforge.net"
 SECTION = "audio"
 
-DEPENDS = "libpng ffmpeg libsndfile1"
+DEPENDS = "libpng ffmpeg libsndfile1 libtool"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
                    magic \
@@ -36,4 +36,7 @@ SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3b
 
 inherit autotools pkgconfig
 
+# Enable largefile support
+CFLAGS += "-D_FILE_OFFSET_BITS=64"
+
 EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
-- 
2.37.3


