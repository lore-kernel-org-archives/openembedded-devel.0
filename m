Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12598D2C112
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:01 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.19532.1730817413284888855
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kvxPN9q4;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea5003deccso56594387b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817412; x=1731422212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpC/eML3C4qIw27YKVvgWZ9zAJWfmyN+erQH1wl5Nsw=;
        b=kvxPN9q4ydhTG9cK3NcsLtu516Pc7VomxDjHUI1jxYG/z4/M+gwRhhs6vjNFSfkE49
         WG0PO3EluXWbIsiCOXfPrd+wHDgZKQUOK6XaHp9zm8kaAU2wyFsE6kSgcql0nifTDmm8
         w31UaWO1Nlc48o4kPXBPB2JcYM1U2Zwp90oQukKdxiXIkLizSGENkeS5OxTv/OEkJYS9
         ruMccgnynHFlKfwTEJVpIMsZA/xhuoKrvJEz4mPbb2XM6fqeeTEBFI7Yz9bXH2S4iiPp
         wFuhUEp4bnSUsVVTkUeVuv1EHoEgf4j4elSrBoQ+VsbADkQa9OLzjYgNG+CZpaBONLrn
         +CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817412; x=1731422212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpC/eML3C4qIw27YKVvgWZ9zAJWfmyN+erQH1wl5Nsw=;
        b=geFOOPQx+IpjrIXYsOj7WyYDYlOORoUKTMo9YrVMEzDaqUN1NkJ/PpFO+QafUoqvWr
         NoYSCdd0I7Uw1f15rZwrmpgb5iR9FXVDvk5OnBuJzJyuwwZW3u8cDUZifS4rVkmiqfUD
         3tMEaGb0+K/Sj6iCja2VFWyYkutywBE5gNcEXPXCuOKIXVNqkZ7wJ8jEREokwMqp22gR
         8eMa/FPJiTza5Ff+cH8rtKC9rJq7ZReMib1x9s2rGwBgYt3/M7hjeBdhbZXBXQo40AY+
         5SsJkFXnSKfDVDvU4hvrEzYqhZknbD74J+0jXlkJ8vuTRNFEKDcCa00wfn2vXQ+gIsZg
         eZwg==
X-Gm-Message-State: AOJu0YyN3Ssws0+DuwoZHojAPpqX/AnUs1uDU3zpXs2lLAGoGcd5KNRb
	LruVM/Kiodv3msHM/G5FX6AhfHOuT4VLYWAbP2YPpbMTIT8PBUHRn6/iVA==
X-Google-Smtp-Source: AGHT+IGowMRtZF0PJOu7RkpSpisBJWoXBkOWMFFeMxfESTxvE5XqCsZToBRnQ+ndr5OgWHZkk31mGQ==
X-Received: by 2002:a05:690c:6c93:b0:6e3:153a:ff62 with SMTP id 00721157ae682-6ea64b36578mr179070937b3.23.1730817412349;
        Tue, 05 Nov 2024 06:36:52 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ptak <quic_ptak@quicinc.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 29/90] opencv: upgrade 4.9.0 -> 4.10.0
Date: Tue,  5 Nov 2024 09:34:54 -0500
Message-ID: <20241105143638.2301245-30-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113447

From: ptak <quic_ptak@quicinc.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../opencv/{opencv_4.9.0.bb => opencv_4.10.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv_4.9.0.bb => opencv_4.10.0.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb b/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
similarity index 98%
rename from meta-oe/recipes-support/opencv/opencv_4.9.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.10.0.bb
index 1a873ddef5..07bdb37b75 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "dad8af6b17f8e60d7b95a1203a1b4d22f56574cf"
-SRCREV_contrib = "c7602a8f74205e44389bd6a4e8d727d32e7e27b4"
+SRCREV_opencv = "a7d942b681c5edd0cc27407d8e4d3dbf36c7a40e"
+SRCREV_contrib = "1aab1f34815a58a5a63aee6d510fe234129754a2"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
-- 
2.43.0


