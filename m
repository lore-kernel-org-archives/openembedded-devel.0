Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6BEC433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:40 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.39435.1649096382752797972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 11:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eDfULB1x;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id b15so9742460pfm.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3V9s4EUm2n1pISmpLcxnUsNKqC03AYCFYyR6eO3+GTo=;
        b=eDfULB1xdILGINoKBIIgFIW75WVwCF4Xa8vhnHvOy5LK+idw0cLc42bHh9ifACPE0v
         GR9IDnl8U4qJ0H9q4umN3lKTTsv77LjDKFz7TzlOROJnvcGtNFD1UDMz1MeMnZ+DAZ4l
         0P3ECfrBMsmNI1hF+21CZ8lQuMNV7bluG3ck3u/Hod+Gh9WvELWPDCic1z3pnCm04iJZ
         OsJCDOwxLg1TkjTmEyZYj9qvN8TjoXla7JDaYAY8RW1DLCd20GEMe2RsymJu01Uth9xA
         GbKukJ/ocZOKtmsEMLz0k8mRlYsOYQZE+/YmYNf0xoBsOP3Vx1YGsECgPArjZ3Ub41v7
         Nx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3V9s4EUm2n1pISmpLcxnUsNKqC03AYCFYyR6eO3+GTo=;
        b=ZuPa9jNvL1trgEMrzd14xYQ/P92ImBdJsTpWY3ZTfWnOG8qj9Lhvl5lTC2ygkuSFe6
         7GW7C3ZsmXGMEs29zXpqyqV7b+udrPlnkNMldA00/sYNe/BRx9K8/Y2IOH0QFyXD2mWv
         84QgiCZGByAjF5irxQNgBOqJHbSayx3f8+k1rx7+y87FfKkhWmp8Qd+n25hqvKrq8733
         ldNN7YCjzkxmZ9BtPGL2QzjJr3ufUBI4315s1AQvc1m7mWFIJCM5dbmhLFd7pYoD3eyq
         kDW1R06a6+xOJ+MQeVk04bLUf42DeKfHX64JiP7T2EFFExbsWZihT7OfbqcNEgXUMqSt
         kvRw==
X-Gm-Message-State: AOAM533SaNrV/GRI91Mmnd4UzHyVBcTwTirVXkiIAKhpXfoftNeDuqNA
	OYwPJnVDZyBW6cc9mAanr0X57AmBbhM=
X-Google-Smtp-Source: 
 ABdhPJx+Y0oNacmpF6tGrJ9HZKTgoy42/WzMDkFBpK5iXsJAHg7PbD5vMlVZebqwx0AggtNkP1gkGw==
X-Received: by 2002:a65:6e0e:0:b0:399:26d7:a224 with SMTP id
 bd14-20020a656e0e000000b0039926d7a224mr945435pgb.437.1649096381997;
        Mon, 04 Apr 2022 11:19:41 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:12d7:1906:ff25:5c6d])
        by smtp.gmail.com with ESMTPSA id
 f4-20020a056a0022c400b004fb2292cd74sm12767883pfj.206.2022.04.04.11.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 11:19:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Christian Ege <christian.ege@ifm.com>
Subject: [meta-oe][dunfell][PATCH 2/2] cli11: switch from default master
 branch to main to fix do_fetch failure
Date: Mon,  4 Apr 2022 11:19:38 -0700
Message-Id: <20220404181938.2893521-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404181938.2893521-1-akuster808@gmail.com>
References: <20220404181938.2893521-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96389

From: Christian Ege <christian.ege@ifm.com>

The branch was renamed in the upstream repository

Signed-off-by: Christian Ege <christian.ege@ifm.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/cli11/cli11_1.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb b/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
index 9e1c2d6214..a49eab72fd 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
 SRCREV = "13becaddb657eacd090537719a669d66d393b8b2"
 PV .= "+git${SRCPV}"
 
-SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=master;protocol=https \
+SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
             file://0001-Add-CLANG_TIDY-check.patch \
             file://0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch \
            "
-- 
2.25.1


