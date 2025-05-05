Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BBDC3ABBC
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.46330.1746436442910170262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 02:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zs0x3yP0;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227b828de00so44413405ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746436442; x=1747041242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPCtOIhn/D8U4BVvlfV7hpWlYPOYFyCFv4cHsvumpbI=;
        b=Zs0x3yP0eli2rztyLzUhO8cKdRrTc5gJpoGNT+8nyfzcN+yxqaHTJqy7GYXsT4y2kK
         oIaHhE6V78PIPIPmIbZ4gUVyxTYN9JBoxCL0DhKQoqpsiPy9CEYEwAsw73SLwQSUUWYn
         4VdibYLqSEYFTwEAgM6xSkjkeawLq4gVx5LFtzTk16Ezd0Iu5hfPokLluZFH4Mp3cbTK
         WLj1ti3VTtwTCvGuPoolimNK7qLtG3PTzxqB11ZkPwoXC4NxIrADlXorRdtPrKsZcByk
         efd9o3iH4dhq+HO463oDB7wMycSwssUGONRmywjX8LC87N3oa8atpRVNKFl+H3By46r6
         IUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746436442; x=1747041242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPCtOIhn/D8U4BVvlfV7hpWlYPOYFyCFv4cHsvumpbI=;
        b=lsLIPZxqOgAtEGoOcfByH/A3U6QkpUNaiVY8q3Hbim73v92No5BZkFSwuYUfw0L8Ia
         I5RyJJQAp4IMR/MR1IL1fjnJjuQZ3lxOcgCDJpK2NKKr5P/vC1L7QET5CNQAJYbUGxAV
         eNehGeEQgrTpX0XZCfOh6EwnkRCS4AjFfQRD100qYlUsPrSWGx3GkMvQZ0jgjcnfbZ1m
         x3pb24L+ElUh/DEYVUxHEc45ZTLycGDDbsG6OCEMGblkQFnMjoJfABblZgHvZ7t6H/2U
         mkkbAopylOUxpuU7E5lcN5pkFnSa8e+0CAXVtdUkFhaOHMyjt8Mr6slIfxHPNZeKU2EU
         3FIg==
X-Gm-Message-State: AOJu0YzeDmdHURh8FdvzeUmMrwWUiIXpzpzFcoi2cHREjm7yWaFNw7Qx
	X4zTZgYW02a6D3B4vr3xKsNQ5SIjqdfo4Xx+/AJ/Y6DdBXPj6KTr2IHwGg==
X-Gm-Gg: ASbGncsik5SYHbRa9pAHCKKbUjs+sShq+jQbEzxSpvqz6rUXtvU74vTqY2G4l5zz14D
	/up5QvhjqxG1L5+c7t+805jkXSkrvpR66M4o/0DBUAp4mOEyRE20WMs4S12PjQoQvFUkEZ6mw+r
	z1/tYHCioZIV2DskzE9nS1KMABb6p/TphArTI3Wm/Xa6UAcfNFEGElQ6mVacNvs9jU6fFnuSFIf
	dN4Dmy34W9nvxNHbw3GA7LGt4AbgTaQ8w+cU8SDzNS9XbkUsAAWpMh7uv9kReKVUHB1KoHK2+V4
	74mhh1Bq65iUASo2Ua9QrJ2nKenjYA5x1c4dW03kee+oJlLJToziE3RhjGaDZJw=
X-Google-Smtp-Source: AGHT+IF1lQW6/gLzyl0G/PWR7FA/e+dwHpL2Uu7/gygXck/OlaWtGReMBmd5w69Efje7At+Md3tUgg==
X-Received: by 2002:a17:902:fc8d:b0:224:584:6f07 with SMTP id d9443c01a7336-22e18c391d5mr127728115ad.37.1746436441982;
        Mon, 05 May 2025 02:14:01 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e9eb3sm49863955ad.91.2025.05.05.02.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:14:01 -0700 (PDT)
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 1/4] Updates the SRC_URI for xalan-j recipe
Date: Mon,  5 May 2025 14:43:01 +0530
Message-ID: <20250505091304.819905-2-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505091304.819905-1-emailaddress.ashish@gmail.com>
References: <20250505091304.819905-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117310

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/xalan-j/xalan-j_2.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb b/recipes-core/xalan-j/xalan-j_2.7.1.bb
index 5e72a34..a1f4ea2 100644
--- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
@@ -12,7 +12,7 @@ PR = "r2"
 DEPENDS = "xerces-j regexp jlex cup jaxp1.3 bcel"
 
 SRC_URI = "\
-	http://archive.apache.org/dist/xml/${BPN}/${BPN}_2_7_1-src.tar.gz;name=archive \
+	https://archive.apache.org/dist/xml/xalan-j/source/${BPN}_2_7_1-src.tar.gz;name=archive \
 	https://dlcdn.apache.org/commons/bsf/source/bsf-src-2.4.0.tar.gz;name=bsf \
 	"
 

