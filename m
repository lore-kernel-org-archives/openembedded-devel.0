Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274CEC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 22:31:56 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.8303.1743719511865093903
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 15:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k57irsL/;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ff1e375a47so15331147b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 15:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743719511; x=1744324311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZDC8Pon5hVqwYpb4/PVgnEthnXmaIE2FsKmV/9sY1E=;
        b=k57irsL/5DSOTLxTX4H0TGMIu3PB65mqUaQTGuL84nSVnu/X227yloL8whEMZsSzs0
         onMRz1r4cQeGKxFqiw8EiiDko7ajNn01lJ2VWJ8GFLhro1gI0i9SiDAqAETFvCZMDFX6
         oF9t55v7cq6VdsmfUjSLZrEaPgpOAxki7m7IP63lk3/Q8sb8nVQuIp3vNtPBMfbxjq7j
         gJJ9Ek90xbgVe05x0AxwIe5ZWuPWe5z00osB8Ns7BjEYkpnBhSbKhx5j0NNXJ1YfrNhn
         tXpv6SjSDkohkqw7pJbOrwMdepJuiHksn/lp67+PZNTzKPULlFwmNuwb9zJJRgSM1gcn
         00Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743719511; x=1744324311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZDC8Pon5hVqwYpb4/PVgnEthnXmaIE2FsKmV/9sY1E=;
        b=A9GWNK3DNa1ybHQVl5lLffzeQCi+nlW/fdROBefLiSfAypXN3gyZV678oxLi5Ko+nF
         KOeKKPSpd47uljJ1fpwULcKZfevhtW8LynvzdxG6GYXzBWpILtvXX0aQVo2RhOTGyFaa
         ClIAYNGFoQuIQaWJ6hoenuEZNnsk2ozhmAhb7bVN6aC5eoGdRYEYw2JYBJ7asSEbltnR
         krCJnYLc7JV3gJ0J7KESvcr5S2L+oLMtUmlRBm05d8xi3h815l7gIzg9eHVUhxsx1d7f
         UklI6j9JjNFTl2S8Q2y0/LtYP4sEQSl3vSftRc0zQftyWtHLv/ArxAxa7MwIawy6/AOZ
         4uKg==
X-Gm-Message-State: AOJu0YxmY1+uUBiGFrWjFQLstOkfAPTozUl1o6kE702WuysDgoAOvgp5
	duwvQznAC+0GZYt2HWRiXpV0zYq9n6Z1T33wQamX2TK4yg4hYX19lHBfD79F
X-Gm-Gg: ASbGncs0kzfewpVJ8HnmFoAp+C+sd+K1UTjg8wPUOABCuWBIVXODHB+qMgIj7nKAngg
	x8LbM9/DNXhfxEao1IJNmpqSK3XDznlezm+VsM2dad+/fAhtzPAwznjb92Ms3wIAfEN9BnmF3uK
	x6H3FfU3PPQhoOrRx2qFyw/HpMrKKv6J7fKBgPEUrQZkVOOC7kWc8mj2l2kAOmV+iC+QAowal6p
	RWwv10zXPxeEmfRxWm1tPgwTYTYjG0EGkzxV8BSq939FW+BaawC56CuV1QISVjerkUTNyWQ0HMK
	d71o3wQwO6qvLMmHnzle9wSgDiZkoMgyy1615UvdhlIRnKPb4g==
X-Google-Smtp-Source: AGHT+IGXopAzm1dgfOh3qq1+9TVsGRYjbHSMCW4v9P/MqYJE+2iVE63ElD30tgd6AiWOWW+Pl+mlMQ==
X-Received: by 2002:a05:690c:6286:b0:6ef:6d61:c254 with SMTP id 00721157ae682-703e16472c4mr22003677b3.38.1743719510335;
        Thu, 03 Apr 2025 15:31:50 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-703d1e4c979sm5840597b3.26.2025.04.03.15.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 15:31:50 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] Fix warning : lack of whitespace around assignment
Date: Thu,  3 Apr 2025 18:31:38 -0400
Message-ID: <20250403223138.1578121-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 22:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116550

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 2 +-
 meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb | 2 +-
 meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index dbfe8d3d2a..c677e8ea59 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -19,6 +19,6 @@ do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
 
-BBCLASSEXTEND="native"
+BBCLASSEXTEND = "native"
 
 FILES:${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/Digest/SHA1/.debug/"
diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
index 7a6a9aadd8..a0dcacfaa4 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
@@ -16,4 +16,4 @@ inherit cpan
 
 SRC_URI[sha256sum] = "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643"
 
-BBCLASSEXTEND="native"
+BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
index 1981ae4a94..7487712a93 100644
--- a/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-uplevel-perl_0.2800.bb
@@ -7,7 +7,7 @@ THIS IS NOT THE SORT OF THING YOU WANT TO DO EVERYDAY \
 "
 
 SECTION = "libs"
-HOMEPAGE= "https://metacpan.org/release/Sub-Uplevel"
+HOMEPAGE = "https://metacpan.org/release/Sub-Uplevel"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f1207cd3108e4ade18448d81e6bcb6c"
-- 
2.43.0


