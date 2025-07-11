Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52CEC83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 19:45:40 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.22578.1752263134104862672
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 12:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iT5WvmiJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e77831d68so26222847b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 12:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752263133; x=1752867933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gd3JhXi1PoJbgRlz3mK0GFunimMJBehZ7HbRhLcSF5k=;
        b=iT5WvmiJBvkFdB64o+LTupeRI8nlKpw2V5RRUL/dyMVz1TaHYhy/kvgdLvT4AknU9y
         iJ+4aHyIFcRG1+NgVBbDfTyhLQTCRaIT6OIB0+8uSoa9c0UzPXP3KJInSG7/UYRGblzN
         H4Q+ktFoYoLOUfUJM4iuPKCp9YRgphdl+tM2i5tDMUUZpU5GFaNY1B8dDPR2MhpI1O6b
         0Pc+GK9Z+bOk3UAvtJfniaPiABU6JcM3Aaja0igo9VzgBWIBJSteEomXWwHLXlTIkMOt
         FJ57WDnboMFrO/YQtkE95VrYKiM3imUO+Ls3+DJR1llu8qv2C5kbiGLjD64BeEyU+mIm
         Et+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263133; x=1752867933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gd3JhXi1PoJbgRlz3mK0GFunimMJBehZ7HbRhLcSF5k=;
        b=or9QzGKpxXuqxTqMOMq3TfCQe9660uZ+to6ucBUED8SadwRzmENhvg2jy/IYx9m6NH
         AOu/FNXX8yPN0atQt2HwZV2B+oxQ65aaWqlXyzfZoTBdPQXZVVRtbYHDGV1HfZG3oXqM
         cEbc973ISWVYqaip11Eu9I+XOCS3hm2Dg9nKw8c+zDBJfp2cbySL/7kzzYWkDmmDXS4w
         4PjUnkub7mSVc+pMNs8kEcmG46pHsppvQkGZiJ9uhJ4hpxCc+Qi4gT85g5EtsG1EW8Fs
         B5jiW8Xd2U4PDlc/UNbYdJXKbb6QK9b9/8Tv+ejil7Yz2xBxoeUX4h/rnskVQ2OZF/e8
         IGyw==
X-Gm-Message-State: AOJu0YzrgXG2EUeoBT/8O41Trt1hzKUhz1z8PuFL74Fj5vUXNsdOr+jT
	dNgB8Q6go2Omy3uaDRiehc8FvLe4XqSfnm9Bc4SN+TCH5oo2EuvCQpfgV+CLyuo1
X-Gm-Gg: ASbGncsVlmQN8fhVCigutFBQexgN3KIR3jNAUPZxQBToU1zCU8bP45/9+hNT5IWg13K
	pV5+MRacGS6wkjo6XM/OoHChfmOanYFhsvrpuibETT/sWVms4WQGw5dyDMM/E7gvv+/+8AMfFcc
	urcnPhk63e0Y8joaQvRJsAbaD4XtGN9612yX1eFUkoKpxZlfcL8jV+WoO+9Eb0WQesVZ5MW9Hqf
	xwiUuSL9AInDQiIRuYdQCBHl7gwlUW22n4BpntHbt5AuYUR+Ovhsuz8iN/t8mgu0lUl4GPZNLm2
	YxQRuFVKbDb4VEH6Aj4uf871S5ljp8+bLpP8JwRcI7bStcVhaR5v1ALuPIPGcZ822yAZe2Gnex/
	Vx6yGEMI5sLpY6rRXTmSDJiXOIFnZVl4oyqO8qPXFGlBCuySMiWjx3f5Y
X-Google-Smtp-Source: AGHT+IENeqxQsaBazcZ0IG4UaL92MxNDm3/pwNm956ETlVK9zJEqyN0InXTTK5/POB8/t49FeDCGXw==
X-Received: by 2002:a05:690c:f0a:b0:702:52af:7168 with SMTP id 00721157ae682-717d5b7c789mr86872757b3.2.1752263132425;
        Fri, 11 Jul 2025 12:45:32 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c5d4f877sm8983637b3.5.2025.07.11.12.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:45:31 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libhtml-parser-perl: upgrade 3.72 -> 3.73
Date: Fri, 11 Jul 2025 15:45:17 -0400
Message-ID: <20250711194517.679047-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 19:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118459

Change history for HTML-Parser

2020-08-24    3.73

  * Added a .mailmap file to organize contributions accurately.
  * Ensure all versions are equal and on the current version
  * Add the .mailmap to the MANIFEST
  * Change the META information to point to the new GH repository
  * Add a .perltidyrc to use going forward
  * Add hctype.h and pfunc.h to the dist as static files and stop asking
    for them to be built on the user's end.
  * Remove t/pod.t from userland testing
  * Remove t/pod-coverage.t from userland testing
  * Clean up the MANIFEST
  * Start testing via GitHub Actions/Workflows
  * Protect active parser from being freed (PR 13, RT #115034)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...html-parser-perl_3.72.bb => libhtml-parser-perl_3.73.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libhtml/{libhtml-parser-perl_3.72.bb => libhtml-parser-perl_3.73.bb} (79%)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.73.bb
similarity index 79%
rename from meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
rename to meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.73.bb
index bd6129e4f2..a03ec31e29 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.73.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "This package contains the Parser.pm module with friends."
-HOMEPAGE = "https://metacpan.org/release/GAAS/HTML-Parser-3.72"
+HOMEPAGE = "https://metacpan.org/release/CAPOEIRAB/HTML-Parser-3.73"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://README;md5=b0459e4426b94753b9a9b8a15f1223b8"
 
 DEPENDS += "perl"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/C/CA/CAPOEIRAB/HTML-Parser-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b"
+SRC_URI[sha256sum] = "85f05d944e166b8c5913db54779802eb38f4bbefb89a1730401ef06eb9ad8e69"
 
 S = "${UNPACKDIR}/HTML-Parser-${PV}"
 
-- 
2.43.0


