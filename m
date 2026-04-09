Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173CDE9DE59
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:13 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127054.1775718612595120552
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pCHuBd+k;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82418b0178cso271546b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718612; x=1776323412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dv9SBxQ2394wFxxrISgwuGSLrv+9iZoqTcNrlu8C5Ik=;
        b=pCHuBd+k+yd1rzxA88Y0nV/LzColMwHPt3hB9FhcXE7ghs2rWefBUXplytiu4W4Abk
         1Bc4+fUVtK6l5Tfr9PAoHgDWoucW4DB1VQe1wYMFyM8+aXChc28RSZUGE9yksxl3tMmH
         gMah2AwrT6kxpuwNqendjN2iT7gry0hZF0N3M310UI9v9Y9hjSBBuU6H9CdI6m8yv59N
         H1f+qGH97M/M9HnRylRGuZljecj+OHS3BERQk8sFV4glxr4F7yGHQhwIA2BFkto2cCef
         iXZUPvzBYYJ+e5gm3rFuPFfmcqtCZud5Ezgt/kK52z4FbeQXmTuY58cNZQPfGj7nQCYd
         jZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718612; x=1776323412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dv9SBxQ2394wFxxrISgwuGSLrv+9iZoqTcNrlu8C5Ik=;
        b=V2mHK7Kz6CcyYQOX6IHLOOETr39Et9psOyK6DD1yFHYoJLAweyAWWJ87lbMJQyKWMI
         WQfA+0cxikiv8AzPNDu5woWXi52ow9v7SgktTc62pdZzewAJ4lKe33K6iDYhYyYXzTsY
         DjUAiPiNf1Yr+zMiy5tLRhwWFhiB1hBPqvTQtcrne+3wZu4JXLLtGbZJUuVGbTrQ4Czs
         ql40IpZEEqIz8IhXI1tbEcHmaJz+MQy/YmNXrXip4EINKB2JrrMnBh6qcn9xkEUMaiuG
         H6ieAft4tEvCcgOl+KjJtKahVtazwnJB+8OgHquyb01T8H51mxGJf4buc1Rhw9vVAYhe
         DSsQ==
X-Gm-Message-State: AOJu0YyCWojOzjRtgYTFRJ856ScyGGpzBiPkxJ3cUWCntSkMYBDMsiGm
	+eFh4/b5ceWy/dQhdnSzMMYIfAGh0mQBg4XjIA4kpA7eo34ZzDy5dukHCV7S7Q==
X-Gm-Gg: AeBDietYpVW1eq1yozYVoU8a1qilpWPkT5AnjOIfpwVRIaSrkLqz4+3R665DbdAFArH
	Jvl1hnuv94LUZWnV22ylQTiNgDckssm1mRKVKxdMfOXxYmDqJDmfkX0l2g8t7FL5dlp/PaitJNH
	+/Cc/9b1I8DQhOevr19gND3t0xnMTX8QmvTAGWKHhzmFIIV3zKoDeMXuMuUcKISPcDi8c4QGzRN
	dGRCdSqYxecqKPlXsTRgQrd9PII7e04Sm/04C2hLg9xJY0zzFulPjMloPwMDP5GtpMpRrG8rReW
	6ZYj1YZ3s1UFuQt/l68A3xmvP+pRBdYLnvhJ4ZO1oVmui6nEhsNMTYS16Vo2CPDZC1q/H7ha619
	0c3XJNqg51wQ/Hs31HVJpsSNoj8EVAfgGM7oh+CvofdpEX+5fusT7hNonheJz3KoNwQXJo+YFmg
	aNg5CVAqyCBlYpXWdPRI4rMlmXqTULm/JD6GcMEEt6EpnR9Q==
X-Received: by 2002:a05:6a00:a15:b0:82a:fc5:fb84 with SMTP id d2e1a72fcca58-82d0db53ef8mr24943952b3a.27.1775718611813;
        Thu, 09 Apr 2026 00:10:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:10:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 18/22] freerdp3: fix CVE-2026-31897
Date: Thu,  9 Apr 2026 19:09:15 +1200
Message-ID: <20260409070919.3968586-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126140

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-31897

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-31897.patch     | 28 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31897.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31897.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31897.patch
new file mode 100644
index 0000000000..2d1b338171
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-31897.patch
@@ -0,0 +1,28 @@
+From 8a03413b6b154100076bfedf6388a348189a6791 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Tue, 10 Mar 2026 09:17:23 +0100
+Subject: [PATCH] [codec,planar] add early length check to avoid oob read
+
+CVE: CVE-2026-31897
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/cd27c8faca0eeb0d4309cc5837dfdf3c42eba4e7]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/codec/planar.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libfreerdp/codec/planar.c b/libfreerdp/codec/planar.c
+index 4b51a023e..f3e00f9e5 100644
+--- a/libfreerdp/codec/planar.c
++++ b/libfreerdp/codec/planar.c
+@@ -720,9 +720,9 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
+ 
+ 	srcp = pSrcData;
+ 
+-	if (!pSrcData)
++	if (!pSrcData || (SrcSize < 1))
+ 	{
+-		WLog_ERR(TAG, "Invalid argument pSrcData=NULL");
++		WLog_ERR(TAG, "Invalid argument pSrcData=%p [size=%" PRIu32 "]", pSrcData, SrcSize);
+ 		return FALSE;
+ 	}
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 66cc3305e8..a45490e8f5 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-29775.patch \
            file://CVE-2026-29776.patch \
            file://CVE-2026-31806.patch \
+           file://CVE-2026-31897.patch \
            "
 
 S = "${WORKDIR}/git"

