Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.2639.1624825354245906992
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bj/oWR5r;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id a7so2772553pga.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cU9pkenEgQoAzvEXQY+00f+ZOzMyZDkw9ugD851VnOo=;
        b=Bj/oWR5rjLpe9GMgFjP4rChrw6VJrEYtnVl82fxO8SIQJ70pG4oDnym2O7Mf9hrPYz
         /zaF3pcaqTznfsTpNSAsa7x1HI6DK0EQ1s2xGoCmIv5WVPPGblrC9d4VWUBA9ucSOQRz
         Y7FMixSB543Ky+amvW/TBsC7LPq4aGD5GM9AFtkPzKVNGHEuPdM6WXUwOXJ9urTNBVGo
         UhH7qaHnkfDZNRD9TZncd4AVe42qSOdOf7uoFTgs/2SWE74g16qiA9qigB9oKadYQr6z
         s3Qu6j23FAACJnkDqYQl9UdLjewvimHUl33f2RezxSg6hiEdyam5Z7m5nYPA0HHwdjBH
         DOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cU9pkenEgQoAzvEXQY+00f+ZOzMyZDkw9ugD851VnOo=;
        b=kZvT4EHtBhShEw9N22r5CMcZBUX00vZCu1TVjC7uCJzMdXSQhwv56VbkoNLIB8zVA8
         yx0rxH928gd3NS1wCa4569VTg7Dq9rRPLMimHt3biqG2glHPIPCK4TaAEseF4t5N7pUr
         7QlFEbrgsEMqN/nVqXGeRzVm50xH/2U7Ew+vTJTlXMZuGvWd1cnJSfu/RXGLQpydjiyd
         8s7p7VN3ty70uMSnqn++NiK3ad2hHVGi6TqZ2nuus9sR4H0G+PqVaFipFKV3FgvGgRnt
         dhiIZRtneIy7T4RKbGGE1it3LU6GqRxa9KTi4WR4/sEfMREHv6Fk1d0o/rKrKINplpfP
         71Jw==
X-Gm-Message-State: AOAM533FMeiog04fVJIzIsuZc0Fp0V1zpTKgRY5NXIWbYgTjAiUH8Il2
	7u9ilE8fQtycYcQan/vRL3U7cax57H1dGQ==
X-Google-Smtp-Source: ABdhPJweJqYPtWikuwG+TiF9u6ecWfTnKxic5yfm1w3bCFuzvOEwnIxpOcwQefK4C4h3TruhSPUM4A==
X-Received: by 2002:a63:410:: with SMTP id 16mr3941211pge.257.1624825353689;
        Sun, 27 Jun 2021 13:22:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 17/20] python3-django: upgrade 2.2.22 -> 2.2.23
Date: Sun, 27 Jun 2021 13:22:12 -0700
Message-Id: <b2716ef06a76854497de80c642bf7f63b07f7a6c.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

2.2.23 is a bugfix release:

- Fixed a regression in Django 2.2.21 where saving FileField would raise a
  SuspiciousFileOperation even when a custom upload_to returns a valid
  file path (#32718).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit f07a8c1376fe9f5eb4fc0ddff8ca1a1b3c3f173b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-django_2.2.22.bb => python3-django_2.2.23.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.22.bb => python3-django_2.2.23.bb} (41%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.22.bb b/meta-python/recipes-devtools/python/python3-django_2.2.23.bb
similarity index 41%
rename from meta-python/recipes-devtools/python/python3-django_2.2.22.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.23.bb
index a0b8840259..ab4b68fc87 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.22.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.23.bb
@@ -1,8 +1,8 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[md5sum] = "dca447b605dcabd924ac7ba17680cf73"
-SRC_URI[sha256sum] = "db2214db1c99017cbd971e58824e6f424375154fe358afc30e976f5b99fc6060"
+SRC_URI[md5sum] = "d72405637143e201b745714e300bb546"
+SRC_URI[sha256sum] = "12cfc045a4ccb2348719aaaa77b17e66a26bff9fc238b4c765a3e825ef92e414"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.17.1

