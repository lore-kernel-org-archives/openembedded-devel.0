Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B687E91274
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15347.1770274812087209162
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aCSL6Zub;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so4363105e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274810; x=1770879610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8xFs1sNqW3ASvgOq8j3AC1x7UvvkiKDQnCbRZsrV24=;
        b=aCSL6Zub78cVOXtMnYeCwnuNj0E0BCDW2yxoF4QH3dc6VIDaLfVynKwSWOU1wxLHrY
         QRlhjHcjDtuBIqeocce/yauxDIfKVCw+KXcmNTMQ0bd4Xofp84Bw6qNHMaXvYf5QYFCk
         ckQyzshMFfeY6cWkZZRP07xRAV5E9o2DXbkHDyii5fN8Y1VCooxrZ07YskOLRpuHyJUf
         ayH8QLkgM4WiadJkpWFFSuWJBph8OBxNFbTzOa/AF+782wbjEex5xYYsR5FIwQ6YZR1f
         iwRi6AmU4sPfLLw7hv5+xju6mqmHfKtGmhs+sUBrRZiDOhbx1NmC0KRFnH8vt2NmWoX8
         /jbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274810; x=1770879610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e8xFs1sNqW3ASvgOq8j3AC1x7UvvkiKDQnCbRZsrV24=;
        b=AfTQWKB0Yi02UYWib42Ds30EldGwh9dP2wfx7bFr7QmaCAYTP5xRIKDA+7BcmbilLb
         8yHxe3dqdj1l8tF7dnZfo0hebqYeTJi2704aCoBIFa1oRB6XSUQ4qlWey2udd9uLzsXP
         0sLDK4T74ZGEvTfXlsrVL9KSMfZciYaxytZgq/MIIHoOgYeu6KgYOlgXAUWUOtw18wPx
         TkjG291p9Au8SaEwW5/q+bHdGJfH3+RZ9W+25WKI6qWz6QOKzy4A4/ZIiwKXspB9YXr1
         7WpGfkTzSRzgkag3am06LC2TV2aI3v2nVJHP0L6yXVY8EshqVCjIB6iQP+3BcvwA9LRH
         9Beg==
X-Gm-Message-State: AOJu0YzlsawJKUGNLsXd0FW2EVBFAdP9GI17k0w/+MNrwpxIN4yVWGn9
	uQWDvX4YqP3Izt98pZ9mjdpxM91xJnfRKMGCW54CbSp8WRbcXX+RA4hdPXUvwg==
X-Gm-Gg: AZuq6aJrJCPFuXuaR5AA/XiBcHMvhYhsFTDAWzD8AHEI4AHok7idSu5TXEBqKMimCV0
	bL6MWJkjc8tAg5x7gS7GOHW3GZceANdXEzT3/AytcePDQ2iC2+hIT+5tYOYRU0iM/DukV+8HfrH
	ACejcBuPxINwkutQWk4jT2UeReagaiGcVLvD3+baay7XY6Ji5tbaRYgZhIw5Cd03c6XlMFfZKsv
	b8MRBRy6TXloul7dyCWf5h95Q8sjYodWkPCi7/fbTXu3IDAI2Zfy+n3eR1+mPxP/wWKe1D2ZNIp
	z9WAK/O5oOFWFzfnD4ig+/MsuoajTg2baTHT9BiTpi3gM63F+NgZeDqS7G3CqcBstqbzUa3JwgQ
	0zmhjMWXAFz/MxtGCwvyPpE/2WTnFIZciVeEDvUNHwpFahYfZs8xLP+w+YolLQmsWPgmH2qrUDd
	O+rcyzND+k
X-Received: by 2002:a05:600c:848a:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-4830e930426mr72578425e9.12.1770274810365;
        Wed, 04 Feb 2026 23:00:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 20/20] redis: ignore CVE-2025-46686
Date: Thu,  5 Feb 2026 07:59:55 +0100
Message-ID: <20260205065955.1267785-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124195

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-46686

Upstream disputes that it is a security violation, and says that
implementing a mitigation for this would negatively affect the rest
of the application, so they elected to ignore it.

See Github advisory about the same vulnerability:
https://github.com/redis/redis/security/advisories/GHSA-2r7g-8hpc-rpq9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 868b4b2959c1f6be13693e31eae5b27a1fa697e6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.21.bb | 1 +
 meta-oe/recipes-extended/redis/redis_7.2.12.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
index 6166769ffa..69f7a73f5d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -23,6 +23,7 @@ SRC_URI[sha256sum] = "6383b32ba8d246f41bbbb83663381f5a5f4c4713235433cec22fc4a47e
 CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2022-0543] = "not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged version"
 CVE_STATUS[CVE-2022-3734] = "not-applicable-config: only affects Windows"
+CVE_STATUS[CVE-2025-46686] = "disputed: upstream rejected because mitigating it would affect other functionality"
 
 inherit update-rc.d systemd useradd
 
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index 6527fb6996..997c962a96 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -23,6 +23,7 @@ RPROVIDES:${PN} = "virtual-redis"
 
 CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2025-27151] = "cpe-incorrect: the used version already contains the fix"
+CVE_STATUS[CVE-2025-46686] = "disputed: upstream rejected because mitigating it would affect other functionality"
 CVE_STATUS[CVE-2025-46817] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2025-46818] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2025-46819] = "cpe-incorrect: the used version already contains the fix"

