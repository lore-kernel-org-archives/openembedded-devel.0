Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A91C5DF75
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:07 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24347.1786747557282808666
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OjmXSDgw;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so1588454b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747556; x=1787352356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rm7lC1h02rM1XfCzD6HanD+DF/hUDKlExF8rnbCB0T8=;
        b=OjmXSDgwWVKqWajjQxKKVJVGlMDNggZvDKSwfgzLiObXa00T/QNPaTJ/ok9QE1ETx5
         EcLngByayivRt8h88cdSDjoz+abkHolhNTg5FuhxW/2LgagcqCk9zsCpnhmm7odsVCdx
         9TKg/N4J9YTQZVukS/pNKJKqrxc+N/QgY82EDpJtb5EOS8eLwXbuJn9cxJXHxr426fhr
         AlkCet3FSnfZr7qu4zVYjxPo8JFJa5vxxUjJJ0CQ67DDY2sOCo0fcF6QAY7qy8DhW2fC
         ZVh3pmDWM3951FqO1HrEKGP7e2Ei28xGtHcEalA/9C6ATou3Z9efqBW/8Ln1QiWQ+hkj
         Pb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747556; x=1787352356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rm7lC1h02rM1XfCzD6HanD+DF/hUDKlExF8rnbCB0T8=;
        b=jNK2V4yLrmZIBSu28YcG/WFGP4mRoV3bnANruvezSfTKGb5KnBEZkfKwnVvULHhzfK
         MFl8pjAiG5g5AUbozQEuHEchsgGjAW52mx7aDcBmcYj9dXBQUD2IQOK0Etx3qmVWyrQx
         V9dQAZ9UDKnN7BpBCZ4NWgZGLJzxJhHT4cHNq8DA3vYgzt2Nnnm7D2vHmC3hp7nTzslk
         loUgvVXoVuFF39hTgzdY/Aaq0zanaokL2VtairU3e98V68R4cKIIOuQJL5aWV+jD+xaR
         QQV37hapIAYBAmwat2zuApESS1tUHw4Xz8FgLE/NYHU9bTAWhOIcXwYuMfZG9dVLPdau
         5KOQ==
X-Gm-Message-State: AOJu0Yxa8Kr0cpzv+ZBDd0EN+5pcJZ7HkTPGjysLjmmUJ2ekiGTVxXsa
	gxquhQh50hOH+Mq12rq1/o7srqIiLzSBz7hZzffLt1wmSLZdg6He/8C7GKw5d7Fc
X-Gm-Gg: AR+sD13Mi3y0IB/z5kP5enyMiku4niwE5he214ij7CVJkUUZPMb36cM5YpLn96Sm2qA
	u9lrQUTigQx5pOH7q/a2J+7W/GLg7faXrFDQ/+cNyRsjN2FUG3Pmj9riu3CsGWedHA6E2USfjDk
	LWD7/3qTwXnDLmE3ek6tMQgTxqDwlXIm9Mo3sQHR2X9Kw8dRJ1TFRcX5eeIinCK8EvCb3oFVsm9
	26n3a4/lFPbH10zgBiwumuVU8DXgRKt/lqc7b2YZ0PJ0+uw0wO0ZYk/wNuv6JEFGa56vLMr37C2
	yaOH8fmHmKWr70rsZxadaJWM0yLsY7u0D7xIeF3hsDo/AHodWCBvBlaRS5/5DWrKibIXPb5s8xE
	yoDwykwHxtC2xm3G80wOVG97ysPVOniGft+wr50/Z+xHeGPLikrUl0L59HugIwXffUCXzFbiFUz
	wt5cFtubVlFIGsMvKr+P9FKHYTcOzi7+Sawxd6Q6Qwk1ibAdLxm/fkTSTtBc8K4lGGanQiRfsyD
	3XRJ+rMR+sTdjoDeHh+2BRRN7ukKfLT0JOV3WCvXAVogAFRAUylK8wN1lhwX5YfA6xvrdunY8o/
	KeHQzs689rZPfSZUbMRsGfFZO/pkQBIeNAED0mtzQeWMgAX97d0kFE17mrf2yaXsyxx5RvZmiZl
	eZINpLlKc3s0EodSbOarH2uUAB8LlQQX2t0SoIEGrDUOjNeXI9KB2l9L4
X-Received: by 2002:a05:6a21:4d02:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3cc71b36d51mr11196945637.13.1786747556405;
        Fri, 14 Aug 2026 15:45:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 012/109] atkmm-2.36: upgrade 2.36.3 -> 2.36.4
Date: Fri, 14 Aug 2026 15:43:58 -0700
Message-ID: <20260814224539.1523174-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129076

Upstream released 2.36.4 on 2026-05-26 as a maintenance release on the
2.36 (atk-2.36/atkmm-2.36 ABI) series.  It is documentation and
build-system work only: gnome.org/gtkmm.org doc links are refreshed, the
obsolete FSF postal address is dropped from the license texts,
codegen/extradefs is relabelled GPL-2.0 to match COPYING.tools, meson >=
0.60.0 and python3 >= 3.7 are now required, subprojects/atk.wrap is
repointed at at-spi2-core (GNOME/atk moved there), the Python
installation Meson itself uses is now reused, 'dot' is no longer
required to build the documentation, and the Visual Studio/NMake build
files are updated.  No API or ABI change.  LIC_FILES_CHKSUM is updated
for the FSF-address rewrite in COPYING and COPYING.tools; the license
terms (LGPL-2.1 / GPL-2.0) are unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../atk/{atkmm-2.36_2.36.3.bb => atkmm-2.36_2.36.4.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-gnome/atk/{atkmm-2.36_2.36.3.bb => atkmm-2.36_2.36.4.bb} (60%)

diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.4.bb
similarity index 60%
rename from meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
rename to meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.4.bb
index 9747de6f29..0d5bb44d41 100644
--- a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.4.bb
@@ -2,8 +2,8 @@ SUMMARY = "C++ bindings for the atk"
 SECTION = "libs"
 
 LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+                    file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "atk glibmm-2.68"
 
@@ -13,7 +13,7 @@ inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "6ec264eaa0c4de0adb7202c600170bde9a7fbe4d466bfbe940eaf7faaa6c5974"
+SRC_URI[archive.sha256sum] = "19cd0758ed752cb89f5bf02247663dfad0926d9351984a20e3c6cf7da62552ac"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 

