Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2219CAC5BB
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 01:48:14 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.web10.23896.1759715294510163709
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 18:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=napNKo2W;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63bc1aeb427so1569416d50.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 18:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759715293; x=1760320093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+or+b2COrKitFu4Jmlt/9idZtA8Hvo/a5rTU2RbmHOE=;
        b=napNKo2WZX3rOKlYSyDeAbxeAPPZGw1urugP4XoQIg0ao+6MORe9MZrPQcEuDCMK97
         dyj1DL+TxFdqfXE51VrXz6tlKJGbA6EaSL76XxNOHGMtowaaADsaV0z7jRkVxe1BhIY2
         MQYvAzmuV2YzoLIHP5bsWYwFkWFVKvchCgYAJEHGVFih6zBPtKqm6L1hqNhnp7bgHQLM
         9k7Wj7IpPfQIxdF9gBQgotjeXrg18LPx+s7JiP9wBPRCkowcW9yii9lQJH9VveEoHTDH
         xIH6V6yQYtq7hAjluwMouISM4Y3c4sisDjsjDNC4hGDBCtA/hBrnJjYOHdRXh6HvAlLa
         FS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759715293; x=1760320093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+or+b2COrKitFu4Jmlt/9idZtA8Hvo/a5rTU2RbmHOE=;
        b=VtN9Zzm7oxWFqhEdjLV0AZCyz4WXw5km5sBSOZSrny+OfntSoeLaW31o4OdlufLdiF
         eAmEQ3NKuTUu2A3bAXygVQA/MoqH05XzisHZ0Db1W5ms5NfkbW1O1sjFwBwJsuB5WBJn
         zD1nL6W+jIb4gd2sb+TCI3R2tvGoWQ219NCMFheg4u95NloXQ9p1xP7pVJpeBRNBb6iq
         aE/K8TU2AKWqxVpXzlY60c5GaLXDJfzzxvQXXy5oi5DRWsvkknWHW4njycxt366Gvh8H
         vwBVXHDiVJ7fIOEOPRqCc1GpIZ17d1q45khKF8nQKFWSNBjdB0+q0EPlFZRtDEuEXZVV
         eEFA==
X-Gm-Message-State: AOJu0Yzis4us/IjhJ2SNC6vHg599Gr6rP7PuCDgxyWYcAXzdr4V0+nwP
	eYwMAwTxHv3YG6fOcg0vi8x/1WBwl7EQzP01YDkqdvvyXTFyc+3+QeawXu6bC1E1
X-Gm-Gg: ASbGncv48tSOS9Z8EyKewA5p9VN1JJ9YCBjkO7IoEza89X9jHO4fp6fPEI+bdn1f2pJ
	EMNtEmv97gQ/EPixwUWwKBXX+KU/vU0OrO3NG8L/T5nRn+n1gFcgjWeG64g8yykne+E/a6UL8AW
	vaN6+p7aZ4sqdIaebV6zxr2wFTAzFCKhgOiJEZXPijZRpPmz7Z4ImaIWeFNxniR4lIBciAvoPil
	qby7I2BVnzQVWYEFjmZSUcM8ZPX8/Sv1oNtroAqvdbMEnFlUD9rFHn5hiDcrtxhretnIqoe5zt+
	FKbLesIJF1CLK6ANCjfieBtMiY7ssg+2dP486ath26PwrAS4vwntDYZA1hsCmGd1TdBSQN01EIy
	EBtyt3CyxR2vJM2wHr5e4dY3lWFHifO+BZhbleB8oH/F4Z0icdM1a
X-Google-Smtp-Source: AGHT+IFzGM+g5rh162bQZf6YvZpTFEYz3hyQViIW+itG8ahizSRJsD33FIJmUQq18efv+GYLT3IX9A==
X-Received: by 2002:a53:ef87:0:b0:636:dd7:ee49 with SMTP id 956f58d0204a3-63b9a07b943mr9622685d50.13.1759715293078;
        Sun, 05 Oct 2025 18:48:13 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81aad051sm39177337b3.0.2025.10.05.18.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:48:12 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 02/10] xfce4-calculator-plugin: upgrade 0.7.3 -> 0.8.0
Date: Sun,  5 Oct 2025 21:47:19 -0400
Message-ID: <20251006014727.58960-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006014727.58960-1-schonm@gmail.com>
References: <20251006014727.58960-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 01:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120259

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-calculator-plugin/-/tags/xfce4-calculator-plugin-0.8.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...lator-plugin_0.7.3.bb => xfce4-calculator-plugin_0.8.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/calculator/{xfce4-calculator-plugin_0.7.3.bb => xfce4-calculator-plugin_0.8.0.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.3.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.8.0.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.3.bb
rename to meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.8.0.bb
index 540935cee4..b464535f70 100644
--- a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.3.bb
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.8.0.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-calculator-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=909430f63fddd63f120ba29e8979f65c"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin gtk-icon-cache
 
-SRC_URI[sha256sum] = "3feb5f56092ceef2858c3c1bd443317d4caf289a6409f9db506f49088e19a2e8"
+SRC_URI[sha256sum] = "aaf3d7e9654ef6cf8ec442ad9e4316c481f9a6087a8e8949261140f5ae136aeb"
-- 
2.43.0


