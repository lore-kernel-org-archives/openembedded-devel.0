Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF23D3F2BF
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.29976.1729278820073357819
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BWml8Qyn;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e39bf12830so17426587b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278819; x=1729883619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfVQpFGkmsJvSTN7PPmN67PUfd6ONFJZtomzfgvUkCQ=;
        b=BWml8QynM56AOzTz7RHVFhNrio8kX3s6T8Y/ASc54IElhcDjgoXiIL/dW+bz+d6kcY
         NllbXT5VB+LWyAJASfDxtaCLo2z/YD/YpHuBul8hKiKUnxVpUnSsvIU8xiOA51UrWTrZ
         QY8frekqTo6NRlzHLaJjqRZ5c8mijBpME0wgqcySv0eRlLN1U/C31ebekxrx+hD1cJ1Q
         gDF9XztjDj9xW3P8eKNb8yXOKMPAAswXqXtFqnDfCMng2q6yNCWIfDGW7ISHpcdXKG2h
         iEJsJFVjwXWDp5jGMlJRkh3SyC8pD7vNDE79FZ7gl3LHh37UW5o1WdiNYyTmXjPk1AyW
         nFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278819; x=1729883619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfVQpFGkmsJvSTN7PPmN67PUfd6ONFJZtomzfgvUkCQ=;
        b=PnPkvOAViNCluRU4vzkqUS/qayq+JUi7CdeYittqT/FBj+gHzded4U4/eDUMwGFhhF
         fvanfM4eS6FxehjS2ke8EQFDIyCLo7Syiux96hlpEHVURDhlyytA0iopmHEY6iuFSpQm
         yvpMD0wEY5ForBwqg9D0VlAP5ai1kTDYXpHy+63q3kZBQCIPKPgX48dYCt38rC3Pc3C3
         AgooDrvF/k23vVJ+xpkTZrrFTo1qbixTeyDqkYL9NIGsWzj/Yb5UkSK4dSsynTsK+EGM
         738UcjgPIN5wytlmHQ+nxBdKX+Norw7q+wEHZUWUgPbLNRvvMl3iiIGKankVi30Gq5C1
         nl6Q==
X-Gm-Message-State: AOJu0Yzgw7lsquqTVyO7RH4Cvjw9kAqk58P++XmzJvKuQEGZ4pfCmLfz
	Mg/C96gYzVlDxO8kZfE7Pg7gNeF53c29zeRQZrM4ED9mUbgaTFG496Ffcg==
X-Google-Smtp-Source: AGHT+IGvyTzEhTGwaFgsW+/uW8EEfaWrIpJqTqhV25amtlJHsVtwiJKVgOcp+F8+wFpFaY6SdnLd5A==
X-Received: by 2002:a05:690c:338b:b0:6d6:5186:32b2 with SMTP id 00721157ae682-6e5a3f0c452mr61310927b3.21.1729278818683;
        Fri, 18 Oct 2024 12:13:38 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:38 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 43/68] python3-parallax: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:30 -0400
Message-ID: <20241018191101.25184-44-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113030

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
index 1fc967d95..de33e4eb6 100644
--- a/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/krig/parallax/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=52c67ffa6102f288a0347f8c5802fd18"
 
-SRC_URI[md5sum] = "e312397b083426af84db7076dc2a28d7"
 SRC_URI[sha256sum] = "c16703202ff67aed4740c0727df304abe9f3e7851e653533b24de21b338d9081"
 
 inherit pypi setuptools3
-- 
2.43.0


