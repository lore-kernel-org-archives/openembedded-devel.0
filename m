Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F89CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 18:03:40 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.2462.1759773819818709556
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 11:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EIjPspRW;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6398ff5fbd3so2984165a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 11:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759773818; x=1760378618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b2c86Hs2yN30kLymYtsvlyh0saUk1EbftskSJ7d8TRI=;
        b=EIjPspRWWdojMqpXddoA8G/JDoMI2VwCexZVX+MYPmz04dIQz/4uSueUJr+uz7jZGB
         6QC8Uuqe1fhOSCNhbuGblvPZUyRDqAbhGA+vxFdXJdatSXzgLXXkoHzGrE74WPAUmlW3
         bUJwKbDuxyNV9jrVQXbqwgpsMUPPaNtgFnGEZot1uGtkIeYc+6cQk2Y6h0GJZmm1mupP
         5/u+GO7Q/J2ln/85q+NlicuL/5qighFdqX324AdiM+prJdkvqI8xTpclpED/NgNgk7wy
         UuyAYuITSxHk01tUdUf+uHIqdr7pz1OYq2EXdfYdIOZSfjixsprg0mwvZLGV1G1jdjAj
         +o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759773818; x=1760378618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2c86Hs2yN30kLymYtsvlyh0saUk1EbftskSJ7d8TRI=;
        b=cvT8BB+90oCC4qmkfIMAJ0SnOhRIGzC6OG67Ip8dOfkyjxXLxxCM6ytLADv2CWBbDY
         Rkke2Eb3EDWqAy35m4XF58yOUhznnYA7BsEpgKwfMgHHFayMSRhV4fvCZietW7pbh8vf
         zkUYLoAO7PFSiEHfvqLqa5fQoj/Nqx9TgimgPlp6fx0aqS8jaP4PNfqh7CX/ToZUxtBd
         kd/o/br+qmAI6qS5Dx6Jz5BsIuP7sgbphGdVjUgiXxMRiiIlFhVjULIv/xFNuBwrT+LS
         FUeUj9PAVdcCY1wYGKbC8cCu5+djMHs4cpNwMDi8LVKWJY52KoerKlj2JkL/rZX/ggBt
         pbwQ==
X-Gm-Message-State: AOJu0YxsnlT145KSfPiv0eelBtC0SaDjPCZZgG4xZO562x17vzK2e5pR
	vNNHkrm1QG0ZQZwx6eZOXz7BsN6260X6FpNt6b4/yi2CC/XZqjmTV271MVEq6Q==
X-Gm-Gg: ASbGncutrFpB/9j9KeWIAl507gP1xbwGXzbmJJLKGMB500oY+lKbDEmgIiXN688CQyx
	9bSBjowcS3GJVhlNZUGBsuix9p8Xa/+XZEOTU1HYGlTkbNxAhjbvTd2sipHifDRUOW4rIOrdfsn
	cBi79s/XYOHCWgog59ybNXzIMWtvcum/jCmMtPZy4OffDFmDnGkP/56NUDtq0tsQDrYmpS2SKIl
	znMKHsdWJaYgvfx8w0HEno6vrNXFE2QosKTvCDniqk2aH300V9oWi85azyCUqwrgNjwLCkAR5pv
	OzRHGnZhKq1AcBCzwqDh9eOo20I+bohsoRDo6xsyD6dvtqzPNI+ojpRCx+PZZL6X+ySEUUa9G+s
	dL/1eellFi4pgXsLCGFDiGkxcEI0ONgivievg68BaBQluCvAJ6j8/cUU=
X-Google-Smtp-Source: AGHT+IENMpgho3CHIBY0zkbgG5rkCOoR22uqDehEBPux5ZOiylB6kBz8HTO6C5y3ciDnzn1Pvjv0aQ==
X-Received: by 2002:a05:6402:788:b0:636:7b44:f793 with SMTP id 4fb4d7f45d1cf-63939c42c3dmr10699442a12.36.1759773817897;
        Mon, 06 Oct 2025 11:03:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788110080sm10738342a12.34.2025.10.06.11.03.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 11:03:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jasper: upgrade 4.2.4 -> 4.2.8
Date: Mon,  6 Oct 2025 20:03:36 +0200
Message-ID: <20251006180336.4158312-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 18:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120307

The upgrade contains fixes for the following vulenrabilities:
CVE-2025-8835, CVE-2025-8836, CVE-2025-8837

Changelog:
4.2.8:
Fixed a bug in the JPC decoder that could cause bad memory accesses
if the debug level is set sufficiently high.

4.2.7:
Added some missing range checking on several coding parameters in the
JPC encoder.

4.2.6:
Added a check for a missing color component in the jas_image_chclrspc
function.

Fixed a minor build problem related to the use of -Wstrict-prototypes
with Clang.

4.2.5:
Made a change to a configuration header file in order to avoid
undesirable compiler warnings when JasPer is used in C++ code

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/{jasper_4.2.4.bb => jasper_4.2.8.bb}               | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_4.2.4.bb => jasper_4.2.8.bb} (81%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
similarity index 81%
rename from meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
rename to meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
index 4796a85190..dd3cf3fdb6 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
@@ -4,9 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "6a597613d8d84c500b5b83bf0eec06cd3707c23d19957f70354ac2394c9914e7"
-
-CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+SRC_URI[sha256sum] = "98058a94fbff57ec6e31dcaec37290589de0ba6f47c966f92654681a56c71fae"
 
 inherit cmake multilib_header
 

