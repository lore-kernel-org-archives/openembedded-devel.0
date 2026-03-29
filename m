Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464FBFC9802
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:06 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37631.1774820339249399632
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=htan3dS4;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9b1df1a6b3so402162466b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820337; x=1775425137; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6C/RMAGik1QL0xdihODP8gg//GFuw8opK1A2ehbilt8=;
        b=htan3dS4DWcwAjrYdEROqR1rzwIJUxHhFdiNNkaaSrKxbW3lQoDvX6+mF50DqIPJVA
         bZsmagbBk8KsGMr9BugOEpr/zIkZhHAZqedTfax7rFYuWwYzDtUsl6TleYO77GTDhQFX
         KdT7zTje9FLpbCvbxEqiGoR2Db0tZIK/XqDZ88XlNR3FIjqOgekFkBh7xZQ1k5HahTyB
         6NGPqIT8oZF3sie1P7pdXeNPS96t2ZGGtX0Tpeszs1CAyqabkEViyWTZTtFP8f0J/SDp
         pLB3SuEt93AxPQBskXeHG0v6mAD9J6l7WYx4u5RoMdkplZfrT88CmqemBXj9BmXuJFVB
         G1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820337; x=1775425137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6C/RMAGik1QL0xdihODP8gg//GFuw8opK1A2ehbilt8=;
        b=T9Vx2FshuOLeIsOE4hJc0IGEAhb8q92aFyGKW2+uP4Lh2+NLmeJuiBa7QgC0uQTXvj
         LyOO5GszeOIsbsIQ62uysyENjl1RoD6DdGyAus3+GbQSTYCFO+dSdJmiE1FrrwmwVmjB
         Pl4nVGkvVR8eKcWu6qfbLgJv1uhZlk2fnY7iwgbII9TbRdmBgaFBTM5sHdPf0vTfpAg0
         +gdQunkoxs57jpbBU0cBQZhi23B1vBZEa7DIaOq98eWVKluMIr2+PA0FhbR/lSF2P/bE
         Zq2aI8wSUDs0/DY2iM0mVGLw2ic3ldG4Jvu7BMG+ZkruKh+uH/f1y5N8jpXKBHFM4Bis
         KRtA==
X-Gm-Message-State: AOJu0YwNQrwYw1LaiZekHxYYQWe9JTZsp4J7Mp00jHSJDsrvFHjxyuaH
	eHPWRZFrq7Xxnzy5aZAjds3qLc2zyUz8kVO9yw5nQtJttHzu5yWaAAhH95S+8A==
X-Gm-Gg: ATEYQzwmLON2dIfkRrJ/76GdYBK8nL7PssI7JtskWLSSg3pqw0InCk8CVsSlqipti2R
	/7atgwR1k2JjpUT79D6setDZjD9JTek8VP2JG9DBkQvwcNmIDF89/8BVre1FjKwet+LOpMSEUwE
	JgwjWd8rUtNXpQ9Qfy1qBzsbpi5YO3klJ6aAKgWjVW853rXphX8TA6Yx2MsNSMVZmqAZhkNJBJU
	YopTgWKATQFZOt3FQ3EPKu08blarGvnqJj0bwvRt9H410kYFF6hwvBs/NUQ9YVqk4SpXJ9ak/2g
	MPCA7CXux4zR8uat2Cxv/Tqyl5g2IrB0XQfEKz7zUKS7R49IG+6ghDai6EHkDwPHdw8T6CfP1CZ
	c0TgNS6acBReg/U8pNlDy/0LUpy7YC4Xdv36n+U6gVXaj1G3wUD0ybHLKTdqyHx+4mCZmU1wcJt
	79LiClBwUp2Zz7GChX3bO2J9kCJSY86gpmnaFV7cSDBqy887b5B5/20hOYijZshndZ2Qh+q2A=
X-Received: by 2002:a17:907:1c09:b0:b98:350:8dc1 with SMTP id a640c23a62f3a-b9b50937e25mr699259966b.42.1774820337469;
        Sun, 29 Mar 2026 14:38:57 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:57 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:09 +0200
Subject: [PATCH 08/13] postgresql: Fix append overriding value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-8-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125817

`EXTRA_OECONF:sh4 += "--disable-spinlocks"` was supposed to simply
disable unsupported spinlocks, but was also overriding other
configuration defined in EXTRA_OECONF above.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 6858015478..07cd121511 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -78,7 +78,7 @@ EXTRA_OECONF += "--disable-rpath \
     --datadir=${datadir}/${BPN} \
     --sysconfdir=${sysconfdir}/${BPN} \
 "
-EXTRA_OECONF:sh4 += "--disable-spinlocks"
+EXTRA_OECONF:append:sh4 = " --disable-spinlocks"
 
 DEBUG_OPTIMIZATION:remove:mips = " -Og"
 DEBUG_OPTIMIZATION:append:mips = " -O"

-- 
2.53.0


