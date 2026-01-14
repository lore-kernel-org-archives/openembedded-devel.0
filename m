Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE7ED37E28
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:55 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9369.1768395712338577313
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PSAPE9zY;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81dbc0a99d2so2551662b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395711; x=1769000511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trrRyNZ5Eg9y0syX/OR1gzLC3438QDHiYrNLd5fmml8=;
        b=PSAPE9zY2rvpvCRuau5TIwSJIuOIFcg2EuhzAooAniSaHRCMyC98NbBZP7z5WlbpUa
         M5AuuLOl47G3Ccx48rDBtYtv/W4SqzJburCLQZSbAC/VEGzFb0/be+HnyUo/vJhlnDWO
         JMruP9FonUTIDp8sxAg38kjdw6RgQ7Xb9SqdSso3dmsepgWshdvakNfyPz+JsCcnaYH3
         3Pz0hnWxVX5Lz31xuwekAvP0YXJun8+M00SoRxmtFbJZtWe/32rQkygh0aiMePx+D7jO
         bdQVGDZnfDKUDTzTyX34RK+Uaexj2BySuZ4SoEdBvryVheXNPqaKLw5LgdHwjWnxzG5J
         x8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395711; x=1769000511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=trrRyNZ5Eg9y0syX/OR1gzLC3438QDHiYrNLd5fmml8=;
        b=L836YyzGD6ZUZGRHM6suuLJakkyGL10riEDRq9w0TvKS4/qyerIy7K59TyJgprRrCS
         8Dc8uISeOpGsoOcMJEFGi4jS8ZporZXnAz8lv0VQehra/V3/aub92AsIgpbV7XD0SMxD
         YSkQtfFAujcNdtXKieVeGRkyamUEdMbUT/DCyXjOrgiB8LN/bghw8HqUoufUK1vMBOtg
         hmTwmMQ2BSgnva2P7kLb8lX/4fGg177cRgUWshF7sDhNi8cbWZD1c2AaOt/tNa1xanm/
         w0/+AqLlUjQej8kbMEY6DFUVUwl70j+HDoIMNjcBHc3FudW/+cYdiq7YF5rRcJAMqMfR
         Zl8w==
X-Gm-Message-State: AOJu0YzufpEHeMLDskUa+kpAaigibu/PdD6kMlPTMPNZtyUBzncRwmPs
	1D6xM1u7Uld236UEOUqqx3eQdoBlzpGSik8Wl6XxI4MTBAcf2gwwhhNR4Io9Sg==
X-Gm-Gg: AY/fxX6x5KeW3Lytyk3noTJyNojLbqYw1r5lFyHMj5/m1zZr2o0JiHffy6SfiRvrJRH
	iUovtswVmYZHXtY9dLV5glZ3O2Q5yE+hPOLO+yWmoVAqTOJJfmoULMwKYaQSVMUux3pFpHOdPK5
	chJs6kyJJJdP+8rD/Yafcp263b6/Q8UgQlIhx0gySQJMe2Wdve9TWxfkTM/WUKxpL3cZ31kC/zy
	3xwcM3kCsicwc+NuYjknyvg1J9ejal+myixt1Tn25XtPmG/kh/ywpGbPhIxw182fnZa2B4L1Q+P
	hTtIlZqDLxDc6pnEgNfM0HkjLd5oVB06zHN5zrjLV2rTBqYfe3/5g83Ikq+ZEhX80wuL8EnNhb4
	5xgSYo3J3F2Z/Vfjv2yaz1Vwe5hFDhTSL78tdda2r5gveewW+z2qIqY5b4ED5/j9q49DZ/Qyfny
	qp3cVrl+yLMW2CSS8AnWa5ggDOuCk3C4CtGg==
X-Received: by 2002:a05:6a00:8006:b0:81f:23b5:dc33 with SMTP id d2e1a72fcca58-81f83ca479fmr1884111b3a.30.1768395711350;
        Wed, 14 Jan 2026 05:01:51 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 20/20] python3-werkzeug: ignore CVE-2025-66221 and CVE-2026-21860
Date: Thu, 15 Jan 2026 02:00:57 +1300
Message-ID: <20260114130100.1016416-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123473

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Both vulnerabilties are for Windows and can be ignored.

Details:
- https://nvd.nist.gov/vuln/detail/CVE-2025-66221
- https://nvd.nist.gov/vuln/detail/CVE-2026-21860

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
index 5758830cb9..5f88a9577a 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
@@ -22,3 +22,6 @@ RDEPENDS:${PN} += " \
     python3-json \
     python3-difflib \
 "
+
+CVE_STATUS[CVE-2025-66221] = "not-applicable-platform: The vulnerability is Windows specific"
+CVE_STATUS[CVE-2026-21860] = "not-applicable-platform: The vulnerability is Windows specific"

