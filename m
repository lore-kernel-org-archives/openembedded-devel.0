Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431EBC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:34:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.6233.1659515677063924045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=be9II6Yl;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.46,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f46.google.com with SMTP id l19so1586464wms.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLXw7aJdOuAzKJFUH2EV+cDjh91jDidndZC9TNbedQo=;
        b=be9II6Yl/OoWJLee67fMkCsBsr0zTrtjkwBtp3M9OTnZkUr0vXVyksejOzlxzwzD+Y
         dmEz9YJGGMFEmNT2HjvXgHOX0sLVCjesuGv/lK3U7rnI30GacBwVI2P4QxYcmVlrxOHQ
         9u3CZbrQGcbcu7BOajV76au5FpvBASqS3tVieQh6Wfm9g1UB6MiS7EzJhykmPzzOGn4J
         ryVlYwwZr+swfSANar+u4VFVyHYur5ajJmYtc8lFU4ARZOyA2JtYBlI+OwMCXbEphf1M
         AlO4I08nVqEx6I7FO+Gy9lSma7q1bcqt865L/M82UHUJ1P24iaGzESVRp/QKtrAhA88M
         aiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLXw7aJdOuAzKJFUH2EV+cDjh91jDidndZC9TNbedQo=;
        b=fxHGcqcB31Fu7BTJ5DXlJC+ErixFR4smfbfS5C5c77L5jMhiHMXU9ja6bVJddoSZux
         7JJpAi+dWNg43b17BxnxZv2Egq3Iy2FensCVTK6B02ylJHKxwv4iSJMgeNHaSp/9ieT6
         +5EsKBogGTsQjyEvIRkMesT9G0Kj4YeUVjy7GS71SKUFr72Pqmoux8yxK6T6UG5AWi53
         s3UMWb5B8l8a4eNc7lDrRaxD2VSedXMRDpyQrpoeaotbjw7iTRpHngITuhDPdNJsvpUD
         Z1pRTDmpmTpswCjPIRwbWQxVXqkMMWhAZjUOT0aphpRV5LqBU8117DWU7HRs+vvwicV7
         z0Hg==
X-Gm-Message-State: ACgBeo3LwsyOk+2wg/qMfQOSYrp3X5gSBvGuSk3zDeDx+gQ9RqvDrG4p
	1Y5VqxWbvRU+GCVa/InnRzKEBg==
X-Google-Smtp-Source: 
 AA6agR59Z22dgMuLn7+M31uPYhnrsrry+sMhZniC1VKPQSSyBbpJIxDA4W5EfLqJNGs7rmzAtglDug==
X-Received: by 2002:a05:600c:3ac6:b0:3a3:4178:a9a8 with SMTP id
 d6-20020a05600c3ac600b003a34178a9a8mr2077124wms.22.1659515675414;
        Wed, 03 Aug 2022 01:34:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4a53:da6b:7724:118e])
        by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003a046549a85sm1670754wms.37.2022.08.03.01.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 01:34:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH] imagemagick: add PACKAGECONFIG for C++ bindings
Date: Wed,  3 Aug 2022 10:34:32 +0200
Message-Id: <20220803083432.14285-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 08:34:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98109

Add a new PACKAGECONFIG switch for building C++ bindings for
imagemagick.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index b8167f5a7..010288b0d 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF = "--program-prefix= --program-suffix=.im7 --without-perl --disable
 
 CACHED_CONFIGUREVARS = "ac_cv_sys_file_offset_bits=yes"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG[cxx] = "--with-magick-plus-plus,--without-magick-plus-plus"
 PACKAGECONFIG[graphviz] = "--with-gvc,--without-gvc,graphviz"
 PACKAGECONFIG[jp2] = "--with-jp2,,jasper"
 PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
-- 
2.34.1


