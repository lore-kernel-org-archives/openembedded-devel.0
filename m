Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F601C433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:36 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.11850.1639668215473410986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N+n4mX3j;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso22980182pjl.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6r7N2S7SpeTu00VboJ3VlCzIkzkGEv5br8l2Nli8+pk=;
        b=N+n4mX3ja65C8GY+Ovpp9UrzhZ2sygwgSy8mrKef5AKoS+pAnKm0Rz0XK4/iEBilVA
         Um/CqXll9uZ68sqSdiJQ30eW7ZFZ0LcT8kAHeSTIOSYnGkpPWZ+oltRtREI/HgWn+2ZU
         OP77xRndXarVIuDlUAQpG5Ai9sLlzO4RH1cgi2KC7gLE3qc+YatLihKpoa6n3g6kcvaU
         O31QC8Q878iqeLJGorv9pZOQw4NyuKZyPYwyjt2qR+MQSX80exq9t+QxYX+yKFhTfJ4C
         G/R9EM/JeQzrctPBdq+DUqqLMPn4hhMo20YybVLab9hNHTmIcGomTxRY1ZmFIYMllRok
         5U5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6r7N2S7SpeTu00VboJ3VlCzIkzkGEv5br8l2Nli8+pk=;
        b=w71aCpJeDMlTT1AMLOmMp+9zsa61xBQoIRyOsR+38YwX3B9pn8uVcXhpUc53fzueC/
         fXK2GvGDn9xRFfqDrrCafthwjYtYzJESrCaIc9/wcZ7BB4gi1XLCo+7KfAOSBS7uVUtt
         a6eerPr9DZdbCIKCqiOEC0UicAz1IK7hiyS6p8/NLkm3PQKQc9WrSaGraqyj+kfVMiLB
         WohkQRV/cAV2hwCVxEEUqXmZJ+Jvd+weMQ0PuA559n4/GFxFXe/UYIboe+S2mt6ufAlS
         8QmGhm4GtDeekESa5wT8Igzj/7FOoS8mPJdiu5I5ONspnhXjDGmxt1QbY/4KQjNeXlBR
         nq4w==
X-Gm-Message-State: AOAM53327q/9IzZEtIhXQJhMqWgSM4ERAwUSUuCMfG/AhucYF+quGF6x
	Q2tnKjBlGmjbrwVfiK7vS5XnntOIa/s=
X-Google-Smtp-Source: 
 ABdhPJwznRcAp9AG6iv6uJ7Fkyu0z7ABZq2cd70z60JJEOFVi8K161OsgrS+cCANMwuJfMpuR1Hk5A==
X-Received: by 2002:a17:90a:3009:: with SMTP id
 g9mr6586234pjb.205.1639668214881;
        Thu, 16 Dec 2021 07:23:34 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 09/18] pcsc-lite: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:14 -0800
Message-Id: 
 <9e0bf0c3b028ec12370f468cd0e2dd09287b88fd.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94394

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2755ba786a1d8e54b065320b7a35bfe8f31ef847)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
index 93b18ba1d5..d90dd43042 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.9.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "PC/SC Lite smart card framework and applications"
 HOMEPAGE = "http://pcsclite.alioth.debian.org/"
-LICENSE = "BSD & GPLv3+"
-LICENSE:${PN} = "BSD"
-LICENSE:${PN}-lib = "BSD"
-LICENSE:${PN}-doc = "BSD"
-LICENSE:${PN}-dev = "BSD"
-LICENSE:${PN}-dbg = "BSD & GPLv3+"
+LICENSE = "BSD-3-Clause & GPLv3+"
+LICENSE:${PN} = "BSD-3-Clause"
+LICENSE:${PN}-lib = "BSD-3-Clause"
+LICENSE:${PN}-doc = "BSD-3-Clause"
+LICENSE:${PN}-dev = "BSD-3-Clause"
+LICENSE:${PN}-dbg = "BSD-3-Clause & GPLv3+"
 LICENSE:${PN}-spy = "GPLv3+"
 LICENSE:${PN}-spy-dev = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
-- 
2.25.1


