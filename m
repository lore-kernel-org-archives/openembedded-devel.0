Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E90D3E79E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.30309.1730838706095846973
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wr5juD3u;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e38fc62b9fso51054547b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838705; x=1731443505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhD4noyTcPY0epVdalmw6wDEAig/wAdqzeE8KxRxwn4=;
        b=Wr5juD3uFzSMrJbiIWldpw8mg0tsu3PukhMSDdZN9BOpmAm3nnKcaQBEaYCtTIlUHy
         51YySApNHNWklICIwhqtu3YUh9XRDyhYv+amCaNEQz2RWc4Q27ZoNBMue+rmtHvdc+MT
         NzDsihLXP7QW7v5H25lP5iUhaC9zuhqRLBEUiirhKq9Ubd1XzbfY/dKsDV9xgnm/xa//
         8zO7iQLBYSkPxUpQ3xe60wK45Mj7hYnEtt8B+a8acwy2LSQz8ZwJdc4J1W+bBpR8F9vJ
         2mws0/F/OBulqLBBbgUFNKT4kdiU7JgCSjYL0Au+frAlgiPQRcyAqruqnsiD1glpnejN
         n03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838705; x=1731443505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhD4noyTcPY0epVdalmw6wDEAig/wAdqzeE8KxRxwn4=;
        b=S2nnNqjAuvphUWprijkrYTrvZkU2tMDapTthY/PmZuMyKQWu7Se1hObQZNU5iL+t0K
         EFFw0y4OeGNk1/6xXZeHy94ar/DiTWUlp5DoSGc+Mp4HMYqUYFrN5GYaRVWkzEfoDc5f
         ET96Fxn6Sj/OLZiZsnzrqpSQatuJ9B6NZVWihpYhmAnKH7w5s6W8F8CHvC9KW2IHB1nY
         yxB/Ka5OM73BQEwQ49uRCm0jSHHLmrXS5vKGdTcqUWamX1C5ozIkyT9A2UC9mS861T82
         w9GD/7ah26k0Ds98Mpp2WnXq3EizOpr7cqxxmbAbFrJ5GRQ8MM45m4dMHjQQaiQdi1lW
         EgJg==
X-Gm-Message-State: AOJu0YyuSlO7+1ibVpcNJUhQBPIkkVqCz47Vas4oJzsuV+mB/YDO3kwM
	iukP4vY6JLn9PoRVRcQS38SveoD8kb+XtNJcLPyC3Dem09GPk/51YJ9x4anm
X-Google-Smtp-Source: AGHT+IGOfbrmN6KzVADa7pk6fuPHd9v1vn39uvEjVpn/Lwkg7Ncp0L7X6uoGCoSyLFDKTlo6S9ibvQ==
X-Received: by 2002:a05:690c:600a:b0:6e2:af9b:a862 with SMTP id 00721157ae682-6ea64acc9ddmr170807177b3.13.1730838703577;
        Tue, 05 Nov 2024 12:31:43 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:31:43 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 110/161] xpext: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:35 -0500
Message-ID: <20241105202827.3104-110-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113627

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
index f900aca2d..f6d6bebc5 100644
--- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
+++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
@@ -16,5 +16,4 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # Remove runtime dependency on empty package ${PN}
 RDEPENDS:${PN}-dev = ""
 
-SRC_URI[md5sum] = "1b0cb67b6f2bd7c4abef17648b062896"
 SRC_URI[sha256sum] = "a3b06f5188fd9effd0799ae31352b3cd65cb913b964e2c1a923ffa9d3c08abbe"
-- 
2.43.0


