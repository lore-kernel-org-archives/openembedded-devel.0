Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B542AE9272C
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:02 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44421.1767019915250885411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bkO0Ep/m;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so2879875e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019913; x=1767624713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/t9nDyCMpyg7Z5YHF5MERDuCZ9DRWNftnurVJPbbdE=;
        b=bkO0Ep/mYJynKSmBYb9gsy4gZWJA2Ornh2P2PgnuBcW1AoAInPU7Ybl3U54F+XDhJ1
         8YfqT+/cv9HdofjTZSwLc3yHTCJ/90lAXIaPVLW8n6g+2/Ny0XcN+DmrJaM5Gir6yYw5
         wt/xVmtgqpOnunYuySP7wxHgDoYqp50GQGWbIW2d87pJnZHb66oHJuuMiV6Q0hUyfjc2
         HvnuGH2MPfIYLFyPds0Nim0Pt+8MYzFwtQnr9ysqhJbR54rNHj/vL5Sx09g06ZYp6i+W
         dN0ea7ahRRzC/OiyPj/gwN11QW8Rzu8pHHoi+a/KtECYlnX5jmpv0Sy49d7LGc/Bjd+i
         AlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019913; x=1767624713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/t9nDyCMpyg7Z5YHF5MERDuCZ9DRWNftnurVJPbbdE=;
        b=K1oz7f3gu/gzH3zq2lHLagExxZYIuwrHsqiDzlK9oSJ9wNSsL80xZxAMnd3a5ikffd
         HEiiMvg0YlaNrW9s9Yp+3SqL4x6xyuWKkJxloKR2Ls2xwG5dVn3VYnVfsSwyz+c7qNZ4
         2T9cLOnSbUSpwmpbkkTP0V7lD/mfZPxMWe/mUr2SFRS+f2AF0i17OEwx9nwUlsPNPWI6
         ns+6CtgANtxNHX2rodzd0+oPb0OuJCA9W+puO9wyrxJe1p8UF9vVEFNOqcA9+5lhBVUo
         tXYiGLRVPz7W4XnfOwlXKE6rxYElfHBF2LgHWPyD5j6KAit9SeWAdtUVyxpkqSpb3ps0
         kpNQ==
X-Gm-Message-State: AOJu0YyW7QDevMPknGT84FYswNg1sf26mYYFzyOdbX6mngJp5dn2NBIY
	c7CEkVmCuHBxvkfnC9hRh4onG1X1kCe3udfa2CpPOlc5Tx1aPzQAvMaGVGOBFw==
X-Gm-Gg: AY/fxX562HGKz6Ym+D23L3usymEDwJj3UOgHHgE9II5dS6Is5xHM4qDDNd/E531GrMl
	zcRhx5oYZC+pdFYcY8yF7UpIrqgwmVB+pjRV+Enj7jZ6V7DBWVKTDmVxEfqGtfkbpOTMOn8OB09
	YP7SXPke0D9NgmSqVFLZWhbgUHcF/WdmHjaWPuRl0bx7u8taPvGviK6RIQdCeNDTetJpbB76gO8
	Dvh3xF089K3X1Q3UUHpRH8jWqq1WK7uyT9M1T45QnD8c4xFBKfcKqgAt8kB3IQkQezn3M1v9N5L
	IGpd6hgZ86Y7e5SN4E/fVmcDOjrY/X/xxYWV6m1lmxRK25V3wuy/NqmQJ4RhjzdKLqHI0jIcORw
	6f1koVkpRvyngoqWHhXvvcAn6c4KgV0OfCx3caLSmfCJffB8fH7O0ts8XCKofzDjgRm3XhrAtCd
	xxDb3U/R6T
X-Google-Smtp-Source: AGHT+IFQcBqaNeZO3WEUbph4FHAr7sk6AKurc3HBxUoOqeg1TJqwJCLgM/55vh8bY0dhx2dE2VvMEw==
X-Received: by 2002:a05:6000:230d:b0:430:fb00:108a with SMTP id ffacd0b85a97d-4324e3ebfddmr42064621f8f.2.1767019913243;
        Mon, 29 Dec 2025 06:51:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH 01/11] accountservice: ignore CVE-2023-3297
Date: Mon, 29 Dec 2025 15:51:42 +0100
Message-ID: <20251229145152.489068-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122980

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-3297

The vulnerability is triggered by a patch added by Ubuntu, and the vulnerable patch is
not present in the recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 071a45c9d76c9a222c8fbaa50089a8af44f44e74)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/accountsservice/accountsservice_23.13.9.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
index e3dfcfffff..c024ae3f92 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_23.13.9.bb
@@ -41,3 +41,5 @@ FILES:${PN} += " \
     ${datadir}/dbus-1 \
     ${datadir}/polkit-1 \
 "
+
+CVE_STATUS[CVE-2023-3297] = "not-applicable-platform: The vulnerability is Ubuntu specific"

