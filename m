Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FB9C197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 09:09:52 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.8169.1700212188737993937
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 01:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=EzKAvKTC;
 spf=pass (domain: smile.fr, ip: 209.85.167.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50a93c5647cso2418664e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 01:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700212186; x=1700816986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BivahxFpwhkA8GS2ZeFAcQHguiRsi70I3D/QhB193CI=;
        b=EzKAvKTCmi8H4TheAAgIq76+Lmzm2m+zQBbPDT9eLMrqbg7gi81A381crWK1ZUYaK+
         DAO/eS8bwEBBfPfVrYxtluzUon8VfjcxR8cBMC+Y13JjEznQcPwbSY36WSP7XQXsU6wa
         JVolPZqN7cQTVngQ5q8Ttfy5iVJUjEbS7W0hgqxIz7Ta8Fx5iht0crkpLwqdw3u+vUBH
         4ogsTB1owtgtJskMu1vvAPUf2In5JjEm/k5Arb66leIekTBkZuNian9IEhUs7+k6pvX/
         G+7aFF7y4UsvZcbktlO5YSJwJR7wqAq4uf6arbGsbGgighBoT1izKMu2CweAOTYENJlO
         0tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212186; x=1700816986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BivahxFpwhkA8GS2ZeFAcQHguiRsi70I3D/QhB193CI=;
        b=cMT0+uUQW32b5ze7/udjZ9daAl5+wyx/AqiUhhssR0k8WfPo129Yf77jAKaXWA+qd0
         J4AY8YCC79gYQzxXqT1hflE9NyYMQh8Q7Ua5RueJk5tYFAF26x/ZsG0QV3vGobYPHrkt
         ri81KgOzzf2kl915632TnvWR2Nay662MIf+ohAR+WROxyOKgCGunOtB3/dJOtWOWGaXO
         jJMW4vSIkyERTXx34RTtTW8sAahDBJEOxL3o/2arYjubPgksWKbvpEvSn6Pj2xj96KgN
         nGwL9ISs5ACmtMua/FO0w6F7ddlbUN/Dn6QaB+Kgedxatjb9TQAiBn6MX0ixLIpXO3Z9
         9OLQ==
X-Gm-Message-State: AOJu0Yx5lcNt7QvfVGU2yeJoWQ1SsHxAsC5mczwu/0bJcZjm39LpgOB0
	Agxf758Znyi3OjyV9n+Nbm0YW0ZTVc5o0D4FzmA=
X-Google-Smtp-Source: AGHT+IGvTHwgagrD0r104RyhTRfpGNIlVUTfIhsr2A76xFmU8JuuFSzXpok1ObxWxiO/pgCVbC8LiA==
X-Received: by 2002:ac2:5551:0:b0:509:2b80:f90c with SMTP id l17-20020ac25551000000b005092b80f90cmr11678061lfk.68.1700212185849;
        Fri, 17 Nov 2023 01:09:45 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id v10-20020adfe4ca000000b003313a1e0ba1sm1662058wrm.89.2023.11.17.01.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 01:09:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-perl][kirkstone][PATCH] meta-perl: Drop broken BBCLASSEXTEND variants
Date: Fri, 17 Nov 2023 10:09:21 +0100
Message-Id: <20231117090921.449667-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 09:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106859

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
(cherry picked from commit 79e0a9d237343ad0af0a40128494155ccaa131ec)
Backported:
* Adapted paths to follow PV changes
* Adapted modified recipes to the ones generating warnings
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb     | 2 +-
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb     | 2 --
 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb           | 2 --
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb          | 2 --
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb    | 2 --
 5 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
index 5db0bb426..5c3701f16 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.319.bb
@@ -38,4 +38,4 @@ S = "${WORKDIR}/Config-AutoConf-${PV}"
 
 inherit cpan ptest-perl
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
index 6249fd1d7..6e04e40dc 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
@@ -42,5 +42,3 @@ do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
     cp -r ${B}/certs ${D}${PTEST_PATH}
 }
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
index 2c7d793a7..c768d64e3 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
@@ -61,5 +61,3 @@ python __anonymous () {
        raise bb.parse.SkipRecipe("incompatible with %s C library" %
                                    d.getVar('TCLIBC'))
 }
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
index dcc5ea88b..a77381dce 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
@@ -41,5 +41,3 @@ RDEPENDS:${PN}-ptest += " \
     perl-module-perlio \
     perl-module-test-more \
 "
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index c568ade99..01261d547 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -36,5 +36,3 @@ S = "${WORKDIR}/Unix-Statgrab-${PV}"
 export LD = "${CCLD}"
 
 inherit cpan pkgconfig ptest-perl
-
-BBCLASSEXTEND = "native"
-- 
2.30.2


