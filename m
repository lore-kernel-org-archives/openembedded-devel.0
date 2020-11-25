Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2744.1606281413993368296
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2020 21:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iQSF9UIW;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id c66so1231478pfa.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2020 21:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ejCicpttlFFq6KOlOY0Eg9sDpgTL0Ts7vzMPDwi+EuU=;
        b=iQSF9UIW8OF6+4U+JBZA7QK9GbB/mQBBaInX4fjb0uwtm4fAwg277IO75gdfgONFWL
         /GHYXnqpX5ucaBafWWCTfvWNOX2vCq/0jSC2ijtWV3Fq2L/a36uV/nkPaNNSWKWkl3VN
         8gP77iVPqSQ2pKorHAjUQREAQbhHL+gdVbqIA0F1/W/F7i3+f/vZq6aVxrcgOAMK9YcE
         PLDZqBf2MHztdnY2iaCvI1kkeNKDA8QsexmWvJNpJHeZXZ4m9wOVYH55BqwUzmvNqaM9
         bJjZ8kJrmZk9BskKEKKl/0P5HS83LdNDDZAeZL1Oz0ZQTFwDz85KqPQW3cVI3Zt/mHSx
         zyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ejCicpttlFFq6KOlOY0Eg9sDpgTL0Ts7vzMPDwi+EuU=;
        b=GJ7sbGgAzpbcUgJ6rST/x0mSlqBPDPXV7bHR4NOrOR5dTesedoTlRTDykQO6acHxMZ
         8sc08l/SUk1X6bRrVdMSuLDghAJIWv8LzSycQp8Vq0ey0FbrOrpE44/8eQyUt8QrUs3W
         /Ga5yxSGDNLq1fyA9u6yRBZ1kmXsR0nFH9+c5/OnILmAsuE+Q9pMPBQGahzgrv2oVhXf
         234mCHWS2CgpDycD8Y4z9ZLSTd7//bSnJYvM54kbQf4oRRmMXlwaWte8e/LI9+8qS3ya
         dHJOjEscCl0uIJuwwCh7fn45XScMZS8E214vEs8OYmkaHpKDkyBpSJwIZMPBFMnjzrCj
         g5qg==
X-Gm-Message-State: AOAM531RBOx32KQxAIne4EMOd5lFqOYkHzRfoFDZna3ndL0dhoq5UTod
	ytYLn2JEodcLcKVYNZNS65K2VfHNf6YDQg==
X-Google-Smtp-Source: ABdhPJxYA2iN2JwLVT/UOTL30hfFP9Ba2RqdCJZWX5qhwocTa5LK1OOflMDx6UkLTA3JEA/lddAXRA==
X-Received: by 2002:a17:90b:11cf:: with SMTP id gv15mr2134512pjb.11.1606281412797;
        Tue, 24 Nov 2020 21:16:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::ed1a])
        by smtp.gmail.com with ESMTPSA id u20sm794886pgo.22.2020.11.24.21.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 21:15:19 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] canutils,can-utils: Add cansequence to u-a as well
Date: Tue, 24 Nov 2020 21:15:16 -0800
Message-Id: <20201125051516.3251202-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_git.bb  | 3 ++-
 meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index e3a045bcf6..b44942303e 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -14,6 +14,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-alternatives
 
-ALTERNATIVE_${PN} = "candump cansend"
+ALTERNATIVE_${PN} = "candump cansend cansequence"
 ALTERNATIVE_LINK_NAME[candump] = "${bindir}/candump"
 ALTERNATIVE_LINK_NAME[cansend] = "${bindir}/cansend"
+ALTERNATIVE_LINK_NAME[cansequence] = "${bindir}/cansequence"
diff --git a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
index aaa2653483..8b13daea1c 100644
--- a/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
+++ b/meta-oe/recipes-extended/socketcan/canutils_4.0.6.bb
@@ -22,6 +22,7 @@ inherit autotools pkgconfig
 RDEPENDS_${PN} += "iproute2"
 
 ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE_${PN} = "candump cansend"
+ALTERNATIVE_${PN} = "candump cansend cansequence"
 ALTERNATIVE_LINK_NAME[candump] = "${bindir}/candump"
 ALTERNATIVE_LINK_NAME[cansend] = "${bindir}/cansend"
+ALTERNATIVE_LINK_NAME[cansequence] = "${bindir}/cansequence"
-- 
2.29.2

