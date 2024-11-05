Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DA8D40D0E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.31091.1730840197525293803
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:56:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mIP5Ykhq;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e38fc62b9fso51301297b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840196; x=1731444996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xD8mIBqN/wnArtvwSzQsZO9+onNCKGGeN6tVslcafZc=;
        b=mIP5YkhqNrfH4cLXOsPMFQH0BgC6Cn+Hrd0n9e9RR0VHiimQ+x4zSfG0aJTCJ49ie+
         psLitYG1peUWBhUKd4MsArHwdJVQS7/ouX0U4RbPp3NsWsUyNui7rOEdVfjG8tHTpbZx
         D3RFtZklw2GjxHDEK2TREPhMpcpSwLtWRSNbWn2RXYJhg8syhHEe3vtUmOHZGzgWl23b
         G61qsWJvgN1OwJHLzd0zAyO1xC0Mi3Ec94b0ty6TvB/njC3XsCctTE8OTEzjLJUJHVWK
         Z8z23uia+maKOXl3rtIjTvgGpdqj0pXROjdpPqP7VYiP7voEBUt6JtHUBEW+S67CnvJs
         kyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840196; x=1731444996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xD8mIBqN/wnArtvwSzQsZO9+onNCKGGeN6tVslcafZc=;
        b=fH7E3yqynTg6GLrDfhFOPN+2eKNv0rNCvAkAEN4lDf2GB9E+QYRmmobEORtJJpRXIB
         6fW1UBt1McI3+wnRsg6shmHFQ76RCHANzqJGWLUYrqRvL+/UmfMAzYEBUK/UttrxkIOp
         P41/uEa62M9uFK2PDLTeBO487ShKW4aogEhpMtugbxTH75li6tNUlidRG2vGYnevmDgh
         vMFzjbdgIpZrRMUV8LIiNeJ0keDyzhyZp/Jbxj0rD7JcBpwdBivs4qyzCmykyHMN71Re
         5rnbQNgk+z+cU3oEclfCgmsyDPD8WJ8niKktkTdD2WTJfCIpxkHMDCLYc4IGMfb5asPT
         ZiLQ==
X-Gm-Message-State: AOJu0Yx0lSyH0uwjJbnKQh2/9pK7G0OnfGWLnCYanMBQk6MfBfu1/p9j
	Gz6BdziVGVAJk2U1+1uyl4lvKQVuKwHOFWSNo1aWtQ0DTU0wwhh/InvSzduf
X-Google-Smtp-Source: AGHT+IE1+huBptQjC0eTTxusQFXPhi/yYdYqePCfoYXGquUdURa+LD8yOdZIh94kdcEeF7fDUbIx8Q==
X-Received: by 2002:a05:690c:7482:b0:6ea:4e1f:2b42 with SMTP id 00721157ae682-6ea64a8d5e4mr183436867b3.8.1730840196225;
        Tue, 05 Nov 2024 12:56:36 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:56:36 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 146/161] pidgin-sipe: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:52 -0500
Message-ID: <20241105204707.4155-146-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113662

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index e96e11861..5fd927bc6 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -14,7 +14,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
            file://0001-Migrate-to-use-g_memdup2.patch \
 "
 
-SRC_URI[md5sum] = "0e742f021dc8c3f17435aea05c3e0314"
 SRC_URI[sha256sum] = "738b121b11f2b3f1744150c00cb381222eb6cf67161a7742797eb4f03e64a2ba"
 
 PACKAGECONFIG ??= "nss krb5"
-- 
2.43.0


