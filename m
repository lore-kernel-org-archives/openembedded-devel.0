Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678CACCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 19:57:17 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.855.1762199830328150741
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 11:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m86ndrYo;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-475d9de970eso32406775e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 11:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762199828; x=1762804628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBhJ8LeOeRBBEyLngtwAngehgzqnE8EmRSYMzdHOVm8=;
        b=m86ndrYo23STEgmw6q2nbl8pA/nOy6yIQeqMUB5QpbmPe5YcuMfhg13q5cGT3IcPdS
         hyvtG18IkbWQV7ECsx4DN4UifjvL4Eg6A49kvFm/757OWX7LIn3SN8EoisRkntX76it2
         EWDNMICe01YUrGaf0L3PM0n3TJLmhRmx0FWgl0RTLv7H6w6NDWpiWKp3UqDhk/esbTe3
         jjX0c0l/Vu7bcE4Hpug6VW/NrPJ3YcxRNgVzrzJwKhmD0V02a2D51KYoZdhQuFHXWxF9
         aoKpeQRlmLHhOYS2ZFrWYiyte27zDzDrLXQsOPt17pYBxnsNmKTYFbbzABayKT1lTtq6
         SxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762199828; x=1762804628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBhJ8LeOeRBBEyLngtwAngehgzqnE8EmRSYMzdHOVm8=;
        b=gq3/vJHNFvGLh03U0sK4SKGj2KdShX7iB3AhxpUPTnBymtkC2HLKGdaTi3gUoFBMUC
         89PJBpkcdL81IFbjX5Kz0GRH9/3xL6OJIn4mOojH6nbIvYtCUahlyX3wLv+RXzFEWX11
         Y5Q7SJLL9xrhJmSmwq963p+dubd0RnG6L5kgKv41I9yXe7jCUJn4IvCik+I7ewJd3qm3
         xPZkrBzh3yds1pVaW3N7c59y/jfRFNduoLJIRe2XSK32GYHdLYncl3CCYMJK1qqxUIcl
         t6H7ZSiR7MuWiWrMwlfKtzhDIgcrQVRlEsKT6Of7J17IqiHxByTpC4X26q41gTXrg8u0
         VYpw==
X-Gm-Message-State: AOJu0YzYR4J/Sm4q07Tm8RVwfd8KZo5wma3DTlP+PsgmeeAK21mWDiYI
	6Sg9GXrMlo4TGjMst9vPd214lOM1mW0T5cfYed4KXSSb5JlHYnX2tzp9NqZWz4LP
X-Gm-Gg: ASbGnctGjBO5pemPqN23MrYRryYyDJxX0bhpoCIzW1dBk3tLJtx5wFtJzVjmIYN9fj4
	Mdh8UJNftGOr5Tn4qBs8+waCUMva1+dmXfICK8T9bo1t9jnPPBFfzrdwIH96P7Frbf+klgUqMxB
	SovOAoBHOUV4kC/eYvaYb9diC79qPzsdowwqwwnvfYP3eMWTG0JEhHi7dXS4o8YzuYiDFDjLuP6
	ppupuDeiBj9yBiI/O+xtaNBDgxdFZaqLSQyowfrqdD7SxLAth0ajJvIXBPyr+ZcMfNSzbMacE9E
	kUsMnGiF96nfLDZ9ZgqGiGp3vxIJWyLnwAvMe2cj2I/5dc4x+IAqxH8vp+tD7t1KMm8evv2XgUT
	WnP2/aU4kgvEuJpdXDE4Qu/A90p2xyfF3+rtRFnU5JygN3kdhkxX+NoAnXIbV0dOHTXQMplbZeQ
	==
X-Google-Smtp-Source: AGHT+IHtkDy/69AFQEWFiB8ICHrrb4qFyM1XSZxqVk8Oo0tkzprW2pTPd39I9itHvGZczFPdPCgJJA==
X-Received: by 2002:a05:600c:6389:b0:475:de05:6611 with SMTP id 5b1f17b1804b1-47730793c68mr136188365e9.7.1762199828308;
        Mon, 03 Nov 2025 11:57:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c48ee52sm175869885e9.2.2025.11.03.11.57.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:57:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: ignore CVE-2025-4681{7,8,9}
Date: Mon,  3 Nov 2025 20:57:06 +0100
Message-ID: <20251103195706.933227-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 19:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121281

The fixes for these vulnerabilities have been backported for both 6.2 and
7.2 branches, and they are included in the current recipes already:

6.2
CVE-2025-46817: https://github.com/redis/redis/commit/229af5a62d4d24dd76486855197c3d08c13fe4d4
CVE-2025-46818: https://github.com/redis/redis/commit/de5e6aef1f95800bf0b58b33d8108d65c0f80ecd
CVE-2025-46819: https://github.com/redis/redis/commit/ef22554057e50c67d0f8d0ede39483358356321f

7.2
CVE-2025-46817: https://github.com/redis/redis/commit/fc282edb61b56e7fe1e6bacf9400252145852fdc
CVE-2025-46818: https://github.com/redis/redis/commit/dccb672d838f05c940f040c27b74fde6fb47b2a7
CVE-2025-46819: https://github.com/redis/redis/commit/2802b52b554cb9f0f249a24474c9fba94e933dbb

CVE details:
https://nvd.nist.gov/vuln/detail/CVE-2025-46817
https://nvd.nist.gov/vuln/detail/CVE-2025-46818
https://nvd.nist.gov/vuln/detail/CVE-2025-46819

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.20.bb | 4 ++++
 meta-oe/recipes-extended/redis/redis_7.2.11.bb | 8 +++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.20.bb b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
index cc98781fed..f08386eef9 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.20.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
@@ -23,6 +23,9 @@ SRC_URI[sha256sum] = "7f8b8a7aed53c445a877adf9e3743cdd323518524170135a58c0702f2d
 CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2022-0543] = "not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged version"
 CVE_STATUS[CVE-2022-3734] = "not-applicable-config: only affects Windows"
+CVE_STATUS[CVE-2025-46817] = "cpe-stable-backport: the used version (6.2.20) contains the fix already"
+CVE_STATUS[CVE-2025-46818] = "cpe-stable-backport: the used version (6.2.20) contains the fix already"
+CVE_STATUS[CVE-2025-46819] = "cpe-stable-backport: the used version (6.2.20) contains the fix already"
 
 inherit update-rc.d systemd useradd
 
@@ -69,3 +72,4 @@ INITSCRIPT_NAME = "redis-server"
 INITSCRIPT_PARAMS = "defaults 87"
 
 SYSTEMD_SERVICE:${PN} = "redis.service"
+
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.11.bb b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
index 83cb4531d2..108ab24d77 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
@@ -21,8 +21,13 @@ SRC_URI[sha256sum] = "2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e63
 
 RPROVIDES:${PN} = "virtual-redis"
 
+CVE_STATUS[CVE-2022-0543] = "not-applicable-platform: Debian-specific CVE"
+CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
 CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2025-27151] = "cpe-incorrect: the used version already contains the fix"
+CVE_STATUS[CVE-2025-46817] = "cpe-stable-backport: the used version (7.2.11) contains the fix already"
+CVE_STATUS[CVE-2025-46818] = "cpe-stable-backport: the used version (7.2.11) contains the fix already"
+CVE_STATUS[CVE-2025-46819] = "cpe-stable-backport: the used version (7.2.11) contains the fix already"
 
 inherit pkgconfig update-rc.d systemd useradd
 
@@ -73,6 +78,3 @@ INITSCRIPT_NAME = "redis-server"
 INITSCRIPT_PARAMS = "defaults 87"
 
 SYSTEMD_SERVICE:${PN} = "redis.service"
-
-CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
-CVE_STATUS[CVE-2022-0543] = "not-applicable-platform: Debian-specific CVE"

