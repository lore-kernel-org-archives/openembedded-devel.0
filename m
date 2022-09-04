Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C87ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:14 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web12.11498.1662276905507846999
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I3+tIfxr;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id x19so5905415pfr.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nGS4+WHVqgEsZVBOyrc507pLzDlt30oN2vheF4/axqI=;
        b=I3+tIfxrR7z/s+xQCJju94qnVTJUOfUF630YWMza+6Ro2QoQS342fPrxP/hQLA9o4Y
         Q/VziEF9LHPelLUCq9vJXabanguUHyoEJvaExAMZVaImoK/4CLeaEtuiB2jbUAAA5dVk
         20pksaPoApwcg8WVt5V4WtvM8kT/mtJURBgX+BMXUVpjzTNrjv2HN9yc6JXEjlSf4bPs
         RMppXqgmnIWjjU216yxQNrWsS6aS+XOteGydxRelJh8GbO6uJEXrthvTs8neKcrdFNGV
         biL3FSjV5HkTfKLYx2U+SWKhiby/Dr56jqv1YpksvqotIc1GR83mAGwrzPlFBV6x1j9g
         Vc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nGS4+WHVqgEsZVBOyrc507pLzDlt30oN2vheF4/axqI=;
        b=S18dpcWM7DYq5wRrfcVP4Bk9bPqU+LlcyX+VTywpzkgPFw7QmURgP3wOt99a5pv9ot
         lq7+/9vGLJzj0miJJwfOpKMGywRtNFOonkDMZs5wNNsa4nAcuVsyIHkZu2T+jP5AOw1+
         NM4Wo/LiqkfT+GwAkBjCHlN/HHZ1KN8QbZghbWnaczwkYpDpMu6wyk7trq/3hm0Q6tid
         BA0a7WSgBdAZ3A5us/smfohAicxfJjnyLqHLUjWEipmlt6F7FoKi1fdJhGSoW+rlkNn+
         SLGkna2BBd3oIY/MEmo/1phWXxLJs1+Z2r1LzgztyVp5sm/SZhWfAkCmo+rO/wsDnx8V
         q/bQ==
X-Gm-Message-State: ACgBeo26+ni9yXBKUmveMoJbC1RfyjRrf8WXxX+bjupPnYqOt7dqByke
	Mm5I3BW9Q6bR8ayBHUYzc6O7D83JTffCSQ==
X-Google-Smtp-Source: 
 AA6agR5V0qfCZkztXwYfmLcg6Pa0Pj0NV0gCc51xojlXyoFRnkrTbBGTKzPdWrJ7RTk/BSNqCryDFw==
X-Received: by 2002:a05:6a00:2918:b0:535:ea9:791a with SMTP id
 cg24-20020a056a00291800b005350ea9791amr44564425pfb.54.1662276904633;
        Sun, 04 Sep 2022 00:35:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 43/63] directfb-examples: Fix pthread_t assignment
 type
Date: Sun,  4 Sep 2022 00:33:57 -0700
Message-Id: <20220904073417.3251865-43-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98637

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-typecast-to-pthread_t-in-assignment.patch | 39 +++++++++++++++++++
 .../directfb/directfb-examples_1.7.0.bb       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb-examples/0001-spacedream-Add-typecast-to-pthread_t-in-assignment.patch

diff --git a/meta-oe/recipes-graphics/directfb/directfb-examples/0001-spacedream-Add-typecast-to-pthread_t-in-assignment.patch b/meta-oe/recipes-graphics/directfb/directfb-examples/0001-spacedream-Add-typecast-to-pthread_t-in-assignment.patch
new file mode 100644
index 0000000000..f40b7f144d
--- /dev/null
+++ b/meta-oe/recipes-graphics/directfb/directfb-examples/0001-spacedream-Add-typecast-to-pthread_t-in-assignment.patch
@@ -0,0 +1,39 @@
+From 85a30903ea3ba4232379bbbcb54960307d5a2da0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 18:49:03 -0700
+Subject: [PATCH] spacedream: Add typecast to pthread_t in assignment
+
+render_loop_thread is of type pthread_t, therefore -1 which is int can
+not be assigned to it. Do the needed typecast conversion
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/spacedream/main.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/spacedream/main.c b/src/spacedream/main.c
+index 430800f..8e1887c 100644
+--- a/src/spacedream/main.c
++++ b/src/spacedream/main.c
+@@ -205,7 +205,7 @@ void unload_stars()
+ int main( int argc, char *argv[] )
+ {
+      int                   quit = 0;
+-     pthread_t             render_loop_thread = -1;
++     pthread_t             render_loop_thread = (pthread_t)-1;
+ 
+      IDirectFBSurface     *primary;
+      IDirectFBEventBuffer *buffer;
+@@ -344,7 +344,7 @@ int main( int argc, char *argv[] )
+      pthread_cancel( render_loop_thread );
+      pthread_mutex_unlock( &render_start );
+      pthread_join( render_loop_thread, NULL );
+-     render_loop_thread = -1;
++     render_loop_thread = (pthread_t)-1;
+ 
+ 
+      unload_stars();
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
index 7907c5c0da..398e339482 100644
--- a/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
+++ b/meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
@@ -9,6 +9,7 @@ LICENSE = "MIT"
 SRC_URI = " \
            http://downloads.yoctoproject.org/mirror/sources/DirectFB-examples-${PV}.tar.gz \
            file://configure.in-Fix-string-argument-syntax.patch \
+           file://0001-spacedream-Add-typecast-to-pthread_t-in-assignment.patch \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecf6fd2b19915afc4da56043926ca18f"
-- 
2.37.3


