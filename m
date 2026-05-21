Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C16DCD5BAB
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 22:36:40 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5730.1779402995044542750
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 15:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oaTs9aqp;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso3260495b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 15:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779402994; x=1780007794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PpqdXUoJvtpxTkr86GW6OJdp+N9ZxbsbOmtUJKdh1yc=;
        b=oaTs9aqp9eoaG3H0nZnJLeoQzaoeKWjgLGfsZ5rcRiRkZp5+w4sqrTnTXggJ4biZVu
         oXvuyEYjWFJrREPS8BYqU2VAhnpUKFPeeMINRIeO2YarvLXYDmRXzQIfzdSxU9fO/9rm
         thjp1VKJ3RdYEU8L/oUKAhEK1wUeE7RvwcKJ1Q1IiOnlbWWtMIWFXd5f71+7Ht63i1pX
         2TBP9ctnPQyiuoJGydTEsNXS/qF5NbKhSZKVsC00WgT3P4TPsJA/9YmYRSHQ7YQVC+lZ
         mrKKADw0FmMhoItCZLj8V/QzDbHrpUuKYsK+ie1u5PbftKG/jUcRGZYqXW6dGRw20CtU
         BDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779402994; x=1780007794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpqdXUoJvtpxTkr86GW6OJdp+N9ZxbsbOmtUJKdh1yc=;
        b=EaHbWzoMx4vYhqm3GTWUGJH1Y8HYGppo4xWLrLseEfGVuyaBCNrX92zpRABpkZlmga
         7+XDq7c3xXjSbAoiHLnGuRYM4zeDe95VhrIhCJrxpHqAuyNhfIxG4NUXMSUq/2jVpJOw
         CxmN/btnthriGL2NHOjKzIQfQV8A474NzdQZczGdik8mYnDkKg0Pm9ecc38RxU+vx4kj
         r8xP2YANpD8B0aZ+Rg72pc/+uZRPlOx3wIkc4dtxaW+FJGpG9HQgkeDErvaxhNX/gBTd
         nolWI9+5lT5E9N7sZ4CXP+Xe7chPMmC4tJcskq6IT99vrhjdqNfqKN4bUzJ6ETY0dVGq
         OkGA==
X-Gm-Message-State: AOJu0YxQ99idIiir0mCyb6Khs0hwDGwdylcSDeZh3vHMd3+2+1g9A+UD
	YvmoX/yekG1clw+32iqC+CDXdEP0GQBTtmlkRADluRvnNUScGpv+p7ZdOkt/uwcV
X-Gm-Gg: Acq92OGFyrzbEs2wLP0vfOviEwJGXnmgfE7BtrXQzadanAAiteEyCJjnb9fHeaWe4iG
	AahUE8WC0tQ3HMj3t3Q6MK67J89ec8VI2lGADbVBMR4NqaHKyTSRQryR5/splFEvgwi9yHD63/m
	EeGsBK1E3WMvUY093tmKNgCxiYktry/z/RAsFIhv8kQFO6DnrAAFipOgIQKLRwmwNXEdUYAZBL/
	dmCIuV/m+j3xNHuE4vt9UAr/lESPdutIyc9Pz4YdHlRQS6ElDFy3v3JI2I4LmAALdHBcXtAbR5O
	lN3renApK4A3x3KvJHfU69rtorhajM7AMV9AshVk8trCL2vcTtj/buOqOO+ZQrKpZ/ltiBeMmAD
	27w+CUYqOzVTL3uDpS984q5yj4t8JA+Z/YKvE+yEOUzbAGIC2xLin6xXa+zEo7Kl5bNfQ/KiKyx
	tmdJmbevco0NQOzAsg7BUM8C/aszFzicSSUjk69ddYSdpikso=
X-Received: by 2002:a05:6a00:4503:b0:837:c1f8:6e55 with SMTP id d2e1a72fcca58-8416112c734mr446882b3a.14.1779402994239;
        Thu, 21 May 2026 15:36:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84162879230sm124505b3a.33.2026.05.21.15.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 15:36:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 1/5] python3-django: upgrade 5.2.13 -> 5.2.14
Date: Fri, 22 May 2026 10:36:19 +1200
Message-ID: <20260521223623.1335832-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 22:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127140

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/5.2.14/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.13.bb => python3-django_5.2.14.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.13.bb => python3-django_5.2.14.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.13.bb b/meta-python/recipes-devtools/python/python3-django_5.2.14.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.13.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.14.bb
index fcf50e939d..e9bfabc734 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.13.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.14.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "a31589db5188d074c63f0945c3888fad104627dfcc236fb2b97f71f89da33bc4"
+SRC_URI[sha256sum] = "58a63ba841662e5c686b57ba1fec52ddd68c0b93bd96ac3029d55728f00bf8a2"

