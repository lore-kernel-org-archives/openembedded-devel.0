Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535A3C7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:53 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.11460.1685531623237134022
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rKM0ueGL;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-565ee3d14c2so46374777b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531622; x=1688123622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTe7yl+ULyNDZLZNzbPMqHgj9o7vrc2JJtJpps1vGjM=;
        b=rKM0ueGL+Gcw11tr1Ih8A0KSmdxK19ie4fIuWhJ1nkojCxPSPV+J6hNGAnPGFC+OzX
         L7nbIKvSWn9k7fIu2UI/omieivxr2W2unGwN2gyuvbwSrQRnX5WUOnp0G6i+E9h8N6dC
         FM0s4p+IkTroONkquGgz4w0KNkic4m/D80Acug2UdraWGAKr9XPq9jLZzWCoIZwvK73F
         Smlj6ZudLlISTpKWi28CB43YRaF8y23O4YRV5rgLFTxwpOOA2DkmoeutBfafq3pESnwQ
         vTleUqUc2EesAThtMFxFi47kg9/goT9wWIJld5bQzicYU79ZPIeRg1t3Se9umcK19Qz/
         WidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531622; x=1688123622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTe7yl+ULyNDZLZNzbPMqHgj9o7vrc2JJtJpps1vGjM=;
        b=S7d+lNhME6qz6ha8VrNFsUdFfl212ob+3fnEO1BHrsjge7vuGb9o+BAeAgjpDDc2bb
         UKAQJt2HSqgSL5TD7RFB6i70AOULyz5/zp5EZ+7MunzhH+466DJ/5QykdrrqpYG36AXF
         2XyeRVNuFLsamv+l1QD7Nr5zARdSFGXnWsYrHzsQUP4QSLv+CVls3c5bjDN7GYiLNKpH
         QOXh8IxUDVwKrgaCf5t1KAySWDdYifB7Zj0ACxB4aLsAJf1NYf6j+SJKX4fe0rdP3a91
         K7u69qYf7lJIHNY4HDZobBXdpiRHGCKEEj24fLZ+5aP2ifJVfKEjtE8Jew+5N5bZ+vu8
         7Pmg==
X-Gm-Message-State: AC+VfDxe9bWbc7YKypxqP9rbRGCtcHRi/e2bWeO+FbIZwPbPp8MYR2N6
	rXd3C+UrDG0uFUeU1SDzejbCqt3Pfog=
X-Google-Smtp-Source: ACHHUZ6hfImbeiThjIrRWSA3C5liSp3WVvRwz6HpZ4eXI08Kl8iDGxkPuGxdGrvHOfbDvEBOstB5wg==
X-Received: by 2002:a81:4945:0:b0:568:8b79:731 with SMTP id w66-20020a814945000000b005688b790731mr6224911ywa.41.1685531622100;
        Wed, 31 May 2023 04:13:42 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 31/36] ibus: Point python interpreter to target location
Date: Wed, 31 May 2023 07:13:04 -0400
Message-Id: <20230531111309.2454603-31-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103060

From: Khem Raj <raj.khem@gmail.com>

it encoded PYTHON variable during build which otherwise points to python
on build host which is not correct for cross compiled packages.

Add missing dependency on python3-core which is needed for ibus-setup
script to run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fe0e3d77eb1a992c487038e64b734b2b8b395647)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


