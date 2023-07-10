Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3D1EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 05:53:18 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.33735.1688968392494716590
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jul 2023 22:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=j/mfm3i/;
 spf=pass (domain: mvista.com, ip: 209.85.210.44, mailfrom: hprajapati@mvista.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6b91ad1f9c1so1856977a34.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Jul 2023 22:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688968391; x=1691560391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQlExgSpKMkugIkBwGuFxE0avmIroHEF2dU4FJ7UU5M=;
        b=j/mfm3i/k+GFQ6VcEFKgDV6dzIPtWtqGNC1LlSIMbd1A/M/IfWPtNScMgeaIbEbSn6
         z+n3RebDuw2ZOOW2azIaZwhxZt40bCO/Gwinc7ewXvVXdhXMK8BurTCX9HTdsKytfQ9c
         WlxBaG+cTfUVek86Ra2w8Oy+Ta5tUmN+LNpbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688968391; x=1691560391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQlExgSpKMkugIkBwGuFxE0avmIroHEF2dU4FJ7UU5M=;
        b=dKB8Gt7FM9OniZ73+riryRd/uz1r3Z/vxoQtCXf3sgxlj73/nVcwJsWLfIfeklbxXf
         swtw1EWCTudE7sBrmlikr5qsvikFrh5ee4iimS8yhejYHSZVzS9Ht3CNI0hrGENjiHzF
         0ObGKECIiopC/W6S8CqYIEcddwEId6zVZYuBi3NtTmP7g0CfhGld+L81VUnYo99K/zTs
         1v5zilJIJNGAu/IbcMOiZcfe8AbMh+nfXJ7b34gnxlIQrOSSCvNqBz6Xxbe/SrO+utjs
         548OvXXzxuQlXzjkhT7FDdMMGP9aXUANUJ6miX59Ze4FP9GCsyIIxJvneyXBQUn8aA2t
         hNrQ==
X-Gm-Message-State: ABy/qLbZ5qGsmW6zlnCtsgEue/taj24r4AfLWfZnV9wYyfSEw1RI9CDz
	HMoLFAK6nZ7fZbnnDzbwbKEAPkPSKJESuNoV7vYfdw==
X-Google-Smtp-Source: APBJJlFPkERrUpK6xeHCBvJzxQfj90IgEplSw7I6RfVrE3nk6O5eKwOOMCo4Nc6YfRfq+C+moje/kg==
X-Received: by 2002:a05:6358:7f14:b0:134:e458:688d with SMTP id p20-20020a0563587f1400b00134e458688dmr10323337rwn.15.1688968391447;
        Sun, 09 Jul 2023 22:53:11 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.194])
        by smtp.gmail.com with ESMTPSA id d1-20020aa78e41000000b006749c22d079sm6265540pfr.167.2023.07.09.22.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 22:53:11 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 10 Jul 2023 11:23:06 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][dunfell][PATCH] openldap: fix CVE-2021-27212 Assertion failure in slapd
Date: Mon, 10 Jul 2023 11:23:02 +0530
Message-Id: <20230710055302.42360-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 05:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103721

Upstream-Status: Backport from https://git.openldap.org/openldap/openldap/-/commit/9badb73425a67768c09bcaed1a9c26c684af6c30

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../openldap/openldap/CVE-2021-27212.patch    | 31 +++++++++++++++++++
 .../openldap/openldap_2.4.57.bb               |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2021-27212.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2021-27212.patch b/meta-oe/recipes-support/openldap/openldap/CVE-2021-27212.patch
new file mode 100644
index 0000000000..c6bac80061
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/CVE-2021-27212.patch
@@ -0,0 +1,31 @@
+From 9badb73425a67768c09bcaed1a9c26c684af6c30 Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Sat, 6 Feb 2021 20:52:06 +0000
+Subject: [PATCH] ITS#9454 fix issuerAndThisUpdateCheck
+
+
+Signed-off-by: Howard Chu <hyc@openldap.org>
+
+Upstream-Status: Backport [https://git.openldap.org/openldap/openldap/-/commit/9badb73425a67768c09bcaed1a9c26c684af6c30]
+CVE: CVE-2021-27212
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ servers/slapd/schema_init.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/servers/slapd/schema_init.c b/servers/slapd/schema_init.c
+index 31be115..8b1e255 100644
+--- a/servers/slapd/schema_init.c
++++ b/servers/slapd/schema_init.c
+@@ -3900,6 +3900,8 @@ issuerAndThisUpdateCheck(
+ 					break;
+ 				}
+ 			}
++			if ( tu->bv_len < STRLENOF("YYYYmmddHHmmssZ") ) return LDAP_INVALID_SYNTAX;
++
+ 			x.bv_val += tu->bv_len + 1;
+ 			x.bv_len -= tu->bv_len + 1;
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
index 1e7e6b3d71..7c2ea7c452 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://CVE-2022-29155.patch \
     file://CVE-2023-2953-1.patch \
     file://CVE-2023-2953-2.patch \
+    file://CVE-2021-27212.patch \
 "
 SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
 SRC_URI[sha256sum] = "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
-- 
2.25.1


