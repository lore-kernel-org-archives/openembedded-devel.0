Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E04D1A42F
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 01:43:06 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.2551.1728697381841723512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 18:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IqfG8IzX;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e221a7e7baso1784206a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 18:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728697381; x=1729302181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inc/12bO/g1MujvC5EGdTQtqNCfTNZu2nG8sim4Sxgk=;
        b=IqfG8IzXJNEJNp0IS0w5sDBrorRdrrVpjR4iCB8VrVWuXq8lIoA0mB/QbB6Hg0xWpt
         D/OGQyeGu4tmMm2GR9NlCRHcHEQ507S3s9U5c1IPiKC4gbZcn/+on0R5PV1Wi7XB9fDH
         CPzlqTRc0vGIehg1Q5DmYveYInPya5bR6wSfVEzpkUxs6v6T3qc+fvU5dStd4ix4R8Uw
         vXnETrTfLF5NPe+Sy7up4WARG0YaUevZUrf/hqhqRnPsAAc7NgFVR0MG5J6ri+V1rlez
         fru03O2dxTyCDCH6Gfx5RbcD8WGcduBTgDZ6GkYzPa+5r+u7RXYS6lvlXasn7fHE+pms
         4Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728697381; x=1729302181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inc/12bO/g1MujvC5EGdTQtqNCfTNZu2nG8sim4Sxgk=;
        b=mnQ6aHXRdQgGuSCxuKIauJAhepDRs716ED2yPmtZCioBVhvuZ8KxfaSFzz8dEHpkG3
         MzmwqKeiQvuAQKpseZ7uvOtxKk/I5rVDh5dfGxYk24VBdCb0fI00Fct3utJ3AaWFOcKa
         78Bxyn5Pyf04++oUSf3wfSk0NjPm12Fbysyzz83JcQQ2ZJ/ouJWfxuuaYFwWODUAd9mf
         z642eW/htEI6QHz/61j8mpJbznwlp3bOp29hhkUxA/YdPEEXlHJNkSmZe8C/Vj/MDLh0
         8y1KPaSYudAuOipNoeesITzhvzCAQAQtD/JXoohJ9chVfUXZcztsqfGPKqTWVfBjc+Mv
         u0BQ==
X-Gm-Message-State: AOJu0YzQlnc07TiF0yv70EYk7u73HzLD5CnprhH8mnkBVK4Cn+7yazqr
	+zQL68bCxCMWb3p+tuWeEkUSelYkhemMc/ThEpBjKXlaB6mRsulDbgZDtlbB
X-Google-Smtp-Source: AGHT+IGJS0UBVuoOhGobg2IN5HUSH45vxr0DtB4u4C3F0RmTGA6Xvbc2wJ6y1BaqqsEDTDrfpwsNgQ==
X-Received: by 2002:a17:90a:e2d7:b0:2c9:5a85:f8dd with SMTP id 98e67ed59e1d1-2e2f0aea0fcmr6092544a91.18.1728697381030;
        Fri, 11 Oct 2024 18:43:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ca87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2b9483328sm5464366a91.44.2024.10.11.18.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 18:43:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] ace: Upgrade to 8.0.1
Date: Fri, 11 Oct 2024 18:42:57 -0700
Message-ID: <20241012014257.1775463-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241012014257.1775463-1-raj.khem@gmail.com>
References: <20241012014257.1775463-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 01:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112818

Changes [1]

- Drop setting c++14 for c++ standard
- Do not install rpaths

[1] https://github.com/DOCGroup/ACE_TAO/releases/tag/ACE%2BTAO-8_0_1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ace/{ace_6.5.19.bb => ace_8.0.1.bb}                   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/ace/{ace_6.5.19.bb => ace_8.0.1.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
rename to meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
index a9bdbc916f..c79fba323c 100644
--- a/meta-oe/recipes-connectivity/ace/ace_6.5.19.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d2c090e9c730fd91677782d8e2091d77"
 
 DEPENDS += "openssl gperf-native"
 
-SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_19/ACE-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-8_0_1/ACE-${PV}.tar.bz2 \
            file://ace_config.patch \
            file://no_sysctl.patch \
           "
-SRC_URI[sha256sum] = "739be290a38229aaa5b5150e6ea55ce427e80970f0ace4c5040ac46644526f41"
+SRC_URI[sha256sum] = "8d379f37d56db33f3ae447725b632d48b1c13e887593547ac3568e3b428c28f0"
 
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -25,8 +25,8 @@ export ACE_ROOT="${WORKDIR}/ACE_wrappers"
 inherit pkgconfig
 
 CXXFLAGS:append = " -fpermissive -Wnodeprecated-declarations"
-CXX:append = " -std=gnu++14 -ffile-prefix-map=${WORKDIR}= -fdebug-prefix-map=${WORKDIR}= "
-EXTRA_OEMAKE += "INSTALL_LIB=${baselib}"
+CXX:append = " -ffile-prefix-map=${WORKDIR}= -fdebug-prefix-map=${WORKDIR}= "
+EXTRA_OEMAKE += "INSTALL_LIB=${baselib} install_rpath=0"
 
 do_install() {
     export D="${D}"

