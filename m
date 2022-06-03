Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E162CCA473
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:35 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.2393.1654283973984133770
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lQ9Fi3HT;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id o17so7467154pla.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QWW9jgw/xtqQbCbtBRuO6y3kW/KYnOb+s4ErIOqXqrQ=;
        b=lQ9Fi3HTUXit/+8uONLRKuxFvm1OqOGyJebp7PPAWbrMWv0KhzCh4+WpVwc1Uu9aJR
         kd6TVOnrtNAE/T+Eo6lQyhSByQj/k/R2oaFT+4/TNP6pm0C8Z2G90SW1ZECszPcNu9ec
         cX7lXgAmMXKtJ1iIVtjLRjktbB4fp7xVzBZF7GtDO2HGaB8yAG+ImsC3WTsLVAZXbDJn
         ZCSeMQfyJDmVs7rC8r3popcxWGbph8IzPefAr/97RZFiIBQ0nf94vN33tkuBxitHZqTt
         ZNlGELDkbMQV1HT1L0gr45tgYXluuK2mXyYfAIbzJ5lba0pqniFz+DgGKMbGJFvrWY81
         o1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QWW9jgw/xtqQbCbtBRuO6y3kW/KYnOb+s4ErIOqXqrQ=;
        b=KE7JeipF3S0IthbtPIr5AMbV/Q5P+pSE8hnGLBapTMG/gz81RsDk38sd4YLjKQqZxp
         kh+ANGrWUmhP+7F6OP26BHJfZy8iz2aXCzftjDMARQUFpMlr3LubQmxVdXbKZPorVvCD
         XomIlvsDB1YwooaZkMOKKLh1g0hZI4UQLVI6yK3EptrRcDidunV9jkcESj6KIFwDUts/
         BsP/SOfkkwgnczYMxugLZPRVzXclkFxhUd1ZxtInQEs/Y5ErMWhGxXFb+k2kY0lp5y0x
         EXpjOYnfjCzL06saeRtronkcZqjThM0WZXgXF+agVG9CbnryvBtb62D6L/1f/jaGE6BY
         SyrQ==
X-Gm-Message-State: AOAM530+S36zYUi3odnStfwhQZxAUGePgdPr004JmF8XH8xTgSAafaUc
	zOUTZNsFwmZjwLrnlAwuK4BaDnyln0w=
X-Google-Smtp-Source: 
 ABdhPJy4eK0VgSaW4nk6c13YyAWFCInwxH+iNwBFkJd0Kl1OISCVQdHAqZNoqkeeMzzAOCTwAweq7g==
X-Received: by 2002:a17:902:ea0b:b0:164:81f:682f with SMTP id
 s11-20020a170902ea0b00b00164081f682fmr11558226plg.39.1654283973236;
        Fri, 03 Jun 2022 12:19:33 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 07/20] sdbus-c++-libsystemd: Bump SRCREV to last commit of
 250-stable branch
Date: Fri,  3 Jun 2022 12:17:06 -0700
Message-Id: 
 <b23cd103136d9728b686d905dd47b100b7d2575d.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97396

From: Gianfranco <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 32581a7a4653b590118e53b5fabdec72f1d3d0c2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
index 6bb5f7abb8..d5c799aac3 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
@@ -10,7 +10,7 @@ inherit meson pkgconfig
 
 DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jinja2-native"
 
-SRCREV = "1b003bbc806198dbdd57b405d968f30565495e70"
+SRCREV = "73be9643910c3f7f3ff84765d63060846c110016"
 SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://static-libsystemd-pkgconfig.patch \
-- 
2.25.1


