Return-Path: <sweng5080@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248A3C001DB
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 17:17:22 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.173.1691083034022129617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 10:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=a+KmI800;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: sweng5080@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1bed90ee8b7so738062fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691083033; x=1691687833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2kh7FjF4+bKVZaQT2L8X4pS7B25oK8Y0ztQRcMLgkc=;
        b=a+KmI800WMX4Ef4Bt5ERmo5vsyalf1IeoCbFrMwTpph++3OmQc1zxA9QZngYx3FVhC
         w54RZ7/cRqdOaNkJQXivB3+ZbmUtpzDwffnQd4BgceQrneLTfdBgqhkIWMFhg9KEyFrL
         VeauwCNDtnDEbStUL0zPCgT1yyH99Q+sgbY9icUDo4BmHrtwWWxhIlXhzN4S/KVUeHoo
         WlBsTN0yT8cJzZ5WA2uvM2ytsV3eyzYx6b0MQxD3UDIXRFD4HWqBpHtBGFAKuUgin8c9
         bfNAXjyuCIKkv1sAf2m9/jzdnPHhIepSStmoT4aBrveHPAYaHfaHoBeSW7/jT7Gy4Eat
         e3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691083033; x=1691687833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2kh7FjF4+bKVZaQT2L8X4pS7B25oK8Y0ztQRcMLgkc=;
        b=HGUKzDpsGjRsoRWdc0/Y4m6ZHyrfvvIcKkrH2FIM+NVVyPl/VwBBQYelaKw9Qae8T5
         5OJs/WFPFgZeYBdS5y6V8xfAB+N9il6nz61kQ7FROSkHXz3v8R/w17zTRXKOuZRpjBKV
         5Wpj215ptklqPGoSgLsfca/juVkuZ4pPUanUujD858FFU9MlGW443c7j8cSSpTIZeRZp
         OYT8G9NT4oZbAtIRm2rY19bgrZ5HwU03FJIYM5ajIUEdjRO4oGinlq1d9t3LH4pPUD8f
         ZQ+tP8z+Ba2h2zSj7jx6fDVhDQtC60oZMas9wwaZYBhgUij4/QktKFoQKxmVE0k0lhzO
         BduQ==
X-Gm-Message-State: ABy/qLZePXVyLLd9X/KWnyWZCQ2fKdByO7dWjduAK/e8MEerOhL3Nt+9
	t0uvqeLaPEvu5wVnO/ihkZbFwydgv3o=
X-Google-Smtp-Source: APBJJlEvj3ejz+1KPy6zlQp+249zn0W4Lbmr2gu5OSW+8D4jUTZz9CHRxhZiA8z6eU8manyzEt9qQg==
X-Received: by 2002:a05:6870:6488:b0:1be:f7d9:c0df with SMTP id cz8-20020a056870648800b001bef7d9c0dfmr12231889oab.10.1691083032912;
        Thu, 03 Aug 2023 10:17:12 -0700 (PDT)
Received: from OLA-8C2DT13.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id f140-20020a4a5892000000b005634e8c4bbdsm112719oob.11.2023.08.03.10.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:17:12 -0700 (PDT)
From: JD Schroeder <sweng5080@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: JD Schroeder <sweng5080@gmail.com>
Subject: [meta-networking][kirkstone][PATCH 1/1] Fix groupname gid change warning
Date: Thu,  3 Aug 2023 12:16:18 -0500
Message-Id: <20230803171617.13428-1-sweng5080@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104220

This patch fixes warnings when useradd-staticids.bbclass is used and
USERADD_PARAM is used to add the user to a group that has not been
explicitly created yet. By adding the GROUPADD_PARAM for the new group
being used the warnings for changing the gid from GID-OLD to GID-NEW
is eliminated.

Warnings fixed:
cyrus-sasl: Changing groupname mail's gid from (WXYZ) to (JKLM), verify configuration files!
radvd: Changing groupname nogroup's gid from (WXYZ) to (JKLM), verify configuration files!

Signed-off-by: JD Schroeder <sweng5080@gmail.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb | 1 +
 meta-networking/recipes-daemons/radvd/radvd.inc                 | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
index e344733ef..3fc1b0fd1 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -73,6 +73,7 @@ do_install:append() {
 }

 USERADD_PACKAGES = "${PN}-bin"
+GROUPADD_PARAM:${PN}-bin = "--system mail"
 USERADD_PARAM:${PN}-bin = "--system --home=/var/spool/mail -g mail cyrus"

 SYSTEMD_PACKAGES = "${PN}-bin"
diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index 2afaa4841..219d88f49 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -58,6 +58,7 @@ do_install:append () {
 }

 USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system nogroup"
 USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup radvd"

 pkg_postinst:${PN} () {
--
2.37.0


