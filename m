Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8301C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 05:32:20 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.9823.1724391140278298093
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 22:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jo77KquY;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7143185edf2so1339315b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 22:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724391139; x=1724995939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/hRngIB6jxP5QDdf2f2GY7luYwcv3l3LQk16XtAhiA=;
        b=jo77KquYPAogWng3C7z2+sxND5srYiodGF2pYtPBhXwshF+ytQZLHHn3UXwEAw6eML
         0IkZBQ4SUYaZ15/hgvYBqZDevo5i5dAcswbJAIJSH6YhVm25OFEZFMU3b6XI3t72Yjed
         PFb5mKh8ElJu6wB3OwyLXV+77CSu6HuD2/ZWX9V2NR+kiUg8IOR9GmqcUP816mWvdyYF
         i+IlSzu0icaFAMFwsYxBLXAGJvtXFZF8Nkiof6zrcuBLddb7PnOv6MaBRijTq0E1xQ6P
         zsP3GB1y1R+lvGUzOtE6i5KtGyRvKNLHbEqM9p+FJw2+XkJpKXkgmn17+1xgHP8+FoO+
         C1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724391139; x=1724995939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/hRngIB6jxP5QDdf2f2GY7luYwcv3l3LQk16XtAhiA=;
        b=tVp751MtOPABr+uEeK8n+uZTBnuSmnUtNgskpEH6wAvnX6jHpnvHPIe83he+at6zg3
         YWiLkW8kX8j9T1931dZpH+uHnKUUjtXcMiAwKQJ2wwG+4EOS4AeQ3ZQkg1ET/JMXAkZP
         unoRiucPXDNm174mLZgdQaVqPCwJO+JnPjQJSAmgacUl25NIs3J9lcZZ3ZecUAa5ZFM6
         moTWD+v09Ka8umVANBNm9gl1X6Xpo51NnOIqBKD0Z16UMavIufkirXQfy3/14+7WRubz
         lwUB41Gpl2/zfji9VlJiU9EOhiUZAqx5ifOdlEYGhFqq+ZK9tieAgp9eKAsIwGbtzliz
         t1lA==
X-Gm-Message-State: AOJu0YxtI+CvGLdIoqwkrc8AkcdFKj/YKVh3of4Wv5+cTp6EE2w6y/6r
	i+zykWi5UxamFGb7GVIiDp9YnSxbkmbXLarM2bn/9kqRe3aIDz4bqc2OOg==
X-Google-Smtp-Source: AGHT+IFOPJSqpBD2oHKTWpVoWTF98Zb125RrNqObz26/oT9Tld96JmJ5npETYPgCm9LfiYI+WcIUrw==
X-Received: by 2002:a05:6a00:4f8b:b0:70d:3938:f1c3 with SMTP id d2e1a72fcca58-71445cc0affmr1460791b3a.3.1724391139350;
        Thu, 22 Aug 2024 22:32:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143425201csm2248529b3a.73.2024.08.22.22.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 22:32:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] frr: Upgrade to 10.1 release
Date: Thu, 22 Aug 2024 22:32:15 -0700
Message-ID: <20240823053215.3928606-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 05:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111908

Changes are here [1]

[1] https://github.com/FRRouting/frr/commit/14c29f83a0dfbc4023cdfff34ed38cf43dca409c

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/frr/{frr_10.0.1.bb => frr_10.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.0.1.bb => frr_10.1.bb} (98%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.0.1.bb b/meta-networking/recipes-protocols/frr/frr_10.1.bb
similarity index 98%
rename from meta-networking/recipes-protocols/frr/frr_10.0.1.bb
rename to meta-networking/recipes-protocols/frr/frr_10.1.bb
index 20e0ddbbab..4ffae16072 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.0.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.1.bb
@@ -10,12 +10,12 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
                     file://doc/licenses/LGPL-2.1;md5=4fbd65380cdd255951079008b364516c"
 
 
-SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.0 \
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.1 \
            file://frr.pam \
            file://0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch \
            "
 
-SRCREV = "8fb5f22bd89fa6bedcb922b908b955d8a650566f"
+SRCREV = "14c29f83a0dfbc4023cdfff34ed38cf43dca409c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 

