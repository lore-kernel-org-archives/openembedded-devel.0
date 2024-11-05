Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796D1D3E78C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.30611.1730838866236950276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MDGMPbjj;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e3314fc5aacso3599947276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838865; x=1731443665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzXT1nXCR8gC7YGoVltaIs4/Ae0EDgb2o2dPvH0bDIs=;
        b=MDGMPbjjj585mVtBy3H7mUcTJftYSwKeOOaxVfH8wJW4jjmc0j0e8jKT0voPiXkotR
         COxASdcuOym5BoZI1v25tiIS4KXyaArDbwExQ/NIVuRjb8mnvBrZUNc6XeBPUEvLfzdC
         CUyZCOMqnsK9DlFlla2DoRbuEloavuMLsbi7b6qCmcJioshXwjS/VCp3uYAWBPvJDRBy
         pkwMLZOEifn0okHMSd0XsAajYzkNdg7+vgh8pPJ6mjz6VSWkkN4+d0JSb4NEmED3Rj8P
         vzCrLWnjZVhkGTk9cWUxs0aTNcUFDPWCL6ezgH210Xumu9lm+8UMC5Fjzlg4+/SAFO4+
         FRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838865; x=1731443665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzXT1nXCR8gC7YGoVltaIs4/Ae0EDgb2o2dPvH0bDIs=;
        b=IZzeuyIZ9KslJv3yf9V/DjTXEatfsjiielTZ8F8cNlfDYO1izT8HEN5OB+qs92174A
         waDCirMlc0r7Y+8v8VycprkA/fCBj4EKATMFPHatwPyzifFj1QqbDp0ZBc1RNCFxMv0h
         NVYzh1pw/ZlBolKmWEma2wr+b6Eg3bFvaLumNilmoagc24BsKFvxuOyUw6UrCrMTpWNv
         DjNjCh59WuIcuGAcbCDqUNtY10+NzKYUBYDC4r+d/6rpsMDFLVFaJ3/Mt98wgEZxp6gd
         G5DfZDNI+VuRsiRO6JHSSRq2MMG0Ww6CxJ42yMUeFaqkx6XaazlU9k1XKs20CESiwxGt
         z/ag==
X-Gm-Message-State: AOJu0YzWaeJTCFWqG16TOEzl5q0dP0dj1Z95si7TV5x1+i/h4EWuTz3Y
	bVvZfowAtqKc21CE8Wf/dH0KUyerZ2jVzpxBKZSiktYHl4PNqi6v+E1SaVcE
X-Google-Smtp-Source: AGHT+IGvQZRD2ofaAtrnBLQYlqVGWqUqQf97LSOQdas3Uc1zI72e9jJE6r5PJn5R+KW77XWsjKl12w==
X-Received: by 2002:a05:690c:360b:b0:6d7:f32:735b with SMTP id 00721157ae682-6e9d89f3db5mr360382477b3.27.1730838864902;
        Tue, 05 Nov 2024 12:34:24 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:34:24 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 120/161] daemontools: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:45 -0500
Message-ID: <20241105202827.3104-120-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113637

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/daemontools/daemontools_0.76.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index 6561a4ae0..7f7739028 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -26,7 +26,6 @@ SRC_URI = "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \
     file://0001-Fix-signature-of-main-function.patch \
 "
 
-SRC_URI[md5sum] = "1871af2453d6e464034968a0fbcb2bfc"
 SRC_URI[sha256sum] = "a55535012b2be7a52dcd9eccabb9a198b13be50d0384143bd3b32b8710df4c1f"
 
 UPSTREAM_CHECK_URI = "http://cr.yp.to/daemontools/install.html"
-- 
2.43.0


