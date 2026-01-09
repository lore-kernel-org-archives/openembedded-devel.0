Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE393D1D485
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:06 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6695.1767950941269648119
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:29:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jynx4ta/;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0a33d0585so28113945ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950940; x=1768555740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afy3kq14KwBzfMfBZApxrtc+VdiSbpcnXXrHDzyTJlY=;
        b=jynx4ta/2oaZkkXiULsuSvEU07lx0z+3W/hS6I7gBs+Luv0RRQj/gdA2evXaL6PloT
         qAQPA3K7Vt1w7aNusYIzX0CAuKfnRC9g8maOuVttD35rpDjY6qtmezTDSGIxIZDMj8jJ
         E12lC/zu4Ibcb3Kd1aFXaVR/+fm1MeVG9VM2NYR1CZwlAGmwtoszED70yu2vgKHTVEHd
         gLKnwtPX/tB3hry/6d8emgSTb2FmhfVROGvoB2TvASUZDn/h48E/PelvkSzwQXl3fEZ3
         Yi6jSMqDJAXVsKxf+goBRMp0V1g7ySWMqkrDUrYPTzwyZzBXAWSkNM2HZPJpQOLfgWPo
         UMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950940; x=1768555740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=afy3kq14KwBzfMfBZApxrtc+VdiSbpcnXXrHDzyTJlY=;
        b=EAtwBxjPNprzw416WDFzz3XHh3W/6M7Ovx+B8Rzys8PV4cl2hSMP0PavCvUV/cvFEc
         yRwH0AtSGngZGGy+U3WKSZs/8VDpsqioEmiXyqRQg55ugb0+5IkqgUUNyHE5nfvLUT5a
         3zSxuuWLjZBCeIttfb06l/1ab26zz91DKLN4d7lDgFJVI8EM0dw1TQajl6EydgrQlN64
         Sw18S8jfwEaneRORDJ1mHf1vxL0fOBihp3K3vIrZ9VMMwa4flqZjWUZ2R/OrmrXBbZGO
         RTF3SHjCqad/hMRVX44UVdgjXFa4he/sZ897/LJOTRpsPIJ7XvVdKIAyFkFrAE9Gl/Cn
         m6XQ==
X-Gm-Message-State: AOJu0YzcEYAMUILT8AHM6aNeOpszwh7rF+pEqi5Cj0RJ0SVZf5HLzS30
	9b9bRSPPfWtgaWEJdt9EhmTT8zay6wQk0vwtOPrDJV1p2pwyfFsrFq2Fkr+Cdg==
X-Gm-Gg: AY/fxX5aG50gnRVnxFRdJPtkNYPY7XmGsLi4SExthNugk9Hvfc7mwtPY0yUP2M9jZiq
	z7iabxvIDpGrQcdUmYI2vk99PHMKhNk232Lua9wtzzEtGiZdb4JeGzdV0LnqI7gEb4o9RGGjVMF
	XSCS6mYi5FE+QTkeUVoh8lmiYj14uq+H3zJ4bUCQBpUtsuBRdg14An3mDBTuAdZdynRwPpzrZ5O
	eczELIi6S4nQx7dxex3sTwezxggfzPh0ksgOKp5juKjhHegWvnzRQChNEKNNER/jrWT1iroFi5C
	z+TRtRbQ/uUawb82rHG/THSAY2eCflLhX2fZTcj1LAhmMpbudGYkXxR5g0nbic9LNnpqpdayrnz
	L0Am2XyufRVcBK9GRDV2lUdAV7uphpXC/Ip8z+5MAR/9Pi5k9CggByrxD0sVA8VUYcMFZnVBZkM
	jS2QEl2AOGS9ZmFh4nmXqRPxY=
X-Google-Smtp-Source: AGHT+IErAEXFi74uDTQAa8dQOaHvy2JzpPrpoN8YeBIXh8w8tNUpJp1IjLcwCRxNuFAMXYmT2oyyHQ==
X-Received: by 2002:a17:903:2f85:b0:29d:9f5a:e0d1 with SMTP id d9443c01a7336-2a3ee443db3mr74910395ad.27.1767950940342;
        Fri, 09 Jan 2026 01:29:00 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 04/12] frr: ignore CVE-2024-44070
Date: Fri,  9 Jan 2026 22:28:34 +1300
Message-ID: <20260109092843.1924568-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123282

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-44070

The PR[1] fixing this CVE was backported[2] to stable/9.1 and commit[3]
exists in the current version so we can ignore it.

$ git tag --contains 21cd931 | grep frr-9.1.3
frr-9.1.3

[1] https://github.com/FRRouting/frr/pull/16497
[2] https://github.com/FRRouting/frr/pull/16504
[3] https://github.com/FRRouting/frr/commit/21cd931a5f9303e12104c72ce31ca383c0c57514

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-protocols/frr/frr_9.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.3.bb b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
index c5f626a35a..f75ce20ab3 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
@@ -135,3 +135,5 @@ USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/frr/ -M -g frr -G fr
 FILES:${PN} += "${datadir}/yang"
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2024-44070] = "fixed-version: The current version (9.1.3) contains the fix."

