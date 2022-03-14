Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369E8C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 16:44:06 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.28738.1647276245265726104
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YU00qbsu;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id q19so14354053pgm.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fAVBpV6SswpnqdciQZZZfuGvH1BhkW0NsDcJ2DWUf7o=;
        b=YU00qbsuaVbCzAAJrdaPBqK98J8sc9jbEOZznTzqt4tongf4PKMr1pPK/HzJKLSXPV
         9nIaexwsybGKv5Sb91yNTNWBYnr1NUm0voTwbbUtJnuDxuoTb91wjPMffiT+5/2AgDwY
         2rXYZAkQo4w0r8qRUjfLnUlx7NpmnPwouMiNrqZ12ktcMSA7KM25QELfM5gsvH8f4CQT
         Fgw3S5XTytfhSliv5RawewRWgVeOmg8G1sEC2mPsH9D3bU2+ikOi7PmxhYYuc35vii9L
         jIusY8tJtRzARzY5fjTdw5wtTbIP1dRBRz7nQXnGOrtnV04Ik5NH3+LsuuReR64GWxab
         YUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fAVBpV6SswpnqdciQZZZfuGvH1BhkW0NsDcJ2DWUf7o=;
        b=0AG161IsYsezNxA58QyDF6Vk+rPzXmarUO7NhfGVPODi2U7QbYU25CKY1W1GlvZZgU
         gEDTr2NMxcpLTtKsP9x5hqgoeuQE9W88sg2VATcMVat46DLs1h+3c8V6dIh2buiGgJZR
         tgVA+L2OetG5Gq0zCt1yuHieop8oABBX2eAENZXXVS8lxIoMdoOvxMIHb+I7e9DDt2pU
         wHipRMPsb+Wzk/q8nGMfbDqS4h0ypy/HyObmtOJ34sPSNX1coE5dwyEvmFwyNp+vVY6N
         dXC4S5av5NKMxu1MIi0s3wLmHRS815xo2cgQ5gyufTfRu9qc/o/Y6JIPPnA6WsthrnR8
         lvaQ==
X-Gm-Message-State: AOAM533ywby7vs1bndnyGw91AMCCrqyi+omJvtvaJim2BH7GtyvRT6HH
	pJzebk1FDEH8aAWjqFyxc+iWXqQvS7k90w==
X-Google-Smtp-Source: 
 ABdhPJy11AJV/Xa5Q4BNQs8GHjPo+mw4w3bg63Z975m2dasnIDwGTCZvtn7d9yGp9IHNhn3FYHoqfQ==
X-Received: by 2002:a65:670a:0:b0:37f:f344:76c1 with SMTP id
 u10-20020a65670a000000b0037ff34476c1mr20894393pgf.204.1647276244492;
        Mon, 14 Mar 2022 09:44:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 p34-20020a056a000a2200b004cd49fc15e5sm22554548pfh.59.2022.03.14.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 09:44:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fwts: Do not use --as-needed on ppc64
Date: Mon, 14 Mar 2022 09:44:02 -0700
Message-Id: <20220314164402.521826-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Mar 2022 16:44:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95985

This is not seen on non ppc64 hosts

Fixes
build/src/lib/src/.libs/libfwts.so: undefined reference to `fwts_acpica_sem_count_get'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/fwts/fwts_22.01.00.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-test/fwts/fwts_22.01.00.bb b/meta-oe/recipes-test/fwts/fwts_22.01.00.bb
index f14d7fd8e6..1f2d3e0521 100644
--- a/meta-oe/recipes-test/fwts/fwts_22.01.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_22.01.00.bb
@@ -23,6 +23,10 @@ inherit autotools bash-completion pkgconfig
 
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
+# We end up linker barfing with undefined symbols on ppc64 but not on other arches
+# surprisingly
+ASNEEDED:powerpc64le = ""
+
 FILES:${PN} += "${libdir}/fwts/lib*${SOLIBS}"
 FILES:${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
 FILES:${PN}-staticdev += "${libdir}/fwts/lib*a"
-- 
2.35.1


