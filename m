Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F3EC02192
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 03:19:52 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.31795.1738811984935561553
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Feb 2025 19:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=edHxE2xF;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21effc750d2so7667845ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Feb 2025 19:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738811984; x=1739416784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2RS/merrWlTYe5wyoRJTj3mRCwgqcMNKUbsWtsg5TU=;
        b=edHxE2xFc1pFQ4oyaEKQlOjsxwvJo5xiDfUTAd22EVnUUCPWa54a48ZIiTIiATHivh
         sPnXKWPhfkUvkfzT5bm3E/6lAxiE9hFX6fP7soVADFYyijc3MHEhh6mYKDAldV9Btu2s
         IiRBYPRHS5/b2Tcyhhd4vNg3VbmqaVFxz+uhqDhQznncvdu+uoAdB5PMx2tV3F/6Aki6
         fd9AjRt2JC0k9FIRXw0KDMEwwh79t7STBOJosXGmrGrsFTJS61Ov0tddsxjnW6lzxaGF
         7GhyIK8llzrRFEc5Ul3XGX3G5y0Bga2yGLMAtL4aIUuO1wyrOWeJVY2kVDBF5GJkcpcO
         Nkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811984; x=1739416784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2RS/merrWlTYe5wyoRJTj3mRCwgqcMNKUbsWtsg5TU=;
        b=stvdinK8RosLW7MZkxHPTlybW9DcpANkduanOi5nYDrrNytbGis1ZMbLtXfAHARcwW
         IFnxm0M4GP1yDZ7bsqV0G7vPFre3adxR852geDVUJMQhJERiLlC+CqPlGEe0WHhe32tp
         yDD4cNLxYPI1IF2ORWphnwoDIo2jbj2UT5dE7DjDz91mYbh7snD6KI+faqla7MyX8k8N
         vY9KKFHPLWKWf52IliG5N6C/LhD4ILZTjVvUNatqn0HJg+KXDnMZsP65vx1dtMis3um3
         SuBJKJWu7pM3pUvxAnibAQ6FVcLamTLpyBay4sQvMu2F5f/AMSxbIrXMJ7uPtKFwl/Ei
         jtLw==
X-Gm-Message-State: AOJu0Yy1uVZ1gKJbCnHoOpDCs7HQkVTw4tgjfWHohrI8cG3i9FGItdgn
	DfBrpuu9feBTpYboXd95DFU40JCkH1Tl4LNTVLzIww4l6z15FGxbX1M/58Vt
X-Gm-Gg: ASbGncs3q9ve5/gm2yl6hRzG+Qn770Gv/SkjNgMjIsg2hMT3YhXcc5lB3W9ThC2RES2
	KdCGBEtouDaYJ9SToRAEIXgvy7pahqynSGhjhYoFbvvK4QmOntERJBq7HZiRYa6xdlcHVWC3DRP
	Tf81V3t/Djo1VLhYHUq7ZEgY1j/DOMhQnQl9QRXnGeMvsv3rmtALilvfCfEO8vz+l4pUK7CH4ef
	DqjLFnjlIsov7g3OMBOz6rr/yXVWyiZn5yZmZ7VIOjTZL9mUsn40wLY+BZ1BU/k79lQxW9pnHMi
	rkHmwk4=
X-Google-Smtp-Source: AGHT+IFjHleQMmlv93HGGIpJhY6QCCDep9iIPnB9N5ZMfgwBXajOCCbF4QOpEt10UVgYGiQnO6OXMg==
X-Received: by 2002:a17:902:da8c:b0:21f:1549:a562 with SMTP id d9443c01a7336-21f17ed0ddamr88606315ad.46.1738811983965;
        Wed, 05 Feb 2025 19:19:43 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::f923])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650f435sm1632305ad.16.2025.02.05.19.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:19:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-lief: Disable build on 32bit x86
Date: Wed,  5 Feb 2025 19:19:39 -0800
Message-ID: <20250206031940.2247517-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206031940.2247517-1-raj.khem@gmail.com>
References: <20250206031940.2247517-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 03:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115285

Asserts fail, need upstream to validate the right approach to fix it [1]

[1] https://github.com/lief-project/LIEF/commit/3def579f75965aa19c021d840a759bce2afc0a31#r152197203

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lief_0.16.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb b/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb
index 47216d4e0e..ff3010de14 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.16.2.bb
@@ -26,5 +26,7 @@ DEPENDS += "\
     ninja-native \
     ccache-native \
 "
+# https://github.com/lief-project/LIEF/commit/3def579f75965aa19c021d840a759bce2afc0a31#r152197203
+COMPATIBLE_HOST:x86 = "null"
 
 BBCLASSEXTEND = "native nativesdk"

