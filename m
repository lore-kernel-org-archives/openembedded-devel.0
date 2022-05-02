Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC727C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:34:19 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.11351.1651502051241136026
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YsTuJyU6;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so12885659pjm.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=taRtsX98OSqy0yUmszLg28cHjwuM9qWXF5zCF7bhnLs=;
        b=YsTuJyU6Zy9s3/QFydHWj0E0cnBzfbicNj4LeHCnlhMSg3jLOY60nXbB9CBhrYJPnh
         2JXVLZ8IqUbyYxJP9pOYV2+aghdnc5aCVOOkf5dtnXV1VysSEEm92C6SAAY4r4OG+SGL
         5EnMhSMQ4mHDG5w7bNJ2lUbtHwOjJN7yWsOYUIYKNHgJQrOOzzJHTNeboZt8MdwOIpIN
         k4z4CQMRdJ+TyWl4Ig/eTR9A22EevjLUkZQSL4JlG76kQREZCtr2Q7X+1TRZZeBsgCLc
         9h7JQqjw5IDcqYoUKeCTUlO/ayCfuxEFfHxp26xdajSksQGjl7RGu7gd0wBAGvcug6QG
         RCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=taRtsX98OSqy0yUmszLg28cHjwuM9qWXF5zCF7bhnLs=;
        b=Yfe5wu9zW6VvZ2hvLr0CFc9lILz8dhJhC3M//8t9xc0e0pWcrPIURrjh0VsF6HTCCu
         Zis9ECcP9YiPVQHSXeAPU0V3mt9CWPBvXg3m9C02SnFfr4gAyPtJCNRbpBQuJQ9oj0rl
         ezMYrRj6fnhFT4QcsGF4dn88TEIw0a7CAbmRMdUyajMUskBPYLUI4fP69ITDBbnUpmhX
         5V8e184lRnpGFDzRh1EtsrcIh1x6ks4FgF0u9edW2srBBqH520coP+HV6Ywn26shcFz7
         ZRz8POn0pZ5Ht4KBJAp6bewW01PpnateTGebeNhChPdbcX9kiK7EtKcvmajOAmx6AD+4
         bzGA==
X-Gm-Message-State: AOAM5339EBCSqnr5GOpE2a6wBBk05HxMIXyk4kYQcDgL3Z2yrZDphIp/
	GGuPe8krWsM2TVbmsVfuZBlgWApS0yBkUQ==
X-Google-Smtp-Source: 
 ABdhPJzXUFsby0eC+779JDfgXg8DK+cm4M9STarvHtL6op7iwa0CY2SSGaBMYRsrFHZRbFkWILWXOg==
X-Received: by 2002:a17:90b:2289:b0:1dc:1773:3602 with SMTP id
 kx9-20020a17090b228900b001dc17733602mr13358049pjb.241.1651502050511;
        Mon, 02 May 2022 07:34:10 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a17090332ce00b0015e8d4eb1f0sm4785518plr.58.2022.05.02.07.34.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:34:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH 10/10] meta-networking: drop meta-python layer
 depends
Date: Mon,  2 May 2022 07:33:45 -0700
Message-Id: <20220502143345.1500852-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143345.1500852-1-akuster808@gmail.com>
References: <20220502143345.1500852-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:34:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96939

With of a bit of pkg shifting to other layers, we can break
the need of this layer to depend on meta-python

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index a4f622a8cb..3df1a59db1 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -15,7 +15,6 @@ LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
-LAYERDEPENDS_networking-layer += "meta-python"
 
 LAYERSERIES_COMPAT_networking-layer = "kirkstone langdale"
 
-- 
2.25.1


