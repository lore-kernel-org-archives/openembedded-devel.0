Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F92AC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 11:12:48 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.145292.1698145961317611010
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Oct 2023 04:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KPgt1UBG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40859dee28cso24162435e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 04:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698145959; x=1698750759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJqmmNFxaAwMudW0rQ/I2Y0wxPOM2xRArBAW2kWE2YE=;
        b=KPgt1UBGB/anVP/MHZKuj+Uuu7K2gkxm9cdnqoG90xMS1vI/szut+yR0jPB+CXT/Vn
         3t5AvsaXQ9bOmZ3/q9MuS7DgpS5yvpijLJqbpikaVql6hzVtDA8I06/VIVOn1FYdPYLj
         WusFD5VDIpiBaYvy5Y8FHr6Wn4XEyIA7HAJxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698145959; x=1698750759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJqmmNFxaAwMudW0rQ/I2Y0wxPOM2xRArBAW2kWE2YE=;
        b=NY05iUGx9kew5xzDZjC5gBQTqIbCnCDIcsppPDkT1SDDhpThZGm7+5qi0k336rtsZR
         TSyb2l0hN+kxce0sL4UItSiKNK7JftevKKVIwD9D1lqQ7F+3IRyPVs0nHpaVO5vR9YwB
         UR0CkllZALg0uoiNYgzKjFmSL/XyewSJMtovbEKqTmtCk/O1A7h3m8nkawSXyNpECiPj
         TdBHGRPoq1e9d6ryiBZkuc6UqJFL3bMO/KWc7W7HpK4D5kgigfcvRfaniTZA4xsCl26/
         8WuGG0Yx1RHxo3MVwLvdm0YRZKzt9GlSYhJzK338ovec0Guh4X+G+gQzp5IzsmkQXArr
         B7BA==
X-Gm-Message-State: AOJu0YzxBlJrxbxJn/2+aCk2D1ExSLAAy/3Y28gIRORLolpGfArxlqzf
	tRHuyNYsCMT/VaA3GFM65reTpOQR27DYPN2OW/U=
X-Google-Smtp-Source: AGHT+IGY/AKodr4uNfkKallWduMIAwuy28epGkUMm1Q0aoJ/6eW13n5ARmgjJBbzCs7dPzWJcQpPDQ==
X-Received: by 2002:a05:600c:474b:b0:3fb:feb0:6f40 with SMTP id w11-20020a05600c474b00b003fbfeb06f40mr9319530wmo.11.1698145959529;
        Tue, 24 Oct 2023 04:12:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:8b0:aba:5f3c:ae1f:6bff:fe41:1692])
        by smtp.gmail.com with ESMTPSA id b12-20020a05600c150c00b0040586360a36sm16303404wmg.17.2023.10.24.04.12.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 04:12:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH] meta-perl: Drop broken BBCLASSEXTEND variants
Date: Tue, 24 Oct 2023 12:12:38 +0100
Message-Id: <20231024111238.58158-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 11:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105719

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
---
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb     | 2 +-
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb     | 2 --
 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.40.bb           | 1 -
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb          | 2 --
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb    | 1 -
 5 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index 5db0bb4269..5c3701f16b 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -38,4 +38,4 @@ S = "${WORKDIR}/Config-AutoConf-${PV}"
 
 inherit cpan ptest-perl
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
index 4d793a4e32..028d9e9163 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.083.bb
@@ -52,5 +52,3 @@ RDEPENDS:${PN}-ptest += "\
 do_install_ptest:append () {
     cp -r ${B}/t/certs ${D}${PTEST_PATH}
 }
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.40.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.40.bb
index 65616136c3..e30125ab7b 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.40.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.40.bb
@@ -62,4 +62,3 @@ python __anonymous () {
                                    d.getVar('TCLIBC'))
 }
 
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
index dcc5ea88b1..a77381dce8 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
@@ -41,5 +41,3 @@ RDEPENDS:${PN}-ptest += " \
     perl-module-perlio \
     perl-module-test-more \
 "
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index c568ade997..cf290d9908 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -37,4 +37,3 @@ export LD = "${CCLD}"
 
 inherit cpan pkgconfig ptest-perl
 
-BBCLASSEXTEND = "native"
-- 
2.34.1


