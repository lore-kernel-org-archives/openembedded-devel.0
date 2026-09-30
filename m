Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3B9CA5FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:31:06 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.121.1790811057215538253
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jp05AKnL;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881a3a28e72so2176073b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811056; x=1791415856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMHO/DNHhL1mEzDNrtSTjgsThe/F63t6PECXmho7DM4=;
        b=jp05AKnLqdjBeBifAKT3MB3KHgkGZhlpP7h7W7WTP9UB8s977PjmyEA02z3pp1MQXp
         /yQ6v/ZzbdFPGG5GkyB8c0VkNzdDbgFLAOGhPypEwsQrNwg/zaWW7BG/ZWhKt7Ym0dvH
         Yy7k+IAvshukzRAhd/+6fp4oeOSiWjwdHoUXscZ+Nowj4kmCexjxHA+VugCZiTusIKU8
         30jIGvRygYfXV3+qBlhQKk1AEmXb8Fnt2qWilYMkkhOU7oyADbdtHcenW5EoYALXdC6j
         HznQabg5WncVYxaQdK9ULU45093w4hS57MVCV2Y7nSk8uIY9fVCVJx2oz6t9WlQ6Npih
         SbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811056; x=1791415856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMHO/DNHhL1mEzDNrtSTjgsThe/F63t6PECXmho7DM4=;
        b=kkkq1FfCqvWYeZJkgrNqwWbjB2h9lsCRKVNYdBZVyOltmX9nVa/kMLjQl/oaIIWV0n
         1rHye+wyZleIOxXtYGwdDLlA+/u2A5GsCjZ6Np1csgTVrzeIGn2/7d+5Lnm+663wy3H9
         ycKRjLiXh7u7QgiNpxNtP5P24XsuvqK4uuyX3oXYY00QSbt+Cof7j0LxWT+7RwjHEEeX
         ProqgP5feLcml5NpiVOGezvg256n60m5hvSB1QLRHsPPIwtqoFhyZF+UC0ZURvpN3F5r
         07RRnGZSLX1AN+DJ00wgwSEgALe25b2t4v7yAFVq0XlXcjISILr8XK0YoBJquwISahWG
         37yQ==
X-Gm-Message-State: AFuF++nkyBTHD8MHRsecvAmp49zyJN2jbGayJ9hY6NVm8cnTlem1MN5l
	Wsl3Jhm0mQVQn24uYCUfyYguLe3e/wM1GApshTc8sV1eRW1qlbQCxmUSmujD5w==
X-Gm-Gg: AYBFou39w4oOT3/s2+aJG3YxDS84sOfOtBhkTOApxR+ErqSWYiOcVYBozakg7JKQF95
	/XH1192v1NgxEddVIeHcL6ZAyhh7itA3jvDLMfHzKm7iwNKBmmNt50YSj3JgXqAZck+nNFtqcze
	jg4lINUMXzJeN8FQZo5MGgyB1KYam44m6P5IF/CJOxbtGLMf/+Ol0ZAbPN1d5+KtFZ2gxHIYDIR
	c/ZGAVmkp9aSYMwhMI86Te0aNK+UM84mNYpz+g5zw1XlpmOdrnamg0WbMaQx8Y+TCaeHP9G2n2G
	JbAKdzGaT/JUlkDR9tAVvEQy8QJchDllOXRrHWdRBB2DDO7mxCnbs5WLUoDTxIBwUJU+/1gP0YH
	oS4NSct4+LbcuV86UDCPNTCScgYWX9YAjbBc+UBzWInrKSB/KOdV1BqxeDv1/CjsBmTGCKWJcoY
	9BIe/YSDCPO66VYs8g+a976Ds06gt2kucWFjMGsFHLxl4D9ZsQCzW63VV45vrzXzAx8zDZ6PLPb
	rVka2wu2OEH5H8bipG+NVU=
X-Received: by 2002:a05:6a00:b81:b0:874:705d:f649 with SMTP id d2e1a72fcca58-8874bffa3dfmr2070150b3a.43.1790811056502;
        Wed, 30 Sep 2026 16:30:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:30:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 7/14] exfatprogs: update UPSTREAM_CHECK_REGEX variable
Date: Thu,  1 Oct 2026 12:30:27 +1300
Message-ID: <20260930233034.659237-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130540

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version exfatprogs
...
INFO: Current version: 1.4.2
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb
index 47c06e683f..2b7a95ed25 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
 SRC_URI[sha256sum] = "47c7c8ddeccbf50d39b903353f2cb3df79134367a4fd764fe2ce3755ff5877bf"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools ptest pkgconfig
 

