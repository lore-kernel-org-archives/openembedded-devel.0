Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DE9C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:15 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.34502.1675055353765896679
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BBylDLOb;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so9986644pjb.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CC7tVHKa2FQCyHeW6DA8ZBPwDioAQEdQHEezUIbiqQ=;
        b=BBylDLObEW6C4+eRFfSJpzj4DPjeWHEsrBAAS+zceWedjNZs945aHu6Fn0dRe2ULBC
         fADIRvB6ofgdIsRdwlATRsyfqq8wgG209wKbEVMFT5ui68jhlpsZqPHsj+2Q6acF0qG1
         JC1Mh4oqTqlAsVi28tyhx5epcIZ7GsK0R3CMPdFhJ1cIgTjskP4ifxRk9VB3X7/anYG8
         Og6NELz6njkmFCsxasOiwODSvXFbFGp8m4VJIAKRCl7MSEpYM7M9O72Q5+Cga/8nnZoF
         gKqxc2SCn483lUX77JHUIeHqWLCsTlXf3go5ZuqnHDN04XIlGS4P6mZnXY1v187y2SH2
         4jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CC7tVHKa2FQCyHeW6DA8ZBPwDioAQEdQHEezUIbiqQ=;
        b=NzSeVMGW6PDQFyW2gCSuh6H3HjYDVs8UAbtH8l4u1uO+Rh6x6q3s15jdVtYlR+WmdZ
         nkZxkZV3/XzFEBsxLEwjEHGqEK+8sN4utbRLs/YV1EHnO0IvR3DJvqJ4bELSENg/50ME
         e1/W5JajTTI4jFWHn/DnUKL9Kxj9Z0OWli1mqG4kPN2AQjH9MKV94WRNjPmfsqPhOfBi
         nJtSuvBlojxrkpTxy5JHSIkislgOnkI7c+uBPQO5CcvI4wxEoNcoKibniOhYysMyKoDo
         rk476P4OVMw1Uwb6h6tDmeBp7OA+ZYJ/ecU6K9T6eymx9d7afLvfGiPRfeRWSKwuY2uT
         uVyA==
X-Gm-Message-State: AO0yUKUrcI3rXaY+ij8oS5efTqr2zXjj18KTp6KYpipKmJGPdMsU8osU
	VshoeobAjzO0jQw57EWWv4BlHSrByxb1Mg==
X-Google-Smtp-Source: AK7set+GDfy6AmqAANNPPdYLeGxpmjXwlUCq49Ar4+rvhEK45cpbLaDaV2vIt6xh/Oj9IY0gkJd1/w==
X-Received: by 2002:a17:902:f10b:b0:194:d7d5:f3b7 with SMTP id e11-20020a170902f10b00b00194d7d5f3b7mr5352637plb.35.1675055352843;
        Sun, 29 Jan 2023 21:09:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 02/12] rdma-core: Inherit python3targetconfig
Date: Sun, 29 Jan 2023 21:08:59 -0800
Message-Id: <20230130050909.133727-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100846

It uses python3-config during build to grok the python specific
includedirs, therefore its important to ensure that target specific
python3-config is used, otherwise currently it defaults to native
python3-config which ends up adding native python3 include paths
which might work out ok but is exposed when target is 32bit + lfs
enabled, the headers don't match between native and target python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
index 86243a52c5..a2d5142953 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_42.0.bb
@@ -28,7 +28,7 @@ FILES_SOLIBSDEV = ""
 FILES:${PN} += "${libdir}/*"
 INSANE_SKIP:${PN} += "dev-so"
 
-inherit cmake cpan-base pkgconfig python3native systemd
+inherit cmake cpan-base pkgconfig python3native python3targetconfig systemd
 
 SYSTEMD_SERVICE:${PN} = " \
     srp_daemon.service \
-- 
2.39.1


