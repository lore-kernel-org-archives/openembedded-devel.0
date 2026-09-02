Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50843C624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:36 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9034.1788343526119500897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=saEI/z3n;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1200862a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343525; x=1788948325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zdgf9kYUj5tmmh2snFPdltnLBIA1hxRCkTabCggHR0=;
        b=saEI/z3nAt3dVNFMtU+i5cV5XAHVTR5MYEamE5l9jAg+B2wyre0cAuiZhum4/Qjleu
         5JLvL0yZzXOTKHdYH/SlTyxTcChO7PLwx56hjKiJupAyypz/cfxszkoOboI88Tz9Vkqr
         7feF6laMcnXd6+zA08hyb9qDRmo1rp4K15uAnlUKN2zstrIGPTJjN77dRCyek/KV+9MK
         zn/dS+2YsGig4wp7RT4fc7Glmx8k1X4KBnhLOiLT/h+YTa6TpLj8UM0adstLnH0JnWAN
         i8+ts+T0X0ZpluA29X2m0jfIiID5xS+JPy4hGwycPbc4HZswvjfR1t3sEe++UqRjdCqM
         m8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343525; x=1788948325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zdgf9kYUj5tmmh2snFPdltnLBIA1hxRCkTabCggHR0=;
        b=UnRhgUohCFzu6vo7rXqIBtjX+n1Gdj/8YpAzbwKR1V53GbY9CFl7Y+KAGavRpTgHPv
         89yG3RwMWV3K5DGaUeU2oKIlJmu4d2LPK9+3pyjlY5UsyRFLowi1qIdu9XW62O82hjK3
         fHnv+dEWIjKCIzqakWGMJdbLxzff/gNaQ4Qd9FtZZMXQAgTWOcwgfkN33ppbgfJr7oma
         R1ShlAd4ScP4CJZoSif7m8e08huylAUw4Gy1Ys99woUJD/r448yi01AoiXs9j6cBWg3o
         T/6aYf2Cdxd0sXDduYKtQfBYCQPn8gGnJuSzgka1CYSNnfGyC1rUi1Y/cvGLFtH0jQNF
         NRJw==
X-Gm-Message-State: AFuF++lLuw9XQqthJlMf9BCyv2m1xNuWYviErl+ge82/UnWEBZG7POKj
	LsPwiGd+h3YcicdUk3T1fyVvE0HxUaHicI70E4UlmiyxIzNOdhnGFYa4YtnkucC/
X-Gm-Gg: AYBFou3XEek8gkhU2FM8KGBykE/9q7TihNcHZvYpUqOtMQhtsHS+QMrLtzoWg3TWefB
	5agFGET4PQ4/RE+H4XlRRclkJFGYgNs2Z8qFpVYlvI5qf5mja0EZEjBiWAvqFAsIPC4CPsUzUX7
	i93Hei1iSChQkATbSue4E7eZLg3QYktH8iJQi0PZk9dAxbNYn/GIhM4od3+zoWbZPZoMy/PuL1I
	OpZslSpEHjpfgJot9LKnuQs6OrT6k9rHmRZDHe1E/GhBpnQ3Gu/QUy1LHKuIWEM61NJS+SW8NYY
	Ow5/GFFz4U1ro16E6Y/5vx+PABB4bynEfJMvT7/B0YKxVjd7V6itDZOGdEjLovdwBLK8yuTeb4s
	iB9y6ExQPJhpsYDWKHsisops+qKZNzRaapyFbuD3ltPL7LrbhcdYllP4iEFzLWlP425bhkay1nV
	dmOBwvQGkEpiV4wEVshpB5m/XF0rt04sLLN3KojowJcOd7nd2d+7YZGcWzEiNffoiGt5evfAMu
X-Received: by 2002:a17:90b:28cd:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39aee0e6633mr5457449a91.16.1788343525406;
        Wed, 02 Sep 2026 03:05:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 3/28] php: upgrade 8.5.9 -> 8.5.10
Date: Wed,  2 Sep 2026 22:04:45 +1200
Message-ID: <20260902100511.2105916-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129634

From: Jason Schonberg <schonm@gmail.com>

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.10

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit e5f8c8d53a49cc881dff5ce973fc21752bb50726)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.9.bb => php_8.5.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.9.bb => php_8.5.10.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.9.bb b/meta-oe/recipes-devtools/php/php_8.5.10.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.9.bb
rename to meta-oe/recipes-devtools/php/php_8.5.10.bb
index bc249fd0d3..aab18777c7 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.9.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.10.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "703c082ad9d2946ac647f3596812300d2c62b360d2f31a999021692a9b39476c"
+SRC_URI[sha256sum] = "d79bd4f3a9248e5cb5833766ba0d51cd35dd01b8727f23f30bcdba6fabc51d3e"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

