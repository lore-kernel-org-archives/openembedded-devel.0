Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8441FC433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 06:57:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.4158.1639119435768296763
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=QwJnmFzB;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id m27so16260938lfj.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FEYxjXhA7046YUibJ7mTMRh/HDhMn/eleQCg6+vNbB0=;
        b=QwJnmFzBPXJwLQS4UnwHNEMQVGRaZkmBv/za0fbNNDHDs0TIzjrHrihHMcdgKn2AlM
         aDnimiBzzaociCsRzsvZpL4Bn0Fdaky2qfh5liM5difzJewk3OvHX711vcW4IKKg74FN
         Shg8j6y98BsvSxBzvBMpp+9rrFASWYLoX0kjVHd17wY5KN38FZDKe5WTMBfx/FyVmR7N
         s48QPjeYpDP9YMhtZ+N3kXhmTfgkEuL8ozCEbXMp+AVaB3ggj//ivtFNj/oBIotdxHvH
         mQry6A90agxvPO4nsLNtPLuGqbag9vTxs0W6Igv2DHyQaj/ZRWVyXQS7YZybJdZMJGT+
         S8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FEYxjXhA7046YUibJ7mTMRh/HDhMn/eleQCg6+vNbB0=;
        b=NBk1mDTh3neg+yENcC8IL5s4eNejLyYT7kc+8s40tEbxkBQZ5WENpZKeeUKzofm6+p
         tDF+ePGanjc9N2Yxw+5LOBBL3JLXughl7lPKm4FjPgdrrf+XCBzHc7l//jxW87+8c8/Y
         qREa2rOn5vBwXVYaxa5TQGCjT41cgXS+bLylVqPrw8IJMhmW+owEMndMUF7UQMcdIUlm
         joDnHM5vGo/ZChgweHwv7AEbxOsyx+6pXtH22SSv+LB1+Vv4jyvl8/Wi2kkTDI4g+6DK
         JWDJyZD5Xhe1ifrsD98wKxvzz3dCRJ7Sbv71rWgkkgnVvnaNnPZ4YT03Oh1kPXJsShsA
         CClQ==
X-Gm-Message-State: AOAM532yusFWTPBN7QofUXHErUY/hopVyuZMuGdn1QN6BoyCLL4482Fi
	5W7YR70n/XT75T/+oW+Lon0z8OEOJ8ByrCe2
X-Google-Smtp-Source: 
 ABdhPJyaDy51mnutTePfYcszk014uBdZ5kew+PkzrMrJv160vRU4w03AB3NG0NvfkhplZ9yKzSL/ng==
X-Received: by 2002:a19:614f:: with SMTP id
 m15mr10695311lfk.187.1639119433590;
        Thu, 09 Dec 2021 22:57:13 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 m11sm226702ljc.108.2021.12.09.22.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 22:57:13 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] cpuid: update to 20211129
Date: Fri, 10 Dec 2021 07:57:10 +0100
Message-Id: <20211210065710.1524817-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 06:57:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94271

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../cpuid/{cpuid_20201006.bb => cpuid_20211129.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cpuid/{cpuid_20201006.bb => cpuid_20211129.bb} (90%)

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20201006.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb
similarity index 90%
rename from meta-oe/recipes-devtools/cpuid/cpuid_20201006.bb
rename to meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb
index 1b42590f4..d1f125092 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20201006.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
            "
-SRC_URI[sha256sum] = "13c53f16408341d11ed489b352f218ec4dbb5bedb796a9d059e924770a9c56a6"
+SRC_URI[sha256sum] = "230772bb88c44732e68a42d2eff43bcff46d893bf4ea6e04151d4cb6e8c88e2f"
 
 COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
-- 
2.25.1


