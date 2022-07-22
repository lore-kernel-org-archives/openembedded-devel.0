Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4777FC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 09:19:35 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.5930.1658481569490420033
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZppRHXiB;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id d8so5640750wrp.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 02:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=istdGP+JO955V/FdvbLajpapUX/19fVoZcQh2/QxHEA=;
        b=ZppRHXiBOP8XYWY8TKiWhu+JfoykSHTbAsReSvkXujMUzfyWpNTDAPLF1bnlLnWF60
         notJt552iPw2X0eRKmh4YXpOgN3CgOXm4k3mWYjZ8SQ600wIqFpLEzD8+PjyebSB1w4Z
         0oXEdJV3+P0nf6tcyVsP0En+LmqaJYo+q2sN9h4vSdWffV7emRZi+jQ6k2AhWLNIptW6
         oTMQSvDCbF/pViC5bNUxkax5HmXqn2UeslBZn2giAzimGuUCw6ugD6XrRQTwYmWh5+q4
         CGA3XqP4e17OVwG5FjztbifJ+CH/aRCvusF71C6oaE6rmTb6ni5JllcMdhhtUvCW1ZlN
         5bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=istdGP+JO955V/FdvbLajpapUX/19fVoZcQh2/QxHEA=;
        b=sNcc/v1sVXdTTNVz8XBcRgZMY3pOOwYQaNEo8Jl8Z5Z4DGkNwuZYNWV4LZl9o84BbN
         oAMIoPso22COmI3rgryxSUgDh7kGV6C2jdxCgUfHGFL3CP9INzJgm2kHw3OilQpmso82
         DLgcpYVPCRHz3dxnUTJvLdXIyFfqC3ASk6wxXhi3UJNF3xOrNcLEpmUcNVSGg8L/w5jO
         B+jNIr2ult9ZyHimV4iQFNBmAl5GMTjXI2IYxUiIMJxpjWcp9YIVeHI0z62/naxkehds
         xIEGTTFvsjtjTplkPw7428Leo4/qXuOLGXvOUGo6qjSeSBWTpIC5yA7QKzJbxDh+MQIh
         WIFA==
X-Gm-Message-State: AJIora9fwHkaOxsGurItwVxMW03JcAsDNrXnG9QKejM/HblbcjxXpZWd
	pVisDHKsl0zJfCDoUTpHCZwRSGEZ4tQ=
X-Google-Smtp-Source: 
 AGRyM1tFJi2g7NP94fopm4ZRyuckqo7W4wLUXvp6xkEBWppKXUR8YP4Cbqg9U5ymb3sgXVeUsqa+iA==
X-Received: by 2002:adf:f846:0:b0:21e:4bc8:f519 with SMTP id
 d6-20020adff846000000b0021e4bc8f519mr1774159wrq.46.1658481567314;
        Fri, 22 Jul 2022 02:19:27 -0700 (PDT)
Received: from Unimatrix08-Jammy.. (mob-109-113-162-128.net.vodafone.it.
 [109.113.162.128])
        by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b003a31b79dc0esm21091300wmb.1.2022.07.22.02.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 02:19:26 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: fix build failure on 32 bit
 architectures
Date: Fri, 22 Jul 2022 11:19:24 +0200
Message-Id: <20220722091924.958556-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 09:19:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97945

A variable has been renamed upstream from BUILD_TARGET_ARCH to VBOX_KBUILD_TARGET_ARCH

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../vboxguestdrivers/vboxguestdrivers_6.1.36.bb               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
index 70ddb436a..37dd0224d 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.36.bb
@@ -21,8 +21,8 @@ SRC_URI[sha256sum] = "e47942e42892c13c621869865e2b7b320340154f0fa74ecbdaf18fdaf7
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
 
-export BUILD_TARGET_ARCH="${ARCH}"
-export BUILD_TARGET_ARCH:x86-64="amd64"
+export VBOX_KBUILD_TARGET_ARCH="${ARCH}"
+export VBOX_KBUILD_TARGET_ARCH:x86-64="amd64"
 
 EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build' KBUILD_VERBOSE=1"
 
-- 
2.34.1


