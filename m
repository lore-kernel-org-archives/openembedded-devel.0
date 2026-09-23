Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A21CC98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:02:08 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1021.1790143326390465276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QleGjRK0;
 spf=pass (domain: gmail.com, ip: 74.125.225.140, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so2255475e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 23:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790143324; x=1790748124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VqH9Ijb2GK7pK4C8sPMRJX+rMT7E32i8xv90x+uPZKk=;
        b=QleGjRK06g1mlN2ivxobwr+Y5fMmI1eUVhKSMsLW9eRaCixrHRy/vbjaLdn+KM3O2M
         qNZ4f5WjiAtMwFxL07Ul49MMtQxcQEGIPcmsEQP7OyAY6oUYbySGaw5ZXw7/NbIQGpRg
         I8qzoDeeZ8Gz2NMoMOjIvZGKxOpncVvgUVUN8NAaNOXfYZ85laPEA5gUqXGXZFqGm5S7
         d4w6zno6iC6Bzf4XcfBRQ1x9nq1F6noM5R35DsdsiV6gtKOZZoawILB1Vg4lbn5k2e+9
         pEJnNgoeLFxw3BbVDeMB7mHtwSAZTrTmYAgQ9uVVU8RqMrxBoVw8OKU6FYQME/91fNGY
         dmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143324; x=1790748124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VqH9Ijb2GK7pK4C8sPMRJX+rMT7E32i8xv90x+uPZKk=;
        b=FdOddlLVQd+bHVSsz2hXfNA8AvuqMSvpNoog6A2hpS8ptCzhiH1C2pj8IQthJ9PCRl
         tbdsZ4+UTkJ+2DYjNmZsDGOLoAW4P2pKxpTIsYS7bVTIoIckDziqJKFtvXlGIuNaExZf
         YpsDTPlY514X2l4ryHzzywLBrT2wSS+w79sLsaZjMLPE8pEikHJ95D/ylIqEvUhuUS7k
         WXyEHeiuYVaz5qftlTq2amRtUsUS8VK5PozSwE7yXlWhAODKk6TLYomICtg/9JJ+AsRL
         kiPphzVtUDPpT3oir0Hq0b+oSjek0RJ5gj96J5+svycqNWUtnier7YbX7QO4fX5yuvYo
         Aj1w==
X-Gm-Message-State: AFuF++mWQq3MBKhqETw9AQkcqsLPKCRKnHgdKRnT4uJoMf7T8gACxWKs
	syyngTyqlNZgumuqyMhU76X9riWBVlWUQk0onSCkVZkZ52PPojvcoAc1xXUwEQ==
X-Gm-Gg: AYBFou15tgWXxYEM+0dJKoWmhQr6kLYugE4PSVBbAvbkluGHnhu3Jy5Q45wAUlC412i
	TbbkjV7+kd8wFGxMlktfRL2DzjoCyGGXIW6Ng86rXpMNnrKgpyvIsJGOdMu8mzmVTBm098eWxQZ
	8OQ9Cg6Unu2spWl+4nIb0wpJDf3BBZAB8X+LPLdDTHxVJb2bXO7zHdii7IMiuq4CftVMYfb+Swg
	27BsFALjxNSEcV3Bwb6xm3lfx5gxA5a9tzwg/xwyodfVBI9naDED3tckR/bBz2vMGA5VUEju7Xe
	/dGa0dW2C1i30P/0yi0k2StAYtuXDxLGf/XX+pDu4luIUDu98jtiW1usWXOCeFzN/yAQr3xEok9
	wNOs4jBdm5r9z5jUTUv+T5tm6gOwCgzoMmos4vt/+E8f3/F0D5ewGyT8x9a/hGSBhRY6lV90B0e
	jodmM9Zb3vsEOX8mZMFfgH/vw8BTdbBqULyQ5IvD1tppR7f0F0ko6wWj1HErrnGUqpwRkkYjcpp
	iPatqgr59UWdpnjblXWrzCb0d7hSjTm8tfUzbLpmFP4ac2AWC3CrNxfBJPqo1T2JKA0Dgo=
X-Received: by 2002:a05:600c:c176:b0:49e:6865:904e with SMTP id 5b1f17b1804b1-49fde49755dmr20062425e9.12.1790143324157;
        Tue, 22 Sep 2026 23:02:04 -0700 (PDT)
Received: from dld58y9k4-lin.dl.net ([2a02:b025:15:4808:dd68:b3a9:ea21:2130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1ec8a1sm62403295e9.15.2026.09.22.23.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:02:03 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.2.20
Date: Wed, 23 Sep 2026 08:02:00 +0200
Message-ID: <20260923060200.1172534-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 06:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130186

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../{vboxguestdrivers_7.2.18.bb => vboxguestdrivers_7.2.20.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.18.bb => vboxguestdrivers_7.2.20.bb} (98%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.20.bb
similarity index 98%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.18.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.20.bb
index d9ec825c74..8ceef234cf 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.20.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
     file://0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch \
 "
-SRC_URI[sha256sum] = "06db4060caadc70346335c0a731ca6667cdabf206de289c64f3f96f2d341b9d0"
+SRC_URI[sha256sum] = "5c2138213b72f36c129b92c2c267f2a40e9c98513f4c86a584327f09f9be706d"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.43.0


