Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D45D3F281
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.30082.1729278810762035799
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IGmKNdFV;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: schonm@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e3dfc24a80so1385748b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278810; x=1729883610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lgr2MvhR0nBkLxADCrtwSNViSvyrBjysc3tVt5Qa7pU=;
        b=IGmKNdFV05k9LjeA8O32IAM9gFHPuyUk5zLC5iqGo+W/wcCQ2dWG+Cf+Q/0x4i77Ia
         0lEyxxc8bh08NZeGVjD1eGqMHzHlE9UUpCv3M7OsLZBYjfMZD0TwCD1LReQC+uFeA4qw
         RpqF+ROLEmdLGkkKQkR+UnBN/rrYC1JpZJ3htFz0BuMkqSml6E0aIUQGmd02p1lchIP7
         bAEiscVaFuBR69oz5LnqxRmGOunIKeNPp8pjs50ISg0w7yDM/n0Y+6OThNqHrYlWW2xf
         tbJ35Epf/qIj+B1SREZhU6Hv8QQC+0FFln2O4AEvvMJMVaMlEhDHEcmfpmSW+vJ5cGxM
         VMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278810; x=1729883610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lgr2MvhR0nBkLxADCrtwSNViSvyrBjysc3tVt5Qa7pU=;
        b=I1NxxEQ/wJ3a9ViD+YJcTih22EFp2LobBxFMU15noeN7Wdor96H3Xwj6VTmlmzh/VW
         Z566yxdotPmVODC5Mn18eqpUBZe3NuAn6jDeM7NQpylxYvb+n28ah5Z+aiSyYzeZq/RH
         EntOvx+7RFjGVoyUchAb7lK+xRL2seXsKSgkZ+c7alfeZkD5Xa1fOznIOq0+lc/VbEcV
         Ia5pFDmCIAi5BPB1uFC4wChVpysUnYG+qes1Z6luQn8jPQSI39QVcnjF0NbayXY93Vln
         Pl+7W43L0nmmIH+CEnUtRatkQzrvGiwk2BEDfAOHwC/7DZBQwEaaPKqF4EhrI/QUVHxk
         bWCg==
X-Gm-Message-State: AOJu0Yxafc+LbTkV1ffO+55yB6EFZQp8HgTH+qKBzvFOHs3gr5RIOkFw
	zrrOSGymi7AaYZI6qHFZ0EbB4l1hwmi1pupHdMWMGaN8yiX5xMLWWKswlw==
X-Google-Smtp-Source: AGHT+IFtsrCCGHqHJP5di67rwueCPqL3j4yS5yEwNCCt/pqjKwLdUVt55eNZLvmyYLsG/71y3Wwhag==
X-Received: by 2002:a05:6808:4444:b0:3e6:75:ddc1 with SMTP id 5614622812f47-3e602c83e87mr4074799b6e.15.1729278809645;
        Fri, 18 Oct 2024 12:13:29 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:29 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 29/68] python3-ipaddress: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:16 -0400
Message-ID: <20241018191101.25184-30-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113016

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb b/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb
index 796213fc6..643878934 100644
--- a/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-ipaddress_1.0.23.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/phihag/ipaddress"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
 
-SRC_URI[md5sum] = "aaee67a8026782af1831148beb0d9060"
 SRC_URI[sha256sum] = "b7f8e0369580bb4a24d5ba1d7cc29660a4a6987763faf1d8a8046830e020e7e2"
 
 inherit pypi setuptools3
-- 
2.43.0


