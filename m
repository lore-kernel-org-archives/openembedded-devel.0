Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51891C61D9D
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:36 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.44852.1674653493595751910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l7r2Khbe;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id d16-20020a4a5210000000b004f23d1aea58so3139368oob.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85gfWC0+v9s9SKcF1NDhVkZbXsFsbBnTrOuJXQDPdgg=;
        b=l7r2KhbefDV/TJChgu5vtnVoUVQ8zdvWChcEohnxfkm5ZwgYZw8oRDbdVgQPdgDhZv
         O07lyzFjXsu+9c6ev7NZE0kdWNP44xUId2JjQKgmoGqYJ8rrZ8KARojwy4Y/SW4tc7Oj
         KNmNreWkJ+HhB9ae0sOYZIklDj9BOGgCD4wcpIgToK9PAEYT8Q9TtTfwtVHW7q7crq5B
         GAgB2Jc0m7PTVRTELrqivRR5K5LXIwbIfPbJI/d5O3b/m5Rq5VhqM2bnwbffAPHT4xcs
         7HT15GeQ6dgnw1tdbKC2pYVEkJvcoJwVe6dnGT9ahDkpMl3M6PbEAeTJrg+LX/7y80Sz
         a3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85gfWC0+v9s9SKcF1NDhVkZbXsFsbBnTrOuJXQDPdgg=;
        b=aT9MDAUnqWJ5QSqMALMcP/XWGfrZFjB1V+f+bEx2VEtLOyip+hIDIeOvG78+slqsod
         iAx/vcob6q6S816zKXTze7MKgUVIX6m/SH7Hx6f9zCyH3I2jKaWVFbkBeD1Dd6Qvnod1
         G/u8oOLmYQgtIri8acKkkXzRc2QIzk+y3gRdbPhkIhZkNPez5NlQol18ghhOO0fHjUYP
         7oNvOZ7gRYOMyBxfq8Kow3syAC90iZ7vxuQiQj/OHAbp4CZPIIo368+FgH7VHiYEaLN4
         RTGoXetT24x6MdhQPDvvXJYsO5lvBKsFj3/1CLR0jqRHbCj8aXAx2O5GlMwfv05Dwumf
         XjCQ==
X-Gm-Message-State: AFqh2kopzbdfTAvKmMJNTtrE6kKH7kYZ3igU2QlNrMM14RMqljtd5x4U
	Hf7D8neivJu+xjYrqkA2y9JwNioBTK0=
X-Google-Smtp-Source: AMrXdXt9snmZtAC2lZ/B7scchOrD4Ih8Hbc5bs0GyuSL885VFua+kVz2w3z5J75eIpca7vwAzCeFnA==
X-Received: by 2002:a4a:d38b:0:b0:50d:d797:f186 with SMTP id i11-20020a4ad38b000000b0050dd797f186mr2631889oos.0.1674653495084;
        Wed, 25 Jan 2023 05:31:35 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 09/41] protobuf: stage protoc binary to sysroot
Date: Wed, 25 Jan 2023 08:30:51 -0500
Message-Id: <a7212d75fcfe871d6a9c292df8620cc68ec5fb39.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100744

From: Samuli Piippo <samuli.piippo@gmail.com>

If protoc is enabled for the build, recipes using protobuf will
fail when protoc is not available in the recipe sysroot:

|   The imported target "protobuf::protoc" references the file
|
|      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained
|
|      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
|
|   but not all the files it references.

Use SYSROOT_DIRS to stage the binary to sysroot so it's always
available for other recipes.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d7f46fa816964e30edb2ccfecc57a26251cc351c)
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
index c8b9158e6c..201908f3c9 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
@@ -92,6 +92,8 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
 FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
 FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 
+SYSROOT_DIRS += "${bindir}"
+
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
-- 
2.25.1


