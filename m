Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1481C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 17:07:03 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.559.1636045622748058634
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 10:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M+zooZJ6;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 127so6480499pfu.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5E66PLnO8xy5/xO3ABjG/3fd38lryqcCggvUkxMc4g4=;
        b=M+zooZJ6oPMZ7H3M44w5ehM4jgLKRzUvYLCsVB8th3E40O5tC49MqlMkvEQSYVmL+K
         2py8QFMD25p9SWvz48NqA42zXKdfJ8yje8VY6WKuxcf5ZWOU3JniuhkDgqo5xwpNEFr3
         Bq/ZXnYUGzfeLBQniSKO9HJS2huB1ugX5PJH7x84zRXAwwb6ittkcKWf621AUljXudkL
         DxvFiN0+eXhxCfJZ2tkqWu5PnzllMeKSkgCHPPBOXqC5TF+lDIeigoI60xZp7Ou2472A
         MAYTUYHWoaX7GjTxp4U8lUelMQXTMwSNERRL4bTIhDORYja1La0FxFdLsMv2COIPRL2o
         Ww2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5E66PLnO8xy5/xO3ABjG/3fd38lryqcCggvUkxMc4g4=;
        b=JUkg9Q+zhGPV3DR0KZ2piOGdtmzCeXXt+utUX2Zv+RU39uoHrZVyDjltmuYi1QTWHr
         /GBJWEH2d4AgKwhAx+hxui13Nal/OqoLJZ/WTkkV5yfY9tlIgOuisEHBh1tsjBM/6gCD
         9Qi4T3ztybJ9edc5t8yqSiJ88ASy0FxFHrQrdH2C2YN4lEP2D7Y/V/y7nRrLIx4VzHa4
         yNWJ+Mk9+AlXFeOcsZanryvie6IQoPTndQ6FLi2UYe4/dVyjCPU4ixK0llp7kK7PE2OE
         FjYlE86exwfRDySNggHH0oXk2Eln444QmkIED6DoTbUfSzydgeLS8DbuptnGLRuEj+gt
         26Pw==
X-Gm-Message-State: AOAM532s7GuHAfj8+NxwAwJSBoMjnu8GzcknKfYwqWPJPDgkNxV8FCUm
	6qzNgqs1eZ9gHNMpIU75x+2TdhSDGg8=
X-Google-Smtp-Source: 
 ABdhPJwyMIelV/Q4nMU3Pmxo1LBstGtsyExkysC+vE6Lh5Sd56t024b6OP7BdY5qtGiqNHQHL4+GVw==
X-Received: by 2002:aa7:8059:0:b0:47e:5de6:5bc7 with SMTP id
 y25-20020aa78059000000b0047e5de65bc7mr49685771pfm.78.1636045621936;
        Thu, 04 Nov 2021 10:07:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 c9sm4271749pgq.58.2021.11.04.10.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 10:07:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] ntpsec: Disable documentation
Date: Thu,  4 Nov 2021 10:06:59 -0700
Message-Id: <20211104170659.4081709-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211104170659.4081709-1-raj.khem@gmail.com>
References: <20211104170659.4081709-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 17:07:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93823

It seems to require asciidoctor and currently does not build
until someone fixes it, disable it for cosnsitency.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
index a0d8871ccc..167af04ca4 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
@@ -30,6 +30,7 @@ PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'seccomp systemd', d)} \
 PACKAGECONFIG:remove:riscv32:libc-musl = "seccomp"
 
 PACKAGECONFIG[cap] = ",,libcap"
+PACKAGECONFIG[docs] = "--enable-doc --enable-manpage,--disable-doc --disable-manpage,"
 PACKAGECONFIG[leap-smear] = "--enable-leap-smear"
 PACKAGECONFIG[mdns] = ",,mdns"
 PACKAGECONFIG[mssntp] = "--enable-mssntp"
-- 
2.33.1


