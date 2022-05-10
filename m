Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DD5C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 09:28:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.7728.1652174926038203660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 02:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IGc8/P9Y;
 spf=pass (domain: linaro.org, ip: 209.85.221.48,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f48.google.com with SMTP id e24so22922516wrc.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Dlqt/3gKa3QODOG+uDWh1aYyBYBvqtyykdPo106Rb8=;
        b=IGc8/P9Yx+D5kWSNrBKWDfY7LJ8HZ3LRFxrNpGX1CcmXXy1u8kRtwmNNh9I88qDlP0
         V9mPWXPJWwRWuAh4vPdTIpWeOwASObWuh/GoGtjIvsLJ2sSWoSMZ+4tQwVh9Ad6gCgUu
         f3b5JZyqdkpm+e01likxIH/MzOF5UUaP4cE40LOA224EW5LL2RbuI0TSOKWs0g1rr+ec
         wSDCGswcDM0hUUCw+pUWcioUQ8dyj6bqiR6KUFNrdB1fmQGylw3iUNaKUrplsR7qUUkM
         cxeAloJsHFrpIten/9Rota/U5g4NruDMZmNXDoOsz493lL+Nbrhd1IspeZUX2SAqCo8a
         qEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Dlqt/3gKa3QODOG+uDWh1aYyBYBvqtyykdPo106Rb8=;
        b=BiwhmwAn30B1Ah3jS0lsGtppd8PklRsddKRS/Wd0vomdPYvmJUHRsClCKiNJLcPNxT
         /Rrl5aQiaI5JXAe5+lS1h2WYhRRgQigSUPTZ/+x0fTV5pvOH1/Itx4pMlBok156GRsTf
         gRs99o5WIltk9hK7OiliAjLHDcwhvbHWK8j02vtcaivXh6LlU8i1LiXLjczaYtpEm9TP
         fo/M3+db+djH0rW0qC54qcxB1h3rJK4864Yfx/yYX4lpuqRxg/c/+Bnrn8fm3DpjmIoM
         wgStpmSkpVSqbOTUlrUrzTdDlfx+3Lq2YVS4LaalIAF4jBbF7tm10WEJkDIaL8wFotFk
         9ZIA==
X-Gm-Message-State: AOAM530fCrjEQ8qIXftPM6GA+DVptM30M/2b23ex6QjGIQa2VeBSYpmE
	DuDCPAYUhjB6E+rqTzj5eD7vBwR+rWHhtQ==
X-Google-Smtp-Source: 
 ABdhPJykQT9OZQqG0uqKOdY3zfE3oK+gJVTfApe6jeznOtB2gckyoCANSKimZGv0/L2Vi6s1u15vLA==
X-Received: by 2002:a05:6000:1809:b0:20a:cafc:fd39 with SMTP id
 m9-20020a056000180900b0020acafcfd39mr17650314wrh.255.1652174923514;
        Tue, 10 May 2022 02:28:43 -0700 (PDT)
Received: from qcom-hackbox.linaro.org ([2a01:4f8:171:26db::2])
        by smtp.gmail.com with ESMTPSA id
 bw26-20020a0560001f9a00b0020ac8c19ecfsm12840600wrb.3.2022.05.10.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 02:28:42 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH] imlib2: update SRC_URI
Date: Tue, 10 May 2022 09:28:24 +0000
Message-Id: <20220510092824.2033312-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 May 2022 09:28:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97024

The upstream repo location has changed, it's now
https://git.enlightenment.org/old/legacy-imlib2

It's not clear when or why it happened, but the the commit hash we use
in SRCREV exists in the 'new' location, so let's at least update the
SRC_URI for now, and fix this warning:

WARNING: imlib2-1.7.1-r0 do_fetch: Failed to fetch URL git://git.enlightenment.org/legacy/imlib2.git;protocol=https;branch=master, attempting MIRRORS if available

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 56d41cd39..869f8123d 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig lib_package
 
 AUTO_LIBNAME_PKGS = ""
 
-SRC_URI = "git://git.enlightenment.org/legacy/${BPN}.git;protocol=https;branch=master"
+SRC_URI = "git://git.enlightenment.org/old/legacy-${BPN}.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-- 
2.30.2


