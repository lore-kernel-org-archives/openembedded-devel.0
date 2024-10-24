Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C239DD1037E
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.6090.1729801157361743937
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zr9yJbYO;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so13664747b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801156; x=1730405956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPaZoFIoGkCniotym7cix1YNB0wVu9J55W3hQucvAWA=;
        b=Zr9yJbYOYKMGT/fS7LM+An00UN0WgkHWl9pOphqvE/ejgnw9ETFwrquv6HEbZgewOT
         GL8C+hVwmZ+9PEGJbumCVLqfr3WjYrCeYQbvOQs8eljcpfwd4fr3Wzb9IEV5wftlpVQS
         YbHVzFMCjuWfwSbiooH6Jm5UqffNBLlOcTSrPFfYYwRpUvfhY6ACILlhVKMsuHYNprOW
         5FoLOIqyGL/80XE/0C83lQCHUhP7gSuXjQuaGN4Ud183kYLZIyHE5x17WbrbgO75jgdJ
         UTinqeohHvRYKnqfVrkPOhdW8fyLPBcIl08SByOUEhMaaB1hkhLMZRKKNm8zbEZ543/F
         WBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801156; x=1730405956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPaZoFIoGkCniotym7cix1YNB0wVu9J55W3hQucvAWA=;
        b=rJpnmn7BGPwzuOi+A5YD8iMju3eDjnRW/xm6a9hx+IZynbXgcaMFjh0t4ZDqz2IAxY
         UJB0Nxj/Gh+YZuxSOtUA1JpGb3eripVSsUvzKG+dXoxdp5vCQ3NIq6DsiWWkyu21GXay
         gvNOdhTGlu8DxFif25z/GbFIkzjheNfW5nAb9Cj6sQXnTMckbnAnNHDy13cGRTzgjUy7
         qINtT4UqY8/dEP73m83Hzm+uQxGxl5/mtqkqR9RW3KT6k4Bozuhnaldn3w411UZGE1ee
         U4biWygJ239/rDssaxsRynL9kHVEAKAd8eZ0NTXOpbx9OCBUyUp2/ZtqF0GZ8u/0K0IS
         C3fQ==
X-Gm-Message-State: AOJu0YyVuFMteJC1/jejRwWs4jr80wsH0y6t5w44kG5xGxihQ1A7tLSq
	xwr/2FDYqxb8/zClXoSZgYV/o1QWnHbMOk6F39TqzAo0ImznkwWi+Sj/RQ==
X-Google-Smtp-Source: AGHT+IHDstLNJpwXtEFku2MDGgUAsgRVS5TATowViMiLvlr0VM07XvCgQpVGlJNlpYUEhM4sXLhXqQ==
X-Received: by 2002:a05:690c:9683:b0:6e3:b6c:d114 with SMTP id 00721157ae682-6e86632f8b1mr41734597b3.38.1729801156000;
        Thu, 24 Oct 2024 13:19:16 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:15 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 35/42] libtest-warn-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:54 -0400
Message-ID: <20241024201806.440273-36-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113213

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
index 5148fbeb0..0f0816df9 100644
--- a/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-warn-perl_0.37.bb
@@ -7,7 +7,7 @@ the time to go take a look. \
 "
 
 SECTION = "libs"
-HOMEPAGE= "https://metacpan.org/release/Test-Warn"
+HOMEPAGE = "https://metacpan.org/release/Test-Warn"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=73;endline=78;md5=42b423d91c92ba59c215835a2ee9b57a"
-- 
2.43.0


