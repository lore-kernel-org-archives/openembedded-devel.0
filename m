Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.1931.1588019471618747119
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 13:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kAUu8y7U;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id t4so7401991plq.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 13:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5dRahCmxVAKt3lUOqS0DRblpMX3Zb6y2U882ZMWy7E=;
        b=kAUu8y7UkvB3VNSCs1ChVZHywf349ZhAI1dH4P3eGacyiHpS3Ff2+0FoRJiVFc5BhK
         1UBMAtnt7BIs5X8ve5MYxsJgygD+n4qv8p+1Of8JW9rU2FAzWc0tjJN6SPMP8VJrRT4C
         4BAI8q8kebhyL9n5TknZNl3bMMCFY/8bamlP8z/0beqVk651OrZoHonPL2Nh/gsAYaeR
         aT0dw6m36HXPmGc3GeeKUT5JeAA3HI2jOa/AdyZ1+ucL/OqSZjbn6ww0daSHD/9SuCag
         gO3sb5wx7dzoWvbCo+Du2fRXvQJNv6ToV+MOW5cqlJsNe/l5CYG5K4h/nLm1FPSE5jgI
         8I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5dRahCmxVAKt3lUOqS0DRblpMX3Zb6y2U882ZMWy7E=;
        b=THY2Yayb1rWwcdrOmSmKj/6MSd16oBp0SfKYvnb1qZtqu0mAQ6c8uCaN+xHAz8Pp0F
         01Tk840IGt5IUv1N6A7G0vwmn+3a8fPUs1gjZ02nHcbqM4WLyCIqtDgODUxL1WMxBTz5
         ivJah4om8bDzcuHTBzlV/82qwTDr9ZD7EyemmjiaZsY9Y1oYNWebbR+04U2tlp/9feXv
         U8GmcGZb8W+N/HJnLqPZR+8G3cmH4O0UtCcQBaJyOjP+7dT38R2mn65VuAb40Q2ddzoY
         R/BO8GIbOTIKfKIQpSHzMDe21KUn5maihRj6rjHEf9wXjWnu+A17OtkNv6ryaStm6BJ8
         M8ZQ==
X-Gm-Message-State: AGi0PubcBrRER9l9qbAeqtVXiZ+jlB0jkAoqFMmb3g5RP4GeiIpl3T2g
	4IbtZtmf3yA+Bpktvm9s6v6evNYIGlo=
X-Google-Smtp-Source: APiQypLelR0yOcpC0WnfiBaUhYC7eaF7g3QCPpSaZsj47ovBULC2YPoI1IAjlWLs6dozLSuChsVPww==
X-Received: by 2002:a17:902:8341:: with SMTP id z1mr23773610pln.94.1588019470894;
        Mon, 27 Apr 2020 13:31:10 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:2152:6caa:5703:bc1])
        by smtp.gmail.com with ESMTPSA id 62sm13213355pfu.181.2020.04.27.13.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 13:31:10 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][dunfell][PATCH] kas-meta-python2-image-base.yml: dunfell branches
Date: Mon, 27 Apr 2020 13:30:59 -0700
Message-Id: <20200427203059.32867-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Need to use dunfell for all dependent layers.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 kas-meta-python2-image-base.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kas-meta-python2-image-base.yml b/kas-meta-python2-image-base.yml
index 6b7293e0..62f476ac 100644
--- a/kas-meta-python2-image-base.yml
+++ b/kas-meta-python2-image-base.yml
@@ -10,14 +10,14 @@ repos:
 
   poky:
     url: https://git.yoctoproject.org/git/poky
-    refspec: master
+    refspec: dunfell
     layers:
       meta:
       meta-poky:
 
   meta-openembedded:
     url: http://git.openembedded.org/meta-openembedded
-    refspec: master
+    refspec: dunfell
     layers:
       meta-oe:
 
-- 
2.25.0

