Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1665C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 19:12:13 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.21292.1699816326548548518
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 11:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IEzISAbc;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9e2838bcb5eso559388566b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 11:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699816324; x=1700421124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvr0hfNDA4PB70+BSDGgHMf0nlLbLRUPdI2kMCtI/t0=;
        b=IEzISAbclAvM8QnQcWWd8KFhdLvYls/49xPM5OSCX1if0F5duhsDs4bkLKhBHKjinr
         XsAmxnJHecoX1Y5wd1brqxWj/jgfmXmaME+t/pa7h1JnQ/j/jxdSUVPp8v6FDxHoh1iT
         jOd99/Yd1ZEwG26vqytxI0PLXj0qpTxg3Psfx+Lara0Pu4A6PRablQX7c7pXhOtDWv9y
         rKRGgBJE+/EL9c+gegV8CTWhPRRAJiWbZA6dWkidVoKUopd5TlzUXJJIzeB8BeqL/Gni
         rEFj8nsFQ2SmgdZwA/4vdhAPoyorLiulB4JhOfC/QXP+kuZt5FGuG5EEh+V7aKfjcfo/
         HeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699816324; x=1700421124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvr0hfNDA4PB70+BSDGgHMf0nlLbLRUPdI2kMCtI/t0=;
        b=TgQDiJcn7cxPg0+/IfubepVefDIwwGDh+iFW12V4wcwuN2TymC1RxYj+RdLebiOenP
         CtUrFZ5Z92U1U4FOFWqWqD/FY0n28Aw7EiEZqUAysYvIT/5ih42JC+4ODZ0juz40Vd2W
         Ka3zS/PkdbJhkMgLKy2Hob3ofAyUrOdB/LHrU1KS5sfKR48Ud0vxniveRAmdKTBUycXj
         h61JiUhAnGZ2boHGOzYzvSVWYHAPdAo8agf4HNHZA6hkkI3BhqZ5ZalMmw5Qotrd7Qiv
         gV9GpnVbjU1ypYbfp9R1N+bjh+eKTb2z896siukjbIuPKWaJEtcowcMLfUvMNmyaPJAa
         JSIQ==
X-Gm-Message-State: AOJu0YwRH4OoQW8fHshCK10EX9kVAP+NpkooXe2B+U1E3ll5iJapOUlF
	JANHG695nACoiLSuz9yheh4gyXDar3ODNQ==
X-Google-Smtp-Source: AGHT+IG5FoUt06U3QxcLt6NsCySJ4XZH+aDZXTxP8QdWiSJ2PdbHp1tTnZI7G73oMEFYyKQ5j5iVWw==
X-Received: by 2002:a17:906:8404:b0:9e4:161a:563a with SMTP id n4-20020a170906840400b009e4161a563amr2807371ejx.73.1699816324153;
        Sun, 12 Nov 2023 11:12:04 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id s10-20020a1709066c8a00b009dbe08bc793sm2959719ejr.18.2023.11.12.11.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 11:12:03 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] cannelloni: upgrade 1.0.0 -> 1.1.0
Date: Sun, 12 Nov 2023 22:11:46 +0300
Message-Id: <20231112191146.595362-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 19:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106602

Changelog:

- Typo fix in cannelloni.h
- workflows: add nix-test.yml
- Add TCP mode
- No peer checking
- Add -Wall switch and fix all warnings

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../cannelloni/{cannelloni_1.0.0.bb => cannelloni_1.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/cannelloni/{cannelloni_1.0.0.bb => cannelloni_1.1.0.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb
rename to meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
index f34c73c17..fb457dc03 100644
--- a/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.0.0.bb
+++ b/meta-networking/recipes-connectivity/cannelloni/cannelloni_1.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mguentner/cannelloni"
 LICENSE = "GPL-2.0-only"
 
 SRC_URI = "git://github.com/mguentner/cannelloni.git;protocol=https;branch=master"
-SRCREV = "0bd7e27db35bdef361226882ae04205504f7b2f4"
+SRCREV = "3d4fb8c8b07f6d7c62b2bdad7e5a94de61c9a29b"
 
 LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-- 
2.25.1


