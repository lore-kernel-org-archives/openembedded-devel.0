Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9157AC54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 23:34:04 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.58499.1673220842118482193
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 15:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nJmshY9x;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id e10so4779271pgc.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MV/iLi4zAui0wvOYkMxqn83TksFXnYKDkbZGxKo3awU=;
        b=nJmshY9xPzW0jxuE1cZ4q+t915SwibOkbOd8CSbcX9qy8vtw1NuOn+WBpcnScShVzd
         KDHMJ2VKt8qCPFwVFOWlVvAHAXdP1LcGYGlzCzlyIHB+pl0T6LyWpD7gNdm+CzjQHz/U
         moe809gu/o34olyi7Hs3cLY7mDqjkOU938NBEgGkfrBa50Ffwyrx7B+w1kDV0vVZ2dA0
         eoc8/A040am1IJdtlPGZnUMItZ9xXx7WesfiNhgL4ydAohVplgy5qJELkizlc8OT9tS7
         dYZXgltrd2MoavKmvF5UtdL9W4AIH/hWAyWFnBte7NcwZxobVBRIR0fuxY6J9JBAoDrm
         3oZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/iLi4zAui0wvOYkMxqn83TksFXnYKDkbZGxKo3awU=;
        b=ikUhqB8lfzSdZcAzkAuyt1jduZ303cSPVK0RBepq8yN+vM1o+njY516Y0lSEbtzUIM
         Tfj/EIFPV/VZY/yIbkb8bPR8AtkDRC/MZg3DwnmzPnHtUIEmxxnpTqL7yxY9T375kp5J
         AyJvBt07c+oxZIII5EST++EC5REfKhPDuMNn6PTSo5qYHUO2PIKss7RThRtJlk3AjzAk
         aEPy7K8bq6o6yFEWO1rT24iBd9KbpoY67ft3bt41jVHtPjZMIwhRKObi3g5fAc+QewYq
         0vIsjbfNM5Q4Wp2xWYdyQJDw36tL+o52ZXK1m3pDECeHkMAC8odyCPc3s7UxzsrRs/Qz
         p8pw==
X-Gm-Message-State: AFqh2krmpPbFJGRaEj6RjKILQ3wAUy2eT7WNUruiTus5TTTww3kmv0Um
	UiPqyguTaDGIhu4ACGA60B+FfHtlylJ+Uw==
X-Google-Smtp-Source: AMrXdXtly4sMLku9xvnEQhuOixTStiXNkfeIkuXo+yGSd+9BPRhXoq+Sj1k6uI1Hm7JWVp2tCAam/g==
X-Received: by 2002:a05:6a00:21c6:b0:576:a74a:13c3 with SMTP id t6-20020a056a0021c600b00576a74a13c3mr81912481pfj.1.1673220841080;
        Sun, 08 Jan 2023 15:34:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id m2-20020a62a202000000b005869a33dd3bsm3002632pff.164.2023.01.08.15.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 15:34:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fluentbit: Link with libatomic on ppc32
Date: Sun,  8 Jan 2023 15:33:58 -0800
Message-Id: <20230108233358.933320-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 23:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100477

We do not have 64bit atomics otherwise

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
index 56ba72bf59..814d4b9644 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.7.bb
@@ -78,6 +78,7 @@ EXTRA_OECMAKE:append:libc-musl = ' -DFLB_JEMALLOC_OPTIONS="--with-jemalloc-prefi
 EXTRA_OECMAKE:append:riscv64 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 EXTRA_OECMAKE:append:riscv32 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 EXTRA_OECMAKE:append:mips = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
+EXTRA_OECMAKE:append:powerpc = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 EXTRA_OECMAKE:append:x86 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
 
 CFLAGS:append:x86 = " -DMBEDTLS_HAVE_SSE2"
-- 
2.39.0


