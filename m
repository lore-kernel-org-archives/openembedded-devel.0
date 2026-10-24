Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3746.1792837522607952511
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Oct 2026 03:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pt0oylYT;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e812e2b31bso9394885ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 03:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792837522; x=1793442322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lLDN0//EX8Pvx+zWYdB/NeMG0Ymm8nrRSoHh1G6oac=;
        b=pt0oylYTV9NiHgTvPx/cn5Gc8kIKWE/EKF8AU1ovt9kkGhDMAAQlXAKcUjUfaqBjek
         hHY5GBMm+oYkFA6Y+dBdfWxbRa6vYKV1z1I0s7sh5J1ffycKLn5YIg7WgYNeK3dxmIW4
         WRF+/YbUYCzu8CfYuLkvv67p/RbRQd9jaK3TogP/ZTGs6u3W3hWT/cRiQgcGRw6yGIw/
         bzLXESNDKdFzzof6MG0QDf0JebfN5EvMDVDsdNBIR+7H5VMARYbJutl2aAb5ngcJDjPb
         Y8Yu8Ct6tTve4tVv6LTk9G6tf4TkVBosVTBBlOOM5jOh5LQrX9iX64IkT3el2XvotlzK
         8xPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837522; x=1793442322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lLDN0//EX8Pvx+zWYdB/NeMG0Ymm8nrRSoHh1G6oac=;
        b=ryj62rH8WYp/E4OlticHUelRuHIdC1F03Dfwdf0+LT+ehvoaej/bSyH8wuH3aBzY9A
         ByQoVT2OYurdR6MhmkkGDv7slCkhoEspfMwuY+JJchrmML0MnVwptapj4D183kr8cJ4X
         5EP5oiedKMJ31ylPKAGSv7N89UIgcNm+MA47QNDh+8m4m+s87e60xMNWVpT+DztFV/0J
         V6i/wBAJRpB8B+xlF0SWJ9rop05it5RwVh4/QS766ztYdw/zLrG7Loq0G6oRZu0S9KRl
         xnI8gLyZE0OoLCbEicvsCC+JKs0Eoovy51nhTdu0LMj+HkAOlTlOAq5+lfR0e1h6rC3b
         Ur3Q==
X-Gm-Message-State: AFq9FYL0fEieWU77pIEWCQkny/963QhcYBUWty7/UqBD+l8wAPBCDmQF
	uc5Js+bsQeHELSZhpBEzAs7O/mZTOR5L8jXrwWS1+RxoX1SA6/4aTzMltmg2nGUA
X-Gm-Gg: AYBFou3gIipM7Y1ITI8rRE3a/b694q8T14KjvZ8tMOjuYPvL3rRffWweZ2Qh2hYAGuP
	N/9xrMoGcQnrKjgBPQ6asm3c0qJHCFgglOaqQKqROkEvt26vmCc82/tGBbK0VwGc0l/7NI7n+Z9
	KsQb56TXtFKJMSxsnRKmzuhQlCd6pkThvOmOEHALqr4A814mYVqxhp3OdT9kXgzelW0d/f53b6O
	He9JaaoPizUHvnkZn3btQe6hlkTYxuXZkNPBTSfJ3IPg4DDTUnti5/g869R97QlhIjCVZxNrbFN
	JnN6Y1Ugg3vircAAY1HHEOx/OIi5OJvUTmGFr0J4CliH/SIY+EmLqGl1kEy4bMkhkaTwTlo5T78
	U8yRRlm0k9B6bhXIDeBDTd6fmotr9meLZtKIWILrvxqWYa+274BMMvwZwJHDVAdgdYMbXzHOJxr
	g671CPmswMX87KdGmBXXz/m3oXt6GirGnnfgObXTphHPUWO+U3DcLd4bimZrskV8WUQpqoRsOZI
	egqkPSYsMGEL5IdIQuNinRr3iQJ9H8grENGPRF3nX+IQWJMYF8wfUuI1HtqA0zE6qZXCjfZZPWz
	8KM+3P4rzyUMb7xepAwCtGRQfKuE9uQt5wRIkySAh78emFOtzPsb
X-Received: by 2002:a17:903:1b2c:b0:2e9:4175:3070 with SMTP id d9443c01a7336-2ea9c0c9439mr14098345ad.2.1792837521710;
        Sat, 24 Oct 2026 03:25:21 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1dfee1sm4293935ad.64.2026.10.24.03.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:25:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/7] rabbitmq-c: upgrade 0.18.0 -> 0.18.1
Date: Sat, 24 Oct 2026 23:25:03 +1300
Message-ID: <20261024102507.2256303-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
References: <20261024102507.2256303-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 24 Oct 2026 10:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131395
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/alanxz/rabbitmq-c/releases/tag/v0.18.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.18.0.bb => rabbitmq-c_0.18.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.18.0.bb => rabbitmq-c_0.18.1.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.18.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.18.1.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.18.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.18.1.bb
index afeb5141f4..c58d4e1145 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.18.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.18.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https;tag=v${PV} \
 "
-SRCREV = "b0b5f3774a216bcae9f31645c4ab581f718bd211"
+SRCREV = "dc22a7fa21522788310ec7f3f49bc3f028150b22"
 
 
 DEPENDS = "popt openssl"
