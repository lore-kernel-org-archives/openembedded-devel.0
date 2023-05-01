Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A729C7EE24
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.87634.1682921125826928116
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FnTXrTdO;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-63b4e5fdb1eso2583664b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921125; x=1685513125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ec/yE3lm8gTVp0PzP2xLS8dBY0P+ezOUJv0qgwoB5I=;
        b=FnTXrTdOv4KteRjKpHARPU2eIttFfmMbbUXRpBPTQmWb1tSceO6c936Q3qgfMk61Kz
         pTwfx6yhTcrWD34qv9h5a0gGYeeAm6aMzSrBR3swY4zH6CYohpouqyqbLWTn0PN9P2XL
         Yn6ivfhMDGM/QGTXxYoIZ6Tezcr2BiICyYXQhQCmjdFSv125e1c6tDozRk6zeiBDSyV+
         XgM6+tM9AzDrvJgToU+U93ooavxC2DXa+xQRdzVgMeiMdV8RX+CxAwSkwp9lX83jBjcL
         xKzqkysx0RNfrjaBXbiqZlo4zhuvN7jrCd3xXT6s6JrhGw9jnEfhkxGGA2UHxKRMjL7y
         mtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921125; x=1685513125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ec/yE3lm8gTVp0PzP2xLS8dBY0P+ezOUJv0qgwoB5I=;
        b=Aa8SawvFqzK/BE86wTk2hf/crmTFHL5dHqUvrUaSQ2JQ0HXqtDlq9tdcHHLu9e33Tg
         HNElOyMVeJ89/e8ilQnpEwXnN4K3d1wJhBEHJnHAxziE8uy0pKpaDNFoPYO6macGB2+c
         2HiFZmjUDpY8Qk/hWqWoAYsmbQg7Sp41jMhIx+ltcAbOfodKFcO9DdEMLyv8mH9awqIJ
         E56HhteKybJYRPb16CWgACta/KseP59J7w9D0iAoKeX8dchgU+Hhvc4J5qC39LgRPXKh
         E0i7G3zpZIiDzhHdN8K02u94p4l611BfoyT94ffwMB1ROfQD+a4V2wSnYu3obtVAEoYX
         oXGA==
X-Gm-Message-State: AC+VfDyQIL3M8HMW5BQYqHflWVoxxh5LJM1/lcmS+16IWxzc/CRbhc45
	oyULapPNxngEomZ4LGP/mfXH71JmBECJpw==
X-Google-Smtp-Source: ACHHUZ6yvF7aY8JDyDOaKHIZdZqVb48NpJcKLSioLEAogsiN3zg2SR+Mkwk4ULn3nUQvlTloRnjfNQ==
X-Received: by 2002:a05:6a20:7f92:b0:f0:e3ed:469a with SMTP id d18-20020a056a207f9200b000f0e3ed469amr16110184pzj.55.1682921125021;
        Sun, 30 Apr 2023 23:05:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/13] ctapi-common: Point to working SRC_URI locations
Date: Sun, 30 Apr 2023 23:05:12 -0700
Message-Id: <20230501060518.3505068-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102236

Drop md5sum checksum

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/ctapi-common/ctapi-common_1.1-14.bb    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
index 25d5b09e7f..b7a9d3e936 100644
--- a/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
+++ b/meta-oe/recipes-support/ctapi-common/ctapi-common_1.1-14.bb
@@ -4,10 +4,9 @@ SECTION = "System Environment/Libraries"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../ctapi-common.LICENSE;md5=8744cd52545ecb45befebd0da6f70f0a"
 
-SRC_URI = "http://ftp.riken.jp/Linux/fedora/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.LICENSE \
-           http://ftp.riken.jp/Linux/fedora/releases/23/Everything/source/SRPMS/c/${BPN}-${PV}.fc23.src.rpm;extract=ctapi-common.README"
-SRC_URI[md5sum] = "5b7259ef1c8cd9ae801fca7a5cb548c1"
-SRC_URI[sha256sum] = "87a74eb0a66055c34ba2c5c919e74f3211c5950ae1c2cbab967fdf4137f5de91"
+SRC_URI = "https://distrib-coffee.ipsl.jussieu.fr/pub/linux/altlinux/autoimports/Sisyphus/x86_64/SRPMS.autoimports/ctapi-common-1.1-alt1_14.src.rpm;extract=ctapi-common.LICENSE \
+           https://distrib-coffee.ipsl.jussieu.fr/pub/linux/altlinux/autoimports/Sisyphus/x86_64/SRPMS.autoimports/ctapi-common-1.1-alt1_14.src.rpm;extract=ctapi-common.README"
+SRC_URI[sha256sum] = "0531a6db39271166f1e9060f81a0b2d47f878210dfb4f465c703fe205cc3a8ce"
 
 do_compile() {
     install -pm 644 ${WORKDIR}/ctapi-common.LICENSE LICENSE
-- 
2.40.1


