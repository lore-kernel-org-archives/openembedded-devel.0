Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EF4C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.46023.1746436444801199487
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 02:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lZLiATOU;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso3070135a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 02:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746436444; x=1747041244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV//MsubayP8a2k4/bbRdSNjAVXtZ2pXGF7m5/BjpNI=;
        b=lZLiATOUfLruptqKJ23EZnq9gOiXxHtX8QR3x+lhP/bWGdVhp0p3z9j1huLgjMWVHI
         i44Iswcrna263nZoFBlSM1gqmXOVr+Yc3U4VFmVBE7C3SDJFAhTQ35CV2IE1ylvhVuuN
         R+QurupltVSk64O+pOn4/8aqDohAnDUOeLzRJqNHqy2OycfobULzEHUQQTUTbDBlWOAW
         tNw444d2VBYJYoTqmsbirn4Q9TJq6OoME+LZFMDN3uIw13a+1SbinJcsDS8+xkg21B7L
         Ba3Zud/YySG2FbwpLFVmkYZDCOrY2Wu1fABVB8RSmcV18iLnyv037zFBOl679S28pYNs
         zZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746436444; x=1747041244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JV//MsubayP8a2k4/bbRdSNjAVXtZ2pXGF7m5/BjpNI=;
        b=YrFSYNPb8p67BdV9xcPOnJu2P5iz6EflemS2K7NeioSFtqyyrePYvdGP9X9hD6Vx0x
         clIn2/P3g6I8m5Y57mQlUNZuNpNrP5ZP127X6DPfR3P81vX9Kkih8+pJKU/j1jyYHJs6
         /ZKItgehKrv405ruCiPsjZHcG6b2L3MSBzyVBMwp8g2ZZavKwsmerZZBNYnE+gkguic+
         xPCkOLB9lWB1hQK7kBMeAgVFMub4tazL0di6kGeA91eClrpGJA8nUALwFTil2K2zqiFs
         YvWNvsD6bXER9AQDfPeliDvPg0zBIMXq49iEXrv2jZABBUwosI16KQlNNzwckeMLVqtK
         hqQA==
X-Gm-Message-State: AOJu0YyL3ZmlXAvIdVroNXzzNApplo4ovZxjttNLaCMMzHwkAjEDiDul
	ySiwFgyy8G+hAMwzW76iX5LL+kaWdlaBjv+v7vgpwJZzmX5wNa3G9NLOdA==
X-Gm-Gg: ASbGncvcL0AlPyeh4csNy5NIvV74PDcxiX2RVxaLGLKWLkUiMPVMChkH+kTB/GcZLIO
	NxaUYg2BhvhBWj5oYattN0v2vZ4/KvK6+IIxvpmznQFsNKeQlEHDW8nsyE6hB0IFWviGNUKv2/h
	yTmWTdImOEhC1k2+FZ2Aj2p2CUn0EojmzhTW7WUsS+/r3wgTYYGxXQgR4IxGzMpOq0Q/TFfVygq
	hZzU6ixPxlPSpY6A0D3TlqwWoNJPiwXKwrBIr98tk6haKG8nCaCoM8bm8YdeNJJK0nq4r+jI34S
	ZN9KkNfGZAKdQLBFG51Z/rLloIfhhWcCnNmEpUxD5hb8q8NcjaFL
X-Google-Smtp-Source: AGHT+IGrIBnj3sQBvgx+ZlgXzRSD03oaCJaAH+12KrnD7nzk5OlQgTqShKIGXv41f0YI/CjpFJ03/g==
X-Received: by 2002:a17:90b:2dc1:b0:2fa:1a23:c01d with SMTP id 98e67ed59e1d1-30a619b1476mr9257979a91.21.1746436444106;
        Mon, 05 May 2025 02:14:04 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e9eb3sm49863955ad.91.2025.05.05.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:14:03 -0700 (PDT)
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 2/4] Updates the SRC_URI for xml-commons-resolver recipe
Date: Mon,  5 May 2025 14:43:02 +0530
Message-ID: <20250505091304.819905-3-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505091304.819905-1-emailaddress.ashish@gmail.com>
References: <20250505091304.819905-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117311

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
index 0fafcea..790b2e7 100644
--- a/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
+++ b/recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 PR = "r1"
 LIC_FILES_CHKSUM = "file://LICENSE.resolver.txt;md5=d229da563da18fe5d58cd95a6467d584"
 
-SRC_URI = "http://archive.apache.org/dist/xml/commons/xml-commons-resolver-${PV}.tar.gz"
+SRC_URI = "https://archive.apache.org/dist/xml/commons/binaries/xml-commons-resolver-${PV}.tar.gz"
 
 inherit java-library
 

