Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BF1C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 11:19:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.9179.1707477558738868287
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 03:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=k+o/Zxdl;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33b4e5ed890so437564f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707477557; x=1708082357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dbd+BaO8N9wEydZ7efP8ucXMiv1eqXFed0DeoYpGhGk=;
        b=k+o/ZxdliNR1j8OwUg4ELD1AgpTbXo1+ybxKEq+0h+/SroqfkZclSC6YzBgvJqbkIi
         Xq3a4svHbkp5Fy7VAmhdzX2BHN2PYJMjnKqvB2/S4NNt3OEokdy1SaXHNj2QjwutlhLq
         +6h9IDg+85gOXIHX48FYBVKVi3R25sWphIVaf5AnlfLASX0QNxHdECd1CGcnFDof6lHY
         IACXmdPqJi6KLgPKwOaVwRV4y0WKmTL2IF2FkvHIMP/EchDQPpsHDlZTqP9vwmXrIcBs
         NujmcjIfS1Ku22ZVPPFgg0OGGhFYYrbB8rLq0/VFXi1tZnb8AIBJKEjhk8mrc4px5Cym
         Gnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707477557; x=1708082357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbd+BaO8N9wEydZ7efP8ucXMiv1eqXFed0DeoYpGhGk=;
        b=KnW2Gvbale/OuDXQiF/mj1i6F5GiR9/ZoJO8Ocay4VXpZNo11b9jY92g5b4APfSgB1
         wu7CwzX/qh7z00px8xiaOWeUrkgOJnqQELDEBU9jpb6MxpoKIKXM6zCnfWtX7iVNXQGP
         vUSGd1hi5QYsLjT3L9xe8xue1cg60AH18s/u+TwaGxxRIP2NZuE3lv+a1FPBhtWPQN7+
         QS7X4mpYwwiCb9y7E+5p2B6YY/E5gQIKYvYpRoFlrCTpKZkwfRGXxOIbdDOnEVxVkYTF
         DMDV4J3jMdkXPF8raZT6M7I4avzKBjK2IVdqtJaLtKU6S+ofegIKzVh1OxzvxxGQSiYI
         wNaA==
X-Gm-Message-State: AOJu0Yzvjo0vi/DQEw9zstaoffuwiAJebPJS07eLJ365KIz5+niGb0lM
	H8PlThrn5Vsrg4WOfQWtNjUssFwUTEW1JWXvkNVlzEOZn9x3Dn5tYuz3qadC2aE0c1L3a/3ZAXV
	J7u4=
X-Google-Smtp-Source: AGHT+IH7Xs6zYz/05YrH5UnrwFEdENg1zCHOJ3CqvzAeNO9K80JEgJ1XYzHB4HMMKplwJf+3dJh/IA==
X-Received: by 2002:a5d:4743:0:b0:33b:26be:c5c4 with SMTP id o3-20020a5d4743000000b0033b26bec5c4mr830236wrs.58.1707477556920;
        Fri, 09 Feb 2024 03:19:16 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d4571000000b0033af5716a7fsm1544424wrc.61.2024.02.09.03.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 03:19:16 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] mariadb: Move useradd handling in target side of the recipe
Date: Fri,  9 Feb 2024 12:18:16 +0100
Message-Id: <20240209111815.1901401-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 11:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108682

Having useradd class inherited for the -native recipe makes no sense and
emit this kind of warning during reproducibility test:
  stdio: WARNING: QA Issue: mariadb-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: useradd-staticids.bbclass [native-last]

So, move the useradd inherit and associated variables to the target side
of the recipe.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
Tested target ptest OK but could not find a -native test.
---
 meta-oe/recipes-dbs/mysql/mariadb.inc        | 6 +-----
 meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb | 6 ++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 7e6ef42bc..25dc15b46 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -33,7 +33,7 @@ S = "${WORKDIR}/mariadb-${PV}"
 
 BINCONFIG_GLOB = "mysql_config"
 
-inherit cmake gettext binconfig update-rc.d useradd systemd multilib_script pkgconfig
+inherit cmake gettext binconfig update-rc.d systemd multilib_script pkgconfig
 
 MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mariadbd-safe \
                     ${PN}-setupdb:${bindir}/mariadb-install-db"
@@ -42,10 +42,6 @@ INITSCRIPT_PACKAGES = "${PN}-server ${PN}-setupdb"
 INITSCRIPT_NAME:${PN}-server = "mysqld"
 INITSCRIPT_PARAMS:${PN}-server ?= "start 45 5 . stop 45 0 6 1 ."
 
-USERADD_PACKAGES = "${PN}-setupdb"
-USERADD_PARAM:${PN}-setupdb = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
-GROUPADD_PARAM:${PN}-setupdb = "--system mysql"
-
 INITSCRIPT_NAME:${PN}-setupdb = "install_db"
 INITSCRIPT_PARAMS:${PN}-setupdb ?= "defaults 44 44"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
index a4498fa44..b1d1355e2 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.11.6.bb
@@ -1,6 +1,8 @@
 require mariadb.inc
 
 inherit ptest
+inherit useradd
+
 SRC_URI += "${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)}"
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'rsync-native', '', d)}"
 RDEPENDS:${PN}-ptest += "cmake sed perl-module-test-more"
@@ -36,6 +38,10 @@ DEPENDS += "mariadb-native bison-native boost libpcre2 curl ncurses \
 
 PROVIDES += "mysql5 libmysqlclient"
 
+USERADD_PACKAGES = "${PN}-setupdb"
+USERADD_PARAM:${PN}-setupdb = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
+GROUPADD_PARAM:${PN}-setupdb = "--system mysql"
+
 RPROVIDES:${PN} += "mysql5"
 RREPLACES:${PN} += "mysql5"
 RCONFLICTS:${PN} += "mysql5"
-- 
2.39.2


