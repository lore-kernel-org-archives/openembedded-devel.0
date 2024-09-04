Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71242CD4F4A
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 22:54:11 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.63853.1725490441381135540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Sep 2024 15:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k+nld1v+;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso334325e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 15:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725490439; x=1726095239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLTvyWqLyL5XF6ZxjxGtaM8d9D8yyyhqGIwBUbaNo3g=;
        b=k+nld1v+MhzsxPFonXVFJ2BgpxaSfT0nwI+huICPRHFs2BmZ9X6/M6Wr4z+u6ei2ao
         /PWK2Z+eiBAlPD5b02afMWebQWuaUX9+D+Py707e8wz5OhYLiUgUap8yewvkRV/hsLDP
         KtlzkLfoTs8fj2BiXyXMRIWV51C+LIgiV1k4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490439; x=1726095239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLTvyWqLyL5XF6ZxjxGtaM8d9D8yyyhqGIwBUbaNo3g=;
        b=oFw9W2I7L32OY7+GWW4lOZ1tcyUutnMnSlvu4HKVUXt3JeZwmPFpM4g9FIyAXq/XCG
         hXM9CPJsVyd0JEnj9/ytHemHltq56wMawQMmLsPeIWQT9v9JY/I68iPlxuBn4TufVwvf
         TP2Ukfvt35+E0fZXx7EJOM2CMupc6NqpkyEVLD2k247m+BTG+06wsUO9kuoYbYa+tG/V
         CzG04uhRafwIXgk8EJJonHB5THSHOvw/EBf8HkRF9Yy5yTaQNlnOEldlTWQtRq/nbQCO
         /rYKLgAXvvKtU0ets2My5apTw4iCW4cUkoAju+tzmCbJwakAHxKJhiUx1yVlxc4d6jqa
         lYCA==
X-Gm-Message-State: AOJu0YyKnOXrtND3tbs558yb11PGry0npeKq7r6CZuHQeKHCYk79gUUt
	SW5Az0WUbvsF4S0kHj8RGs3u6FoJ5Mq3j3TTyFPI9Ni/6mrG4BCcpIz1tRuXKvIWRM83rTKPZqy
	1Dg1mOA==
X-Google-Smtp-Source: AGHT+IEZhAhVK3ylcUFoSZbqDpX0bckd2oINinQ+UH9JGB7L75Ca0mBldR0a59ghu5buey4zo/AXnQ==
X-Received: by 2002:a5d:538c:0:b0:374:c0cc:a1fb with SMTP id ffacd0b85a97d-376dea47423mr3834611f8f.39.1725490438931;
        Wed, 04 Sep 2024 15:53:58 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c046685fsm12833761f8f.79.2024.09.04.15.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 15:53:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 2/2] polkit: fix build on sysvinit
Date: Thu,  5 Sep 2024 00:53:41 +0200
Message-Id: <20240904225341.2699885-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240904225341.2699885-1-yoann.congal@smile.fr>
References: <20240904225341.2699885-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 22:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112094

From: Yoann Congal <yoann.congal@smile.fr>

Polkit unconditionally installs a systemd service, remove it in
do_install() on SysVinit systems to avoid "installed but not packaged
file" error.

Fixes this error:
ERROR: polkit-125-r0 do_package: QA Issue: polkit: Files/directories were installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/polkit.service
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
polkit: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: polkit-125-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-extended/polkit/polkit_125.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb b/meta-oe/recipes-extended/polkit/polkit_125.bb
index 2405ed6034..a67aaf908f 100644
--- a/meta-oe/recipes-extended/polkit/polkit_125.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
@@ -55,6 +55,12 @@ do_install:append() {
 		chmod 700 ${D}/${sysconfdir}/polkit-1/rules.d
 		chown polkitd:root ${D}/${sysconfdir}/polkit-1/rules.d
 	fi
+
+	# Polkit unconditionally installs a systemd service, remove it on SysVinit
+	# systems to avoid "installed but not packaged file" error.
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		rm -r ${D}${libdir}/systemd
+	fi
 }
 
 FILES:${PN} += " \

