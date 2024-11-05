Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E723ED35E27
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.27827.1730831892721664287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FfYarZVM;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ea339a41f1so50033297b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831892; x=1731436692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPTxv/qnL430iYTiCEmjYBwXmZMmxnaieVetEwAdy6k=;
        b=FfYarZVMSe7JbdmJAtfGKY2s3rkAZoD98YYZFfMY0e2acV4vU46t9JF5HO3fN7yFjn
         rPEADjSgZW53EdU1pMIX1X7bqRB61WhQk54fodRll0AIEncnSLPtImqBStOppJevmtv8
         ZIb2wwpz91/FIayiwn+FXCKoePxQOp76gdMlTznoPh6uY2ZkfxjN0x9HHEZyu+Khlc6I
         sQxjuygcOEhh/M4ZHZK7JWDsCxPJO/1YzGMl2YSTW9WJCJ91+WwrbUAgDVdOmYn9GXhn
         3sk7J1n+J4uChw+SavWx1HKcQ2LuijHIGS/lA3engFi9eppJWD8R4xuOV6iZDiZ9knE5
         t0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831892; x=1731436692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPTxv/qnL430iYTiCEmjYBwXmZMmxnaieVetEwAdy6k=;
        b=O0+HJtJlIu9TKZACWrdu50hL+pCbge8mtecf+rc2H/lfo3DA9W2bI/en2CJHKoku68
         HRLiSVRZO6Pu/a+XAUrDlw4c33blPBACz8RNMt8kXT+7U0xP/UTP1Gm4wOLwgWSiCCJO
         qnMiFRlmt0POjg5TKm/W0Cjf7H2cS0lbLfW8LIfd5pvsem6MpIMHxKHrmQq4i9tWG2zd
         EefhkeUZbZU8TbqCTju3wPq40InDSR2qCRJ61K0o6iRrsvD7mriifmehLhMBrWc1o2xi
         rLzM3A8f45UP8mgcZSKuF1PteNZSN9WOmZubG4ju7G+2TOA/R+yZ/RppkXWQUVP2iqX2
         b4kQ==
X-Gm-Message-State: AOJu0Yy2U2JCevr/CntluQgy/n4+xkVjNK0qlEBmoo7AUZXTvIHM+cjN
	1llJnBphXQ8eVq2WVRDTUg3rdB1sGOGrcfy1adISGXPYuUGabmGB7o3qjAwb
X-Google-Smtp-Source: AGHT+IG2y6c434Rz0+EMq7AAMgOAkE0ZNvhnJt8XNzsGCM+sgjhamRZb7XIEC+bE3Qti4TYxwbwkhg==
X-Received: by 2002:a05:690c:6ac2:b0:6e7:d974:8cee with SMTP id 00721157ae682-6ea52323519mr227243267b3.7.1730831891281;
        Tue, 05 Nov 2024 10:38:11 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:11 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 018/161] smstools3: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:54 -0500
Message-ID: <20241105183658.34982-20-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113533

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
index 9e5496863..38dcb395b 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://smstools3.kekekasvi.com/packages/${BP}.tar.gz \
            file://0001-Make-extern-declarations-to-avoid-duplicate-var-defi.patch \
            "
 
-SRC_URI[md5sum] = "6a9f038fb38a49cc3a4f8f14a88fb8af"
 SRC_URI[sha256sum] = "a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e4905f6a92084"
 
 
-- 
2.43.0


