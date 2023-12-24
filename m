Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B47C46CD2
	for <webhook@archiver.kernel.org>; Sun, 24 Dec 2023 09:01:46 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.24000.1703408503840320894
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Dec 2023 01:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ma/JMNGr;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336990fb8fbso1525284f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Dec 2023 01:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703408501; x=1704013301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANYNmzgY2K6gRj5lMVJimy6M9MaVUMcaygn+XgKWTGg=;
        b=ma/JMNGrU9LWSZaPdM/MPENJKuhfSjfmvt56XmOrbi0kj3DkN+YS/HyBLb3DGMEYGY
         AYQng5nCMk7MB1FyMmsNugOJE+QnxZy4leZrfKKT2BC5EF0q+TbIVtdsmYbt3/fKSsWr
         xcX5JuB8gfhDPEEraWb/UnNBpkEZPInf0q0MXImhSnuHW3DKRDxkDCad7743nSm1IaJV
         Ngbtei8uJ7vR48cM7eSMwnd3Lqx3nIyA/thy/aV+gIIFICEqdn2W8iF/7SnByr+USoQq
         8dwHGKNtl6lIxnYKYVSkQ4rE2Ce/Wj93hVkKeg4AkkP94YudOGN+iQopZS/e+nJz0l00
         LOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703408501; x=1704013301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANYNmzgY2K6gRj5lMVJimy6M9MaVUMcaygn+XgKWTGg=;
        b=iq0qwaPy6ksFM0XR50O2IuIuGWRdgeTE9ABTiG+GqRv9EDZc68pCfPsQxBdOECFCmE
         4VsMs5ykOe0pJ5hM/GwhsE7iZ6yl1OagHDi2+c77mM/vhPjP7e+eTxKRFYf7H4dW/bFf
         gpDk8N/0plZws1iqKCElpAn0KEL6LBVrKTaLJnsMjIIEXI2Eua38VE5zgfXfHyUzzXIZ
         19F8cbtJPjIvKJY0oeMiNuTKdNghSTaZmN9PM85ypvAfzih5yQ4QP6u8eYf8QGMSJkLi
         3pOdtO5/mHIjkLGculbjrVypwc0WAAJ451n+e+AHf+QSLrCbW90iAxyCnMnKO0InLWxE
         I/cQ==
X-Gm-Message-State: AOJu0Yxc27322tJB9ORbp7jKyWaVST5mrCNqD7/owySACM0PlwgGG05L
	V+prdqpAS5eBN1+1qFrCSTFsUl18Pi4=
X-Google-Smtp-Source: AGHT+IHSorFbu/9cxl4noJ1pOwMBCd8LOrAi2aRgW/GmwoXAhMnnVQf9exTodjDuBhdBJo3KunCXmQ==
X-Received: by 2002:a05:600c:a0b:b0:40d:3592:e8da with SMTP id z11-20020a05600c0a0b00b0040d3592e8damr2317928wmp.100.1703408501060;
        Sun, 24 Dec 2023 01:01:41 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id je17-20020a05600c1f9100b0040d1450ca7esm20999303wmb.7.2023.12.24.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 01:01:40 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] hstr: upgrade 2.5.0 -> 3.1.0
Date: Sun, 24 Dec 2023 12:01:36 +0300
Message-Id: <20231224090136.420979-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Dec 2023 09:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107779

Changelog:

* Released v3.1.0 - Minor release fixing a Bash function that is used
  when ioctl/TIOCSTI is not available.

* Released v3.0.0 - major release which adds ability of HSTR to work
  on operating systems and Linux kernels without ioctl/TIOCSTI support.

* Released v2.6.0 - fix release (several memory leak and overflow fixes,
  MacPorts and Debian documentation, Snap script fix, GitHub Actions workflow).

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-support/hstr/{hstr_2.5.0.bb => hstr_3.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/hstr/{hstr_2.5.0.bb => hstr_3.1.0.bb} (77%)

diff --git a/meta-oe/recipes-support/hstr/hstr_2.5.0.bb b/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
similarity index 77%
rename from meta-oe/recipes-support/hstr/hstr_2.5.0.bb
rename to meta-oe/recipes-support/hstr/hstr_3.1.0.bb
index 6c9f65e82..a641feef6 100644
--- a/meta-oe/recipes-support/hstr/hstr_2.5.0.bb
+++ b/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
 DEPENDS = "ncurses readline"
 
-SRC_URI = "https://github.com/dvorka/hstr/releases/download/2.5/hstr-${PV}-tarball.tgz \
+SRC_URI = "https://github.com/dvorka/hstr/releases/download/3.1/hstr-${PV}-tarball.tgz \
            file://0001-configure.ac-Don-t-use-AC_CHECK_FILE.patch \
            file://0001-Use-OE-specific-checks-for-ncurses.patch"
 
 S = "${WORKDIR}/${BPN}"
 
-SRC_URI[sha256sum] = "44bb6d93ef064536218f8ae5464772861bfccfe364a436397d9f770207cd306d"
+SRC_URI[sha256sum] = "4dabf61f045f022bac8bc909e5fd96041af6c53df56d97dfa3cfbf49af4453a5"
 
 inherit autotools pkgconfig bash-completion
-- 
2.25.1


