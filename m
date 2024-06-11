Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF01C27C4F
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 03:19:24 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.1097.1718075961154875840
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 20:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=C2/3qhP9;
 spf=pass (domain: mvista.com, ip: 209.85.161.46, mailfrom: vanusuri@mvista.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5b9776123a3so2590463eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 20:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718075959; x=1718680759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/Tv91d7SnQ102vPJF6DK4pAUwz+tTrIvk1ke0+wrfc=;
        b=C2/3qhP9ojT2vb/r6X8tp2rGnUZxWA2uZnBk/0068jzyOHGMlT3/PjWk1Zc5mPR8AI
         N/FTWB/FEFmJroslUfdnCRCorfJm/cPwxUR81j+6GJ1M//jq6tcG+aOvLZP8pdOtL7oq
         ji88wu/bNJ2SRUzY/SMKNVI9rtNcD+hHbSfBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718075959; x=1718680759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/Tv91d7SnQ102vPJF6DK4pAUwz+tTrIvk1ke0+wrfc=;
        b=onUs5bVWpHGn38sTR9Q3yZMSekfjWiH6CDBBCl4IzGvYDSwIMxbx55Vo/Rj3QtKZ9p
         7seNcBATQ2am4vpx+b7EvD4tuBAPbesfPSjZm/c/ZQG6uL8B0LNXGeRg2tz9OVpatPB1
         EczdKlsPPWBasw/RojJptvkO6sfg1dkR5oCj8NQZt/5eM674KxIc5eNJYwgf0ST65Am9
         lVfDt8nQaSxyQ9VZc9jm7vkoLknEC3JoOqzwUXIL0ZXAOkm2Syb8x4VuvRq/nGNW6yc4
         MPu/AYuw8Ydv8KQg+1fedCYiIqjED3gxcTOMmwqb/Gfau7H0fYm8fjxopCL4tqNcBxbs
         2iFQ==
X-Gm-Message-State: AOJu0YywMGO8adxfVP0J8QmCTI7eyz6LQv6fl4WSHLB8dYSv8dHgboLF
	GAPJUaSjGcYf5Lzaqmj4zVNUgSBKs3g6EOJk1XI+3beFUiZPLpPHg063RzRd8hoMDhFOLL5NQCv
	7
X-Google-Smtp-Source: AGHT+IGmkwXGD47ANk4jVNNQlYa3mhO/EaAusvCW1CMUX/gVcK1kG8kWcsGnhRpeVUihxBsqhpV4SQ==
X-Received: by 2002:a05:6358:9148:b0:19f:5631:97cd with SMTP id e5c5f4694b2df-19f56319a90mr411593455d.15.1718075958952;
        Mon, 10 Jun 2024 20:19:18 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882c:a9c8:6203:d5d2:2fb9:c814])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e4775ecbf0sm4701973a12.26.2024.06.10.20.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 20:19:18 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-oe][master][scarthgap][PATCH] c-ares: Update SRC tarball path
Date: Tue, 11 Jun 2024 08:49:08 +0530
Message-Id: <20240611031908.820377-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 03:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110811

From: Vijay Anusuri <vanusuri@mvista.com>

Fix WARNING: Failed to fetch URL https://c-ares.org/download/c-ares-1.27.0.tar.gz

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
index d0f5b30eb..ddd081e11 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.27.0.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fdbc58a6da11a9f68aa73c453818decc"
 
-SRC_URI = "https://c-ares.org/download/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://github.com/c-ares/c-ares/releases/download/cares-1_27_0/${BPN}-${PV}.tar.gz \
            file://run-ptest"
 SRC_URI[sha256sum] = "0a72be66959955c43e2af2fbd03418e82a2bd5464604ec9a62147e37aceb420b"
 
-- 
2.25.1


