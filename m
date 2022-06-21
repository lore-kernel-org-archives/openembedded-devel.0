Return-Path: <fabien.parent@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59712C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 22:47:48 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.822.1655851662548966807
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jun 2022 15:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=O868H7V/;
 spf=pass (domain: linaro.org, ip: 209.85.221.43,
 mailfrom: fabien.parent@linaro.org)
Received: by mail-wr1-f43.google.com with SMTP id k22so14442441wrd.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jun 2022 15:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zZThJ/cjVnd+Bs62Jalon5O0hhh45xNjcsU9XwGEENQ=;
        b=O868H7V/Cu0SsuR2lJ4yTTPIexDDS0nWKTWIL/x85I9AgpzFipja/Ypz+gH51nciHL
         we34MvVppTNb20e96YtL/5vjq3BUVM1ZtIBsiEAq81XG7OzAnTiCBAJo8w6ChZgwbzP/
         qOlf7PE44eSXo6iavJWMV/q3/NLM1uv6L9PdJAD44O0kmVGLJbohTxexPOMHILLTfIaA
         D22a7SaRhx+IXmfsuPcaru2Z9O9wGIQ9Hl6PEKY15JdmAYz4DIjiHfjeU1ZA6ElDMHsB
         3NKqGpoZguK0mj5pV08ucHoFuIHlDURxwSMMRxNsql0WkkHd46mBORi/0LZwBOXN/IKu
         JnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zZThJ/cjVnd+Bs62Jalon5O0hhh45xNjcsU9XwGEENQ=;
        b=MspBzjphA5+ux8T7y97pfjm7BDZnvoHdnbywk7/zE4GaQP8AAUzfRSleDsaD9EFcu8
         Gvfkm6Fau9nSyLN75hapqsH9mHrQJD61bJrvmYi0E9I9gM93g4RiZYEHcvlQG8UxQasa
         FXQCxeajxwYKYuB/5RhGOe3bxKgyS/k3UdZ+ELMERg1yvrRd6q5AR2Gsuxgpb2i0axh1
         2lJyrD0jFCb/2+t4IaupFVXQ6Lk/4OISO3VRcP8IKw25aEiVa0ooICN1+5tnB+AoU937
         yyw8mbqXi3JuKjkK4CGVp4rboyGBkB4nvlQ4QSVsYvsKUtJQO8xd53aOqGnMpFVQ6I2A
         mUhg==
X-Gm-Message-State: AJIora+uGDWlJv7u8EdM3gAa+bEVAc+UrzP8L0JOmdWi9EtSZkKU/I4K
	rbg/gL1+5/+s8gLNiSm8wSe0uXm+1TlnYw==
X-Google-Smtp-Source: 
 AGRyM1tl4TTpL1UVyi3g++1effdhDMWmbJf2cPz0s9dcyOGYYgRxqTVt5Gf3vJ8VoZfrDG1VsoX5Dw==
X-Received: by 2002:adf:f10f:0:b0:21b:8f54:722c with SMTP id
 r15-20020adff10f000000b0021b8f54722cmr224812wro.401.1655851660817;
        Tue, 21 Jun 2022 15:47:40 -0700 (PDT)
Received: from radium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id
 x6-20020adff0c6000000b0021a3cc0e242sm15395135wro.20.2022.06.21.15.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 15:47:40 -0700 (PDT)
From: Fabien Parent <fabien.parent@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: nicolas.dechesne@linaro.org,
	Fabien Parent <fabien.parent@linaro.org>
Subject: [meta-oe][PATCH] gpsd-machine-conf: allow creation of an empty
 package
Date: Wed, 22 Jun 2022 00:47:22 +0200
Message-Id: <20220621224722.127473-1-fabien.parent@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jun 2022 22:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97557

gpsd-machine-conf is an empty recipe that does not ship any files on the
rootfs. This recipe is targeted to be extended by a bbappend that
will provide the gpsd machine configuration.

In the case where gpsd-machine-conf is included into an image, and if no
layers is providing the machine configuration, the build fails with
the following error:

	No match for argument: gpsd-machine-conf
	Error: Unable to find a match: gpsd-machine-conf

This error is because no package was created for gpsd-machine-conf
since the recipe does not install any files.

This commit allows the creation of an empty package in order to avoid
the do_rootfs failure when this package is included into an image.

Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
index 9c1db3a6b0b1..4ced1c98db6f 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -5,3 +5,4 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;m
 # empty by default
 # BSP layers can add stuff like meta-openmoko example:
 #
+ALLOW_EMPTY:${PN} = "1"
-- 
2.36.1


