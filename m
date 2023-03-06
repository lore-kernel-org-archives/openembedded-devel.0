Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92349C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 19:21:13 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.2304.1678130464856630219
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 11:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BA83f+u5;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso14155991pjr.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 11:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678130464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDBlQNBhnhksxMBfQohZRm8zrlMU9OueHDvgU16Qymg=;
        b=BA83f+u5QsUCeS2fGugXWwcybupPgszYzeVfFg3yJRFFGvC5cStsptBPR6jJcHDpAI
         5QbUYlH9fzontu52URkuaWHVxSpCJGliiN80/V8AVMQmypmCfAbC+gGjn0S3zBO4tUhr
         ExdmmapeD0EUSiIbgx6LcbtqJiRDBng1NeW0bTw430vPs963+UkM0vyVxDtSQdftjHg0
         ku7huxI7fItl5eEjoqwYjqpZ7/yrof7uqZ9J5AmqfjOmdy8pIiCvFBaYK8HhaY5XfI4c
         EiYDXgR2FrESuEm9VYtG7Dds2noda+zehDxXJXLeoBzk285s0KoS+duBrEjS1X5SLh+y
         M1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678130464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDBlQNBhnhksxMBfQohZRm8zrlMU9OueHDvgU16Qymg=;
        b=571kwipkKgAz7Q83ao5m+b0UyIcqzBeY9DPRcQcLXyaesEVUd7qBZUaUhCma1EI83I
         c4qPKmPEvmzEsV5NcfXgS0VQn1S0Sv91Ih+anMZOMnE+OAHUZrB9igU7fWkf7AU/WJzv
         Jg5r8ujcLMiZQet0wHLN5+3g14sa1NyP3ZqAE0lEJ8Rj48ferzn50qLW6GCEqJI7ArcS
         BqPDvkaRPtKQ07iaY9GrPUXSgBZG9h5nHbaNYJL0Y9eeP1Toi/XVdw6lculYEvdMnyXk
         14U94k9gaq2Z7q5Ou3OSZFnW/+kppU2PT7TCEspwvoy+tPfkY57DqMYmb6rt5YVi+29W
         49Vw==
X-Gm-Message-State: AO0yUKUx7YF/2TU6hGYj7pi4X4Tb3JzWD7qW+QNebzfHJD/dLmMciqXw
	PyRm4+k3WhLqkTwmfhGzuolKRMhH8C8=
X-Google-Smtp-Source: AK7set8q+dGCCqGPVjWHOjD4axfAAJAD/m2DAlv59nQcm5G/eiB7xbQohou9QBj1d30qcFwPY8Uu4g==
X-Received: by 2002:a17:90b:4aca:b0:235:9d0c:6e3f with SMTP id mh10-20020a17090b4aca00b002359d0c6e3fmr12353189pjb.31.1678130463781;
        Mon, 06 Mar 2023 11:21:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::c80d])
        by smtp.gmail.com with ESMTPSA id gt18-20020a17090af2d200b00235419fc2d1sm8015130pjb.40.2023.03.06.11.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 11:21:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] packagegroup-meta-multimedia: mycroft needs pulseaudio
Date: Mon,  6 Mar 2023 11:21:00 -0800
Message-Id: <20230306192100.3287883-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 19:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101400

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index 2b7a43b93d..6f5c244519 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -64,7 +64,7 @@ RDEPENDS:packagegroup-meta-multimedia = "\
     libuvc \
     mimic \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "minidlna", "", d)} \
-    mycroft \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pulseaudio", "mycroft", "", d)} \
     openal-soft \
     opusfile \
     opus-tools \
-- 
2.39.2


