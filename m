Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCFBC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:40 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.11866.1639668218839042511
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AyBwffeK;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id gj24so6878944pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NkeO23PO+OFq0jZ9TKIB2jJJ04WSxIOxyoQpD2741JQ=;
        b=AyBwffeKCGFosoN69hLJYughpTzKucRUpwY06PyHY8Y1uvg8WHz64uLKhYDktXcuu1
         4lTtsuCS+kuBxIMZhQ5fl1w5EhXV1E7eQGw9hz6mAsobjiTo89oro7S4SoDTuWnbwu3d
         mWfwQEbSvcTPsIQiFCGaLEihBd6AjjiNOYpu01wtCdWq7aKlthB0+rY/nV8Yxn/fVYmF
         Vbv26UPYn2FKzVE3JK9SqGPGwEnif8ANJI2pVgmQ/wbgZDb333v90KonJROQVrZYNFU5
         42pUt0y/s15dGKVRVftzM0q9NguKUahdYpwnSS7C1gzeFw2c7MFAQyQWG0hWrYIEZ9vs
         UNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NkeO23PO+OFq0jZ9TKIB2jJJ04WSxIOxyoQpD2741JQ=;
        b=WUxtg9aKnfcAUAxyMap96JMoNW1iuMrNxW2KK3rq0ryo2oOV9J7cZYNZLbOcnrd13p
         MV0LbMkcFTN6ILbybChhmhJqyOrJIotWFmJk2ZZJv4qmAhC2HJqkcneQqcGM04M+XK5a
         mPHyob6/R4G3J06HYmzMv6DsmMyJ1T7iPFA00JriWSVXA3vUp3xJoFupH9pjR/IZArDE
         ps/8ZVVURhbvftIpBrgkWUwG5oZ70bvZyTJvpWu1pwRHjoSsASxGlhOGblqEyMHIbjlI
         nFh8f7pHN4dRaJFQ7WvXs/vHNDFbvd6rtjoIpgejBwUKO8oPdZA85pCYA/6o+o2DdFor
         Kmig==
X-Gm-Message-State: AOAM530EP85CFPJC2bFGHyxncsmDYsI35cQndI/jh0fawtepcpPEXUOi
	O4b9ujclx8TqfUWfcnTyWnftNeFK8BQ=
X-Google-Smtp-Source: 
 ABdhPJxW2p9OECkIjPKLRRKXKdbkx1Z4eepHGf9siyzyHiz6gOb+yByDDsotsmiTQm7pu3ltRNP44A==
X-Received: by 2002:a17:902:d64c:b0:148:b8ab:ceee with SMTP id
 y12-20020a170902d64c00b00148b8abceeemr5476613plh.111.1639668218205;
        Thu, 16 Dec 2021 07:23:38 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 13/18] python3-gevent: update license
Date: Thu, 16 Dec 2021 07:23:18 -0800
Message-Id: 
 <46026cd6ec5f8cac58e846e7e46d0635e4a52f06.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94398

From: Ross Burton <ross@burtonini.com>

gevent is MIT, and it embeds copies of Python which is Python-2.0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 91b516cc80ea9f46cdf94bd4ce6a168c240b5c58)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-gevent_21.8.0.bb       | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb b/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
index 8fb6e18504..7bdf126dea 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
@@ -2,11 +2,8 @@ SUMMARY = "A coroutine-based Python networking library"
 DESCRIPTION = "gevent is a coroutine-based Python networking library that uses greenlet to provide \
 a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
-LICENSE = "MIT & Python-2.0 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
-                    file://NOTICE;md5=18108df3583462cafd457f024b9b09b5 \
-                    file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347 \
-                    "
+LICENSE = "MIT & Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65"
 DEPENDS += "${PYTHON_PN}-greenlet libev c-ares"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
-- 
2.25.1


