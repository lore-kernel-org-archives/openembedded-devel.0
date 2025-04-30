Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFB0C3ABAA
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 22:04:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.6983.1746050678883883616
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 15:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PyP5OMm+;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so2586455e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 15:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746050677; x=1746655477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv0LlZ1aPkwW0jxYz4EHmQypascWfX6QzSSS35eio2g=;
        b=PyP5OMm+P/Tqw7rASxX5saUCNT9gJ3rpS+2apTgjfpHMheeDdRuedaL9bYDvvwrWeP
         r0sp4XLw+C1TeOhY7QvxAEFK25m8HJH8gaimeBUS+7ueFs3UlxvmvN9EliuGcUvEgL4o
         kQfn7WYEvSiPXbLOva0J0/TXJ5SX4t3h1L59M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746050677; x=1746655477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fv0LlZ1aPkwW0jxYz4EHmQypascWfX6QzSSS35eio2g=;
        b=pHzvBp658gkTVDunYa/AYRiG20+n9bPRRhJ2lC8z94AWQAoo44Q1S5id8/qU2/scFr
         fa8LNLO2NqejeP1SWsprJYZHwSgptfgg83w3ZVJV8VWF0beZeIuKKyFHAmE6JO3vYQ+R
         Zkg5u3mVo2ZDlXXS1neBMK5WFd3C+vFhugovYUluD17wAMH7voutoAbwtAXFnHuslYCX
         MlJcPT/2hILyUum7iGGZMtg2DjYKsCVapwtiYEBWxV1cE0ealb06jYHeuJYuMFOGI6e6
         V+SIpJGj+JBmfOXzvfteYX59Ts4CCju7zOkuOQNAH2nDUxXM1ZCoPCL32PSGgOnATYYh
         rkvQ==
X-Gm-Message-State: AOJu0Yxfdd6sBfS+5w+P8nKPoKFwhMyfDN82MEfs2BjErC9InLekL4yZ
	Xr3kh2wmiKqxdWzEuWSNIjse/64+nC8lI9CB43sJwnh9tRbygy4XCkccYreD8WzH0DmIO+cAWSq
	d
X-Gm-Gg: ASbGncuIlJV2IeEmp1UQwV/cOtgOc2XBev15VMyJ8z6oXJztJQIYbOB4Zcs2yj7q3G+
	CUARWoKbaZX1iyTb0wR7Q16ekbGrgHp3FHFha7IoohVZIaOwIYSiLpMle+uQz0AWqeBHtqrOaUF
	IXiYD4PNkj6xQ8m65bdvCqttcoXy9UXlz3D5/oo967d0NRL/utMD2pAl+NOfps2mvhYXn2DnPiY
	GFBepPAm6bkbnuehMkDUJVtYAlhtDT99h4GHzv25pgmX9LShXUqPWUkkq5wOmJmfOvrWmulnWfM
	K0BQTudecWTMBv+kNpe3fQTmYvNh3SXv1v+dQOTesUthWkMBAHuCrWo/ppauqhLpqcGd+8JNic6
	BN0WymVPzTqTZpyGuJJx0Z1SyxU0sJxlNk3Gsek0ah8tEPDYv
X-Google-Smtp-Source: AGHT+IFBchW2DmFD4nnbjdI/WtsZqlN5Vx+y2Nu1GTxCPqsQfRuBUpY5J4vAqYHjvndQAGqDR/t71A==
X-Received: by 2002:a05:600c:698c:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-441b736a0c0mr292495e9.1.1746050677154;
        Wed, 30 Apr 2025 15:04:37 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b61c4db2sm6172175e9.36.2025.04.30.15.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:04:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 4/4] reproducibility: mark libbotan as known non-reproducible
Date: Thu,  1 May 2025 00:04:01 +0200
Message-Id: <20250430220401.4149372-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430220401.4149372-1-yoann.congal@smile.fr>
References: <20250430220401.4149372-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 22:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117265

From: Yoann Congal <yoann.congal@smile.fr>

libbotan packages are not reproducilble.

Relevant logs:
- https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/42/steps/32/logs/stdio
- https://valkyrie.yocto.io/pub/repro-fail-openembedded/meta-oe/oe-reproducible-20250426-pazz3nt5/packages/diff-html/#reproducibleA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-deb---reproducibleA-tmp-deploy-deb-core-------reproducibleA-tmp-deploy-deb-core-----libbotan----_-.-.--r-_amd--.deb

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index ff93db3a21..894d7f330a 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -58,6 +58,7 @@ KNOWN_NON_REPRO_META_OE = " \
     ldns \
     libass9 \
     libass-dbg \
+    libbotan-3-7 \
     libbotan-3-bin \
     libbotan-3-dbg \
     libbotan-3-dev \

