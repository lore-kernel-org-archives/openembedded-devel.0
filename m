Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D715D3F2B6
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.30086.1729278816332338114
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EntPz+B6;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7181caa08a3so479829a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278815; x=1729883615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE97S/X/uT3RCuH8jVFPr2yYcEhspW77ilfLeKQntcA=;
        b=EntPz+B6Y65oBnkjPfUwT/Mc+OJJLOCjuu4ACJBIISi5ldaEjQ1mzvhU/8quqLY+KP
         OHm+BdpUcqCHEM7pZTfFCkBnwFNq/425WFM+EPps14H9cuEXAfQd4ROT3AGBbXc7Zeq/
         tHyPzHBxjFvFxIB5hNcWCqxej9FevbpoF++VlzzZiF/XjfbAcOVNSEaHm0ZNbF7fO87M
         zDxNEBWo6VmwkTo1x6vJbI1gqJ98Tj2ctLFGczndkYYdwBv1DyNbJLLwMAltveYwYDWZ
         hSjvDjUPRLEEX+og9eKpx9bbCYMQOwWvL/W/TN+6VX/CULn0/BzQEH7X3gMoQmj7NtoR
         s+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278815; x=1729883615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KE97S/X/uT3RCuH8jVFPr2yYcEhspW77ilfLeKQntcA=;
        b=FXf6pRF9A3v5cat7RcDDYIcpUBrKzmAZCbaMyjrhoKuowBte/aue+2HAPxc4GsI6ZX
         EwMSpeEv1zE7UYq9WkqQ233coge3zHf0OdVZejJ4+GB+N5X0AhfqnHAiptxODspw1vjt
         7arQ73OD/SzAD0uNcmRRSe4NKFAbZ9/MeDLTRx10T4nIypo+VDbdXhXjw+lZNS+/aBnX
         icYn6xCpF67HYt7v7R+ZD+VS5ZS/Ma7JW+ZLH5r9K/6DHVwbMC3gmyv+51jqPXwArgPa
         mOxpNEpiqJcRtUfordJ/CHDUu1vrzQfNdF4Dwgf/zU+SOo/VtoTX/TJDLYTz110fHn5E
         Y41A==
X-Gm-Message-State: AOJu0YwkTOJGB0+BvDNdsaRlmpXt8HWzrh62yk/nlTGRQuxI+guYA/EV
	tXqaFDcfNxpB04vNh/FWxR6MLQo6D0/TiquvlzCRYDkBM1LiaCabG1TPfg==
X-Google-Smtp-Source: AGHT+IE2ABDf7aIt8WV0VVWRKDuA6Q+X2k1NS5auu6kPRW1YY6Fyl2CBbkS71Q4D/VTnu4BDho7FAA==
X-Received: by 2002:a05:6830:dc2:b0:712:40ea:76f5 with SMTP id 46e09a7af769-7181a8d5b01mr2393567a34.30.1729278815176;
        Fri, 18 Oct 2024 12:13:35 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:35 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 38/68] python3-lorem: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:25 -0400
Message-ID: <20241018191101.25184-39-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113025

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
index 97b3e7236..288ce0c84 100644
--- a/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lorem_0.1.1.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Generator for random text that looks like Latin"
 HOMEPAGE = "https://github.com/sfischer13/python-lorem"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5301c01b2bcdeedba23645f94db2f179"
-SRC_URI[md5sum] = "e3f0064a94c13e19780eb724affdb426"
 SRC_URI[sha256sum] = "785f4109a241fc2891e59705e85d065f6e6d3ed6ad91750a8cb54d4f3e59d934"
 
 SRC_URI += "\
-- 
2.43.0


