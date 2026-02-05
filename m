Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23783ECD990
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 17:07:42 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25862.1770311252346922595
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 09:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fbvZR73X;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-435903c4040so891653f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 09:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770311250; x=1770916050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78vzYFzdVfRo3wlZe/Bdzd0j5+jV9zQ4F+KOthxCrv8=;
        b=fbvZR73XpZK7vzxKzNQ3h07LVFqfk2rpAlhF2W9vm9WWUJeQofMOxpHLAhOEYY10lC
         +ybBvsTin30Y1G7tyjDfvkLgLDRS/4StF+Mr+X3E2L4WnLPwDhqCWC0g+EtJNvZGXS6E
         2/0ccHUKcZJ8KjuiAoC92QvW0LWdXWzP5SMbhTdxp0ayH6f17k+cB3JvhJPaHiVoekQE
         O2mJeYp34h7m0gmo+oBMJ2WrzGH+nL8aOJsAWC+aWOMb0qQLQJx7pXDwpMN5OR1be6rV
         QuF/Lmrc3YOCB0kaE+skN03gxUZkBn7PVCEM9lXK5EnotMsvRdbHRya0bsj3pQyRK1oq
         +0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311250; x=1770916050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=78vzYFzdVfRo3wlZe/Bdzd0j5+jV9zQ4F+KOthxCrv8=;
        b=C2APbeQMHIzm1y7H4TyK9Wv8yo8wjcic6QR6HWv8G6n9iSJclPYiYkou4h25UE0Hjc
         8WHXQWkfK3Qqqw/6kL5ICPJUFPYbtYVGSSgo9++XQkcdvzqsWT+9T5SAuQ235POZoN1R
         uCHM8S2/6TzPB44WjXBzFQBoyjXsyrizR4GVxp7XVseonFGhJodAloxt1uBrdSe66SGa
         NVWJ/QV0EWOUIgXUTXu6qzicfb7EzmHWGhCXYXqwJAaA7kwdNJ8AWmiVc8BZqltRbgw0
         EqEEAevNo9RPfFwewwf8th5uOQoXxXIfzW4/dGlBI5fcx38+oFQTz5u/hshcokZN3Vtc
         JyVQ==
X-Gm-Message-State: AOJu0Yxe0pHXmPRNiB61jRJ6Dwl9X1Ls2tnOydwsBlFjJK8L8lPqweeQ
	ArJ8Lz83bsfwJsatbkK5KF+5oDqUDrUCzc591v46F+F9LBvB1P2x+HoUMhBHbA==
X-Gm-Gg: AZuq6aKCfICsRYphISAiStUQnX0xlQud8rB8A/dRoX4PIUNrrhvc7I17aUd31HuQ5Oi
	e38ybR6Why3vwCixqKTU5Aqxaea5/cPq2CQ11/EPOY/iIkcJpwL/bUHmqXaqdIh0WywActa1LdZ
	6YUSo7t6a0expDYZUs1XpEwxoAzUwNWZSPDE4Rr/b0bB0RoFw3jiEkU3QFYnEndZ5cEhFHMkIvV
	8yusqEtpm2SNQEpX1k8zqUMsYbqprx5lDdiPN53qdxfk+hbIWrY8X2aH72S3fcjG2LOX37A7lWl
	XVw6J8hMuEd0pYBHnk5q0gan93RiXNu9gX/DAdO6EYhC5kuz2l0DeDyVr1C4tLVlI2hzdSOrlX5
	SbfMracUdD6T2/vH+ot1Ww0Fm/xtcTX8quuPGEMJnfV0jAgz7GlD9dUU1zIqCCFbPI0wSNLNPxl
	xOkhDOvSYF7Gtu8um1gj8=
X-Received: by 2002:a05:600c:4f42:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-483201da2b8mr1482185e9.4.1770311250283;
        Thu, 05 Feb 2026 09:07:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d4d030sm102237375e9.13.2026.02.05.09.07.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:07:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] packagegroup-meta-oe: add media-types
Date: Thu,  5 Feb 2026 18:07:26 +0100
Message-ID: <20260205170726.2389904-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205170726.2389904-1-skandigraun@gmail.com>
References: <20260205170726.2389904-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 17:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124217

Also remove the old mime-types recipe, which is the old name
of media-types.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 9b92e7e3d5..87f8a1eed5 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -821,8 +821,8 @@ RDEPENDS:packagegroup-meta-oe-support = "\
     lvm2 \
     mailcap \
     mbuffer \
+    media-types \
     mg \
-    mime-support \
     minini \
     monit \
     mscgen \

