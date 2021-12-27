Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85E1C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 04:59:44 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.23488.1640581181958542258
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Dec 2021 20:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P65eae3e;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id v19so10659918plo.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Dec 2021 20:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lu6st/BDjpVwv+qv8ksjOPZ/ApfhHIz6xC7v58uibcc=;
        b=P65eae3eeUiaAnV7JRh+ceVwcUSVMSFFWwuNpsrGv/PeqxfCWShRKX17OVOKqJrp+v
         qFThtKUHJgGw/4121PKD/Yr59JoKlnA3HsnfnrWl0rrnAACbu1EhV/JXVECND5CAoKUv
         1gFN25Ecp4/h6sLC27cZtQOBdNuuKgTzm83BqOJgfXcAGxkUoAIqIT6h/L4L8k5A610H
         LIXNFBPIPH9iqaD7yx9XkBSwKSCfLchhnAtip9TNCOQfBAQ6BfMotBlbmpfIf1FzdqEt
         JwNIVEC4HgL/v21Ma0oEJFujW2jxBWgGn9TVtqO+d3mH/k7KcMQW944fLHb4HivJbBpS
         6uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lu6st/BDjpVwv+qv8ksjOPZ/ApfhHIz6xC7v58uibcc=;
        b=nH4p2GSm7vkTGW8D0ojp9vQuoETO0cP+fsog3p54OTsU2stNbwTwE8RQpQwD3dTO73
         IFqnSClePZZBqBRncxA3xkf8h2mdnAYDYyiaEAy8luwRPXHT+miFUxySdifyaJVCEfFk
         woQcFySUkMYnRjnxfu7zEH8GIGXidvYcwNv2DDkAcUM++6Ewzu+rOqViZrXxg2RmUJzu
         vkklPyQvad4ArIxT7hP35gcvVSgtotaZIY622cAyMBtwXdvQJd9JUZ5Y9p/GEMqWxYnV
         OxWa9LyprtF6tq0mKA0qEr4Sz7NNTOz3qloleGnJ+GkKasQf9g0zcPz1hdbvJK9eStQt
         om3Q==
X-Gm-Message-State: AOAM532hpn81BlsXuCknAE6qWAIyOJWB9ZkPb1/vgTixS2ZM+1oSoxyl
	n9BIiNlLVTBfEiQ+qr2rkaPOYcYea1U=
X-Google-Smtp-Source: 
 ABdhPJydJq0WDSYtELDgcH0doB6IYYUHhxKzY3yUg3qikHxSROcN96yKp96geqh7zpAMNGupKiPlpw==
X-Received: by 2002:a17:902:b712:b0:143:72b7:4096 with SMTP id
 d18-20020a170902b71200b0014372b74096mr16257840pls.25.1640581181127;
        Sun, 26 Dec 2021 20:59:41 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:67e3:bc71:b585:c820])
        by smtp.gmail.com with ESMTPSA id
 q9sm16578436pfj.9.2021.12.26.20.59.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 20:59:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] ldns: update to 1.8.1
Date: Sun, 26 Dec 2021 20:59:39 -0800
Message-Id: <20211227045939.23453-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 04:59:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94504

Builds with openssl 3.x
Remove PNBLACKLIST
Remove libtool workaround

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/ldns/{ldns_1.7.1.bb => ldns_1.8.1.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/ldns/{ldns_1.7.1.bb => ldns_1.8.1.bb} (67%)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb b/meta-oe/recipes-devtools/ldns/ldns_1.8.1.bb
similarity index 67%
rename from meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
rename to meta-oe/recipes-devtools/ldns/ldns_1.8.1.bb
index 858614cee..81e1c62a0 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.8.1.bb
@@ -4,19 +4,16 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 
 SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
-SRC_URI[md5sum] = "166262a46995d9972aba417fd091acd5"
-SRC_URI[sha256sum] = "8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229"
+SRC_URI[sha256sum] = "958229abce4d3aaa19a75c0d127666564b17216902186e952ca4aef47c6d7fa3"
 
 DEPENDS = "openssl"
-PNBLACKLIST[ldns] ?= "Needs porting to openssl 3.x"
 
 inherit autotools-brokensep
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[drill] = "--with-drill,--without-drill"
 
-EXTRA_OECONF = "--with-ssl=${STAGING_EXECPREFIXDIR} \
-                libtool=${TARGET_PREFIX}libtool"
+EXTRA_OECONF = "--with-ssl=${STAGING_EXECPREFIXDIR}"
 
 do_install:append() {
     sed -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
-- 
2.25.1


