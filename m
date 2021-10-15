Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8873AC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:55:39 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.4281.1634338538070972284
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=V0lBsrUb;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id z11so46370667lfj.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DS/UdKI660g+n7RYN+nAinjrEwLfpKSr6EAeBV1pm8o=;
        b=V0lBsrUbQdG9JmaIeUPP+ABV0NyCFEh2cZIaQ3nYfItibPjDa7kUDx4q7PWuGQPMx8
         5ZpCX6aJyI8nvQ+RlMJS2puLUTv2ylyu+YgIWWm8WF7ttARn4DuPQMDEHS6xoOwFzImz
         Prb/TuR50AFBdg3AgXCeJiaWB4e2jtsBVhuPlOSPjRNKyzxVhPOOPAv8V7YUw9BMz2wp
         ozXbpjAeyec0r++znVNDyj2t3me/h3wDMnWX3ubQfM304niX1ZRbCkhBmcOJHziZ9PJZ
         fBONra7PhzjXjD7nPHzRSNOLbdZ17vUixcHbQHFO/eVgkIJ1HE+6mCjgISPW9g8xcoOO
         R6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DS/UdKI660g+n7RYN+nAinjrEwLfpKSr6EAeBV1pm8o=;
        b=DyM0YqEYNd9C/apt1de7wy9W68zEaWmILVAZ3CLI2GxehCC33kY9q2ausd3lnw5teE
         WoRF9YyoYrZO0d/c7AWVhokI1xftoQ8By0asm9JZk6FhcNGdlJLaq0E8LNJwBSlyHghm
         e7RfvxE5agJMI0erZOVGlxjMOjeqjthViZsV311JPGUdlJZYZl7dYWow82nm/x3zytuW
         DzIveNk5FeyxWTHc+RuW/3yfbhtgB/JjgIMyfjqXLdp1TeeUtLlgQNVVqg7dXRBEt/SJ
         61A1dkDk/Rmxkv0cUmlZlJGEdF8+VboWwlo8WfWXBm+AzqzGQghNOCPAYsT2wRrLHFXK
         hBgA==
X-Gm-Message-State: AOAM532DICsDyMK5odKsbTb6CFdkSMlMvC2+43hSAgwFpg8Vq6DCD1y1
	s5FzkwCqlyIuUCbZHb1iwCrEJp2BWGVB3GEk
X-Google-Smtp-Source: 
 ABdhPJyKo/T5g0LEj23KsRoNk5IGv4Pnh1cq603E4HI61aJgi3mzI8zdj3OKAel+LRnwQJ3286u0Xg==
X-Received: by 2002:a05:6512:2248:: with SMTP id
 i8mr14022479lfu.655.1634338536137;
        Fri, 15 Oct 2021 15:55:36 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 t82sm706839lff.50.2021.10.15.15.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:35 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pyephem: update to 4.1
Date: Sat, 16 Oct 2021 00:55:32 +0200
Message-Id: <20211015225532.4161566-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:55:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93335

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pyephem_4.0.0.2.bb => python3-pyephem_4.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_4.0.0.2.bb => python3-pyephem_4.1.bb} (77%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.0.0.2.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.bb
similarity index 77%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_4.0.0.2.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.bb
index ce2a80284..add445833 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.0.0.2.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://rhodesmill.org/pyephem/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c930b395b435b00bb13ec83b0c99f40"
 
-SRC_URI[sha256sum] = "d03de73ebf6a91681d597eb5b5d43bcf6f0c67e292bba2f9a974734b4f15757e"
+SRC_URI[sha256sum] = "c076794a511a34b5b91871c1cf6374dbc323ec69fca3f50eb718f20b171259d6"
 
 PYPI_PACKAGE = "ephem"
 
-- 
2.25.1


