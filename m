Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D54DC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 06:11:42 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.7934.1636006301730531181
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 23:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l3eGI2bq;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id y20so4847959pfi.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 23:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbPQssTrJB0p0RUFQjo7jYMj4WCdMpOYXcOyWMZriec=;
        b=l3eGI2bqPNfqSrh60Plt+zw7xLW3XrsKA8z/fgWys6omnvRAZw56aKiO+ChHWl1ygm
         7+bxDc/KudEvhgRDBvFLHFI3PZvNOpZb9uEdWZRERO8tcvwCpgoiJ8Dia673XJhUHk58
         HElsGwLGq0nrkTDXCYEDVG7vHMSCmHOEFiKmWVPNxCvbFUG6jOF+df0p7pcGseKlJ4+j
         3p8vI0q7VLbc81CkiWAVStSeJT9jfQnG7G3fTj2Rl9egoG+L8n/pl5NPXQovrnxduXbw
         P6ePAAkimM+JhSZBcbcWMNEzILXSxMP7yav1UDiIVN9shu2rrdsjakc3HWpjaK/p2yTb
         ChQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbPQssTrJB0p0RUFQjo7jYMj4WCdMpOYXcOyWMZriec=;
        b=jUhNlmjdlOLJPIx8IqqxBQPgZJ/Fj5sqMfVE6jFUtxh1t30EVxUUTiVXddFRi0WRPi
         B+c2iNWeaUpGTW0UaD2K3+BUB88o1LV9OckgK4UTJft1YvfQqpe+lpNuIl6Z9i3CP2aa
         BYIhOZBrrke6NEi53rDrxY526ovD+zzsPKMiq9oXNmRd8d0v2SkRjbq3ncF04P+IUdPF
         UTWVIApTaGbOPwXqACHSE2ck3gFtRmTZ99/4rLGEQHzJM3bVv+xfupwXTjQD5Duuc/Ug
         Rvi4tTi6li3jQ4nN+GZfRSdKa8lk9CmIY8mC+BmR+ttW4oLdq1F0vmedh0XrccReNmhB
         cr+w==
X-Gm-Message-State: AOAM530ah8IWG+oYWRYxrC7nkwgM+RCPXOvmarKOgI6951DBiuOHIOuI
	SPbiVoonGTg1iw7+60vPb0L4dBziMNw=
X-Google-Smtp-Source: 
 ABdhPJwtUvxUSv9P1BEFsUr+sz4vD8qvmBi0yAhDTbIJy67SB9c7y7KHOVoviuLPSTfxY9wlnF7OAg==
X-Received: by 2002:a05:6a00:b82:b0:494:63ab:d61b with SMTP id
 g2-20020a056a000b8200b0049463abd61bmr1923330pfj.30.1636006300898;
        Wed, 03 Nov 2021 23:11:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 v13sm3113889pgt.7.2021.11.03.23.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 23:11:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] gstd: Remove empty /var/volatile/log
Date: Wed,  3 Nov 2021 23:11:37 -0700
Message-Id: <20211104061137.145403-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 06:11:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93815

This dir is created at runtime via systemd-tmpfiles

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index 5ea104ddbc..d37ab986c0 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -20,7 +20,9 @@ PV = "1.0+really0.8.0"
 inherit autotools pkgconfig gettext gtk-doc
 
 do_install:append() {
-        rm -fr ${D}${localstatedir}/run ${D}/run ${D}${bindir}/gst-client ${D}${bindir}/gstd-client
+        rmdir ${D}${localstatedir}/run/${BPN} ${D}${localstatedir}/run \
+              ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/log
+        rm -f ${D}${bindir}/gst-client ${D}${bindir}/gstd-client
         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
                 install -d ${D}${sysconfdir}/tmpfiles.d
                 echo "d /run/${BPN} - - - -" \
-- 
2.33.1


