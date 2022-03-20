Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D270C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:22 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.16148.1647763701845680688
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ffIEOj9+;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id i11so9606875plr.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5nlSMXsY6tCt8vm1EP67a8EFyDH9WRoFID/FKfrFc08=;
        b=ffIEOj9+X9KFleGwemlItcpe84UxP6qMYdVtqcB2LyftQXqCJIBEaU7mrxwUUAG6jZ
         RaL9YAjqIsh+OPhrZWu0d8AdinNrF9mmVBEq3yzzkXjEdF927TGO316vmrTvzjVE9EHc
         YVNPlFPqUyaHPyPQeCe1SIBhkA2sVL3LDYMJij3HieKLox6NxiBio6Fp8yC2qvmS3y3w
         dRgNmDUx32liAxIu+3hXVkxMaCJke5gM9ZVJUF5R/saPGGuK1/jvnvLe6MBxw0N6LaHL
         H8TP9d5Amu3CIKQJUvLCBJnnY0VvXkLoQZQgBYZ/qoeICKmJeNuvVX38bPqCTPphx0ir
         2Ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5nlSMXsY6tCt8vm1EP67a8EFyDH9WRoFID/FKfrFc08=;
        b=iTQRGQMH3ztyI6SdO5Qymkex/UXki/RxN9GkR33WT4eI0lPj9HoJWSjvLAcVSxcP8N
         KzViTw9Ho/YhFkREm5z14imBHGycFH1R6L+MQHVNfkr6Yymw/WLkD8IHs8Gwox7Qf/qr
         9Y0bAoysIXMv/uizybX9I4ZLEm4PJPQVfA4xjvOQwHIFZMVqXbVBdx4BizaIUUPlaD86
         y2nVl0OdMrwxYAjj8FB06lwyYpi//2ThMW6+JyjCCpuv3vEr7wPVTKmAvKVF71BVuF1W
         BSPwPmuLwdIp3Ah6+1U4VWa4VvtRdsG7JHBFT/eKzEVlj8aB9ws1osoDP+vjMHRGBgZf
         TACA==
X-Gm-Message-State: AOAM532yER+81SyoJ9kp/kAUNi/j7zuOdpqeDV7SaSYLM+poDSVno/S7
	VPXx5KTRIx3VE/JyUUnW9rIdFc3xmkOBag==
X-Google-Smtp-Source: 
 ABdhPJwilLqkmfXsqDSPDFAhXKuTSbhV++ZD6PnnpcLURCHES7PwaBbvQp4oSvvFcGeBdq66c33y9A==
X-Received: by 2002:a17:90a:ba15:b0:1c6:7873:b192 with SMTP id
 s21-20020a17090aba1500b001c67873b192mr19933894pjr.76.1647763701203;
        Sun, 20 Mar 2022 01:08:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/17] weechat: Define LIBDIR
Date: Sun, 20 Mar 2022 01:08:04 -0700
Message-Id: <20220320080815.825928-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96070

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-irc/weechat/weechat_3.4.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-irc/weechat/weechat_3.4.1.bb b/meta-networking/recipes-irc/weechat/weechat_3.4.1.bb
index 515cd95328..64cd1079bd 100644
--- a/meta-networking/recipes-irc/weechat/weechat_3.4.1.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_3.4.1.bb
@@ -18,7 +18,10 @@ PACKAGECONFIG ??= " ncurses python"
 PACKAGECONFIG[ncurses] = "-DENABLE_NCURSES=ON,-DENABLE_NCURSES=OFF,ncurses"
 PACKAGECONFIG[python] = "-DENABLE_PYTHON=ON,-DENABLE_PYTHON=OFF,python3,python3"
 
-EXTRA_OECMAKE:append = " -DENABLE_PHP=OFF -DENABLE_TCL=OFF -DENABLE_LUA=OFF -DENABLE_JAVASCRIPT=OFF -DENABLE_RUBY=OFF -DENABLE_GUILE=OFF -DENABLE_PERL=OFF -DENABLE_ASPELL=ON"
+EXTRA_OECMAKE:append = " -DENABLE_PHP=OFF -DENABLE_TCL=OFF -DENABLE_LUA=OFF \
+                         -DENABLE_JAVASCRIPT=OFF -DENABLE_RUBY=OFF \
+                         -DENABLE_GUILE=OFF -DENABLE_PERL=OFF -DENABLE_ASPELL=ON \
+                         -DLIBDIR=${libdir}"
 
 do_configure:prepend(){
     #  Make sure we get dependencies from recipe-sysroot
-- 
2.35.1


