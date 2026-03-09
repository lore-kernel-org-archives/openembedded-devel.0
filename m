Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7EBEFCD93
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:32:44 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11129.1773052355237565167
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jkF2l7FJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82748257f5fso6339433b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052354; x=1773657154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57uUkadotpOQXRiPtT+nSnjxEIRhkrHIvecswu6uBY8=;
        b=jkF2l7FJw8xR1CISOUck/bOYuYKwy9KM1jFniUm3pez4ZolJMuRr8sw8xhxEjukE87
         t7jZYuFLrNHs1/L6BpnRpbUF/1EgGo2ldGs6ByvmizaQEHz2v0hxyr5zQ4L79WNHn3Qy
         GdwbWRExzVu99Xu9qWDhVFPop0cKy3K/iL205XxjSsDW7Dsi81Ovo1/alPvvIXd3bka2
         A41YPBBZsLuB21DCOx6bi3L60oI/CH9uca94VV6/FVmkR5ToZ1CblY+AmH2tFMyKsgxd
         Wd2jyXFiOwZGQRcjy74RkRZFdMhO37as57fKR5byCj2chrhotdz6tJqvItE/W6DVXn4h
         J1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052354; x=1773657154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=57uUkadotpOQXRiPtT+nSnjxEIRhkrHIvecswu6uBY8=;
        b=ts1jmpw9be3M+jDjTEgp/+e25SEqxUKEO3dIjqvZ42gQrk1vtnpVwESvqtia6e7yVj
         Iz5HYNBJH0PSpL6ThnYNbVgM4K5T1PW9xI07RuAB8oed1jepeyPMp5yqa3e2AENyZAct
         kRgGAkYh5FDDtMKdF1pBxPbUfgLFueDn6Cl+vF0WO/0n6M8mCyP7HGhKeaeuCUtFf/lK
         OKps0eXqA07cXCJrr6aMehuXk7vRlknVCBegy9yiPOkKQCKDbhD19GK80Z3POLkM+0FX
         4/VQn/qjhJ+RRg/L0lFd28/jzkNcRxbFWcWSX+1/0ixxGOcECbTKcaevUyb33JOMraZd
         10mw==
X-Gm-Message-State: AOJu0YxmvRJkLQla7lapx7ByhTPtqD/7bXvtRe7KviYId3FIPV7ZxNkP
	RxtxI/cP1PpxOSh1/yLr9D7HnfSdmt2Mz/eHuOvFK0om5uofawGn38z4CwgliA==
X-Gm-Gg: ATEYQzzhYT7aOo+po8Ls/i4vDuVZMwSOCHhEkb0KvBUVUgkpWn4cv2oZR2kXyScpqmD
	znY0rtS089kBtxEK2eHGozRpVRScNAwG9acnAjnjByoOi1BLSRsHapShVj4S1Unrym8TWWl3Q3P
	ITFowma9y/8TA+yqZyAy1tmjlm5LQ9hnmmMXU5OUM4JNk311nBTMLqxqop1d/g1h19xq6OafYeP
	Mn1HtHJ4y8jVwvY2uWjBn8VPeML2ZzBma3nq0gDkuV2NHKKczcV4QbLWXKgY3BdN5Af/NJZpkCG
	Ucc9k5uPRwFwwQdRNIBbBtD60UCHBPqg37EDn2587K11zdDG6kgFlzWUS0kw77ZoJjVp2kAwadl
	JdCTzVMTcC5EnwLhmtMJFvhA4A2AyVAZ0gXPRFb5z62+PatzB0h6dgUwmnAWI/TbQ+KgtQfDLQp
	UZe2HKPmhdGBMsnjr0sK6mmsY4VDSfnDkvj2jeZBSZIKWLng==
X-Received: by 2002:a05:6a00:7586:b0:823:5745:cfd8 with SMTP id d2e1a72fcca58-829a2afdce3mr6714408b3a.32.1773052354423;
        Mon, 09 Mar 2026 03:32:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a463a1adsm9877083b3a.11.2026.03.09.03.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:32:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 6/8] open62541: upgrade 1.3.15 -> 1.3.17
Date: Mon,  9 Mar 2026 23:31:51 +1300
Message-ID: <20260309103153.536284-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
References: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124992

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/open62541/open62541/releases/tag/v1.3.17
https://github.com/open62541/open62541/releases/tag/v1.3.16

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opcua/{open62541_1.3.15.bb => open62541_1.3.17.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/opcua/{open62541_1.3.15.bb => open62541_1.3.17.bb} (98%)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb b/meta-networking/recipes-protocols/opcua/open62541_1.3.17.bb
similarity index 98%
rename from meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
rename to meta-networking/recipes-protocols/opcua/open62541_1.3.17.bb
index b7f5112197..1292df6aa0 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.3.15.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.3.17.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRCREV_FORMAT = "opcua_mdnsd_ua-nodeset_mqtt-c"
-SRCREV_opcua = "3eed1a6d5c5b207c531b2d35ed88aa0a4a4541e5"
+SRCREV_opcua = "41f4deef34a9d0f94fcb830e2c831a9eb6236ade"
 SRCREV_mdnsd = "488d24fb9d427aec77df180268f0291eeee7fb8b"
 SRCREV_ua-nodeset = "f71b3f411d5cb16097c3ae0c744f67ad45535ffb"
 SRCREV_mqtt-c = "f69ce1e7fd54f3b1834c9c9137ce0ec5d703cb4d"

