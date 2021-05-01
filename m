Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.14449.1619911783820330044
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 May 2021 16:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EGPLpPW8;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id q10so1148911pgj.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 May 2021 16:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OZc4j3DnBMzg9MMu16IRAbSomi3xbmQTRx4gS10B1qc=;
        b=EGPLpPW8ESIG+S+8lO0Jj6qZ1Z94lDUBAk4gVj8OkUcOzNSX9s7h21rfAuHqLK6NxL
         HpUPQ9MlKwnkNTq3Bxe0PiXgjmzkxcp4yfSUlBWENfzzKI3ho7DYJfUcFCu/99tsoJ/T
         RXc5GYMeb0LS1EjJ8JoNnqMqMm9Sjy3fRstZfaBLbXvL63JFUiCXx2fzKsJ7dbEJ7g73
         8X8Y+NnEx9/VsfhXlpvkGCTpsyst/D0TYLvg/zSF/Pk3UTjU4SCGRlqrLzVSIL6lSpUn
         qZiKRVzT8Kru/VvYARTYTgJWO57N+ILASVnHuZAkdVYoE2ohv5VKnsGILjoX63FYH0KY
         J+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OZc4j3DnBMzg9MMu16IRAbSomi3xbmQTRx4gS10B1qc=;
        b=PzcBuf/FEEl46tnQg7AA9XcX8/VcFWc5qnbqtwgMotQPsKn/6+caKm4qUbl+15Ky3J
         O0NNMAVsrfi9y0c7BQVPuUrBACkOh5/9y9nxLYDRKdohrQrAIUzZ/hdL3b2rBOYYiKYp
         XOB9GR1ersQTl4HKJDTvWjOGktcLwBQ2f7rjM00fyMApgSFo46OH18TE+l/HZKx9o0C0
         PXjMkmXQPKH2IL8uAM9QTynCySNosY5uNExN2sN7s4VqZjsczxLJJLKJKqq7InOWOf1u
         LLRT/7k/XCQbGbe8vuWgJaFJ2yrqAnkQGvUH+huKbeQ9S24dDosrGr9CsdI41Tr+8xLn
         lV6g==
X-Gm-Message-State: AOAM531zR546aXUNmkSybwvME49Bwtd8jD3ba4GJrtWmsdih+VWkk1ah
	azwSI4iYG1O56Aa4nOm54NYzJVMHj+jA9w==
X-Google-Smtp-Source: ABdhPJxTZLlwavQuAc5sEa59fSL9ooPzpJwJJEGo8LRr08hLqaC0DYS1JNLsdPOkZINwsp7Xno6SGg==
X-Received: by 2002:a63:1a48:: with SMTP id a8mr11262534pgm.81.1619911783212;
        Sat, 01 May 2021 16:29:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8589:f92a:54a1:6475])
        by smtp.gmail.com with ESMTPSA id br10sm13856946pjb.13.2021.05.01.16.29.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 16:29:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][hardknott][PATCH 2/2] packagegroup-meta-webserver: remove nostromo from pkg grp
Date: Sat,  1 May 2021 16:29:32 -0700
Message-Id: <20210501232932.11509-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501232932.11509-1-akuster808@gmail.com>
References: <20210501232932.11509-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagesgroups/packagegroup-meta-webserver.bb   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index 2fa5bc4a93..ec3334d8f0 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -26,7 +26,6 @@ RDEPENDS_packagegroup-meta-webserver-http = "\
     monkey \
     nginx \
     nginx \
-    nostromo \
     sthttpd \
 "
 
-- 
2.17.1

