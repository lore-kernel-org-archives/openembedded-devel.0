Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA2DC4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:14:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.13968.1713777277681176362
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g87LLFij;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41a70466b77so3038365e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713777276; x=1714382076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWa3nDjD+UET0Un20mdqaQHSuPnD2JmO5CK83hxaEQo=;
        b=g87LLFijSQQAPZcu2JmkV5OkzgnKKnDzYaVykq5ztVA9hrvdofwtSZh6aMXoksatAW
         IWbu6BbzHaSt6gY5idESM9adI045eKtLJx4Jq5fAVm0obNlpOwVqk/BJu0dDzRege73F
         Ug+joH/xjKV5MtzLN+czQGu5yaX4Nnc3vX1iRy1ccSmm41TiK5jRA7YSqFBGBheJdaK5
         dCP0NIh4SGhdJ2qbdZ8c0L873h7rPnmftRVLzOE7diYCHmCUuh9dfvT80NsFWFhyO5sj
         pcKSNErCMi/fheNYT4A23ZYdg6C92H1ZRfzcf5Q88OO5a6AkslXOk0Re7mB9WlK+oeeR
         kv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713777276; x=1714382076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWa3nDjD+UET0Un20mdqaQHSuPnD2JmO5CK83hxaEQo=;
        b=KUAofMenzedhYLvrZ/Y/9FDkMlMc5ehuQD0qMMHBHGjAFSWyHpAxo6uSZwp/KhNDIq
         ylCO7Ues4VBXeK5LO9B2UeGmXBUnvnJNsYKF0T2rgkZpUfzo0k9IHSRFfLXYQwMrGgYj
         UWJ5ATrEdTXaibhUTAeygMZfkI6Eukf6mPLcg0Fx94vAfmIWTmhveQL8247kYTEVdpXJ
         I3EpVQrG3U3f6nl1+vhFbkK6842DgvGD6QjNK48D6DeWEae1t3kHS4PDeCZ+zB9UyE+E
         osc3676t/+ByazRl274zq97p6ltjS19OKHkqKEjjLxP2S1ku+3yQmgYr7bdO4SGFGkx9
         kTVQ==
X-Gm-Message-State: AOJu0YyQV+udmvNDdci+3pTuM8kEt2+m7bGbjRi2a8lnG0aLnED7a6Oi
	ggarENT1if4hOgr/rB2AlOu/IJ4X8Cr9NB2TH8wLL+mcDI8RgDARICdZ7w==
X-Google-Smtp-Source: AGHT+IFqvuhb70QP67RTGTu4dvVaMdfIN7XAbu4rf44uFC9Odd7I+KSQ4HMTxt+b7svus/KnZc1Dwg==
X-Received: by 2002:a05:600c:1d86:b0:41a:43ae:acf0 with SMTP id p6-20020a05600c1d8600b0041a43aeacf0mr2444167wms.35.1713777275875;
        Mon, 22 Apr 2024 02:14:35 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c10-20020adfc04a000000b00343f2cca88dsm11626033wrf.76.2024.04.22.02.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 02:14:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-multimedia][scarthgap][master][PATCH] gst-instruments: enable ui PACKAGECONFIG only with GTK3DISTROFEATURES
Date: Mon, 22 Apr 2024 11:14:32 +0200
Message-ID: <20240422091432.161968-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110082

* fixes:
  ERROR: Nothing PROVIDES 'gtk+3' (but meta-oe/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb DEPENDS on or otherwise requires it)
  gtk+3 was skipped: one of 'wayland x11' needs to be in DISTRO_FEATURES

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-support/gst-instruments/gst-instruments_git.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
index df688bbcda..04d16ffe11 100644
--- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
@@ -19,5 +19,5 @@ FILES:${PN} += "${libdir}/*"
 
 INSANE_SKIP:${PN}-dev = "dev-elf"
 
-PACKAGECONFIG ??= "ui"
+PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'ui', '', d)}"
 PACKAGECONFIG[ui] = "-Dui=enabled,-Dui=disabled,gtk+3"
-- 
2.44.0


