Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.6296.1622029973791557347
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gtmxe20x;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id g24so640926pji.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CU7vIPWd+ebzVZqDP65QAvgNhJEtPOJuoB96CV8jiDA=;
        b=gtmxe20xFph/uXLRsz4PqASzceoycbeVVmUtpIBtYGeVMigy1drLeSGMZojZrJCx3v
         Vw6l67A4vStdIF5WNonrmTIPY8jLpZofWY4uWjhMO8jj4edbmLdnXbobaG5T2HDbdEWQ
         LTCZP45JiHh5P7U810oHPo8q2OQCgrr+xvf5CJL7vukq9z5YId1r5shaw0DvQYKpMa2o
         izAZZR3+nEhlmkQzZ7WGwDCzZSSDoHFz7yC+Ek7OV/ZmJTSinb1f2MieW4u8zuSFvJBC
         maJ9kd3xQInajmrX8wqhc9ZKAByQveYEQSxftsmmJshEY+6rHBrqEidkE8HMkMbMR1DD
         Cuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CU7vIPWd+ebzVZqDP65QAvgNhJEtPOJuoB96CV8jiDA=;
        b=hJzvHnGZQ0TO0cQywV1JbFSLz10X883uNHbRZqL4zefK0hkpQdKBXpRR5e7gGqzo4j
         0/DWJsgwLUYz3M1SjW2ljRaRuTgJ8cSC8Os+EIMJZIl5nPxdyfOBPFMbSSbcfIYq1BTI
         zFjptdfnTX9AYQqH24iWslVU7YlBiGpaUm6iN9TffyuwHHvpBAkn+uCypRWN+41gM5F6
         PUtkgJzIYb7+/MuZmoNuQjuV1E7s3/r1f6UtLPoNfRrmjdlMVO4SZEt870y2wqEIzOhZ
         zuWtLWQuYWAP89NJ29S3bOzAyoEpVhEgv/UP9EupW6pobfW9+NsgxYKu7DgAghwURS0Q
         ssLg==
X-Gm-Message-State: AOAM531Ulqjo72oNKMVMlvH/H+Mpdhe7j2wRHw04JoOgebglY3yPLxO7
	oTg+NFY6Aj8lUrNFlOOwQsY7cDnoqCxHiA==
X-Google-Smtp-Source: ABdhPJxpsqjWdV2rHzTa5WZEnGozO8S/wGqN8tNmZpz3JNtVVTTYRoaRjF0OKaCc1vXgAjKBjPoDuQ==
X-Received: by 2002:a17:90b:4ac5:: with SMTP id mh5mr35822029pjb.226.1622029973283;
        Wed, 26 May 2021 04:52:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:53 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 04/23] python3-django: upgrade 3.2 -> 3.2.2
Date: Wed, 26 May 2021 04:52:19 -0700
Message-Id: <b31867029782051610a944dfc3429b480a7677b0.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Version 3.2.2 includes a fix for CVE-2021-32052.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit d97e1b7cfdcabc7d03e408c9888564551972e808)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-django_3.2.bb => python3-django_3.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.bb => python3-django_3.2.2.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.bb b/meta-python/recipes-devtools/python/python3-django_3.2.2.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-django_3.2.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.2.bb
index e147e2f9d1..7deac2ca9b 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.2.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "21f0f9643722675976004eb683c55d33c05486f94506672df3d6a141546f389d"
+SRC_URI[sha256sum] = "0a1d195ad65c52bf275b8277b3d49680bd1137a5f55039a806f25f6b9752ce3d"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS_${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
-# PREFERRED_VERSION_python3-django = "3.2" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "3.2.2" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.17.1

