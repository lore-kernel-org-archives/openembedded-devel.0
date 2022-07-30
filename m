Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCBDC00144
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 02:29:19 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web10.2228.1659148150664790402
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 19:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=T+17NASZ;
 spf=pass (domain: underview.tech, ip: 209.85.166.66,
 mailfrom: vince@underview.tech)
Received: by mail-io1-f66.google.com with SMTP id e69so4858364iof.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 19:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=reSvyhC31djUi4y/c3RwKUUMj+Pgy2XF50/vWDvrLX0=;
        b=T+17NASZpaJX3baMmUu/2DBTjP9w3B+b0z3Y/0PJsO1Qt8tQQSlIALwTQil3GvyiY+
         09phQfAPGp6QbKXu9r3tgP4bgFCET008gI12eqimcB1uHJ1z1lJvQq+GZXcSV9RGg4TT
         +4AfuxNBB1FHxgHu79xXebdvgRMxXhISwCoKceJxwaSthNdkx8rvHbMBKitbYzx167WV
         2kf89wxnMtaKaww9II5iWwjPx+83ldLT6gmE+VHNh4dtHBN/TEl3e+IPcWTK0CuwK0Mf
         DWJV32wUVTAwappAt/e1Ov59fQIge2H6qaJH/1rPzt/Mk7g6WVBTw3ox6XGhV1WMHF5Q
         mnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=reSvyhC31djUi4y/c3RwKUUMj+Pgy2XF50/vWDvrLX0=;
        b=wHADaFW/nniLREUxT7fej21GD4wmZJ8AM8ThwgBLrNiAhSmpqDaaQyRvlWNsR/JeQD
         sVQOB0tmOWtsRQIGCUv3c6VfpZ4ZDEb4ZjNXXOHVkjf4n5PvOslrsh2cRfGHVmQMGH0i
         4UTYq5hoYSQAndJKUDddZ19b/VYukB/P8VVniTOqemXbUMrG1AbGd+PD2LU9qbKGfWwk
         SfcjiYZRUFdLR56J+Jlh7FTNU8OKOqeSYXeFCq7zyNhv3lv2xiKs7G9oaUxBOQPnPfSF
         ITq2SOkVu8TudGJC3kSduOiCyMnDeeXAj4HCw6EF/ueda8nniyER+4tRSe3RJ5GDQbSx
         iFew==
X-Gm-Message-State: AJIora8xFBStE0GdfFTVSN8lENYtMx+ZjdisXwTgUS8nmZPqFFAixk+R
	yq921STWtROo+/Zo52YXq0Wxq8tO93erZBYtoxw=
X-Google-Smtp-Source: 
 AGRyM1uqtIqd/d4QKIvkVSJwoDzJkH+bK8UQQwvjBbWOP7Q1ITu4Blkx3/0E1SYZlAJm9MYp0T9yvQ==
X-Received: by 2002:a05:6602:3cc:b0:678:eb57:5eb with SMTP id
 g12-20020a05660203cc00b00678eb5705ebmr1970129iov.125.1659148149831;
        Fri, 29 Jul 2022 19:29:09 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net
 ([2600:1700:1124:8090:34a2:964d:3bb9:5fca])
        by smtp.gmail.com with ESMTPSA id
 m66-20020a6b3f45000000b006794eecbce3sm2396098ioa.18.2022.07.29.19.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 19:29:08 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-devel@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [meta-multimedia][PATCH] vlc: add virtual/vlc alias
Date: Fri, 29 Jul 2022 21:28:55 -0500
Message-Id: <20220730022855.50524-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Jul 2022 02:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98057

For layers that want to provide the ability to
select a version of VLC.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb
index 9b85cb537..eff42496d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17-1.bb
@@ -130,3 +130,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN} = "dev-so"
 
 EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
+
+PROVIDES = "virtual/vlc"
-- 
2.34.1


