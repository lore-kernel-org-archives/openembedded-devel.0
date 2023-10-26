Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0815C25B72
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:11:26 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.69985.1698325881425703944
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 06:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PQzlK0gl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-508126afc88so1286592e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 06:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698325879; x=1698930679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j20qV2FSRA05djenh6HnmqEbFZvXKEQRrLaxC9pB1XE=;
        b=PQzlK0glS6YJRxygP/OgDPCrc3bE6K211FRSVo9ZVUFmla0OSRS6jQY5yM+bgoFXdA
         SgwdGDmQfFVr5X2JBorZwVvhy6CNKDFQrzky9vvsg2tabiBGCRxCY4mdqNf1S3i38T4J
         eJGcmOtE+kEk7Z2e1qQnHMG7Q/Kg6CftZ/fv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698325879; x=1698930679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j20qV2FSRA05djenh6HnmqEbFZvXKEQRrLaxC9pB1XE=;
        b=kpomwi9JidA2tQB9DbKP34/mO9r0Jkzl4e3CDsSfClvmSn0eHAxFOQUUIVbXw0R61C
         1qngjGoO3YipAlFVHf5+Zx7zzIugn1AyIQeg0gVVTB/NlZtZFRFa+ZPm6vp9OMKEmuFh
         RqaDjfnKtyNJbBj0bZnxqa6+LjUJkKHDj7ptQ8sNXhGpM0/BV8yfX9y0av9ng81WjckV
         JiJ+yMRyUqr5mnRMZgi1tY7L5Hi5EOKc1DZ9iB2R5UolvE4rz1HPoJB+AEWxMjuGsim8
         FcldW/ANcKQ6M2PEGAzQIwq2q2TkNmB+AzuqGJ23t2iUrjZykmiRYkT9lsdGljQovtMX
         W9Fg==
X-Gm-Message-State: AOJu0YxuzoZdIE78VQaaueQsVQLugmWZuLmWN6H/Y3320CUWOuF4JciZ
	rFT/JdrUxSksNMHdwiLEvaSm611Sdq5adyJwFzM=
X-Google-Smtp-Source: AGHT+IGCzl9mgYy3rdfbTtAz23NUDiN8Pto9rsBVGEisENDyZNIPaYsiwwEsiDYOJTkB8yFq41a/dA==
X-Received: by 2002:ac2:4d1b:0:b0:503:1775:fc1 with SMTP id r27-20020ac24d1b000000b0050317750fc1mr12671064lfi.31.1698325879225;
        Thu, 26 Oct 2023 06:11:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id q18-20020adff792000000b0030647449730sm14202024wrp.74.2023.10.26.06.11.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 06:11:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [kirkstone] [PATCH 1/3] grubby: Update branchname to match upstream
Date: Thu, 26 Oct 2023 14:11:16 +0100
Message-Id: <20231026131118.1500868-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 13:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105743

meta-oe master already made this change along with others. Update the branchname
to match upstream repository changes to allow fetching to continue to work.

Drop unneeded duplicate semicolon too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index a276bf423..7c40c52cf 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -14,7 +14,7 @@ DEPENDS:append:libc-musl = " libexecinfo"
 
 S = "${WORKDIR}/git"
 SRCREV = "a1d2ae93408c3408e672d7eba4550fdf27fb0201"
-SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https;;branch=master \
+SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https;branch=main \
            file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
            file://run-ptest \
            file://0001-Add-another-variable-LIBS-to-provides-libraries-from.patch \
-- 
2.39.2


