Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2118CC6B1F
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:22:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10218.1791973346395830966
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dZDrb9b5;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so2352256a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 03:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973346; x=1792578146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGaMwdjGGZrWPqsYH53C5tQW5vQ9gFN9ttJjOD9nT4s=;
        b=dZDrb9b5nEcLeY03E7P4kb7UGCrh/hInr9Y6Bgh+VyQGmx8Pdx0oArWuoo45B2aa0U
         ZXBZyszsE+ZGsN8vy7aS1/SYA7YA4exJE5cUVILJITpD0VQwMLFDIbE9P9HRXl0knhYg
         cq66dH1/pcYO4dDMBwkRPAlg/00xxY6ev97Dr03Vn6tS5NTJ6r11bIe+c7rmEovwXkTj
         CT/0CjYwJMy+mYeyCxJsxXB5T2FwaAe/C2AWDjyfAOmX/UJRpkGdvcd6lIYVrtmtVWrf
         mmfNx7Uo62j92YQaqmnZulHYNQWv7t2P1lRIoxqQ62FNflPmmeFYh084Q8KwbJiuMqZw
         WFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973346; x=1792578146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGaMwdjGGZrWPqsYH53C5tQW5vQ9gFN9ttJjOD9nT4s=;
        b=hRZm7nAq9KzhRtJuWAyIaFTHRVofGG6rwjikjhsjfyQqeZtBP7DrNhpWxgpRDEUCN2
         f5sQndlNkWsDikEJDx/7N6r5DuAod4WYfgSiBFOJhVP2gUgWu2ojGxgRfw94efFr+H9M
         8wxEGAk7WzLn7AYByckGV/W2gmFeDDhTkyjDL18KoLhkHSF35Dc5xkc1hsRW0NMemYRE
         /ccz2uZ7//jTF38uHKLbByvmaGxhQxeTUohcppuqyd9sRmdlbII1r5efj97LxGcw1Apq
         Zl6LXxwgBXMNAQggQ9WMOxGxZC4tiWBNf2gI7PSaj+EA+b4B+5HVQLDxRDv5NcjEvV8U
         g2SQ==
X-Gm-Message-State: AFq9FYKBOTE3rHcvK86FVpItE/SuCaxn0Kg1dYlF1G68VRcS3SRAkDXn
	3cjFznbxOQ+YRAz0V4YUgSNGBUJ02ZWh6vKXRxH4WgRrDuPeTa7drSGhot3Hxg==
X-Gm-Gg: AYBFou2c+BImkjosSZUo/UTaKa2gzs4vWi+p40BKGy+SngjipeJ+uJLzSkAa0W3v9uk
	G3yq7ImGAxWuDfK7JHMQs9oBPJYxAfWHspuwD1VoSCKKxyR0Co9rtmh5Msg26tQ3CUEOkCUENDK
	I1l+28G4o1O521bT8P53LwpCUgIfAHR3FK7dOTVayyhyFLELGNhAuy9M6X0AgwoLhvyKNBejBeJ
	ULmfRF5xGQTE9pxupUacfdQyk2DNyEng4QjmFdQzyHQu4yGEAkuJtKhgLlIPNHLrpJ6iKjuWUkj
	x1RTnr4397pn24NoqQ0HtaGJqEX0UZxIm9rxmDaX7hkb7p7BIiV4pg/P3X87YeChNHLOigwXeCC
	DC5aQJR72F+asNNDEKTtleBrSnNkYfwyFWz2kHEEzYx9BHycWjYk+GMTv6/C34NxB4HNk2xB0iv
	FvKUJrRkav6D4upAHYvYmgm3JcSQfIB+qRCtV5K8Wr00VMl0YK58cXxsbnHNw9YnMhPzEzTCB0s
	QUTbl+VCMG5rOGPDXzZmtV9u7SqtdYatAyQoOg=
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3abd26bc4e0mr5417400a91.27.1791973345698;
        Wed, 14 Oct 2026 03:22:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61170b7bsm4017740a91.16.2026.10.14.03.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:22:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/11] xdg-dbus-proxy: upgrade 0.1.7 -> 0.1.9
Date: Wed, 14 Oct 2026 23:22:07 +1300
Message-ID: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 10:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130887

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/flatpak/xdg-dbus-proxy/blob/0.1.9/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{xdg-dbus-proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb} (93%)

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
similarity index 93%
rename from meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
rename to meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
index a8e0a651ad..53781d3d61 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     file://run-ptest \
     "
 
-SRCREV = "6a170fa77e3cbecb48f9dd2478fe5c0a119eb467"
+SRCREV = "72b40c8f6d9d585cfbdb249690724f740d207087"
 
 CVE_STATUS[CVE-2026-34080] = "fixed-version: fixed in 0.1.7"
 

