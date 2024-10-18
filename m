Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78DFD3F289
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:49:03 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.29987.1729278831728863489
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T4AYcZn2;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e2915f00c12so2387384276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278831; x=1729883631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofyFp2dQKLL8xKhKM2iaW/C1oGIfB4wwnLgtYSE28lQ=;
        b=T4AYcZn2KR09W5d7baa7GGNC3jHtT4pjeaV1w5wIfUxivUdYdJrv2/jnic/6+tMgD+
         TIWhlsCZc48xhOGB32NjG2S7P5q2Gz9QIb3ISa2e6XF9aNwOg0hxOgf9qkGq1X7QgLw1
         K5eo7DNOlHkbf47o1xVtGuq8n/7UFxsIp7XDE83mzBHMDPG6G8+AGu/8E7P6xiIrnFQ5
         yKJ08J0Fe3AiQoi/kCz0TAfOvR5UjaLfHnB+E+JNXmjMMTYjS5Y54RlDAPSw1AbKfAce
         5gI1y1Mpdohl5nge2DcXB2hT6ncprR0wimdnSrtkbfCgDQkl/kyJPXnSE9DgEtw0nH6Q
         L+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278831; x=1729883631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofyFp2dQKLL8xKhKM2iaW/C1oGIfB4wwnLgtYSE28lQ=;
        b=SzThscjbkNQXbHjvaKjptzvXp/uajnzRs/GjFG4mVH+mdo8LkXWmBLW++usZSYNkPo
         oLbSS69Msvx+tOosN/e7J0LtswBr4WsgeefEhkOxLtTt21XD3vwvUDQtFQswmP/9j4on
         tI9XxwLSbZOXwzMj75VF0OqlnrlFGyRHh/6l3qKLizahV+7ptNYeSGeZ42djB7iIvUl3
         Pqj1xZ5pLAEwA6XlEL2f7KRk8SabwgTHnhy9FQU/QFo8cFgkrKd28O0fzvbvrG/1Dr1W
         vKogSSPCn4/lBXnwwVXcehperGnMfe9F4q7XI/Nuu5tCL6vY+SK80ub+82gd8924MirP
         MG1A==
X-Gm-Message-State: AOJu0YyAH7jV5Z1MqRzG2w872iMBJrinCxSaFH0QnBKy3c4+AAvdy7QW
	BenzvG6q9QqKx74bCJyz/up22A3YNK5mI2H0VHnZGoUo6iFXskupAiKcTg==
X-Google-Smtp-Source: AGHT+IFyDdstf7KCwOSO7zaJk4gvIn1MA8ToRkXKzNAzRJIC4NwKH90rXQCxZv5O9QkSM8wBWojnww==
X-Received: by 2002:a05:690c:fc7:b0:6e3:1e5d:fe2 with SMTP id 00721157ae682-6e5bfd4c772mr35258137b3.31.1729278830553;
        Fri, 18 Oct 2024 12:13:50 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:50 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 61/68] python3-telnetlib3: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:48 -0400
Message-ID: <20241018191101.25184-62-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113048

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb
index c1e7c8e1f..e359e2d88 100644
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/jquast/telnetlib3"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fc2166986ad8169d334a342e0d8db8e0"
 
-SRC_URI[md5sum] = "2dfac7e10ed63c408da50ea712415f87"
 SRC_URI[sha256sum] = "dbcbc16456a0e03a62431be7cfefff00515ab2f4ce2afbaf0d3a0e51a98c948d"
 
 PYPI_PACKAGE = "telnetlib3"
-- 
2.43.0


