Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3702C43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:43 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14711.1782634294199683214
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H+plromR;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4928339eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634293; x=1783239093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4rpQtqOWe4lO5bHlw7vUs64DRVC3f9UbVChbHZzypY=;
        b=H+plromR/SlRBlxjJcQkGjVruH5buGji8CpTzLWr/aO6mJMKj9uRa3fyScsrYd4wGB
         aVsdIaT3E1zhsAY073cDCkaGvO1x8IV8EsEJkiwQWlRTQAckRvyBJbjZxpiwJZj7TeqH
         8KAQorOP0v6Q2icBNtdzl+8+dG5d4LAFU6npfCGo9okF7Dm/9FSxcac3JSs9tM+8EbYy
         QTh8QxEd204qPyzaN2XvtkMUbbSKAWHii6D9I2INlT/nUZ78g3Un1rau2CsqE9pKy09n
         ImO+0Rt+Gz1BfNsONndwiaQpm86TBSEC4GVSUBD4nLJfRcAs/CvAW5tf8yNmSd2JX2B6
         193Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634293; x=1783239093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S4rpQtqOWe4lO5bHlw7vUs64DRVC3f9UbVChbHZzypY=;
        b=clFwUzZSPjmpsiVoES2NJ4hR6PhTjkUYx1r4k9tANE4kOLrsF1Bh7H6hCxEmPICbMy
         3ng8jENE/zYWw/Bar53drEFWSpfutrHZAHk00zh+sGMxMYSc9x64OMrM8d/rXBuO9135
         ZX2KfYuDvNIxUfkwUDUDtv3YQluohh+q+kIJFIpGYDunhTq4Xu3HeaBcUI5McvYDEk7G
         SLoL5chlzVvzXbkIYZhB/MIkzk9/i8HXoRt75FwTRvYRUNjSDWT6SMv5PBDyX1hR1x/w
         w/NT1trNncLOQXhVJBsPP9q/pallrIbQYYDy0fgqSugifaw31SIjPpMfgTbUbMmy0TeX
         6WtA==
X-Gm-Message-State: AOJu0Yxbgt0O5eqMohLfpaT4BFyC0h1hRCWui7nQIMXE+64u1SQJEU5M
	WZpjx2+iN083Z70RlE2/FtKpnEL1mGZqjOzdWvyrAHNQOXVbQRPIYbNSa2vZzy/iHKQHqw==
X-Gm-Gg: AfdE7ckRnMwsPcvfBwhvIftkmcS4hccmgnGH5QCLr/C9/ETSX5M8KBKbscjnp7R4/rv
	RKNRsJAPh6MzDHOVuCQSwbj+eIHPPeAYCAslyPpCjVO3Bg+UlZI4xqK6nKyiOsnfIq2TiD0lDtN
	PkvpiK+ABkrIit/kem1iFhdICFnBgsJcEI6tmWcxHmxHJYsqzJTa2vKSlzfihOrCBh4NWwM72Sv
	2zIjF1Ec4Seq5t82vXTcg4kVnsEsEIH/kDfR5wjEWrIZeo1eLOuuNH3iX7Io9ywed4yp6K+8ITA
	Wadmhbsu5FYv4dslX6YCazkNftiJHv7PfvQ4bqA9F6yQw/jtdFwS9Im6YyuSJ5/jQFixXFpt84o
	P6zte3bZrgIJE8+hG8Br0j5P2m1A5ryypGjxbr6BMJ1N+dW/3vhzYbqzKsehLjuXa7RuZXB1Fys
	f5BcJHrfu+fuJxWCOe/hl86kSjm/woX3wKkg6a0CZwJr/Z8Mhy1jlk7LqOWanvO8XTXHt94HLDE
	WiuzU+aVC6ukxiRJF3GVMf7KcQmHbUor7Q7aequu8jThtzxOS3rAHOOUp4AH1hNk/v6ogXzLytg
	NtVfakIrlk8n/jjhAPmaQ8r2YpBcnQ==
X-Received: by 2002:a05:7300:a145:b0:30c:38e8:54da with SMTP id 5a478bee46e88-30cab36a243mr8340684eec.24.1782634293394;
        Sun, 28 Jun 2026 01:11:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 009/128] xfce4-dev-tools: upgrade 4.21.0 -> 4.21.1
Date: Sun, 28 Jun 2026 01:09:20 -0700
Message-ID: <20260628081122.178348-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127819

package new cppcheck config file

4.21.1 installs ${libdir}/cppcheck/cfg/xfce.cfg which was not shipped in
any package

fixes QA failure (installed-vs-shipped).

Add ${libdir}/cppcheck to FILES:${PN}.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...{xfce4-dev-tools_4.21.0.bb => xfce4-dev-tools_4.21.1.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.21.0.bb => xfce4-dev-tools_4.21.1.bb} (79%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.1.bb
similarity index 79%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.1.bb
index 121140e2f6..9570d656f7 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.b
            file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
            "
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
-SRC_URI[sha256sum] = "36059f48bbb196645f6514ab5a356e55cdd9bc917edcaf6afd86adfc28d7a358"
+SRC_URI[sha256sum] = "2b127088f22453ffc725c002d2fce830bac86fc770e094d43b45e92e0f132c97"
 
 inherit autotools pkgconfig
 
@@ -20,7 +20,9 @@ do_install:append() {
     install -m 644 ${S}/m4macros/*.m4 ${D}${datadir}/aclocal/
 }
 
-FILES:${PN} += "${datadir}/xfce4/dev-tools/m4macros/*.m4"
+FILES:${PN} += "${datadir}/xfce4/dev-tools/m4macros/*.m4 \
+                ${libdir}/cppcheck \
+               "
 
 RDEPENDS:${PN} = "bash"
 

