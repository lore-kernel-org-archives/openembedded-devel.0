Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818A9D3F2AF
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.30085.1729278815241819037
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VN7u/4va;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e38fa1f82fso23650087b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278814; x=1729883614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcswVlgVDcztBKAmQO0Vzu8c6NaPPElcgt4+dyRDUg4=;
        b=VN7u/4vazrHhrY0MzHj1OI44AUYUYgTbGz1lBXkMIdD0AS0nH82akxacwi1GVMBmj+
         I86cBavVKrYaCG5k7F/qmk8Ck8rbDOHwPtCI7AkMjSA1qte5BKmE2A0UBGMo9rskfnK5
         iWheTOtfj9O9JqkacB6saJZlP7N5BKTscfjL1q3GJ93Y3ukjGLVLrz9DJairBk935eya
         pC0oGIIdCrONbB34L1n83xicN8UeVwlwMOy1YLo+bJK+aqvFSr7bAMZPr3/oxwLDboZg
         fkRuKCGmkQsOanUXjBnOdYwvBrrnL3+XXBiDz4BS8t9CthrCn4AZeLmMO6+YxhVVd0Ef
         qe8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278814; x=1729883614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcswVlgVDcztBKAmQO0Vzu8c6NaPPElcgt4+dyRDUg4=;
        b=prt9+6iTGarg4721W9Qjft7+v4SHrv3Iz5sC/SCmYiL5jI2qVHct6rA1jjpOAc+qBl
         e8d6OC6z+WpYDkZDpvB49U3fbANr2xekdD1Zwxqh3pH30Vqi37snliKtvF4Ke1AsQ8V6
         TXF9GUWqMwzJn/cceX0O8xhPZos8Z33bRFWwNjUHWbhnF177WNzxaNAnVVpFxNO+LKBj
         vTnag/+4R5sdLWlI+CM+XGswbCgV4aGmIBl4ZrXEUJdGJIbglQGYknUgGq3HiA6OTx9c
         z0jqrjuJGuhS3dG7DNoJ/51rVuiotESpvV0D4/9ge5IYCvYFXttZ2OFTmTYDRNQAFgtm
         PJIQ==
X-Gm-Message-State: AOJu0YzeXk20DGzMRZOShllX60ilrBjgave742Y+sxOfpvbo5d/H1iHv
	jDoGes1DJx70nlJev5iwmN4v1KhooMb4frsHrMYvC3kTOnzTDlo/oXtLzg==
X-Google-Smtp-Source: AGHT+IHADjrXBX6uga223NNAzr6np2ZKWp3Ya0oI+Ybre41AHvrDYmYO4ake9kymUj/hxUtJEJ+xww==
X-Received: by 2002:a05:690c:87:b0:6e3:29ae:a3a5 with SMTP id 00721157ae682-6e5bfd4f8c6mr41498537b3.34.1729278813929;
        Fri, 18 Oct 2024 12:13:33 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:33 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 36/68] python3-libevdev: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:23 -0400
Message-ID: <20241018191101.25184-37-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113023

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-libevdev_0.11.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb b/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
index 5ad2a5995..8c05df38e 100644
--- a/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-libevdev_0.11.bb
@@ -5,7 +5,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d94c10c546b419eddc6296157ec40747"
 
-SRC_URI[md5sum] = "34b48098c1fba26de79a0d67a17a588a"
 SRC_URI[sha256sum] = "e9ca006a4df2488a60bd9a740011ee948d81904be2364f017e560169508f560f"
 
 inherit pypi setuptools3
-- 
2.43.0


