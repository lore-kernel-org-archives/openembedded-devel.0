Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6495C54F55
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:27 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3028.1785293065615876102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i6TscFWy;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso389017a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293065; x=1785897865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dtWzqJMx1fsoKJI2LqbbVT/LoCeB3MiAlybeg/Y2Gg=;
        b=i6TscFWyYZFJOw3Gi0FsypeKsBI2Bam1hv8AU9+5Wu0rS/91sHnnUw8cnwKHtn+e/A
         8GWoK/SonBq6y+MznJoFspqjEGlgPywXGI7Ur6D5sb+cc+x2+Zryl5zxsq1vIpq2ahrB
         PUC7YPmPLNoTnEQE2t/bIcjOqJDeTRbmoI/9IRZ5wEe/idkmbqaZQmn8emv7mCfgUYm8
         wwratcVXj3uKnwnSwLe9LTTW32xnsEY2tzNVkNdzQT54STlc8h3526GazV+wkItSHX26
         DfMAiCGM3ObALO3Pb8S5rlXFvMqk4m7Rvr/HNn1fNteMUTWpy34eVULe1wLSMf13WkTy
         KliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293065; x=1785897865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dtWzqJMx1fsoKJI2LqbbVT/LoCeB3MiAlybeg/Y2Gg=;
        b=eYTM5O66RViAXnVJqZe7GvNSKmaze8ve3DhBkrH1tPJV5zfWfHvkevmDplpLjjTn0j
         bcec/wUOXK+Iqi3UpMhgR1Pxo6pgAHptDRLV1lwacFTWlH2bspaA5tZFnoMdS3nQmGSF
         G74FSrblnkGqeaxQau0BMXIDhQ1H0hKCxlUqeWd1ope+H/qrmpFgK2L89WXTlwIT50WW
         Yt63+PHmSAsSfvCFnykmBsvlMDgGFJ+IKEzit/sLTtrAQQR8dPAPoeg58seY3pN5vx2P
         gZObF7lthjlFUULsQydFE+94bvgxpAszO5oDp/Z0s1+Xzgp+cr4WgC0wNmESKccfbxVZ
         UiTQ==
X-Gm-Message-State: AOJu0YxK6COIW26kbt823X5NA7f+PWse4R4+C4J+oOSHB/MjxBQP4t6w
	1GJq6Mlnd6WwVPPG9ce+HqnVbJY44BVNiidy3GecF2KPo6yDDRl3AANWsJ8HssEp
X-Gm-Gg: AR+sD12ehEqEnzfB4Nt5LDAwf8JZDmpmrCbBJq+I8rQPgWGTsOUQpEr32rX1QInETrP
	8jee3rQJ1sDiQqCF758zzUYHX82VanyJPn5f0BgYx1PGbblR+pHg4SVpj81fd0gNJoH44dGm+Gq
	4rDpOls42s2aCV5ck/ynhE0LWboaMmU08neArky96e3ZmhcHso2gfcoit3wHNRynGl+GRmg+T+9
	uXSzCDjYwtSwxZbSkv4icmsR3N6FRuR4dNSNjM2zuAu83yRObk6CeYZBxdx6hgx49HubW9Cwucz
	wAGq7PxMIZdvgQ/nNXp+/uYQ8hk0zvFhETqlz9iI3biwCkEUUqVuz44GUmtVZnDYDM/AxkYYvHi
	2pC3sjZSnKIP4Gl5TTOc7K1Zs9CJprcHnBnIxG7Ik8QENHexsdU+WjxIFuGOeAaFSIS4abPJD2L
	Ehu22AqKK9gTjl8VStmC/wNwct+Qvr6nj5gaK1FIn5GMC4EAxbCDNqRqG2hpM1EOt9iYxQAhDk3
	TcSOJElVfEGSC9OV879UN8K1XBfs7Ii1pbUmaPPVlPHi2iWy5L4BZBPk9P58bMg46boaO7xHVuz
	NlW6CenesYOkPQu433xvkOzkJQdRWA/Ze5aKUbp2YPuD+Z+YuBXT040lyqysxqUGjdn4E/Sv4/9
	a2Q==
X-Received: by 2002:a17:90b:4ad0:b0:38e:11ba:992e with SMTP id 98e67ed59e1d1-38f6a544ac8mr4344670a91.35.1785293064829;
        Tue, 28 Jul 2026 19:44:24 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/18] ccid: upgrade 1.8.0 -> 1.8.2
Date: Tue, 28 Jul 2026 19:44:04 -0700
Message-ID: <20260729024420.2328180-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128518

Changes:
- 1.8.1: correctly close the slots of a multi-slots reader; fix three minor
  issues found by AISLE in partnership with Red Hat; other minor improvements.
- 1.8.2: fix initialisation of composite devices (such as Yubico tokens) and
  correctly close the slots of a serial multi-slots reader.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/ccid/{ccid_1.8.0.bb => ccid_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.8.0.bb => ccid_1.8.2.bb} (83%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.8.0.bb b/meta-oe/recipes-support/ccid/ccid_1.8.2.bb
similarity index 83%
rename from meta-oe/recipes-support/ccid/ccid_1.8.0.bb
rename to meta-oe/recipes-support/ccid/ccid_1.8.2.bb
index 6ec6658cfd..49b572f2cc 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.8.0.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.8.2.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN} = "pcsc-lite"
 
 SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "531dc29e7c1b9e22e1918f0767b625d52ce8a98f266eb2144c5cf5dbd29c0f67"
+SRC_URI[sha256sum] = "d74294e23d436546c3e719c95a4da180b17f5e7ffdd36efca53f75351cb0de75"
 
 inherit meson pkgconfig
 

