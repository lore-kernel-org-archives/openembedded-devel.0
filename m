Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DD9CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:57:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.28.1761328674400997670
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKMVgnac;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-475dae5d473so1357565e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328673; x=1761933473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcrFLkt1B/N9iXmBZmxQp5ux2YCHUoDDo8/YSsIYWRM=;
        b=IKMVgnac2ZecEDWKSFyYX3oLG3hRATmWF19sjRUwRf1SkleC5RFfhjkzUKV2XE9b24
         zs0QkZfv53Jmopr3+9hcg3s7KT6v4wJtWehY6KukGGSo0klb3jjbi/vkMS3AJ4o/+hJ5
         VbrEQc9MdTlQ5z/X2PqnlPDgAYu3IHJ7+yQQFLwhih0flI/UWScb2bRPUu2F6QkI0LB0
         DQ8yndR4g2tTQKgALNcW5d4Lv0WvmjpTFQVOtQ0udLMpFLU3CZxj8V+sBpXhNL/mmZ5J
         yyqIW31GI893bw1jmWGwvsiuPBb+nBPxFTiYOF4r4NlBOxGvoWziM023L1wj/5uVzqWq
         Ue7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328673; x=1761933473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcrFLkt1B/N9iXmBZmxQp5ux2YCHUoDDo8/YSsIYWRM=;
        b=EMbKcfUm+FsOQXkUF0jy+XK/+B6KH4cq3bX9fqjk9DoY8wj5RjGKi+tSmG2pgIGxD+
         YYh/fTCLy/1l2k40qHBFeYiz2nqaNnFWz+kx5drHHue7IaxhEBf7sj1a/BTPkFp/7kwA
         GsxP5v+k0B0Xuxylwkaq5mbmSgWEcFoF7kPSdtA75eMKwxychFJ12dcZLoPUr/L0HJ9z
         yrR19XIlzujBNVrxmD4MZKR5yfFtirqoJh1j+ShT3NlQ1na54/R695rO7SqITGqHdepj
         xNoR4qDbvy+s0/Agx2ilclBZTCfhEbExE1Xi6RHZInsyTNy6lv6yH5VQ+n5F4hDdesnn
         29qw==
X-Gm-Message-State: AOJu0YwLqFxpLe1VRtRQ2pUOb+ziDvxb3CHmeMueDagaTGtzey7DGiV0
	lY7WPS/vEDwOPBo0wyQk566Sl7qCeKZfO7dQpCIpoPRh7p4AynLCHW93zDbPIg==
X-Gm-Gg: ASbGncvCudwt+K6iQZQo0ON9sBmezV5F7cimU72CBOLWg5I+HtvvxJ32fiw3A/FuvHW
	Mdcy85dn7+/8OlSmbh+JLQ6+DlDjkX7kP0inta5Wfd+2Sxcj0YZBAWROSHORCH/Lan90gmzcBXw
	R3dzL2DYocvqKPN1g77Ti/n49UbRWY/MPBQhWFjW0j6mn9qAMRLsD0ws7WV/pAHHbA11Vzz6eNi
	uWW4PRmrPvfTpEDY6/bY23Q03Ep6jblSSYpuJCIhmmMNTRYrqGAVVnO0sE/nBiJNSNQsilGmKnl
	iBzjUccqmPMpGNGhRS9hdZtA+xDP7fvI+3rxfgcXM8lQj990Jyb+Y1zTK8qCfCZo0WiOgbAoQJ1
	x4EpedF4r+nKYSRKe3xMLZsQ3EHfhhTPbYoJ9Buna6icJe++rvMob9ZSoR6RNKnBIzUH+LoxVbA
	==
X-Google-Smtp-Source: AGHT+IEWh8Evk2bg5+AmeTe1QO3cM+lB8BZKEsWzKQCkY1e9wynWwhKhneAHM3vEt+9Lnp1AADsE2A==
X-Received: by 2002:a05:600c:6085:b0:471:133c:4b9a with SMTP id 5b1f17b1804b1-4711786c79emr248545965e9.6.1761328672582;
        Fri, 24 Oct 2025 10:57:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 06/11] libfile-slurper-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:42 +0200
Message-ID: <20251024175747.704498-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024175747.704498-1-skandigraun@gmail.com>
References: <20251024175747.704498-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120964

Add missing dependencies, and install lib/File in ptest folder, because it
is considered as test data, accessed by the tests.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc   | 2 +-
 .../recipes-perl/libfile/libfile-slurper-perl_0.014.bb    | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 751a22c708..e099910775 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -20,6 +20,7 @@ PTESTS_FAST_META_PERL = "\
     liberror-perl \
     libextutils-config-perl \
     libextutils-installpaths-perl \
+    libfile-slurper-perl \
     libhtml-tagset-perl \
     libmozilla-ca-perl \
     libnet-ldap-perl \
@@ -35,7 +36,6 @@ PTESTS_SLOW_META_PERL = "\
 
 PTESTS_PROBLEMS_META_PERL = "\
     libconfig-autoconf-perl \
-    libfile-slurper-perl \
     libhtml-parser-perl \
     libmime-types-perl \
     libmodule-build-tiny-perl \
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
index 03001de45e..7186d1a10f 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.014.bb
@@ -24,7 +24,15 @@ RDEPENDS:${PN} = " \
     perl-module-warnings \
 "
 
+do_install_ptest:append(){
+    install -d ${D}${PTEST_PATH}/lib
+    touch ${D}${PTEST_PATH}/lib/File
+}
+
 RDEPENDS:${PN}-ptest += "libtest-warnings-perl \
+    perl-module-encode-encoding \
+    perl-module-file-spec-functions \
+    perl-module-findbin \
     perl-module-test-more \
     "
 

