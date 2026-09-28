Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DD2C9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:46 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46623.1790553823429502624
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gJra5+YZ;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91c22d27dso7035955ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553823; x=1791158623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhwxUs+Gy5v4EiptO8acjCCqqJnIbVYKlAETo+QHFqA=;
        b=gJra5+YZoatAbRLskXFCJiuZcfTjah/ELv4n/Ph396QzzTowedv9jTdtObMj02g0eJ
         0irk/WH9bqzqxfJEeGUotRHww3GdSJHMNTHs3BlqDSYIiYPRzj1fET6J3h6FQlWkjIyV
         TZ1nqWoXn/AK5mGtdjmXhXhIHcXsnihFUGQjBOPSB0d6jxpxurRJwNgWp87IuTVpZlSM
         lJekN7Gv3BkuNhVe01OOweBfrK3suNeKn+WEb8YEZ/CbSeLRce99T8xiLgr4vu0CNXpX
         Mehi6JFkVaBKqY0kdfPnzUZdLYNYldkOBNHJkkXWrX/6VKq2kVFTCKyamtEuy19Xu5jc
         0Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553823; x=1791158623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fhwxUs+Gy5v4EiptO8acjCCqqJnIbVYKlAETo+QHFqA=;
        b=sRCC8o0p46Q3I9Ngd1HQJEWyKNQfMLTeCo6PCnnYj5eI3tLpQMxv5b0W1B6wcQPkbP
         sq8lQJOYpU0wIUZqfhtSGBlAE2wP4GYOU2tOPQGa0+lE25tAJVuI7a4JlcjpZCmmUsLM
         RBiaORtrrkKrUC3yUoPhR/o0qc+Fs5GilicJ9BM5aqHFZcKcSRwRUiLl7//sM55BCeYT
         1PqP3T9lK3KKqNI+T8M9Gfh1Z4Rkw8z871DsLcIJEMB3lBzLH6ond5i3MwpEa5rUOC8q
         qtdlKa4i3uCv6t587h+PGHAv3RD0AWncuqIMF+areAWroKJ1AMr3zPCcxKyBjg00TIHX
         M8Tg==
X-Gm-Message-State: AFq9FYJaMj7R/TabZuMiiUnADNZ9feaLcvesiSkA1lFH4VLc4TvLsv4i
	lOzKJtesVl2eN0wHWZJJPc6DAOd/Inmtg1QwI5Zg6miBd7T2RxG4qAPfns+exw==
X-Gm-Gg: AYBFou13wpGD524iUSATkQSgMsy70KwK7qtbUkFKQ3Wk/xY4U3G6kgeO72SJuoz7sAG
	S+7xgYRIuajva1ntzpA9forsmNWWXGjy3QMceNABdQcCJFI4DNENUB8H7+1kII6yy5lPJl9Qx5n
	nONqpYBUkzKpgWx9xc+sbbZ+i8y2454CjcmptqBK2U0BYT67fohons196FuL2rkKqREdSdmItXQ
	msrU3V8ZWQqbhGf32yvF/FIR0y/EdqxXboqx1lI6QDmVRsBVeG5fYe8QPNtvTl4+Ooi4v4C+Wjv
	dm+cl2I9oek5LMqpDHqhxRTFWpmkSDgcqpuF1YuewQf4Edz7fOcgOz/kUZ73PMzKeT89BD8Gq/Z
	YSWnGrlgQq7yYlD+iqkhGjD/R2/oWZq8euvR296jyOZzf/1hhyU/xE2M7EJvvEm04VVAP/4cGTb
	uvtj2lggrq+/m2MxD61Ca7bsyloagi0s1SjMssbCGs72luv0n8+20Y0fWAQlUYC1ErG8qjUoEOv
	r5+w0oYFsKIJKVAbkZdt0k=
X-Received: by 2002:a17:903:1acc:b0:2db:210f:c104 with SMTP id d9443c01a7336-2df7da60bc5mr92822055ad.10.1790553822629;
        Sun, 27 Sep 2026 17:03:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 16/30] python3-djangorestframework: upgrade 3.18.0 -> 3.18.1
Date: Mon, 28 Sep 2026 13:02:48 +1300
Message-ID: <20260928000302.2528437-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130403

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/encode/django-rest-framework/releases/tag/3.18.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ramework_3.18.0.bb => python3-djangorestframework_3.18.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.18.0.bb => python3-djangorestframework_3.18.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.18.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.18.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.18.0.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.18.1.bb
index bab9262ac1..b845e55f28 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.18.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "2323a5111837e0b784dcb8323abc78ecc54fa2a5af7aff2677cf50cdd849477f"
+SRC_URI[sha256sum] = "605d79fa2ec2f02905492e5ea13d903c2d842d0b4c915a57f7bf02ab9f3c91dd"
 
 
 inherit pypi python_setuptools_build_meta

