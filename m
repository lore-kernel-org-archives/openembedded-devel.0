Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8322DD2B957
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.19537.1730817415898370036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PNujme/C;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e33c65d104so46421237b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817415; x=1731422215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHhz7i5arnQjC+VysyKLGBLFibxKXx012p7gXiqUFy8=;
        b=PNujme/CNmUd8duzcHYryZCBIupylXG569TfNRmBPHGRhuqPefwFEZV2OVVIAxM6F9
         1vqS3JYv5uh6kYOpMUucwangtZNVe74nfexqarQbWBVTmzZEdyDspCCXURgv4Y3dRyox
         52Q+AHfp3De+b+J7rRm8bR+UJj62sPaurbqDG/Qi6XxaN7mrKE0RaDQ5FE+luoPhrH/4
         FZDQbngwzLFT8rsvH8mLVQ5XAZOzTjHLKAkI5x0w2E/ycJ+zI1Urtaai8TcbFjzU0pqE
         OrpsuSH1mMfY77dF4fUvHCK1SVAp9bKisc5GM+zzPAQGuLidXlyKyK3YjbjHYDyDfAu1
         vRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817415; x=1731422215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHhz7i5arnQjC+VysyKLGBLFibxKXx012p7gXiqUFy8=;
        b=fwwQrY77O7jSlrcx9pYMLpqMH4GzI985sBgSxrnwcLe6Bar+zNgAb3Iv3qdPZ6movN
         5QcPLiYMCaWTi0FGN0hcuC41yYCtrbaPLzsUUrMlfAcocuHa7oBgSon6ebHyKvlmWoak
         OgYEcHxwJU9KhDTuWVfTIGatHiTqWuBAMOCXBmJuqdxEG9XkLV9bHW2xQWp2iuzxE/pP
         YzbjTYAGImMqoDj/WvagYjBJb2afd5nGGiOC+yR6kDtUfAndrQ9yu0x9JpkqKhUqMfRD
         9qaF0xXy1r5wO2bRT3Rwn7Cffmf8nWy7wHLvPTkDAjddqBhhRX++NalzuhkfW9PvA+vZ
         7kkQ==
X-Gm-Message-State: AOJu0YxhjLIGD4kt3T4ulOIllqKSrVfg68uZ/jX8CoYlrlOYe16lYK7Y
	Yy0ow3bhalCSnOQgB0dXoLxiU+cAHx5uHerpsdnEp+mQykWepYxAj6ceXw==
X-Google-Smtp-Source: AGHT+IEcLLOBofPpzTfG3V+OWtNDlTqZh1cCU/oLazQdpS5tVXdTBm78EzMR03Rt2GG9KW5nCX5wwA==
X-Received: by 2002:a05:690c:fd0:b0:6ea:8d6f:b1bf with SMTP id 00721157ae682-6ea8d6fb48amr86275397b3.0.1730817414978;
        Tue, 05 Nov 2024 06:36:54 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 35/90] gnome-shell: add gnome-control-center dependency
Date: Tue,  5 Nov 2024 09:35:00 -0500
Message-ID: <20241105143638.2301245-36-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113453

From: Markus Volk <f_l_k@t-online.de>

This fixes:
Run-time dependency gnome-keybindings found: NO (tried pkgconfig and cmake)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb
index 0a52de7a3b..e166db0a6a 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb
@@ -13,6 +13,7 @@ DEPENDS = " \
     gjs \
     gnome-autoar \
     gnome-desktop \
+    gnome-control-center \
     polkit \
     pipewire \
     libsoup-3.0 \
-- 
2.43.0


