Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.6703.1587402433079413869
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 10:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=abWQKV9I;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: andrea.adami@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id x25so378672wmc.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 10:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pQ2QzvpY3ZRgS4p0Jx+HaISVwwBb22RSuzoYPPNNORY=;
        b=abWQKV9IIe9Cn+PIWxABILmtY+Ar4+YhJDePUR6X1hz65m37xS5zjgslApf11OK4fx
         JCWOCb7D6qiJR1BvoAHx5pk+fjqvR6g6VTrthy1JfR2viOo8yRvzggc7RKmfckO04LdU
         z3tz8AKqTByvW5cHhN7HM1Iu5ikRVTq0MwkLyabadH6GBIr0DyZrR7fW8K/Ke4dK0y8v
         Fw4+qEEvyGaaN2WZ5c1pccfTclA1h2xWMqimekaj6+64WnnbSU22PgCPgg/LUOu85Wok
         Cp8f7mQh69V3vLfYrF1AqhiaIEjitXYSM4nF28Qs2tTFvNy9huH4H+i7LnDIm4SspJlZ
         Fs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pQ2QzvpY3ZRgS4p0Jx+HaISVwwBb22RSuzoYPPNNORY=;
        b=Qld3SpgeVn24JUJJa6q8/gYoY/iMQ2t9oh5zuPU5MLhDVEEtWvNMhIG7sbZiiy6ERJ
         a33FrlnBN2F14e8F6A1kOWTOqmOwVFQPmeVmdvqMsX6AAcSOjqtWuxJLpyGHOTIIikSR
         te2/KBu6zKe8EwQkhVxKCCa+BXAPQTbT49rrRfKj00qCVHm1QvzEjgskIctbz0rbe50w
         h/o/7KjG52QEtxxe9CkHpOOECSinVT2XFeS3LL+CPliwdcPYXjfuo4HB06SiuEz6LCMy
         xFuCQWJFlaXwqyRTNk5MKS6CSqYDxdXVdbW24Iv7hLFNrkSTxMsTuLMwEIhcxTonU5pT
         n+Dg==
X-Gm-Message-State: AGi0PuYSYv16pEjKcZSOs7Sqb+mJunaGkCFuWvLFjrLwT+9Ak4LgcBRW
	7k3P7FyUUBUwmribWMvjY6q7hl5G
X-Google-Smtp-Source: APiQypJK8T57H7DGxLDkk5pjZFgOBeDZkWYTigI6/S/nUDvHmc5cPUzsoSe8AnVj4RejhmxZhfs3fQ==
X-Received: by 2002:a05:600c:2255:: with SMTP id a21mr330635wmm.150.1587402431505;
        Mon, 20 Apr 2020 10:07:11 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host220-224-dynamic.250-95-r.retail.telecomitalia.it. [95.250.224.220])
        by smtp.googlemail.com with ESMTPSA id c10sm140366wru.48.2020.04.20.10.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 10:07:10 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/4] layer.conf: set compatibility for dunfell
Date: Mon, 20 Apr 2020 19:06:56 +0200
Message-Id: <20200420170656.10895-4-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420170656.10895-1-andrea.adami@gmail.com>
References: <20200420170656.10895-1-andrea.adami@gmail.com>

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 31fcb54..d1cb281 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -18,5 +18,5 @@ BBFILE_PRIORITY_meta-handheld = "7"
 
 LAYERDEPENDS_meta-handheld = "core meta-initramfs openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-handheld = "sumo thud warrior zeus"
+LAYERSERIES_COMPAT_meta-handheld = "sumo thud warrior zeus dunfell"
 
-- 
2.17.1

