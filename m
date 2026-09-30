Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B48CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:31:05 +0000 (UTC)
Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.133.1790811055300971811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MA71GVhm;
 spf=pass (domain: gmail.com, ip: 74.125.228.38, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88582e2153eso1871334b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811055; x=1791415855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXiDR/NuJG4yI+FDfQGp4zbSiGUbgYgJD1Ud17PfI0w=;
        b=MA71GVhmlHYJQ8zLMYedFTeh1prk0Pu6Q67jHuL0N31x1wHf9sBuxx6bfkVcyy7o9k
         +JZuOP+LZGQHuepB5FYB+jXr6N/EkY+Ul40D/4kDTUtrjf+pTwj6YPZ0wVNg31uW9jNY
         N/q4mpinNkcIfXMSENBJuVKFN77cLjmxQZ39AJyeu0Q1iCOLRPRhD/Sp2uawkUhzbjt1
         uNZE8nvjCDZnvYml+dvhHzU4GS6FHRpRAEkiJ/J0jlVDvCjmhSzfaxmNvfF6NGE/Hjg9
         ok73BXzN+klpqSEKUbiwlSZ4RulhpATfpI/ZLjqjoJy5p0vYW97od2XiV+xbdQFa6anE
         4WQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811055; x=1791415855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXiDR/NuJG4yI+FDfQGp4zbSiGUbgYgJD1Ud17PfI0w=;
        b=ExiS6lfZYdxUidJmYi5raUzql6BLb1e4X1MKFJNfVMFGjKChBA+k6jMvkKDSEl1lZB
         jd/UHm3qU5xLzsKf/WnO38vA6xPLLdY7cRrIN7yj2eVGvb8q0NUuEYwE9SkiBNMJy6++
         LeWgWMjyl+WKHsEgPb610+tTzyUx4n9G2g4DCu4elIjsoH1mqmXtZ/CeY/9aglriKLXL
         Dzxnp8k3CwNMc46l3Z5BYLHbg2IZFkIvMbF+5NAUHi/dmKsaICWIc9TkA6yxaG2epn/Y
         vtHmpRdJ07zfvzaSIGNHaRLlvIzydV3i0W0bhk1w0PvTBw+5H/vo8JfPzwkXOpFbEtaw
         2PIw==
X-Gm-Message-State: AFuF++kYHFeCNI6DvMNJeo8vyTcJScUmhGJfOss9Dw7pv/MkWfx7pDCx
	1Hdp1D0qNByVgY6wVEbJPT5WmwkWqJAiqUw+LGu5tWnmsEdyfPPyAOf6C3YIyg==
X-Gm-Gg: AYBFou3HLrEki/Mmq1eFfpLR9I/pGwn4LX2ZYqQfX8rXPQ9stks0ZL4LTuaFUv1yRMQ
	6OXA8ymq17J9TtKyQje988xoq4VnT5hI6LBOkqgLiZ2MRJcWnVEeqFaHQKtw8UQ+MmVJk2USGe5
	tCRLXIRMw0L4hRUkvIGvkCEiuJGsyFNcgTmEn9AziyaWDPWteWpAvNupFWXRXfEK7YhILqWNPLK
	/q1mkv6mI9RQmWaannhMOPwxm38pWmwjjJMh+HCqU4wR9KrR8a5AksyYmvgNFJNI4gXjG6flDV8
	kISdA9U2hL6HxFCjenf7efnqbZc9M+zmCtT83+cvWFZ1elaHEg1jbqCf6yHf0qZHBkJcvfmLJU7
	n+5LOixagBh55CyGejONVtUaxiifixahua1BajvGy06Gpy8Nf1jRtO/oUsvO5M7vT62OU9ZQPda
	vXccxZcV/h3U/3wFASuyL9GXpC6IC6OvKdmBvPnuaV2wCfRw63gURX2IJAMhN5QoSBWxzMuBHAB
	Bmf3/EBfLrWI6lUe63PDBc=
X-Received: by 2002:a05:6a00:a83:b0:885:ead7:1ca9 with SMTP id d2e1a72fcca58-8874c8d3165mr1983737b3a.54.1790811054461;
        Wed, 30 Sep 2026 16:30:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:30:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 6/14] owfs: add UPSTREAM_CHECK_GITTAGREGEX variable
Date: Thu,  1 Oct 2026 12:30:26 +1300
Message-ID: <20260930233034.659237-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130539

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version owfs
...
INFO: Current version: 3.2p4
INFO: Latest version: 3.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
index 924d774ae7..7351b54f8b 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p4.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/owfs/owfs;branch=master;protocol=https;tag=v${PV} \
            file://owserver \
            "
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+p\d+)"
 
 inherit autotools-brokensep update-rc.d pkgconfig systemd
 

