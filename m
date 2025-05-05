Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228C4C3ABC1
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.45395.1746433911993196816
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 01:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l3+Ey5IO;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so3303817b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 01:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746433911; x=1747038711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNzhkZxgprF8meM67E04MxVitR+DqzMECL2R0fXMy9E=;
        b=l3+Ey5IOt5RdKolQ6j5wH/Dg8niHtI+YDz9ne6NQrbGarSjBATOU8oKUPbqQ9hq8QV
         InmWjSkTysFfQSQxgDUPVofdvV8New1i0xwLKxnsCtHSQ1tBYF6QFQprQA2Ntc7g3IjJ
         hnfDuvY8tb0iPJJQnVxJSwdEyJ89YsD/+G+3XwJbXCbTWAW/A0eWZ1J9xqj36kabVNkX
         4xcpczCddEdNDSpNgD+Y9WEKSl6jOIol5l60BI6vDasdtehN5CQyfxJ20oA8FHNAhUhF
         tWK4liV2xCjOQPYq4u4u+febfu0rsabaSYgoLLJwEDMfy+sJ7liruAo70LmmIZT6mL60
         rSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433911; x=1747038711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNzhkZxgprF8meM67E04MxVitR+DqzMECL2R0fXMy9E=;
        b=TrX+kW/YsU+VpYNvUUpQ5fR5MlkFAjxam2qcuCY0mTbrNlADjCjSVhGjC2aQ+MiBIG
         zHJxeasIXssbw72cQ/eRaB5ayks/V3CAxESG0ext7422ccxAAu2mTv5eXNwEhK1p4e17
         j20vgCLVBic0IaKXgftnbszJaRNlE+n9fOgmzc/CB11X0ZFNkFo9XA+aKlNrni0vtI4v
         dyWydLv4cUOEWgAqo2BFpaxl36ocXBvjyAaQIKHFivQcCJPqsbIvGFx8xmOiqCCWg0ji
         XArUYdWySwmPesp+POP6dYchTUkSTbz8u/Izg7kSsvOU5brf9yDfczdIsTTV3zXRr7zo
         w8Ag==
X-Gm-Message-State: AOJu0YyI+04eJkYXa2h4Umfx5LIWGShRouKlS3ObcUA99reTTUIy4Hxx
	gt4HTIroti/6now+CsY3MWpygNPXrnSNMd+kT68mrkew1ZbwjF6G0zSGqg==
X-Gm-Gg: ASbGncvO4+/TgkH8HNajtDlkKc/IrT2fQi8GcAeKKTdvoOE2WQj4mcyUUkqtLNMETKM
	awa25q2IkhwdO0/W81enurNAOolwjmU44dLwq7MGByTQneiRBCfikQkFoBxvzBSdaefdFd5BBUU
	yC6TfzyiJf31J3cIhkpVG+87G7zRQxpgh2uDG6PsmWGhj2I4epUkXLWt6yPIzuia55WQBba9+Hz
	/4KCUxhWRvWp+ZcXNN3HZt6d+CAtTU4v3o14QYcDWJ7dhedb2Ce197W/9S3fLFDNbrypIIu+7Ww
	f2x5BW5wMZnuMdEbwbC4mp52T0z0Vbe52oAw6e8gILfKsXj8nC+E3sRx5kXcE4c=
X-Google-Smtp-Source: AGHT+IHe1Ugu9HBAXgZNgcGotjHkOfF6rxerWb/PnXE/5crA2UtxDV9SqwWF/sPgkWsXq0E7/QxCdA==
X-Received: by 2002:a05:6a20:e608:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-20e078048dbmr14600031637.34.1746433911193;
        Mon, 05 May 2025 01:31:51 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020f4esm6153977b3a.112.2025.05.05.01.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:31:50 -0700 (PDT)
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 3/4] Updates the SRC_URI for avalon-framework-api recipe
Date: Mon,  5 May 2025 14:01:12 +0530
Message-ID: <20250505083113.815950-4-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505083113.815950-1-emailaddress.ashish@gmail.com>
References: <20250505083113.815950-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117307

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/jakarta-libs/avalon-framework-api_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
index 081cfe7..e7b4d55 100644
--- a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
+++ b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 PR = "r1"
 
 SRC_URI = " \
-	   http://archive.apache.org/dist/excalibur/avalon-framework/source/${BP}-src.tar.gz;name=archive \
+           https://archive.apache.org/dist/excalibur/excalibur-framework/source/${BP}-src.tar.gz;name=archive \
 	   http://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;name=logkit \
 	  "
 

