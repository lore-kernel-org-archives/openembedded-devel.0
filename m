Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DB4C61DDE
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:40 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.996.1788051038657289672
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CnPNXEUc;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so2712974a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051038; x=1788655838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDY7YAOqwGWqWjO2dlPxZqMA9Q1vzNtOiA6oNgoljVo=;
        b=CnPNXEUcucB1yqBipf/tfX8W2K81zjEtFY2NoSG33zzxiE1mkobYMThGalELwXkiSx
         sHQgQfEe1WJLox9Q1KptlblvOdU/miBPqs1yq4NL8rVSPBAS1ssIii/3i/SvfUHlU36y
         uPqxKpajFJuF3zRgKV0JHDNpvozFN+UNdeTdwxjQTXjuHR3H3B2wE3jliQNtU19eIvY9
         R/ZMVCVm0Uzg6Xh2apcUTpvjCplZAgZr4eSuqLI4SQQ/3BRB4MHg+N76EJUxB8zqObTL
         tQJjS5e+6j3pSIsS6cCeQzO01wWgjDKqJVFVZi6cSIKTg731jm/9k07Qquq+YPRMi1ef
         Lm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051038; x=1788655838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDY7YAOqwGWqWjO2dlPxZqMA9Q1vzNtOiA6oNgoljVo=;
        b=LBr/EdfToT47pDCpSIiBwP9SQ8IOvvNmZtTjtGpB5w8hp+wBnRfOq9b+JYBCCbiN6o
         DCutTqD75tfBpLarj5FUIsUf3t+Fdn2yTzhUfzwnKt4lNgVQDA2gbYFgqevGVhDThsGl
         aCl8ZsCHPR9jC39W4EIpGpnMHot/cTz+OIHOjbf3NORzwwVcTXKWHvaqSUpP4hF1ZWTj
         TmXvCSl74AyZhPl4FDPLUjVCV7j6E4XB5nHYR8O7puG7fNbfTFAEjVjA6MDdaUIuIZez
         s3ul7NzYobLOMwNVYNDq3piAcYNNuOLckGFwkBUMAUA8Y/3FuevfWygWZRo9dlaJQhmA
         y9Iw==
X-Gm-Message-State: AFuF++m75DAcE2h2XriUrYcd6WAwbU/WC6BTN7ByF0u7eVuHoFdKYAXb
	r9h+gssKBVViFA5fptEF3ni5aNGhWLtR25gtigLmGph7iyLatTgk+RB6tB1dM8s2
X-Gm-Gg: AYBFou1TCUMWyvTfugeMQpPe/F9/YKpcfkUfwRWuF124qQlp9N30OW3Fw3tlynfYBt9
	dnvsrpW1MswtgQjwKYDUNlBrhaA95OC+rkNql468mZNiJZ/uyNgIfTY4ppKw1ouiZX1pk97xLhH
	vrgJtYnD32pRTpXrMR2ndFSArpspQvhSJsPvMUXKMw5uQioG5w+gfBRUgLH0nfAqU6WI4H34Vep
	Y5P18FiIx/kxRH2mAD0Y3TqFl7smLkYrqDiCIEL7IzsvrK0y2QUi1RPhJGURTCCP4oVYb1OBHdH
	EOdsqJqxEljI/3ukg8Y1r6K3RCFAmvZY0YT702KFs51N8AoFLxz9zQxxhqk3PgZATuZzrNcEQd3
	nau0uv2Hs622nRK+svIyIDnIrpj91gDJ2iDWXlOz/8l4KBgr95KL1zVV0eI0NCF11TtOoCQl9RR
	f5kekUWUtVs3o3xDS6Apnc9JKTb7Sm/GV52aVCETEKebvR3PSJMrK5LLUFzEWsBeNLjLcb391Y
X-Received: by 2002:a17:90a:c17:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-398a2ed7e86mr7554847a91.24.1788051038055;
        Sat, 29 Aug 2026 17:50:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 7/11] python3-sdbus: upgrade 0.14.2 -> 0.14.3
Date: Sun, 30 Aug 2026 12:50:11 +1200
Message-ID: <20260830005015.2555347-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
References: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129588

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python-sdbus/python-sdbus/releases/tag/0.14.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-sdbus_0.14.2.bb => python3-sdbus_0.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sdbus_0.14.2.bb => python3-sdbus_0.14.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sdbus_0.14.2.bb b/meta-python/recipes-devtools/python/python3-sdbus_0.14.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sdbus_0.14.2.bb
rename to meta-python/recipes-devtools/python/python3-sdbus_0.14.3.bb
index 532349dcbe..e15bf1028e 100644
--- a/meta-python/recipes-devtools/python/python3-sdbus_0.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sdbus_0.14.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-sdbus.readthedocs.io/en/latest/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e77986dc8e2ee22d44a7c863e96852ae"
 
-SRC_URI[sha256sum] = "4f5d13b196e1e1de35311ebb2563a32de791451a30f5b9a4894528ba98766412"
+SRC_URI[sha256sum] = "4ec4fa4108629bae5ab2775e5575b0251fdb555d4a3613c9ddb37fc73f882983"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 DEPENDS += "systemd"

