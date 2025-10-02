Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE83CCD18A
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.7554.1759409982694127997
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZuVtAk5G;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3d50882cc2so203867766b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409981; x=1760014781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4woAQ33+Jk+/ioZK1tzPIkn6ZlDGn41NiHN2juXQP8=;
        b=ZuVtAk5GQNvUn5mw5D7K00/U+mcIe5X13N9/jmjThwb180XN85qEykY2shD3bRwCRZ
         hMDXMntXbxsbbHoJZB9fZuanXHlklXqiEhaNzaXomYBKofdDzK67ZoZSMLh/IJWVvu+6
         4Uu6xGGPWLFPbUxZTva6Wr0J4WJS+2uug0kRinut5Sw2HPVW9VGYdLivvcN3PV0YhUHD
         RmmHw7SwQ15eU4xkAzTpOddTz7e0ZovzaYka5QhU+yDk2ztzZ+2Clix6sg5yIvug+hXu
         /qgznmTtDxFltygKeIZOmMq2tswE8sDWTPhQIG/LUeuEipPidLhb+nuOfek8Suowa5lz
         oDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409981; x=1760014781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4woAQ33+Jk+/ioZK1tzPIkn6ZlDGn41NiHN2juXQP8=;
        b=IvgqEjGjl0OApo2KIuNYLkyTumJBDvCvNqhPC81ciYEyIFKFSs3XRU97ANPscPsY87
         RYKaUjqo5K7cm/3eyWiTp4TooebJzh6E3/RE4vemhN+5KcG1YmcIU7o/3MXdEjWXnNwb
         42EejfNeaKsDEMUzvdosxt3M9+tKoXb6NRnJkG/grwx644eSC+179FIsCEs3PRb3F2tB
         mQZyrtNT5hRizXrU9GrawIw+BWhAmUcfCUlxniY5tFh/72KZHsh4EaxyR8ncLDCxcwQt
         JYgszFXCrVdOmAXsIKIn1ArVX1JVzYitiKjSwjaRaXAfk18NOsyMKfMW9dxS3ozXCq/v
         EYIw==
X-Gm-Message-State: AOJu0YySdLRACPUW3++nnLg1Z3RuWOMjhlHRBle+J3Je7gQmlB1hoYRf
	J7JYTFFjPSPnPNV91ssQoyq05hMHdOismmrLCj2m7qMneACAiW5+iq/EA9mL5w==
X-Gm-Gg: ASbGnctuCBITYHCR2eOq1G1YX+QIRh1ry4CZcb8lMY8o52pePKBtF29HMjSn1ViKgiF
	wE5BOmN0kBdN3pYeOZiB7HnXezGEKOeEuPMYpMI3lbTiRTcSWmr4TW7njoNi8e++5z0lEHM+nMu
	shQK5zFKTHJksTC2YNu0qF7WPMMHlD2IFlOIWfSwvyVNh0wg3lX0FeIEaIrO5Fj07SpCj021h3W
	fSeX/mCZ8/GhzVhdWlhnKyEMvV0KARlvcajlGn6vemudo3Xpx2AGoD1hybFyVimHs+LJDn++8Ed
	pTIM50WMPoddmhN5MnnX2Yy8w8xzeNlvO38KMYPnxxwuBn31RAll1hfqS6l3xDkSs0mxdomRBDE
	qFfSuPwmPj2nU94VggHnGPud+LhvrP7brSD8WNf7SSzLd
X-Google-Smtp-Source: AGHT+IHOnHv859GP5pnTwyHiWaEJKSZkGj90TkiiveJernFgOa6BMHws+taB2+YXUOXJCdRu3oOpRA==
X-Received: by 2002:a17:907:3f9e:b0:b3c:82d5:211c with SMTP id a640c23a62f3a-b46e5d3b5famr925543466b.27.1759409980859;
        Thu, 02 Oct 2025 05:59:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 18/26] libcrypt-openssl-guess-perl: fix syntax for PROVIDES
Date: Thu,  2 Oct 2025 14:59:18 +0200
Message-ID: <20251002125926.2624522-19-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120187

From: Yi Zhao <yi.zhao@windriver.com>

PROVIDES_${PN} -> PROVIDES

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9d543525642a4369f60b9d3ea721e55d0a605fce)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
index 3f004bb2ec..d64fc296e2 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
@@ -29,7 +29,7 @@ inherit cpan ptest-perl
 BBCLASSEXTEND = "native"
 
 # for backwards compatibility
-PROVIDES_${PN} += "libcrypt-openssl-guess"
+PROVIDES += "libcrypt-openssl-guess"
 
 RDEPENDS:${PN}-ptest += "\
     perl-module-test-more \

