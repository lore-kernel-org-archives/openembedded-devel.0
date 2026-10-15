Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603FDCC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32837.1792043074718139016
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=czhpYI5/;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e7e742a2c7so33103665ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043074; x=1792647874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KxPTG+bCzUOtHwNxY6FJnuYeduvZ2xA0OthbZMU+0nI=;
        b=czhpYI5/PzbL+L4UdqE4eDNm2PKiXcecILjqvzrVUoD0baP/ZQehz5OIEkIA0XVVqX
         JfzlkZd+9t8hoTHjOKX014YT2jR5CZMC+zhFlG5uAB9DXMTf5CN++ejm6xNe8FIYhMef
         I4lvF7NfKcqdDL5aKrP4fxE/bizVju96Zi4xGKjjF7uEwy7PW6lfvNhCglHPjol9qvqS
         kFRtW3S+qQY4yK4sBuuG/NNWtuD5/lXefefCeL9iB2jufO4WwdsTxm0+FsAXkX58Hcyg
         Rtvc/0ba5YSzJNbl+8noTwCQ+x4QlFUBSawnBmSKmCVN+0Oeg9W9AlgiVnntCr9fpGfv
         snYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043074; x=1792647874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KxPTG+bCzUOtHwNxY6FJnuYeduvZ2xA0OthbZMU+0nI=;
        b=aoCH4Apx8pP6OUb3I848lEj7BcRODSiQuD3ZbbYKMj8oc6kkvRw0L1cVgSLJQPX/+2
         AUCThKsr89/nWyExh/4WBSb0kI+XVYCeFJUiFGUps+dkBPUsrvdKyKb5Vi5cvwwGUdiB
         QkdEWZNvkBJladXuF+sfqByrTFVpAxYVM/HEOki4lUQ9S56VYtjjnkjIW3yGxGmwcsc6
         GNfaK7o/pxISy6c8fdRmDbG4CyMZ1kfqGL9O2UHRU4YdfD0Cysxnj043raIxDIFr53dL
         lmNCnQ9n8cuMaCz1+7+OSwbt2pfzKg0THaI5KhBzq1pCgdUP6bSEZ8ikwJxjE91D5h2m
         ec/Q==
X-Gm-Message-State: AFq9FYLgmevJ8OqlQNjKkm/VSKhs9AT4yR/9f4tl1gzaUGFg79T9/EDM
	ZMyi7UN3hlZO6VuoqHPspMhYOVSQBlUDCNsFOP5lMez57FcgitwL/dGEdJ7wOg==
X-Gm-Gg: AYBFou1jeY/Ry+JhUcp6VtR5COio0HCj5Nd4QWZTysZIY9BUB+Jc3pKIfiUjmNsoq9i
	abunE5NmTY3FxGOBoIoQFZytaxulFOkpRVrSJUSUueDJ8AHASKW9Qwh6Mb5cxG0n03uqcFnB/uf
	MWcAtKHdZdr8rZpdhe7PxQyxgyEgBAU4hW+DP2bn+HY3iuVi2hXq408esObGga3PnEKWfjCm2M0
	F91a537yTfEX3Toah67+EJ2bA0LSuH1G2rdBrARcLs+7CQ1kv7SSL/tKo4gmpDyUWUjimD2+sJu
	lM7Ltnt33UhmMg6e0kXTd0K4m7ZrTTb5VPpCVO9mAUdp3Xqp2MO++lF+37OcdtSLFfq9ayaUtrN
	wRzgOWxDIxVKmAnaPjfFbxRIF4eXmAThdk6+Bkak6ngxOKvIaffQMcrYqsRd4PvvJW0Ou42705w
	4Pih0Rt7Xba9geCgfW0azDe1erKX3WHd/MO13oAPMplhRuvuT7Ej+fTu67/uNB7j+eoH5JQF1My
	k2Gd8c5IuACymdO+SCJPyM=
X-Received: by 2002:a17:902:e748:b0:2e6:1c24:d5f2 with SMTP id d9443c01a7336-2e840542be6mr128116535ad.36.1792043074028;
        Wed, 14 Oct 2026 22:44:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 48/82] python3-django: upgrade 5.2.17 -> 5.2.18
Date: Thu, 15 Oct 2026 18:41:36 +1300
Message-ID: <962410d82f285c6296662ba772588c684cfca0d6.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130968

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/5.2.18/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0640fa901df7783fc9f544a6bbfde5b771e22b96)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.17.bb => python3-django_5.2.18.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.17.bb => python3-django_5.2.18.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.17.bb b/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.17.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.18.bb
index a9009adaf9..eb84122116 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.17.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "9d4d93be539a18ab80d058eb515900e10951e04c537c5a6b394fc49528d3251f"
+SRC_URI[sha256sum] = "461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d"

