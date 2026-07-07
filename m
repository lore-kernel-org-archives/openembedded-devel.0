Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC101C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:05:15 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.172824.1783429507159711306
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XQnYh6K+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47de008b020so369136f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 06:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783429505; x=1784034305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jijy1lYhqIonT/hQHw2dXR/P/crMvRREpFFF9StQfUw=;
        b=XQnYh6K+Xxi/2f6UOfojSqBHGizXeE5Ej15A4qkey+9SU5HKhy+OqYmE9CTVvHJ02n
         1ubdXCapTbMKAlhY8xxrRhd3YnObSavuMtCQI8Ynv9ChKeWEvuAMwBIuCk4/b3olH6nB
         GAfyL79UTUW/QoCX+HrfICzXS83Q0g/Oo+YPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429505; x=1784034305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jijy1lYhqIonT/hQHw2dXR/P/crMvRREpFFF9StQfUw=;
        b=WmsIBdW1nH8wk4XS5OyrXgPjtdGBk+7CPQyHLErY6wSP896oB4Zuf3WnbMt7kmeOho
         lHMxOotWJanHyH9gjqdmq09upf/7mUabjradnUdA9isYHxzyfjCX6NmrtSYNEfkbszUC
         ZIgBFSX7aJcaHXa1NkjVLreXWcFKfJao3A0dp+L63N68qR18LKKeuK8FKnVFgFPwHwRo
         GZzietjmqHyTdlf5Iep/MwCxc9W7XBb0ze3TsK/pBEWx8GN/Nww+XYeDOyKFlvN5oKFp
         ocsrkeLLNRGnRU91JOA692mdqQ7O4JNy+Ie2/xyOi+gT1ET9SljdJqJIsBV3ZDqXkKBr
         2nlw==
X-Gm-Message-State: AOJu0YxqqEJ3enP/EJZaQ+p+GxIDUt43hoorue8FfyAM5P4sVkTeVvZw
	dmTNYgjfEpImV0l5zh8r/y3H8AvqR3VSTaOm9oZP1hphmhr3ool+ey8nr2K7Y4kXaTT7ujIjKhC
	aECXi
X-Gm-Gg: AfdE7cltj/RfHJgE0Z1RXRMX5Dua9RxMdGr5SUl+CNphRvQx8l8W7bc864Psv+80i0P
	h/9c+WOfvP+Nxm3iLdnqG0sgVqTtuKtYsPPMjkjoi0S1zscuuMF5dGxljuhqho5ro47N4zjwcPi
	ro7DyE+pAQojWqe7GAQ7YNzAe29XaP6QNcDNAJjI936YqkGmdcdz/NLLUuqj8G5jDRiJ1Sb5qU1
	PxEs0JrunNDa0gIBcX2b/Ae+HQMXNeXbN1isl5/rc1jTL/ZwIwhLBvYN0k58lNw7axyYD7gcj7C
	Au+rEDInm77M/BeHkd20Q77NnbO2dJwAhKTL1qWl9yVZtOfJJqDZG6y/BL8zfDjQNoJXJnDOMmm
	48JFU2lXUEtdEhBqgTF0SfJGhWCHfGK4s9EG9MeDfbzz6vy77Go3+P3PrVvSoM7FWIvAPXwFYv1
	f/SK/Oxp7gkZz0DTpohKk8aSxrjcupg9Qbub3Cr6bih3+XqPQm+jpQqNw6xXTwKTiVQmoHSyKc/
	cIdSOrmo3r9oC/o12DADPo/37gldkOikrQ1TVxPqg==
X-Received: by 2002:adf:f051:0:b0:475:f0c2:75b0 with SMTP id ffacd0b85a97d-47de9a39ca1mr2439113f8f.27.1783429505143;
        Tue, 07 Jul 2026 06:05:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm33986385f8f.3.2026.07.07.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:05:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-filelock: Upgrade 3.29.4 -> 3.29.6
Date: Tue,  7 Jul 2026 16:04:57 +0300
Message-ID: <20260707130500.888218-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 13:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128061

Upgrade to release 3.29.6:

- serialise singleton construction in FileLockMeta
- _util: drop the dead st_mtime=0 short-circuit in
  raise_on_not_writable_file
- test: silence fork DeprecationWarning on 3.15

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-filelock_3.29.4.bb => python3-filelock_3.29.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.29.4.bb => python3-filelock_3.29.6.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.29.4.bb b/meta-python/recipes-devtools/python/python3-filelock_3.29.6.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.29.4.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.29.6.bb
index 1510e89760..75e29dab4e 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.29.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.29.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "10cdb3656fc44541cdf30652a93fb10ec6b05325620eb316bd26893e4201538a"
+SRC_URI[sha256sum] = "895c532ef3f4ef04972b9446a8c4e2931a5c399ff3c4be4c9369f2639b80f793"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


