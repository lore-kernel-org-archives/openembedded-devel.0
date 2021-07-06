Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.7206.1625583201978183043
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 07:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z9E5+MQn;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id h1-20020a17090a3d01b0290172d33bb8bcso1681089pjc.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=361B85KKWjCloaa7FUugkYszBRkIWkBJNPwfDrFCCR4=;
        b=Z9E5+MQnisyq4TVflSLuJSxk05WDtieXD5frlJTTLeqlEESemGoWT8By6WrpQ4SKkv
         vkicvyJ6sxYLpb6OF5gUcfWAs6PHlF89mlAgO575203NvIgg3Qra1UMXjXsw4gSMuFAX
         Cj6eO8QVtY8J9JsK+LhCWtLFBWnn8mBJoyc/lQh0ivMiBo7X7nB6NkvCz1NCr/lLwwy1
         UXeJ9jCC4wsfdOo0r65HCg0SnkKIsyRqzGld2gWqBdzUJw9PJxjr1hW/caC0q7/clKvO
         anNY1ybaA5B9V9KlzXTaZzJsqK0Aiyz0g8N2wBHsB2R4CUQxockbnyt2itldgEl/S3Rw
         usFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=361B85KKWjCloaa7FUugkYszBRkIWkBJNPwfDrFCCR4=;
        b=ZuHdD5lWH7FxX4HjpFrK62fA05/atDGwIlm49yxA/TdyQAbe6SpY6+VSbo3+AOksTl
         2Lp+sXhPpg5fARXfo3/TEJ0N1kkUwDplczfMgRvL2M+2KzJbAqHK6eEw1qYSgNW9KiMw
         SWFDePmgshT+9VLZmt5t3YFp10PXcfqvDDdy96LohAKLprzgNhLsDjCo8/0a61GS7klt
         F7Yqee+iksQZwliQx0jzl+X0X8Ait0WhOrjBfg8lNLdBvY8Olppjxy78dMBcNd7ivYub
         iPEWffzQ5fxd2cidK6SBQOtsxxXtz826zM2aC09rYO+LaxsYdkVRjVmzVCQreBvHZodc
         /3Qw==
X-Gm-Message-State: AOAM530/p8ohVlZtk5EXza7XlIGMIIpf19QplZWbMmxcdFCoKQ9XPoHT
	DY/W2V7wHrlGB7OPub+qDQguQsokXt2KPQ==
X-Google-Smtp-Source: ABdhPJzV/T453meNvZpGlTkHYtkLZ993BXA22RjUoDW6tODMnpod1t+MKqe7Vr+6Rd7H/sICW8u1xA==
X-Received: by 2002:a17:903:1cb:b029:129:4728:d61c with SMTP id e11-20020a17090301cbb02901294728d61cmr17248026plh.65.1625583201433;
        Tue, 06 Jul 2021 07:53:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-X13-Gen-1.hsd1.ca.comcast.net ([2601:202:4180:a5c0:234d:f3c6:164b:2950])
        by smtp.gmail.com with ESMTPSA id b22sm6504809pfi.181.2021.07.06.07.53.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 07:53:21 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 03/11] python3-django: upgrade 2.2.13 -> 2.2.16
Date: Tue,  6 Jul 2021 07:53:08 -0700
Message-Id: <f1d5b6260f7ebf89a524a632ef523b7f3c01b1b3.1625583100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625583100.git.akuster808@gmail.com>
References: <cover.1625583100.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Summary of release notes from https://docs.djangoproject.com/en/2.2/releases/

2.2.14 release notes:

- Fixed messages of InvalidCacheKey exceptions and CacheKeyWarning warnings
  raised by cache key validation (#31654).

2.2.15 release notes:

- Allowed setting the SameSite cookie flag in HttpResponse.delete_cookie()
  (#31790).
- Fixed crash when sending emails to addresses with display names longer than
  75 chars on Python 3.6.11+, 3.7.8+, and 3.8.4+ (#31784).

2.2.16 release notes:

- Fixed CVE-2020-24583: Incorrect permissions on intermediate-level directories
  on Python 3.7+
- Fixed CVE-2020-24584: Permission escalation in intermediate-level directories
  of the file system cache on Python 3.7+
- Fixed a data loss possibility in the select_for_update(). When using related
  fields pointing to a proxy model in the of argument, the corresponding model
  was not locked (#31866).
- Fixed a data loss possibility, following a regression in Django 2.0, when
  copying model instances with a cached fields value (#31863).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit eb69aad33fc06f06544589ec483f9b76464f6c5f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-django_2.2.13.bb => python3-django_2.2.16.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.13.bb => python3-django_2.2.16.bb} (41%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.13.bb b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
similarity index 41%
rename from meta-python/recipes-devtools/python/python3-django_2.2.13.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.16.bb
index 55eacdff2e..0715abbd4c 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.13.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
@@ -1,8 +1,8 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[md5sum] = "30c688af9b63c4800ef9b044e0dd4145"
-SRC_URI[sha256sum] = "84f370f6acedbe1f3c41e1a02de44ac206efda3355e427139ecb785b5f596d80"
+SRC_URI[md5sum] = "93faf5bbd54a19ea49f4932a813b9758"
+SRC_URI[sha256sum] = "62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27940931b2786594"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1

