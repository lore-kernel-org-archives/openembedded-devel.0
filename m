Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C790D3E782
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.30062.1730837375200312885
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hepW8jap;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e330b7752cso1356737b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730837374; x=1731442174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULLrzGeBk/ZwdmnurylvN0T3/ez6idBNK8skFSs6MKY=;
        b=hepW8japwlHX+JgYxJOAFGWJ5RG9UYqWfgZNl4II/I8JYX/oItmOi/yDewhcTLB9Tr
         bBxpV/DC16w0LOvoFiI8+tXd70SD96ePOJa228IUZFwVmejv2AeUKVUAJ0j7UpXBz0Op
         dyQeOGMzLXHZkFEq9KbTzbvdsVtsw0gbG0GzznZ6XhjABA5KPb6q57wKJPXozCtzxTwv
         rcp5Y8wdVe7Bz1bX8U1TIAWc7inz7TOlltPJU4tR8KNcj38GfD2EgI4ScmtdF8mFnTk0
         xV6MJ0ArtaO1KxdmjyzqBdohNcKLEziqe3RRTc70cbC0uXvd6/j5JzbgyJocVk9lS/97
         wQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730837374; x=1731442174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULLrzGeBk/ZwdmnurylvN0T3/ez6idBNK8skFSs6MKY=;
        b=CbMvrq3My9mvvq+IW/dbaBiwi1PDd1H7ZWnT98tiEppk6TTwmn2k1ggDvMetso2N4m
         qLuBEDhloHEFMYGXjuWeWm9j7/zr5gO5zZWGywf8rsRskSgb7Yp3ZWtOYMq7mFoHqBqM
         vbMF8plVZHlwXmr4IIdzQatai7/OFuk349Hv39sGJ/oh1P0VH7qol8W4NTR0YE7e+ALQ
         bU/DlK+ZtERLaXSXlppTvid8ithF3R4XAseW0DXDtwwzGr8brCCu0Fy/4uMZEojcIQWX
         T+SOl/uPYykTlO23YiRn61q2Fkd2z1pC3i/i8d5gTtjUzqZLqwa1TQlts9e8k8XYirAW
         QEig==
X-Gm-Message-State: AOJu0YylzsEKoINSSFVCCUfu8K8TSfpjfJ3HBK7cwINm9yq0f/K6Tlrw
	msA88VxFGCPtyaiGo6Zz8IW7IH40jqaEiWnveCopLSSK8e1TtztqKxn0sbYi
X-Google-Smtp-Source: AGHT+IHGkWBgwi174CY3efzB7MnMXmLOchaw8p1eERWbsSEclfpAKl7J/iGVz3YXI+epyIhkyyNVSw==
X-Received: by 2002:a05:690c:740a:b0:6db:da0e:d166 with SMTP id 00721157ae682-6ea55893852mr171540857b3.12.1730837373824;
        Tue, 05 Nov 2024 12:09:33 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9788sm24384527b3.9.2024.11.05.12.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:09:33 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 101/161] xserver-common: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:05:51 -0500
Message-ID: <20241105200651.39395-101-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105200651.39395-100-schonm@gmail.com>
References: <20241105200651.39395-100-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113619

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 3f577bfa0..5cd3d3ce0 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -8,7 +8,6 @@ inherit features_check gpe
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "82f2f84cd96610e8f7b92c700cd31c14"
 SRC_URI[sha256sum] = "cd04c33418f776b1e13fcc7af3d6bd0c7cccd03fbabd7dbcd97f88166cc34210"
 
 SRC_URI:append = " \
-- 
2.43.0


