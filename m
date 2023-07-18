Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BE8EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 15:01:00 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.9914.1689692459113776037
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 08:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=3Jrzy2ot;
 spf=pass (domain: baylibre.com, ip: 209.85.217.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-440db8e60c8so1884422137.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 08:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689692457; x=1690297257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YgTd3eq8lg6RZUQhXbRBKqoGOVo0Hk9eFK8WWL3IFic=;
        b=3Jrzy2otjjGBJCkM71IfHUaGBuDDZc+k1WsFbesviU/Du+ikA7h3wthVfeMao1t36e
         ni3b/6wWHsc7jsgdct61x0R89fGSlE4K5d7OWBtgXoF/umNYaphLcqVHkOt1FaqVySRI
         8tUXf4KuYTfrDbIIv1hyNveqkc9IL8lSMIZNcTZknErpfpBN+OEJH/n/X4VqqnVGVHIp
         PznJ173nxCBNLLRGdXTF2OTjKMBgWhIWJcxmf14tSjT7gxYqoaH/jWBbCtcRN0rIa1f/
         EXwLwKPX0PMQaMRnS7s9a30JK+7Q7YPqDgaz9wS2BNZuV+iJGja5vKNklzjm3Jvfeax5
         WP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689692457; x=1690297257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgTd3eq8lg6RZUQhXbRBKqoGOVo0Hk9eFK8WWL3IFic=;
        b=hO1TE74J5TY2n8ZWpxHFHZ1PTNGoRag5tnfJOSNRvktbFkmWwIrmSJ4ljhughoKgMO
         VLRloTumM+KMbna5BQf/5GE6OIB6a+M0hp5+DlvSo0FByeSm19kLgPGAhmokpp3FfhkI
         dBBryHtIfbn38f97c0Am/keFcZLVIJR0ktH4GHMzMyjmgPZYPb0v3mB2XpVP03JoUcyx
         WM5SajyI+NWdp3/gFb+s0AVUA5ZALWen5u6DPgUUF2GRlvm7s6pq0maY7L5xxlHnL4kM
         80ARbs0iMbgMOuWGTBYs6hmPnwQdW4K01+RlUHQtVswJ+YoPQcoDrDTo4k2hkN65ux/C
         L+qw==
X-Gm-Message-State: ABy/qLYJPxe8pZ+zWPzNx9G0mfjqBije4s5preizOBdYEjD3GMkPqLUd
	9/musGYrpAJFj3oeldKsk9BEa+sa2gBPWUmU5i4=
X-Google-Smtp-Source: APBJJlF53HquLo0GbG+Jo8uK5ZyD4MRVn0m/PS7DB5b+cHQzeaYpbw6Vq0XcoG8VGhtP1TyjvpuL/A==
X-Received: by 2002:a67:fe54:0:b0:445:20ba:fb2a with SMTP id m20-20020a67fe54000000b0044520bafb2amr8339975vsr.16.1689692457607;
        Tue, 18 Jul 2023 08:00:57 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id u14-20020a0c8dce000000b00631eaf8b9e5sm765565qvb.138.2023.07.18.08.00.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 08:00:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-django: upgrade 4.2.2 -> 4.2.3
Date: Tue, 18 Jul 2023 11:00:54 -0400
Message-ID: <20230718150055.2501513-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 15:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103945

Changelog: https://docs.djangoproject.com/en/4.2/releases/4.2.3/

Django 4.2.3 fixes a security issue with severity “moderate” and several
bugs in 4.2.2.

CVE-2023-36053: Potential regular expression denial of service
vulnerability in EmailValidator/URLValidator

EmailValidator and URLValidator were subject to potential regular
expression denial of service attack via a very large number of domain
name labels of emails and URLs.

Bugfixes

- Fixed a regression in Django 4.2 that caused incorrect alignment of
timezone warnings for DateField and TimeField in the admin (#34645).
- Fixed a regression in Django 4.2 that caused incorrect highlighting of
rows in the admin changelist view when ModelAdmin.list_editable
contained a BooleanField (#34638).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-django_4.2.2.bb => python3-django_4.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.2.bb => python3-django_4.2.3.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.2.bb b/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.3.bb
index da65eb9c32..4e3192744e 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "2a6b6fbff5b59dd07bef10bcb019bee2ea97a30b2a656d51346596724324badf"
+SRC_URI[sha256sum] = "45a747e1c5b3d6df1b141b1481e193b033fd1fdbda3ff52677dc81afdaacbaed"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.41.0


