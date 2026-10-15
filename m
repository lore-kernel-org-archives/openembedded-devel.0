Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C727CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:16 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32799.1792042986795004234
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rO1LYg7V;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e608cd460eso26538495ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042986; x=1792647786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FYEcqKBAui+ZdiiC94+izk6BVFVe2zb2+NEhJLVKqms=;
        b=rO1LYg7V8W7iJm2oxYKp5w9p8tehfALiQbP/Pms2+fKyMjiZDetmQJx+nupdHHmhz8
         tAECZ43TN9WFkuwS9AH4/iUReVQloD68BIajfmMGAoMNT+6yHFdI4jhFrW9IrSrJxQ7D
         AfpdiIrZD1uTStGfJBhFpwvexGhWNZZyQzHq0abizzz7Ne88+cO8KefYrkDg8GG4CEJp
         Ikj/DNxsXgTjuXJH4fB+UDm08Ywmz4f8IzJ+bs6lhrAvudmWBdevqCbHLwBQa52+7hzM
         8E+0mG6qVK0aAEVEF6b9pdmCI5L16swjFWM19yjL/Sa8r+jzCpM/gShTIO9K0c5HpzGm
         MqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042986; x=1792647786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FYEcqKBAui+ZdiiC94+izk6BVFVe2zb2+NEhJLVKqms=;
        b=xgDy8i7HD5j80vsGL+wO+r8aUpFf05vxm7dAAjlKZXtETYnK8eXF2MdqXuQq9MgcU9
         RLTlKZkpYifhcJWYtQ57y3EnojxY0Hq0uHG36mNw8Ks3Gf0bG5UzesnVcQ6uvFGLdHkX
         Ynqbfu5yCQJN8PqQuVfs9ef10yUF+PMW9QyNmbkya1XqgS4Sk+28TVB1zof54Xv2ZWwI
         +k6+NBOrp+NoTRQwwixL1kCKDtGPBHdSCVXI8nCkGw9H0bRL4tQYoYY+SE1taSCaTzj7
         +QObzemggFllf0h4yQG8QPXSaCWjdX4sEVefP2HKOQf7/cpinWGCw7oTqBclripssqGl
         98Cw==
X-Gm-Message-State: AFq9FYI8LIeTuj4WK+tP5m5klfgLR9nAOMj1aY+pcfDKQ68A0+oejoVG
	xV92u6Wv7fx2be+vY1onsl5qZLwn5Dvp0LCbvw2Q9CE8uK2OSq48y3IR5TCAyA==
X-Gm-Gg: AYBFou3eQxuWT2XG6knGondV/X6kPaBsb3UAgO/89yv9DVpR19UqPqqtCTSweB72/oF
	ynJMlQ7vLx7oadJgGWNjGpWBQYaeQ3l4LfrRRT1ABDNoe1GFwu9O+Ynv8RyaxV807m1+xhKlIPZ
	7ynmDyCRIslB+C8dWp84Zo591wStg2Dr4N6KTfhi6jfcQ/sbStXgzpkDoXHqKPoCpbhOQB6kWBr
	3Cr4/xLKg6U5YunArXUboWpxPRQYpGxsn2R9PRsuIbaKAapD/sYTPwbTB9EwR384+7ewfz9ZowX
	VsLgQHTJO/FRN6D1l9WOKbya7qEUxQhrkYI/6MXIxb1sLEkb8ytfwIC764xs96NzZV+CkBcBj4I
	uB87qQak4lFT00V/Mmnx+zL1Nc0qhmh44BNmGaJOqKZf69PabBxxFDeoZ101BA4GL0cR91V0yfE
	V+PBxPmldzVkX66slrxYgrP99UOU92ZZOAN5nYcxhp8BRPPAuYtzr78ow0PD5jDqz8QdIkdcPWx
	vFYRwO5TgJbyYHyNI2gb5s311vBDmtT1g==
X-Received: by 2002:a17:903:40d1:b0:2e2:d77b:e584 with SMTP id d9443c01a7336-2e8428a24b7mr159067765ad.13.1792042986132;
        Wed, 14 Oct 2026 22:43:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/82] nginx: set status for CVE-2026-90439
Date: Thu, 15 Oct 2026 18:40:57 +1300
Message-ID: <e371d72ea83ab4e713d01f0af7fb909eebd1ba5d.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130929

From: Peter Marko <peter.marko@siemens.com>

CVE information now contains separate version range for mainline and
stable nginx version.
Problem is that mainline version range includes stable verion fix and
since cve-check marks CVE as applicable if one of ranges contains
current recipe version, it's reported as vulnerable.

* Affected 1.29.2 < 1.31.6 (semver) < matches 1.30.5, so false positive
* Affected 1.30.4 < 1.30.5 (semver) < correct fix version, but overridden

Add also a note to remove these explicit entries when new minor stable
version is available which does not fall into the mainline version range
(for all 3 currently explicitly handled CVEs).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(From meta-oe rev: 13915b76c5411a7f3992ecfa7001bf9b9d32e5a6)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
index 4dda52c62d..6b638cdd96 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
@@ -6,5 +6,7 @@ SRC_URI[sha256sum] = "6c20565aa2325cb82216ae804f4a4ff1875179014759a381c42ddc8e11
 
 inherit upstream-version-is-even
 
+# Remove following entries when upgrading recipe to 1.32
 CVE_STATUS[CVE-2026-42055] = "fixed-version: Fixed since 1.30.3"
 CVE_STATUS[CVE-2026-48142] = "fixed-version: Fixed since 1.30.3"
+CVE_STATUS[CVE-2026-90439] = "fixed-version: Fixed since 1.30.5"

