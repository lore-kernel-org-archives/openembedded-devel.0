Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CE8C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 13:28:26 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.21309.1707226100618439445
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 05:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PKjmr71g;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40fe2d3d5cbso5007505e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 05:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707226099; x=1707830899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Te0LZwd4InDGIEsfbG10sdVKuHos4mICOB3X7CyTCNw=;
        b=PKjmr71gYMZcWzOOQHBQeqWIkAFI//lVc4hoK+Wl9MP4VbxzjKBjbtpI4Q9hidb4O6
         VZ+FYXzo4sZR6kjT5D/mtuv38CesZCjbMgIjNsO/qOLLm5fCdT3XVlzyNoM335m3KH2B
         pjfH4TWUnPatyFOnbtCSg41E6/hyXnE6dJcsXCiCtrd8hkbgdgGuoZ9zRb+yMm+Z5vIR
         DV4/NbhLRB6WORWoJDnLgJBRJNWEGiDtL1sZdYbk0L8hx7qjHa/95Idx4ESxEyKlqV7P
         IbtBnJyGNewgvyD589t4Xld5ADW29xFi8IH1rYb+nwCVo0TxZgcoeR/da+ZgAupZ2nsl
         U1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226099; x=1707830899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Te0LZwd4InDGIEsfbG10sdVKuHos4mICOB3X7CyTCNw=;
        b=chNnbKDJsTNkopZRWiIRcklzmoQJ2Kk4TeNHJ6WgpNI8Qxa3AC8dMhevnbo7X/E0vl
         Jaa5iEG7jec9ZJr3x+oASliu70GGCsYunk71ZjSzeL0Agc2jOkqNudkJ7lEeRRiKz77Q
         9OI3+zCMVWMJejpBmLWLi5JnMWCbJyMHBIjSL8lXEQojsAouJKrifh35kyB7VmRS8tQF
         wNRHOwKJrIg5mF3pE3Rmnl86o1+VbzsCCVUP6UateH0/b4TNbMAMakkA3zJELJ47sbVi
         QEnz56dXPtVidVcro1THda1KEtufkdX6DVUhxE3ZTnuUF/4M69E9ZSt7KfKrcFKwwwLe
         Ybkg==
X-Gm-Message-State: AOJu0Yy8D+7fhAb46mTTuF0Gl79OhHnH8YZjks4XLHN9c8OCVXTlgx7V
	fBffcbiswL/izYsKKU2yPq13bgRWzDhjP1rOIig4HUHligVBz21glfvCikcB
X-Google-Smtp-Source: AGHT+IGQMqnYKxJi9FRWjGgEUPPujzqFIk1YIQtfcfCCxiYZ5rzEkTHYSS99QpAIAedbCQ+qVYNVoA==
X-Received: by 2002:a05:600c:a3a4:b0:40f:b166:7688 with SMTP id hn36-20020a05600ca3a400b0040fb1667688mr2062076wmb.15.1707226098787;
        Tue, 06 Feb 2024 05:28:18 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v15-20020a05600c444f00b0040fdb17e66csm2086676wmn.4.2024.02.06.05.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 05:28:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][RFC][PATCH 3/5] gitpkgv.bbclass: adjust the example in comment a bit
Date: Tue,  6 Feb 2024 14:28:10 +0100
Message-ID: <20240206132812.1362456-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206132812.1362456-1-martin.jansa@gmail.com>
References: <20240206132812.1362456-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 13:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108629

* the first example isn't very useful anymore since:
  SRCPV is deferred now from PV to PKGV since:
  https://git.openembedded.org/openembedded-core/commit/?h=nanbield&id=a8e7b0f932b9ea69b3a218fca18041676c65aba0

* but keep it in the bbclass in case someone is still using it
  for whatever reason (the version with tag still makes some sense)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/classes/gitpkgv.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index cb2cea26be..5ab507969c 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -25,17 +25,17 @@
 #
 # inherit gitpkgv
 #
-# PV = "1.0+gitr${SRCPV}"      # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
-# PKGV = "1.0+gitr${GITPKGV}"  # expands also to something like 1.0+gitr31337+4c1c21d7d
+# PV = "1.0+git"               # expands to 1.0+git
+# PKGV = "1.0+git${GITPKGV}"   # expands also to something like 1.0+git31337+4c1c21d7d
 #
 # or
 #
 # inherit gitpkgv
 #
-# PV = "1.0+gitr${SRCPV}" # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
-# PKGV = "${GITPKGVTAG}"  # expands to something like 1.0-31337+g4c1c21d
-#                           if there is tag v1.0 before this revision or
-#                           ver1.0-31337+g4c1c21d if there is tag ver1.0
+# PV = "1.0+git"               # expands to 1.0+git
+# PKGV = "${GITPKGVTAG}"       # expands to something like 1.0-31337+g4c1c21d
+#                                if there is tag v1.0 before this revision or
+#                                ver1.0-31337+g4c1c21d if there is tag ver1.0
 
 GITPKGV = "${@get_git_pkgv(d, False)}"
 GITPKGVTAG = "${@get_git_pkgv(d, True)}"
-- 
2.43.0


