Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A88C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:58:21 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.29183.1719413894137547268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=CYqmyC9X;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.167.175, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d55f198f1eso539551b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719413893; x=1720018693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j5QjQ1/0JU5zgMcZf2Qa1OhW3PJ1/eB8cW3kuuj64eY=;
        b=CYqmyC9X/GOLUgJsKsTIkV3C4eEC6moHl4j221qJjoUAQCPjbAIxwe0xguxjpH2RmG
         ZN9g13V24KZGQ52OJp7XYGBa8n/R1y3bUhMELrwzMAzXw4L63W4Yr8mqEjkAqw3YNlsi
         gTLXYwXmoQx0//DTsshWXnMuF63fvNfebwrgcATRjYs6YCgEFJbYcymSHjwCL1bjO74H
         q7hWfMc0OdtG/LRpHlj8/5vWo/UtbRIurv1HlTYrm759RZFrqwnpXj7tUS7rd4i8K8zj
         OUsQToZ7W6FLfFt/GfO8WwkxbtZMgr5NZPaTbDhGQdAeT3hNXsMysGAyQxAEgNY9FhFB
         k2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719413893; x=1720018693;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j5QjQ1/0JU5zgMcZf2Qa1OhW3PJ1/eB8cW3kuuj64eY=;
        b=ppOJCukvSU7chFVEBSIxi8nt6B8UNJi0/sKvepyevAFc4vgLPDqXAjZPBA28dqtgNl
         ViMkUdTFZiCjVxqVPjlqicJUcd7GbmALe/yYK1aJHYEE79Qp5VIKF2Z1FXpzxPxgepiB
         7DwXtZupygeq6ADOcMw7PIEOdQiobY+yZA6rklDDBYsb3vda8ZeZ/mjD6BcVtTwkR1Yb
         MR51awKP32b77M2W679TQnKQDdJuS9HjyB74qG3hyLgjjH00M/FCyUQIQ4rW5hJIzDfU
         foHkiQdn1rH7X8Q7n923IzDqakuFv3JBTi8DVw/1GdpuY+723JiutTq893SMZe2nK1EJ
         QHUw==
X-Gm-Message-State: AOJu0Yyfar8b1bYeAi2N77Oz+1k1Nsu/+ju3M76klzisTBGc+gHMv2Ck
	sxpODoH1jUJv3+I9S6s8w6Gnmm6rgAZyCehx7pZkz4PmXeGKFPxgW8vwH4wYjivwux5PMy9mapt
	w
X-Google-Smtp-Source: AGHT+IE5JL8Ivv+egDZPi6ioYPUlOt8DnvA1Ifu3Iyk1TMeoe3kw4nOwTx7TSnEJPDa2l/VN8cSbHg==
X-Received: by 2002:a05:6871:5cb:b0:254:8afa:6914 with SMTP id 586e51a60fabf-25cfce4e5c8mr12893162fac.34.1719413893342;
        Wed, 26 Jun 2024 07:58:13 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065107b425sm10015257b3a.25.2024.06.26.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:58:12 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] xsp: CVE status update for CVE-2006-2658
Date: Wed, 26 Jun 2024 07:58:07 -0700
Message-ID: <20240626145807.17593-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240626145807.17593-1-ninette@thehoodiefirm.com>
References: <20240626145807.17593-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111106

The recipe used in the `meta-openembedded` is a different xsp package compared to the one which has the CVE issue.
Package used in `meta-embedded`: maemo xsp http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/
Package with CVE issue: mono xsp https://github.com/mono/xsp

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
index c611da48c..32f7bae0d 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -13,3 +13,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "2a0d8d02228d4cbd28b6e07bb7c17cf5"
 SRC_URI[sha256sum] = "8b722b952b64841d996c70c3278499886c81bb5012991beed5f66f4158418f59"
+
+CVE_STATUS[CVE-2006-2658] = "cpe-incorrect: The recipe used in the `meta-openembedded` is a different xsp package compared to the one which has the CVE issue."
-- 
2.44.0


