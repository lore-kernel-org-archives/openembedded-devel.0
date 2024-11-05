Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA48CD40CF7
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.30407.1730838974370215789
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q0YsZfmr;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ea85f7f445so32151537b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838973; x=1731443773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqtadplHia1SE/6mOInqFP/7DP23eFoc/PeYMI26/yU=;
        b=Q0YsZfmrK4GwlR+amz8V9orBj/SMdl8ynPvP8iaGGgn48fHAfvcONN4eJyVbbBRDBc
         q5o0GqM7sIF+wkO/bR+ArYmqqW7NBMbFwo6VC512PHmRPHeLalcdiYYLnJ18NMpvtReL
         NeHQJCeEWgHs3/34B6fVT4H8DWCPtxh6nBdkSTa6LwOe9guf8K4D3j3PTNBVzf8pb+w+
         +yY4qgbuiwPI/1vj2p7AAGxeAbOiTfm9AV1gQr7bhwThd+qoM4XeKtsHSiXWy65pzdpu
         3c7tHF7FqKJnQIOAll1SsXmU5RvHj6Dq4OTLXckznEG2QLfa9sNyNXyjUE0Py1A7G6xK
         Nhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838973; x=1731443773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqtadplHia1SE/6mOInqFP/7DP23eFoc/PeYMI26/yU=;
        b=rGq0VZrJG9ARM+OB2wwB1iTDWgXzv+eSOibXAwjkEYc0WPfDbkS+q0I6ywjThVGhH1
         PFwE+X6hgF/qQ99Z0mm95zTl/2OR9bXiSrvZ/nx3sGxiDTfD2VIkNVnFtTeslhKU5wuP
         KsGwe9s8NXHmUxXhQc+hqjZRUSZt9HkPoSEYUEc3ikws/iBjCWV7ZdwfGysGAKzz8dsE
         mxeI+fVec12OC9hKh4IADwiHvPlbSxtGANFmGdAYZ94A4qsjnSmeHuMc4TGyNVBZus13
         H16DJH3p4O8v08CDN5vmBmeP17tqLr5AfssHrA0eKzix/9m/0WyFwtFuu8ujaAtqeK1r
         SG2w==
X-Gm-Message-State: AOJu0YwBh6nJasCqjhqzWEwXLn2YRfXx3FWxuQ2QKfaxsRyKNyvT/Dnz
	13pn94sZgEB3EJuHk2nNRuR0sZRyf8vZfebl1i6O46DGXWExusgD2tyjIJiP
X-Google-Smtp-Source: AGHT+IFms8lVVehhaGmcRFEIvEAVSAcgHfrkd/Xo8eS1IyGCC2zrGDfKyYHuwxmcPrxj7w13Z+eKDQ==
X-Received: by 2002:a05:690c:4989:b0:6e5:a431:af41 with SMTP id 00721157ae682-6ea52540af7mr214963917b3.38.1730838972965;
        Tue, 05 Nov 2024 12:36:12 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:36:12 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 132/161] liboauth: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:57 -0500
Message-ID: <20241105202827.3104-132-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113649

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
index d4b817087..3e3f9137c 100644
--- a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
+++ b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
@@ -12,7 +12,6 @@ DEPENDS = "curl openssl"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}.tar.gz \
            file://0001-Support-OpenSSL-1.1.0.patch \
            "
-SRC_URI[md5sum] = "689b46c2b3ab1a39735ac33f714c4f7f"
 SRC_URI[sha256sum] = "0df60157b052f0e774ade8a8bac59d6e8d4b464058cc55f9208d72e41156811f"
 
 inherit autotools pkgconfig
-- 
2.43.0


