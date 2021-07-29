Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.17218.1627601814869949717
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dKA7SroP;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id k1so8803250plt.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2aMAfBgl6d4ilUTV6CqQoG131bWIuS45jj08xwWEDjE=;
        b=dKA7SroPDtsTKHRRpb0gKiERPmxXqrwY1oEl8tnPMB8TjIicUfemq77aDMebfoNJKn
         yWBHlYPCbWWqm0dzpCQ+iMNeua7fZpuFtlyT4lC/wpzPF3BdwlC4Ifj52/BIo9QXcn22
         BImvSoCu8J0RO5HBmg41NbIZFNPwYpRlxf50TbZvENqCuTmLfewkOsMSZ2T2hjPNBjS0
         qCFmwhkMry1AtaIz9gUnrpZaYck7YlZRP70nvKfaJaa7ZMqEkfks83YmEBnvns02iJEX
         eXWEmpOxOHLfDqZ4/zaZrZjeJZ+41YoBysG1TDg5ISyrXIC9BKAtqm6nBEdODuqScYTt
         /tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2aMAfBgl6d4ilUTV6CqQoG131bWIuS45jj08xwWEDjE=;
        b=KYqZl/NipaZvhnhXnHiwaN1+m/9x7zIrxyx4KhNoSfSDfw1y/me1TaOarDInJSZEPr
         yOfmgeUhhxy8o0c5qFsXfYOt/F2IkPo2t6IpoiFj3YiZbQG0U9Qii+nsQp7mwVzxRo89
         nFU9v6N35vO9+3NE8whGzi5Z4aBU69XG3yeWrdgL+j3d0Wd/8CFhqc7SyQDpgoeo+Tzg
         f7BF4I05kdtnNgMa8ajjt3xwcDRH63roGOq3yyqr1XxEDl3a4QYxainIB2VwrZa6Tutl
         JqYQ3nYfIYORZMQSQKN2ds5jVinQI+0rnKRiYV8rmurKBtpik8ek4YpVFfGDtEdrmkjI
         1BZA==
X-Gm-Message-State: AOAM531L6J1FGectucW2mOhd6w9UWXjplDIEnqjJNkQergaChja6U7jk
	/y84uavA/QwNfwL/fbYu9jstTbjIgaiFIA==
X-Google-Smtp-Source: ABdhPJxqufF/XyPtlmKfx7BLKPQC8jMDgLnkj1aViX33xpxl12Pn6B1pKsDkCP8PbJ9nbUkF4k0hog==
X-Received: by 2002:a63:fe41:: with SMTP id x1mr5832912pgj.272.1627601814326;
        Thu, 29 Jul 2021 16:36:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.36.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:36:54 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 01/15] python3-django: upgrade 3.2.4 -> 3.2.5 (fix CVE-2021-35042)
Date: Thu, 29 Jul 2021 16:36:34 -0700
Message-Id: <98e00710b7c1cf20092b8ff8fa7c01f153ff95ab.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

3.2.5 fixes CVE-2021-35042: Potential SQL injection via unsanitized
QuerySet.order_by() input.

Additional release notes:

- Fixed a regression in Django 3.2 that caused a crash of
  QuerySet.values_list(…, named=True) after prefetch_related() (#32812).
- Fixed a bug in Django 3.2 that caused a migration crash on MySQL 8.0.13+
  when altering BinaryField, JSONField, or TextField to non-nullable
  (#32503).
- Fixed a regression in Django 3.2 that caused a migration crash on MySQL
  8.0.13+ when adding nullable BinaryField, JSONField, or TextField with a
  default value (#32832).
- Fixed a bug in Django 3.2 where a system check would crash on a model
  with an invalid app_label (#32863).

There is no corresponding uprev for the 2.x LTS branch since it is
already at the latest version (2.2.24).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>

(cherry picked from commit fe50bd100548500842667210df9757d84ec11b16)

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-django_3.2.4.bb => python3-django_3.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.4.bb => python3-django_3.2.5.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.4.bb b/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.4.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.5.bb
index 52504885e5..5890c85419 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "66c9d8db8cc6fe938a28b7887c1596e42d522e27618562517cc8929eb7e7f296"
+SRC_URI[sha256sum] = "3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841dda35019c01855cd"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1

