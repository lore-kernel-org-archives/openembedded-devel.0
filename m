Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6225CCD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:24:46 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4410.1778667879943985548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 03:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PG9AYSOU;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65c364b893aso6441498d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778667879; x=1779272679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQUIfpW3Dz26ESpMHnGXdhc7rn2g4kLZGcifbtZKVAE=;
        b=PG9AYSOUw0wpj06j/Fxtyvxl6/EHO8UTvzUBDh5bb4bTAp4flJ4mpsOtbRFMLuAmzP
         b9lz8q4ejMTBBgPmY5i9TfST5RyoUHYblz62ueKR5sYGgmZuJtcZYehbph7rW9P/5+8e
         BzKk3/Q4BNoaq7cu6wYdCESxYXeakWYkzWj6Vwph18u4o9+OztNlbv28CrwhKClVIcqY
         JANMivXCqM9ukiNoGFzwWQc7KCLlL7KBV+3LUCNTcQaoLCsTy6RZIqi6LNdyUX9qObvn
         YQ3DuzPB/VXaxrIEN9LaBLkVO23YP8CYP4fFF1od36ctl0kolyPxdl9nxoOVpSKBzG6M
         WC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778667879; x=1779272679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQUIfpW3Dz26ESpMHnGXdhc7rn2g4kLZGcifbtZKVAE=;
        b=rcraYqpuqtZHzRyWO4AvCV5zI+NPj2hYpyFAL1RQN6aVzrjJfqivyeNRQqxHeSedvs
         hEWHO0AXUPxBohcB/gDV2NCIwgZMDAfHGPH5UxcitWDKpWeStWC/uHEt1PdzklGu5McV
         BO4oLVV9UcagIzvd8qOxj4Yaf0Z2NempfsvFN2lHS0H7KjlS/IsXpDVvuq1jjh98+EAI
         7f+dWm0oXOElm5KG3iZXN2vTMZ/cnz/cDJmx5v8VU834MNypP0dEcHEEl3Y2Ff9vs9BE
         PAJk+UkbaFY1c3ZgGTyoVaWTKtwzdzIHQkgJ25HeF30o4Ml87Q7m1HO9FReGV9Z7hLVm
         dvAg==
X-Gm-Message-State: AOJu0Yx07P6ce2oQjoiBho27WvQCObdOtmNnpLwAcCQdiZjjTB/ylxMg
	7ijNahklKa3Wv+S7dp+v0ze86HXMitARsleXeKG/iSi5ev9YFl8vPSHeHbuMNo6k
X-Gm-Gg: Acq92OHgCUQPFyB4VzXoa1S7AE6Rp7ckt2tP0iklfwTSt0FmY+T4golqHWVbl0+SeRU
	rJ1J3p5+EbDM6xMrT2gbk9s4CyjXbmhjAEG+L3AYrs18ezA26Dv3mZmL7mNaq2TNtLPqRde/LHw
	2yiHXvhUZAwaEiqtipwc9oQiHUWNOzHNtVvmrVXfsSnLi2LzdIUZUZo5qEfBprZNDVKg6CSiR1s
	53HY5IuE4PLhO4m45/HYsH8yzDa20j9QFb0m7eilVFxGgyh1gOJPj3JddmSfq8fiLiMSzOPylCZ
	slbcU3xiQ2UyT66NHQlCIkgvCa62BW/8AKaHkudYCmUKxHmmKGTvfCLqPJXaCwdWIu3xN3HZ7nv
	4D3gZ1adLAsnzlXQhEbshcmdRvvvKuWH6YJ1NKhSL9usXIaCgfLownYnX4dT1eX5QvtMcd7tHOc
	qF2dyo4Bdxe3zIbMO1HShYQOZYmrwCl57nNKLes09BAw608hOfpiOPRw2SsIUafPh7X+aoM/sav
	t+q4vVdgXxYnTIJcWIndGs7Bkjh2jMmwBEGq6A7DSsUVNtWYNQ=
X-Received: by 2002:a05:690e:bcf:b0:654:69e2:e778 with SMTP id 956f58d0204a3-65df62349d7mr2457700d50.18.1778667878714;
        Wed, 13 May 2026 03:24:38 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65d96c5719dsm8557262d50.21.2026.05.13.03.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:24:38 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] webmin: upgrade 2.630 -> 2.641
Date: Wed, 13 May 2026 06:24:33 -0400
Message-ID: <20260513102433.309246-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 10:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126964

Changelog: https://github.com/webmin/webmin/releases/tag/2.641
Changelog: https://github.com/webmin/webmin/releases/tag/2.640

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webmin/{webmin_2.630.bb => webmin_2.641.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.630.bb => webmin_2.641.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.630.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.641.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.630.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.641.bb
index 6a627e1f0e..b513ec14e6 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.630.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.641.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "47e25daeefeb98598f4b3f3d99e5093fe618b96eb1b952e938ba6356806be20c"
+SRC_URI[sha256sum] = "220015eaff2b666b9bbdf2ce2bc676de72d33e5cc5f35b800b0fa14934bdb95a"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 
-- 
2.43.0


