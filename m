Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE63C61DA3
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 05:54:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.96374.1674798886088706448
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 21:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YtlP0cwk;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id k13so4039777plg.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHJmXwTcBWcKpcrEaf1p4EwEgSDghiyJDjn6TwsOU9k=;
        b=YtlP0cwkadUzH7YJIqi+/PXKDVfGp+4VLJ13ZcT9GexvUvIhK79VYLaRsSmAmnA+ZK
         4q57fsSLuDUTm15T8IVkbeOB/gtuDnqT09qNR6dXUZreO5AUrmi1tvho1niy30Hr2qkH
         nnZx4gH2VEsKuZRaogYgFayRK9hipxeWgRWpcWwkKmV1OSfir5pUl7CsqTxztMHsBo4h
         CgpKPFZZYFEfwQMng4PN4FN5wd0oYRL9DyPEsprV5BTtlhk63y4BAbrDtQdAoYRaGmWK
         FDHPuzl1Wm1VF5BEprXIgbs1QQNnVw1a2TG+8SGRHXb+O4DyzAx3ot2eYr502QkzAP8p
         H6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHJmXwTcBWcKpcrEaf1p4EwEgSDghiyJDjn6TwsOU9k=;
        b=pZBYhRkF2z0b58k4Oh8jd5zBkVymaY0EkyLboWz4w7llFsaq87OfTDPrhO+5IO1ZKD
         yuz5+ZJv+L8kmDAUiY47+yqvTNKA3l7pYP/kz9Z4K9jfzdje64NONhedBbKWXMjiRrvL
         uFE7izmtc9TZgQXcLHTAYwInxDqpq4R+PTObDw78E5woWgGT/+u/MLgSPAVq1WmxQ7So
         v3tYFfW950DEKBh0wF3/hLMSiTy/wcObyOqLExmwBjnDpZX86db/6gpxFSCuwiQTTnmf
         wzIL0Jym/4I2yIprH/3SVLRCW4Ym25r/z/BGDKxrCNFSI/x9XA2Di3ey2Z8R/hKiQerJ
         +6aQ==
X-Gm-Message-State: AO0yUKUpcbLMHybhE8xk47M+sVD6tAL6I374tCKmhwiHCajiZBHX67QP
	mVvnL4FHewtj1aeRSfMABXl3JoKRg+z5Xw==
X-Google-Smtp-Source: AK7set87UX+y4ZHXjJnbDqDHdc5ytxx+5Da13J8CFyr+7T4Dga+tSgVuxnQxy7LvCAUyk/q/zed5dQ==
X-Received: by 2002:a17:902:e747:b0:196:13cd:19a with SMTP id p7-20020a170902e74700b0019613cd019amr15841534plf.6.1674798885321;
        Thu, 26 Jan 2023 21:54:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001947982eb8fsm230074pls.60.2023.01.26.21.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 21:54:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/10] proj: Upgrade to 9.1.1 release
Date: Thu, 26 Jan 2023 21:54:34 -0800
Message-Id: <20230127055440.2108933-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127055440.2108933-1-raj.khem@gmail.com>
References: <20230127055440.2108933-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100808

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-navigation/proj/{proj_9.1.0.bb => proj_9.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/proj/{proj_9.1.0.bb => proj_9.1.1.bb} (90%)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.1.0.bb b/meta-oe/recipes-navigation/proj/proj_9.1.1.bb
similarity index 90%
rename from meta-oe/recipes-navigation/proj/proj_9.1.0.bb
rename to meta-oe/recipes-navigation/proj/proj_9.1.1.bb
index 218f083969..6ce1c88772 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
 DEPENDS = "sqlite3 sqlite3-native"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "81b2239b94cad0886222cde4f53cb49d34905aad2a1317244a0c30a553db2315"
+SRC_URI[sha256sum] = "003cd4010e52bb5eb8f7de1c143753aa830c8902b6ed01209f294846e40e6d39"
 
 inherit cmake lib_package
 
-- 
2.39.1


