Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAADC5DF98
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:58 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13155.1787485972911510315
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MpYwc7T/;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso34106105ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485972; x=1788090772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WB7jo5/IpeXggoJSOPGONuWK4UvN1fDhdDanupemHiY=;
        b=MpYwc7T/pK2aWf/ZsfKd7zAh4zebkFLfc1DQzwPvrvdEaqeTmL6bjggNlCuFvoobQU
         Aw3OvpDg+13gCGgXyosICknv2qdSJHpgP8bM3BWXNpqnAOJwkzzppEq1Ggltu8WQ1qeT
         6yU89i6vpSoMGUyE2WDUCe7C3F0fBRab1zG34nYDXUzHhImirbM97htr9snSHMwukncA
         e5nnrMIdjYRfcLxUHj9MN4Ru6+YzWSXb3tmXwjPe6U0Z2yB82gsJZ9KrVL9ig05MMw+k
         IBikcwobaYS2tBZnv3nczaVeSMRmcwZdOQSOF+oxGgoC5nBCD9M/b6CbEkXhu+nZCseX
         Mopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485972; x=1788090772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WB7jo5/IpeXggoJSOPGONuWK4UvN1fDhdDanupemHiY=;
        b=EV0CXkWWqEi3kC4KxWzdqKsc/MWE95guHn6gOZ/oLW3ewxzNhJeXsEX8upuZkTTwax
         TuqaTVOdEWAG7jDODs2Xb7wcD31ZvKZrrT6a0G5WqOXxlc504pTXh40mcZhlUG8fAbrr
         l8DwD6mZ2Iiejd2COsi0VptqUxzuw7EkEfrFLqAhIw4wCr1IJIYHYKkTxr7PmR2hMp62
         CfRIRG2Kkkjx3RXvfAl7y23yWOvuKfPt4k5HrHRDw5uMeLHCrPn/vVRaekwdJhhHYrIm
         u1vQobTZ9Wz98vmpAeXmXSdjBqkrYsjgt96ZcuymJ/Sn3luVpBeTi+W9CuIT7Y/xh43g
         g3ZA==
X-Gm-Message-State: AFuF++kg8+r87G3/K3mqxaSyZqaHzJ7khPja5qDy4GA+0dgPKE8EjptH
	kuIR2cuKp1jY3bYQwM7kRFzf9CefYNBzrJagCNrJyXxGCxKnqoLgwSzUpB8BkA==
X-Gm-Gg: AR+sD11xpgxEHDyPnSrQ7ZG5f5xCYnL3ori1FMqg44ALIzmkP2UrwNLxoPaFyrJt2hw
	Dnv67HAACuF+OmeqajcWyoQMoyQPrvVplbp6GrbgSIzXJoSpVU3nbUSN+w7Vyg1JmKPxj7JzHPh
	msn3JeEkntylzLSAhCyp8f70pu+izjWyWUucNWXvE5lgm4HEfT+gDqkDKELt2NDK7gjK9GxK+yR
	41YgqVVmsaQW1G82kpG9XiGAsjymPcis4JDxrli7aE/B0t8O8Ma5frgDB5FgRW3CEg7lZXmUGeG
	b5geM+8OwT9Rx5QQPntz67lZW1WkkOHUZ6emYtH6riPwfVrJaKES49Bgl1kwvb3Ea5ARV/7KZL2
	VQxnDxt43VoEG99PmJlOiAaf9gkMHxplGtwCEnCXp1eTGibgsbMF696xJSAd9Iue8TlOVuqvooo
	crz81Yd+Uin4TQix1vxHf9PZuWuMloWeOzzHYjg8Hntq2vgNDqBmVVFXMlV0nGRUILG1pc0GbOl
	A==
X-Received: by 2002:a17:90b:5646:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-395c36fb278mr36740398a91.9.1787485972204;
        Sun, 23 Aug 2026 04:52:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-webserver][wrynose][PATCH 17/20] swagger-ui: upgrade 5.32.11 -> 5.32.12
Date: Sun, 23 Aug 2026 23:51:55 +1200
Message-ID: <20260823115158.1582363-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129451

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also updated branch in the SRC_URI.

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.12

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ff75d96062d077bba8051a9badd55112087aacba)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{swagger-ui_5.32.11.bb => swagger-ui_5.32.12.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.11.bb => swagger-ui_5.32.12.bb} (85%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb
similarity index 85%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb
index 19000d6f35..bfeb75f6ca 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.12.bb
@@ -10,9 +10,9 @@ SECTION = "net"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "414a60c9a40408d37821297682b8a190a840a79b"
+SRCREV = "9b5acf38723108ac816dcb7303897e87f933ac4e"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

