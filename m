Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D88CDD0C7
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.21781.1729612088735584589
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SW/P8B0c;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so44611807b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612088; x=1730216888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JVRo+UpFxCVYcqQQxlEJhZdAnDNt0y12Wl5+agPYOs=;
        b=SW/P8B0cUxQl6jghAMdDArEkuXaaUa1KXRG1kys4euyNBGdYlFGq4g5PWYMGqIbEaR
         nHGuGEkECQTEJ08+2/BmQj7tDjGmj7W3Gx3mIhAgr/+YmVzjI6LDPP+ZNnKfdRNvUNAQ
         OSbMs+5kw1uvHotSHjwQD6TAIrtWYezVTBSfR5XJqsm0QpGKGJ6wdRwBkMlex6+NjEjz
         3ql0KE4eM9Kpi/9ugU9CYaUbZHEVtDcBOnOV12kgJUpOImWzjRO9neTQ76kqFST44FDW
         xTXCE9BqFCUECla7Eh3oXzG3bIyBzvATqw5coy/cUcG/c8Y82oSJWXZ5pHdoElC6eKze
         jtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612088; x=1730216888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JVRo+UpFxCVYcqQQxlEJhZdAnDNt0y12Wl5+agPYOs=;
        b=k/pPrgtzlR5uloYvVizf6TBoRDZ8KWxpSgm5DpFwRNdpMqqu+EdF8IoDJcRShDPcCL
         dE//EcIFv9tyR7VMCi6ttYLfHJ5ffj6g2/Vo/cYvXjjNSUSRQ4IRMsPZ4rLyutl+wApT
         YrWz5XEIlsM5Q7fRoXnhG4wB8zupjz5ijNKIppi2DK7DZ7xtC4G7s01WCrkTfvHerBGc
         TBAmB2bONmSxvsqSzBTlGeB+i3a9VEBFVs/xgeyyz/XrCVx4brGECvBz1kRd5K5q9iF0
         sAHR5Lg3CHGI7ZuovdZPSHy443By8qE3O76HJlAHy9OWdnRIrjJoF4vElhQla2ZUdOtw
         M0iQ==
X-Gm-Message-State: AOJu0Yzh5F/kuLVskRNLwq2agTHnE5u5DcPrVjinq5M+j0CXNioiPF7R
	BvH5WgPCX3DGLNAirn6cMEI6EprxFbIqK9EshIy32Tsy0Y2lOShJda5Yag==
X-Google-Smtp-Source: AGHT+IE73QrgzQUbRpCfZJWnDtVCJnRQ9t3d43DlnGFXVbZqHYdllz/9JdD0Gfa9n/dXK+Vlkc6WtQ==
X-Received: by 2002:a05:690c:4905:b0:6e2:aceb:fb47 with SMTP id 00721157ae682-6e5bf72c5f0mr159237337b3.2.1729612087316;
        Tue, 22 Oct 2024 08:48:07 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:07 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 20/46] libhtml-tree-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:38 -0400
Message-ID: <20241022154729.20331-21-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113111

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
index d2c151bf5..30a8e0781 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-tree-perl_5.03.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3eb57a8958cae73cb65e7d0c26339242"
 SRC_URI = "${CPAN_MIRROR}/authors/id/C/CJ/CJM/HTML-Tree-${PV}.tar.gz \
            file://bin-htmltree-fix-shebang.patch \
 "
-SRC_URI[md5sum] = "d9271d60b872ed6fbe68b2d0fe8c450e"
 SRC_URI[sha256sum] = "7d6d73fca622aa74855a8b088faa39454a0f91b7af83c9ec0387f01eefc2148f"
 
 S = "${WORKDIR}/HTML-Tree-${PV}"
-- 
2.43.0


