Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04729C25B0E
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.25873.1659968704971485734
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H++oeNo+;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id f192so8221850pfa.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VRT94c2C2PE+nfgNhvQoDsCCDCun1WOQxT/1eJTFI64=;
        b=H++oeNo+dECHDUasseH+F0Pj2uu1b96UHnbBbtYnstWaaN3yBtklyrSOGXfd1WokLO
         xQUHQL+xJF7UsA3IGkkfOnJ4yO9XkJ1wWBN61UkGzhXLlNH1sirKZJKjh9F+tPEOCd38
         WxrqtQgMc8eMtM4N73oYPkscz5NPDd08dRoUfzDYZev7Q8Ntn9zb7lPbgYceZtdY0kg5
         E7Ivgyh5c57Mjs3q2oCXX96B1I8I9UAMRA0G4obHbYNzg/H9SsS+MFhq39d2Mu1GvUkE
         zZXdim7+bLmYkRfS7XEnKDsVMo+FwtIeGMUB0UQGLfQnR64HWzRNyYLNDP9cShVJJ2Jv
         pPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VRT94c2C2PE+nfgNhvQoDsCCDCun1WOQxT/1eJTFI64=;
        b=uh5FuCxpVONXTftWcVpJtvEcMSpUrCjAO2se/3tb3S/Ykrvgx+i06Y3OURW8kcOmd3
         QyspiRQiIp02KEqAlz33cmMnarRoI3ixDkP4wAV6pc8AO+qh+kXufzF8/N3DRxMJalz6
         n7hbfJIKyC3FvkJaD2zn+jG1EosdCJxoi81j/JZH1vb7bdqPcY6qLAUXS6PYUN96FsWv
         WfXWYM6o08xXGI3Wu3675l4TP2Tjr1NAWg2EC001cIXJFDEYYwBIC6+jA/JleJgzCVwb
         LD9ChOThDrxbLWufm8E4jCpXQyhLloLVOnkX2UECHouL2WjR1WEoGejLqKhOwnSeNvO0
         9mJw==
X-Gm-Message-State: ACgBeo3wAFDpR+tb7gP0ptaQE7+/7KCgtbBaxNvD4EajEV4xmvG0oWZI
	8Pz7rw0FtLKb0RbZjEhO2P0gJMBXIag=
X-Google-Smtp-Source: 
 AA6agR4qcluCYobsuDZAe+5iqgAC4RlygFJgbaFtCBcfz5YEWTqs6AcQ2eeq7zfm9m7J9tCo9cpA0g==
X-Received: by 2002:a63:89c6:0:b0:41c:84c:bdae with SMTP id
 v189-20020a6389c6000000b0041c084cbdaemr15933918pgd.300.1659968703798;
        Mon, 08 Aug 2022 07:25:03 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 04/13] polkit: Add --shell /bin/nologin to polkitd user
Date: Mon,  8 Aug 2022 07:22:43 -0700
Message-Id: 
 <eb9a5dcbf3b9b0bcfd2607587b5e351ab03c23b4.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98164

From: Akash Hadke <akash.hadke@kpit.com>

polkitd user has default access to /bin/sh, add --shell /bin/nologin
to remove default access to /bin/sh and avoid login through it.

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7ca63e5454bd7cbdb5ac58f6b5913e3387b64201)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit_0.119.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
index 66bbf735f0..9444cb9f2d 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
@@ -58,7 +58,7 @@ FILES:${PN}:append = " \
 FILES:${PN}-examples = "${bindir}/*example*"
 
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 polkitd"
+USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 --shell /bin/nologin polkitd"
 
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.25.1


