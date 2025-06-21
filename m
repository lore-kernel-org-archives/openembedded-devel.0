Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE977C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:18:23 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.8082.1750515496196673754
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C6vv44FM;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-609c6afade7so6890589a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750515494; x=1751120294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeOHtV6NLjLagddeWKHAPWsRgR3YOLzH+xmiOvvPU34=;
        b=C6vv44FM7PH5zBRkI6hLe8rwvVRNsUJ83g9MoVclLsIwHFMfXguUtrKq1MOOtI4fu4
         Dy8ccDItBLqjSSmx4hbRnn0cO8SF/hekIFwEmIfSptmbPJjnWczAdsU2E5A8JOP+sUwT
         ZhzqDyN7IJZkhd+YnpxhpbovukVVX/L32l+IuZdsOuZt6DASiTd56zGC5OYzlGnkGo4v
         f6VRwgeNwxvpUha9WSS53qENjivCZxS4BufbLW6eH42+7h80rpHZvGzmL0TNdNFU789X
         I8eSv50A3QNKLlrTN4NhJbkSFDxmnQGvDYz/rpMiR51y3f1tFWWV71k7y25hqN6oj7qi
         zOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515494; x=1751120294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeOHtV6NLjLagddeWKHAPWsRgR3YOLzH+xmiOvvPU34=;
        b=NSC25aAaTmvO1zWMpoPHB8Ym/Is39POB5ZAtdsCHJr5lA6IeLoKxm2t1WkKRq9D/2y
         iz+7QDxirzRNt055ioiprmfhGKP+6QG38wTDFkoe6oBkEcKCXEyuVjcFp0U3FeNAwiHk
         sL9mZayKUdVcB9IND6Kv+9pyXP2qWRK5Qlbp7wOPNGWwsAgpQltkheeCIwmZJ+SRNk0I
         1mVesY83s41YuFfjsbh9yRfiPjKWTasV6A2rvd/C+UNv7ZCix9rS4vcVxCHvtH4eV4Q2
         K8f5m/0VTnk39sxAQmnw0LgLTTJtTE1ZMof5CbYUNXYETvHzrv3gJPwcFYyaJ1y1jBPV
         J4Yg==
X-Gm-Message-State: AOJu0Yx+AXkzR69guNIbhfTqIMEe3qBoNsl4jJxPdCGhKoraaS9lVMQb
	Fs4ZmPcrLdYxRA8ykbxSjIpMk4+SAfyuFRiAyZMsGDFUPXxFyudbl3lldhKYWUts
X-Gm-Gg: ASbGnct71ASytY2Q4PHLnl7vs9w79JvTKw9iDkf92CqURP3zQcq4qs472owNUxvhBJv
	DL7XSD6MqVtd0yzQNTIWSDWR4rfuWEpbOQLWJtlMSolZQsLbnNB2tpdXbgXnPq0FgAGQkch5XCw
	3SX49Zej+nuYPu9W4QQNrzUGe8s/eNfmiDD80BMS845egPmyRsj7kpvoGBESEXvvcySyEhG6B0q
	fTOXZQlG1b587ztm/FxXP/MUm2AkRQHwZ5jGwvbxLuLWFCRjvrW/caewZTLeMRy2a0iQ3o7UNYP
	fsl7fFVLYYCJmg+8O0WUVpPzVgX97/LH1CeWG2wnWLPMx9smhtBkir6th8VouIZb3eclZWoHKBp
	2aW3F0+CpcoBVGPgLVaVIAsWk1NqsEqwo37xXn2U6
X-Google-Smtp-Source: AGHT+IEedcp6G0UFHPC85N3yOYe/or+8ne4C3F5h9ifFDlZmHcT2RvcTbxgabvxMNJr2F8v1T/kqIw==
X-Received: by 2002:a17:907:6ea7:b0:ad5:6cfc:e519 with SMTP id a640c23a62f3a-ae05ae21ad4mr594778866b.11.1750515493850;
        Sat, 21 Jun 2025 07:18:13 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bbcd9sm381148066b.144.2025.06.21.07.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:18:13 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-multidict: fix: update S for python3-multidict recipe
Date: Sat, 21 Jun 2025 16:17:17 +0200
Message-ID: <20250621141715.3978875-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250621141715.3978875-2-t.f.g.geelen@gmail.com>
References: <20250621141715.3978875-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 14:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118009

---
 meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb
index 7b34169105..6c30c55cff 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb
@@ -10,7 +10,7 @@ PV .= "+git"
 
 SRCREV = "df5b5dbb6e3e262b9311755cf130c669e121eb81"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
-S = "${WORKDIR}/git"
+S = "${UNPACKDIR}/python3-multidict-${PV}"
 
 RDEPENDS:${PN}-ptest += " \
     python3-objgraph \
-- 
2.43.0


