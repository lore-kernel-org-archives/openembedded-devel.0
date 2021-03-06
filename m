Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.8744.1615044957166534096
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 07:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=1V8eMytK;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.178, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f178.google.com with SMTP id k12so8424202ljg.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 07:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oDQx0ZBXmaXyXUqJM95jT1C/OvqP5wdt7W5QVu1CmyY=;
        b=1V8eMytKBEV0jzOEpFqgB1tv596ZFC6yzHWPVufKEvSfH1xfH+i15d2NVr0al/ICnq
         QOeEcGtH6DOyswre39/60M0pVJz6GTFKx9kLSZHx7oFyL9rEHvooHUWh75icbn7AW5zR
         8608qJ4XfR56J2ubyW13yMT5iqdM3T7/yYnEmbG1X32SvsmSqp1fK8wmV72lFYI6f3ox
         9sJgr0vQbfXFaMwCFPIIuBA1g+eiF7oBGry/z2SJtE18Ln2d0p+Iar/2dJ+Sf4LDdfiq
         kerRoMYLhDv2T57SjnxSmGRhiFYwOn4rP8ooZf1spiOpaxrmc75WWYUBah6oZP7R4FKb
         xMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oDQx0ZBXmaXyXUqJM95jT1C/OvqP5wdt7W5QVu1CmyY=;
        b=ukucd7wXSRHJK9T1JRB6u5Mje2X4uwM2bjbd41RfeylD6aAX18ONnOcPPdqq3wyxaO
         nMssFdPouYuL5lMZPQSP0Ai9RPSOQ+li1qH9b7JIt1z+q7WLkbI9m6UKOsxpst2ZkwAf
         MeD2KKSE+WU5EtjklWpaoeFTmV1Md/zerqdI8rV2LFQXxSXlErAx4ylH4ghrdm/gqKNc
         kejC85elR1+ONtfBj7ThA51/5qNMnDSW2IPf8Gg3ziHArELK4ffusL9hZpOycEO+IM4P
         EWD05qbdkINmCy8FigVlqI8y+Y6yLMyRGWFtexMtaq4khzb13QgF73uSFyly4d4KvSfl
         6iFw==
X-Gm-Message-State: AOAM533RKwtAYkyCQdGzZWQIlob3DGRhGXcH6v6SRrsdobHa9s3LVpHr
	+81k+RDJxqqFsODTS+g2enY+aolMzZ32rFoo
X-Google-Smtp-Source: ABdhPJzAIGl2YtSlrbUbvFuYSw9p3QBHp7K7le9e/quu81OCUmDuyC0fCZhnVXwlJquDNeqv4A4wMw==
X-Received: by 2002:a05:651c:1033:: with SMTP id w19mr8427507ljm.191.1615044954789;
        Sat, 06 Mar 2021 07:35:54 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id a1sm699049lfd.31.2021.03.06.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:35:54 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] ipset: update to 7.11
Date: Sat,  6 Mar 2021 16:31:31 +0100
Message-Id: <20210306153131.833285-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-filter/ipset/{ipset_7.10.bb => ipset_7.11.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/ipset/{ipset_7.10.bb => ipset_7.11.bb} (87%)

diff --git a/meta-networking/recipes-filter/ipset/ipset_7.10.bb b/meta-networking/recipes-filter/ipset/ipset_7.11.bb
similarity index 87%
rename from meta-networking/recipes-filter/ipset/ipset_7.10.bb
rename to meta-networking/recipes-filter/ipset/ipset_7.11.bb
index b724233ba..693aa9031 100644
--- a/meta-networking/recipes-filter/ipset/ipset_7.10.bb
+++ b/meta-networking/recipes-filter/ipset/ipset_7.11.bb
@@ -10,7 +10,7 @@ SECTION = "base"
 DEPENDS = "libtool libmnl"
 
 SRC_URI = "http://ftp.netfilter.org/pub/ipset/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "b24906ba43e2fe322bd41863476761d749a4bddf5ce4c2265ba04b03bc7e9cf6"
+SRC_URI[sha256sum] = "3151baad30f1d9e317b2ab4f2f5aa7a9f7b4dc11fcf8fe73acd0dc0b5dbabf7d"
 
 inherit autotools pkgconfig module-base
 
-- 
2.25.1

