Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web09.12954.1612649449883544098
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 14:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Uh3sOBDz;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id h7so16199949lfc.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 14:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IvCnNPgB18FaJ5KYtB+wIpSWoD/porhVcVpAwc6sAow=;
        b=Uh3sOBDzyJBpWgFRQGcYuo3yZDKxrSwbAvax+xgWFTJQF2Im4OlyX+ivfnCkzHjIAc
         e6jVYqiPBf5XYPT+plR/uHq8TrN1InMHhsoZtfiKjbcROVB72oYtUgbqdC1VZxpj8p4h
         60ehamM2JJgwH1b5pThnISVsFYuafDjVQ1cUqbaAZIbJLLFuaRFvLGnWaoIGmjXOUUrV
         IyQt7BDRIPDHOgpQAN9GWqnL1866zbJ1azzVV/bncfyZkTFV8xC6O/pC0ByQ5ZYjdokj
         ul9KvuFsPVhqGtvT+gY4ZFoBHYe40Biogf4JkdxfBAxwxp3ij8v3jQqQCaunB6uRndWT
         hz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IvCnNPgB18FaJ5KYtB+wIpSWoD/porhVcVpAwc6sAow=;
        b=CtIZ4UPT28ypfNO9y3JRnN1nT/j4Xp5PxpPSOTvVaqlVKrKOh0E1jA5y84Z9of7a6n
         vIVFaFdEhOGFZ2+C/idfBmEMux2Fcc53UmKDPPUGF3HHGjbDNmws3BtevOKE3C6eR11B
         JsToQ4nudKE3WiBEHpYOnzA1JsksH33CfeySQBS+oic7pTvwm8jte5uuJU6+vQGSAR8U
         AaT7p1ttyIg4MC2zFdmfRFQNlJxZQqn21NwLzxny7SP8a2eoprk3FO+olL9JlRZYzrmR
         jLrKHisD5nrRYW344GK5+GIbQ/2tgUN6HSOfxKAk3uyGd8yV0X41J+MtcVs24hMwacaH
         pr9g==
X-Gm-Message-State: AOAM530ujPGwD0BODiTiWlKjDuWxL+obazZZWdguIWC4QWmEmy5iGrrv
	EPkG5AuEUTs0espDLQByrUuN2TazU2/6YlTS
X-Google-Smtp-Source: ABdhPJwnSo69zTmpeCe7D61yA0DRp72Q0xIkmc2QBASQgvKB7aBRSsG7BX6eoMti9Fx63k5Ev6ByRg==
X-Received: by 2002:ac2:5e81:: with SMTP id b1mr6152127lfq.473.1612649447913;
        Sat, 06 Feb 2021 14:10:47 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id w16sm1452877lfq.181.2021.02.06.14.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 14:10:47 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] kronosnet: update 1.20
Date: Sat,  6 Feb 2021 23:10:45 +0100
Message-Id: <20210206221045.4045058-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../kronosnet/{kronosnet_1.18.bb => kronosnet_1.20.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-extended/kronosnet/{kronosnet_1.18.bb => kronosnet_1.20.bb} (96%)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb
similarity index 96%
rename from meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
rename to meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb
index 7b1dfc241..a468a9ab6 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.20.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa88
 SECTION = "libs"
 DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl lksctp-tools lz4 lzo openssl nss xz zlib zstd"
 
-SRCREV = "e1f3d4fb4906a26bf155a0e3fff2b6cb02be4dd2"
+SRCREV = "b8d18c8360fd39cb04748e8bc1ee26de4afa4cbd"
 SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1"
 
 UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
-- 
2.25.1

