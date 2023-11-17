Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD676C54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 09:18:42 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.8272.1700212721544813911
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 01:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=Gl6pH8hS;
 spf=pass (domain: smile.fr, ip: 209.85.208.172, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso24598871fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 01:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700212719; x=1700817519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IDsxW3aHJX+LjysoZCL5Hlq4te9Ln/Gg2Hs94PO1C0=;
        b=Gl6pH8hSNoQ2P5ut3aL+6cGTLOpACzbVjLyu6ES5F8f1J+sQpBxPdXdf61qgG0wXne
         Qjw27j9ZVQSycn2r+wpYBcHyBO4B7D9lq/OlfxQkNbsqCp7Z8tcVCjMKdqGrXiEx9raV
         lM4I8C8ZJBlVURcUhc0xh6ZMKpyTJqw4jDF4cetbeR0M+m9DroGdXwV35n4jGFqSDagL
         XoZlDgQ6Ak5FX8ek1kc1x8frwPuwk+WEwIBfwdFQSv8+2sucBAVAqRuyy8YCJ2yrCMOA
         EhT1PvU6RAN08fajFWsX1qTeRMM+H5TyC4ozoRaRrVGYA8C4P01jjsiGV3AgHNWhn1E2
         Lt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212719; x=1700817519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IDsxW3aHJX+LjysoZCL5Hlq4te9Ln/Gg2Hs94PO1C0=;
        b=fp6u5V2Yd3b2+c/mMDr7XUTPA9LL5qT/2ybxQDyQHNSYzXcputfVOO4ACjKTNRvS74
         tC/HuvR5o6OWEzFRWOotskuXawQX574EvAsnVcKVAce5ou4+4CdHW61zfdxKyoDuFpYn
         7vvVUBfSRqjRuZkln/92oIXQFMU889OGPPE+lIffxR18xt43gUgx/TLOy2b6tnaXJUla
         446s1h6baq0UmP2An6PuzW7Yl+5GijNUxvYSDds2G8lOUymdEbraNOxJKoVnfSPm2gzY
         UsFq/R1F7F83UricxKApG6qkFyT9KLhJMzbH7dQZZPNkF7P398+208HYW0sWrB4O8A7G
         ErcQ==
X-Gm-Message-State: AOJu0Yz5sHa9PjN3EcO1spVuNu3qWYvSjfCHuY8+0Tloczvddti4eiMG
	kt09on30H27vrjinZmd7RVAgpiEsWO3LRtmyAmw=
X-Google-Smtp-Source: AGHT+IGlYe+dR29WlNUCNqVypzEZJkRCYLltv/pF2tFfPCYaOnFe1tV7HK45ZKSCZDTcDL633eqrVA==
X-Received: by 2002:a2e:98d0:0:b0:2c7:34e8:9224 with SMTP id s16-20020a2e98d0000000b002c734e89224mr8432294ljj.12.1700212719189;
        Fri, 17 Nov 2023 01:18:39 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id u25-20020a7bcb19000000b00405391f485fsm1965649wmj.41.2023.11.17.01.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 01:18:38 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][kirkstone][PATCH 2/2] meta-python: Drop broken BBCLASSEXTEND variants
Date: Fri, 17 Nov 2023 10:18:24 +0100
Message-Id: <20231117091824.450741-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231117091824.450741-1-yoann.congal@smile.fr>
References: <20231117091824.450741-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 09:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106865

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The command "bitbake universe -c fetch" currently throws a ton of warnings
as there are many 'impossible' dependencies.

In some cases these variants may never have worked and were just added by copy
and paste of recipes. In some cases they once clearly did work but became
broken somewhere along the way. Users may also be carrying local bbappend files
which add further BBCLASSEXTEND.

Having universe fetch work without warnings is desireable so clean up the broken
variants. Anyone actually needing something dropped here can propose adding it
and the correct functional dependencies back quite easily. This also then
ensures we're not carrying or fixing things nobody uses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d4aa17dc436beb96a804860bc6d18cf72283709e)
Backport:
* Adapted paths to follow PV changes
* Adapted modified recipes to the ones generating warnings
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb       | 2 --
 meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb  | 2 --
 meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb    | 2 +-
 .../python/python3-robotframework-seriallibrary_0.3.1.bb        | 2 --
 meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb     | 2 --
 meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb     | 2 --
 .../recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb   | 2 --
 7 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb
index c86ec092a..871eb7cae 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp-jinja2_1.5.bb
@@ -11,5 +11,3 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-jinja2 \
     ${PYTHON_PN}-aiohttp \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb
index 78514a412..afb798bd7 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_22.3.2.bb
@@ -19,5 +19,3 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-txaio \
     ${PYTHON_PN}-six \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
index 4c4c959eb..035e14951 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
@@ -21,4 +21,4 @@ RDEPENDS:${PN} = "\
     libudev \
 "
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
index d9465af08..ecc15499c 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
@@ -16,5 +16,3 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-pyserial \
     ${PYTHON_PN}-robotframework \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
index 8a30f7cb7..bd0979d0b 100644
--- a/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
@@ -11,5 +11,3 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "python-snappy"
 
 RDEPENDS:${PN} += "snappy"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb b/meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb
index e2102695e..50f14b17f 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_22.2.1.bb
@@ -10,5 +10,3 @@ inherit pypi setuptools3
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-twisted \
 "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb
index 3a9f0ad6f..976dd12d5 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_1.0.0.bb
@@ -35,5 +35,3 @@ RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-nocaselist \
     ${PYTHON_PN}-custom-inherit \
 "
-
-BBCLASSEXTEND = "native"
-- 
2.30.2


