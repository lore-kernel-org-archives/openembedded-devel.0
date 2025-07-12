Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94D2C83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 21:15:18 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.44702.1752354915740185453
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 14:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HBmyaELj;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748e378ba4fso3793325b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 14:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752354915; x=1752959715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gxuo9sH1dl3bdc0BkRArJIbYnUOYz8q9O1XRwM2JKM=;
        b=HBmyaELjI6QU5Oms56LPsHQOkHT9589qCZxPnA8TUSK57SJJzWTx8FMxLOfLLZs10Z
         Y7Q3Z0riIO/W2G4q9w2hT1+oHzSLJH0Udb9lxwfUBlnIoDKpYNaEtaxBXRLcRYhfEfJq
         HT7l2hfQzXu9r/pPb+VQfBh4As2T+iBPr0lYcTCeIgkaLssaH3Ww9vmHGTXeNBBWVAk0
         07NCjz1fTzOfDv2bYlDKXoe14LgHG/aPcxjR1CUaKxfl2ZW/lFnDvBpC1QmkOFq8/TyJ
         eBFvoK04R/Rk7aa2NLUqPZK9s5CCqDnfHJlLjuQcc2dfMrw1C8+iGlErH0AGBk5SK/Ax
         Z1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752354915; x=1752959715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gxuo9sH1dl3bdc0BkRArJIbYnUOYz8q9O1XRwM2JKM=;
        b=aH3jNBnRqaDAtNTTLNkf9QKWKh2bVxXtdcy8ME7/jfQ8e1HhtWEtSrDs1NkzMNw636
         dhZePbK6hBW7hqmj+D1G7+gHI+b/siGuie16q1TubUIALg4YCsz0SXxKGxR4mGhQkINB
         HGlX7K9iI4evf1TsFLcJxA+I7rh730zAt9wzXUfphguMKYMHFbPGReShnicBWCPU/eI/
         hWwAfGGkOPA3QFhPXyMw/hZJ+U3E93T0QD8AUdwfNK/wGZQMTywsoHSLw3PPeAOKRuJG
         xUcpfsP/A2PmZRkInvIvBrqEJNh1fPESmNNCXmZJuZACrGPR+TjCFkYx2FONmnP7cdNU
         yKTA==
X-Gm-Message-State: AOJu0YxhXIRL+nhAVdmuMnjVkEDyk9/0SRNGELcP8iE2pkrAHixfqdnW
	xqZCJQpMIWmYZKqQhXTMg5Y3AWfN32h66CcABL4qi4xUF1s13sbHF8V+XNv25VLQ
X-Gm-Gg: ASbGncv9yzpJbC1EF1jLO+7u29dx5sxCqQayYtmAHFiYJ0gkv1vGon67h+GEOHcdU7+
	tRgbs6mAJDydYgAw7FP7VZEPjfZumiUuI7uKYwaH08f77rtz1ZSCQil0UGWjapjPFZpcFWTR828
	0cR2U0rbEOnWKZ8CxcGvzwp4HEJAdUbNZS+uy14tXWDs1GXPe3PwcNiHN9VtG8kCV0TCKyCJME8
	0tVQtCKnLrqhYI6+OoktutJ9xG6/MIUTJfcGnc2cMEGa/OgQdLy1XEwYdaLfdLkCaxoZjzOwKrF
	aDU4LmtoW/GSEPrfRjO4PlXaaQvK0qJYxS6ExulLnxhKzJVhnR0EDp8sCRUjGy9eAA6yVO+kf6W
	0a3Qv1xd+qNI1ug==
X-Google-Smtp-Source: AGHT+IHbFCkHIe9CcdGHDR3DCBBNdLgSZs8mdQ/JMmZXpQkl0L5pki3iuUQDl4sgVmhsIqLwHvk+uQ==
X-Received: by 2002:a05:6a00:b44:b0:748:fcfa:8be2 with SMTP id d2e1a72fcca58-74ee0aa5676mr9878399b3a.2.1752354914713;
        Sat, 12 Jul 2025 14:15:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f8f24dsm7291470b3a.156.2025.07.12.14.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 14:15:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] oscam: Add DCMAKE_POLICY_VERSION_MINIMUM=3.5
Date: Sat, 12 Jul 2025 14:15:09 -0700
Message-ID: <20250712211510.201143-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 21:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118491

Fixes build with cmake4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
index 37431dca05..e63564350a 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
@@ -12,7 +12,10 @@ SRC_URI = "git://repo.or.cz/oscam.git;protocol=https;nobranch=1"
 
 inherit cmake
 
-EXTRA_OECMAKE = "-DDEFAULT_CS_CONFDIR=${sysconfdir} -DCMAKE_BUILD_TYPE=Debug"
+EXTRA_OECMAKE = "-DDEFAULT_CS_CONFDIR=${sysconfdir} \
+                 -DCMAKE_BUILD_TYPE=Debug \
+                 -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
+                "
 
 do_configure:append() {
     sed -i -e '1 s|${TOPDIR}|<TOPDIR>|g' ${B}/config.c

