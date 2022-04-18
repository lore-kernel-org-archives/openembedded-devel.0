Return-Path: <suhridsubramaniam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78327C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 18:35:06 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.435.1650303333782099563
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 10:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=euxCsfU8;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: suhridsubramaniam@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id bg24so13556214pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N2dJ+QA3FdYskBVet9oH+ut/Uj+akVowpyZO32SqYek=;
        b=euxCsfU8yADilY0/Scl0+VghSRAQElq8/628P7wn7bRVyzNtlTP/GNjHhDmnJ4NYia
         4n2tVKMcSc7ZjnJZXXNY49VSUxeyftEaM1+Mf4WaDVWOeqRY8b8BVozcgpRC00mxd3u0
         YjeH2uZ4Su0KFGXSYrebx907xYwNkjV7wVHtPILfLUaIvMd3A9ji5MDGjaebCg9y1oxk
         EHyiMX+jTVSSW9Hj1/ao2ns+K7pwypUDuXpyO8tshMEOJlKcg74P+C+pTKvqqwXw55YL
         x5GOS9p6asuxzxiWWbiJo8BeafvnIkp5nAShoW7OTyOn3i4Dm9k7DlAmPPUk/i99JwaW
         iSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N2dJ+QA3FdYskBVet9oH+ut/Uj+akVowpyZO32SqYek=;
        b=k/Z3pGSYiPHxy54xivbWJN53dfGxCREngr43BwmBW0Fu5Jn1erX6zAOjZgqmlzO2aS
         Bnq/pz3EMX80rjoaBj98fbJ0D0dJTLZPc2Y5q0G8UPfQSiF8jNEAOvekpAgjUaqgB+Rg
         1Ihln340F85nw/S25MmZDCUwCdTzWi9inNf9bmQMAZKQ9kpYyoGayTLQFzhuySqTDECV
         fZxmwlu/dRbAqbeviw2C4sZNrXK9z13XD4wfGhWtEdQYbkg5D319gLmg2xRx+z6Muv1K
         yOdpL877JK0G8nH+401HMp6+GcCI179eQtk0UqyIhPqfrjazNAojEfnepG2IgxHWbXX/
         dweQ==
X-Gm-Message-State: AOAM5329ETHxZErmPoB1tCyJChxBT1xGXJbnDJrNVHXsYrpi3XVwOfbC
	eEu6CI5TwQpKUo9cDiP+9WU65mh06e15Cg==
X-Google-Smtp-Source: 
 ABdhPJzHMzhUJsem8VQnjzh4KupaKnRJeh3m/Bzj5cz3dDrIoX+TNUROfi9sMUJfX67Ia2ACJ1z93w==
X-Received: by 2002:a17:903:2045:b0:158:c130:31b7 with SMTP id
 q5-20020a170903204500b00158c13031b7mr12463457pla.154.1650303333000;
        Mon, 18 Apr 2022 10:35:33 -0700 (PDT)
Received: from mediatek-ThinkPad-X240.hsd1.ca.comcast.net
 ([2601:646:8200:a320:b137:3838:6766:5a4d])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm13617706pfu.120.2022.04.18.10.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 10:35:32 -0700 (PDT)
From: Suhrid_S <suhridsubramaniam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Suhrid_S <suhrid.subramaniam@mediatek.com>
Subject: [meta-oe][PATCH] clinfo: Upgrade 2.2.18.04.06 -> 3.0.21.02.21
Date: Mon, 18 Apr 2022 10:35:03 -0700
Message-Id: <20220418173502.8082-1-suhridsubramaniam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 18:35:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96687

From: Suhrid_S <suhrid.subramaniam@mediatek.com>

clinfo 2.2.18.04.06 released April 2018 does not show correct information pertaining to OpenCL 3.0 released Sept 2020.
It shows version as `2.0` or `2.2` in systems with OpenCL 3.0.
This upgrade fixes it.

Signed-off-by: Suhrid_S <suhrid.subramaniam@mediatek.com>
---
 .../opencl/{clinfo_2.2.18.04.06.bb => clinfo_3.0.21.02.21.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/opencl/{clinfo_2.2.18.04.06.bb => clinfo_3.0.21.02.21.bb} (92%)

diff --git a/meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb b/meta-oe/recipes-support/opencl/clinfo_3.0.21.02.21.bb
similarity index 92%
rename from meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb
rename to meta-oe/recipes-support/opencl/clinfo_3.0.21.02.21.bb
index 831b15a45..35b5a000e 100644
--- a/meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb
+++ b/meta-oe/recipes-support/opencl/clinfo_3.0.21.02.21.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fd8857f774dfb0eefe1e80c8f9240a7e"
 
 SRC_URI = "git://github.com/Oblomov/clinfo.git;protocol=https;branch=master"
 
-SRCREV = "59d0daf898e48d76ccbb788acbba258fa0a8ba7c"
+SRCREV = "d34bc1a3bdc148e2e1fe64998398e1a0552ab04c"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


