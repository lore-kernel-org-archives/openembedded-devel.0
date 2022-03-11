Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF53C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 16:00:07 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.6949.1647014390721901796
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 07:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eetqfejI;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 rm8-20020a17090b3ec800b001c55791fdb1so724332pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 07:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uijKCzrG2bK+PGMGW0GIQVJhIV2cbqj5912aySPuWiI=;
        b=eetqfejIzhS7WH8QgUQXYmIj8QRtkD3GQ9ISzOKVm9keAByaEzUd3C1JUTgg/JvJWE
         /4RkpktSogA4/FqTCr0opDyOBkKLUDEU4AwmCljxNNjuc2ud8Yge8eJbSQHnQ212PDUr
         vZTA2jDZIDziTdR7GR1JHl0ZN9c420N5uMvWPITf7xWkaazmipwYQ1InwFfInlpQ7OKS
         R/TjloY0lEC4T7RVcYFrRkhB9skpQnrEl7MrN/m0ryOOvWsvu8RwK2Q9Y/gGhcs+lsMn
         NgZPXL7HTqZAkkPMFaWP2VwO8UUhJOQ76O1e9FfRpBcmT9Qxb5hr+U+V7vle/YCb8814
         A73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uijKCzrG2bK+PGMGW0GIQVJhIV2cbqj5912aySPuWiI=;
        b=x2neohSWPfMiZAv2l7abh2gAA9xa8LLG4K6w15sU61ACBVyzC+6QtcWiImaRuYTtUz
         EmQ4x1DRdVx5qyrSvhNqc7JIRPi4lh2czh4FKSMKqOBUnc7s7bNoKos6rparbv4bf1bq
         1HEGgBKJdDw94+zkGJeA7oh6XKi6z+EuzvGyqI8XvIIWe2x1jVOSgTm8b5lxtj4RSuFL
         7Nh7wqXhoU7WwCdig0W7ogI9U8ZKb6AwCucNUDkCPzJw4+91D8FZ7f/6Y4EMzofj5Qti
         fgGcXRwU8HxbA6M3cKN93pHqKFVtNOj1y5bdiKvVMhLpKikosMd2fE2eXzXtkZzPfEnt
         ttUQ==
X-Gm-Message-State: AOAM53310bMQb8jjAwL8lgAG+aQxPAsN8LI8IIOXBvtrG/aAiCBux7EC
	wytGamn6hM794q3+Pa6ri5UkOgbx8KGjWA==
X-Google-Smtp-Source: 
 ABdhPJx/ptNoppw8ewZDH524Az+DcbDDGeC2OnZLkxWP66o/ssjMV38otHgbW+N+QYWFkNJP4e3Efg==
X-Received: by 2002:a17:902:8686:b0:153:28ce:891b with SMTP id
 g6-20020a170902868600b0015328ce891bmr7399552plo.144.1647014389718;
        Fri, 11 Mar 2022 07:59:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm10830708pfa.77.2022.03.11.07.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 07:59:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcereal: Disable Werror with ptests
Date: Fri, 11 Mar 2022 07:59:47 -0800
Message-Id: <20220311155947.1975631-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 16:00:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95953

skip portability tests on 64bit targets since we do not have 32bit
multilib enabled in compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index fc58a42d28..250ea97f40 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -27,9 +27,10 @@ S = "${WORKDIR}/git"
 inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
-PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DSKIP_PORTABILITY_TEST=ON,,"
+PACKAGECONFIG[with-tests] = "-DWITH_WERROR=OFF -DBUILD_TESTS=ON,,"
 
-EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '', '-DJUST_INSTALL_CEREAL=ON', d)}"
+EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '', '-DJUST_INSTALL_CEREAL=ON', d)} \
+                 ${@['','-DSKIP_PORTABILITY_TEST=ON'][d.getVar('SITEINFO_BITS') != '32']}"
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-- 
2.35.1


