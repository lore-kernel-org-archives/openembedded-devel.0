Return-Path: <sebastien.lefevre@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EADCAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 12:43:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.21703.1758113020146566613
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 05:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=myXw2/PV;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: sebastien.lefevre@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3e9c5faa858so3857963f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758113018; x=1758717818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B5BFPG1On15BiZKPBNeqIcYhL43xfl5gynhdxYICBvM=;
        b=myXw2/PVACIhyaU9sbbVOwbQXcrD0o6TX5BSICLjKDxPOe0r67pwJneJU4AVQFKHXE
         GaCy8lH/tDe3lqGWfPOoOJufzjTjvGpr7zuUjaIYmG31yYrBxE7Td1UuUywF3EHEN/gZ
         FRzDnQvo54vQnJgSmdEgSmnjtm6p7lmlYROBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758113018; x=1758717818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5BFPG1On15BiZKPBNeqIcYhL43xfl5gynhdxYICBvM=;
        b=ci4PaxQAVXINdJPN1dCGwrEIzb+glVVqWvc3revTTvwKo9jUddbVp3zOVCqKl9sWeF
         uSgz60DVUa0Ohh/Xj6JuPN0h4vVacZFjwdMUx+GUc5pAZE2sf8TReXL8i7AH1ldMpcRa
         vxp2wKpfw9JNXeD+B6AkXmRr1F4VkUbJstr0/HjZVQupl4UI/cBKZ5AfBEyw5FF2a9FF
         mMmk1HHNRYMR4rEY+dN+6PWa5rh4srV0ECyW7ytZhBjobq9Z93yzoCTt6kNATJ1EdGGg
         onw3+SA3ym4Rcm0wYg320wfi69UExPUUEA9nfzHc5rfZVvftc0j2Ksy/8ggl9O5JnD/c
         moLQ==
X-Gm-Message-State: AOJu0YxO42ZMRgFf+S9H8aUgeAkOL6tx1UVimCWbfKKqrG3e12K5fwAp
	VsZVLen6EJp2voxDwTVKtP/1QhjT+wlHHSpdEJEhSHaSBpOVHVY3JRLrRcLyX2DbkjZIRLrv4qN
	4d9F0
X-Gm-Gg: ASbGnct6AKGUwUFq5XZWGfLXxIYO2ZbzWWjQ3ItKgysqJH8pKA0scPE6X6M1hFQ8bqY
	TXvapW+5lioA5bG9iUCN4CbXiLQgbz2TO2oEXPU83eaNgv7lj+bGiHtZ5+Is+2LlxYVT7C3k7uj
	GFBMGLxLFq/oURl0+mab4HYuTVIPqjp35mdlwt2KRpX9bnII3ysvOCXv1ODYhI9UWOJ6l/QrbN4
	2J0uF4/iINEM+Mz8A+EWpdioBu5H5E9UOR1I4/OiDlQAGVHf+AaOXbdfZEeUqRWt1BREGmCeFtG
	YrVDZb4jy5KQhKe5j32fQaAmJB41leH1UKnBLfultLd3fuH8MIhGN5UjsHe3ss1sNgJrtakW49O
	XabQ+t5Pq22/71uE8/Bdlh6aLCklLitYiT9Qh8NP55Lk6ckrTrYX6ktqPK1+ufwFLLnnKLvIAFW
	OxJdhok30HaRSKWs9TKixIJR+u/0skw5agUA==
X-Google-Smtp-Source: AGHT+IH7KniVCX62nijXrzIJM2jFG6s0qJb293BBWsrl6fD/zXJDdGUzcmqWBiFiLXj3tyd7pgz3Ig==
X-Received: by 2002:a5d:588e:0:b0:3ec:7ff4:23c5 with SMTP id ffacd0b85a97d-3ecdf9ca2aamr2182973f8f.26.1758113018372;
        Wed, 17 Sep 2025 05:43:38 -0700 (PDT)
Received: from FRSMI24-ARGO.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea9abd7234sm13138453f8f.59.2025.09.17.05.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 05:43:38 -0700 (PDT)
From: Sebastien LEFEVRE <sebastien.lefevre@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Sebastien LEFEVRE <sebastien.lefevre@smile.fr>
Subject: [meta-oe][PATCH] utf8proc: Fixes the recipe when built in offline mode
Date: Wed, 17 Sep 2025 14:43:22 +0200
Message-ID: <20250917124322.347422-1-sebastien.lefevre@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 12:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119481

It is necessary to set the revision number to prevent it from being
fetched from the remote.
The revision number has been configured relative to release 2.10.0.

Signed-off-by: Sebastien LEFEVRE <sebastien.lefevre@smile.fr>
---
 meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb b/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
index e42d16b8b7..626836bd1c 100644
--- a/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
+++ b/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "\
     git://github.com/JuliaStrings/utf8proc;protocol=https;branch=master;tag=v${PV} \
     file://run-ptest \
 "
+SRCREV = "a1b99daa2a3393884220264c927a48ba1251a9c6"
 
 inherit cmake ptest
 

