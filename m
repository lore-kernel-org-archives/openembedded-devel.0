Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22648C3ABC0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.45639.1746433914659707615
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 01:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=geyEdFXJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2264aefc45dso63511565ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 01:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746433914; x=1747038714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/EkaZoqweWApJSgy4y1hE4cEDUiDlLwmBU9HWXKOUE=;
        b=geyEdFXJ1o2xJMUOid8hp+8wgub2lHExfFxzGw9BR4cSl+WqxEDtW7ocx5yhLeTFw8
         9xPXLgHSyWCI6aUJI4cVSuIHAPkqiQRFnwbRqL4qYLBGC1hhmmunzlES/rVPuNgy6FUl
         VdPOVymVdNaF0iz/QdMUb7No1L81RJvVXHhTj800n/QSW8MxSyHMVE6fCSiBeD41ho6K
         Si9t0thOvsnusBhSbllEccK6dGmJ5gYeMAKcXEUoNLet2N0QdG6fFOFk2GQL2Dh08K/g
         EKjYpMvtadE3pEikTOfk9xnDX+ySbBfVRRHAjBVx6BN0xPQyLUoVO8yGGFkBgJFIfOES
         mKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433914; x=1747038714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/EkaZoqweWApJSgy4y1hE4cEDUiDlLwmBU9HWXKOUE=;
        b=eY6Q37JaOpPVLK7TxS0ZOMqM/az9EsUhq1dSP3wdn7dQYxxcJ2E4nT2r0XMhMMY6J0
         9gVfFCfymhzSKB8jXQ2cgOmAVUrKLsCMl3PvlBOt24y0ol2uMq+KAONjP6akfoOdZJs4
         ah9yLrpZOBIaZ8xoFaXTZjdbY9ybz6kSHJgFOe3yLYQVV6i9oIMtv8Y9YQ6N4VQVGHzx
         wYeB5TN1rlXfadXy/ACiyQ1TVKdvWFruTXirvSpbQU7B94D01tlqSEdVGKGXfB4LPztR
         IfoNJGMtP2UNtzmjdeXvLblpIpUfGKwtHsxC6TRQeeb0fcsI6iZAuiw3M/soD9CSuq6L
         LzKA==
X-Gm-Message-State: AOJu0YyQ6U4Kg9YVV0L3Wql0D/ByW+xPH5YW9Igtk5g3aAwAEW8KeorA
	ovo4XM1nFYdAlV04d9zXzI0cwlnxMhfJ0XruL6yRFIYPnBUP0rNPK5c4lg==
X-Gm-Gg: ASbGncvMqblXBQxw/NpJ404OAloM6mh4AgD2bxcfMQPhBqlx00mG5v2XlP+Kz2TR9dU
	nigXw4Ntr2cg9ehhaBtxWtVzX85b0OkXXeFVPqb5aJVuZgER8U0JHCkKARRTFGrLQ4MXiWLOryu
	LUVUkByHT+W6+ZKDdG8AE4hTecL60sNkHeuS7V3jABIENyMZsKN9bTQAnl8BFuJXxBr45K18ifA
	h929sMvusp/FyjRIHeqqOGAPej4w93G8rBrvCSsgPiEMBxy42oM4SRIPyRxbosWgEB0RjLj8dZe
	B/9vAEE2NS/cXFEGA3f+WBj7t5sunu6Ukndcs2ZBxtV4YBZtDRhI
X-Google-Smtp-Source: AGHT+IHxXfVakBhMhl4Am1stOh2+6MGeGmEYDdVXFrfpkqueNZpQD2ymavqX+FvLp2kbc3Sfy87tVQ==
X-Received: by 2002:a17:903:41c4:b0:223:52fc:a15a with SMTP id d9443c01a7336-22e1eaab925mr94225975ad.33.1746433913959;
        Mon, 05 May 2025 01:31:53 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020f4esm6153977b3a.112.2025.05.05.01.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:31:53 -0700 (PDT)
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 4/4] Updates the SRC_URI for fastjar recipe
Date: Mon,  5 May 2025 14:01:13 +0530
Message-ID: <20250505083113.815950-5-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505083113.815950-1-emailaddress.ashish@gmail.com>
References: <20250505083113.815950-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117308

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/fastjar/fastjar.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/fastjar/fastjar.inc b/recipes-core/fastjar/fastjar.inc
index 8412236..97e79bb 100644
--- a/recipes-core/fastjar/fastjar.inc
+++ b/recipes-core/fastjar/fastjar.inc
@@ -7,7 +7,7 @@ PR = "r1"
 
 DEPENDS = "zlib"
 
-SRC_URI = "http://download.savannah.nongnu.org/releases/fastjar/fastjar-${PV}.tar.gz"
+SRC_URI = "http://download-mirror.savannah.nongnu.org/releases/fastjar/fastjar-${PV}.tar.gz"
 
 inherit autotools update-alternatives
 

