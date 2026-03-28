Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAB710F3DCF
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 05:28:15 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5989.1774675691147008498
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 22:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U1qfeiJJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12776bebe9fso5623456c88.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 22:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774675690; x=1775280490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLVTfbcuvINYLoYmyF823EOhMIaDPpXWe+XXA7JGigU=;
        b=U1qfeiJJiaqnmZKZJRekM+jbk3wdqKrXjML/De5ymmbTOnxLAwYkzCUVTPYw/sWTHD
         diwFrkO/WPvU93GcIVI/H7lRB32SqCxUqUr5bkPQpJRx1MsCyqleowZh3JWuqmbeedGL
         l3bwYQbitRsBB/bfl06UqXdKVh512XquZkv8TZSM8pdwoAdrNjkRkTLWXZJb9ZiohGTj
         H3FjY67X6FRvgltpZq5J/97AcYTyYwtoWjzkedEQqWawiTghwghLaCf8NhTTUR9N7etS
         8qK/x5W3usKc54gF+8XINMuol2fDb6uLGekaeNaXW+XF5mgdi6vQr/1kfJs8bOLn1bO9
         6qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774675690; x=1775280490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLVTfbcuvINYLoYmyF823EOhMIaDPpXWe+XXA7JGigU=;
        b=Dq2YiRfmQUB+EZ0DnWpF0cdGaYe1lSaQP4jwxwlKa2n58FmfH/G5hUMOz/0c/83ZNh
         Bn+6/2eFfzX1NHtawI2NBWRzW0PqCu93mCF3tVlITnbifujXMiNxxQLcrBgLCRZMRHL1
         9SHdb7HWeG7gT8ucigNSmSNnEPz46hKakbSQ7gKAoqnB9UXjKZfHVHR5SILvwDsB/sg9
         1pfhjcAfEE/01RzMvjg+NnDr2U2FoIZPo0j95h1wL4D7fNQixpuizboNpSdfOFFnvKtE
         pGr9bNLt2A/oeFHSv5RkB/FBLkajaJTpJtQD4RxC924ez54hljSZ8v4VCZ1d1uMYvemz
         qK3w==
X-Gm-Message-State: AOJu0YxskVj665m5JPNOJ2BJOhIxf9WHjutcA9/FO4NydHHGg8bSfcxN
	EFGBJAGXRqL7/ATFB3JrMLMN0MokS4i+C7FaDtBKr5E0qYxCLZd+7K8mgY+eRoDm
X-Gm-Gg: ATEYQzwCfd3RED3+Qp9/FaDR5i60vlBkt66W82vOAfyYbCE//wG27pzQ1i6dZA1wmzf
	ymD28kanWPCLdIfGfeMGkaYlZQPGRYVFEtfW4aTHfsR/FvH5ndh9Gn/aPIxqP0/6Sn4zRLf1f2r
	vdd9sAghpaPfv6bpe92bGhM7Vb+K+w+NN2b6/Zl922gjjZECF1dH5B/5+hA3Lv9i5m/8dbqavmn
	Mx5DO53V5Z/LKw12w/Gx5Uu94qbojdiCho2yc6j8XGLNbekO2qlUyH7YE+YuJXM0d5OdZaApTZS
	8RAWmjfK1+YxL1ESj1lXhfoUdGwuQfxPDMHPN5n/W9LfR0XOmI/fglqo/1jv4AIz6RoOFa9heRf
	zfcHO4SI2g8GdoMnIHmMvW7B2ZbZaY6DbLbA2zdZ9DwPqSaVRH2RbMLy3C9cvXffBlgVc66X/Kk
	6IPA6gS17W9wzr5rHPQp/E+RshjafjYSSDYA139nE9u6IhLHqZ2g2xkKZkt/yE3qkwKDZ1/rRuC
	FiSwdjMhW4i9Uegt+eLBkVihx2pFwQgqfCQkwnAKeFaEGQmIBPpu1T8s2nl
X-Received: by 2002:a05:7022:ea30:b0:128:d7a7:5261 with SMTP id a92af1059eb24-12ab28eba7bmr3554312c88.30.1774675689944;
        Fri, 27 Mar 2026 22:28:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda07asm1305648eec.1.2026.03.27.22.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 22:28:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Remove protobuf-ptest from packagegroup-meta-oe-ptest-packages
Date: Fri, 27 Mar 2026 22:28:06 -0700
Message-ID: <20260328052806.3132878-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 05:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125798

ptests in protobuf are disabled due to pkgconfig -> pkgconf regression

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0cbe3964c4..c74114ee61 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -950,7 +950,6 @@ RDEPENDS:packagegroup-meta-oe-ptest-packages = "\
     minicoredumper-ptest \
     oprofile-ptest \
     poco-ptest \
-    protobuf-ptest \
     psqlodbc-ptest \
     rsyslog-ptest \
     uthash-ptest \

