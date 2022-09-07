Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0890ECAAD3
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2758.1662594071811253627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aHB6R/jF;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id y136so11211309pfb.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7Vhm9kNo6Mmud5mrZ14pVSdEa3WkpA+OJh8lmIr91us=;
        b=aHB6R/jFbdTzjLROqvY093JDjAtGSijj9UL65b0lpYcy1kWhkS5IJTcTAo1/dUBTO3
         eVqbPO1/YnltPov9GuYkRgepSw2pb15yvzySeudVBmg0FG6ZpakZ34ARRFjJYcEqdQQv
         +VlbIMvwTfeTXGhv8kTREc0Tp9T7XRMqrcvn9gqMVH1LOuy+UdjcEKygnGmJsSWKyMgF
         YkVP+nnESvmhFVBSJ0JMXWzBA7SwpCUbbaZ0ZBtHy42mzShjDrrWxsUjqTtjpKtVI+sv
         J0bhRBA+LzJeFBibEqtF9ZkN0s+qFRKDAMo0zTjrCIa4ZJ+Szacr6EszUBtRt59Ag8ld
         MuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7Vhm9kNo6Mmud5mrZ14pVSdEa3WkpA+OJh8lmIr91us=;
        b=Oy5MeCYlkmDAsG3aJXYE5spDFGk2mvtVwFRFcsAs48J9iU+Z1MtaM47cz4HX0DY0oU
         k7wm/wkzn8EAXQ+FhXK4svSgXTf2l737aVDdv71vZh3wr/irNEUwVN2RezURa6ER7BrW
         d7i4/hLlhNPtIjZb8zeoncvxncQ0q9Cfzrs0enKU6+O+AKr8t6ZMh9DsPSsmJ0eyweWk
         PQIau6WkjJtKK6rUKwLmZF+6R72lhTxz2JuZAPYwRFPKZZdxIj8KDxgGXNASj19kPvvJ
         CXvmHNJKm+6glFLOCKQcOcOJPT6ZUydUqOKleduX3uwBS5d3SQziaSx2XHiYswjuWOsa
         Zg1g==
X-Gm-Message-State: ACgBeo1DS2JZ+svHB+64HIsbEAI51c5A3hZ31CzJsOsezqaiRGsJBqKg
	yfy0MRU7mGNR1liIdR3jvHBCpS3TqeV3Tw==
X-Google-Smtp-Source: 
 AA6agR4la3f952caF/LG7Tk29AqQeJo4qtID3fFB593hUBWLGVN3hmr8XkB+5X7yNKkonuFDYmIKmA==
X-Received: by 2002:a62:3347:0:b0:53d:f935:9f01 with SMTP id
 z68-20020a623347000000b0053df9359f01mr6421453pfz.8.1662594074211;
        Wed, 07 Sep 2022 16:41:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/22] passwdqc: Upgrade to 2.0.2
Date: Wed,  7 Sep 2022 16:40:52 -0700
Message-Id: <20220907234102.3312797-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98702

License-Update: install-dependencies.sh and run-build-and-tests.sh are
mentioned under GPL-2.0 but they are not included in release tarball

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../passwdqc/passwdqc/makefile-add-ldflags.patch | 16 +++++++---------
 .../{passwdqc_1.3.1.bb => passwdqc_2.0.2.bb}     |  5 ++---
 2 files changed, 9 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-security/passwdqc/{passwdqc_1.3.1.bb => passwdqc_2.0.2.bb} (91%)

diff --git a/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.patch b/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.patch
index e9023492e0..6e4803f4f3 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.patch
+++ b/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.patch
@@ -4,19 +4,17 @@ Upstream-Status: Pending
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 
-diff --git a/Makefile b/Makefile
-index 49d622d..cd17334 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -48,18 +48,17 @@ CFLAGS = -Wall -W -O2
- CFLAGS_lib = $(CFLAGS) -fPIC
- CFLAGS_bin = $(CFLAGS) -fomit-frame-pointer
+@@ -68,18 +68,17 @@ XGETTEXT = xgettext
+ XGETTEXT_OPTS = --keyword=_ --keyword=P2_:1,1 --keyword=P3_:1,2 --language=C --add-comments
+ MSGMERGE = msgmerge
  
 -LDFLAGS =
- LDFLAGS_shared = --shared
- LDFLAGS_shared_LINUX = --shared
- LDFLAGS_shared_SUN = -G
- LDFLAGS_shared_HP = -b
+ LDFLAGS_shared = $(LDFLAGS) --shared
+ LDFLAGS_shared_LINUX = $(LDFLAGS) --shared
+ LDFLAGS_shared_SUN = $(LDFLAGS) -G
+ LDFLAGS_shared_HP = $(LDFLAGS) -b
  LDFLAGS_lib = $(LDFLAGS_shared)
 -LDFLAGS_lib_LINUX = $(LDFLAGS_shared_LINUX) \
 +LDFLAGS_lib_LINUX = $(LDFLAGS) $(LDFLAGS_shared_LINUX) \
diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb
similarity index 91%
rename from meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
rename to meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb
index b148fdcb59..de4bff8c79 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
+++ b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb
@@ -25,13 +25,12 @@ inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
 LICENSE = "BSD-1-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1b4af6f3d4ee079a38107366e93b334d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ac99c8678577a1c2f9f04cccee411d5d"
 
 SRC_URI = "http://www.openwall.com/${BPN}/${BP}.tar.gz \
            file://makefile-add-ldflags.patch \
           "
-SRC_URI[md5sum] = "3878b57bcd3fdbcf3d4b362dbc6228b9"
-SRC_URI[sha256sum] = "d1fedeaf759e8a0f32d28b5811ef11b5a5365154849190f4b7fab670a70ffb14"
+SRC_URI[sha256sum] = "ff1f505764c020f6a4484b1e0cc4fdbf2e3f71b522926d90b4709104ca0604ab"
 
 # explicitly define LINUX_PAM in case DISTRO_FEATURES no pam
 # this package's pam_passwdqc.so needs pam
-- 
2.37.3


