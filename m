Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B63C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 19:56:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.4468.1750708572486775680
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 12:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pp6q752w;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so3666656f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 12:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750708570; x=1751313370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AeiDIYiY8WoQFknC5egdl++VPdnYI7Gm87c+XEtISGA=;
        b=Pp6q752wnldb9GDGh5NawJz+ZfL1WLci9VGqkatm8iW1oP8vchZdeF00AELK4CQyRY
         r7z/R8XsUXLSPNkknXmsOIKvRt+Fbw5pos/ANlBCUdyKZsX+RjbsIJvioeT+zTqS+85R
         pZLm3uC+yDpsZ1RdFDeA9RPeue4HvpeOWPFH9NpNZpiDUg93MWfBxyMa/2apDbQr0vBT
         pnTdAlbujW4cXbeAvTsBghoYrfybanGtoZkmuFoLfOtYs8mj+8Wvhtx1+LTsvldqeXEd
         cHJx5RqkbwCGRmxYWuOFnW9R4LsMMwjS9/ACDsyxEcmkxguqWhRCaOeAg/CDMSJrzaku
         6lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750708570; x=1751313370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeiDIYiY8WoQFknC5egdl++VPdnYI7Gm87c+XEtISGA=;
        b=Z2fv/rW7zQeQNsxK04lfttjU9sCHDcTdpk37BucY6vAmkC3xOyaS6rXaV41sZtW4iO
         q7K8PRrm+k7EB+kmBRIlB+y39oeWGVTZbKY/iwt5J3hCRj6OcFlaxbNVMFDiG3tkIglx
         VEj3rEP830yVBVgDIBOXXYVqVM5sqQVKspCE//1p6gL45RNNkJexY41kTAISPsin6l7F
         Il2UkUfbLUsB6S0P3PFUz3ab8NERhVgKrSyN7nVpdkDmZ9FY8VS/MHgFbh7DRdhAm2xB
         1qxtBRUTw834mlWhlSmTOblDV36byxfPR0cVmJf/a8nviUTfpY7m3nzJNiFJpBvi4q0g
         CRqw==
X-Gm-Message-State: AOJu0YziZAvQosOjGdXk+jIeqJQVWkAnAIS8AdhdeRi8v6UXJHUKpylB
	GIOyEIW8YRQLGST8SV9f/chqHezGr5qM+mFOtK7WJd3fLJvfO9gWCZitDNpuCqIs
X-Gm-Gg: ASbGncsNAP0xpDjDAK9Ecv93lS5pVh+VLlZSxkbe1JPAPQSZt+6DiyGiFe39Ju33Yue
	k/8/ljHdtFUhr6iRZwD78yx7wAyW87wuptWhLbgM/rwf+O8fmlSTTNarjxN8yyNZYg/UiNomk8k
	epPyDLB0Lxk1nFug7deUGdpXm1Lfn46Cy0aXS3V6Z/JbNGqwho692jT+3F9CByO+oouLHkflqwC
	owYJIHxI9ooC8Jtvs//LUcGaMIdycT6nVvvZ2g0QLTYN6Su82ROc9le5nNnf47X7zKsC4qjZYoO
	KBD51VXpTucK2BJx5PVl1vImIpy3u2KApquZ7hBB0Zew7rxWLU9qc2XU9Z3Enp2hm8+d55FtBMT
	rj2GmM3r4zG3UfpE7eYzGs+9qwoV0WRGq9RkfESin+RNrLoQiRJ0DzU0B7YMZid+dZhm0mou2X9
	GAE627aQ==
X-Google-Smtp-Source: AGHT+IElOTBRl5TMKpuNHxPEvjg1PdB5QUpd1o6QRk26P7kvT+ztfAtHAk5pakdOtYGNGGKZ/3u5kA==
X-Received: by 2002:a05:6000:1acc:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3a6d12bb56bmr10069550f8f.8.1750708569690;
        Mon, 23 Jun 2025 12:56:09 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000999240070929077922e876b.ipv6.abo.wanadoo.fr. [2a01:cb00:999:2400:7092:9077:922e:876b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190cc3sm10135140f8f.89.2025.06.23.12.56.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 12:56:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] python3-supervisor: Add missing runtime dependencies
Date: Mon, 23 Jun 2025 21:55:57 +0200
Message-ID: <20250623195557.65704-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 19:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118090

Add python3-fcntl and python3-unixadmin to RDEPENDS as these are
required runtime dependencies for supervisor functionality.
Also reorder RDEPENDS alphabetically for better maintainability.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../recipes-devtools/python/python3-supervisor_4.2.5.bb     | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
index e104e1c0ce..ca6203c755 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
@@ -12,11 +12,13 @@ SRC_URI[sha256sum] = "34761bae1a23c58192281a5115fb07fbf22c9b0133c08166beffc70fed
 PYPI_PACKAGE = "supervisor"
 inherit pypi systemd setuptools3
 RDEPENDS:${PN} = "\
-    python3-meld3 \
+    python3-fcntl \
     python3-io \
-    python3-xmlrpc \
+    python3-meld3 \
     python3-resource \
     python3-setuptools \
+    python3-unixadmin \
+    python3-xmlrpc \
 "
 
 SRC_URI += "file://supervisord.conf \
-- 
2.48.1


