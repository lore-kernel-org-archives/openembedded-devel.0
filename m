Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561D7D2A54D
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.32015.1729107321354877720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iiVgpYzB;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43115887867so1145485e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107320; x=1729712120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKwvYe39nBsv0ou8UQbvoOTMiew7wQ993evdtT8JLq4=;
        b=iiVgpYzBPlzDXDxwusnF20eaLODUxgFdfXXqXHOY3XwY8LwqBJxZYS5BISeZJ7RWq3
         7IQS3r3BPLF6VqEzaMnuSdrIZIzZGZhg51mqKIzdmIljZV5hjGAWaUcOlaacDQ3ydI1l
         X6zfpgYbXCKlnkZvxzkv8CHJRrwa6m9c5LB82D4m7vwaYoW7x/g6QJj/O7DYUe3W/DZ4
         CIv28F5rfJiDXs7tth1PxgDY5VD2NrE7VF6FC2ldnASwWXyGkR9VrPxdAwmHSqijaEMx
         txxYFxjA8zQD89biOLEZAGkpZIPMPBFW7dbB8mIxPTraiCLCtKcYd6vP15FnkpLLaNJo
         gJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107320; x=1729712120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKwvYe39nBsv0ou8UQbvoOTMiew7wQ993evdtT8JLq4=;
        b=Ki1UYeyS2Fr79nEodmHycl3PD8R3Mlt5VeU9TlSaaxKFFs7HGWKCMEtni4OWS1XsOR
         pcWfG46vxaoDEdPfl46361m37W9Alt7FBPYYxH5qMtQSdO6Gd/KYhK5Op8tZ9u//Wwjr
         r20QAnTfFxSyAYblJEvBA859ozGn8xBs9RJJFgHvBqxZ1eLRsE9gQBU8rKPtRpXfPqEc
         9h8QCzxVCgURAA/EB94yUvl1P5TtYBlP2wZu2Gk2SNCU4CCrxLVIZP/jSilPZoJZJBvK
         cySpA4I5ldI3BzIXJTewnCVgfThdxjy8KrMZwZtGvqvZazDNxQPyp/pPMlnE0QM10fNM
         d7Tg==
X-Gm-Message-State: AOJu0YzIWFRSs9GCO0xutbLsR/xpXSASdaimu3e/bf7PfBGz2RqDHBaQ
	1aIfEx1R53o3r4Vu9FLP0eqtPK2JV6pUXfoqpXeBpsY798qe58TCMZnONg==
X-Google-Smtp-Source: AGHT+IEuCgkQ38oxi2mhQ1LKFayVtC6r/EBv/M83zWetTk12yT/nEHunzw1NNN6KCjjOSkklLj/3aA==
X-Received: by 2002:a05:600c:3109:b0:431:3b80:6ca7 with SMTP id 5b1f17b1804b1-43158756ee3mr4705565e9.13.1729107319353;
        Wed, 16 Oct 2024 12:35:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/13] python3-grpcio-tools/channelz/reflection: update 1.62.2 -> 1.66.2
Date: Wed, 16 Oct 2024 21:35:05 +0200
Message-Id: <20241016193505.3459828-13-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112954

This addresses python 3.13 issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...o-channelz_1.62.2.bb => python3-grpcio-channelz_1.66.2.bb} | 3 ++-
 ...flection_1.62.2.bb => python3-grpcio-reflection_1.66.2.bb} | 3 ++-
 ...-grpcio-tools_1.62.2.bb => python3-grpcio-tools_1.66.2.bb} | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.62.2.bb => python3-grpcio-channelz_1.66.2.bb} (73%)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.62.2.bb => python3-grpcio-reflection_1.66.2.bb} (73%)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.62.2.bb => python3-grpcio-tools_1.66.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.66.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.62.2.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.66.2.bb
index ed5ede425..dce7737b2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.66.2.bb
@@ -8,8 +8,9 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62
 inherit pypi setuptools3
 
 DEPENDS += "python3-grpcio"
+PYPI_PACKAGE = "grpcio_channelz"
 
-SRC_URI[sha256sum] = "6e4ac2c43d76b245c5f66d98f523db08786b186128a655ee6f20a30a7e68e4f9"
+SRC_URI[sha256sum] = "4904c7837523436624895d9062694f290b7f33383b296a1ec7c497b6e4c7ed19"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.66.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.62.2.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.66.2.bb
index 478c5b33e..c89d69bbd 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.66.2.bb
@@ -8,8 +8,9 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62
 inherit pypi setuptools3
 
 DEPENDS += "python3-grpcio"
+PYPI_PACKAGE = "grpcio_reflection"
 
-SRC_URI[sha256sum] = "2dd44806d68d0006636529bda573012b19a42281478c2d051cdaaebb91e2516c"
+SRC_URI[sha256sum] = "add827e2deb56e96803c82ace1d4e77fa0c8ec3747d6398e9951f739d71067d4"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.66.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.66.2.bb
index e05b8734d..6765bed04 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.66.2.bb
@@ -7,12 +7,14 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62
 
 inherit pypi setuptools3
 
+PYPI_PACKAGE = "grpcio_tools"
+
 DEPENDS += "python3-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "5fd5e1582b678e6b941ee5f5809340be5e0724691df5299aae8226640f94e18f"
+SRC_URI[sha256sum] = "4a36e07913d26ba5ccfd2685ba63ca97f26b08c249d2cc9e74dda37efa49d7e4"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.39.5


