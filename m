Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C3ACCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 14:33:13 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.915.1760193190412322400
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 07:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YC7f/dsJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62fb48315ddso4233899a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 07:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760193189; x=1760797989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QoACefjodq/PNdtK5xNK/P4hHek4qt0Hjc4ahFVSA+4=;
        b=YC7f/dsJU+0H8zWmusbtfAebtMQ9rUbzRidaikZOqlF3YcU+7rpHG6wlsEKDdJpCR4
         bMwu2xwX0Yg8N9QrtW0qx3C2niIviszkyPoXwBHeifZDJVNo0T1+jZET0N+aVa5fWfXG
         B22lz8QUOWLVFfuPSv0LCmobkN/kNzReLwn/vGFn/2eLwTw38BReGohc3TfWbBPEcq6y
         VO2SeEj97yAb2OUjOFtKXvOPoP4T8NFnRqtul4tK23jqnRrOkjd8FhBB/PpuUiQxeUi/
         6dpZyueMjGZ0dtZy0A/wB1SNc+RAnyMJQ3KPAQWcJ3WwLx0Rko0Q8MyDbGcKlqvqAYGt
         I07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760193189; x=1760797989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QoACefjodq/PNdtK5xNK/P4hHek4qt0Hjc4ahFVSA+4=;
        b=RAOgJ0YwKvDg5glvRKbnrwDCHYQ3TqTjGG4bh0CoFGUGNuy6Dlzp3rfjvL2OMZEfKg
         WjGhCZuMbwHcc4ygHM4k4046kRRk5zOV33K4L2Yt8yNnQjC2zD0akMDY+V8S/vOi7E+a
         JI/sadDi4BZk5oSWHYRhGS94nF1DQ4qs2YXVx5E3d+aYrDSUA0BJd/P8nUS7o6tzWetr
         CV2HL1Z+LSrcnl4ale/OLFntm1NftVnIFPmHbhHkrwK4DktL/cuOkKcJCgoXVNu3GK6u
         GUVSBMh2ct5CQlo/5+b1l5vSPFZdg78qb7d6CTimqRSpacppE0MmdhG32EpjQS8Asvo3
         pJ2Q==
X-Gm-Message-State: AOJu0Yxn5vSsyc3j/qgudOU6tjQ35QTOo4qkuBjUtye9E2RE682IWhfQ
	lQBpfiqgX/MIsjgxQdRtsftO3iulY/knqRXf1AF6JE+ASFh7kHD9U4jaT/QVgQ==
X-Gm-Gg: ASbGncvJx7DqQTUSI/GTqGzcFuMxQ2qJHJwwzsWc3c6hhaPaX/4WQ3pNlvITgQq+2Jq
	WjZodmHtZtL9/jZI51YOlhD5b1oO6sPHQH/2AqWLDm7Oupp8e73vHteqwI0Ngy+LNOj0JiJ+F9y
	go5nxsf1uTaBqYNOoCfdsaZ/2o9h0J1Tq0uGzwma+ITWIwJmXAxmal5FX0x5w2p/MvpKrkXO73/
	D8Zkn3sqrZMYNXvNmT74MF2Ue2jnWzQ3tsKS9hHigFR73CrNgadz97MZEn9fXN5GDv1m0pTF2kM
	se4dI82j1R/zURIkcOF5piErTV5qEw3tNn4/4tmFS7VIQCuiNTSJA1WMMFcEdxPwYZ9VOmNIBIS
	Qe7EMCDTLOeW8GyPbSijTO9KHQ6L89nxTt1TPxnOfii4kl6pJRg==
X-Google-Smtp-Source: AGHT+IFEEuSLif8NtEc3MbNG07MfdeB6Unnem42m57hbiRSZolqPCng1Eq1+fDQKe1lKo3dr4Xf9Og==
X-Received: by 2002:a05:6402:4313:b0:639:eed9:14c7 with SMTP id 4fb4d7f45d1cf-639eed9eae0mr10517814a12.15.1760193188627;
        Sat, 11 Oct 2025 07:33:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f750sm4820617a12.14.2025.10.11.07.33.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 07:33:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] freerdp3: set CVE_PRODUCT
Date: Sat, 11 Oct 2025 16:33:07 +0200
Message-ID: <20251011143307.2982643-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 14:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120499

From: Peter Marko <peter.marko@siemens.com>

CPE does not contain mnajor version number, so set VE product to just
freerdp.
Without this there are no (fixed) CVEs in reports.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4058959d6c273c241d48278b5e979a6270152959)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 537d19263d..f29b9afbee 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = "freerdp"
+
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pam pulseaudio wayland x11', d)} \
     ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'ffmpeg', '', d)} \

