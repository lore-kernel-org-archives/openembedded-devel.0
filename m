Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FFACCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:24:28 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.246.1759951459408679419
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EOnGxM9H;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-72ce9790ab3so2377477b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 12:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759951458; x=1760556258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t3aApKJ9zI/eIBigU3yQDoh93Hc910M9+VJkA744rbA=;
        b=EOnGxM9HX1YQwW5+5nJZ8MVqZzot9wluHAhB38N/e7AUNYp+4+5d/rTQXmtnUPhqBr
         EiAXcjjzcyyBBL6A8ZUrTSaf314eAn6IhQL2DOsp1Pc1V2YZTpQq3NGW/JhGu2DGGkcB
         fyovenLnGhby+7hszqDIZM1ADXHVWkKIjO9wd+K0ccs2MylAriruxaPfnJLJ+LGYmoBp
         zQPAgVg8ASMpD2EV6GKewtSvmHol3YMqoB06HNFrfxPudItyFGmfEqfUFrg+x8DibErh
         /vAh6A5Qkoq2xjfU1poaYVFQDwx20l0C0JhC0FNuJjeyqG7ojzNjRaxmChEkBuxWXz0U
         xSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759951458; x=1760556258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3aApKJ9zI/eIBigU3yQDoh93Hc910M9+VJkA744rbA=;
        b=a9cHIl53Qz0tOhd+gUQZFqNG2cgHIUO6gwZdqPd+i3mPDajuNieNWwVQ446lLL199J
         OsyUmhAdfT+FyMIggSNKDyrblCg9sL0P9uMBoWTmhgWeOFSutWZzThDg6t1rrvhMcZ/Z
         mXvkA0ig1c1wn2HuOIq4BM/Ejaa/JnEOJBE+F7oeq2+qpiN7NDZ1bhqRmDSXc00uM/QB
         RPxQxcGEYfifP3DxqqctL8gmq3tz7DrJ7BDQRw2tnMw/f/Os50jKel7Qit1KpjEYaB2+
         jdbMZoWx9Uazb+ojAHuiRM9cMlYoVXEcZsNqpkkfSmwG5E4objrw4+osofg9tHBrm+1G
         6UvA==
X-Gm-Message-State: AOJu0YzygjoWIETv98S0YLN8VxnJ9h9QHyTbhirhM2y7qzQrs998z2Im
	X8NOeC+n19VjwnRQ2x8IGtOKvILyDqPIVBNSg9S3U8UKHJ70AH1KbQl4OmHPPk0S
X-Gm-Gg: ASbGncswNvzSWxmiCfRIxDhPE1uMhEtlUw8Mr9H8j3H7HeIktJmGserDp+/XC3Au9Iz
	pMUSiT3FRJrj/lyL5DTBF6Qx1Kd+nZmvLvYQN/Efkl0Ks0QVahyOCG352pA7ng3IAc0fH9H0X/0
	05X/FZk/19zYGzEymXAs8rnk4zJcGND+lsJUnVWDwSAm/Z4OHS3y1zRS1JzLE5E2p21HyYz5CxQ
	ZWNy5nvOs/J8yF0TW38K2RtgzhW2v3/WGS96ZtCWIykfFHm/KpXA534ZTVavfXOEiHDOjeQleUs
	PN2jceWpkkn+dHg5sgdkup4T0CEqa90TErByGh/RKTTKb2Wl3GVt8KymPh8iGohF3JNtWKj1z3o
	pEc86UQ9xHsVZVf59ZyMZuTcLjn6KRb6Pf0t1vddS9J8tTq2K7oNv6e/OnaleULrihKKJrjeIPD
	OECh0c
X-Google-Smtp-Source: AGHT+IEp04zA1FDlfxakscYNfANMazlS0LhBnXjV2j3AtXZBjID+zlFD5b8ACzIzn+dJFOQ3uznsqA==
X-Received: by 2002:a05:690c:74c9:b0:737:625e:beea with SMTP id 00721157ae682-780e15bd2d1mr60403847b3.13.1759951458003;
        Wed, 08 Oct 2025 12:24:18 -0700 (PDT)
Received: from localhost.localdomain (71-208-12-94.ftmy.qwest.net. [71.208.12.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77fac660244sm44164197b3.31.2025.10.08.12.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:24:17 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-mpc-plugin: upgrade 0.5.5 -> 0.6.0
Date: Wed,  8 Oct 2025 15:23:44 -0400
Message-ID: <20251008192344.281099-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 19:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120379

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-mpc-plugin/-/tags/xfce4-mpc-plugin-0.6.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-mpc-plugin_0.5.5.bb => xfce4-mpc-plugin_0.6.0.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-multimedia/xfce4-mpc-plugin/{xfce4-mpc-plugin_0.5.5.bb => xfce4-mpc-plugin_0.6.0.bb} (80%)

diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.5.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.6.0.bb
similarity index 80%
rename from meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.5.bb
rename to meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.6.0.bb
index 0cc523e876..583c0a9267 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.5.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.6.0.bb
@@ -4,6 +4,8 @@ SECTION = "x11/application"
 LICENSE = "0BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3604d987e6dfdfc672c754d08953b0e0"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
 DEPENDS += "libmpd"
@@ -14,4 +16,4 @@ LICENSE_FLAGS = "commercial"
 # for now we recommend our own mpd-server
 RRECOMMENDS:${PN} = "mpd"
 
-SRC_URI[sha256sum] = "4ce7d77667a263ee9916c0cab2a733b17e3bd65705cd4ed5cec3cbde6e7298cf"
+SRC_URI[sha256sum] = "dee5bcc0566ba2dc95b9c3b4cadd5e8b3bb2798a54a2a8d8652708915fe45d50"
-- 
2.43.0


