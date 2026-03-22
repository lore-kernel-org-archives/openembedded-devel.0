Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C1DFC72B7
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:14:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28178.1774174471219226222
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+KZY8hB;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso15794095ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774174470; x=1774779270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEBI7E1vtEa2Bi6mxTyVFfvwGqOKsldKZx29NQ3UtHk=;
        b=D+KZY8hB3n/DpizHscH1XY9aDyfT1D48PuMqnF7ORAERlOzgYVRHS1k3aS9CH1LKyl
         sDjBy50AIa5wcuPlsnaY71iQF9b1bpmrbOp8gpc6qYBaQoaOeJjOgcmV+o7gEuKa7Wsw
         3YN8jhegThhNCq8uxqc/jXQF9Wo5MZ+SeSuTghUhT07aZSh2aptEpW5YzZLPWzXiEpUg
         RxT0zKcLfqZsQF67NQwAeCmqdermOeqQszk35wM12XM0KCOEOyOIgdRMJ+ZOLmVVGWwx
         IHCsHY9YyCPQkJucAO8AA7hqMM557Bgwm5No/k7ebhvRTDYq34pThDzYavh5lZxPAl/d
         IPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774174470; x=1774779270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AEBI7E1vtEa2Bi6mxTyVFfvwGqOKsldKZx29NQ3UtHk=;
        b=tKELGN5qJDLHVTcAlolj0TTSrBXh3Dg+tlLkpK0BXqIO2H6i8pRbfGyBGFi4YxAct7
         yF6Lq+MeoMFAD7QnOoJvA+B++uSadFknVUrcuNSJyQkBOlo89rFp0K6PsiKw5Wh/f62P
         B8CmbjG7E9YKyjkI9KtncC3rXZz/UQYTNQ1SqgsTxHAkR7mUp5hTDgzHyack2tja1tLJ
         RNR6AtSZudMU5Vr5dYcPzTEye0TDA6gpG/infwPuIVFZwUs9i02Yl2ZZgpb/I2eImHgp
         xNaKL8MS6+MTkdrmZRD57b0lFwNCTrPRVmtxkd09Yk6+FZFHF58Krj93zhWSj26dABjM
         /Byg==
X-Gm-Message-State: AOJu0Yy5WqxJbZ3cscb7L0kCgqa5SaJJsGfibBe0hQJP0Pu/mPpNP0oz
	h532leSzO6CebsTcVQ8e/IhzRZJDqZP00TNV0316Mha80wzo+XoYsd1pN0i2xEub
X-Gm-Gg: ATEYQzxRcp5df3yPh8E9fD7BB4Zw0S/7gMbefaxVucOLtsbQYr3y173tUfPSzq5Av1L
	t0UklRSFEam1DhDMq0gnH0f6vjnCNuo0aunpMHTRVXr2yilaCD+J1K7RqqaYTD/qCEMkb4XtbT/
	WaulEVTUeVgvA/pzCrpmAio8Oce9sgMxR3CDNqiThUmneG1zt+WaA+u9TRWiGBRzvK3g9fkUu26
	6I+JHZIF35TPrODX04XwMjhSFz/jakZWUZTN8bK+wPM1PMjA15F3bdLE+Oshktg1DuNERgDW0dY
	PiOI8NJ8co5UCdZozIM6tHMC7gqNAUbT/o+4lrWjkKUotGLSGoQTOD3IVcgRzdvDBYzGOuIOlFw
	7viwVE6i/II76sneF88O+wucDOBzCIB4QvBPno652UKpjeIUILfV7jOeKdP7SVLgDNh/1Zc/xbb
	KGS0cIxWJ1XKNbVUEthCXLgA58KxHRa41pDfQ=
X-Received: by 2002:a17:902:ce8b:b0:2b0:4b3a:9b6b with SMTP id d9443c01a7336-2b082715ee2mr83232005ad.19.1774174470444;
        Sun, 22 Mar 2026 03:14:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm73775575ad.75.2026.03.22.03.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 03:14:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Aviv Daum <aviv.daum@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 3/4] lldpd: fix xml PACKAGECONFIG dependency
Date: Sun, 22 Mar 2026 23:13:49 +1300
Message-ID: <20260322101350.439083-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322101350.439083-1-ankur.tyagi85@gmail.com>
References: <20260322101350.439083-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125475

From: Aviv Daum <aviv.daum@gmail.com>

The xml PACKAGECONFIG entry uses libxm2, which is a typo and not a
valid dependency in OE.

Replace it with libxml2 so enabling PACKAGECONFIG:xml pulls in the
correct provider.

Signed-off-by: Aviv Daum <aviv.daum@gmail.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
index 044f1e0745..b7224d0f3d 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.20.bb
@@ -29,7 +29,7 @@ EXTRA_OECONF += "--without-embedded-libevent \
 "
 
 PACKAGECONFIG ??= "cdp fdp edp sonmp lldpmed dot1 dot3"
-PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxm2"
+PACKAGECONFIG[xml] = "--with-xml,--without-xml,libxml2"
 PACKAGECONFIG[snmp] = "--with-snmp,--without-snmp,net-snmp"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[seccomp] = "--with-seccomp,--without-seccomp,libseccomp"

