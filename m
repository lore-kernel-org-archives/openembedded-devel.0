Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6D2C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 03:22:32 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.22504.1646623351372957801
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 19:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lvFmLWkt;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id g1so12592360pfv.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 19:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YUpyeIkFxAHVwIjQSWZOBBQcc7s1dMDuTYz18ilpHzQ=;
        b=lvFmLWkt4NLIgPkphSFGBF/L5VoBeWQYSlbY6fEHW+BR/Nc7N1/LD6wezkahwxicyV
         jkm4JP2UGPyPusnWpsxeAI1kra35uTpQmlXmNMhCzfodP12/Zy5RJrUXEOXKr9cvV5PL
         CF41JJTS1H42CkCf3SAwAcwcC7R62tsTqN/bXGRDOH6YRftmigJfJel4M5I8KAs9bllr
         58ycidRFS7TOlSu6daPeYmfy4fa8NslQBLDnior6x7BJOMFlYnclsHpIa/x4bjGVkioC
         cBmZwJt0eeGLMINcBIzqwzPPFuU2obUAFG9CxfzaVQCRMKU6dj22HmWzWD3HmDA93ZxR
         xwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YUpyeIkFxAHVwIjQSWZOBBQcc7s1dMDuTYz18ilpHzQ=;
        b=VCq7WtzYrgmSDNDTsoHiJv5dGs5fZ7LlTenO+qsUd71+BkreBVMXo+ejNQ+kt78hMe
         KoJwKS7ITEeuQuSMyUulTO/leIzPpUQOlgme125KtoOyC7hEGW70gBrzWiyyerVtm6Kd
         XouMaGyBrf7i2ueM/46rhRsuzYck0+jUdiLgyVBhv0K667OgCb2zgjmk3YZZEKKcESxE
         VeyIdhL65aSQtMSed4FRgdeBfMLmyAWe+OLbdWX+Z7hVcP3sDxjkqkm2IOeOgvnNhq+7
         bRdnVLVAumvfPuHb/wrN1/hZ6kEVtj/bdY9JNZZrzJIXq9UX43hb1JcEWJd3rNtHvM8Q
         H4eQ==
X-Gm-Message-State: AOAM530Bo043QSTpdsqq+Qg8GAS+Ycd6Ibjzd2vDNaWVkrS/v+svnTBF
	hsaP3IzCL4iWdBQhqJedJnScIa/14zAxEQ==
X-Google-Smtp-Source: 
 ABdhPJy25GUFOC3VE60VGjlciceNYacpD1nWmgYBtS9XKKUzn8YaG8vXE0UWDmd/obI7Dt89654PnA==
X-Received: by 2002:a63:9d8c:0:b0:378:4b73:5b3b with SMTP id
 i134-20020a639d8c000000b003784b735b3bmr8031285pgd.564.1646623350614;
        Sun, 06 Mar 2022 19:22:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm13509606pfh.46.2022.03.06.19.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 19:22:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH v2 1/3] tepl: Check for x11 in distro features
Date: Sun,  6 Mar 2022 19:22:26 -0800
Message-Id: <20220307032228.3555244-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 03:22:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95828

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add to REQUIRED_DISTRO_FEATURES instead of assigning

 meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
index 0ac7e3693d..61e82e2856 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
@@ -15,10 +15,13 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gettext features_check
 
+# for gtksourceview4
+REQUIRED_DISTRO_FEATURES += "x11"
+
 SRC_URI[archive.sha256sum] = "a86397a895dca9c0de7a5ccb063bda8f7ef691cccb950ce2cfdee367903e7a63"
 
 # gobject-introspection is mandatory and cannot be configured
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.35.1


