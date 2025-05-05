Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E702C3ABC3
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.45394.1746433909267449674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 01:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gE4xGTZd;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2255003f4c6so40431925ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746433908; x=1747038708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV//MsubayP8a2k4/bbRdSNjAVXtZ2pXGF7m5/BjpNI=;
        b=gE4xGTZdGB9pevhPtqTnHgEv6+chXQxxRON9NubJ7HhLCuPRmM78P2xwo21Cmu8rAS
         3Z/VAqJvlufIta1FdmjOBN8FOLB2qlT//RP+nm/ciTsHw4iYtw2DYIbNJ1bSINMVg1Rf
         YS+gBNVcSOMDbmx6t7Lyc3eaIzshZWw09g7WKmjUVOfUNUrc7dGHFn1dHz4QIcStyJGq
         nFzEBrpoThUKVoC9DUHEomKBtv782d/OX/Q5CvPHqs0F1osKMW6GlVw3a9WXrNXReanD
         wmElbCdHsHPySDgvuU3rFo2PVlWovL0/HxIMYYY+mZbzVcuRLKNKlVT3kSfi4ipXSBrs
         9pFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433908; x=1747038708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JV//MsubayP8a2k4/bbRdSNjAVXtZ2pXGF7m5/BjpNI=;
        b=fjQel1k3dxhrT5ys2r3+yRvgt12ZSua5RrbFM976zN2NaInh1sL4tlZphGvb/mfgnf
         LJPZiW9/PEG+YQJzuArYkZxt2ycydGPD8iN8CEzRcsJuHbH2j3urhqoJ5LQKd6HMMGk8
         PCHcF/KRFcZplK8cHzE4KaDqGLEt8M78W+TwFzMvWa05WXnaEMKzkte2m8c5sP6zH3/e
         zZT6rNf03m4Ll2pUmSr+8kEwPP7uv1CiY6xyFz57UF3LbDLB38vL5XjhbmHAWo78eToJ
         //a5GWvjSzXkc70XXN3T45EteJCBQjAV5orWLu3fxNIvxmxyMZattl8hm0Lz1M9ss/3z
         hI1w==
X-Gm-Message-State: AOJu0YyVPuf6ehoE4Buiyv1Iq3N+fhW1sEoGxtM5S13wUfUnFCbhTP7s
	6+C2171E1NjktSo1cIBlGTwJJ533yS6IIzpD1wCzloo1M5aj+1mLoKXhoQ==
X-Gm-Gg: ASbGncs5SfaN7KgxhySl0LDvKZlop5mhH9sVW1AZ7SIt2iRmc7EyTwvN1340r+wX9/i
	OfyvCYRoHvBh91YxuuheM6qZ8syz5JCVFQlRvU9jkbwMkKeOxoQ+FD+PKc6FQKxQs4hnRYUceXT
	mZvzgevqZF8s7Dxfb2p8zx8WUksZwz0Kcl2VV1MeTI1Y1QpQVozGihowwcVqCnNObjO57BlbjQQ
	2JfnA/sKf2S7Lv/0v41FfraVmlct/32efAxzGAXs7tFbD0HD5wVBBui+Kov5xX73ccLbnH7Aky7
	/C85OCmVaIteSEol5sZQRwGzshvznmgftmrPFc8Qn62sbb/GNZ2s
X-Google-Smtp-Source: AGHT+IGJYmCvnQMykYbekIBGmJO862zd53MLdGykY4wozFMls3xtPgvKN8T1r6+SlW1/1Fklhqsbyw==
X-Received: by 2002:a17:902:ef43:b0:221:7eae:163b with SMTP id d9443c01a7336-22e1037ecb5mr183189175ad.46.1746433908401;
        Mon, 05 May 2025 01:31:48 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020f4esm6153977b3a.112.2025.05.05.01.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:31:48 -0700 (PDT)
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 2/4] Updates the SRC_URI for xml-commons-resolver recipe
Date: Mon,  5 May 2025 14:01:11 +0530
Message-ID: <20250505083113.815950-3-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505083113.815950-1-emailaddress.ashish@gmail.com>
References: <20250505083113.815950-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117306

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
 

