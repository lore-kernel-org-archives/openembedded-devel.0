Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CA2C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 10:38:26 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.34360.1741603102602550489
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 03:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GP77XsFB;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abec8b750ebso691729066b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741603100; x=1742207900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrkVv9XHYFQpiCVwAbdPF2CQjwiSnS6s2BUYiep+0Yc=;
        b=GP77XsFBe6CIRKf36kMhj+/PI/nUriL5dehbm68fzZkG2WmacmYDBQQmKOUbsiRp3A
         Kh/qMRa4tI90KKcEnfbntqclTIEvcKqYLkKNS1s2lmUAryNOfN/FE+tZvq8Le7G0BTJA
         V8iNi5zZZRO9B1osRYAEDgNZ9bpDLk2ERozBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603100; x=1742207900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrkVv9XHYFQpiCVwAbdPF2CQjwiSnS6s2BUYiep+0Yc=;
        b=KRpTYeMwY0zo2WjFMTe4riDCnfJWqyJqkCFZHf4MizNtUGsJeHnyqK4koEvqy2F6EV
         SzRA+5T612xi9OY2PoQUuDYx989dSp9ag8nXqoju4AS2Q7JQX4lvb3sqa6yk4T706fH8
         1x5TpqHANPzOJZIRXmnc1jSs/bMuHOKAP7CxBIrrpTm2MM2CSnc+Q01gJYXvtndT3SYC
         DCBOXkRIWiaWLkKDWZh89I2+aXtPy0/PtjSI4qf/YxHpoo0BQ7uTtJDReFSjSIPFTEnT
         folGOUTnDNxcPyxkjJDYXFaU+nqsTriSFsWkGSKPZcZH1w8RpHh7eJBscrfy/JvFEYOg
         oDVw==
X-Gm-Message-State: AOJu0YxpviUXqFkfJNXo+aQ3AWK8efonYnfWqjmW60UQhXsErTy9p3rq
	0pU/NQnFfklIlabjf20THwFHudLJatbGGQSSvwIckgkvfU0qPzR8iY8OFhJDr7vbcEnX/FaXr0R
	E
X-Gm-Gg: ASbGncvP9qbRgC13lpqDLrruh3zNuJs/C6OinRpO3TKIwTvcyi1Gsps2nUElOJiZRpe
	S9eDMliZi2c2JxEfU9YnRFYntyqAcL8gL21mRe4tMYAq4Hqdq7xUIz7fNRGQ1MQXJ63Ikc8FYKP
	wjNMfummeR/ygeU+VIt2PRUWLw9eXrS6bluATHDbWx/8CLcnnM3VS2vi928VhV5dz6l3r/JrpxJ
	fS8VhALWSt+QGXiI5vp5pV1xwRy6x2V2JWhJyiSC4nrp5oIrlXeYzA0fZWh+F/rpbAqZprQUmqC
	034hRRLW28LG1OPPfns7+MZB5r0dZEzW2FHjKmZbdG00FyoLdeg3AC0IVzA=
X-Google-Smtp-Source: AGHT+IHELR4LcDuY7i7qNuvpiqk/lticr14y8O9xjHRp8RF3hbVqwxmPeXZB4y90L1LfFpTKzlOK1g==
X-Received: by 2002:a17:907:97c6:b0:abf:750b:93b8 with SMTP id a640c23a62f3a-ac252a9d093mr1242249466b.22.1741603100460;
        Mon, 10 Mar 2025 03:38:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac28cf931d0sm277087566b.95.2025.03.10.03.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:38:20 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-astroid: Upgrade 3.3.8 -> 3.3.9
Date: Mon, 10 Mar 2025 12:38:17 +0200
Message-Id: <20250310103817.3281571-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310103817.3281571-1-leon.anavi@konsulko.com>
References: <20250310103817.3281571-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 10:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115828

Upgrade to release 3.3.9:

- Fix crash when sys.modules contains lazy loader objects during
  checking.
- Upload release assets to PyPI via Trusted Publishing.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_3.3.8.bb => python3-astroid_3.3.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.3.8.bb => python3-astroid_3.3.9.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.3.8.bb b/meta-python/recipes-devtools/python/python3-astroid_3.3.9.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.3.8.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.3.9.bb
index 528cc158dc..9617e25e3b 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.3.9.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "a88c7994f914a4ea8572fac479459f4955eeccc877be3f2d959a33273b0cf40b"
+SRC_URI[sha256sum] = "622cc8e3048684aa42c820d9d218978021c3c3d174fb03a9f0d615921744f550"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


