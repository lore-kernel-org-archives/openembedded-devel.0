Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED77C25B79
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 17:04:26 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.91.1716397459937700299
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 10:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S6YvU62Z;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f44881ad9eso1473639b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716397459; x=1717002259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQj86n4bn9CTYZwx2xYYeH3NDXg3DU5dmQD0iGiEfS0=;
        b=S6YvU62Zfx8FbAMqCqvHcKtK46N3PxVXwJjq+ZQyifxlCp6dS25yzQdHj7op9rotQu
         /kxnyMc7H7KzNqR79aLLMFkV0tL9MkTB/9hd6XmnB0+uzYZt1VAM8j4azu2iqq+6WYxT
         w8cC+ZK0P3kbDwgC2FGJDr26y+KicS+yZgXoOYsE/1a/p4Oijo/oiP86o+3gbLmZY6tE
         9qG7IssSrA5KD7S6vXECrddyHaMcGdACdVR+L4SbpIGcuSHRXeQKEyU238TmgZjdcozh
         wnAxWEGIUSIpOvvjXcIpbwMaiaPCsoJSVlaOhK2qBC2PIFQSfys/3NkkEWei4f8YTJiZ
         KABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716397459; x=1717002259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQj86n4bn9CTYZwx2xYYeH3NDXg3DU5dmQD0iGiEfS0=;
        b=pPIbqVTq+x+UUx8pTvxkOxVSZ0bLly7f9oz6PAuN/cQ8K6LezoHyqXmwo/jc56H6AE
         XhIn99Pl/GVKYvalTIPGkw7Z/X8+zQbBdyEZpMT5pCXja/ZxeBrzsUo/FHQp6I5bUzIb
         tNwLct8PKJYxUuDLFuHmp76uiitJPO2ClSlXK2P+wObGykFYnCOsuIlozAqXKBrgl7B9
         8PSAWQyglnwWdsO9b8P6atuHaU3UB49fgaJqO5FvlPOADdH+NBJtfJ5/6/Mco/rrtgs3
         ueEzS8EAF3cDhopa0u7/FHzo5TZaS4T5j6It0ILyUQTGGM/rJJ5AnnHo5RlcFcY5fOl9
         9vgw==
X-Gm-Message-State: AOJu0YwkL4rgOrgShUTIf+eciDQ0Kl0R27Jp1uBfHnYpr/ql4NXPeFIA
	ytON+uOuxIV2wikoi1R5yeM3agNy+h0orUoCrHfNtKXBPyrXPkzueb0ntTNR2nM=
X-Google-Smtp-Source: AGHT+IGFUp4KQan9E7aFIEXbfZ0owkZet4NHMb9cw5WLT9xikDSxXvQeDQiqxAbdPEJrcGgtcI40JA==
X-Received: by 2002:a05:6a00:4fd5:b0:6f3:ebc4:4407 with SMTP id d2e1a72fcca58-6f6d5ffbf67mr2915059b3a.4.1716397458978;
        Wed, 22 May 2024 10:04:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-676fc4c98d6sm1310198a12.81.2024.05.22.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 10:04:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] oscam: Upgrade to 1.20
Date: Wed, 22 May 2024 10:04:16 -0700
Message-ID: <20240522170416.131041-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 17:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110487

Switch SRC_URI away from svn and use git fetcher
streamboard.tv svn server seems to be not accessible
all the time reliably

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-dvb/oscam/{oscam_svn.bb => oscam_1.20.bb}     | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-dvb/oscam/{oscam_svn.bb => oscam_1.20.bb} (74%)

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
similarity index 74%
rename from meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
rename to meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
index 0a9a7499ac..e20358955a 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb
@@ -6,12 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libusb1 openssl pcsc-lite"
 
-SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
-           "
-SRCREV = "11718"
-PV = "1.10+"
+SRCREV = "190d6dee96ca70f8b614932b1498332b1504632b"
+SRC_URI = "git://repo.or.cz/oscam.git;protocol=https;nobranch=1"
 
-S = "${UNPACKDIR}/trunk"
+S = "${UNPACKDIR}/git"
 
 inherit cmake
 
-- 
2.45.1


