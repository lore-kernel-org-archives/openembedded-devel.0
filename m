Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10883C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:55 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.2362.1654283985679368602
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L/9SDXQl;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id u4so4959149pgk.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FY6GLg7RZlSXF57jlHOE1iXuCAi2iRz+ceX2YnmuU8s=;
        b=L/9SDXQl31vV2nwACFSenx9dCHngAQ3ZRaAQRdMblLHAbdwkib6/OMl5WRrFq3ZSDO
         9/9QFFW+m1cISHx/w7mffOgQtJTYyUdwmlNNBSSnKMXQ2jOGoq3m2Et9Axyzdc0JDn5k
         6pM3H/qCnap36afrCDW+HqpglXOWvYTNhp9HTn0iSmAKHshTvL8IShEOJB/7IVKdLqA9
         JkLisCWj0Uy+Bp/hr9t1xGqrPIaBm14izI4EJY8IkWO/HJpHekdUXwdyoAm2fu6WZH7U
         JdbE1OmdXo2sUTcdJJaAqQjiRbageZHX20iETn3WaPCDI0c3rSxMdk6YVbgsubU7RqnC
         qGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FY6GLg7RZlSXF57jlHOE1iXuCAi2iRz+ceX2YnmuU8s=;
        b=jTymmvylHdRomoAUl4Rie/mvrop/uRba+jUnbepIbtbqjgVXRdZKukuyL22UGnI6ac
         VGWPbxVd34BxFkevlYEuP8o1RkQ5lmltkXmK/2H+H3GwLmHJ2DbUW8jLlmyTyMtRqOig
         utANahFoc0Ff8TJKV3xefUy5Yx/VyM2RGYdhrv21OhKlZbOzuEUFhpL9z0ia8ftGFwnm
         3RR29osqHIVmcY+fDCB+zEPyd1hFpsjxxIXt+m2lYrW56b6EDkTYvIQdubQ+/NjnSTmx
         lL21bpIXg55e7Fcdnd3ZLNsS+UDPBa+SjVjAVyXW1Jw7828Q/GJngmCNssOzWL6dCyA8
         v+nA==
X-Gm-Message-State: AOAM531wVY3vNdV4/YvXoAsPF3E2T3Ju5VeAqRGH9AmjBWbaMAgeO4nB
	82g8m7O2I8+Ko4rebTSPyhAV+D9Qx00=
X-Google-Smtp-Source: 
 ABdhPJxv2D0feL9yb+7+Wr980RsOljEpAygaw9bbs6ixmyice7KLjHvsSUNtlaNYL8qbqEUyt64V6g==
X-Received: by 2002:a65:4506:0:b0:3db:48b1:9ff5 with SMTP id
 n6-20020a654506000000b003db48b19ff5mr10421990pgq.89.1654283984865;
        Fri, 03 Jun 2022 12:19:44 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 16/20] sdbus-c++: Link with libatomic for rv32
Date: Fri,  3 Jun 2022 12:17:15 -0700
Message-Id: 
 <99496d2b3cbe44d86cc7c899a0c486f9ea4c3b3a.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97405

From: Khem Raj <raj.khem@gmail.com>

Fixes
libsdbus-c++.so.1.1.0: undefined reference to `__atomic_load_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5029571d689f80bfa5c3a391f088d1484c61d583)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
index e1a7033a20..76fd6b65b1 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
@@ -31,6 +31,7 @@ S = "${WORKDIR}/git"
 # libsdbus-c++.so.1.1.0: undefined reference to `__atomic_load_8'
 LDFLAGS:append:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 LDFLAGS:append:powerpc = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+LDFLAGS:append:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 
 do_install:append() {
     if ! ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
-- 
2.25.1


