Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web12.3631.1617934869414883030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z8umIVSl;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id t23-20020a0568301e37b02901b65ab30024so4320999otr.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=T/QSkNSLa9NRnpaQfmsXwkUvKSx7chJbuw02UuKKMXo=;
        b=Z8umIVSlIL6KeH0EdPq02DKBuaHeh3MbJpX7c7Q9qNLy9Used5Z6oOe67TIveGF664
         cRJ17wweLB04AyMGiySfRKNsLuA753MsL7omWwD2O9Hu/vulHiALxrT0N9VfAmYU9ToY
         1Sioki6ccpbtKa2dbcEJ94QsdTmsPX2CXefx0BdLc3ObvUQ8Ybg8JnCnZKo3XWyZxN1S
         1e45PggnlCjDFjZC363OU8ssojgzBbOURTZ/NfobJgvSmDan4hL1AVxMZ9aCtVtpoHQ9
         fiSYxFjWUNLoModTEWqZbZb8aWv/9KT7fBjHsBMRiH02l6Kx8hVMTg8WCQvEP2V6EtKv
         exBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=T/QSkNSLa9NRnpaQfmsXwkUvKSx7chJbuw02UuKKMXo=;
        b=V6rSj7Eu1RWRzt0JDC/Ql0fNCzW+aTmjYmENlpmaghqJ02hKgCa3b5mWGvcSRtKsOi
         CQqLxv962XKZ6rLvRDcoWEcRZ2RruPSR8kC12FG+J7ULz/OjxALo0SGGNh27sORjp/JR
         TUw+kLgowkCr0B4PXta0BdUP2jZkZ3IPkeXVmxBMUeRwLlYulGD3UFcYs5V+PqbXQRzq
         F+V3IXfkRjX33RhOKeEcxDGZ15F69KDtOLLgSZlsjnMOqr4bY/1wZAjJBjSQP+DKGhF6
         5ujnRdxpVeZ2PJZb0CQ72soBLyNK1GDNN41PRCR4XfX3gOvgBMndyhIpgF5P8h0AqZKF
         6iXA==
X-Gm-Message-State: AOAM533+gl12UVe4rJlHB0J3AiBTfyE4v3EaZJ+bbH2GG2DGJdvmUGJO
	XsPC6APCQ+vwtC0cwtI5Bx/2+mYW0KA=
X-Google-Smtp-Source: ABdhPJxfx7gEcUqQGTDmCjlDopQvzgClR+L8sYxUb+WCmlyIWzAOAiFVKw6naum+KY5ZmJL3nt/lDQ==
X-Received: by 2002:a9d:7a42:: with SMTP id z2mr10535997otm.366.1617934868677;
        Thu, 08 Apr 2021 19:21:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:08 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 18/36] python3-tqdm: Upgrade 4.59.0 -> 4.60.0
Date: Thu,  8 Apr 2021 19:20:31 -0700
Message-Id: <69fd78ac7d7bb8369654da1beec5d94a06cb6edc.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 4.60.0:

- add contrib.logging helpers for redirecting to tqdm.write()
- support delay in notebook
- fix contrib.tmap, tzip not using tqdm_class
- add notebook tests
- updates & misc minor fixes for documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 910579ddae89f1b85e18bae405eac5322eea3b9b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-tqdm_4.59.0.bb => python3-tqdm_4.60.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.59.0.bb => python3-tqdm_4.60.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.60.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.60.0.bb
index 32e5cf053a4..e20ba779af6 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.60.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "d666ae29164da3e517fcf125e41d4fe96e5bb375cd87ff9763f6b38b5592fe33"
+SRC_URI[sha256sum] = "ebdebdb95e3477ceea267decfc0784859aa3df3e27e22d23b83e9b272bf157ae"
 
 inherit pypi setuptools3
 
-- 
2.17.1

