Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5CBCCA47E
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:35 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.2397.1654283971622849270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jk2+Ld6t;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id gd1so8047066pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t85Y/hLha4kdZZZI78b8ahUOHtqqHNXYkQra7nmaCmE=;
        b=jk2+Ld6t0+6BsOGDZQO5adLlvHmh8D/eZT+tWEGwsXvn3fZ5KQEHGG+cOwHx+BzZVO
         lLQaYaQpIitfz/t3EU/mtf2A4cUYsIldIRwfJXwLscUT+fPBAjSfxqF8dvJWoZVWLu7j
         9+lMRFJVpzqLgPb/PhzNMDkubybCTZUOwBTaynEDr0ZEBsCXC1LDLxpyZjDuusdCb6q4
         s7Khp5TTaabG2ICd1GhOFA1yMVk/eHVSK2lFoaBMS/nlTnAFJN37ncujP7PM6z2qbz33
         N9LIDIXwTLuC04FN7xo+B3j+oIuF57VPM8uE5cyr+9dSV+S8wV3ntJcwQuRU3b2kM3X6
         gEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t85Y/hLha4kdZZZI78b8ahUOHtqqHNXYkQra7nmaCmE=;
        b=gG++oi4+iS9Z/fBly6bQxZ1LH5M88DtZsPADOqgUbfvJi0NgDBX8F4ho8/IrxlvJaw
         3dM7n5nq7+dOqIFjNtSbsPAKCe4b6GBWBkoeozJq2ow/QHE0qQ5SFcBrhUfHVDLeYdXX
         tBRwuRugWde3nqIMKF2RDC5NmiyV0M+RufoIr2/+J50DuGu/Cvt/NUKA1wV9YmOvDLdU
         q7YEcfVuhrKqaZZqcVA9ms19XucnnoNaNRfMXxcmzuWaj6u/Sza0BP1pOIwduKeYuuVk
         0r+/1yVk0dkfinq9lv+ZOiGYPe6DmwkwnGbfC/cav5HJ6212yHix63sfIsxjc5HRxCco
         Kuew==
X-Gm-Message-State: AOAM530TOqvSGJgFUQq8mJgV5Qj9PUcA2sG/C2m29+Vhkf/YizZ5qhq1
	ELztA/+GcP/3/QxneM8dI+F6qTyKg2s=
X-Google-Smtp-Source: 
 ABdhPJxeI/ald0yZNjMKWAm8ZTrOlnsSh66eDGgZOxRr5pqd3MRGzSzY9H1mtrqA4L8Q03GmXwCWGg==
X-Received: by 2002:a17:90a:4a0b:b0:1df:7168:9888 with SMTP id
 e11-20020a17090a4a0b00b001df71689888mr47716991pjh.16.1654283970816;
        Fri, 03 Jun 2022 12:19:30 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 05/20] php: upgrade 8.1.5 -> 8.1.6
Date: Fri,  3 Jun 2022 12:17:04 -0700
Message-Id: 
 <71613a9fa18a689a23b22d10da8745af6239a221.1654282423.git.akuster808@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97394

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b7bef320005a7e44f28f871d3ecd825dae9c14b8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.5.bb => php_8.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.5.bb => php_8.1.6.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.5.bb b/meta-oe/recipes-devtools/php/php_8.1.6.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.5.bb
rename to meta-oe/recipes-devtools/php/php_8.1.6.bb
index e3af9f6984..96af595a45 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.5.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.6.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "827de56771c3ab8313a069812f15f6ec49989d510aebd0dce180839c6d8d6ff3"
+SRC_URI[sha256sum] = "7b353304b7407554f70d3e101a226a1fc22decae5c4c42ed270c4e389bfa1b66"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1


