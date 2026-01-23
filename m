Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E850ED6CFDC
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:43:45 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62296.1769150614676774470
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 22:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HRJ9qE3F;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-435903c4040so1148642f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 22:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769150613; x=1769755413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAUUID3BTDFNR7VC1ZZXZjMQdHlCl7VEDfQS6lNQTe4=;
        b=HRJ9qE3FNdzKHrKgezkQcxqsx72dQznul1695+q2YuS9EbNezw6AQnAm4YyDIvognd
         IPbREOrs/BR7beZJnVHzUUHGtdSEVQ11OX7PP1oYszcncUvU5Qm1CaLSQQ5Fn73SPq81
         FNRO7i5KuUEGBDd1xNsiUGw00vkkhGvDAFO2lMk9TOHje+/BHMtqsQT+xYjVCLNIlGNw
         NcU9tYNTxIIL9yivd3d9oNA1veNjc5EEd4Cc3Up9idxgW3eMX3OVLxTceqLRM6eMFHoL
         xcYd8FtPxshv7+JALrNXHuzm09mJn3VQtqWGnQ6tURNbxT6znIyEfCE1gPHxj10tsz+g
         sBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769150613; x=1769755413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAUUID3BTDFNR7VC1ZZXZjMQdHlCl7VEDfQS6lNQTe4=;
        b=tR5Fp9LfCbWdrO7tpvRux5EB7S6Xc0jgXO47b4wbUvDYZoeldgFgGe5//NaxAQmAnX
         GKJH0TuEl9gfiNKFKao5j9QFhwrKsxmKI7Gim9IwG78l3bBBm45N71znPWCX+Hjcbj3I
         iS7KPrFPpYGCbPK9P9zeVr0ebcu0FRt2ioSK6IbU+Wwf6SoQD7SW5Z0T2GKcou6CdUol
         rZf92auH4IeFixArZVVIhNm/fWX88mY5jaaU8EzgFuRQoj4xwUaGOXS9VmSWHly258ir
         y+w+LiNGBSbt8t7O2A4IqbHOm5ebl/NQWSBwCjI8njPWFDdJdWF0j7hB3+rDd8v+LZnc
         /L4g==
X-Gm-Message-State: AOJu0YxR64aQmfdHbBI45/qLsXNP+F/yShbx0J/AwbI5LS20e80RJqH6
	g0cuMNNwAfr3hotleXH+o1+E/0KlCAbxxUyQFiGMncc5vWs7lh05ls+lti85bA==
X-Gm-Gg: AZuq6aIbAyA7YqLQc1B82HjfHeOxU0ZNLeoCtL9BAMz+BhL5s3UxnK+sF6aG7KCDTyO
	yuy0FzYMOaeKTAmxeis5eA/DBFnk6GoGsOgM9NlcePFhKVnjyJOWVUrgc4cZ7qGSWL9of+HZ2/P
	Ubge1OrvP25+t1BcaW2u80vG0oz7m9dnjJV6obwKBMq8SLZw2ENdssw3bUvPEJl787IkcCu7TB+
	KRlsNuQ6vvKDeLDdIRnLzWnyu4ic3fFtC4Jgd2hxdezFYtrwYGTlWoGnUMmFGHcB62cQ5XRrBeD
	/KgzE+mLuI6wYtyi7hmZwBf+zqfAMYUDJSUBK8d7kSPakE/YSROm06eR1FSjEXTXJGj8uxOtGoD
	GiuZII6uDU8h7x7MutIL2hGPNw0Prvy45vSLoA3/o3VmWHe+mowSt2jJHArrbLdvtIqKAZgQW4/
	lt0GC/GlxP
X-Received: by 2002:a05:6000:2891:b0:435:8d02:b9d2 with SMTP id ffacd0b85a97d-435b16271ffmr3368282f8f.60.1769150612768;
        Thu, 22 Jan 2026 22:43:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm4051608f8f.8.2026.01.22.22.43.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 22:43:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] freerdp: mark CVE-2024-32041 patched
Date: Fri, 23 Jan 2026 07:43:28 +0100
Message-ID: <20260123064332.4001588-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 06:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123764

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32041

Both the relevant Github Advisory[1] and Debian[2] states that the
same patch fixes this vulnerability as CVE-2024-32039.

Therefore add this CVE ID to the same patch's CVE tag.

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-5r4p-mfx2-m44r
[2]: https://security-tracker.debian.org/tracker/CVE-2024-32041

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32039.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32039.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32039.patch
index 4def7320b9..ed12787310 100644
--- a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32039.patch
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32039.patch
@@ -7,7 +7,7 @@ reorder check to prevent possible integer overflow
 
 (cherry picked from commit 3a2a241b8fcfee853e35cc54bec00375096fedd9)
 
-CVE: CVE-2024-32039
+CVE: CVE-2024-32039 CVE-2024-32041
 Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/d88ad1acd142769650a6159906ac90f46a766265]
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---

