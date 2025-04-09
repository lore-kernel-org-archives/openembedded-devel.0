Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93380C369A5
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 02:37:48 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.13186.1744166264321920758
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 19:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m/9xc1iy;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f74b78df93so77849927b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 19:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744166263; x=1744771063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj0hQalshgEL7ybRE4Hx+8tus9d/h7T6VemM6WWmk0I=;
        b=m/9xc1iyRqHT606xSTRHL4CG0WQ6TyvsszslZ6DK+osl7Cd7ba+IbTjeDWJfooCZV3
         b47v7LisvR/qoPdj5C5w2iaJdxYLA4gofGmMO7uirQD0//a5jSHM4mReb68T5R8fYm1a
         Aeb+Oa9N6Gi9CMizWDdBC5xv2E33vK/TbW7oRSswTf9G0hXkPud0qbAugzuB5EdXrd0U
         f3q4HxMcdWF2Y8UO1o6ku1Vul1tqEJAUNkY1r41E+8DHZJOpmgzPa0058ALoxkBOpOOz
         UtIGrhjBhZes7tBG2zKeiRkCQAaxc9G4RSHa7lvND43VKgO+jHa5yR4OvT45bcbOQBN4
         Kvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744166263; x=1744771063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gj0hQalshgEL7ybRE4Hx+8tus9d/h7T6VemM6WWmk0I=;
        b=JsagTso1/UoDLgbTAvaPCOH6OPDK178tPmKvN56pRqid5pNEErKPwl40G6exD3FY60
         EALTxhcnmM5MPAGG6hkGZ+JlUF/deaB9QH28wWvK5957fV5oqc6hShv0UheS/6BwBoQN
         nxzEY1qy1bdhYIujlNY4sma0u1uHm4KVmpBog2QxjLzC+XqtgVerTz1r01BgXJi7iPuR
         5HthXHvWsvmMkpuwtCjZvESg8PzgfbLL9+MbOn0lP6fsyTolmNtF09PKOE277hSRyRrj
         la1gRbtggcH7mUEwAhRGFpNP0hC7Oq7mMmV0USe+iyefZP9itkqnCZVc1kDcpvOXyEAF
         Bk5g==
X-Gm-Message-State: AOJu0YxTl//utCAOrctoX1FmeehsHQOqE7he8ZfWWC4PdbwfsgNiowm1
	731PIHWxSW/4NP1iRpMFCPkM6xvhmuj7fgcEDnLzGi8ln4IQZT5niIqtHKWC
X-Gm-Gg: ASbGncumsSa3GJQ0mq1U8ELqDsXd4my3qSIwcXJXYRXyZ65JGOUdNHgj8ZXacZHytKl
	K6wXSOGbnFGtTNDWO+1ZTocCiq4lw/uN4mVyxD7Qa+8/rSuSE1m9OmGXEfg1KznT+fAeLo0sQB5
	ax01/W50asuLsUv50+fO1NXBUlV2uHMnIhxeZPRHIBjP/Sybi1h0WQPd2ggQMWvC5XWVtnhio4z
	j+KVs2YLRPcajvmyqF1mhS2Z63O5MBx+KQAWn2HGAfV6lsHyDo9NV2oO+NW04RpamTjm4eaPw2E
	s0c540zLNlv6FEjX4HlftR1t4x40gTO27P/pV20E5diSM6SBcw==
X-Google-Smtp-Source: AGHT+IG1wZ7owN0z9Q8jtp34RRI388qGHcYfLL6OeQ0tInGTPo6kfQF6bKHugcIih1Li82uehG63zw==
X-Received: by 2002:a05:690c:4a04:b0:6f9:b12b:8943 with SMTP id 00721157ae682-70538812df7mr31815187b3.19.1744166262868;
        Tue, 08 Apr 2025 19:37:42 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e11a2e1sm497637b3.42.2025.04.08.19.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 19:37:42 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] usbids: upgrade 2023.01.16 -> 2025.04.01
Date: Tue,  8 Apr 2025 22:37:09 -0400
Message-ID: <20250409023710.1370323-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 02:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116719

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../usbids/{usbids_2023.01.16.bb => usbids_2025.04.01.bb}      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/usbids/{usbids_2023.01.16.bb => usbids_2025.04.01.bb} (85%)

diff --git a/meta-oe/recipes-support/usbids/usbids_2023.01.16.bb b/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
similarity index 85%
rename from meta-oe/recipes-support/usbids/usbids_2023.01.16.bb
rename to meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
index b0dd72fb25..bdb5807aa6 100644
--- a/meta-oe/recipes-support/usbids/usbids_2023.01.16.bb
+++ b/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
 SRC_URI = "git://github.com/usbids/usbids.git;branch=master;protocol=https"
 
-SRCREV = "7963233faf69eb9c80ffca8dfc1f31940f75999f"
+# April 1, 2025
+SRCREV = "635738b64eb52d376c5d1756c265de67236c8934"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


