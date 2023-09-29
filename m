Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D66CE743E2
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 04:42:23 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.11114.1695962541560818768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 21:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SOPUzzIK;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c736b00639so12297055ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 21:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695962541; x=1696567341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWiaozpR2o6cNSltS73cdXQOzRxKyV8jWagyu66jDRo=;
        b=SOPUzzIKyrxQnI1LTU4ePWseQGgT26/UY2Ek6FAltMziqXXf5lvf9ZrGQ1UUS/lkEb
         Sz22txa9huUb84bkpiTUcl+yDW0FXCjdJKF3BjzNUtteOF+go+x1SrX0IdLq4/TEI00c
         abub4fdWRcAYq80bO+K6oZKp7E3FkFWQfqljYb+MvWXt1Dj8yenjXAZI1R6w93IRyaMe
         arR//KuUzlNinGluI+B4V3USsJvCb+ZPMcy2ZtoU81s9ug9Dpym7LKq6zKz2atrwoCGa
         GF3me95b1he1pQH6c6pnQDsia9Ee7osq1RaPH40c2H+4UvAboirgewJ25J7Juk67IpeE
         s2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695962541; x=1696567341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWiaozpR2o6cNSltS73cdXQOzRxKyV8jWagyu66jDRo=;
        b=nqxulfJUQuXK+GuJmFzATHxJq+D0FCbes78THNvjyvAlUlRBI1pII6pOffthpvCvMH
         KZg6yeTqAgcGJ0X+aNN0SP7oR8Z+7bS1m+bFQwEqAXPhdcc1nN/Oz3PwVP33ijpGmn2u
         rnT18Mt5luOugmoIqWP3obWsI0LAogqesooJDTjg7+uWPluB9bXNIln47qxndyJG4+p6
         38JRC2HOgl5U5Oi2ivdYiv6h+ZXmPM2NvkCOFNi73+5l6nZnKQGEk8ccToND77Hrx/n0
         hW0vXvWRbeg4VpXuN6p4zOE8N9/VM5xddGqA8xt1GQN3v75wLNJPygiGE5vkjnfg5DJT
         Qpsg==
X-Gm-Message-State: AOJu0Yy2n2OE+OR4lk8JhNMgZzuAxoZCH//SboJv2Vx6p0EOlM0IxCiO
	EqAbqdh+j+HSsodPJ9QFwyI7ZBEoLdQLhg==
X-Google-Smtp-Source: AGHT+IGfTLO/Hn/zCiOM8ScYdSr8cZitcgoXZf8ISiOsmWotZaMPVo3oTsE4zhM+UDHkm9oowcFJJQ==
X-Received: by 2002:a17:903:26c2:b0:1c6:3329:ddab with SMTP id jg2-20020a17090326c200b001c63329ddabmr3227406plb.7.1695962540516;
        Thu, 28 Sep 2023 21:42:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id a12-20020a170902b58c00b001bc5dc0cd75sm5266809pls.180.2023.09.28.21.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 21:42:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH] libio-socket-ssl-perl: Change libnet-libidn-perl->libnet-idn-encode rdep for ptests
Date: Thu, 28 Sep 2023 21:42:17 -0700
Message-ID: <20230929044217.1540033-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 04:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105231

This ensures that all ptests can pass, libidn wrapper does not seem to
find the library and as a result the idn tests fail.

Fixes

Failed ptests:
{'libio-socket-ssl-perl': ['t/verify_hostname']}

as they are now skipped

ok 78 # skip no IDN support with Net::LibIDN
ok 79 # skip no IDN support with Net::LibIDN

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
index 8ae5c0e68d..4d793a4e32 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
@@ -38,7 +38,7 @@ do_install:append () {
 }
 
 RDEPENDS:${PN}-ptest += "\
-    libnet-libidn-perl \
+    libnet-idn-encode \
     liburi-perl \
     perl-module-file-glob \
     perl-module-findbin \
-- 
2.42.0


