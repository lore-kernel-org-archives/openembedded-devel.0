Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.25621.1605712093012276429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dREyEhEX;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id ei22so1249927pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=e/esbFKz3oi8PP82b6fErGRO0fTPOB1n7Cx3EZcscFM=;
        b=dREyEhEXVWfqFWUwMKBZ2YM63EH4T8wD+VZoIM+Euq44NNUeczPT/M7vXWLC6VXk8x
         NZgnJp4go+HkyaXHdXRkKxBuNqSaK7F9fxwOkOiInLT9T5Qw/SFNhaGzg0wfyISbicz+
         wbMASwM6yuKWDtUbPvHd3xngNIJvCkk3Lq6RwPxpv39QWWT59kCZzfNnsMcQJhaoj449
         QXsxw3Xjbl/jUsYiUyyKjZibgwCql80gjSrUdUR9JfsKfbDlBgFWqFNoBvZQk/ZdK3i8
         M1uPoA2MQv91FjaSnqFgWftZO2A8FiPF0bl+hEH2BTxmo5wleA29HWxD0wIaWvFi5O4u
         lP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=e/esbFKz3oi8PP82b6fErGRO0fTPOB1n7Cx3EZcscFM=;
        b=SyBxSW5HcRQNIkAq+fZhA/0/wZqKSh2OTjXXlUQHugVAMUYQmp0tZe5/acFzqGnvjN
         3KOYaqWKVbtM9BpFqZxAIGA16yePm6hqDl/oHksQXNx+fhs6GfgxLuKHows5hjqHRSFp
         hC7jWguHEjJUovXGtZtjxcbTIE5gMtlChP3NiACQD8I6A8EdunFAXc4Bnmjv1oTkGiNT
         kVSHHblQRHRpdIlMeCd2gUZlwpB7C4RoJM3yc35CugSVRvUR155mUIeH5ivGzuy0Lj5u
         yJIOBy6fv+14t5PNtBUkh5q3OVXq1WaLHRwRf1JvbkgK4RnyZ+I9T6HVbkxdw6GDfUXu
         h68A==
X-Gm-Message-State: AOAM530bDPw4BIqost9QiL06nfZ80oQXqEYCh3w1nUSwAD4l7uxan7ja
	Ut9s/6ezHvqyBkGlqHoOnjT+QJZjL9M=
X-Google-Smtp-Source: ABdhPJxfVn7Eazm+XsMFh3zdKdKpUZF5tANlqnV4V7oGuHsJGlFc5yaoKfikovWKeujDC931nEvLhQ==
X-Received: by 2002:a17:90a:f698:: with SMTP id cl24mr370417pjb.222.1605712092415;
        Wed, 18 Nov 2020 07:08:12 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:11 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/17] mpv: fetch waf in do_fetch
Date: Wed, 18 Nov 2020 07:07:49 -0800
Message-Id: <8ce691e47f5b3f795821a439536f4b54b24f887f.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605711982.git.akuster808@gmail.com>
References: <cover.1605711982.git.akuster808@gmail.com>

From: Ross Burton <ross@burtonini.com>

The mpv git repository doesn't include a copy of waf, instead there is a
bootstrap script to fetch it.

This recipe calls the bootstrap script in a do_patch postfunc, but
downloading should be done in do_fetch. Instead of calling
./bootstrap.sh simply add waf to the SRC_URI so that Bitbake can use the
mirrors/proxies/caching/checksum functionality.

This is both better code and also works in buildtools environments
where urllib2 can't make secure connections without configuration.

[ YOCTO #14073 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5af46f89fcef5c436786ed81978de60f26abe054)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
index f7b0f30fb9d..70a39c7b60b 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -18,7 +18,9 @@ LICENSE_FLAGS = "commercial"
 SRCREV_mpv = "70b991749df389bcc0a4e145b5687233a03b4ed7"
 SRC_URI = " \
     git://github.com/mpv-player/mpv;name=mpv \
+    https://waf.io/waf-2.0.20;name=waf;subdir=git \
 "
+SRC_URI[waf.sha256sum] = "bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f"
 
 S = "${WORKDIR}/git"
 
@@ -101,14 +103,10 @@ EXTRA_OECONF = " \
     ${PACKAGECONFIG_CONFARGS} \
 "
 
-do_patch[postfuncs] += "get_waf"
-
-get_waf() {
-    cd ${S}
-    ./bootstrap.py
-    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/waf
-    cd -
+link_waf() {
+    ln -s waf-2.0.20 ${S}/waf
 }
+do_unpack[postfuncs] += "link_waf"
 
 FILES_${PN} += " \
     ${datadir}/icons \
-- 
2.17.1

