Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.34119.1595787760468323340
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 11:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WKsN9eug;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id b9so6909876plx.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 11:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=O48YMYW7pOsyPUDH7Iv0B/PpBl4awJ/raHZ7OTWRs3Y=;
        b=WKsN9eug7p+gkvNLN+nVsnFsXZKjD+mDYHvng/1Tkyu1bEG7lEoSKx7V9xYFx9MYmZ
         iLyqWtDccBK25btUFDsVSq8yjD+mDKAQJiNicS7TjslrU6YkNwCOq9vLO0nFW4jXJ9d4
         g9F1Q64PpI9sJrS1rciqHNBibQBT4jSQe6FCa0PsEx8P6f49I22lbXXK/2z0PyyxbuHX
         rCCaWWtpAI+G/AarRnRzC0bszYhidYYDD7YFTjECpTMVFWrDlpOoJ3OTDykeJe1zldtn
         vPNWWqtyInkbHH8Cr0xpQxyHPUob1m/nqogSFv4fYH7+h7/k+GLKdwB1VZHFk1dxKR0A
         ve0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=O48YMYW7pOsyPUDH7Iv0B/PpBl4awJ/raHZ7OTWRs3Y=;
        b=m08hnZYsPvB3Xsbuyzb5K1no7Ki2UODso7lg3+TCsPK3yRCnbBTvBTGqs6yeClVzbX
         3FgZlH+x2QXQQeOwZGQtQNFZtPXwusaMfT3luVRGdRpld0KNbQ1yNVowNYHsdcfStugI
         FmVF8/w/M9vf2nhqI/f/Kk0uO37wdXGXy+VGJafV3893yfAQFJILTzve1/AL8jhijGTP
         L93SkBddbN5XI15SyZqmlYD79XPoBQbAQs7q4W5+gyHyytRaZS6erl47q7ex4NlPswRH
         C5xTBixbWNWm8lS6tWJ/MtdRLcHHLkMSlCylWIDbxIM+6obNM8AgMpN/Om8rviQt31jj
         OL4Q==
X-Gm-Message-State: AOAM532zCpBBzCvjVN2W90bJ4fsAlRGya58UKQVOvX9lzhcIDFonoHIO
	ZlPNTgQ/baya18FLUB/1fFSq5OXSXt4=
X-Google-Smtp-Source: ABdhPJzLxCMbMCDm63LS7iUlmYBQ7Eq1oJGhhiqrag1JkzMhSooCTtgFwkSIrYnsrAoY/WiFbn2Rbg==
X-Received: by 2002:a17:902:d704:: with SMTP id w4mr16648456ply.278.1595787759900;
        Sun, 26 Jul 2020 11:22:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:957c:826:e40f:5fde])
        by smtp.gmail.com with ESMTPSA id 199sm12764589pgc.79.2020.07.26.11.22.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 11:22:39 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] khronos: includes virtual/libgles2 , needs opengl
Date: Sun, 26 Jul 2020 11:22:37 -0700
Message-Id: <20200726182237.561-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200726182237.561-1-akuster808@gmail.com>
References: <20200726182237.561-1-akuster808@gmail.com>

add FEATURE_CHECK on opengl.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index bd75cdb1f4..1cd0a476aa 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -16,7 +16,9 @@ SRCREV_FORMAT = "vk-gl-cts"
 
 S = "${WORKDIR}/git"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
 
-- 
2.17.1

