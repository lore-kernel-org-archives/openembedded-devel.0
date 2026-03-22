Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30053FC72C1
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:52:01 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28531.1774176715639975154
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b7wDxWyy;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b0586d5bb8so23442755ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774176715; x=1774781515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEBI7E1vtEa2Bi6mxTyVFfvwGqOKsldKZx29NQ3UtHk=;
        b=b7wDxWyyfV738uB2/drrqNfTvBmTpHKDu2q1qyxVqfacbpX953cUPQkURemdBb9FhX
         gFI+THagVyHctIbddjzk2spz5qxBO5JY7maR9Q9ZBtXFsMbZe3tUTJu4WWCHpVO01ZD7
         lZSuMx4S/mdP/Bnzksnr2AWTay/K3PW/0S5vbnr+HFAaFO/cyFhZPFZ895bUaY5X6GR5
         xPcbIW3TZtR9fyfA8n/WoDT97CE7zzrcAuyF4oEks1dL2+jYhcqK2vLGp1kfXTw278KY
         8AoVdrmGe58ZpeCz5c05IcyZorodo0klUVFI5+8YsHX+Kwbo89Y2TMjjxmwEp9rZVpjr
         Y20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774176715; x=1774781515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AEBI7E1vtEa2Bi6mxTyVFfvwGqOKsldKZx29NQ3UtHk=;
        b=rNXyUH/PRlEX8IVxKm1J81DRVDW7yF+n+yB+yJjhPxs7TTkKIyYqK92KY6S0O0bKwL
         1JHQX9xWbyvXvU2jgjeYvSQRfEEgHJxlDA+NpmiGvrX/8YRloIMHdjvyDYAKrIDcdDsG
         KgCHspahjVeH4Fd8JraFt/pajXCtDhsBwKWgxJ4yLDg9OyrS5wBExjMRXWQYGImkzEKy
         gcqg+tGcqQDJne3yeYOyGiGvr1/Sm0myj3fuw0UVUufE4tKsMV45kFuG90BNhp9nNLlE
         a1bOaeJ097Xo+fLv9p/mF+lvvzUBHHTzbFCHTXaU9DkMI8XoUAZLVFYroY66Lq5zFb3O
         qTBg==
X-Gm-Message-State: AOJu0YwjzVt+7bnkRHH3nYSsaxD9uWMRKwQ5OYItN5nJ204G/39VlZ+n
	xTr13TmFBfuxeWnbPGlUWt/nbQGQ8QWIka5aTi/ahtWDhY3XAcgumkk1P7UOPNcR
X-Gm-Gg: ATEYQzwxkWKwEORS0m6OwQhUzNn+L+dwNEbKzGuSBYjFe7ukveD/sDgBXdwQXuKMExQ
	X8x8BzDGyEy8bW65k3qiSEVLS0YsP+GEZgdJ5HopUIIr5JjcxFG4C5dkTCzqZkJGmkSXsdKNUN1
	vWH6Zi07JKjiyQsSLM5K0tpEFmOtaQ6smldN0WP7EYX46Oasa7p2p1Tesr2t8S4/rNHqro3FAEs
	Z1YhrodnuN2wseVkADYC+LptyR1UOoMpnQ2vbJYrnbsF75Ip5WNqjfIMglB/yWPxXoLU7F1nP6p
	x+5b41jmEakHbosGojnuQyGlUOed4ThDZp4VErfpQjl8YZsuKQH79qtncjbk31DfGUPNu5MeVyR
	UdAvOpHuAaJZlRHAs+YNd0ZtSEO+LRQnBDR6qB9jbvMHYrpCv8oCsVC8iVlsBwCxLBQTjVTs0b5
	IsNH91YrRkzQKMwDab5BBFUx7vyAhEMK/1DQ0=
X-Received: by 2002:a17:903:2b0f:b0:2ae:66c9:4953 with SMTP id d9443c01a7336-2b0826c6681mr100944905ad.9.1774176714786;
        Sun, 22 Mar 2026 03:51:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836744a5sm75613895ad.63.2026.03.22.03.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 03:51:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Aviv Daum <aviv.daum@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 3/4] lldpd: fix xml PACKAGECONFIG dependency
Date: Sun, 22 Mar 2026 23:51:24 +1300
Message-ID: <20260322105125.528264-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322105125.528264-1-ankur.tyagi85@gmail.com>
References: <20260322105125.528264-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125481

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

