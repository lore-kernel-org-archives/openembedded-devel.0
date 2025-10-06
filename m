Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13369CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:52:20 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web11.37403.1759765936587666710
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T1fghnOO;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63470a6f339so5069259d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765935; x=1760370735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EboZSjIwQH/83wiI77FWfe+4Qi9kpWGuaVwfEDbofU=;
        b=T1fghnOOpKGOj6Qtrm+1Oq0jyxtY8ypGn15/xju3Xe/p7jJ/LqFFYUhTnxNxpC00K1
         ggtmYV1liLDRfZ1BkQ8VcYUM+YqDhoj3VXmH3YtS7ovt54/L+SB5O5HNzz87wXfUtS8E
         D4blgnagW3zMBO7wwUIgp7vTKrljUjr6GJHtkimYoxNUtKbHb72Wr2lvNuQUwkpsIWc2
         RHbW8n43rWjBhc4tAMFXy7qZn1aZny1+H4QOqRBT7YU8aibYIY8iAy2WtbaYKdGblBMY
         oUXwtvx1kDdg0+kiYf32fbS8jt1lPC3O6hionBifsnnHOiDLf59ER8J/a9hZOAfNZppo
         7MWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765935; x=1760370735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EboZSjIwQH/83wiI77FWfe+4Qi9kpWGuaVwfEDbofU=;
        b=KXwLWCZOBmB+NkSPtaqQDktZgFx3x4xcUcel4t0hek9mb2KsnEGSVH1Wwo2Jto66P5
         hftMJBcaYaGmp6Sr3p8XOzFjMXBBFtSIR85Kks/m3NPXv6BfbXisu/jQIwd0JoChkSfP
         farR3GITs/WdTbwL6sQvIuQ5kjcmWRpY28d5XVMrBXmnS0YENOneTUu1xb9vF4zf4OWR
         6GdjBCcpq+CkD3KNavafQsTrly1uUNI6SIFZAAoCY0t+O2B1E+uCvynmzuxr8v96IlGA
         LOmnbDo1O4U5jb9NbzD4PSlHF0CZUcKbR/ajLC5ci6VbHZSamzIDZUfD/taFemhw/beD
         +q6g==
X-Gm-Message-State: AOJu0YyCel8OO/nm7hW7Fw6g9VQFT22J+4j2XQIc+HzNK4PYb3ZJuJ3q
	cFk+wXCdvHqVe/HhMui0bUMg5b7pfEnle1L3AW/LrrLKJ7ercdmKCQaL16yeBscZ
X-Gm-Gg: ASbGncsmziTxwSkTJ85xJr7UJLjLvy8edb6m/XdKKe1s0JbzCWH3sg+vFZy78tyVNTJ
	eZR6oJJut4Xavwkv9rAFjVc2ViSbG1Ae8/Ma+arRgz48atRc6sFXmGIcJsT8Kvv41j1rSlbZ3W/
	uQIRyjiAQQONpVRmhTpj0cvsyPqLfYrHjsOiiJmvVIgp77/iua+hcVcuzdiv/9F780HMFC7bGzt
	2vs3KZV/05Oh7BeqwD0suIVQ/JyCxMH07cQUREm2FjEzroYJ0dkBO4KWRQffnIKDi/jIDl5eMCY
	v6X/fWxt4eGEzKTMj9nDHQ2tKT7+dRw/ehOjX8Thvy6a22txptzcsTKBJtK1UfHuVG4DFJbHgjy
	bqq3NVactEaRlmxKhH7G8X2s1LX52ls/Yv3GsO9g6TtxtZz9Z6U8S
X-Google-Smtp-Source: AGHT+IEY3BvxbawRyKhNpRUrYn2wia2w5EvRMoeYd44GGE/3nS3zYl6eeJVSpAxRJMe1w6N8ZoTpqQ==
X-Received: by 2002:a05:690c:6e04:b0:734:c88d:4b30 with SMTP id 00721157ae682-77f9473ad35mr225021617b3.49.1759765935235;
        Mon, 06 Oct 2025 08:52:15 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c34d7esm44294397b3.21.2025.10.06.08.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:52:15 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 08/10] xfce4-verve-plugin: upgrade 2.0.3 -> 2.1.0
Date: Mon,  6 Oct 2025 11:51:44 -0400
Message-ID: <20251006155146.416335-8-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006155146.416335-1-schonm@gmail.com>
References: <20251006155146.416335-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120299

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-verve-plugin/-/tags/xfce4-verve-plugin-2.1.0
Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-verve-plugin/-/tags/xfce4-verve-plugin-2.0.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...fce4-verve-plugin_2.0.3.bb => xfce4-verve-plugin_2.1.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/verve/{xfce4-verve-plugin_2.0.3.bb => xfce4-verve-plugin_2.1.0.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.1.0.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb
rename to meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.1.0.bb
index 844d8caf17..dd680b4535 100644
--- a/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.0.3.bb
+++ b/meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_2.1.0.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-verve-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "e1bf121f1bf9cf2a199bf5c0f3aa802f503df9bea50724741e7a92fe6d9fe09e"
+SRC_URI[sha256sum] = "237e0da802cdc02e0ec0c3cdefecb6fa2992ade9f59ce2999779cc30d59c9f24"
 DEPENDS += "libpcre"
-- 
2.43.0


