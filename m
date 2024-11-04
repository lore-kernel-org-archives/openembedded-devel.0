Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8474ED132DC
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:05:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.59768.1730732740088482025
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Nov 2024 07:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N/zKZTox;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so33881055e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730732738; x=1731337538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wuj4XuI1IRWngLSanjOJ7gM9j9K9zxAkLO9bcSFUYdg=;
        b=N/zKZToxal/grdFBuU39oE6lIujJJ5RKvS5ztX513vuls/3uvPEOA7r1hW1hEMNpti
         7K0bOHftX//PoGMAWswwSZt993JFd7btR03ilJRMa2EHaTrf7kwT1mtWQuQaSHV+dB9b
         Y7YnpSOVQL3b38XTYKmTMAXDUAlqcsZij8MxsDQllFofqI6yrpzaG2wwNm4q6iO/DcA1
         JGPoNpYS072d6mPuinASTr3b5vjwMsPOfqaRHH1f4LNP4vuArcD8wZsQpDBsR0OiY2e4
         8pSZNIoNitaMH4v2qqKKj7vDWT6/a9sBG4oP0kJsUU+vv1cq81bGbGWKr0Un7cB9yi9/
         J+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730732738; x=1731337538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wuj4XuI1IRWngLSanjOJ7gM9j9K9zxAkLO9bcSFUYdg=;
        b=Zd+fliEtKxQOPYSTR6PImGBraBUavf/oRIU9FJHO2/Xsj1F1RnqeYxMQS98pV8YFoH
         q94m9rJLohbunEsqCT833KssRpByEhEvVcLVzcPxULlSe/V+kTL+t0nZcMlea49oQZ4c
         +PEMqGnWEAk5uC64yuFVbvnuLJN0JaInKYCVAhxa4bCQtOuI7p6U+7FTZ9q0LD89FZss
         9arG+CETeAE0vN7+Kkgv4f/tNfXNx0orhAIPNtj8ChNkNFxd4WKshRJFOUhaeVMMhPT+
         wSZuehQWM8KTAP/lza08vM9RKncjWI/MrQCNB97pmQBUHKNkNrUqAIYntYhBNIKJxD40
         uIpg==
X-Gm-Message-State: AOJu0YxpL9Ap4XOV968kTbgTFrNbF5cSZThuM8H0gQPE5jrBvktNy2Dn
	toMyFhf5RgnhV+/Tub80nJppFR4nhrII3AkT8QhO4NZk3OIkqmjGOIaVFQ==
X-Google-Smtp-Source: AGHT+IFwfj6jO4vcc0dw+c0yirw3inqmyHSZmj0emH4M/0tdsCZyCal9f0lWe6YJHxvwVf78cHZqPA==
X-Received: by 2002:a05:6000:18a7:b0:37d:45ab:422b with SMTP id ffacd0b85a97d-381b708b694mr16292346f8f.31.1730732737979;
        Mon, 04 Nov 2024 07:05:37 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d414csm13340382f8f.26.2024.11.04.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:05:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: rajmohan r <semc.2042@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] unbound: update to latest to fix occasional build failure
Date: Mon,  4 Nov 2024 16:05:32 +0100
Message-ID: <20241104150532.1167022-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 15:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113406

buildhistory-diff shows few new files in testdata:

packages/core2-64-oe-linux/unbound/unbound-ptest: FILELIST: added "
  /usr/lib/unbound/ptest/tests/testdata/rpz_val_block.rpl
  /usr/lib/unbound/ptest/tests/testdata/serve_expired_ttl_reset.rpl
  /usr/lib/unbound/ptest/tests/testdata/val_negcache_ttl_prefetch.rpl
  /usr/lib/unbound/ptest/tests/testdata/val_negcache_ttl.rpl
  /usr/lib/unbound/ptest/tests/testdata/iter_max_global_quota.rpl
  /usr/lib/unbound/ptest/tests/testdata/iter_unverified_glue.rpl
  /usr/lib/unbound/ptest/tests/testdata/serve_expired_val_bogus.rpl
  /usr/lib/unbound/ptest/tests/testdata/iter_unverified_glue_fallback.rpl
  /usr/lib/unbound/ptest/tests/testdata/serve_expired_client_timeout_val_bogus.rpl
  /usr/lib/unbound/ptest/tests/testdata/serve_expired_client_timeout_val_insecure_delegation.rpl
  /usr/lib/unbound/ptest/tests/testdata/dns64_prefetch_cache.rpl"

wasn't tested in runtime, I don't use it, I just wanted to get rid of
random build failure from world builds (happens at least since kirkstone
which has 1.15.0).

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../unbound/{unbound_1.21.1.bb => unbound_1.22.0.bb}      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.21.1.bb => unbound_1.22.0.bb} (87%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.21.1.bb b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
similarity index 87%
rename from meta-networking/recipes-support/unbound/unbound_1.21.1.bb
rename to meta-networking/recipes-support/unbound/unbound_1.22.0.bb
index 9fc7e665ea..2f0c92dd9f 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.21.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.22.0.bb
@@ -12,7 +12,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
            file://run-ptest \
            "
-SRCREV = "b7c61d7cc256d6a174e6179622c7fa968272c259"
+
+# 17 commits after 1.22.0 tag:
+# https://github.com/NLnetLabs/unbound/compare/release-1.22.0...7985d17b57d25be262de56c29a43ae4b61c1b896
+# to include fix for occasional build failure:
+# https://github.com/NLnetLabs/unbound/commit/46cfbf313d812a6e50614a691e162b171dc91d7b
+PV .= "+git"
+SRCREV = "7985d17b57d25be262de56c29a43ae4b61c1b896"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
-- 
2.47.0


