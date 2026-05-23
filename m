Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26326CD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:02 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3026.1779512454230800834
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rBAbDBCb;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-83537a80ab6so5435536b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512454; x=1780117254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCJvrjXQ8BnofmZTnrMdLX3V5jqNNyWWNm+MFiLY00o=;
        b=rBAbDBCbOEjcu1HcLQvfMYXl0dhKN5dkODOCUeX19/hsSfKTGswIm6eQuT6xhvHeeU
         8AreyepOxH9GzcY1tKRcXymZNJM5y5cOhQvnW6eKgCh+XrpDy4nmDCQv4WtXWm3nhGS1
         gcg31YKYl4XnMV/dsW8tuXaOoEGmR8XJqWsPw+em5ZDvLIn/Ygc0qNZpeY00r92jhzSI
         KcXgq2drsOaej9XDhw7TgT3H+OWdY/8DNAij3nryoQRx3Naswa/QlRcXb69NBMIsdNNz
         nd229+KG82HWzyc5pOfz9z9zzKiZQCb+mBmzfHRLsWiQAI4EBI95vwfe8T1Rq0LSIgAs
         uurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512454; x=1780117254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DCJvrjXQ8BnofmZTnrMdLX3V5jqNNyWWNm+MFiLY00o=;
        b=Vhte+xIKb1bVnVNHA0B9SSzDgS1LT3Ihfy6t8o0lDTpRMA0y2nRuLYcZdTTwGhFfFR
         GZHTc+rVAWZIuvNfryWZUlSO8IHxcf7hrvKYnxAWjml/SjmFPAw5IEwwCyNaJ81m2EL+
         Ysfmcqy/3pPoVsluQ3yiTs/9zzI1398Hib3wJJ+RpJfuxbMTqbVi0IATeuwmtqtL+E1w
         DYsg44RziZttswXc1QQvqiBtQcwRGBcsjoF9WZdv6lcDslM3hLb3RDVoz/OWNFHe/P69
         wBaIYme92aTw7uurLaBbHIGsKLcQ2tJgfYlnd2BeC0Kh+LVfchD2WTloIItKgsOTc/C8
         WmZA==
X-Gm-Message-State: AOJu0YyPT1NRqQfq0dMGvuhuUDAhH5I4RQlXulW0jPa3oG1/Ojd0+VjB
	5FuoEcFwzxzCrUHdGKosEI8N4HtMBzC9nht5oHWjbEe4FXiJBh1MJd2HlqQISQzQ
X-Gm-Gg: Acq92OGNDpp0pn/NChKU1ES0VMCB8uCHJ7yZieVlhnyovr5WasNl+mBtkFQlM9AXuqx
	wWLEXVOWSx5KNpmQtPdkuXWI6nizmlvczpAYHqVM5yQPry9/7qvW8aTXZCYOh3NvY14qhhrniQR
	bHf6GbEPvHzsNSH8aNzKasdQ8Eyt0RB942SMOP7UvsX8/ATW6/Cwd5uxFX91zT0NVbBse3J1FAD
	D1B+aINll3LYXQ+6g2+ueETFyRaFJZpB/WxlhP/bydn6A6yJKKAF08+OSrOcIHQPwjrDiwNZUH9
	qbwjcucwPBDtwnYdw5rk9DdKWKA0/EhHVFJG5lvh1/PvtD0+4KY+BxmgOZqGDx5EFQE1dIBEqon
	90KJe90oCRP9Tz/hfYzsjZiTI4FanvetK/a6IOOS4IBAVfrXdo0gbIS5yJ5YnuM8MBJbKa4jRzS
	UHMHmATW70xAvVFQvH7xBQBkqSL46QsS54kr7u
X-Received: by 2002:a05:6a00:1817:b0:836:3f6a:3e77 with SMTP id d2e1a72fcca58-8415f17db99mr6641143b3a.17.1779512453539;
        Fri, 22 May 2026 22:00:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:00:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 6/25] python3-huey: upgrade 3.0.0 -> 3.0.1
Date: Sat, 23 May 2026 17:00:08 +1200
Message-ID: <20260523050028.848327-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127156

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix bug in redis version parsing when using Elasticache or any other that
  sends major/minor. redis-py incorrectly parses these as floats because
  there's only a single decimal, so the version check was breaking.
- Rename max task option --max-tasks (previously was --max_tasks).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c14a56b3581d43ba8665e86f17aa3b473d7dcb57)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-huey_3.0.0.bb => python3-huey_3.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.0.0.bb => python3-huey_3.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.0.0.bb b/meta-python/recipes-devtools/python/python3-huey_3.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.0.1.bb
index f07383ed45..cbca3cef31 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.0.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "0cfc83617b90132b0d375a3a3726aa7263cd461e7ae12af79b3a94e2630afaf5"
+SRC_URI[sha256sum] = "83ca54fa77c4ee27349393212fc13088142244f491be903f620a9e46e8fca4ce"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \

