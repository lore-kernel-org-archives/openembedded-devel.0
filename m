Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008BCC6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 12:05:57 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.10389.1678968348166951753
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Mar 2023 05:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S14K+HZo;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id y10so1368403qtj.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 05:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678968347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+z2pMN0Y/Lwv2LkEz7QkLv4nKlcBT/h7UrVw0Nnrb8=;
        b=S14K+HZo0pmnyGPHreZyyNbwVSQpJYww4+rxV0UQrCBaeKsb0RVWiCCoYXIZcbEq43
         Absdk94q0uO6lphPJLgZn18n8xzk5OpCnvWC+kYAeM2AoIZinKcoQ179PT6bVcFpzVTM
         KevPJLr0CsVZdpYVDxBq8vcvPC3Yj1HcXJq3YzOGrc0xlnyNuNOcIPVo1mXqjcxdCT8C
         89jZEJ1iJaMPLIF3CtY7BGXIqkQjJQTpQK611151pCM59RqDOlDRftplU4mp82euoHTo
         HfnxttQVjRjUV3O/hZmDVptLYGd/bi6W4VH3gtqR3kW1MqeHtUdEVXLu1BM5nkNc4G6v
         N6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678968347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+z2pMN0Y/Lwv2LkEz7QkLv4nKlcBT/h7UrVw0Nnrb8=;
        b=H64/6NEBFB0USxCrI5/OktLudMtd0iKdtmHI4D71rIxoIbg2tsSoSvRL+Qg3ylr/aH
         VUoCGIvCyrULjmQ5MiuK6Q9ymMNr31awzWkS6LzmQ7QjB+WV4W7kvKHw3+wMufR0LzEN
         sfSMLyFUmlg5NtIuGnSkE3OuRdqRqJ4L3oPTMon3ydp3DDptmpqWpcxG69PUtSxwXVlo
         fjsvSs51ofbJE9axLOz5ZCFPEHgPK+5XuWgA31cVQ1HbyQWTSMr0Mn+V1R0+ZkSB9j/j
         KY5ApK2DC+scF0JnUlhw/zT/V/ZnAf+p1nD8jDou7Ne+ViSYRIcYy6idjaYI34+sGnM4
         fhmA==
X-Gm-Message-State: AO0yUKVVTXLXBbcm/4MQMIzcAPzdQQikVo+nJSzcXzmCWv4n68hsUmsO
	FS0q4vV48ITloSDq03WWqOXTlSoGDxM=
X-Google-Smtp-Source: AK7set+biMj6WbxFKQ0c/elFGm08cKF1nrLwnDnarL/pGHnmsow+zgKQYzUNEBphi8QhrolA8P4mvA==
X-Received: by 2002:ac8:5bcb:0:b0:3bf:d161:79a1 with SMTP id b11-20020ac85bcb000000b003bfd16179a1mr5431397qtb.29.1678968345708;
        Thu, 16 Mar 2023 05:05:45 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6d77:5b42:4248:f526])
        by smtp.gmail.com with ESMTPSA id o6-20020a375a06000000b006fa16fe93bbsm5731677qkb.15.2023.03.16.05.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 05:05:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][kirkstone][PATCH 2/2] apache2: upgrade 2.4.55 -> 2.4.56
Date: Thu, 16 Mar 2023 08:05:44 -0400
Message-Id: <20230316120544.271353-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316120544.271353-1-akuster808@gmail.com>
References: <20230316120544.271353-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 12:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101573

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-  rotatelogs: Add -T flag to allow subsequent rotated logfiles to be
   truncated without the initial logfile being truncated.

-  mod_ldap: LDAPConnectionPoolTTL should accept negative values in order to
   allow connections of any age to be reused. Up to now, a negative value
   was handled as an error when parsing the configuration file.  PR 66421.

-  mod_proxy_ajp: Report an error if the AJP backend sends an invalid number
   of headers.

-  mod_md:
   - Enabling ED25519 support and certificate transparency information when
     building with libressl v3.5.0 and newer.
   - MDChallengeDns01 can now be configured for individual domains.
   - Fixed a bug that caused the challenge
     teardown not being invoked as it should.

-  mod_http2: client resets of HTTP/2 streams led to unwanted 500 errors
   reported in access logs and error documents. The processing of the
   reset was correct, only unneccesary reporting was caused.

-  mod_proxy_uwsgi: Stricter backend HTTP response parsing/validation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f8b54b5243c9effb66d5685463b87767e753b843)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.55.bb => apache2_2.4.56.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
index 88cef0ef83..1ad222ace4 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.55.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac"
+SRC_URI[sha256sum] = "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


