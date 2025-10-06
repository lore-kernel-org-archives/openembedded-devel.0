Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E12CCA476
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 01:48:14 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.web11.23997.1759715291684437108
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 18:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kLdSKgJ9;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-635c9db8a16so4529598d50.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759715291; x=1760320091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWT/XeveQ+lvBroO+MOoW8lCnSL/HnZP4/JPWuVTinM=;
        b=kLdSKgJ95wccS9qK/YdzhT44fhEqjGhMBRrr20/aZEfLSyytwGte/TjvYeHwZUrxYl
         Is/c5o9sshMffkW3sjR8XPA41grmztOyDJk6L/HPs399bDEL8qMaYb7vUszIgZVCkNzX
         o9QsYULU6/A4M8TAkBIWKpCCpMlSWSI+j9gf3YEcIQ0kpXx0VszSgcKxSV4PujHoiSv8
         X2m39RlvnCeuzfdgdKDSo7Bz2Q3wDFb89cz8rFtUzAIEIn5eNL7wdOOMPm83GjWfbO+E
         L6UXYrfPLlH/DcWqOPf8FkrNvi4IV0bUbqq0qHQFayEtDAQUlhMw4zTwrBOOD99r7UoP
         QbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759715291; x=1760320091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWT/XeveQ+lvBroO+MOoW8lCnSL/HnZP4/JPWuVTinM=;
        b=sPA4Fpobzq3kxQaWIVO36aNqo9jUXp7s0IZjBcD69o9nvvg+D0Xmu0ZrRQJ9NkO5GQ
         /s0yQeCbzZwmARgVZfOmHGJ0LxLk8JAl/+Oh+J95v+4BFqkb5q4HeqdqyyKsRoqWh+zB
         xhpBCdmQ1VtY4m0jJ6kwhPaoip++3X1qKN8oXC64/wle8PZH8GQSMOE/6yCVERE2E70v
         0N1AzAQtbovn9UJXRdCRVBfbbqGnWWGSaLJuCjsfKm9Bruj4qtuGQOTnwMD1L9QKDcvG
         AS+gKt8Cj2DtrcdBCDERhrW3GkLE3nktPFQXfHFJtF4QCxoyuDHkRF8thDnhieb9ZJce
         6jpg==
X-Gm-Message-State: AOJu0Yx836Sz7ciCtOABOUeSO/goE2B9XBDBQ92gwA6OKuL6WybaFBOF
	51M3emH2GQm6++1F9J2aW//C81O0me/9/lyZEeRPL047RSp5NQDL1p6o9mWqJpr/
X-Gm-Gg: ASbGncsoiDtjmbnKGY3nE9YOuzSFTp2PfyviswIE/K3O1G2lDVOW8Q/HHMY+jEVkesM
	Ihy5vpum0pClTbYAcj2ijieG/Xr18Bs+iXY768QJn8K7z9OXobqqSnNN5+UTtM9EBizJQ1YxBG0
	d9CHD3E4YI+tTka1pLWPPWB1cX5AdAu8Rn2c4ROsavJEkMAjRmSjDXzIXi6xJE+G2o5ZcCPjgk3
	Y1CiXVBgEnF/ry/oXGL3XuFgu7nSxD6sDvGJmcd5sVKWR54wNvU+nPL9cVihkzBvlIMPjEMCG5F
	5AwBEnjF7kR1dqEcZp/T6Om/Lp8vkfgewA9T56tsKy/iA6iYTTpdPANM9BmzVsFi2MOiaEcH0Au
	ME+C0rgWwuFm//oYTJIPW+0AXOkBN/gznC3YwaglclA69ej/TTEHV
X-Google-Smtp-Source: AGHT+IFNdF13k/ppgr/+42uIyNIj0eEttJvO9aP52JrLPJ+/XtUV2U/oBANR4/dccoGOJeQTAbOp7w==
X-Received: by 2002:a05:690e:38f:b0:636:d1b:aa22 with SMTP id 956f58d0204a3-63b9a0e2b72mr8324137d50.31.1759715290263;
        Sun, 05 Oct 2025 18:48:10 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81aad051sm39177337b3.0.2025.10.05.18.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:48:09 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 01/10] xfce4-battery-plugin: upgrade 1.1.6 -> 1.2.0
Date: Sun,  5 Oct 2025 21:47:18 -0400
Message-ID: <20251006014727.58960-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 01:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120258

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-battery-plugin/-/tags/xfce4-battery-plugin-1.2.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...-battery-plugin_1.1.6.bb => xfce4-battery-plugin_1.2.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/battery/{xfce4-battery-plugin_1.1.6.bb => xfce4-battery-plugin_1.2.0.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.6.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.2.0.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.6.bb
rename to meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.2.0.bb
index 80a948a9d5..82e955a9c9 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.6.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.2.0.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-battery-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "327d7304dded8411cd1a48da4f46bac248b44d8b27ffbc2036e0268cb37c3676"
+SRC_URI[sha256sum] = "1dba8f470d2b12517e7b86d83cd2ebf13eb57ff1a01a4f2d2d156cf5194d97b6"
-- 
2.43.0


