Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CD5CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32831.1792043063734425620
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rBVuNcc/;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8fe8e343fso19139025ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043063; x=1792647863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=410cQXAPwpLj42NqWqZOPmkjIHcRoGdRu5fN1xO3Hrw=;
        b=rBVuNcc/0rnV25DmW95AnTAEbffHKOP+JcDagZXQrntISDqtVp71CLKRgXk//UXmd7
         we6Atk3NRpzhAXOJTVkdC/PfQaw/ZDeJf1CiDHNWf+EUkEh6mu/9LQmLYlTwnSg/Jun2
         7ir1NHaC42l58wxC6Hp8Syhi3rSMmvpw0kbYnFfQGoJmlZBsMMr2mvHcqewAvkuWrOUe
         dtBX21JaBHRtsbAybWLcyf+y46hh0RBAPGEHGixiKcCJvkULiBujzyRapvndqxqs0i7T
         PBuH6XVKtM9nmALnqAPkG/gbpYXK6rCzCrrOSUKgsc6GZvMv4vdaTxbEq6zSu19fmTRz
         VUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043063; x=1792647863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=410cQXAPwpLj42NqWqZOPmkjIHcRoGdRu5fN1xO3Hrw=;
        b=BVnfHitYoJGdvWKwSk7NjMDsQKZYPOHSekiUZqS4oYXNg/Zoe2x700SyPitfi9Q3Qu
         KESl+FTe19+ZvaYRZpmgsuRa2A4/lEVgJ0OJ1DEh6XXZZxy8GJu1YHP3shNMYdWQAdG4
         M2UUQvrOU733QBJ1xdKPYPaiRd7IS9+Ys2Lla3/hD2YcKdHdR+m+UBnASKlMS5o6FYr+
         2uYHlmGN/vnSDLNzKJgGD10Yy6jogm2ukyNSG1DZ2QwdDz4e+DFQNKS/Q2bFkXvQAcMt
         ItrRgWNd6welNSH+xXDyKPVZo2884GthBTtCWIWFq3sYepI2FnsZJWs7VChyETnAnxV6
         B4aA==
X-Gm-Message-State: AFq9FYJ/p9d+hi3cmnTLJebpb5wicfg8a8W+9jXBMpdHKRgF2lIwi4R/
	4fFNzGOCqqu/5G9iEv/NVx/3WGcRairf5W5MkGg9HEJNutkSnx6H7lhKIiER7g==
X-Gm-Gg: AYBFou3QNbi+I4yUQW/IVxwyaAEvjgRJ9DzgnZuBqgFoUB+8OA3dZZvPeIH+x+7YJmd
	Y9tvOQBV+PhIg628wYTpWpaD+2+lZcISOc9Cp++a6FOUj3+D1Hi/79ZdqCe8zS4Yy8jciyoJI+V
	UV4ldVNjxp9sOGLPffuoYQ7vcAhc2SkAoTx8Eq6W6SISiC3vWm8taZCAsP2dhQILY2ywYhaVxrL
	z+J4N1EvINqL5HnE6R5WymmOPVBFiLEn/QjTOQOBvkjx2VMl/LIJRnJ/Ug3t7DGVhH0ZE9uXI5U
	giNR7cO0X+e7eEe3YCWCKUhd9JHe2dirbV7bYlJvQSFKkmCiEOkw+xd6M8QfTATO+fi05kOhcEt
	4hlfvV4b+Kv0WSjHLNH7s4KZlr9CdevQJ0YrUAMbSzuL295N8yQbimvFJCVflU1xSXbVVtGkol+
	+OZOSDBvGJJZtyC1pXlrvKaN02poTY5t5GQDypRTBrmsQBhqlH27FkozOi7gu9/1igVEILWZpGE
	sa1i57XCAcHEfMfP2HPqYA=
X-Received: by 2002:a17:903:19e7:b0:2e2:c84b:43e9 with SMTP id d9443c01a7336-2e842837a3amr168425045ad.1.1792043063054;
        Wed, 14 Oct 2026 22:44:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 43/82] python3-gunicorn: mark CVE-2024-1135 patched
Date: Thu, 15 Oct 2026 18:41:31 +1300
Message-ID: <359cbb2b7d80678192535944bca28e0f4a85193f.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130963

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also identified the commit.

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-1135

[1]https://security-tracker.debian.org/tracker/CVE-2024-1135

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
index 545947446c..e19be89360 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
@@ -41,3 +41,5 @@ EOF
 }
 
 RDEPENDS:${PN} += "python3-setuptools python3-fcntl"
+
+CVE_STATUS[CVE-2024-1135] = "fixed-version: fixed since v22.0.0"

