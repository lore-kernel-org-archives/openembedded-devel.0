Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4DDC49EA5
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.25567.1649008871719030088
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Apr 2022 11:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ouABc4/C;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso4319962wmz.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Apr 2022 11:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lZW+157u3w1F3m1SBWyxfbDaq/iq2ZU7NdmTIkYFovo=;
        b=ouABc4/CMFA2DBneNNQmYeJvR9cMdlkBr0DTTDEF7JLghPrdxfN0kv/HILzSoFithu
         YnV56gbrKcFi0I34FCiTdo0GUxEnJwyJLdeRimHegY6qIoypNizJACln9EKzcYkmx6qL
         jTpgIz+s5NXQ/Yfyn2G+y1EFICiRlMDqUqmKoPbTIJCngSxrYnv1E66T+vZIaDFUpXuX
         sE9bAg8aNuYdrJeEGjh9fNYgp6+TaYs8Ne5PAfH45uDEV3+OdFyb15utrtzXpr43ZaZ0
         mwhIA8KCsJwMCsgJdAOjkdFrcyxSEKW/GkIIoMzbM9pZjm6m3U3lMq7R6mraULt0n1A8
         RzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lZW+157u3w1F3m1SBWyxfbDaq/iq2ZU7NdmTIkYFovo=;
        b=K8yeHSy0ntalbB+hxlQSWh6sr8x/BcOW7i8+KNZxebrg0dve91nDKaBwBWp1JljB+q
         KM0oPsPIH64M/Yq33oVV/e5QCXqhGnt1iLLlYj0mGiFuFZCF6aerCJMtvCVLo9tNyarE
         4PeVdYs7Uh0yfjKCYkN6/bsg1I6Wdvy0I1rMLQ3wB9vluIaQ08iIE7oEdqQz1o2hkSKQ
         91nV6/IBhJbIm6Vav/m6Lg4fQfgq3d07pbzEkjvtQbD0fVomizbEezCgOwJgCh4zAQoV
         dUET9LEPgcuffQrcMNz6+Pa1kAxsORwKizChx97r+udujJQsQewsKg6HwNsudZkqfYAu
         c7gQ==
X-Gm-Message-State: AOAM5327SuxXSlMf2+N82QGkVdpUoq6XvNTj1Gr0n1+PxR0t6TC41Zyu
	eAMSxW79zpAmuzI8ZwP2IP3fDJAbNonZmw==
X-Google-Smtp-Source: 
 ABdhPJzM4Svlca4HUEejHRbkRw4eQo5CGlqN4cTxJh9V7MDA9bEUvwIN9bvZI10liaaIoggVmS5SjQ==
X-Received: by 2002:a05:600c:4f86:b0:38c:bd13:e074 with SMTP id
 n6-20020a05600c4f8600b0038cbd13e074mr16606524wmq.97.1649008870083;
        Sun, 03 Apr 2022 11:01:10 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 k23-20020a7bc417000000b0038ccada7566sm14492298wmi.11.2022.04.03.11.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 11:01:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH 2/2] srt: 1.4.3 -> 1.4.4
Date: Sun,  3 Apr 2022 19:01:03 +0100
Message-Id: <20220403180103.2147606-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403180103.2147606-1-quaresma.jose@gmail.com>
References: <20220403180103.2147606-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96371

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../recipes-support/srt/{srt_1.4.3.bb => srt_1.4.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/srt/{srt_1.4.3.bb => srt_1.4.4.bb} (95%)

diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.3.bb b/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
similarity index 95%
rename from meta-multimedia/recipes-support/srt/srt_1.4.3.bb
rename to meta-multimedia/recipes-support/srt/srt_1.4.4.bb
index 9dc862c57b..d6cf36dfbe 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.4.3.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.4.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/Haivision/srt"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRCREV = "291e010fbf91b13b92e1cde5dcb824a9d7f4e353"
+SRCREV = "8b32f3734ff6af7cc7b0fef272591cb80a2d1aae"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master \
            file://0001-don-t-install-srt-ffplay.patch \
            "
-- 
2.35.1


