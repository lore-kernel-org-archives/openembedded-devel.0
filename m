Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D397EC433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 18:06:26 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.22046.1635617186562744105
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mLe3bGaC;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id j9so4941075pgh.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=piYhfcVSUkWnHUbIYFQXE3f7eZWC8iig3G7hv6cJVvc=;
        b=mLe3bGaC/K3Q7JxdKQl/9Cp6vCC1/YxU5JbURkbif2Vg+JZwu8xccw9YWwsCUPJH5c
         /1ptKj0twl4nXogoUT6k2uF1iH6a9I8Au4pmCIX3QOonZYAKSXQ9v/ywxGJho/yvNHyU
         UAxsYdWD+NR8MN2wAnqcdRmt6WzB4y5KM4D3f6ryMrisxkhBZlXPbnPyfbK9DhuzH5uw
         jnzgJ2VN3Wwwc6xu37f5onb6Zw3/2W/rdkNAi2jN8qpCV3Oh+0+BRR4yVCTX+d+z+y4F
         B1PMQzc3Ti4Ps1nTxxA/t8NlVj2JpfgHj/PnQASU7mnF9Po1wR4S/NHSThazx6UGoZCP
         3HKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=piYhfcVSUkWnHUbIYFQXE3f7eZWC8iig3G7hv6cJVvc=;
        b=LV0FwNzKEx7XOgtLiRCaiY26J9dZ8/0a0RiGLMAKtVpcMznS5H27w8OlJZjOWSD1/1
         lTe88VNwguKxc7zz5EhOWDLxr7g5/ohfYrGZ1pXO0L+gJ1Lu3qfN8O6oOBZkxpO+xUvT
         wda5rLikz2YrH2Pz1gy+W3NzUJD2dln6Dnota9ZhPHFF7y6rIAVgmwDgvGyRIyIfbc1i
         AFzDCoJEwEPnYfHMX9bTBjAOhnfzGmYoGoxLdUAjYtjAKW8kcDP7h5zvdx9SLjqassqE
         WQDSTVlMIksaZufTxkjxcFM2FB38FILZMOxUyV+jq4QWsc5U7gv3+cLYjIlX/5WgJ1Bj
         bQ4g==
X-Gm-Message-State: AOAM531iyHS5ZLqSPcp5YX/FixOlFUbArLLPVGnmmEm8vLD1TMEDVDsh
	gW1j47JC4yepoQBxs5dLJGZ4xpRwi8E=
X-Google-Smtp-Source: 
 ABdhPJxRSOt2HF1RYnVlrBuCfVf5DbmaUNBSUkUUVOIVCpOWs+gMqCU7cVuuMkK4tcfQ0tdoRiw+NA==
X-Received: by 2002:a05:6a00:1906:b0:44c:b35d:71a8 with SMTP id
 y6-20020a056a00190600b0044cb35d71a8mr18702690pfi.51.1635617185911;
        Sat, 30 Oct 2021 11:06:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id y6sm217346pfa.70.2021.10.30.11.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 11:06:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 8/8] mtr: Explicitly use branch= in SRC_URI
Date: Sat, 30 Oct 2021 11:06:18 -0700
Message-Id: <20211030180618.2200698-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211030180618.2200698-1-raj.khem@gmail.com>
References: <20211030180618.2200698-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 18:06:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93679

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/mtr/mtr_0.94.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mtr/mtr_0.94.bb b/meta-networking/recipes-support/mtr/mtr_0.94.bb
index c066be1428..0ee0b85be8 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.94.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.94.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
 SRCREV = "2c73cbf4094e4eed343ed11ae5bab2580f3122d1"
-SRC_URI = "git://github.com/traviscross/mtr \
+SRC_URI = "git://github.com/traviscross/mtr;branch=master \
            file://0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch \
           "
 
-- 
2.33.1


