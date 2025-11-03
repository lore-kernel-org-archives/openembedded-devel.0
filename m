Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAACCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 13:30:41 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20369.1762176633599759778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 05:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IHDZFWjU;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27c369f8986so44542435ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 05:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1762176632; x=1762781432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzh8nfbuQbqgZpJaNz5tIg/a6r0oJRtFRJZapRZgJfg=;
        b=IHDZFWjUEFrsKOfOs1SdqFUTYud4o1pzfkedFa3rYjvRE7vT0iCjqOmgs9ivXUYYUo
         maNEO6sD1+IYSxu5r3V1V3DVZfe+k6ucsz7WaXUhlvjeu0AzwPJVeUEfPmG520Pu4i+/
         /AztwNehCVZQaxV/Du6aNKuh3ID0AQAHvgTjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176632; x=1762781432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zzh8nfbuQbqgZpJaNz5tIg/a6r0oJRtFRJZapRZgJfg=;
        b=vBQdMTDWqgSiRiWAV6NWsuHOLuos7bRJ+vbylBvDtvj9hgnEU3tz1Xl6XBgfi8M7wb
         H07yo6Je8GqgwoTkL5WYUb9eV3Gmfzk3eIIhBh49ttTp42ZcsIDzqCHn3Lr+CN6fZlgy
         FY27t40/PawFq6l6K1Hhji4oTV2hIqdgABRmIqI+EkpbSiYvZ/S6QUO8Hxl7GEOSr+I7
         8wxtCdHJ9joW3Sd2eYN0z4jOh4wHc0vtwcT5yrunvjKUtohNtzzHzXquB2VVgYiotV6u
         9XPUMx6WoFeMY55XPCZfevSPvIHYQxrM/Fq2zGYqcsWpE/B462RORRlI4rSQSQgRiv/z
         kqaQ==
X-Gm-Message-State: AOJu0YxLMS2chzYoF6X0PGmgk5k3oI7kkkUBQ8a+k59bdm1DmYhlftkB
	QyG/2W2/7Kw8VTOVJj4csqljxcqNAc6O8OYTZ7h+Nvdt0C2l+G8r/62oC1/bQIhCkeWhtQYYSOl
	YBc1nU10=
X-Gm-Gg: ASbGncuq38HcWhfiy5WKyVtxbgYnnF+CvmNdmnVrYztz4UDgRMk4UuqgE+UEgMXC25E
	Bu0dLXKT9zgbY8ukfMc8wWCMKOO+/HvZEqGo1ICXxoZcIrpYzZ+4MyYPr1+IetN5WBPBCNwG73h
	BbNmkxuPcAFGplbEBPVPtSa9tyYonbdu6/wYhancbndRSfNU5qednN8EIzKYz/f2+dKP+IHPs6r
	61YXGqHsf4oZV4/bXG8lrwnPGibMpeHoZzDgXmBTiZheObfETC2kPho+R6jlZPp7HNR9ExypYY5
	8qL7YL1JrGDb/UlzwS29fJYnk0lc7I6cNH6xvM7N+sAhn26M3nmxRbm7bmpJ3ChUToc8j+v9T3P
	hiz0jeWmmxeJOzdactKBcjEhghQ8DvEf3cGYFyuUExIdWPdhMcroWLNDHrev2kGyjJg6VPbJnK/
	d+7w==
X-Google-Smtp-Source: AGHT+IHuAFIFabTetcNQ3/m3iA3NxsVOgcAg9buhLstRPRoyxY2InZv8l5Mwg1D1XDgiS+YQfIl6eA==
X-Received: by 2002:a17:903:11c3:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-2951a3b6b7fmr148684745ad.14.1762176632213;
        Mon, 03 Nov 2025 05:30:32 -0800 (PST)
Received: from MVIN00352.. ([2401:4900:8fcc:e57e:9b81:ad4a:f564:be77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ef4c263sm5363095a91.3.2025.11.03.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 05:30:31 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][patch 1/2] wireshark: Upgrade 4.2.12 -> 4.2.14
Date: Mon,  3 Nov 2025 19:00:21 +0530
Message-ID: <20251103133022.487957-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 13:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121272

releasenote:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.13.html
https://www.wireshark.org/docs/relnotes/wireshark-4.2.14.html

Includes security fix CVE-2025-11626

Link: https://gitlab.com/wireshark/wireshark/-/issues/20724

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/{wireshark_4.2.12.bb => wireshark_4.2.14.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.12.bb => wireshark_4.2.14.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
index ab6160b767..0a6e33e08e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "6ed51da5f6638aba609be8d1d64a7a85312749a49261146c391fea391a3e5f06"
+SRC_URI[sha256sum] = "098177f021951638f5bdca5b01f284c14fcc3f6c804f7aa2ca00fdcb99c7a166"
 
 PE = "1"
 
-- 
2.43.0


