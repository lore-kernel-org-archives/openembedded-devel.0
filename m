Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5B8C43217
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:33:59 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.11254.1651502039360051102
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y/wbSWT+;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so14311946pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EfhvBwXiYL6uilmLfnkfoDMcB4Ngw875PINfUfUgPdc=;
        b=Y/wbSWT+fi+Pl2rwUe2IhdhVNxbsF42kbQeKDkRsKwaXQBrO70Er+XrmE0K/3VH/3E
         76325wAfCnX8c72SQQ3d/l04zFi+YR4Mg1845/Ztq9rdZA9lRqN2tD6IWLKVqSLqnow1
         AgWAVHyXEK3uDwwytfn3Rgw7Xf4wr85Z0TMtq+um/3F90wuIpq471G829AMFdncpOH4F
         uy/BwxPFoQwKrIPDJjQWAVuvJHz5GSZ2OE77OpIUsk1lbW1grMTpPHBsv7eoelRIWc6z
         iS9TVu6XWFSSNr/VEH9MiFCykJne2FUDssDBfXgt0qX4PUgTcXZImw8NuHPbqrP4AP9c
         65mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfhvBwXiYL6uilmLfnkfoDMcB4Ngw875PINfUfUgPdc=;
        b=l/MQ1b1YSw9VXLYo1JjlyyoHsocVIruYATdOQ2AEUnaFtDFrlwyYEEl+0mWKMzaQmh
         OcDQUlZrx5M7mpGv1SyWlq7v8Rbdjra35/JWgTAzzsbIzvcSYkRQW3kik9hrlz0i1WCP
         QnyqtN1qMDFWvtvfiEz5yH+Se5ES4oQ0oV0K00szYgcjNzpbH/55kk3m/Pfr94mZKRL7
         BmS6Lme7SM+lnW9DP4ClpqJ8OshOLZXlN53dRLmYAwa+gwz4FDdC8OKgEprPGFj5Ok9o
         K81rZQHCR3zp2HIjkqYd/5k8H7CdxYkyDu1MYvdioXYmKPg4qR5jxg1cwj6Hp27LYjmh
         5vBw==
X-Gm-Message-State: AOAM5334x9lfzntBrlSJ85TGN7JrY5us5L13iVZ630KtsGfqdFfAMMMM
	f26E9yrckKu3aiqtp86BI7uvRJ5TD4oJpg==
X-Google-Smtp-Source: 
 ABdhPJwtOlkqbOUi+aS3H5lzzWBWi89GAZyag0l+rY3qR/bSAjAhZjtRua9xrg2EZBMnudqaCVcwjw==
X-Received: by 2002:a17:90b:4f91:b0:1cd:3a73:3a5d with SMTP id
 qe17-20020a17090b4f9100b001cd3a733a5dmr13462074pjb.98.1651502038585;
        Mon, 02 May 2022 07:33:58 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a17090332ce00b0015e8d4eb1f0sm4785518plr.58.2022.05.02.07.33.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:33:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH 06/10] python3-ldap: move to meta-python
Date: Mon,  2 May 2022 07:33:41 -0700
Message-Id: <20220502143345.1500852-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143345.1500852-1-akuster808@gmail.com>
References: <20220502143345.1500852-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:33:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96935

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-networking}/python/python3-ldap_3.4.0.bb              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking/recipes-devtools => meta-python/recipes-networking}/python/python3-ldap_3.4.0.bb (100%)

diff --git a/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.0.bb
similarity index 100%
rename from meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
rename to meta-python/recipes-networking/python/python3-ldap_3.4.0.bb
-- 
2.25.1


