Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FF9C77B7C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:23 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.69132.1683477202543476405
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=S0K6ZN03;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-55a83e80262so54834217b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477201; x=1686069201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQsS7I02H3oua2Ca6YuMA9Ew82J75JDzyy5iHamTU54=;
        b=S0K6ZN03MdQ8/wPBunn6Yhe5VhrZ7IQMO5aBF+fnqbb8eSDwyYxiVaf5zNHF7cwSX8
         QjVoRuPZqrBGjF3iB8wtj0fnvcCA1AVMihmoBr23+Y1lSFs7FoOd+B1OOQlj2pdXELGG
         1JqD+p/H7IeLgtpX27srLB6sX9uqpJYN2Y4X32vrRg8LcrxNKXG/VhFdGK/tGFfaPbuo
         YCPqtcn7wB5YiMqcOuEa1jGst1LeCjwObcws5952mTSEEwcVMJX000oH75gvjYwbgdHZ
         dhBVxKQPqHlRByPHVSBmaUiGYN6dx9G/OX4iwUuGswCKLH0kNjJE+qiukpcd60wu1iGL
         vLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477201; x=1686069201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQsS7I02H3oua2Ca6YuMA9Ew82J75JDzyy5iHamTU54=;
        b=ik7t7/KVbiwvywSYpOTKdOyKAckOPhJQBAriS/B+jjqXvAfJaSNMAhAFXa64Jtd2/d
         2CnMJvOvxMRUITnU1YuyryOIVSb9CnWL3X1V44P8iAqpyMlcxNSdrsZbLeVpiTM9aP4h
         42PhVLBd2SeHXhVyAe1aEj2sQ8F/cRCk+Pco8PS1Kdjx55OSp2GkrIDvHD4se8cWk3+G
         2qfqaoTIt5rA0wO24HBUs0k2AjCLPT3hxSZywAHHrfzWU4+g+SpVEjLe5H/Jlx2yuMTM
         jpHhEzOnuTeA1NS8fptDlxzz7OusOkBDf2emAGAwr8DKGiWaQLpNzIRYycMRh1RVLj1I
         THYQ==
X-Gm-Message-State: AC+VfDwM+xYp+tBfx8X4KFUmZTbRy0j+u+XQYzhww1lz86++SXTiQeWZ
	Z2MBf8GPvPDTGf5cSEUexgebCQ2nB6s=
X-Google-Smtp-Source: ACHHUZ7JYLRXkRPvmAJb7C6UdU24ORdH57StnVgFGLtYztpv0HBgTcM2UpFTyefegFGE0TmVaGlW0A==
X-Received: by 2002:a0d:f304:0:b0:55a:382b:5e0f with SMTP id c4-20020a0df304000000b0055a382b5e0fmr9195916ywf.12.1683477201404;
        Sun, 07 May 2023 09:33:21 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 14/29] ctapi-common: Point to working SRC_URI locations
Date: Sun,  7 May 2023 12:32:50 -0400
Message-Id: <20230507163305.3261044-14-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102344

From: Khem Raj <raj.khem@gmail.com>

Drop md5sum checksum

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7687cb73b26e09c566adecb4e5ac71a270800004)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/ctapi-common/ctapi-common_1.1-14.bb    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
index 25d5b09e7f..b7a9d3e936 100644
--- a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
+++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
@@ -4,10 +4,9 @@ SECTION = "System Environment/Libraries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../ctapi-common.LICENSE;md5=8744cd52545ecb45befebd0da6f70f0a"
 
-SRC_URI = "http://ftp.riken.jp/Linux/fedora/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.LICENSE \
-           http://ftp.riken.jp/Linux/fedora/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.README"
-SRC_URI[md5sum] = "5b7259ef1c8cd9ae801fca7a5cb548c1"
-SRC_URI[sha256sum] = "87a74eb0a66055c34ba2c5c919e74f3211c5950ae1c2cbab967fdf4137f5de91"
+SRC_URI = "https://distrib-coffee.ipsl.jussieu.fr/pub/linux/altlinux/autoimports/Sisyphus/x86_64/SRPMS.autoimports/ctapi-common-1.1-alt1_14.src.rpm;extract=ctapi-common.LICENSE \
+           https://distrib-coffee.ipsl.jussieu.fr/pub/linux/altlinux/autoimports/Sisyphus/x86_64/SRPMS.autoimports/ctapi-common-1.1-alt1_14.src.rpm;extract=ctapi-common.README"
+SRC_URI[sha256sum] = "0531a6db39271166f1e9060f81a0b2d47f878210dfb4f465c703fe205cc3a8ce"
 
 do_compile() {
     install -pm 644 ${WORKDIR}/ctapi-common.LICENSE LICENSE
-- 
2.25.1


