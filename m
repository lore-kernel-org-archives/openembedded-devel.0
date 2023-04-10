Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789B3C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:11 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.52967.1681153084241729972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=Gz4fQKu/;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id ud9so14420196ejc.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153082; x=1683745082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm16gROop0d/Sq+r+P26cLkl8psiYgSSWhpPYksFpy0=;
        b=Gz4fQKu/pIm38sttrPBVvm1FLkybqv6sxwgyj9BOq2Zp/fVTqSIVOMwMzV+x3AJDD2
         pBZ1oxFXg63GMYqS04tsxIdGNqOaILF5lA6Sr2lQoNL90LQrNKyUZ3ACXswJ3wNr7xVK
         Y/lxdX4zH94ae0RqCuZNid1cJ5hHazNDrNatiz47dEGI7OnMTkhkUzkBcF05cIwIDwCW
         y7KCql+/368LAAYx0biwf+NLDkuRsd5s1KG2gt8WHQWXuuzR8CZHuvBdW6xZYeOTbfGQ
         HiMI0aSjTFD9e/KS/4rN72G+OujQds9P1MmiIaaVLDkqQ2u7DVK6UnS9yhKflC/8qRVV
         s0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153082; x=1683745082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pm16gROop0d/Sq+r+P26cLkl8psiYgSSWhpPYksFpy0=;
        b=tGqpHMVQWf8542FpVq6sXRGob0ksC3E7OIAxF3JPt3WMDz0msuEnzhTuDpXswcDZIC
         6xcONdTcTSDfI+L6LfjSpkbgIOi0H0RuFXWLSLEBMhcYbWplm7TAgbSeAU/R4etsUptC
         hEHnoc7CJueEOo3KHVFKkiu7X939/zUd80FW0GRkR1L3RYPLxCJYaBnCar6UTm8VH2KA
         vjN3YQujxqJ/kAXcH0PZzc+4MS27Q+gLgBHichAOus2Y9+ElczLj12MmD4tAC5h9mrga
         gS06gpG1Tg9uGygvDxcQUiUFIi7rjRi76dawKarHUAGJ/41+lpQVh6d90VJR7IxuHBGG
         50aA==
X-Gm-Message-State: AAQBX9dGVU3WuxDMSUcU9aAfWgGixWcpCAGIdjkiy8OxB+2NTGi8fMeq
	cSX46zDuNh+eBS4AKTxy3WkHZStNssI=
X-Google-Smtp-Source: AKy350Zkt4wI9pLzU8VabRSz3A9Z8A9jvf3I2qUv/XRmUapnZGf7acw75qKVeLusSEAmiuF+HFPjww==
X-Received: by 2002:a17:907:969e:b0:94d:20d2:47ce with SMTP id hd30-20020a170907969e00b0094d20d247cemr1900361ejc.14.1681153082632;
        Mon, 10 Apr 2023 11:58:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lf24-20020a170906ae5800b00933d64cd447sm5335193ejb.121.2023.04.10.11.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][langdale][PATCH 7/7] dleyna-{server,renderer}: fix dev-so QA issue with multilib
Date: Mon, 10 Apr 2023 20:57:42 +0200
Message-Id: <20230410185742.2416583-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
References: <20230410185742.2416583-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102042

* the libdir is arch specific, but the subdirectory is always BPN
* fixes:
  lib32-dleyna-server-0.6.0+gitAUTOINC+eb895ae827: non -dev/-dbg/nativesdk- package lib32-dleyna-server contains symlink .so '/usr/lib/dleyna-server/libdleyna-server-1.0.so' [dev-so]
  lib32-dleyna-renderer-0.6.0: non -dev/-dbg/nativesdk- package lib32-dleyna-renderer contains symlink .so '/usr/lib/dleyna-renderer/libdleyna-renderer-1.0.so' [dev-so]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb          | 2 +-
 .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
index 3e43c0d2a7..e7f918333a 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb
@@ -22,4 +22,4 @@ inherit autotools pkgconfig
 CFLAGS += " -I${S}"
 
 FILES:${PN} += "${datadir}/dbus-1"
-FILES:${PN}-dev += "${libdir}/${PN}/*.so"
+FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
index b25e446c41..071379758c 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -19,4 +19,4 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 FILES:${PN} += "${datadir}/dbus-1"
-FILES:${PN}-dev += "${libdir}/${PN}/*.so"
+FILES:${PN}-dev += "${libdir}/${BPN}/*.so"
-- 
2.40.0


