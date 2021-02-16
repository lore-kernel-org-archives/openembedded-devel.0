Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2325.1613440711071933178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gpBYAzL9;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id r2so4661368plr.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MAlFVmm4oDMqRHWFKQJmRkwtBVEKvWRvDHGnWgRIbNo=;
        b=gpBYAzL9ENKk6yo+zJvMvRSbDnGJX3/wAyQwvbPqkuDLk3W8A2DrqUIwAo/12l1OG+
         J5uN8EKvtT8JpK4/kNFhaxFUr8NCM63cbajHm8lNyXEoH5XDA+/jOdJi6NZ6kBx1oEFq
         NQxRqMa3n1a/NtH8Uqpg3ud8wH5ci93qEjvk3dx5Ih7fvUZH4JOIx5w4YI7UVIpgpmA7
         gSglps58ERVzmUMqmjI2JiUIiupo8gNgPn/vbeZK0PNO0HCW6LAmbVVIy8mPyj0yFztN
         2J6FTNaoHV10n678KT7JTRs7IWitwSiG8PMhT5OXT/dj1QnJAQAFei8d2WV5/IZCFQoM
         cIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MAlFVmm4oDMqRHWFKQJmRkwtBVEKvWRvDHGnWgRIbNo=;
        b=KDAeMnc4Ga2ymDCv++MyA05P9xL0IGmysnQ6WKTPiIpV54omq3cpm0PWntMGW3w7Bg
         6luNfS/XoxDDiCes6EfdOPff5WRngUKQu8ElbnbIfNgX6lJCII/3M5L+PlRAowT8kWG/
         bRZTnd1jRhAtSF9ytLQgB4k0Dpdqnh9JtV2nE5jQRJEOZBXMu3dWbc8ygOcym8nkx1V3
         gCzIG95Si+VWnv/IvfWmqdsjQ1j70R8ZHo9xu49UHKROBgA3nThVAIAw3OjBWBMMBcgi
         9koaPukdY+MDIg94oSL4EwM+lgzkJ1o9W3CWwEY0DxuoGua8eDFlwxPb9aKjLYRD5sg0
         U6UA==
X-Gm-Message-State: AOAM530c4p+fadioDkzU5LLEmjKFpE7khhXpcnN+3I4uMiwNiqZkyb2N
	vKrRpIchaczvE8EVVVSollFIGSGtwBOwwQ==
X-Google-Smtp-Source: ABdhPJyPS1LJt2cyFPdsUhYKoJtUH3hFU73U+Pef1dg9ovbO5cUIbAYWwZkrp29q6+byOfnF9Y3Njw==
X-Received: by 2002:a17:90b:3507:: with SMTP id ls7mr1728126pjb.208.1613440710517;
        Mon, 15 Feb 2021 17:58:30 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:29 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/11] meta-oe/README: add Ubuntu prerequisite information
Date: Mon, 15 Feb 2021 17:58:16 -0800
Message-Id: <ee04df8c6965d8cb30db9c8f430e11e4519bf529.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: akuster <akuster808@gmail.com>

When building on Ubuntu 20.04, luajit needs 32bit support
so install 'gcc-multilib'

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 973fe410d238e0c361f8bc4d9ba7915464217e22)
[Minor fixup for Dunfell]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/README b/meta-oe/README
index f5a4bda065..972c830356 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -14,6 +14,9 @@ e.g. on archlinux based distributions install prerequisites like below
 
 pacman -S lib32-gcc-libs lib32-glibc
 
+Ubuntu
+sudo apt-get install gcc-multilib
+
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe][dunfell]' in the subject'
 
 When sending single patches, please use something like:
-- 
2.17.1

