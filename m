Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E9CC352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:19:31 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.5226.1669792762571371004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 23:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dMxEvhxC;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id io19so15811186plb.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 23:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VRmpJ2GR7OhC6pdIq7lMkxbyyauLHR0UPSb99CWiME=;
        b=dMxEvhxCFxjeo6NMujxEBseFAKVIZ5Ru9C2H70hhy+N7SLWRklRLiGNikxcWGhfZUQ
         2mq+gq3yC4+npxgTi5Qig3+kn27YY1bv/czfPh8USTuEitTA3tvNLjJy9xQivU6Z+O+y
         SlExTK/zKy8XcJwrfTCXC4ZZZyI0Ui5kPnezNnD8anUQEZvf+2XCmhOnBfvhb644ilp1
         7W/WtxXLAnlVFjBLz4i7rfsH2KL6qZENjQcsrbh+9gXEFql9z/FHZRZN6jZpnH14Zb6Y
         n3fC9ykyfEAlkAxcKJ9NyS+IhF92sT1ei/i0+HsPBxZYuq9msCodVMGuFy8YXa6NA3yQ
         0zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VRmpJ2GR7OhC6pdIq7lMkxbyyauLHR0UPSb99CWiME=;
        b=YPyyd1jiXEInFzZy6A+9zccfvQOu6jXmZyfdvRXJzf9eV8/Se+ImBr9PQxZTixHkEj
         SpRSw7doCiqg7X1JUjK8iIVhmpc5jG6DfrZg2qYac5dq3nBrOaBLxNupLvoUuYulupmk
         6KBtLSeGZY1U4pYf9ixlfQvosT+4qEgxibsduZbypm1FOYRjralCVXra6SVG/Dt6zi8u
         wysEqyE9PicRryJnG5Flcpcn1rHi/5TTIbwMy/Noe6NWj1A40LexYV8uGSoAzX8MtJT0
         DRWYO0yOUD3FEkazxc+iaMtqhhqIC93dsSrifnlXP9qW0MfjdRil3rxX8SJsRlvnLYdS
         tihw==
X-Gm-Message-State: ANoB5pkU4drsqgdkhIwRDeFUmOCA6VmAIE7aan9O4EiGIlH5WaVQQjlD
	fImHyeacB9nuvWHCOMch9PS3hEmLbyY=
X-Google-Smtp-Source: AA0mqf5E0e4pWRvN8pz7x1owKAqEmFkwD3DbAa5qaWAWqsk9f5wXcLk2VpTGD58+VGUTlyKPzYzBvQ==
X-Received: by 2002:a17:90b:35c8:b0:20a:78b7:9210 with SMTP id nb8-20020a17090b35c800b0020a78b79210mr62220344pjb.138.1669792761766;
        Tue, 29 Nov 2022 23:19:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm577447plb.180.2022.11.29.23.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:19:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/10] audit: Inherit python3targetconfig
Date: Tue, 29 Nov 2022 23:19:11 -0800
Message-Id: <20221130071913.1805812-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130071913.1805812-1-raj.khem@gmail.com>
References: <20221130071913.1805812-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99865

It uses python3-config during build to grok the python specific
includedirs, therefore its important to ensure that target specific
python3-config is used, otherwise currently it defaults to native
python3-config which ends up adding native python3 include paths
which might work out ok but is exposed when target is 32bit + lfs
enabled, the headers don't match between native and target python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-security/audit/audit_3.0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.9.bb b/meta-oe/recipes-security/audit/audit_3.0.9.bb
index dcab7dcc88..9621d9e335 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.9.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.9.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
 S = "${WORKDIR}/git"
 SRCREV = "81fa28e0e8b4be83ddba03de8b816a3df510c17e"
 
-inherit autotools python3native update-rc.d systemd
+inherit autotools python3native python3targetconfig update-rc.d systemd
 
 UPDATERCPN = "auditd"
 INITSCRIPT_NAME = "auditd"
-- 
2.38.1


