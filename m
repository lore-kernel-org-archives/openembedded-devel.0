Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CFCC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 21:16:13 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.2945.1645218972901468149
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 13:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pPlKGv7G;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 139so8926111pge.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 13:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IsdpQWS1JXA+55tZMS6A1gAvknxd2L7MkKYvddy4kjY=;
        b=pPlKGv7GJUMOgPCL1FxtMGUOsAmBUvlX7Czlhg8AsTCHZE+vo7NvIcaZQV7KbwqCBx
         o0HZsHvYFRSEPKRdykQTKmeOf2CDm//5PyJJgTTFAxJpwIoltOm9IhkL/LefDTEQFra+
         Zv1NyKjvy+ueoll9i162LG1KHUKcvUy5UoJ+RQVzo0SM2IhgeHw2AattNcXSv8osV5Oi
         ySyRVeFFpXK1jaIDNyw6MRqaC/4/tCstL1YzTf4MQ3i3bTc2QIBRCGtwrFwdCZeNVHmG
         0LgMnu9nDirh34B2V0EnBROxXIZn7RPSkNgvc9saKLVazAj+jN2AM9LSBJrxrxH6V8CT
         POYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IsdpQWS1JXA+55tZMS6A1gAvknxd2L7MkKYvddy4kjY=;
        b=Hd/d84XVK8n+iRO4enJZV4ukJssqCwNyeY8XJqT2Wb3xpbpZxit+7U25mbnERm6Xqb
         lXl/9/2xEvxexoYwqTQojc1g/8qOeBmUS+25w5HZYFby3k1loTzzbqXT5sS3jAAW4UxZ
         ol79RNw6IS/PubdAR2yZtDCb1sN3WeT/rlLpW3eukTYmU0kuMF/25szpH2W2Gw6rRrHr
         k7A0jixeng06Lt9Ljpq8PApnNY4hc49pZJXi7326DmYlqMtYOoMSdUet6RGI/nPOLMTy
         AowEelh/X8E1MuU00I5/1srWWTVl+kh1JFvOBH/O6jp3MuzyCrFQTgIbD6ikDMt7OIb+
         bmBA==
X-Gm-Message-State: AOAM533u0h7Z5kuK8d0Guyvtd5K5FWhpgxbiALV6vPEOyAiXVcvTBTJh
	eoXygoQjcLoTQMla4cYWHTgZ8/j7MZuhGQ==
X-Google-Smtp-Source: 
 ABdhPJz9i/neKTp6r8KoRwcaqvMLl3HBlDlyu9Ls4JU40B9useVY9W8/nDBJ30YvPotFU2STB62UWQ==
X-Received: by 2002:a63:4a46:0:b0:34c:5f9c:cda7 with SMTP id
 j6-20020a634a46000000b0034c5f9ccda7mr7759738pgl.297.1645218972151;
        Fri, 18 Feb 2022 13:16:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 nu11sm274252pjb.36.2022.02.18.13.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 13:16:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] glibmm: Upgrade to 2.70.0
Date: Fri, 18 Feb 2022 13:16:06 -0800
Message-Id: <20220218211608.1625215-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220218211608.1625215-1-raj.khem@gmail.com>
References: <20220218211608.1625215-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 21:16:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95383

Changes in this release
https://gitlab.gnome.org/GNOME/glibmm/-/commit/042e90eebca380686bbcc24d6803305b9d2c7823

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glib-2.0/{glibmm_2.66.1.bb => glibmm_2.70.0.bb}       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.66.1.bb => glibmm_2.70.0.bb} (67%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.70.0.bb
similarity index 67%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.70.0.bb
index 94844f21e6..cc19d34a43 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.70.0.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
+DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
 
 GNOMEBASEBUILDCLASS = "meson"
 
@@ -13,15 +13,15 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "69bd6b5327716ca2f511ab580a969fd7bf0cd2c24ce15e1d0e530592d3ff209c"
+SRC_URI[archive.sha256sum] = "8008fd8aeddcc867a3f97f113de625f6e96ef98cf7860379813a9c0feffdb520"
 
 do_install:append() {
     for i in generate_wrap_init.pl gmmproc; do
-        sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/glibmm-2.4/proc/$i
+        sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/glibmm-2.68/proc/$i
     done
 }
 
 FILES:${PN} = "${libdir}/lib*.so.*"
-FILES:${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
+FILES:${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.68/include/ ${libdir}/glibmm-2.68/proc/ ${libdir}/giomm-2.68/include/"
 
 RDEPENDS:${PN}-dev = "perl"
-- 
2.35.1


