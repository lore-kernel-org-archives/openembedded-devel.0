Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15279C4321E
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:11 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.25692.1651346346899889568
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nNiQG72p;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id j8so9673483pll.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BbZKuc837NtGaWTQkc9iPRY0ibfjVw+DcDK1iH3AziM=;
        b=nNiQG72pnPwxaOPHTSh1n/Ww2d8u0sEYVhdGvMI4KTWSqN6EoAUzyq2BYEDsDAOlKv
         Usk1ox9v6cC52bCTH99ub+Db03UzpfOZxekYZ1cW9Wb1gkiMku3PZk+hrZAliRq+6TOd
         dt4jhp1HfD5qtqckSYhk08Yq3lQPP8lzH8MVzO2nN83CNWKdiTLh7kaZ2J6iqu8PzKyO
         2b9CNOMSmhT+PAlYcHmCAfvxKdxjehxS9hgn7tus8goBTA2Ela1z4jB4/iD/ZNBBsjry
         Hm4WHqTvvevbPDvhWt/+vFaF5mkaiQeK3+8lesta5AujYZikpYP7aR61Kr1Ju7fodUAg
         qg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BbZKuc837NtGaWTQkc9iPRY0ibfjVw+DcDK1iH3AziM=;
        b=oIYCIuadrdD8GYgGrHorAlJgXMKDd9m/V7jFybIO1mR37f798iH4Y3vSYYQZU51lNj
         aScwWubSVzupgN6DqUg4n1W/+MxyC0HZD329dehQutdjVOZYrFjfS0Kw5/Upbz13Au/p
         oHx6Dlb+eB4I4VrQGJDPenRUt9UMQPs3+r0J2cFxSZ5sHKkoc+R953Og1dE3VQUsthya
         fgtmEcm1IABCv/37VjlrT/hwURG1PRM5A4o3ujRIxKc6d3NDb1JpXaoXeK4mTg1ipQda
         xkF3GajhJniGUj1VajfeW4VnKHHhNoe1Er2NPgbuKCjz9kb92eqLqmZeDxXXvTTOHEyP
         Vtxg==
X-Gm-Message-State: AOAM5304QTHUQf/wKdMdVMXZ23BGT8pSv2a3EGpUZhzvu/bmfB+gbhRO
	VXN+JIjTxMukfJ1keUIfkYS9/Rb9klPPDQ==
X-Google-Smtp-Source: 
 ABdhPJweHbUQG7+7ir3/bbMqrw531k8dBFgmWSr1OQ8ei9CbOvmZoAyVqLDDUj0ySXx0v6vFIx39hA==
X-Received: by 2002:a17:902:f70b:b0:14d:643d:9c99 with SMTP id
 h11-20020a170902f70b00b0014d643d9c99mr4854866plo.18.1651346346073;
        Sat, 30 Apr 2022 12:19:06 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 26/39] libextutils-cppguess-perl: upgrade 0.23 -> 0.26
Date: Sat, 30 Apr 2022 12:18:06 -0700
Message-Id: 
 <804233429c083bb6a1239132fe3ddbe3e0f1c302.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96893

From: wangmy <wangmy@fujitsu.com>

Changelog from 0.23 to 0.26
=============================
- fix test-failure caused if CXX is set
- ignore environment variables CXXFLAGS, CXXLDFLAGS (#26)
- support environment variables CXX, CXXFLAGS, CXXLDFLAGS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e709705f411440e5a732e7e453bb6654264851e7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-cppguess-perl_0.23.bb => libextutils-cppguess-perl_0.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.23.bb => libextutils-cppguess-perl_0.26.bb} (92%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
similarity index 92%
rename from meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
index fd6347b3d0..04a29fdc21 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
@@ -12,7 +12,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f96c48984eb6d8efb7d933b34f361d0c8b38335e3e5382e9aeccc0aa519a002c"
+SRC_URI[sha256sum] = "c8b362b860172a4076acee00438f52b86464f2c500702cfcf7527811ff9a683e"
 
 S = "${WORKDIR}/ExtUtils-CppGuess-${PV}"
 
-- 
2.25.1


