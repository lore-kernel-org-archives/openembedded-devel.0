Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DE4C77B73
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 05:47:16 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.5511.1684993636215031597
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 22:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rGrMigyy;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-64d41763796so1311072b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 22:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684993635; x=1687585635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKFmJ3BWo5lTvEF2Bg+U2TwxSVSdbM+dkln1Y/yHUgM=;
        b=rGrMigyypbodHSLcTw0DOxwTWU04Qx8Jxef2lCm96rrUf6O3K5ljAfdW6LtMvf7Is7
         MlYkfsVzod3x3yKtmODrBdQjK9lxmZODxcbCXxLjxWMEe8PuhIIFhxEoqnE0B/fejX+L
         0iOmxY8EwPYbZl1VdyDNbZEu6MxAd7G5XuvPHiB6XzZgXBTapuoV7fjbAElaShU7mFQ1
         NDGXGo9np3Pk7EVd8E1/03C7yQJRDPStvJ64QGgJov3/ixgVQPT8Ca6XNMvMJ9343tGv
         UGS0qCuWdZwm2+w40MbB5o2XAueQdDEDax114iIqGjH1KgfZ5jGuRpuKlJBZZMnYzfva
         QLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684993635; x=1687585635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKFmJ3BWo5lTvEF2Bg+U2TwxSVSdbM+dkln1Y/yHUgM=;
        b=FZHLEI8YMDBEG3e3sIpDiR0RuVJuhKsie1TKAMCSDBYSGYa6Jg3etjNdbWKLL3zfow
         2d3zFk9qvI7ujp/k6BDqwPTP0BQXFG3s5BXNrvhSSqsXLmBfuLbeG40pvnRg+npvuIQH
         kRWXgAePVsLSu7klXC9Loy/BCwiHjOiq3jN09dXosGgYLRMBZ7CjOZUMpiBiu0S5cU3b
         dX0b5a2dk2Ixm62QhjP/CG8fPMXN0F4qCvUaJJ7eAILMtbh2qkoVX69tr5IGTw3thB8f
         CN00lt89jYbFAR0FlEMS5JF7SM8hN8CqWpcIw8Tb/tsNkj32eMI7XE8lwB7dpE7OFKyx
         MuCw==
X-Gm-Message-State: AC+VfDyL1899OiJFrGxG8YEpT2q0VQulGfi+buyP6Osmcthap8TfDUgy
	hB776fIypXBG9elur1GGWiYCBHlCZgA=
X-Google-Smtp-Source: ACHHUZ65J0ewLYaMuU10DG6TV55FCtlPTY4+DM5yelIde/SRYFlK4zL3CEYtiQfgeMQU/6J7kWKlXw==
X-Received: by 2002:a05:6a20:4323:b0:10c:2fce:96cc with SMTP id h35-20020a056a20432300b0010c2fce96ccmr11776076pzk.34.1684993635329;
        Wed, 24 May 2023 22:47:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id j7-20020a17090276c700b001a6d4ea7301sm441286plt.251.2023.05.24.22.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 22:47:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/5] ibus: Point python interpreter to target location
Date: Wed, 24 May 2023 22:47:10 -0700
Message-Id: <20230525054712.1593592-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525054712.1593592-1-raj.khem@gmail.com>
References: <20230525054712.1593592-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 05:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102801

it encoded PYTHON variable during build which otherwise points to python
on build host which is not correct for cross compiled packages.

Add missing dependency on python3-core which is needed for ibus-setup
script to run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-support/ibus/ibus.bb  | 2 +-
 meta-gnome/recipes-support/ibus/ibus.inc | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes-support/ibus/ibus.bb
index 7156081499..141341e341 100644
--- a/meta-gnome/recipes-support/ibus/ibus.bb
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -38,4 +38,4 @@ FILES:${PN} += " \
 FILES:${PN}-dev += " \
     ${datadir}/gettext \
 "
-
+RDEPENDS:${PN} += "python3-core"
diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index bb662f2ec9..9579404b3e 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -31,6 +31,9 @@ EXTRA_OECONF = " \
     --disable-emoji-dict \
     --disable-python2 \
 "
+EXTRA_OECONF:append:class-target = "\
+    --with-python=${bindir}/python3 \
+"
 
 do_configure:prepend() {
     touch ${S}/ChangeLog
-- 
2.40.1


