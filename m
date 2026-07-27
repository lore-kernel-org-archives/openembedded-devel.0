Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72839C5321C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 07:45:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26031.1785138311873725049
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 00:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PzsD2/Fb;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceaf8a1265so28515945ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 00:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785138311; x=1785743111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APzvHpOF5/0T8R99rTwYNK7qbVuKMeyMVRBZCYecQSY=;
        b=PzsD2/FbwFoQSvOhW5d2RcFkg2+RhUqaw9NvmWeqI4MCgccNciP55ly34kvyCd7LfG
         yJ5NjH2mnQ6z+z4sHv4WSqNbqnGw2JZZB9Pmhri6bi5BRuW7NTkDNr6su3BFH9/WHlVz
         V/RhSJVjl9DdCLvMWrt+qA9anO+Tm3+zmIMyCYEXVZ31Iz1q5U84OZlg5Z9cVNJjMkme
         ufWc2VssQ63jVw7CpO++C4YPpoMkB+QbFKTlROpA7FwFarjdhO98PfUpCnLE3aI3PESd
         m4Ll/Y06Y9vbc5TLqPFCcij9w4nR28S7iF+RtiH5wU+IB8A6URKWu73ZalxHcDqk50OG
         Uz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138311; x=1785743111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=APzvHpOF5/0T8R99rTwYNK7qbVuKMeyMVRBZCYecQSY=;
        b=QJc2zuAKp1cVKLzASq7GmltFZS1gho7Ism9NaoZZJDsz5f+baml12IfovNiQEJ/t09
         Y2hGqkH5mIDeXrvALU8cTFWLVYHP/kPgys22A8x5w4zM14ZzpCr+xepPb5VIFwkhgDnU
         xM5cpM0F293y26fB2ceXh7H4Sm4HQr1C2DEl9Jedyuk+rBPtZOjmhfdaVS/EAIX3BtAd
         V2JFd3V4dXVm6tSb90AWDuJ5wMleSakmG4qAUPugBbWd+mwsJV/7Cxfu0HB6HEUKuUdc
         QtJo04zrQldMNJTivwe/g7xA2wl23odhnFZGUIBJHJOhA5m08rHIRFOsV1ywOTm16p95
         C3KQ==
X-Gm-Message-State: AOJu0YyuL+vIJjqn4rm/76XHxRvumzoxUokRDHmaj9hwFKAL4+esTcrF
	g3jiHTKHQWedAVRwV2BN3XzNLb2b0Xtt5ZpHASZ5YbXgTtIob0ex7xcItjD3Pg==
X-Gm-Gg: AR+sD13a/rIaJOE/pGCLOQYn6ZtVHMsMWjEKsnpRIFwPwuIvoafyDLLJAFLFHUuYhvY
	PMrorf6z+gfr99vnUsoQpMXYFUtLrZCy98d4TXChD1jHr/91n1yQqTGfZiSgs5ZEyOj5n6W4pbp
	K1QZBsYBTxPXOqvpK80Tc+EgeDR5Zwzd0Un5mVTdinIOC0Rm7y2Tq4t0oT6fHYSO6k5z+r3/WMq
	MLHi0O73s/HMJz7dpO0+TYGVkOFQwxU71mRufDLEF2jzTGSY2kyHe1K3zjKhwHYxD6brp2lv6Qm
	5JmTv2p2zs7OhKYVhrOCw4ZOvdY3EWN0q1JTcFc1isJYN78tQAL3pgYKfbSBJneGUr5KhpRshBz
	PNx6h3p38ARygFbvn5aIlb/ge5o5ibblDmeXO+GjuUZEIn9e0mA4DbE58BaFSWq0Knf1l+TAA63
	4WZnen/qklQt7VwNk=
X-Received: by 2002:a17:903:46cc:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2cfde67beebmr70425705ad.2.1785138311072;
        Mon, 27 Jul 2026 00:45:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cffa9243fcsm8648945ad.64.2026.07.27.00.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:45:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 2/6] libiec61850: upgrade 1.6.1 -> 1.6.2
Date: Mon, 27 Jul 2026 19:44:57 +1200
Message-ID: <20260727074501.3707659-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
References: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 07:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128456

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
https://github.com/mz-automation/libiec61850/releases/tag/v1.6.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/{libiec61850_1.6.1.bb => libiec61850_1.6.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.6.1.bb => libiec61850_1.6.2.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.bb
index c46ed88d83..f87bedf649 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.bb
@@ -13,7 +13,7 @@ SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "swig-native python3"
-SRCREV = "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
+SRCREV = "f0f797bf955da763353f7081c892a1ff6b55e5a1"
 
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6;protocol=https;tag=v${PV} \
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \

