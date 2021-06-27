Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.2670.1624825356800509734
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fbL98Eee;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id h4so13475346pgp.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XkKw9u+fCVXA2NfR8hCncwbYTPDJYTFA14l2fvrKCwA=;
        b=fbL98EeelXFQ9rl60soCDpBtu/PQAs/5Qa3nh5EiEDw1iur6cQYSavSZcqhPCqto/f
         si3fXw2tnH/LhVzL9AmVdBh0447nz6OCft74SiqPdpkE7Rxg/KTe/KqOnfsYaT51dO4y
         ZCRglbokmj4wvaXQMiSPh7giv5kuxxQXWujyXmmDxUMCkYqVUgixi77R9/gBKpAeolYp
         oHKV5kJhCjMwe2R5xCY5paAjZws3bf+21/5uIMOwmIQwSJtq3j1bbAUcCvkZ0lmRf73D
         T5V8GnPERdqab4mhFLMixyqLZbvw8b46Vy7ZT88TJyyjsNHZDQEWhCSoYKMpaUF9aF8N
         Yi+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XkKw9u+fCVXA2NfR8hCncwbYTPDJYTFA14l2fvrKCwA=;
        b=THPKK82V9dHuJthyky8XSxyxABODMI1kFbs9R35xtTUreqrj5KG5xsAIzoZniolnrU
         4KpNqESwH89/cUambCnsnJWUd5S68gBRZRWYCsFB7iqTQIj8kLYiHNOlb+xA/KR2Y4BA
         xGBfpxiF1S2oPWhKGpfr36C4SOsb+s/dCLTmZgjhbErGPfMSqvdV4aG2pwPcFtX1ddc6
         u+mOdceuWfeVtttUAfb5v3zdi2bP6mhjpTh4nh+y43bqelfQnqvRnDN6YuYxSCqCklVG
         qDK8E1vMlc+qM3qkBiBpIlJlziNWgfwTHAifZIaBOerYT9+ATtoUx23uKghY4IAxnOWW
         6t6Q==
X-Gm-Message-State: AOAM533RmDTaBGZVSHh36bcxJVEZxe3SqAPmQTgW4WzfwkhaO7bjbz31
	w1CRue16Rc0SIBYeGytVcuCH1U8JD8noEQ==
X-Google-Smtp-Source: ABdhPJzdrXsIaAblE5XlJMMlYGjYU6Y3lG3YVQI/NY4EkmuPU7gJdkRYbLCESVEMLiGH/1r+yd+xJw==
X-Received: by 2002:a62:7f58:0:b029:300:9551:8cc0 with SMTP id a85-20020a627f580000b029030095518cc0mr21514715pfd.21.1624825356235;
        Sun, 27 Jun 2021 13:22:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:35 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 20/20] python3-django: upgrade 2.2.23 -> 2.2.24
Date: Sun, 27 Jun 2021 13:22:15 -0700
Message-Id: <c51e79dd854460c6f6949a187970d05362152e84.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Version 2.2.24 contains a fix for CVE-2021-33571 and is the latest LTS
release.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fa2d3338fb87a38a66d11735b876ce2320045b0d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-django_2.2.23.bb => python3-django_2.2.24.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.23.bb => python3-django_2.2.24.bb} (41%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.23.bb b/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
similarity index 41%
rename from meta-python/recipes-devtools/python/python3-django_2.2.23.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.24.bb
index ab4b68fc87..964ca6ba03 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.23.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
@@ -1,8 +1,8 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[md5sum] = "d72405637143e201b745714e300bb546"
-SRC_URI[sha256sum] = "12cfc045a4ccb2348719aaaa77b17e66a26bff9fc238b4c765a3e825ef92e414"
+SRC_URI[md5sum] = "ebf3bbb7716a7b11029e860475b9a122"
+SRC_URI[sha256sum] = "3339ff0e03dee13045aef6ae7b523edff75b6d726adf7a7a48f53d5a501f7db7"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.17.1

