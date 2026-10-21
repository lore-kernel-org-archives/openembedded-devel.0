Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.295.1792593733631016676
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 07:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xlg3LgWV;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67989a98f8bso536262d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792593733; x=1793198533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmPVwxbupRU2wpgFde5/IoquKy9lV8ryNld7oJXhQvE=;
        b=Xlg3LgWVcHeneffClu2zdjpCgeBb7g44t5Hw7kbfvhtpTDvr8Zespgfltj2aXwmE3L
         7FoFaX2ARhzEUJt4ypom7Bt2gJ3cKa8n0jlJxmp23QJUml/D+LA2N4MRu0UrFae4ZAGr
         6fqWAvLmerFiNZc9pz0hYQjU1RkfX+zlnpjyXmGTPXNtzYY9rbnZYCQkFHFE0jDSWZz1
         NRLfPtk0tQLxUHhHoDK7YiEJlW9vs+M0Wbk0JTgUtxh3lMKdCgqe2+6U9n2KqMtzO2gD
         g3UC9S5uopWxsQRfu/HjdLCUe8hod8sSZfmtx5x9BGEFWV8X/W9HKqR5vRvbbd6UeZBm
         rQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593733; x=1793198533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmPVwxbupRU2wpgFde5/IoquKy9lV8ryNld7oJXhQvE=;
        b=c3fdkVR61TDae9Uj+0WNLUemmOBb82g3FiCNz3MkP5f5vZGxL+bbuhhrdoZcy9YcX+
         32Q7R7z/Bdc2DesL43q2CSc4+uCS6tLoFlC3pcwfKEutdTuL0hJhYyVX1newlIJ9tZVX
         xozbjumS6JtYCIuBVqTDSwsWo0IhGIxc4xFlTlwwMryTooMg4L4nu26Rm7q+cwzzIE+4
         yklgFdASp+36yBrHKmEnW7jZRKsi6H/FpYkw9FoB88RFGSseSwHYHdb93Wv87GK0grqR
         jZDQsTfODoJ6/7LDBOlEX9Q4UGS1M0w7xlKdlwVmMuA3KCgMW/5WEZGCzoQYNGj9tnID
         r+cQ==
X-Gm-Message-State: AFq9FYLKkLwdgG51NmtWQCsR13KjeEZU5RF5SzoBuBmlRtGCkEysXOle
	u0fPOzas0ODp0cxqDbWMTyjVRpi/GM5W8yFJShhw4y0Stq/TPjs+DVBdrSNiYffx
X-Gm-Gg: AYBFou0qaP6RhzGSIen663+kLY/elQX1Ahg3lib/CdO3BcH8aDUIFGNirfjg4DxKu4a
	2SsKl+w73mlBlvlfP2WkT45QCGGFKxD5McQ6vMKT8ZjqY/J/BfSl3z1QRbPcwN2HqWH9/myQevF
	a72+FM1KOsNP+gVE+hrwhHI/mKAH8A5QSeqH8Ctl7PhsuwgGeXR19Af5imSLQX0y5O9uLiFxeB/
	/fkn2cmyBIJiFT1mL2bF/GS2HZiEPAPDF1mmawiOi1skdBi9OjNiyjeS+V1p95DMKGNcGwTAl8V
	inse8SBaR3yP/lGa3MfoJmO0Yv3qk5fDm7Sde0fvoKJ+5P1SuHBUwE1VPyoTseWbdg2vpHsUnX2
	EhEPC3eWjn79HAngqGZ4N6W92avx02zOA4ROF8g7QvkHqGxIeOPrawFL6MM2NyUF1R/qZ3Y/nhu
	t4DNYBD7WEpPOH+1uRdzdI3P5inPo2KLL+1ou8oRJ8j4W50DuKGFRItybDP+rpvr8zeElUstiKL
	TsV3zrxpf/tjvV73yvQN3BaPBNmDL58f21/8vtiFZaMOnz5hkmZXOYeM8z0QkzX+TMlLkHD2S+3
	ygE1K0ngNCYErRy8N/ALiLnpbCPKvzaer5iRSuojWxaxJcG0fTiQNgev7qrRD7SPyduo9P6wbk1
	PQSw=
X-Received: by 2002:a05:690e:4293:20b0:676:97e6:d7ac with SMTP id 956f58d0204a3-67a0e4e778bmr812972d50.43.1792593732278;
        Wed, 21 Oct 2026 07:42:12 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e4c939bsm1114382d50.11.2026.10.21.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:42:11 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.11 -> 8.5.12
Date: Wed, 21 Oct 2026 10:41:58 -0400
Message-ID: <20261021144158.3061920-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 14:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131301
Content-Type: text/plain; charset="utf-8"

This is a security update.  Fixes unauthenticated remote code execution.

CVE-2026-109618 CVE-2026-109619

Advisory: https://www.php.net/archive/2026.php#2026-10-21-5

Changelog: https://www.php.net/ChangeLog-8.php#8.5.12

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.11.bb b/meta-oe/recipes-devtools/php/php_8.5.12.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.11.bb
rename to meta-oe/recipes-devtools/php/php_8.5.12.bb
index 831e926880..f9759cf7a5 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.11.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.12.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "dc940716a8c73e531c0078eecb955d595d321ec2cc9d47149cf0089ea6e18f64"
+SRC_URI[sha256sum] = "ffb60edc437ced63b5137e4984db379a8111c50049c711510d8b958277efc1a8"
 
 CVE_PRODUCT = "php:php php_group:php"
 
-- 
2.43.0

