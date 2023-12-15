Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE79C4706C
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.58183.1702626771410325705
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NRVzi6A4;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a1f47f91fc0so45039566b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626770; x=1703231570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unIgHetqlJSPTH80WvFUBbEV9GagmWSllFdRN1H5aPs=;
        b=NRVzi6A4Zg2/Dbt6euYWEZBxYywxxoHiDCK9VOKGpP7lfo0JI+jLJlER0h0IokgTbp
         JkJXa21pUIyIpd+EVvgpoF/2PI7dHSaJUWOGyHL/K6jjoWrU+JpdM39jgB6Lt5Nd8nrC
         rPLJtLFS5e//vUJVrITrVFESxWFJYsJ33qK18LXIMpV4nvkDqu0iziBIcfjcXTmZErHb
         jdf0X0Gx/XA9lA/ErUrT4fzscytEf/BQrl+a43GTpdfsIFZWKlde/N5Fly5WVQHfWdKa
         MuxyBpkJLmtxRt1bEnmxzhzV9fUAsJKEpq67YPxW83o87+7mG53vqX1et9qfCSCv6xR+
         4KqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626770; x=1703231570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unIgHetqlJSPTH80WvFUBbEV9GagmWSllFdRN1H5aPs=;
        b=ZE+Lf5JW43ajla+Oh2OYlxdc/y34tfSPYvZGjm3pM93xAPsHjRzSQ4mvYzR/9Y60Le
         nQFTrJhbd1VqyfHOhqs0ITXDx5nRwKqxiK1zyUWrLXqHCSnLrXSM//FcnJ1GubmM+Y15
         3hBWcl2dRgClsXVOqtl1JxKyds0KEut/ErbJUi/XF72MNzphqfL0Dq6OEm8zRLMx8rt2
         yYY8osddMmmdkS/rvGxtNAmtwt+PoPFErxTaBvqVQNJk9FgSwxHelELyBoDPOsYHbxvr
         dFbosaDg7eq/B2T76/4qXcJ0wIF4O4P8FnjaxqGgUdlUhuaW3xY/5Ras/nduDpsxR4ly
         Y15w==
X-Gm-Message-State: AOJu0Yw0Yvd7L7T45qW2PxtXGecqxKOx8nuYAq6GQnPq6bYyVfgbr3Hu
	T2ILDNVaVJ5a95gdczW/gjB8ajcyQRk=
X-Google-Smtp-Source: AGHT+IFbjpZW4P48H6K8GsaWHD7CCCvq1dQ2jAYmgwHpyPUFwusUmvrFyx+U+WPxrbQOiuu5td8pZg==
X-Received: by 2002:a17:907:7288:b0:a02:2177:ad14 with SMTP id dt8-20020a170907728800b00a022177ad14mr6512367ejc.73.1702626769791;
        Thu, 14 Dec 2023 23:52:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/20] python3-web3: remove distutils dependency
Date: Fri, 15 Dec 2023 08:52:27 +0100
Message-Id: <20231215075239.3049865-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107501

It's not mentioned in the source tree anymore.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-web3_6.11.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.11.3.bb b/meta-python/recipes-devtools/python/python3-web3_6.11.3.bb
index 2c7aca9ba..31974a352 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.11.3.bb
@@ -10,7 +10,6 @@ inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     python3-aiohttp \
-    python3-distutils \
     python3-eth-account \
     python3-idna \
     python3-jsonschema \
-- 
2.39.2


