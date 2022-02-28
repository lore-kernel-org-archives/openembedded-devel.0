Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F0BC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:22:10 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.1436.1646086917888275165
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bdrjSwh/;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id o23so12746182pgk.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fym3ByBi9vBBcziy4Wu+7Ho492Lx2ybgorOiUwCUVCk=;
        b=bdrjSwh/XnLz17AvZZcTidAMfZwQhwmhf1bp0NmtO0cu/Hz48gjXJ9oSt0ltFXeFd6
         L8P5GOFruNOXjj2NMjhZjaFJecZeP0+DUw728XeZkiiANnzKSxT166/dXHPccTckr7OR
         whQzBGVcd2p3aRKKGlw48Xbn0+SF9RqUT3voAL82dOvU5Qg3XdpHoy8+dXde4ROWXW38
         xn4Xazuz2xPC8IKBxjNkIE58PaU1UuFQjsuWOkOFJ/aRvWVLlJ7GuVLOoFzFZ3dCBP1L
         ulcm6r3QAfPhWHraPgjZN5lPPbx+b9/Hy5fToZhG9CEykm5XkHAs3I6fqLe/xmq1zSMr
         lR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fym3ByBi9vBBcziy4Wu+7Ho492Lx2ybgorOiUwCUVCk=;
        b=R2A/Kb0rqHG0BA9LXy7lLx2si/HW6IRnjLgaoqFNWDKL1rUfZQDesdC2UHf+cIxkI4
         ioNbpXPSTeGFfUBWfv09uBA3o/yRT4s4IVy7kS6LpPp9LUzVuMv2txLw06d16ffPEoxU
         YrIh8JHxqEXVLYwHTNpfr1AQ8yXebSoMtaXoELoh6ABECAZ+cz+364A0RON9kBPLg3tV
         z8x4OLDHyEKd3DxlENsZSlhir5wTgtfAeZc70Ok5eZ7C+OxjtPkmgN9yhvPriG6eo72Y
         HCkrZYRTV3R2B0HpPUJdamqsVZA8cAzCWCwGE55RsbnlL7d26CSm4FrlPZVYky2sQBq+
         W1BQ==
X-Gm-Message-State: AOAM530GjDJE0xG851/QLPzlzwYKiGSpvPchmPM+r5mJ5rvKSYPMwP7t
	cy8Y3bNb6200LBT08CANlxs+9Ow8wkGt2Q==
X-Google-Smtp-Source: 
 ABdhPJw3qCHZK4y6NtcbS6ho+VJ0eYJDKhlC6izj6STPOOdfXNRCSvKUDni0X0pm8jvDpX38kN5LVQ==
X-Received: by 2002:a63:6942:0:b0:372:8da5:e137 with SMTP id
 e63-20020a636942000000b003728da5e137mr18983497pgc.618.1646086917125;
        Mon, 28 Feb 2022 14:21:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 o17-20020a056a0015d100b004e1c11d833fsm15430992pfu.90.2022.02.28.14.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 14:21:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] bluepy: Define custom PYPA_WHEEL
Date: Mon, 28 Feb 2022 14:21:53 -0800
Message-Id: <20220228222154.210195-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228222154.210195-1-raj.khem@gmail.com>
References: <20220228222154.210195-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:22:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95599

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/bluepy/bluepy_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
index a3b734c2ec..9bf2eed78b 100644
--- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -15,6 +15,8 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3 pkgconfig
 
+PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
+
 RDEPENDS:${PN} = "bluez5"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.35.1


