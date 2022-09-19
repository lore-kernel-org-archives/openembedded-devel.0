Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70FCC6FA93
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:57 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.19053.1663590830730293927
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TXZL6h3G;
 spf=pass (domain: gmail.com, ip: 209.85.219.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id g4so21684325qvo.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=kmicGxfZPe5amsoWOJn33jyPbycxf/JoVK6A/3ryckg=;
        b=TXZL6h3GjEuZ8w3MwR2JZikOouDLCYH6x14EkiFW38K6ieoi6kZyKnhJZIzBcPDVzq
         TbDZiIEsVQ9jJGnvG6ayXZxFHPI78BE6yZymCPfkVcmL1xcBMpTPDeA6qsvJqb9/CjBu
         C5YLXXMPRsyEljp33q/Y8sdalW3ZodvcRp7Um6ueRvT9Cn5r5dyHD5V60b57MAxYsDCc
         ASlvOXXhLrb/iXHy0IpWKwcsy01CLg11kNqJTrHh7uSho52RXHQ3ZCD19Mk7nOGy9Fka
         BuWjTZJ1nbBf/VeZkwh9pAlqn6wCoAwpROC083wnySke4QnqFUNA3ALJ95oaddMdgX0n
         nrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kmicGxfZPe5amsoWOJn33jyPbycxf/JoVK6A/3ryckg=;
        b=iEpGfjnT2zcDmqe2r2AR/H8o4x9zR4yQ/3qRcZExzaYyNVl99qvkSfxQixs6G66QF4
         3CgTco6VI7V+ZxuKnKDhSTBzMPz25JNEOL3JBwUMEfv4fXeqa2KG3q9wbGD9/NuKpt71
         tsudOMNPc65Ei+bX0vZ/hsD0Emam1tnCHTB47zc/WnfaxeARkhz7m3GsI029KBz38Vss
         wNctVdhyObhrQVfL5ywHQZ1+eDaajKH1Z8UOq8H7Cr5DvZFpOIqis6HXfqwWhP7VjsWv
         y5bSoi/M/ZSzvJvFqei1C8uNCegE9jEGo//XSOWkayr5fcLCb59bz0wrT7lfh2Pb+wLr
         NB9Q==
X-Gm-Message-State: ACrzQf0lNPwq5uFlxNhsZqPv519njGQ2KLNx3/dp9eKUQh8aMMB8vBBV
	X/9VhfDsKnzqi1869cvGCE12gbRjHhM=
X-Google-Smtp-Source: 
 AMsMyM4SZB+sOAJRfTWDNS29tMPNU3FeCDD3Nv4AzaMRd9RDvkPkkqIpB4KLcV9zCVOmjOfZHltg1g==
X-Received: by 2002:ad4:5d4d:0:b0:4ad:2883:e40b with SMTP id
 jk13-20020ad45d4d000000b004ad2883e40bmr7829797qvb.51.1663590829619;
        Mon, 19 Sep 2022 05:33:49 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 07/11] php: upgrade 8.1.8 -> 8.1.9
Date: Mon, 19 Sep 2022 08:33:34 -0400
Message-Id: 
 <3cd6cc5dec3e8c5e692cf29b0293cb3955a982db.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98858

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 610b8fdfd45467ae1007878cc98baae2e73fb0cb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.8.bb => php_8.1.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.8.bb => php_8.1.9.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.8.bb b/meta-oe/recipes-devtools/php/php_8.1.9.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.8.bb
rename to meta-oe/recipes-devtools/php/php_8.1.9.bb
index d5cf7d8b21..a93adeefe8 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.8.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.9.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "b8815a5a02431453d4261e3598bd1f28516e4c0354f328c12890f257870e4c01"
+SRC_URI[sha256sum] = "9ebb0e2e571db6fd5930428dcb2d19ed3e050338ec1f1347c282cae92fc086ff"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


