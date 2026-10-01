Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F27CA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:47 +0000 (UTC)
Received: from mail-pz2-f27.google.com (mail-pz2-f27.google.com [74.125.228.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3431.1790823824313209753
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M67z5+h3;
 spf=pass (domain: gmail.com, ip: 74.125.228.27, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f27.google.com with SMTP id d2e1a72fcca58-880fcd3790bso2166656b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823824; x=1791428624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQzZxmvHVnrELgJ7YDvOQQnNk6Lg7BWU8QMXuNivwbc=;
        b=M67z5+h3p0TC2YJpuCkR25YxPJWhWOkPfN0gU3X+bS7WsSy7Vkw/bN4ieuMFMoAuNM
         Hn9HrukObBQwnrP/56i2noCtaCcGhVo++sbbgjl+g5St8cbdCasQUc205OV/hs0aJn6E
         hhE6wbKgLj5Tl3+ce3k4DvVr6qSWSpLWAI9EAQOWIGB0yWuUitw3tJSBHegtZMtFYVhd
         S2JecCvc9O8FGFdfgkzKn97FLBNAtdXQB9B3Gsz83pX17gobM/EW/nX/NLMpD7IvqQeH
         /rlVGoahTg6oFATwlG2dx6MjKhs5B4KDZWXxHypWq0nQrF/Yjx5ue9PatVLkQQ/HRwB6
         2hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823824; x=1791428624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQzZxmvHVnrELgJ7YDvOQQnNk6Lg7BWU8QMXuNivwbc=;
        b=LWIzjUEy9VcLYTuoKPfB0W05mYAe+WTwi8FORjQ4Vt6tsEYIbe3K265Xcp4xN1fyV7
         fjG98r6wbC3lnFqGkcqRB+lHpTNqvVb7q9BAepmutTu6SQC5Ifu4A9m+alUAai62s5zP
         eTaU4ACMI2O5bq9BsuvPZuYjQ2p+cB0Q/SS7MG2pSSijdKwn69UJYjE4SS0d6Zij8A+S
         Xf9VayWTSHyiOmOuLiN11bRJ45YwrJhxsrtuz+3C03nwJ0Z/E+CMqg0Aj5wkrU5E609X
         8dY5SIY2djTc/tHwRhGHgAmYxB15SHTeLyjOBBhCNmFmlSp4QV3Zyu8c9xWPLo53M8SQ
         3Apw==
X-Gm-Message-State: AFuF++m4Hj7N3jymRlT4MOHc7pIxGfCdU2tKECrPwVY+lugAc/GHu2XB
	rhqnHAEyhqxrv/UhdMDtz2zkbGX9mBbccq3q+lPzg/BoD5r2dJv9yEvrSpeMDw==
X-Gm-Gg: AYBFou3QbrpO0Xzw7wtDxlhbdYzPedMudndzv4ga2a3lsaXB+JY2T+Zsc2xRsY/NiLM
	k1fMn1BVq6bmSKVgkiDdzB8pOxUUSCyjuBGpyE7RfwoRS8NuLHWP+Cxl6/Uiice/AVjdxfyM2Qn
	LgRpXL5OygLDeGYq1rWqWk+1E+rHjnU7oNZEbPt8yXCimY6QpM3I87yfAm5c+h7COJ+9blgRVxE
	yVcSeww7ohjsCn0Ajm+ZrlW8GVbqIehpzKYnZoaD5Ia4tnTcyBcjHYb/jgNw+CVXPcTNrX9yQsW
	9VAM9y8z+aw7ig6Ahoqn5BkCtDK4EmINb1qjtWJXD66lgOX8tF+mE2KQfwAbEtwZ/8mTVYIvbIJ
	z2IZfqiXZR6LFWF9E1mu5WnyOJD7VrPcpACPqzJnRUTkWATwmA1K8zx4+3XxquqdmSceYgqPfBu
	9BTn+uVLmzpqNXagu2x5m/ri+NAg+3T7Qns9KNgudDiRzD84vkrtltJx9YBVa7ZSKF2ZoxuhxmQ
	Z0uUnDmnX9u3I4plk5uSaw=
X-Received: by 2002:a05:6a00:b81:b0:881:e626:74a0 with SMTP id d2e1a72fcca58-8874c4dcd27mr2298803b3a.47.1790823823668;
        Wed, 30 Sep 2026 20:03:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 4/17] pipewire: upgrade 1.6.8 -> 1.6.9
Date: Thu,  1 Oct 2026 16:03:16 +1300
Message-ID: <20261001030331.1581021-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130553

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/1.6.9/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pipewire/{pipewire_1.6.8.bb => pipewire_1.6.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.8.bb => pipewire_1.6.9.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.bb
index d462b315af..88762a4760 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "dbus"
 
-SRCREV = "b741e0c74f5436f0c925f7741140db0efd32cf4e"
+SRCREV = "8fa27cabdc6c0c1350c69c026af5850ef0af1e26"
 BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
 SRC_URI += "file://0001-pipewire-compress-offload.patch"

