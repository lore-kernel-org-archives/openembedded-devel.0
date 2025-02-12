Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E398C021A1
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 13:28:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.15620.1739366880510765488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 05:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RDHkAlc+;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso47504945e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 05:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739366879; x=1739971679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP6Yvf92r3tWZcPJgLR0J5sdxBPEbb990dNrcBrSAOU=;
        b=RDHkAlc+bv3xUMP9C2di12m7HGmtgvnIoLeAYjW3Lu3WWts8eS7W5z5G2MpJ9ryFMn
         Ns93kn7+FTQPvIxUl2iYfd4LS+2K2PSHv+N3jXibVhia7nypQs79z6cnmYbZX7HOLyhp
         /dq5Q/Vt9LqTvFGlEGXBwiHXvSL5yftPKOSn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739366879; x=1739971679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aP6Yvf92r3tWZcPJgLR0J5sdxBPEbb990dNrcBrSAOU=;
        b=nSmCvBxjcPgC08coLCKSya5V2UOvwVP/+YFOdEUc5EJ6WzafLVWFNhm2EJlnuDN1MO
         C9q2IYLHYY/zdF2tcw0q96MieyzJM/5EulQo0NXDAlawWUcuc8chdKrsvmOSloyM71Q0
         DotWB5/Zj+uJF+xWvvdHWF3Jm3FHdy+l5skWBPMIwvdJ2hAQOyAvCAUPw9g+4eG5b5t6
         ueTeF3AjvHJkpohCamyrOzzYlHFDenSVXA3qnh80+sB8z5ZyUPPEuPkCZQU+cFHzaBwQ
         bgjxjnPZ+J5pCGm4eH9zB39G0IiGGfhVzzdJeKpQw/97hSaXEaU7fS6t3I66hRvWP8vk
         lmqA==
X-Gm-Message-State: AOJu0YxZmw0ThL/Nm0o8EzxVukiDwWRw9TMDz16MseaLEF692t1aBz+m
	HMi7pYpdDDQnrQZGmKy0wWa/+M/qzJ4eReVwA1KOcaH2rcWjun2Ld/viOmiPJRMm/PCisLOQTN5
	x
X-Gm-Gg: ASbGnctl/Vmkw5wfclONIQgMoYeawRcIkOSJa/njHeZp2M9TuS7hqPLlzxtIflcXz2g
	oKOzH8y8p67UrI8m7D8QU44aWIVzOwiHX9P327e0uaOXt2jrV5hEn7NVXx/1WI6g5YZ8Goi4o8T
	zEcbvuLiia+PViq+fszI90qsHpwhF2tUi+FcAH5rdEPmR+pMw/HxjOohzQReoimD3G8TMF4wm3D
	X10cZewLaf89zkxvo8EcPr0ib1bmj11ZVOAtnyIyS+ZUUmzOtX88n7KYAj6O4MY9LjZkLjFCuN5
	dg00aCH+v6JTN6MvsOVNBRzwJRjwBw==
X-Google-Smtp-Source: AGHT+IEf+Ekws2x9NnwDeig8ZKowQGTovqhh6IU0dj17lyQbtbQ43PP9EXd43sRPn6HuFwO3IIxr3g==
X-Received: by 2002:a5d:47a7:0:b0:38d:d946:db15 with SMTP id ffacd0b85a97d-38dea256d3amr2636715f8f.5.1739366878608;
        Wed, 12 Feb 2025 05:27:58 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc9ce31e8sm14781835f8f.5.2025.02.12.05.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 05:27:58 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-whitenoise: Upgrade 6.8.2 -> 6.9.0
Date: Wed, 12 Feb 2025 15:27:52 +0200
Message-Id: <20250212132753.957846-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250212132753.957846-1-leon.anavi@konsulko.com>
References: <20250212132753.957846-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 13:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115446

Upgrade to release 6.9.0:

- Support Django 5.2.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-whitenoise_6.8.2.bb => python3-whitenoise_6.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-whitenoise_6.8.2.bb => python3-whitenoise_6.9.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-whitenoise_6.8.2.bb b/meta-python/recipes-devtools/python/python3-whitenoise_6.9.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-whitenoise_6.8.2.bb
rename to meta-python/recipes-devtools/python/python3-whitenoise_6.9.0.bb
index baf0a4cc16..5a6b495040 100644
--- a/meta-python/recipes-devtools/python/python3-whitenoise_6.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.9.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aba4901cc64e401cea5a267eac2a2e1e"
 
 PYPI_PACKAGE = "whitenoise"
 
-SRC_URI[sha256sum] = "486bd7267a375fa9650b136daaec156ac572971acc8bf99add90817a530dd1d4"
+SRC_URI[sha256sum] = "8c4a7c9d384694990c26f3047e118c691557481d624f069b7f7752a2f735d609"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


