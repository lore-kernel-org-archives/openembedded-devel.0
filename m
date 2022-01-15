Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EAAC433FE
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 14:28:05 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.7647.1642256884292124733
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lSFBcXNI;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id c5so5347217pgk.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SHj/u/+gF4rMT1tbLUwm3d4f9Jv/bfO5kaRYbX4gQUc=;
        b=lSFBcXNIquNA6XmN8+DIlUXFWXv5nGMUGHyfBkDJ6dZ7mjuqQB9VTptgzxcruLvZJN
         GbKhT9iyqiPKFn+BfmmYP2bMsJtrpZakdxXf5m73lRw4URhLN+mnx01bXvZvoVpTKJsD
         ShPzn8Eldzh7lTs77PeT+nF71s5dROqKgmYDbbzB7bwcMSAz3sH5ar3nmgvJD/TVTMV8
         CcEf9E2cFJeeibXCZcoJJrpydYwXh53FSVdS7YDmog/wKcL/Khlnp7gsW1frXnJkY53G
         LS6R7SPVF7l7rCJx6C0W9Kh0CsBNL4Yrlwrch8vYHbIB8h+u+c1nnLYv/vvcYwuFryyR
         /csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SHj/u/+gF4rMT1tbLUwm3d4f9Jv/bfO5kaRYbX4gQUc=;
        b=aQhE2uNb7uqfPxzksltGLvQ0yNtYhcCPcRJIc4nyjcfuI6BUqAh+gUyN+VjPKavx/w
         3REBXvJxyBKeLheryLmO3GvK2znqrg0wWNGpcSVoWtrdjoXojrOUDH8UNlEoMvp7HBU4
         vRE3W31SOKN8m3hNW70jAl9IMWee0TNG9sVL4JN90mp1YJ7q57INfuDWKAtj+ypRKBcG
         +NXoN2i1rcGrTQI13VrqyRVMocnP9aT9AwMuiHndU93ts6jgW4CSZPRiwVpzaqszSeXB
         ACQTSkCDYlxyzydcKVuo+3Sa0WPMVgCycYJwvRPDBDxzTk6dyZJouBcCXjXkTSWD15iN
         Bk4Q==
X-Gm-Message-State: AOAM531rY4RiUq6gpkx8soYaQADRDVZp1agCXVS/6YTetbFYEuBpp9P9
	NpCSJ/lQiD9l8qwmxErug3vXcri58i7tuw==
X-Google-Smtp-Source: 
 ABdhPJzsYfFhGM1yjKRpAyW3CSIVQ2/obesw7n3hDDZCUXZPVAyLeyoU8mFGXYHgqRrdhGWGHXtOGg==
X-Received: by 2002:a63:385e:: with SMTP id h30mr1534388pgn.16.1642256883667;
        Sat, 15 Jan 2022 06:28:03 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:7ab9:6507:6566:58c8])
        by smtp.gmail.com with ESMTPSA id
 k20sm8606779pfk.111.2022.01.15.06.28.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 06:28:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 06/11] ifenslave: Add branch=main
Date: Sat, 15 Jan 2022 06:27:49 -0800
Message-Id: 
 <2151027209d11ba2f918e65497d5331bd4f32798.1642256649.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642256648.git.akuster808@gmail.com>
References: <cover.1642256648.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 14:28:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94865

From: Jeremy Puhlman <jpuhlman@mvista.com>

master branch has been removed upstream

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
[tweeked to apply to previous branch define]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
index d2a6d02d2f..5e547a4621 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
@@ -9,7 +9,7 @@ inherit manpages
 MAN_PKG = "${PN}"
 
 SRCREV = "c26e9310f552e69d0d44eb48746e02c9ae4b4f6f"
-SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=master"
+SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


