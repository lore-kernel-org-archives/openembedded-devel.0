Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.7454.1598942842441516973
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 23:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r+SkUL12;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id z15so60508plo.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 23:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rpfqQSfdNgkoD18d0SSNFgzVEq0Vn1qgbm+q3LdiCiA=;
        b=r+SkUL124VY3mPnNSk7orhGwQ/fGckd1NhGZkzeellJcaPW5+skU0QIQbUaUwBQ/fL
         IRnwjN+aNr3z6pRVlnAryCvdz//TVWL5lM1fMQtskkg4S1x//Yx1V3asVs+qUXtBggV6
         LEJyIYuc2PyXEvsdZUEjD1AKZZ16AJFBuNXHgxgEG7th766ovuUmPqkkLJIiv0vpAuw+
         mU6fShyqrYUHEMQSSRgMUnS/U9IfyuIMsHYa9Kuv/Y7Ws24ffJDa26JnV3IvPPHvBiye
         XpbkpFBenYuKKqxRLT9E2RPbpt0xKig6JXCoFFFcdzf8V6xLdBPaa0h3EYSrDxkUO/lH
         FRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rpfqQSfdNgkoD18d0SSNFgzVEq0Vn1qgbm+q3LdiCiA=;
        b=kbcWiNlpaUAfuvrSIlqMBEzL4iJuhY4/Y1FTzSBsYTJr908trVg6++Z3tkEM1LTicm
         OR/vArhKahXyTkKKWE5aoG6hLNO6WFaMUwZi6tBsBW62v7PfGlMrw8Pnlsz/pHOA9qzH
         ulZIAG8EjcCgxsvPDcjOo634BMLVPi5UvcNd6usxj3/5JiPMyifVQceBA4v0GDn83zeG
         JwfxeEzQJH1ilskfdCABn29M3RQrpQSBH79FTRoIroCtXxnL7golNfO3B/W7mkqYttmC
         fgqkF6n+PKHx7XyX03I0cvvF7NJGU444//IUdHjzO9kqlqXMNEeF7kknOw2r4uJeSi6D
         rOFA==
X-Gm-Message-State: AOAM531GvDvWBq7FqT99qSGQxJrZbMKpISoWTKGNDpuWoi5itwYhrdgg
	2mitMPwwjGbJIMUotqxBSW4FZe12kIGrfw==
X-Google-Smtp-Source: ABdhPJynu7r9J0hA3Z4zZsGvS93MPJ4RjhNPNg9kwTVs96Kg209ahNkMFH6Ej7RWv0p8GnyuWzHh0w==
X-Received: by 2002:a17:90b:889:: with SMTP id bj9mr188622pjb.73.1598942841733;
        Mon, 31 Aug 2020 23:47:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id a13sm778384pgn.17.2020.08.31.23.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 23:47:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 4/5] monkey: Correct the install path in init services
Date: Mon, 31 Aug 2020 23:47:13 -0700
Message-Id: <20200901064714.2206751-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901064714.2206751-1-raj.khem@gmail.com>
References: <20200901064714.2206751-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its not in bindir but in sbindir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/files/monkey.init    | 2 +-
 meta-webserver/recipes-httpd/monkey/files/monkey.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.init b/meta-webserver/recipes-httpd/monkey/files/monkey.init
index 40b21182e1..55446f0e82 100644
--- a/meta-webserver/recipes-httpd/monkey/files/monkey.init
+++ b/meta-webserver/recipes-httpd/monkey/files/monkey.init
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
-DAEMON=/usr/bin/monkey
+DAEMON=/usr/sbin/monkey
 NAME=monkey
 DESC="Monkey HTTP Server"
 OPTS="--daemon"
diff --git a/meta-webserver/recipes-httpd/monkey/files/monkey.service b/meta-webserver/recipes-httpd/monkey/files/monkey.service
index f9aa57f91e..4f3b7be4e9 100644
--- a/meta-webserver/recipes-httpd/monkey/files/monkey.service
+++ b/meta-webserver/recipes-httpd/monkey/files/monkey.service
@@ -4,7 +4,7 @@ After=network.target remote-fs.target
 
 [Service]
 Type=forking
-ExecStart=/usr/bin/monkey --daemon
+ExecStart=/usr/sbin/monkey --daemon
 PIDFile=/var/run/monkey.pid.2001
 TimeoutSec=10
 
-- 
2.28.0

