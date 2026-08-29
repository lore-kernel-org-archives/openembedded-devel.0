Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9903C61DBE
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 17:41:37 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1078.1788025292078118483
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 10:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hQc/Tety;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d71ae3455aso31676195ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 10:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788025291; x=1788630091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pErUq+uqqrp1I6qbpAQWI6M4epwJt3Ia4Kyk7aNlm8g=;
        b=hQc/TetySLixrBlONhHVaoJkp3FlVPZJbqzd1dt+WeYekpK7qm1LJ2a0uhmaPFAoWo
         3zNBLJ6EleyxlnY4e4hpIUXvScB27nbpKGSf6iceQ9nSXUyuA1CB4DjrzfCpbuez/VlD
         wVNkxnZhM1o2OhAJZCgh487CI6jc9KkWRfTWTy9RSUAlm9MW7xvhyZsshHU73uTv2IQX
         IQE/I/yw+Ky7VO+6dbRlQFWsY+vCb2IUuJKKVXyxWJOVILFBe1e69p/kQmmC9RGE6UhS
         3UIBawp7HCUdmLAeTKd5K14cMKKT4JreuDpLjRzMef3CYoHycn0dXBaxJoJa/WvZMQqd
         kRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025291; x=1788630091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pErUq+uqqrp1I6qbpAQWI6M4epwJt3Ia4Kyk7aNlm8g=;
        b=V2dE8PXuFELLiE1rmoD+3sy4RLFGPj/xXG1VtvIsi6HQ+3c3qePOdeO5y7keTXnBvv
         /TfOtxUM0trstBCv4ZDa+WJkBpF+mBCejVvPpJfuaRHHw+X0cJ2Hwv4Yn7fkACuCkDkE
         2bDBeUByuqXNo0djCLVGOcOV5Y9RcKm1loZAWvWdZMbU8zj3V7F2GHBY/SGIMiHwXjLm
         fWqd2T9ODjhVqK3ryii8X4mOsFNEJj1zYSUhv0lC1uhqYWZ8ygJg7b1JG9jHCiDCxCiU
         QMZetGy6wF7MAoXcHijIUVDeP1qiHrqYL6qKM1Vgl0GuRvDUXM+iHkiFqdIcYQvYYlaL
         jt8Q==
X-Gm-Message-State: AFuF++nNIMyVxD5Ef975sesYx7Pxu5tQ9F9DChoHN6BhGhbdLnNG9wZZ
	NVgVarkabGoYqyuU0lRrfTebnA0uhtqH0emGA4TzISGODqGVzjQchNgP1jjIFopn
X-Gm-Gg: AYBFou2fhvcgYuFw2SzxAO2EPq2Z1Op9Mu7Bdm2DbpNs9knSt6676goNFAEoPn1WGmQ
	iaZez2n/HQaNgswn0gr4abGfXxn1JiUQf5ATPcPHb4MGHZKKoBuOSvULkqPYt4pqGqAvSEUn24u
	Oi0lYu7VoBKy+4XlK52mpHj5PxJRpTbLVUdsalR9vWBv+gTw8whlTn0qhE/QDzutjUASFfp+VZi
	Pnm2Py7vxs0peP1OEYzDX2roB7qdUInbYlyB2tP7GNCS1gkh91bigiXWrMjt1NswKl+B1JGK6il
	9GIKS65k8b0iQtge1k9F5uhl9LyXVwjtJPqo/n8ESMskB9OpWYxReUfUHsDoieZMcM5nJ1dDVcP
	z+roy3y8R4wBg2WjQzeU2rVL4fmwpJVJB8yyCdXWSLBPBPVwBLCDHpLBUv3Uct5h1fDHn4ED3P+
	Uu3WsWaKHy0u4YQLsJ/kPxCwxSG7kdEyDzsblGHkCpA6mv73Teged4d6expkb5v0amVghFDoBvn
	1S9qHOIqLyLIZ64dQ8+d82adhRuMV//S/Wwcyl4ftOpLQ/b936vp9JUplSiWsHChoIIVKrsATsp
	D5xAcapxsMySnRXTRivzM/DMsK83rRP85LqNU6RzuzxMQAi9stu1J/gAMexq28hPq/lWVHRDm0U
	7DFnocpzvFbfhtreXBoUYMcc2ztdwqC07nfhK1AMXHOIIJA==
X-Received: by 2002:a17:902:fc4d:b0:2d8:d4cc:5bb0 with SMTP id d9443c01a7336-2d8d4cc5d79mr134584995ad.16.1788025291230;
        Sat, 29 Aug 2026 10:41:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b4bc05416sm3374349eec.6.2026.08.29.10.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:41:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH] srt: Match SRCREV to tag
Date: Sat, 29 Aug 2026 10:41:27 -0700
Message-ID: <20260829174127.2823926-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129579

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-support/srt/srt_1.5.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/srt/srt_1.5.7.bb b/meta-multimedia/recipes-support/srt/srt_1.5.7.bb
index 2796ee443e..7d992a1245 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.5.7.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.5.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/Haivision/srt"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"

-SRCREV = "d99d2e1a3b1a213b03c7dfbea5133898935fdeea"
+SRCREV = "899348d8318eb9a3c5a5b6ec43c4a1114288773a"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master;tag=v${PV} \
            file://0001-don-t-install-srt-ffplay.patch \
            "

