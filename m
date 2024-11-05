Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D5AD36119
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.27899.1730831952446663538
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LKddlULy;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e38fc62b9fso49955247b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831951; x=1731436751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4fAqJnMSGX/XNJBmqnJM2u52M10TD/Hue4h40tFymg=;
        b=LKddlULy/wdM9GiNb0QX5NsyH6G5th0Ti1eLXk/v3KGqz7fzuEXwtTR3y/CGCuEk9r
         dGbaMJ5RP5NIQL5AnR3rR5kDKm+/AULH4dkn1hZA7dhozJ0iDnac9fepVgxIYgulOtTc
         iF4CqUS+6kCENWirrXXIb/SczaVGj89aNusxKRksdoeLLtUq5Ji0bDM7bSEeqNXdSDHW
         Ze2qKkTiCN2ahltfi6CZa0RklMNacVBCM6phJQWEF6UdboLnqDI1u1MKJWM+/XEkUDJq
         4PPfa4eW5O9Wp8V2+plXNBAR5hF7sGqZeuq/Qk+HSOfhxHEcivDL9wXNw9cxHaLfeJIL
         JUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831951; x=1731436751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4fAqJnMSGX/XNJBmqnJM2u52M10TD/Hue4h40tFymg=;
        b=dqlBLUxnCw5Twb1FO+t3R/hjgeJ/2tMrDi7TU8APZqBFQ+QzFt0uDNKE+VwVe2l3Nw
         QBmg82V5ACjoGBFTb9kG30Qgy0EoqccTDvhVcx+xxQF5k0UhpXjfuopaJn6nCDjAK/0B
         6oWK0LoyBqCeyT4Kx4tJe/lf/2KMJp3tiVY4WDTFOCwEMAKZvs7mgPEf45p/Shk16Ghk
         Gx4yvBMtd6O6ce5fUntXUT9ZxImqOgo2uGgFJwnpVvtSUYwmCrwYy/kwFvOqjfpoMxpa
         VFG0ilH31ldCp3qi6YTQ712dgI75xmB6cX5v2wZr43Dtrp1Po4zw7MElS/dyulfRQaLd
         164Q==
X-Gm-Message-State: AOJu0YzoML8GNgBSjY6DCoEnn7LnodqDJMl3epPoX8Tr2NmFpc9Mg3AB
	AiCcegk3kHF3vFGipELlt2YNN6Loke7TJvrFpuM+jafMBUv79jozIRttihqk
X-Google-Smtp-Source: AGHT+IFiNIL9GvtTT5ZpVgs2G9r9N0KcfHzfolQm+RzHU5iD35saQgSAW/sZ1hHeSWXQWJiG/h6g/Q==
X-Received: by 2002:a05:690c:700f:b0:6e2:11e4:2f58 with SMTP id 00721157ae682-6ea64a8d48emr185746537b3.7.1730831951171;
        Tue, 05 Nov 2024 10:39:11 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:10 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 089/161] ttf-sazanami: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:05 -0500
Message-ID: <20241105183658.34982-91-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113604

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index a4ad91fc7..76016c57b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -29,5 +29,4 @@ do_install:append() {
     install -m 0644 ${S}/README ${D}${datadir}/doc/ttf-sazanami-mincho
 }
 
-SRC_URI[md5sum] = "ceef10579a75c92483171f3bd7f77df2"
 SRC_URI[sha256sum] = "3467ce2f70a9a3fbbf8d4d97355a2f334a6351baa6722251403637a8cbebf6b7"
-- 
2.43.0


