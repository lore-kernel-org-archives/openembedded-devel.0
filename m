Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C736FC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 17:07:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.27943.1716916063083228917
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 10:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rPbWygeP;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-420180b5898so7750245e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1716916061; x=1717520861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu0c5YaRHle/+zGz4SUM2BX9VTgatAtAlPs3zDfNRck=;
        b=rPbWygePfkI7S8HkSENKkvLo+xqbIeQlAb0EPbVG9nc8dtYELrTkDw6Syk1BKg2+SJ
         NIxG+1FJd2inOzWxaLxWf1bvGEj3A49tvve7ETo626d3I8DYBnf0k4h5hQGFujGCxqQj
         bV7EwBBKR/MbjGR+Z7vj2DMXN0REyXW8xOEXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716916061; x=1717520861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gu0c5YaRHle/+zGz4SUM2BX9VTgatAtAlPs3zDfNRck=;
        b=b5fxfdpRXyHIUf36CV4YN097iSBNVv3MptgLd9+PBZvfwsfir9xfNYmVDVIAIBf8Ee
         3ZRkMdzisDuNNcRmwOgrDjau3hl+wqWckkSJoypsAFgLCSr42Pf6xDY2e3px0MZXrIym
         OwXy/rdItIs5L42WwT4oTxc8LLN8usTreBUoCtI2qh6V2oaDt3NEQg6P4+C/65DMo3Ly
         E3CcISX6MPF1Q27Iv+nr2KU8rXr5AMSTIsNgl3Xdj4Fq3ONm+37HCzWRTI+qsMuCPohn
         +Z562xHyikJVjFOvcWGmIHHpRIsLXSscN6MLOmfdZx9DT9bhBZw1VQm6rD9rGH6YcY7R
         fbdQ==
X-Gm-Message-State: AOJu0YySzACfyCameUIP2y03TxawKGrYhoHMgOad/un2ln3IoYSAZUKQ
	qxhqIEqGiaYy2N14BJunUP6G+RlH2MKJkqIGEF6TXvq/aEcYI4f1JtGlMsrGPTVBlOZ5C2R7Tp5
	o
X-Google-Smtp-Source: AGHT+IHemDTJaaLvBgs0iUJBLSuC7ms1kfzuPH6eToRz44aeSAxA9/OjMmomkPp/8R4IIROr3d85Pw==
X-Received: by 2002:a7b:cb19:0:b0:418:6138:6777 with SMTP id 5b1f17b1804b1-42108a00005mr113986225e9.31.1716916060863;
        Tue, 28 May 2024 10:07:40 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f1ad4bsm182097745e9.19.2024.05.28.10.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 10:07:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Truong <alexandre.truong@smile.fr>
Subject: [meta-multimedia][PATCH v2] sample-content: Set UNPACKDIR to S to avoid a QA warning
Date: Tue, 28 May 2024 19:07:22 +0200
Message-Id: <20240528170722.365546-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 17:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110596

Since recent UNPACKDIR work, default S directory is not created anymore.
By setting UNPACKDIR to S, S in indirectly created in do_unpack.
Also set S to a known static value to match OE-Core definition of
UNPACKDIR/S[0].

Fixes these warnings:
  WARNING: bigbuckbunny-480p-1.0-r0 do_unpack: bigbuckbunny-480p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckbunny-480p/1.0/bigbuckbunny-480p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
  WARNING: bigbuckbunny-720p-1.0-r0 do_unpack: bigbuckbunny-720p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckbunny-720p/1.0/bigbuckbunny-720p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
  WARNING: bigbuckbunny-1080p-1.0-r0 do_unpack: bigbuckbunny-1080p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/bigbuckbunny-1080p/1.0/bigbuckbunny-1080p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
  WARNING: tearsofsteel-1080p-1.0-r0 do_unpack: tearsofsteel-1080p: the directory ${WORKDIR}/${BP} (.../tmp/work/all-poky-linux/tearsofsteel-1080p/1.0/tearsofsteel-1080p-1.0) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to

[0]: https://git.yoctoproject.org/poky/commit/?id=d6ae8d2004f8ac3aab4571e0077d406b2d19b542

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>

---
v1->v2: Add S affectation to be consistent with OE-Core UNPACKDIR/S
definitions.
---
 .../recipes-multimedia/sample-content/bigbuckbunny-1080p.bb    | 3 +++
 .../recipes-multimedia/sample-content/bigbuckbunny-480p.bb     | 3 +++
 .../recipes-multimedia/sample-content/bigbuckbunny-720p.bb     | 3 +++
 .../recipes-multimedia/sample-content/tearsofsteel-1080p.bb    | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
index e5a8f085b..5eba4da20 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-1080p.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "69fe2cfe7154a6e752688e3a0d7d6b07b1605bbaf75b56f6470dc7b4c2
 
 inherit allarch
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_install() {
     install -d ${D}${datadir}/movies
     install -m 0644 ${UNPACKDIR}/big_buck_bunny_1080p_surround.avi ${D}${datadir}/movies/
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
index 37e519790..29e60cb0a 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-480p.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "40d1cf5bc8e1b0e55dac7bb2e3fbc2aea05b6679444864781299b24db0
 
 inherit allarch
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_install() {
     install -d ${D}${datadir}/movies
     install -m 0644 ${UNPACKDIR}/big_buck_bunny_480p_surround-fix.avi ${D}${datadir}/movies/
diff --git a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
index 2b233d3e1..50ea2e3c8 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/bigbuckbunny-720p.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "b957d6e6212638441b52d3b620af157cc8d40c2a0342669294854a06ed
 
 inherit allarch
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_install() {
     install -d ${D}${datadir}/movies
     install -m 0644 ${UNPACKDIR}/big_buck_bunny_720p_surround.avi ${D}${datadir}/movies/
diff --git a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
index 34753fdb1..ed3ff75ac 100644
--- a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
+++ b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
@@ -8,6 +8,9 @@ SRC_URI[sha256sum] = "bd2b5bc6c16d4085034f47ef7e4b3938afe86b4eec4ac3cf2685367d3b
 
 inherit allarch
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_install() {
     install -d ${D}${datadir}/movies
     install -m 0644 ${UNPACKDIR}/ToS-4k-1920.mov ${D}${datadir}/movies/

