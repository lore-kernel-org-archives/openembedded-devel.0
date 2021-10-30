Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F99C433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 11:16:10 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.17980.1635592569423147786
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ANcLhHV/;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so8732910pjd.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 04:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=16NHs2CS2OxJkr3SrRSy4T4qY21V3E6B5bpWDEBmAPQ=;
        b=ANcLhHV/pCFHGgX3P5hC/zhRu6y479T6ofEwVOCvVoJGPNIJlneSglLVgXt4gXvYds
         k1WR1iCwpbZIwKSCce14+v+zCYviP2MWP64JN58LP/g2q+L7oUNHRcnojrL6ijN9zRWs
         DeAP7M3sm6TBIwUTrz5d3Pr4ECpRaairh74jam25SGKL+Z1FrdknBhPa/2kS1cuV2SJ9
         S9fBoHdbLysmTL09E6uIN9KY6V39LHMtssPYFQLgzL6s/0xU11MiObklxjadRhSqV26p
         fAtXEEwbRyGMdDSBiDiuriR03IWPd5VDYoHIDKlFNSsmRLdN0/9bjke+OggJKERdA1mG
         to2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=16NHs2CS2OxJkr3SrRSy4T4qY21V3E6B5bpWDEBmAPQ=;
        b=7J7u75yKVSuqd0UYzMvUgVE7y5y9ICz3pNWo3y1/Psrcu2znyuO958CQfW9ybymwz/
         RlBxHLLA/w/6mWRdRgqYe/rCjiWex4FH2obPOWA0udgimrv9hgNyEHI+FoObGFQPm2Xb
         XX9PEZUBEfm7gjqvzgrBgV7F0amfDrX1IQILeR+Hua0fnTLMZACbCB7cl/8BC7A5gbEQ
         PI71HVgh8gxybE2mm1ZA0JDuAmUwGxH2qbLtOPaaOR3aMdF+JAI0RU7KhHC6XbNClk0x
         MQMGEuEBCipFfb9k4O6z0aHUbGZmZrOjfYpiW4C9VB0adi/KiULOKP2rVDJy8eHn12/p
         JyrA==
X-Gm-Message-State: AOAM5329FR/DAldNv3BBz7y2YUotQrkRgg7EsHEJwpQMBbMEdLhxxDBp
	AkMr5dcb/uB2NUiGRAO9C5d+uzB7aOk=
X-Google-Smtp-Source: 
 ABdhPJwPXW4QWYHrREW6mtgcw9rRGh5vURg/dG/oIP8HH0j1cDKsIeUgiaR5WmL9y9F8Ez/IJF2a2Q==
X-Received: by 2002:a17:90b:2248:: with SMTP id
 hk8mr17291686pjb.102.1635592568657;
        Sat, 30 Oct 2021 04:16:08 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7535:c5d2:16af:d4db])
        by smtp.gmail.com with ESMTPSA id
 w12sm13880162pjq.2.2021.10.30.04.16.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 04:16:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 11/14] ser2net: upgrade 4.3.3 -> 4.3.4
Date: Sat, 30 Oct 2021 04:15:48 -0700
Message-Id: 
 <8cb8c9cea8a05547136f145320bcf428b91ac37d.1635592420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635592420.git.akuster808@gmail.com>
References: <cover.1635592420.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 11:16:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93668

From: zangrc <zangrc.fnst@fujitsu.com>

Fix a few minor annoyances.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 082e1599e559c3c93e2d38459c779d377fcda142)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ser2net/{ser2net_4.3.3.bb => ser2net_4.3.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.3.bb => ser2net_4.3.4.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.3.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.4.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.3.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.4.bb
index 87b5b15b75..fcd2546472 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.4.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "f5be52033a690bd0dd711209a64ebaec024ee4542b1357350aad8489dc2bf720"
+SRC_URI[sha256sum] = "c714d6777849100b2ca3f216d1cfc36d4573639ececc91d5c7809dfe27c8428e"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1


