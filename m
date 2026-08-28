Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E16C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 23:44:36 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1292.1787960656340948390
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 16:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pNnE6XRR;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39647184c73so2624891a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 16:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787960656; x=1788565456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXJ2Bu1aPWSzfgFSXBRSlQ6ACWLknW085ZHwiXBtdto=;
        b=pNnE6XRRRcVVer4LNdsnrzO/kYOEwzV0u2vT6oJTDJjYjq9OCmRvEhlu8q3UMFtJU/
         V7i4pjWTlF9tc+ATXGutXLp8PHMJJP6FfjrXO+apYTcbpyI4k7HiOvBSRpBRFqLQzr2O
         V3Z49hnNaRYhcf8XRpQfB5+OxxiZzMLjK0Kya6Z3FRdhBa+OnQphA6hXOFhsgXE1F6Vh
         38hcLbO114hMoMxAj9K70HpqTZLO2z4YAP3v+vgMeM47QOgMOrWj+x51BTD12gMxJpED
         Rh/cwnk0ltemIjFjCuEHAPoTs0rMoi/XeFlceTL2Dx6sMhI/IeBRHe95zc+CzcAMh3TQ
         nH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787960656; x=1788565456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXJ2Bu1aPWSzfgFSXBRSlQ6ACWLknW085ZHwiXBtdto=;
        b=Tuo7WwsxZBLRIK6/qG0IB3BXyGKRmPSgAGJ8UaHftAWVojRmuDvY+hPtihCekdNqT2
         GAbPz6b2kC/xP+dOAmY4ZAwpfPzA8jM6jeXGC/l4eeUV+8lba9xSrl8iZ8sTHP5dS24P
         nGko5pKuUdvTFz7pevXvsDjdQdvr0zz+LNjbaATnf9kUHKplaUBJ4BVJM3z68t+8hFDi
         neCUqx3CUv9ey2ZG0hzz70OkEuK6nCNjcaeRPI68+AG00f/DQcL0sJM5NfJGiOeWmfnO
         D/y8Aic1sp/nwqbutEMG7myrA2Wr0ULMiAqelRDDHs8BUyuhl2ykEzcnv2x9NTDDGOB5
         /Y4A==
X-Gm-Message-State: AFuF++m5HSkDkxWA1dI/Jdbn/txeg3MASuXTlsgLr9gGWhk35tYgpk7/
	kPGNJmQLW2gw5tztvzV4oumYT4ZAxk2EdG4rYSbhShs7xvsqygBDsDQyELv3igfX
X-Gm-Gg: AYBFou2yNXtoW0i8MzzXSlE3daMsVY6xN7qHZyU7Pks9agcwNfGm1Uy3lDcoh7vSdJz
	pCmScYgfCNN4UR7raW+ZJR8tA0wWWKzI/UHgKG3v/pSqxgXIPnlu+4cdkyQchScL7iaX5U7+/4r
	IwYb+Lj/tajzM3F4wuybrNG9zmKaGoCB5sIiqa0bq9GP7r5gClL1pbZYR3SL9nnZ13ULK0eqpyD
	3eHJHCHCqrd2Lmz+Qnfbv9nY/wNxPtcKMOvRqdtV753LzkLurA0tIYBuNBcbIiC/AlVSs2nssC+
	X8+1CScbRptfBlJwsqrkqPS4/NDlAPs8RHMug3CqCHFBJouIVSxH0KuIsumV9p1lQkbOSoq8+OL
	OxgsIvXAUvN6gxZEYNa3DaTsdegRRPqOD+DviPZYfpOvb+UecJwSM+eYbZ0RQ5N3/MPYNICAUqm
	9sx7SP0bWESvBsl6j3Uaja7B/UA9joqiCamQw1rcWcLnhYAvth0CEaG+jYFKvSD1a9XmcZ/Kk48
	LObIP4Sf+2wL1uKNRHwHj5QHDhqggDizZZC92jP6pgzYVQ0R9sOwbt6kh3t2FU4hP0EK/RttDPL
	MAJvoff04agvTxwbqSdxncXsZQBZjAmQuGXOqokk1CTLaYOPn50KPubkYVo7VpNIbQvjEL1ok0b
	Sl5fSSUZr8WTj6YYQ+H8tPaq8P1sRBOK1linHyFK//BL0Kg==
X-Received: by 2002:a17:90b:4d0a:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-3969bc44436mr20024629a91.14.1787960655656;
        Fri, 28 Aug 2026 16:44:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4d92sm8672537c88.13.2026.08.28.16.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 16:44:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Saurav Kumar <sauravk@qti.qualcomm.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH] tinyalsa: Update tinyalsa to latest
Date: Fri, 28 Aug 2026 16:44:12 -0700
Message-ID: <20260828234412.540686-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 23:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129559

From: Saurav Kumar <sauravk@qti.qualcomm.com>

Update from https://github.com/tinyalsa/tinyalsa/pull/275

Signed-off-by: Saurav Kumar <sauravk@qti.qualcomm.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
index a76e5a7447..13e99a7de7 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=d2918795d9185efcbf430b9ad5cda46d"

 PV .= "+git"
-SRCREV = "f78ed25aced2dfea743867b8205a787bfb091340"
+SRCREV = "9fab97ca07184371ecad81154d1dadb09d0fa7cf"
 SRC_URI = "git://github.com/tinyalsa/tinyalsa;branch=master;protocol=https \
            file://0001-meson-add-option-to-enable-disable-plugin-support.patch \
            file://0002-pcm-fix-pcm_ioctl-to-dispatch-through-plugin-ops.patch"

