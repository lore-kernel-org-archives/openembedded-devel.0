Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3C1C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 10:38:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.34438.1711535900836242398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 03:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=m251gmha;
 spf=pass (domain: linaro.org, ip: 209.85.221.44, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-341730bfc46so4702481f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 03:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711535899; x=1712140699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2J/tmYDzCljHwZtAoBHQdh0vIf7Qnq9kmPtkw+UcyLg=;
        b=m251gmhabFT5463DmKoHqouKkUUpWCUf6OJyCj157uKApnhMhFit3hFn7wNOip53cr
         +8KS0q9oFHg1gFIJOkucaBGxfiSDoB3ufkZlN6sv5moHidp7b32HQ97KQm7izRnZVCHq
         JY40WVa4bmyrZSxrnVGb4HFRGFrYL/pFb9xDjqTglUCx71CBRzXl0YMQqp6+jUCXltVh
         rqqqrZpYH2SHI6X8V+PELYVipE6UTi4ekilPUuJTSmpDYiQj2rT0/3ewVjtzlxx/w1Dw
         2Wnw4OCbNc/cFFtaK3xI7cc+6Kytw6zw8Ztpm34vFlT7ErKf/7E6tU6zBcUoXAJGW5St
         oCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711535899; x=1712140699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2J/tmYDzCljHwZtAoBHQdh0vIf7Qnq9kmPtkw+UcyLg=;
        b=OFb7OJC76OaO5+Sfh3naJ+otXzFim5vx+WLyFkamXQkjy2FkEl+B8IXMLabh5mbfBD
         j06vzpI9RO+ImhL8dq6Cc51IF+22R6RglPAWbSAE0oXSKvPzM/Cj6PR4KaAlxSrLmTAD
         C689tKVw/pJQAqleu/y0t6QOK6OsEKbgaYNByxjET6LlbpFt3NR1RLfI79d1QPwuglfB
         VSo/STnsfR5T6ZQBuRL8t7d9RD9Q+c0ls1aoiIfyZ8tzk3yc37E7KR7yMZJxPJqfW+MO
         7eUmeAqeahPEcHqTFJaCrZhWQ+jMF8DBeZJerm5Au2/S54301COgwEuF4QgdgrnyGlbk
         cGHg==
X-Gm-Message-State: AOJu0YzA4ziasOlywldTH26q6DuuZPPdr0RwFJteYHFNx+6LQzfhGQTQ
	kUWI+lZKaH5c37TXASmUCy9IlfeAoZ07MvyfoFe96XmsruyQ85r6+cLf+iVy2AaItZ8BGkQhJYT
	adZ0=
X-Google-Smtp-Source: AGHT+IFkybek6RHc8vZS0AG7xl4NN4Ll7ouFriTKa2o4gitK6ok/IqKUFY6XpabeQqliDbaxfXOZpA==
X-Received: by 2002:a5d:6ad0:0:b0:33e:bfb8:732c with SMTP id u16-20020a5d6ad0000000b0033ebfb8732cmr3674824wrw.64.1711535898704;
        Wed, 27 Mar 2024 03:38:18 -0700 (PDT)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id n7-20020a056000170700b00341cfa5f16fsm6975967wrc.30.2024.03.27.03.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 03:38:18 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [oe][meta-python][PATCH] python3-django: upgrade 4.2.10 -> 4.2.11
Date: Wed, 27 Mar 2024 11:38:11 +0100
Message-ID: <20240327103811.4078264-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 10:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109641

CVE-2024-27351: Potential regular expression denial-of-service in
django.utils.text.Truncator.words()

Fixed a regression in Django 4.2.10 where intcomma template filter could
return a leading comma for string representation of floats.
https://code.djangoproject.com/ticket/35172

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../{python3-django_4.2.10.bb => python3-django_4.2.11.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.10.bb => python3-django_4.2.11.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.10.bb b/meta-python/recipes-devtools/python/python3-django_4.2.11.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_4.2.10.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.11.bb
index c78c8aab5e..0642b7e7c3 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.10.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.11.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "b1260ed381b10a11753c73444408e19869f3241fc45c985cd55a30177c789d13"
+SRC_URI[sha256sum] = "6e6ff3db2d8dd0c986b4eec8554c8e4f919b5c1ff62a5b4390c17aff2ed6e5c4"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
@@ -10,5 +10,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.0.2" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.11" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.43.0


