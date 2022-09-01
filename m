Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1596ECAAD5
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 17:55:08 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.15653.1662054902350350717
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 10:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DEI+dNKA;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id q3so14634578pjg.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 10:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DSqMedMQi2z3Wva/C8Dts5YAs++VQrEALcJoZ6f52lc=;
        b=DEI+dNKAsYRZlKDqtfm6xIMzwdeZp5I4+QTm3lvwOxQXLaWoEK/h9ti8kccy4RFqQD
         jPC5ohvANT7R5cyhLyztvvZyEjwIReSnI/OD4Gy3AVrHlTJD8wQ5tJ7IHQCbMXIGCNAp
         wTe0aTFKd120LjnI0wtn9X6/+a4PSLXaddFRmcGAMxp0hMNlxef+7unXE/TLZDnvoMpj
         qV1fPLsdclGWVDDyGaLyGSVyp0Td3/YW/cwTuueapIvrQadH3UnCWLnbgBwIQEVcoN6d
         go7q1pmB1gJn2j8BZXqib2LDwupJ78yl/KkB4w7/8426WR9WGrH6aeTz38Y0ZQaCmrhl
         PN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DSqMedMQi2z3Wva/C8Dts5YAs++VQrEALcJoZ6f52lc=;
        b=dczvT3MwxFOZaoIN34ZfnYMlS7RIZ4llFnyVOoX7G4OH3vHEB369gp7HTPC8YDwtv/
         43jDa+rvJEuEI3d3Gst2OUjnwe5sWPvWCyJbHUarny//2iTAFVuepmfWTlwpVCNQkAvJ
         pAmjaCFFk9u2HxUSJ7H9alyjAi3ItKENDbDB+CX5oSlxF91Le8fBFTW+/0K9nmffvwtO
         AUN8OW9eNG2YcBpXff57enAcVGR7LMeiXrYVTC5K9/QZk/ulH4GqY4B6fXz6cBre4O64
         cguOs1HGT3QmsYYPXknw2ujYfcapOc6bkqk8xE/XyUosPUImLml/RWidr4EPYImBnmi3
         MxWQ==
X-Gm-Message-State: ACgBeo3ElRkMPUNmOUNF6d2Yg+8R88+hfvdCbRxWXsEfPKCzv78tq53i
	vPG97RYdL4/fIzBCOofrOecp0To5gmSj9A==
X-Google-Smtp-Source: 
 AA6agR6xscjY1fBreSiIm0YPYdcfV+C+YH51IpDhSK32ILYBawUQXpM0c7nt52lavQ4mKCmZl/uQjA==
X-Received: by 2002:a17:902:be16:b0:170:8ebf:204c with SMTP id
 r22-20020a170902be1600b001708ebf204cmr33016486pls.47.1662054901413;
        Thu, 01 Sep 2022 10:55:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 n5-20020a622705000000b00537eb0084f9sm11592623pfn.83.2022.09.01.10.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 10:55:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] frr: Fix configure check for libreadline
Date: Thu,  1 Sep 2022 10:54:58 -0700
Message-Id: <20220901175458.158577-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901175458.158577-1-raj.khem@gmail.com>
References: <20220901175458.158577-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Sep 2022 17:55:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98586

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...for-readline-function-instead-of-mai.patch | 30 +++++++++++++++++++
 .../recipes-protocols/frr/frr_8.2.2.bb        |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch b/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
new file mode 100644
index 0000000000..4b218a61e8
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/0001-configure-Check-for-readline-function-instead-of-mai.patch
@@ -0,0 +1,30 @@
+From 9399d58c13257849179d3c2b3698a2b43bc1b2a0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 10:39:23 -0700
+Subject: [PATCH] configure: Check for readline() function instead of main
+
+main is not a function found in libreadline, its better to check for a
+function thats provided by it.
+
+Upstream-Status: Submitted [https://github.com/FRRouting/frr/pull/11893]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b7e17d356..8c1fab0ea 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1372,7 +1372,7 @@ case "${enable_vtysh}" in
+   AC_DEFINE([VTYSH], [1], [VTY shell])
+ 
+   prev_libs="$LIBS"
+-  AC_CHECK_LIB([readline], [main], [
++  AC_CHECK_LIB([readline], [readline], [
+     LIBREADLINE="-lreadline"
+   ], [
+     dnl readline failed - it might be incorrectly linked and missing its
+-- 
+2.37.3
+
diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index f0d0dbf7cf..607ed8b9dd 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-LGPLv2.1;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
+           file://0001-configure-Check-for-readline-function-instead-of-mai.patch \
            file://frr.pam \
 	      "
 
-- 
2.37.3


