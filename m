Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD8DEFCD95
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:33:54 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11204.1773052428014576022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WSEa1a9B;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c736261ee8dso2682685a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052427; x=1773657227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4y9jjjAUStT3OVgtuVV2ln9Bip7uScx4q/JNNjfzs2Q=;
        b=WSEa1a9Bnvfq1TfcrVcOHbfdHJ1cs8FCWz9QdOf/PdhJhJidtSwJHLYuBr/Ro54gjb
         JcoxlkhOzu+t19rS9niOTs4UG3QzIOLkMe658ynV51Y1wzbrh/kpjE0Bj0cz43lPD7kg
         q09fm2cZZGFRtJyzcDRLU3y8xDa8lZab9GCoOdRG3jDnlsjXON5jKpUqWn96/f1pStme
         EdWvJ87ZGMhQZB+ZPVZY+MEYMJUCvdAPD5XvU4Pq09bULEbpwlf2jgX/DQc1v3lmcTrt
         Et0KrO+v+XTLobIdEHHUCuWNACsFC12WaNAiLY2MRcVs1q7rMgx+9j+3xqzmF7f1T1ZD
         Ogbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052427; x=1773657227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4y9jjjAUStT3OVgtuVV2ln9Bip7uScx4q/JNNjfzs2Q=;
        b=bQoJOiVt9UMQHhxn1P8qtfTLDRSC/qV1eLoL3m5XbpntTEWspY5qb/6Nyh0ZTM2RNp
         6sWQ4xrnBUzYvlyeom3IoRlLNzOzTYtzLvIPmHQ3BCG0vvLubBesxPiH4x8YQ0bz6tpd
         5uVSQ+GphAm/rflFc+Pm2P6AC1JtJOSKtMHU0n52lXqcZ1o8/hnD9HJENiknpRdpH6DD
         upg8YMARTQCHLaKrzqRtyyqcYZV9cJHbHndfKDkKmdYlKii1biyw4MH5MiQGhD8jseWX
         r+ZYSju1FsL9UA03mtrDkny8+ORAlZGNIuN/6cTG84qHZHtcq4JHuT1Ry/2lnyJbjXJC
         kVCg==
X-Gm-Message-State: AOJu0YzR/9+Rt6dQ/umMjcL3dc767B27Iak3ElMgATy3y2xwkJhmmnW1
	tiYhy0yMDPQfaGLf/cX5tDRLU6eQZHygEWohr4wMLr4MP58YIqsmNQNBcIDSLA==
X-Gm-Gg: ATEYQzwqf8bIhxA8R3ncmuH9ZHCGP9K1TqUkxjbHpa7VDWFm7z8OibqzXiCBrn5GA+d
	ESQcRefWmGvZcm7vfky8PSeyWIP2DbLEXcjmZtULsyz6wCa4w+/nNXW/p++++DOqfvfEfZbe14q
	Gjrfkhwvb7WmriqadfdTvDJ3QfZYVfklqaYBDqB9lweYCsJKh/TF7xJKYpZCukpJlawm2MF8Cup
	y19TF4eycjkuEPimknooUlaYsZPLKCqQBsIcQ6BVeN2JfZW2OtAdNSjq3UTuWkdYI6x5sTN0Zws
	8m9nzJ/2x3bJre5kmROXIdNbJ4Qhez9IsU8aucm3dqOcYpu6KKfeSGNVMhLhHrxp9ocVURV68M0
	5OAC0k2l1e8AR5nb03TMoEpBNugauBZQSVoAkh/VT4kz9G9RmU4WtO8gi/nYzdgEcs1CYSxFVJf
	k7Eo/AS/rIDQ0QBzn/uTw7xj4ZKemlhAZ4ANM=
X-Received: by 2002:a05:6a20:160c:b0:366:14af:9bd2 with SMTP id adf61e73a8af0-39859108a85mr9634453637.72.1773052427142;
        Mon, 09 Mar 2026 03:33:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4865c6csm9821496b3a.39.2026.03.09.03.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:33:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH] nopoll: upgrade 0.4.7.b429 -> 0.4.9.b462
Date: Mon,  9 Mar 2026 23:33:36 +1300
Message-ID: <20260309103336.537556-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124995

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

0.4.9
-----
Stable release with bug fixing, support for Debian Buster, Debian Bullseye and Ubuntu Focal
https://github.com/ASPLes/nopoll/blob/master/doc/release-notes/nopoll-0.4.9.txt

0.4.8
-----
Stable release with bug fixing, support for Debian Buster, Debian Bullseye and Ubuntu Focal
https://github.com/ASPLes/nopoll/blob/master/doc/release-notes/nopoll-0.4.8.txt

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nopoll/{nopoll_0.4.7.b429.bb => nopoll_0.4.9.b462.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/nopoll/{nopoll_0.4.7.b429.bb => nopoll_0.4.9.b462.bb} (89%)

diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb
similarity index 89%
rename from meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb
rename to meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb
index b4f8605136..dbe8407443 100644
--- a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.7.b429.bb
+++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f0504124678c1b3158146e0630229298 \
 DEPENDS = "openssl"
 SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "d5c020fec25e3fa486c308249833d06bed0d76bde9a72fd5d73cfb057c320366"
+SRC_URI[sha256sum] = "80bfa3e0228e88e290dd23eb94d9bb1f4d726fb117c11cfb048cbdd1d71d379a"
 
 inherit autotools pkgconfig
 

