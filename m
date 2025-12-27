Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF02EE8FDCA
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 06:56:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4537.1766818604398692907
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 22:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJ3ycrXJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so79828405e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 22:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766818603; x=1767423403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCpOpp3nw4mZiOzbSP74MmtFWNrAY3jzrrDED8aGG7g=;
        b=OJ3ycrXJW7/F6k/ZdLu+CR0rI4VrMdRjhZNI+edBECLMtyhgI1qQhOEHvqA/CoQuvx
         JY2pJO1l78++xbgywE6GUr0Bu2FDrVbNepsxojnlyYuduI/hELuQU5lOae4i8zE2/iSj
         qD7GNJvqtL/6eerbkNZl5j7ut686Qk5oMCGCFKvBNA31UePooEUs+24lG78BV+PKIEsH
         vBUFX7NG//sx8ORUrElZxr/XeztIwKNR2Jcse40/vX33UHDECaOkR1td4BX0Raf+6mkY
         jPKNzhahsw2peEQTi/58vgrrDTHDmexCMYx6mcSB9/dnnXRjObriv2YhhZvP8gbA440d
         phHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766818603; x=1767423403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FCpOpp3nw4mZiOzbSP74MmtFWNrAY3jzrrDED8aGG7g=;
        b=rcjQ35HotpcJvFY9LjUQFlB6K8mlol/p+wa6N4TtIiK0e7P0KdMQ7aD21WJlOR4Njw
         WXKATW5qzC0/fChh2z8AxQOFIuqxNywxa9V90dNggk2oHTaFt6K6cD1Zvt3hoA+xi6D8
         CiOzQ8Ns4wn+id0oAbcy4coBZfq6IJ/EV6CHnFAxA49xFra/QGrXNyZmhJ9frhxQ6OWS
         n1+sseYedVRUHJS/oCl54JgF914k/6K57MJTZI8AaYPmiH2n+NdNsiFe+Z3OrCZIHOgB
         +XWch8tR7agH2Ujg3zdkYYevUNaeBQ0WpJ1tqI+n/MNzcXadB89xfyoV1nmUu7o+HmKR
         MKAQ==
X-Gm-Message-State: AOJu0Yx1hbUyQ/GsEOwt8tbFfZvF6ezTqzMRwhMf4Jjm8/hHKzZ80DBf
	0wBjkHSLzVU1/Phihy601HA+U8EOtllFXlFxq/t7B/knNK5//KE8Ii2lm26I6Q==
X-Gm-Gg: AY/fxX7coOftjPbZYb/5mjZV0aVbYNUtTgHtLqsWv8/oLa6cm2cT9oLBK2pERv8iiLj
	tqMEwR0Wo0jM492nCHjNZq3Z7jDmGmiyIqb2qDXy6Cyw6PZwz3miROSXIQzMks//l7jBdAw2dXH
	Nj/hE33ImJkNxzfGe867q7Uo62p0d9epX9CEJ3D4tfVDpfqqITm0gGY6+1M+NllOqXcmpelBKs3
	mZBpjm03eYWp7xvpLviiJJQSAXHlPgdirAcTesmr7WVwNigDr4pbqETpoVqNRe48eSuossVXHVq
	z3+M9HPlre3oPmaC14QQg15g16JhC+O0jcORLrDXiswlx+pc9jLc5j2a7ZllZQY48nDbNdt27JO
	Uzmp1ehZj+Z3GHYqUVs70MFXj3Y0SNUX4SyMI3ZB+2LL/gDZi56Idh31mVkz7L6TDdEEtFHNWk6
	CmkO6EAKy8
X-Google-Smtp-Source: AGHT+IH39bosQs1srAlItA/78xBIRZk5PQc9aJm8NV5oUSUqHbwgtduM/j8BYt+GJAHv5xP4TVJ/Ig==
X-Received: by 2002:adf:f392:0:b0:432:5bf9:cf22 with SMTP id ffacd0b85a97d-4325bf9d1admr17857828f8f.3.1766818602715;
        Fri, 26 Dec 2025 22:56:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm48902371f8f.31.2025.12.26.22.56.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 22:56:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/6] ncp: update SRC_URI
Date: Sat, 27 Dec 2025 07:56:34 +0100
Message-ID: <20251227065636.3144581-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227065636.3144581-1-skandigraun@gmail.com>
References: <20251227065636.3144581-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 06:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122947

The https link does not work anymore, it just refuses the connection.
http still works though.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index 516beede5f..ec6d918744 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libowfat"
 
-SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
+SRC_URI = "http://dl.fefe.de/${BP}.tar.bz2"
 SRC_URI[md5sum] = "421c4855bd3148b7d0a4342942b4bf13"
 SRC_URI[sha256sum] = "6cfa72edd5f7717bf7a4a93ccc74c4abd89892360e2e0bb095a73c24b9359b88"
 

