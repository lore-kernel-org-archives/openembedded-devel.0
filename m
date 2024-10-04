Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EC5CFA76B
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 10:59:53 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.14001.1728009612557009886
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 19:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CohBfohk;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6db836c6bd7so15896557b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 19:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728009611; x=1728614411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrBTsWKIvkmyL52dPPv+KeeLO14RCnx7j02PmLGq08g=;
        b=CohBfohkmXtZKzz7bjuma6CYKEM1Bw9ou185rTIax7FRDCB256jOiL6Apue3+UKeOy
         aCaPXzlbfhWf8yzGiFqR2+C5HTzpHchS6ZOcMlUu678YwlpSm/WthZ+bXDFq5tjJMqq5
         +v3bud5jYPP+0CefsB6PuALk79wMcDpjpsLX4B8CPIdNSg7Bl+mIHz8QVPdrbXw4vBnF
         9P/y1r/WZVD+ZCgifTwAnv3sf/K+blFYHcwBUGSQbmuB+cIQoYzDSfXW6U/XIPf0VhJH
         TdsJf25t2D+OWK7A3NlOLyAjgiOoJUGjgZCky7lbNcF1tFZ9McVoJmyWVcqiBMe1+NhR
         hmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728009611; x=1728614411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrBTsWKIvkmyL52dPPv+KeeLO14RCnx7j02PmLGq08g=;
        b=ARvg6PoS2T+31bGFPw7eqdrqjZKiz8OH2bYKkoEzmfI7eNoIjG3ryDrq1zQtaQZgE3
         886qi1OYpyLA6QlXl/C4Y0MBlsWUChnAjRWLyoiaPfVU5XOgaOaYVM5ONmsSklkYbiaz
         fb5sb+rDbzNW17nryGdjyDr8LimlmC+gJSlPpjMXvgbsmrl9sW6OuVhQSBM9gXpFZ2/F
         jMUp4fkS7eUowSZhtcURw/1tdcH1XFJkVIht6+R6okEqpCZNImRlowh+9fKfiYnucyE2
         kdHWz2tyNQnLlqDe9FOJSdcNUhQNbc6Skv48AkkQ6yhrw2xtihdpsVGvKvemiyrkwkfb
         z6ig==
X-Gm-Message-State: AOJu0YzsyDE4EE5uTCtueH+IdMqm2VU6U/Dt+Dyjyx9xJhZqoWhMDPAS
	HQ0w/dqE3VItGXoCtH9bnZUD081lJiXSPYBkXmbUJg1i7IWkW+XL2XT3Eg==
X-Google-Smtp-Source: AGHT+IGZWKOifWkD0Tye0QP1jypfqe8odKPGR/HFR7x5CkV0H1SOM0d13NM23YsEexfh80zoCsPgGg==
X-Received: by 2002:a05:690c:7288:b0:6dd:dd16:d860 with SMTP id 00721157ae682-6e2c7284d02mr16808727b3.35.1728009611010;
        Thu, 03 Oct 2024 19:40:11 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bc2d1bf3sm4908547b3.74.2024.10.03.19.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 19:40:10 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/5] openzone: Drop unnecessary SRC_URI[md5sum]
Date: Thu,  3 Oct 2024 22:33:04 -0400
Message-ID: <20241004023842.14172-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004023842.14172-2-schonm@gmail.com>
References: <20241004023842.14172-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 10:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112659

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
index dc62a1c72..e47f8c536 100644
--- a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
+++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a2f562fb8fb1e138b810d69521c4bcd7"
 inherit allarch gtk-icon-cache
 
 SRC_URI = "http://xfce-look.org/CONTENT/content-files/111343-OpenZone-${PV}.tar.xz"
-SRC_URI[md5sum] = "4dae968cbd525072664ef7a4fc7c4154"
 SRC_URI[sha256sum] = "dc20f97a49e1ff1becf7853ef5f137ed30a4c27490540e755021d78d339efd92"
 
 S = "${WORKDIR}/OpenZone"
-- 
2.43.0


