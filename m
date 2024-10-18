Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F2DD3E18D
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:49:03 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.29990.1729278835378218364
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltgXgsiQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-717fd68fe33so1271752a34.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278834; x=1729883634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0dD5tGHKDamPFNQzVgad4Zkt+kEq34k7i1FGGa22ho=;
        b=ltgXgsiQ5XEjDL37mOksmFSWGRmXSJF7Pr0N3WkIcSbQKz8+dNMnNBYma79ziRlLJL
         +P+OuycLEyb5dlhSnERag14UtzHLy4S3zr967uiHZ+HwF+en1RfgqzeTJvJNEbTfRW6I
         2u4d6xoiKAo2V5hCmfRYxU8ZrHN8taGKqRjEtGqicpRXn7zBkGFc493stf695Tn60iw/
         7qDuS/8tpXmPqWRiclniN9DJXU/IPdY3S0DilGN/bZIOrMfyxBYFEZMhU0g7Xho6jQ6q
         OBgiceDb2ps4ztm8UYUJ+vBsgmAj2DcVDhBEpyDcGw2gdUDfD5A8POkyey94yhUAQPnZ
         l/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278834; x=1729883634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0dD5tGHKDamPFNQzVgad4Zkt+kEq34k7i1FGGa22ho=;
        b=p4qBxmsWqGi63r2xImHR7cVTJmtB1xDoRorOTJ31zd7NrRaVPzT+yq4Vs34jpWRx8W
         UJ7Vmazaz05A6tn4MrVCmGBypSBme/awYib8ebR97Jd7LZXNKJR+U1q06K+5xwf8QRnQ
         Ka0gx1yZT2trhV41kAa5dmgCoFXJscRfR0j7JVf+5xHr+8UGKMmwjv2t7QDSOnFV7K2X
         grT6NeUN7uKT75+is0zoap4SLQ2SvlsRbG3+4HT4dlQc1l5mC88WLJWfvR/+MAYILyVf
         qeVimhh1GB+enLmH2TETyysQ/osfwfy9xfLpnLZIMuQj2/K56MKfgj2BMLObqE6mbD6L
         kJvg==
X-Gm-Message-State: AOJu0Yw2GogOvn+xTgIgyBIZ9bIw9JSNoA/7Xk5SFrO/EcONOQQqrkXu
	U2SiFTd+aBQWHcW7C6WjMoIT69Ca3km8PUj4ilqrRfP3CRh8oes+OYAeBQ==
X-Google-Smtp-Source: AGHT+IECpf4Bgi6ODsWUxzMYzxyvIKOfIzjm4l+6OblhncNnnE1jiPgfwzta7DbHZEtIQW8RGyX9aA==
X-Received: by 2002:a05:6830:3155:b0:718:186a:497d with SMTP id 46e09a7af769-7181a5dc591mr3491444a34.5.1729278834262;
        Fri, 18 Oct 2024 12:13:54 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:54 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 67/68] python3-whoosh: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:54 -0400
Message-ID: <20241018191101.25184-68-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113054

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
index 406de2e52..cd5f67a62 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05303186defc6141143629961c7c8a60"
 
 SRC_URI += "file://0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch"
 
-SRC_URI[md5sum] = "893433e9c0525ac043df33e6e04caab2"
 SRC_URI[sha256sum] = "e0857375f63e9041e03fedd5b7541f97cf78917ac1b6b06c1fcc9b45375dda69"
 
 PYPI_PACKAGE = "Whoosh"
-- 
2.43.0


