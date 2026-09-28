Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB5FC9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:56 +0000 (UTC)
Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46632.1790553836152333914
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B4AgnXOM;
 spf=pass (domain: gmail.com, ip: 74.125.227.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so9838445ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553835; x=1791158635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFdgz/+BbeFBeu20CERHwr4Q1yp2nqwah26/SiB6h4U=;
        b=B4AgnXOMppY34jmrecxMrAzjr1ncWzOYw9evBkkIQVH4t1tonSdA3VTI+PijjuqXjT
         8ViEy9wuooWr+8uyCxCmbAtxU/2AJJs4ZP0Ng4ulYBtrA3Puw9KJcDP/G7lKleL0OfHF
         y0tGjFU4gQRLY0Y5rSMvv0myz4LYAqHBjPEZ3eyfPcLB7GEuCde7V67Wbt4smCU6Eqoo
         oo93xJI9t9H7hguMvf3vCZVQA5vJgqnEbBJO6OcVKx7d1sdh0tsYE8vpZnETDxvvAbgA
         qI/4dk30zaMGtGLxUfkr9HXrHGgrJhxS02oyo6pZjw1ZEHVivjokssEOMT0FN5yf109U
         mjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553835; x=1791158635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFdgz/+BbeFBeu20CERHwr4Q1yp2nqwah26/SiB6h4U=;
        b=tQsoK50Z0+0i9iakXwmtbMOW6CjCBQNlv9V+xWm9u7PZz2EHYR58ulKbycBgnRnW31
         MMvCqh4VOJeX+DCVAs4J6pDLllfysd1clkMEJ1TMGox9ooyBYO5ZmJQQLfZFAyOUJol6
         /HHdPYTlwKt1t/O85KdPWm9AxwaISQw5WnLvYbOBL2lnNxe26B6NkZz2AgYYsuWVQfha
         ojL3NVkX5XtMAk6hI2n+ozQak0pUJv+pcssry85XB1Q1WFd3ssqvZsYurCMAOLs8xe0U
         FthpGZBc/WIjc/sMPhUOg6mfZQIl6rr5q9NRQPyt3XIS6aeUj/GvFACtma/NJCASHdGD
         t4DQ==
X-Gm-Message-State: AFq9FYKZ6mdQ1oPsB8Ly+TurkT0UuDGARueSBHT87joL0LKPpHYv65xw
	oq7s7jY96iXw5nkRUX2bfcLAj1TLeq+7LLwSWnE6Etesw1RtsbsK7t7rwNIigw==
X-Gm-Gg: AYBFou0xIGHr4S/PkuhTYU3eGD/eCt/4qodgURz/OwFbsp3/IFy2beDYkVBc7dAHi5a
	KuU1wUuDLV0XXm/mfesK2SedY1xfUbXqf31yEITOMyHDP6ucEY6wDnONYErPyo3ISnjLzNw681L
	QyeDfCVXRwZEKSz29cHjHQoEZezsBemDa3dY5xtdWghoA0zkJ3iZlqJsxaC3lPW0xc1xCF7xFiA
	fojIS3xAIC/sjTUvgYYnRfg25kNxntpBJ17FFnH/4hcMmhjgDHBEJymdTtXGCqJB4J1uDqQOk0o
	mN0XPDbg5zLOLNPKf73QltG8njlWtqLVaVS6RYJbRq0kISpfnzvkx4TALIOO5JqgyY527bGvvrf
	WoqD5BIKxG2wMrhN4Tmv2NiIQUacvq7pzUE0C/L4dPi8WzP4rO+sEe9T3F/NxpNBn0sdzPiCQaG
	ici0LuvJaCSQoqATOAMRbnIFNl71DrWOseJPzy/EduSbbKqVUMAurF56VMp0gw8iVDueki+5mZ+
	Nue2j9oknkZtvPUVV6SCIicjw==
X-Received: by 2002:a17:902:fc8d:b0:2e1:2e86:e60e with SMTP id d9443c01a7336-2e12e86e641mr17241975ad.0.1790553835476;
        Sun, 27 Sep 2026 17:03:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 22/30] python3-nocaselist: upgrade 2.2.0-> 2.2.1
Date: Mon, 28 Sep 2026 13:02:54 +1300
Message-ID: <20260928000302.2528437-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130409

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://nocaselist.readthedocs.io/en/2.2.1/changes.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-nocaselist_2.2.0.bb => python3-nocaselist_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_2.2.0.bb => python3-nocaselist_2.2.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb b/meta-python/recipes-devtools/python/python3-nocaselist_2.2.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_2.2.1.bb
index 38d941d9be..c21b6a55e1 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b06b3d6fec1abc05c607aa8e813599388727a08e18c223431d7469cf6eb0c06a"
+SRC_URI[sha256sum] = "bade0e96a104ac8ddae49c261aa7c27b5ae8d9434661c6cd8ec16f3cd5c677a1"
 
 inherit pypi python_setuptools_build_meta
 

