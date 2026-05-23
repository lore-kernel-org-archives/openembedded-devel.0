Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54619CD4F54
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:02 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3070.1779512457184989199
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jkVzlk9j;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8413ac3d82fso2921136b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512456; x=1780117256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQGJW1erODsTZ12TcB82CtuzwEZhQX4ToK3PTw0CAVQ=;
        b=jkVzlk9jMi4GBVfMmchnvr+LeQWpOCg+4JLNzC3+j9dn0NbxafNe7DSzbaSpyEowhF
         hec+MMi2Q8Capq413gHDKcSPuvyX//sGJebgDkcHpy4QQw3xuCoYxF0zn6sTNJfEKSH8
         qKNcbr+sLT8cmK/IuHPONZNZLxNZkxLISeiNR5drMcN9zGsjfjJ7DdOBFY3bdcDz+Wyf
         hIv8Oner6VvYjEJaB4pskwD97Bsmal7ZvEpybgjFA0sxx+S7nDiC4j49fzk6gXAxciCM
         Vykfo5LbI6FpTM1MYvKHkwjhuzyrOAS9Ug0lSHC8/yffzHLcfiNyoOBavt6DSLQIgucX
         vCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512456; x=1780117256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BQGJW1erODsTZ12TcB82CtuzwEZhQX4ToK3PTw0CAVQ=;
        b=H3PdGwkdHNklvcj5oqDUAzg9FAZlHiXuhnwkw9jVnZB4saIHE9Vht77OLO34m5owJM
         ojCKu7itgBD8OOSxujh6LJndW+O/88jN2t16NxHY7INVsGwLclCetD0/vJmedMPnFr2w
         1tikdQdks0JEvJYrztAJ9mfMswdOBeY1RWUpUVLQuNqg2nQFwro+TKeRvNfS1csE8U61
         veVibgzJpiLXFsfOhpLAsZWBe8FthLQizIz5L4Vm0mXUJiP57St01Z9I6TqtRt6M6AlD
         VEIHm3UwuJf6SxyNBv6FonWMTXEne87xngcb3WPTxlgKPAULdMqijZSC7JPOgmF57vZb
         QB9w==
X-Gm-Message-State: AOJu0Yx7ExE/M6syMlhApAtj7D5bmXqVbJnjDoe299RQ/xhIX9UPQvcD
	WO0qMdQRiS81COyXNZ/a7KyEdpe4Hg9nF6qG3n77aqp+c6xNs+QBzE+09AlP9f8Y
X-Gm-Gg: Acq92OEPj5jJQ/KrYsJKYZjdwonQbJd4yoadDdHh/aaRTpxb6bIsZbb/LSc7ROVjFS/
	SxbG/mc4iqSQTner0V0in6k2HBvwggKft8fp0VFZyWzRdXiOohMyGjgftN/kNokRtOYzfJTtIrn
	ggzjdqx8Z4Q6tOvBiJH5dp9P9gZmfcU0aIcCLbN33Bg11WxZxGIKvKpSgrkQGB1N8M8/jDNhARY
	eB0U+sBfEGNpG/sph319L3qkbywMz4yKyK79z3x+aK+lB2JoC0DBscJbUPGrfU1zvxNCZR7Ve4t
	UuzdD70IFFXzvVCbnjpNDrN7G6HPPoIxIsExOFgZbKhep+G2ZBFj59a9obzR0Nb809zPK9bQiZY
	yz+XKhfHH3DEFYL+qzotTEcxhPO8kUUPAjXGSeAYceejlCUHUv9uYEtXncrFyKn8BGPxeVknxKJ
	7lhN5ITolqIcYjkaATPlHQ8r97+DieuRRuGuMjnPcHzbi8Cf4=
X-Received: by 2002:a05:6a00:cc7:b0:83e:d427:9817 with SMTP id d2e1a72fcca58-8415f1560b9mr6159631b3a.11.1779512456507;
        Fri, 22 May 2026 22:00:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:00:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][wrynose][PATCH 7/25] python3-django: upgrade 5.2.13 -> 5.2.14
Date: Sat, 23 May 2026 17:00:09 +1200
Message-ID: <20260523050028.848327-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127157

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/5.2.14/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ef903fca830e8bc31294ca2bec4957e85c4418b1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.13.bb => python3-django_5.2.14.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.13.bb => python3-django_5.2.14.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.13.bb b/meta-python/recipes-devtools/python/python3-django_5.2.14.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.13.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.14.bb
index fcf50e939d..e9bfabc734 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.13.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.14.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "a31589db5188d074c63f0945c3888fad104627dfcc236fb2b97f71f89da33bc4"
+SRC_URI[sha256sum] = "58a63ba841662e5c686b57ba1fec52ddd68c0b93bd96ac3029d55728f00bf8a2"

