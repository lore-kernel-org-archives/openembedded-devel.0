Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1987C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:11:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.69988.1698325883537947889
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 06:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YLTOFJTi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso12146625e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698325882; x=1698930682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHuOo9fEf0Esx2du2RNp/0fxrRSXDvSmKrSjKrdB8yw=;
        b=YLTOFJTii/s01+Vtp862kq6Y4e5U6H6XUu7O4J5RNabiEPSobmjuXKmjrKrCdZsvFU
         SKQpzfCZvSg9Fe3p6lCPy2of5gMyXc4CBrAj/BDUzC6vJoBgA3yONy6VbQFPINPELPhb
         oREghSx/bJOFcE2PotXSWilafKjJCYeC1sb7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698325882; x=1698930682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHuOo9fEf0Esx2du2RNp/0fxrRSXDvSmKrSjKrdB8yw=;
        b=NbUODHqd2d3Xy6C/1svfBuRZEX7sB9WzAWALnRrjAmLfcAt0LiJLzI62QQBnOx1g6u
         iP4HDujCA+LPVk3Y5mlcRHsw+4QP2WokNpOHgsCFRdeo6G8YXQG1NKzBPXPtkgXEoBey
         2YK54SWn2f4sFcHyFapzhCx+Oa5ASf72KkKUiapO1i63bJiPjTnIoVaL66g+zCHdeQov
         x0qO5QSPyjPNMjPH82gsE0NMpsavO8qwH88/xSjaLJ5+v8eiY1r5+pw0rZ0cEYzezl0y
         cnOe5j6FV/6y5h3t6ZCkZoB3NWoi1/r8dLiz3qk8rIwA2P4aI0yENL92r39atH8NR4Yd
         UCBg==
X-Gm-Message-State: AOJu0YyA4oQVmLUc+/tB51ei89DbW5q4+pkXsv0pUxkVfmHK+BuO8Tnw
	nkKsov5WqQm0bPT0t59EqYveRDISXY47wlAekDs=
X-Google-Smtp-Source: AGHT+IGco0kzoOf3jRxpmkra56+3prt2v/PkhrvHqNjyoZ/jTzvio3YOw6Oy2WUVDEH8Xm0wNkqMjw==
X-Received: by 2002:a5d:6c69:0:b0:32d:de87:1085 with SMTP id r9-20020a5d6c69000000b0032dde871085mr3294991wrz.10.1698325880788;
        Thu, 26 Oct 2023 06:11:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id q18-20020adff792000000b0030647449730sm14202024wrp.74.2023.10.26.06.11.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 06:11:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [kirkstone] [PATCH 3/3] suiteparse: Adapt to upstream branch name changes
Date: Thu, 26 Oct 2023 14:11:18 +0100
Message-Id: <20231026131118.1500868-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026131118.1500868-1-richard.purdie@linuxfoundation.org>
References: <20231026131118.1500868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 13:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105745

meta-oe master branch already made this change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 38e34b93c..56cbfce20 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -1,6 +1,6 @@
 LICENSE = "GPL-2.0-only & GPL-3.0-only & BSD-3-Clause & LGPL-2.0-only & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5fa987762101f748a6cdd951b64ffc6b"
-SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branch=master \
+SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https;branch=stable \
            file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch \
            file://0002-Preserve-links-when-installing-libmetis.patch \
            file://0003-Add-version-information-to-libmetis.patch \
-- 
2.39.2


