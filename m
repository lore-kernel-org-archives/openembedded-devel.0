Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10198C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 09:42:50 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web08.3308.1635500569096447377
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=HFgyqdje;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id k13so15873921ljj.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z/bif4ZE33rtDdsixQHm/2dHp9p1y8SfREBzdNt2N8k=;
        b=HFgyqdjeD3LdLU4b9u0N7uGQvb5+q1GVw/QjmR4kngXADsE7RPYuwN5iFSDPFJNNMn
         6yRBvhnSZ7hm9a8tcgqGJmIXFgTUhf7JT8WbL2iOTnNur37CvNiR+aP6LTlFyQ4hxi4Q
         kHWEHpXHwoj3ufo+Mlo11QYQ7SBjL5SlW+ntCIPh4bqo03kFjCZrsJXMEk4i1dW0TtmG
         J62tZNZ/CmYk9dnBY03GRWqJzW9OSBBlKtARxongIOUyXO780ECYMPySkQ3ZSR8KM84Q
         AO2qyR0PvH62pjMCFU6UqFw6XpIls+9oyYwrLqyblhW2QNCZBazNt59JZH7leaMr0giO
         NGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z/bif4ZE33rtDdsixQHm/2dHp9p1y8SfREBzdNt2N8k=;
        b=ARS+ZK4Rx47RlyyTA0kU12lvCcWYODWFcQzKw4ioRQjrnz1oKgpt5AcvOgA/nJnWXV
         HA4yq0AW9mBPot2qJCupRx/NOOXkvR+CYFbEmNCfPLJjL/fGMkJZQGxrAvp842QnBqSP
         ShBUCmTsWA81AxbmBA/ATqtwkFnzWjzb0fg5wlJWE5DVpLW+l39gjGRHMyXoA8zdCHWs
         cbs09lxc+DdqlEm4oRRvTMyMSFcVF1z5BmUWcIHE439Zi0jOeHH4vedYrvektmkPbUKX
         vcizyD5PfyCWAdzCZ9YIF96uPwMi9cY1sZiKNkDsZYiSX3IfwauMk0l2RYUEoo9ac/FE
         2gZg==
X-Gm-Message-State: AOAM531AotRFC/i6U2uNCEwzbuZqEhWF+mkGn/xpZCz2XdxoaAM5cTOu
	oo/gYMUa+m6eKI6wSwqfvwTDrBclMlfMegac
X-Google-Smtp-Source: 
 ABdhPJxnlUBrUKoCDjk6wGUKBFL+Sm3lNzfWrklDuPEicXhvylJs9KIvr5muIBjFYNfnBdebCGftMg==
X-Received: by 2002:a2e:9b91:: with SMTP id z17mr923670lji.213.1635500566974;
        Fri, 29 Oct 2021 02:42:46 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 q12sm139929lfr.162.2021.10.29.02.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 02:42:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-imageio: update to 2.10.1
Date: Fri, 29 Oct 2021 11:42:44 +0200
Message-Id: <20211029094244.1414885-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Oct 2021 09:42:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93647

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-imageio_2.9.0.bb => python3-imageio_2.10.1.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.9.0.bb => python3-imageio_2.10.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.10.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.10.1.bb
index 2783669b4..ea9ed1869 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.10.1.bb
@@ -6,8 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
 
-SRC_URI[md5sum] = "d22757338542e3742a335cea6210e419"
-SRC_URI[sha256sum] = "52ddbaeca2dccf53ba2d6dec5676ca7bc3b2403ef8b37f7da78b7654bb3e10f0"
+SRC_URI[sha256sum] = "1fbf909bac3f07faabd05a3f71b3c49428709c3c55f43770a3f76e0eb1b525d1"
 
 inherit pypi setuptools3
 
-- 
2.25.1


