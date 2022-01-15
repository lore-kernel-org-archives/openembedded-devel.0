Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3D2C433F5
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 14:28:07 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.7725.1642256886863174701
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o68vl4GY;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id m21so5487742pfd.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=z1as7KRHLr+4lKM+35fxh/md4wwm+054BRWK3jWbaAU=;
        b=o68vl4GYhlgzaNacT5zv71SGNTxQWDbNi3jhQimhjUyV4HwED803rTAPPRuXaag974
         gbwnMFA3O7rR6Gq1eLjR4MXY34eOam35jvfrmRxepfKHNUcLyHUMhz4e5YUfW6qKytxT
         fHZz369B6Ttu1NhLazoim3gn7DjJ2O9iweugcfHPfSlMtFvSxdn85XHVbL95Z6xDYFpf
         bCOC240zA+kwCDlwt3lg34Q01SMPWfkWr9dKt16SQ6cWUzsUXqmxwpXW4qYNXxLs7chi
         t3TTFtx1pqWXggFiZYh8r4KYf9oPsS0BxKXzfpcq0GiTncxbVK2YZT1uIxFTYNNhzIed
         8kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z1as7KRHLr+4lKM+35fxh/md4wwm+054BRWK3jWbaAU=;
        b=k7bH58h6KQU6TlpRNRC5urMww4tYzLsKA7XUwRU+CXNjyCPJmDYRBzcmrR+Qw80bvi
         8eMfv6PZEXfeiE7GT5IDFW7rVNBEpy15i5q9O7WSmJfTQQV8Q5o6jWpuaoo6z16XU62M
         hBbatNBfko/NT1ceM82LZYqKtU/zfFkapX7UanYeseTH+oP8j33DNcfycT+QJQTaGkki
         zeYZh4uEOmWUjv3wLWlY319i+BhOqQB4/yRtvUYoFu7Jj2BOwwLPOjiwnXBFp+MlYeVU
         B1/k5BYtKMmSzk2EMpPtrR1u+0qe+ZBwOyLsDO4m7tHXaNI9Xxx3nKInR2d5ZLhu3Jzg
         Eyxw==
X-Gm-Message-State: AOAM530QrlM1rxMtr0S7VPBFsBnH5h2wNLzA414yToEGliae/p5EaKs1
	L8q1kBZvPjLmouqTUfvMpA3abGpOKNRbVA==
X-Google-Smtp-Source: 
 ABdhPJwmyStbOJRxQHUf4zkhJx40dSPLABq/5/wWsswbUWbBcwy2/HdYheMT71FFQXNmR/uKTo7GZw==
X-Received: by 2002:a05:6a00:803:b0:4c3:37b9:74d8 with SMTP id
 m3-20020a056a00080300b004c337b974d8mr2464575pfk.60.1642256886119;
        Sat, 15 Jan 2022 06:28:06 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:7ab9:6507:6566:58c8])
        by smtp.gmail.com with ESMTPSA id
 k20sm8606779pfk.111.2022.01.15.06.28.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 06:28:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 08/11] postfix: upgrade 3.4.12 -> 3.4.23
Date: Sat, 15 Jan 2022 06:27:51 -0800
Message-Id: 
 <cd2b1288aee7f736314b48efd183ba9c5e219e31.1642256649.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642256648.git.akuster808@gmail.com>
References: <cover.1642256648.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 14:28:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94867

From: Yi Zhao <yi.zhao@windriver.com>

Changelog:
http://cdn.postfix.johnriley.me/mirrors/postfix-release/official/postfix-3.3.20.HISTORY

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../postfix/{postfix_3.4.12.bb => postfix_3.4.23.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.12.bb => postfix_3.4.23.bb} (82%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.23.bb
similarity index 82%
rename from meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.4.23.bb
index e7bb3e9d32..bb66345805 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.23.bb
@@ -15,5 +15,5 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0001-fix-build-with-glibc-2.34.patch \
            "
-SRC_URI[sha256sum] = "18555183ae8b52a9e76067799279c86f9f2770cdef3836deb8462ee0a0855dec"
-UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
+SRC_URI[sha256sum] = "1759e953bf7baccb533899845c17753bf57a99ebac9c21717626262966a122f9"
+UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.4(\.\d+)+).tar.gz"
-- 
2.25.1


