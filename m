Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E8ACD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:54 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18192.1777549665042781215
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fYpU7jow;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso488952a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549664; x=1778154464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LLOFduqJgNUyf2kd0oNUGXRSn+7ENNpNfbekG4+Dus=;
        b=fYpU7jowgZWnxjXsNtO5KuKCNBqHMQcg02wPybfKyfdMlm5Qf9S3ZOoeK7MrECOtvF
         r/iqSu8MxtACRU/jVn0E9jUDwITHNA5isBfkLAfHcPRx6zMQS6zSiXGnqKkUUwAzsqfz
         wQvMfx+/byJRIdaqs9bCmKrUDgW9lemsUIoQgVBRuR9WDtz63T/jSjuiO+WBX5vP/8Bj
         JLi2+7+fCiWOC4Eqin/UxnLJgP02LkorjnDmtlVnfwMk3RwIQF023V0yXUWr/lhpLG9R
         rfDwsVT60juCREC3kq1T9XYHpOrj6UkcofzAV+Tk09RgRoQfglbXJuRoCglJ93idI0aW
         9EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549664; x=1778154464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1LLOFduqJgNUyf2kd0oNUGXRSn+7ENNpNfbekG4+Dus=;
        b=TMQpdV7gWjw7ZH5rnE5ycsa2RQ/EFlVLXgff4PfDboClr7VrET3bKNQImUxOBbMdv4
         Pb/5+iy12db8P2Kociov0I+Imp6ikN/GemKityIZl2kEh6UZyKOMeRQWf5j6yU7J5vfi
         3MKXiHVjcHb+m1qguvxzAUu/zR4nBzir6ihNHjdVfvbzoSQ1oE03rOxF98ZHwxwzCWEa
         SnPI71uSLA0UimGeXxq+Q/WSfufnlcS1yuTUv2Z4wXFbBvbyOFT8YFvEGix9d4DvBgv2
         RCwGNEd/cyRwR/qW26csLqw1zKONCZI9b1Nm2eLJGVnX94aOIqy5eBKq/SKkwir4kIIg
         BMow==
X-Gm-Message-State: AOJu0YzkMdr6qGcmXJsIqAHN5M9c8UDH45/ULKkwhZB50i1avXvjesz5
	o6RmPtB4kCtJc9E9OSSNBVcQv2lbTfG+cfpwYPiLM4L7St2LQStJzSnp3XkitB7O
X-Gm-Gg: AeBDieu6Bk4RmtwvfE/fEQ7YZxjQi9X68HFE0UP17IR204NLeyZ6GGW3JkPPOEGjo1U
	51TwEqxJEvKfGtDyNz7yuGU93MyFQeojWP0jdnG2QAg0Hce0KAV/14Nrh7/J0DiIHAsQxevx/tV
	svjMVDaWaCyFIJDLAFtmOGr2SdgmR+SZeaIguRQdcCr2HkenwnENHq1vqaCpWRnNxpVD+5ICvzd
	HkMEU3L+T9h5goGAIANc14c/6kBuTGs7h12me54UUiJYXnPv0tzHM7YE8Mw30YSSd/R3XWnZls9
	iWwBaeusIIcR1+YUwJXYlISBwvRwflJm0hsM1ny1UA63h/MxII4BB65VhTUhgmnl53nzbG4c6mf
	M/iTvyWdncg8U8YzJQxsyHMsOmwOdE5fyXMNcFlTJZbLAp3d1d5FiWa5tZ0ED+d1sQ2d6KpOgrc
	k+UTU8ead/JRZNIKkaH7RtB5AaSpZGU88OXAkxVrtcMJE4+BM=
X-Received: by 2002:a17:90b:264b:b0:35f:bbc0:e570 with SMTP id 98e67ed59e1d1-364c2de2c5bmr2643425a91.0.1777549664222;
        Thu, 30 Apr 2026 04:47:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 16/24] python3-django: upgrade 4.2.29 -> 4.2.30
Date: Thu, 30 Apr 2026 23:46:39 +1200
Message-ID: <20260430114649.4184890-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126750

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.30/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_4.2.29.bb => python3-django_4.2.30.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.29.bb => python3-django_4.2.30.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.29.bb b/meta-python/recipes-devtools/python/python3-django_4.2.30.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-django_4.2.29.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.30.bb
index ded9e6fc1f..c71c8a7db9 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.29.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.30.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "86d91bc8086569c8d08f9c55888b583a921ac1f95ed3bdc7d5659d4709542014"
+SRC_URI[sha256sum] = "4ebc7a434e3819db6cf4b399fb5b3f536310a30e8486f08b66886840be84b37c"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

