Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24493ECAADF
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:12:04 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.34040.1661494314793338692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K6Wusr1l;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id p185so636182pfb.13
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DMbLyD6y47HEeNVo5VSSXohA5efGd0s1/OTahBV96YQ=;
        b=K6Wusr1lOYGAUYQ9aGIKQsCq/xELP6maPJr784ZIG5UMzR2egZ7pWVRrCMHWjBGXXW
         HNSBMAGqhXEffEN+6VO9prVrm5zk/H6xvu5GzoaB4iLhfyG9E7MqR51JnlJVoFCGmT+C
         bF1IWtG01rmWQ4Z1NbRqzfP0AjyjAotAy6gNywFZNy9jSwXu8waXM0Et4cjb1bkQ7eNI
         KpdfSzb/hoeZABsDiYsAjglPvReQqmRZ1wGGMQEwOrLsiQi8R3NkCnP7J/zmDnnYsBDg
         LJxAqsc736b0T9FQN1jAFXhhcIXYmjJ4kyoL869Hf8OEGiP2FXd0PSCOp0vd0FsoVqPA
         ZnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DMbLyD6y47HEeNVo5VSSXohA5efGd0s1/OTahBV96YQ=;
        b=RcTFh+U3iKGFk5te/T258uRzLMQhjYc3TSKA4xlj7mMaH07jruQcSV7GlQs1fyA1zZ
         Ckx/h3AkLLU1dnVSaz+ROBHW3FDKJaic9hfNQViQ5gz5bH4k+Cmc92CgqmExWnMs4GKb
         db4BheIohRgjLxJGKO2jba2X7rKatOkb3jN0n7OQb/x9GsJwmvP3rkZAdfyiafDnxM98
         eUhY8Xi6fRgPV2ogtJ9M0I9VFHja88Syya6TSb6sWBCr7GmujtSJI6cRWAQm/xfWW+Cg
         pv98DjwcvHPNabTGFSOnZWAmE5oC9Ff4fzCL9p+OdLk24GoEKDYW9ker0zsNxvhcTAJ9
         H4Ww==
X-Gm-Message-State: ACgBeo1Ol7X5e8Yc1lb8qoGkr80mmKbpJFoSg6/lAr3RYtTYDv9bY6o9
	046S3G0fXX7lnNW1SdIWSwwurAxTIdyrTg==
X-Google-Smtp-Source: 
 AA6agR7laVXI0cB2EgUicWhIdBMUdrG1WBxRerTQ/agwUEbPr9TYqnJWBxdclrnVvrc2n+cd5q069g==
X-Received: by 2002:a05:6a00:1a:b0:536:d522:dbf1 with SMTP id
 h26-20020a056a00001a00b00536d522dbf1mr2429310pfk.42.1661494313937;
        Thu, 25 Aug 2022 23:11:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q5-20020aa79605000000b00537a6b81bb7sm755903pfg.148.2022.08.25.23.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:11:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/9] ssmtp: Fix null pointer assignments
Date: Thu, 25 Aug 2022 23:11:43 -0700
Message-Id: <20220826061150.3030485-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826061150.3030485-1-raj.khem@gmail.com>
References: <20220826061150.3030485-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98465

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-null-pointer-assignment-to-char-po.patch | 51 +++++++++++++++++++
 .../recipes-support/ssmtp/ssmtp_2.64.bb       |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ssmtp/ssmtp/0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch

diff --git a/meta-networking/recipes-support/ssmtp/ssmtp/0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch b/meta-networking/recipes-support/ssmtp/ssmtp/0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch
new file mode 100644
index 0000000000..c7468fe17f
--- /dev/null
+++ b/meta-networking/recipes-support/ssmtp/ssmtp/0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch
@@ -0,0 +1,51 @@
+From 58cfb4f86b7fbf19eb643dfba87fdd890b3d4a4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 Aug 2022 19:27:31 -0700
+Subject: [PATCH] ssmtp: Correct the null pointer assignment to char pointers
+
+Fixes
+error: incompatible integer to pointer conversion initializing 'char *' with an expression of type 'char' [-Wint-conversion]
+| char *from = (char)NULL;                /* Use this as the From: address */
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ssmtp.c | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/ssmtp.c b/ssmtp.c
+index a74ba4e..0a719ac 100644
+--- a/ssmtp.c
++++ b/ssmtp.c
+@@ -55,21 +55,21 @@ bool_t use_oldauth = False;		/* use old AUTH LOGIN username style */
+ 
+ #define ARPADATE_LENGTH 32		/* Current date in RFC format */
+ char arpadate[ARPADATE_LENGTH];
+-char *auth_user = (char)NULL;
+-char *auth_pass = (char)NULL;
+-char *auth_method = (char)NULL;		/* Mechanism for SMTP authentication */
+-char *mail_domain = (char)NULL;
+-char *from = (char)NULL;		/* Use this as the From: address */
++char *auth_user = NULL;
++char *auth_pass = NULL;
++char *auth_method = NULL;		/* Mechanism for SMTP authentication */
++char *mail_domain = NULL;
++char *from = NULL;		/* Use this as the From: address */
+ char *hostname;
+ char *mailhost = "mailhub";
+-char *minus_f = (char)NULL;
+-char *minus_F = (char)NULL;
++char *minus_f = NULL;
++char *minus_F = NULL;
+ char *gecos;
+-char *prog = (char)NULL;
++char *prog = NULL;
+ char *root = NULL;
+ char *tls_cert = "/etc/ssl/certs/ssmtp.pem";	/* Default Certificate */
+-char *uad = (char)NULL;
+-char *config_file = (char)NULL;		/* alternate configuration file */
++char *uad = NULL;
++char *config_file = NULL;		/* alternate configuration file */
+ 
+ headers_t headers, *ht;
+ 
diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
index b0e921d423..05d2bb18ff 100644
--- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
+++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
@@ -7,7 +7,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
            file://ssmtp-bug584162-fix.patch \
            file://build-ouside_srcdir.patch \
            file://use-DESTDIR.patch \
-"
+           file://0001-ssmtp-Correct-the-null-pointer-assignment-to-char-po.patch \
+           "
 
 SRC_URI[md5sum] = "65b4e0df4934a6cd08c506cabcbe584f"
 SRC_URI[sha256sum] = "22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36"
-- 
2.37.2


