Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1967.1795113506030263126
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XSkhOjrX;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so95508b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113505; x=1795718305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G02u5csT10sC28I5ejsE9FpQRxHvf5Sp+xyFp0NCV4A=;
        b=XSkhOjrX8DhyDFv+UGrtX0D+we6GFZ/rRhBDetJ9C/HGYHNn79A61+ow+QNHe2Dm2i
         x1CTDJISlEc1NbFtdwXiBPyfz3ESz2Cd7l5FL8f79hsmeBEH+3JBiZrGshakMAGEHyYP
         BIgsSXZckqUuac7THYMvOla0LR29u6mpG8WP4aLrTv5ZWX4wttfExCyTbBf2ik8+iFmr
         K1jeYzEYPI+5GFgWUOZTZiLywzp1LFi49DJ90kr1nGckKXO6aG6CWFMEVXKgnJy6WCFH
         +yxrcripIdgjgf52FTshtbCgDDrYaEZBoCw3/eK1NPK52Z+YjjAfLi7bWiyJf6Yi66Si
         WZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113505; x=1795718305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G02u5csT10sC28I5ejsE9FpQRxHvf5Sp+xyFp0NCV4A=;
        b=lRHa16TOZ8P5BVxanolHYvTJATZ6IcnKa7/VHkuY5FVHnwQGbRU+xhvWCqL8/TD9ZB
         XGShQ/1oJNgydqVxxzMyTyfssdokJ3UykUY6sUedRRDEMQF1a6YoShSKGxS/ZFghwCwZ
         /mKc/AehMamu3eYLkJkGNhf+8wkbwmr9E+v24YvVTUbBe29lqjmAftR4YDooJKQhofwC
         jbT0ItMdu2QhgIeJxd5b+UHZ0xynD5BPTcHFAdSre4nB4p/Da3xM6Ll9x3M9YeAPueTk
         iMwImR6zM2ql4mI6Xe6/hCYk3aEJ6bgZEgvFjsDlCL69JrCD4xFScFyowYC5Kl1LGf6m
         OHuw==
X-Gm-Message-State: APuU4Z+HxhHKdhEIYOsvyFXXouxtspXwplcqNRh0jmY8yTSZZL1rvylc
	ZX6Plxx5wQjJltEmrs+wiSSaQ7g+JcOxSnjEDIAwFV8qlzZxZ+XfWeDoB4srWA==
X-Gm-Gg: AYBFou02trDwC5aYET9ewoQfmDIiLUQizsiH3e8s3YgqumPaMjnNOljwCHKYA7G46vh
	dGDMLHB4BAyYLKgpZrHt++Y06Z1ydxnFVkDryb3leHhco5tgc3e+/yENwsdPJLxEkodyIvU4Eps
	Gnfdp8Pds9U1mHYzR/h1NYMFlRz+ekonypxcCfH2uCDEGF30w5R6ImUJXTQe9YJO8tOEflIz/XW
	PI4sv8RVRT1f8aZZQf9a+nQYP34rQwH19jXCajyXrW9sAPrq+EMzK8vFe3g0vWJt6WchuegnsV4
	2WaOl4RYmb72FkOXuErTPPOuHf7iSKM/0zIh595Ksm5CppD+esNLj3MioBnXuvdk2H1aWrycUc3
	PM3sd/MZKExQdEp0CF4RTbq9IOSbhLj8zTA41M2PxCzrU510PzuaJk9chr+zzfRSaSCuD09IuEr
	wUtynFLfig6h5r5o74owpDWOdIz7i1HCuqCDbujTmaOGe8DF7zeC43X00y+cHnexSlM1cJCyIF2
	Q6FdRX1zoK4Hj9zJ9zFtMLxq0FFkCsf5VuG24wY3nFwyj95KUVB+DZnjkJYIUmtc9pJ7KMe81Oi
	6lNAznGeKlnjL1HDo9GnKRS4Qwy3ffWhJmDRwDLO9RO71v8c01yKTsCmeRg2u2oD
X-Received: by 2002:a05:6a00:3c84:b0:89e:ba55:119a with SMTP id d2e1a72fcca58-8c87d123bd5mr470719b3a.47.1795113505435;
        Thu, 19 Nov 2026 10:38:25 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:25 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 58/64] mongodb: ignore CVE-2025-14911
Date: Fri, 20 Nov 2026 07:33:26 +1300
Message-ID: <7d9eb9deeb2422cd6346aa98f85f2659596af3d6.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132748
Content-Type: text/plain; charset="utf-8"

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14911

The CVE is currently tracked without valid CPE. The vulnerability
affects mongo-c-driver component, not mongodb. They are also stored
in different repositories.

Due to this, ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 272e975c34e5bd8863e72477c461755839932d88)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index ccae6e9dcd..e7a4d1e34b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -51,6 +51,7 @@ SRC_URI:append:toolchain-clang = "\
 
 CVE_STATUS[CVE-2014-8180] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
 CVE_STATUS[CVE-2017-2665] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
+CVE_STATUS[CVE-2025-14911] = "cpe-incorrect: The vulnerability is about mongo-c-driver application, not mongodb"
 
 COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
 
