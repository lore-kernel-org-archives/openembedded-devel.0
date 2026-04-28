Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2C0FF886C
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 08:39:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8395.1777365586666076392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 01:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cQ8UGKu7;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so146742455e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777365585; x=1777970385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQQhu6OxmWN1A6Z4Ydzp9H1K3Xh6cZRDa6F2mg3T4ms=;
        b=cQ8UGKu7PkDJDdoj9eeRDMKaR7HU9jarU72hK8DOdRKXG1L9ZApBEa/w2OGBBgnoDU
         z9l9D6gxXZeWjUF4x74dj6pZKvOnko3QQlthho+Z5eSvywVulxg2xizjg+v4Z7LiCzTy
         pmz7IlM3F2sfI1k8DEjAZZkv6aA8eLid2OWqVMSsmVVl3ydSkKGqCio5/vFi/4sZA1Iy
         KHT5Sf/WdUhKWHwvFGU3Q79wS4htj/uXPK6j42yHrroxREC/jwE+4oJta2w4WKRx3Xrs
         fewwzrJTm3ZP9MC30c92oz+guB7zEkO5MwA1nwzaPmPVfJK/mNQqXQ9L8VuKRcNIvNNM
         HUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365585; x=1777970385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQQhu6OxmWN1A6Z4Ydzp9H1K3Xh6cZRDa6F2mg3T4ms=;
        b=MQwZjY8CdlhmUegHrOTb7hAzG0wvDP70lnDDrDpn3tFp5tz4PfXHMpnjWol0m3FGvJ
         yQSBe5c8psU7YNG8Cy0ZgdAIWTpzVyllLikOz8msuybhx7BbzHKGG4QYIcUU/0y2+OAE
         ZFE2X0N5bvdziezfwMd0NMBtnRzwyWJUEfC3SsJz521872Kkz59mbOM9Cko63sq0NeBY
         BVKP8HrTMRqqFyuCOylJCJqgglq0vYHmpxq93ti8Jt9hfdwfAE8NTm9UTwLHcFN8EOD2
         0QQnEf8mhH2fWOf1J45RMPfcKS4CrlHFQ2X9B0vRSSCehEBZidNuAaTrlAGXyJ3ctARU
         S1Mg==
X-Gm-Message-State: AOJu0Yx+UyPwVRJ76uA2s8RYwIxZFU8Uqk5hCt1EFiPsMUAn4rqbtTDr
	HOeF6es77w3fbg9+dhmOVP11bnjL01nkRWnS/594MqIhCcv6sSqG12BXWCi2pA==
X-Gm-Gg: AeBDietGk6SAUT4uHbZ9Vs7S8SlWuz3W3KE6OBCZFtpocIlcjWzXNunOqaBlWi7lSks
	FLJiusZbd9VkttC0cPQ2V5P25NC210pZ3o8gBkT5AtFrTE+X4CK1CuT8sFpjjXP0jJ6GDYJLjd9
	nd8Qohi5v9oDhj2BNc0oZ7JeOIBNQHvYF06l+0wN0QwclRShpUtWzd8LgEBMCuKocI8lG8n1qNp
	QIkrOgO5akOplO0o7HdMy/lAqvJqR2maWfqKFp/Co6M7Ufaezb3zZzFwzymU+qWVDp6hE0IwACh
	sU8mGzvZC+sUgtVuO+f7pa7Ye/y5eJYsrtH4ODHadFz5sIDSiOREW0T35DlfYLd+RUUnt/QLkhm
	fKaYS6tMNToe0ybf6xJIcQbvuSYIzXWF1sQUyrErPAngaklFbk5Bnhtjevw/fTpWBYvZ7hE8pwr
	pVndb+Y9atmadrvaojZBxk/3sZTIyYwTraznimpctkyB/h1a/Ubw8Fyk86
X-Received: by 2002:a05:600c:8b11:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-48a77ad470fmr35594385e9.3.1777365584542;
        Tue, 28 Apr 2026 01:39:44 -0700 (PDT)
Received: from Unimatrix04-Noble.. ([2a02:b027:14:a58:8a4a:450d:fe9:a973])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7743f922sm20064915e9.0.2026.04.28.01.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:39:44 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.2.8
Date: Tue, 28 Apr 2026 10:39:35 +0200
Message-ID: <20260428083935.70597-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 08:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126648

From: Gianfranco Costamagna <locutusofborg@debian.org>

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../{vboxguestdrivers_7.2.6.bb => vboxguestdrivers_7.2.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.6.bb => vboxguestdrivers_7.2.8.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.6.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.6.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
index ac941de811..6b6a2f23ff 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.6.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.8.bb
@@ -15,7 +15,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[sha256sum] = "c58443a0e6fcc7fc7e84c1011a10823b3540c6a2b8f2e27c4d8971272baf09f7"
+SRC_URI[sha256sum] = "0642ed4a12b7204cd30c0abbc2c10c1cc7ad55ce1756a01e86a16d4b6b066592"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.43.0


