Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web09.3542.1617934868314044957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OyAusySJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id x207so4320220oif.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7ssEt1P9ju127bd9v5/69IVe4ESYI3tGC6Y//oVTd9Y=;
        b=OyAusySJbLu6NtGdBNbtl7MKEj2nTdonn27e924suzEd46HGIujzEkHMU0mdQxsMrb
         tMh4PQ2nO1WJNRGzKYZrtLxFpZMBW09S4Zthv6xa+m7Tr6QpF/rGeYvXv0i+JIBNpLyt
         O+vkRcVVd7vJHRN/sp03CHR+DSejDlN/fXkKfKxeU//eCp2g75PQrW7CJ5VUyOUUwlzN
         F/BEopAL4McsIfKlP8C9dPmszFjNc1PUaVBlqRVIGq2XNaVDjDb78B+ZsilDAvkNPYdW
         dmo1mhcw2l8n3yoJe2ml3k9hjpoiUDJatUIwM1cWv0/p853c73406wOE5Npp0uaiOXjT
         yjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7ssEt1P9ju127bd9v5/69IVe4ESYI3tGC6Y//oVTd9Y=;
        b=bTduCWIo1QxnywDauKvq5sHXyOhTQcB3fivJchHUQ38Fh8gcxZodKXZlqiVy9juiti
         uXj7lMOgjrTUfMXEw0gsgd/meRRUuN7RuZ1f/3bt0hKkY+sskDgnsc8MzoJimgOFtZfZ
         y+1iyUUJ+ylLvLl3enpuuhUvKTHnqj630ei/ZfJ/cbrPUGCIr2QaLS1EMqyENftEyhnm
         1xPZZCBR4cwCQe1Jv3TabHrEqFAPxgO7V5ZGrLfu2z13AnSyXqytorGDGm+74xv0USFT
         TLHZIgRIjCq/hReSOV37pjZc0EwYL52pWL5uYVTfAReyyx6Z3HHi41+VJzwIpwaJPN7+
         lLlQ==
X-Gm-Message-State: AOAM533R0w29HT98AMRKpSzlIQZRxTA/FT7Hgi4+tm6ujr0OuSwaEkd+
	J3eAZtoZFBKd9COB9h75ujgGiZ8AmsE=
X-Google-Smtp-Source: ABdhPJwfHmjOxd0/EfwUBNl8Xc/36i1PBYq2EvLB+vb0lS/5nW5pXzDRzio/ANaCWelczeu6wbeZIQ==
X-Received: by 2002:aca:3d86:: with SMTP id k128mr8362908oia.86.1617934867586;
        Thu, 08 Apr 2021 19:21:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:07 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 17/36] python3-django: Upgrade 3.1.7 -> 3.2
Date: Thu,  8 Apr 2021 19:20:30 -0700
Message-Id: <f67895f879693e343e2f5f8caf1c753fc2a3ac06.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.2:

- Automatic AppConfig discovery
- Customizing type of auto-created primary keys
- Functional indexes
- pymemcache support
- New decorators for the admin site
- Other minor new features

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit f45f3862a64be2a8502a3a348bb3b7f72869c988)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-django_3.1.7.bb => python3-django_3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.1.7.bb => python3-django_3.2.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.1.7.bb b/meta-python/recipes-devtools/python/python3-django_3.2.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-django_3.1.7.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.bb
index d22bd14e8c2..e147e2f9d1b 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "32ce792ee9b6a0cbbec340123e229ac9f765dff8c2a4ae9247a14b2ba3a365a7"
+SRC_URI[sha256sum] = "21f0f9643722675976004eb683c55d33c05486f94506672df3d6a141546f389d"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS_${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
-# PREFERRED_VERSION_python3-django = "3.1.7" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "3.2" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.17.1

