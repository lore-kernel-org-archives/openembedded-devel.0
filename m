Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A98C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:36:50 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.1733.1646444209135473194
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UhAeL4VC;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 195so8899337pgc.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kPtmzB0/0XMmW0JEJZdEOOSVZaz0qdXJsuntoIPb71U=;
        b=UhAeL4VCoshwZaMMM/dg76zQLO59Aa/8zWroo0iPw64DdcMpEtjRu6yhmpKv0axI9r
         mGqoGqB87nrownZ1Rtsin/bPol1KJJHDyZx4oX7I6nx1FtKngTsWNicB+8aaxrfGOI8M
         NU+G02WXNMq8QR0ArZIIB6SEw7wwUDdZx0MPX7TV2fi2tunJ6Aa1UeLwE5zQpnZ9Sbbg
         bigVRH6XVZTrwHDrmCRA1HIwZ+dGHUaJYOVA2UWH2WO3SoSx+90AxQqNS0WEXdisSjDx
         PtKLHGszLll6v/T5xsWVOFhXysPe024STssLvQByOtsOybU1f6AzBPVl5dsWKNBdRryq
         OfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kPtmzB0/0XMmW0JEJZdEOOSVZaz0qdXJsuntoIPb71U=;
        b=HKu73sVaCVKfo/TlQtoDxhFPaET1ctzPvvHxr6PsMbk+bWynMjZ9MZG64vbGmOJtL9
         IMk3tsZ+QfKG84UulKxnOZXFj3ck2Rsj+boz4kJTPhw4AiIVbL4TTHHC2JcRWrb/Sgc6
         nX4KPvdYBr7EjV/ycWsTpf7YhQMmoUJy+D2u4KmBolD887LIalht1fqo+PEfxnxR/tUj
         A8W6gyZnE+Fyq5E2KjqLJRwy621dFNWm4HSY1+WUlGc+t/gvcwkOCJLok21y4KsPYmE2
         PxGgz4yCSsxbRUpabmwCVraDfZpO8dUu8YIxq8tMy3dyqLYBG3tzkoEbRdxTFzLbzjKw
         xQXA==
X-Gm-Message-State: AOAM5306dQ/W7DjP/cuVJGPO+p4M3djuXSPior06iz3SUM0ROEhzIcWm
	W5Rd1FzXRe7SBZV7e8kxtSE+h+JlZjY7iw==
X-Google-Smtp-Source: 
 ABdhPJw2hD4uon3LQc5h/44cu0X/AmkHbKkqpK8HFr+OLc4sJ+fjuv5JvFLc0ZtaCFCWnIk3okuYqQ==
X-Received: by 2002:a63:8842:0:b0:37c:795e:c333 with SMTP id
 l63-20020a638842000000b0037c795ec333mr967645pgd.160.1646444208187;
        Fri, 04 Mar 2022 17:36:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 d2-20020a056a0024c200b004f6b6817549sm3783143pfv.173.2022.03.04.17.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:36:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-terminal: Add missing gtk-doc dependency
Date: Fri,  4 Mar 2022 17:36:45 -0800
Message-Id: <20220305013645.3010731-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 01:36:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95796

Fixes
| ../xfce4-terminal-0.8.10/configure: line 17282: syntax error near unexpected token `1.9'
| ../xfce4-terminal-0.8.10/configure: line 17282: `GTK_DOC_CHECK(1.9)'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb
index ce65c12056..e9f2e40593 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.10.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Terminal emulator for the Xfce desktop environment"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "glib-2.0 gtk+3 vte libxfce4ui"
+DEPENDS = "glib-2.0 gtk+3 vte libxfce4ui gtk-doc-native"
 
 inherit xfce-app
 
-- 
2.35.1


