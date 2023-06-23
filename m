Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AC7EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:40:37 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.219.1687531231167501586
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=AgH5quAB;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.54, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso917491e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687531229; x=1690123229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bunr4iG+CswrOC968S2iOc2D5Ek6mWr2w+YzPbbUdfA=;
        b=AgH5quABmO00/9Ly4OFJcnFJE0ImIe2QCqRPV+dtEuLS/EsLUizolwvEDD/qVWUfp3
         WngsPpqw4xVEeoWCOEVnkhhUCmKzu6uyIK3zskm41Rc0HbzxBn8GEQVDSWLDa3jl6ilf
         g69s1H3HdJgnp1W50IkNLyT6C3n9onVlgD9gzlAWYn7LrLg/KSX+oVx1vqsOPtSFAwNX
         kEdVLhl+fVK1oEMzXlqNg873UMd8OHYZ+LkB7L8vN5YtlgziYJD7PbvuEAc3imf4jJ43
         ZAyrNhCsVx84h++s3RPjNYbN2qfSRT4hctzbmWB6M02ntayX3+4qCY2+B4V+08pvFAtG
         wV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531229; x=1690123229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bunr4iG+CswrOC968S2iOc2D5Ek6mWr2w+YzPbbUdfA=;
        b=N/6ofQ4QkgWOhJ0Nxzt71rZfK5xari9mQnjNAwHslps0Cp9WtYdLu5A+ZGdP/e1k7I
         WstSna99ejc5eVD4yujbFwEo6pgZ3UA/30IoFmDWQ/pW9P6StjVqrlp3j+vEFR2pQQqb
         8XyUSdb27+xCycIHLBWrsd3BpY/cQZ1xiLJ9CempXzZATyfnAfVz/sN/B1TQXv7quots
         i0Gzh5VkeqKPtNLA9J0GkffeBmMFtyrRgH0DuGp57Q7EUFvCZre9kpUzn1hCDbpmEiLV
         XlcXbDZlFlUi3goT8I65Gg5MDyWvYpvLrmmZlce94QFY/a8Z/SgBaHzjYZB+GCdHALNx
         Zg2w==
X-Gm-Message-State: AC+VfDw1X6SppBKRE2dFCGejxqnuMKSkGBMSK1QD+vCzmjcKmRKB5HVd
	aTF9/OW5NRKI577K4VOitblQrw==
X-Google-Smtp-Source: ACHHUZ562olRldzAITk+3Vm5xGjQyksA/wEtacpa8LQvHxAH2/uueUfUobC3PjUT0sjxOvdinoG9VA==
X-Received: by 2002:a05:6512:3ca6:b0:4f9:69e9:4fa6 with SMTP id h38-20020a0565123ca600b004f969e94fa6mr3686048lfv.23.1687531229510;
        Fri, 23 Jun 2023 07:40:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
        by smtp.gmail.com with ESMTPSA id s24-20020a7bc398000000b003f6132f95e6sm2526164wmj.35.2023.06.23.07.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:40:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 55/55] python3-setuptools-scm-git-archive: add missing run-time dependencies
Date: Fri, 23 Jun 2023 16:39:21 +0200
Message-Id: <20230623143921.146338-56-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623143921.146338-1-brgl@bgdev.pl>
References: <20230623143921.146338-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103551

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python/python3-setuptools-scm-git-archive_1.1.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb
index 472c4eb1c..2068871d9 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm-git-archive_1.1.bb
@@ -11,5 +11,6 @@ PYPI_PACKAGE = "setuptools_scm_git_archive"
 PYPI_SRC_URI = "https://files.pythonhosted.org/packages/7e/2c/0c15b29a1b5940250bfdc4a4f53272e35cd7cf8a34159291b6b4ec9eb291/${PYPI_ARCHIVE_NAME}"
 
 DEPENDS += "python3-setuptools-scm-native"
+RDEPENDS:${PN} += "python3-setuptools-scm"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


