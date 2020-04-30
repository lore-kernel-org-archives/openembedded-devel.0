Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.1889.1588224713268812968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 22:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EN3m9uB2;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id fu13so255121pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Apr 2020 22:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FB0+6qHN5PW1Z3E5I/ptDOmJJVHNxtUDFmN71yMFYic=;
        b=EN3m9uB2uUqT3fiKWkKy0sBv/+DvR8j/v0bhmg1x4TWAIDST769VXGGbXMc/LKhRLr
         bg20zoitunZ7/2YhtuDzCy/1sDSiPyNeZnheNJZHOuao5BVuwgW+lkrMMCNaprECDB8p
         SMZVRTxE932lQRj8V3CnOO1dTnp0MNVbcb8c3zXxKWgAYxtug8vMdD+sLdcxZYitPOXo
         C6BLMkuoIQK27NXrE4VZgJQjIc7HdYb1dpJMTPCIYuczZIX6ZXo02oR7BzKUIZXyvBln
         n7tc+35oYkeg6IgBN08RRUqvSGkr8nJtyNt1A9Z571zv9VNRFUfe0Yai8zereqWLwaDw
         9pZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FB0+6qHN5PW1Z3E5I/ptDOmJJVHNxtUDFmN71yMFYic=;
        b=p6+A7u/XwFDAoPGuc/ELSeNu9KSkcCr8VliI1bn7wXvwZu5Fsh2oPxiJ8zNLC2O9ku
         Ih5e4B5jH0zGHgP01P/JuVfq4pwgt92DkRY65TyyeMzcSsBpeJOQZXn+QnfdY7Rpk3ce
         t1qzJ0XBmeGI6mIZv0sHmAwX269xEXqaHCxxt4B+boTo5az2WUueosuv5wVVgKTO/att
         Hu8WZGIZVHdYLV+2eC59y0o9Dx18nyeNK4ipnO3RCelMv+bA9bjwRN3tfP1o/pDrK/3Y
         +sAJpMcxVVluJwF1XK7ckOZItOy/o4vFdjgTCQFrCW/+Ls/jDxHSbSG6uIvaadfFFOu0
         Na/g==
X-Gm-Message-State: AGi0Pub4Y5hfNRg+/03z+SGkgl1yFOAPLScUFXByRYzyNPho4cdusPeq
	9tzXKvVNdpLtbqLWJTT3bYaRK/G8+kk=
X-Google-Smtp-Source: APiQypL4I6AJku5S1xYjK0cKmWR/CbWg69/+FrYgz0Z97K944eIYpYlYLKrnI16A3LEDVfx5FXviNg==
X-Received: by 2002:a17:902:7c16:: with SMTP id x22mr571205pll.244.1588224712222;
        Wed, 29 Apr 2020 22:31:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e11c])
        by smtp.gmail.com with ESMTPSA id v26sm2418780pfe.121.2020.04.29.22.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 22:31:51 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/6] luajit: Disable on rv32
Date: Wed, 29 Apr 2020 22:31:44 -0700
Message-Id: <20200430053149.226494-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not ported to rv32 yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index c4f8216480..cc90394163 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -97,3 +97,4 @@ COMPATIBLE_HOST_powerpc = "null"
 COMPATIBLE_HOST_powerpc64 = "null"
 COMPATIBLE_HOST_powerpc64le = "null"
 COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
-- 
2.26.2

