Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6090BE7D0C8
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 03:53:05 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.14150.1695354775674183072
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Sep 2023 20:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nr9GT67m;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-690bf8fdd1aso1525211b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 20:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695354775; x=1695959575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMPpWc+gWPxU20uNGx2Pf4vbAWcH9EVqPPCuirSJeyM=;
        b=Nr9GT67mZEPZxnWWHTT9fcrMvH2YeSzwBYLPyZMweYVvuos1NVos8+bVp7XsMDls3O
         2ZJl0+nPz3tbmCv/F2/J7sgLMUm4KUFuUoE0TB/kLaAJsMGosR79QUR+lLRpW6YKoXSH
         5iue8HshM7UgEU1oT9KCMiqM5HsEUJwfpFi5BUL3yc5xw9VGrwaZJ9oozvOJRXl1nAN0
         doXekEnfs+6qhtGa/L+pKuhFNckSpg8fcUKISTW7P8k9/Xpxu1TMGFsSOv1TRfcNPpDI
         TmUkhUOfIQAW3tlD4VbBehsaneShmkFgbuMyb8mUAF1imAjIR1dZhfLLWfS/nBhrLtsf
         lVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695354775; x=1695959575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMPpWc+gWPxU20uNGx2Pf4vbAWcH9EVqPPCuirSJeyM=;
        b=F5Zn5Gcx2xI9kAkaBCG1O/umXrIqzyeF4L3a4oD5jwC8sYl/qmRmmZMVzKFmyEpAI5
         UCYo78LsjzIY0mB8LJuzBM0abnLgzXbgFF9u1VfmfBGjEVJqWxxU8UjODM68HX/HxcER
         FG0fvDrrbrPjikaht3hIDCTIrEAT3CyBkL914OZMTSdxJTALF5aPLuhRK9ZSPskxmhKB
         tOB79YhTGUIzVaTgUmP4GSVDl4KZ1A1M8bSVJXSQpoQJ4k8kxzXH0k2MeADoLmACxykL
         biZVEY3Ma7pD9smZvH+kOG2xsOlcKEhP7rBez84sQKHIvnQ/4QUoCp7Wp6f5E7vvlIcf
         k49A==
X-Gm-Message-State: AOJu0YxMjWDMQ5ui1N0+YDtCPd6NnR/HrkWPszMukFTfBl6ctDs5O1CW
	lWimIBQ9LdZqlHSQRvYwFtdyJH02FedPuQ==
X-Google-Smtp-Source: AGHT+IE/x/zGbiT3rbknasQqMqR6uhcjQcHFLIrwCa6Uxp+xHMjoIJU4j6d73GzO43w1yQ/wliDMQw==
X-Received: by 2002:a05:6a20:7f93:b0:14d:5796:bccd with SMTP id d19-20020a056a207f9300b0014d5796bccdmr9799937pzj.24.1695354774658;
        Thu, 21 Sep 2023 20:52:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b001b8a2edab6asm2328376plt.244.2023.09.21.20.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 20:52:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] plocate: Upgrade to 1.1.19 release
Date: Thu, 21 Sep 2023 20:52:51 -0700
Message-ID: <20230922035251.2788403-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 03:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105045

* Merge .inc into bb
* Switch to wget fetcher

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/plocate/plocate_1.1.17.bb       | 9 ---------
 .../plocate/{plocate.inc => plocate_1.1.19.bb}           | 5 +++++
 2 files changed, 5 insertions(+), 9 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
 rename meta-oe/recipes-extended/plocate/{plocate.inc => plocate_1.1.19.bb} (61%)

diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb b/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
deleted file mode 100644
index ef36754bac..0000000000
--- a/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require plocate.inc
-# GPL-2.0-only
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "git://git.sesse.net/plocate;protocol=https;branch=master"
-
-SRCREV = "7e5defd4e7e075cb9226e7d2d9a80f943c482d11"
-S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/plocate/plocate.inc b/meta-oe/recipes-extended/plocate/plocate_1.1.19.bb
similarity index 61%
rename from meta-oe/recipes-extended/plocate/plocate.inc
rename to meta-oe/recipes-extended/plocate/plocate_1.1.19.bb
index 166fc2d561..6b3160f090 100644
--- a/meta-oe/recipes-extended/plocate/plocate.inc
+++ b/meta-oe/recipes-extended/plocate/plocate_1.1.19.bb
@@ -3,7 +3,12 @@ HOMEPAGE = "https://plocate.sesse.net/"
 DESCRIPTION = "plocate is a locate(1) based on posting lists, completely replacing mlocate with a much faster (and smaller) index. It is suitable as a default locate on your system."
 SECTION = "base"
 LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit meson pkgconfig
 
 DEPENDS = "zstd liburing"
+
+SRC_URI = "https://plocate.sesse.net/download/${BP}.tar.gz"
+
+SRC_URI[sha256sum] = "d95bc8ee8a9f79b9f69ce63df53fb85b202139f243bbb84c399555eda22e6165"
-- 
2.42.0


