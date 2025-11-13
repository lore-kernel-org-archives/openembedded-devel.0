Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E00CD98E3
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 20:54:43 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3113.1763067280278102008
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 12:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l/sd6p43;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so2109113a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 12:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763067279; x=1763672079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyTS6yobOWuzbxqO/lvm1TO8nk1SU9PXvmBcfpgC5jM=;
        b=l/sd6p43Ps3UBKeZj7Yu8mHIutp8rykh6L5WDpzzAmRfCT4dvaXbG9D6Y5PcvRL1yY
         nLjMkX9GVDIPAmsB9xOm++ZdLKznBx5PjCquu4n4knLh39PahTXs06LIGemhCibZmI2/
         V+bOR9ElyYgkCSFr3M83LPcJSWXZdH7NuVdkPXMYdzObiLI7hCpw/NNKpNzuRcLjPdtX
         xyZXJ+jJybeKo6nEUYKJE9QL/mjE4kmzJXW1dO7Kb4N0acrxgUZJ3rHIWlGq11G0rMls
         ZLB2G7Bkajh3ocYQBTH34nRM8BwgOWUBzOeobiJRuwTYpzlt7bOxzZDMfbaJFoLBZ2Qp
         ibHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763067279; x=1763672079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tyTS6yobOWuzbxqO/lvm1TO8nk1SU9PXvmBcfpgC5jM=;
        b=EJl3RILx17gPnzPuAyBsYXTbC57saD1D6djOFLInuVnnUpm/lFBvCtlOA+n+JZ1XA8
         vEXbfWk8kdlwr+hCota6dzSsEetY513dXacRLleEEYhqo3TWYDjka4z94tve9VzCfj0x
         Ux4VSL7RxT5g3l2M2t17Q8WJH2zzRJn/RQPOaNp+5Dbuc6lCZBYFOOmDOVmPpQ0l20hk
         V7mkm4OtoP2agd5yXj9UBi07DHRTW7tTAeFyh4hVN1tOzW9kqraPYqgiEAe4LyIWT+5+
         hcoJwnK0kwc0R/Uf0+e88ctolf24pOFfORdWxBXd7C81jg+UWszd6tZD73FGDwe3aMJM
         Te1g==
X-Gm-Message-State: AOJu0Yysu0bPBT3W3kP4KGumHbFeivwzqukAgJWI1VRFz1mjORq6tUT5
	i19isSYE79N6EaqWoIqQWyYOlgx2R9HbOZTL/hozBLEeftMCsQdqWvwVt+sWBg==
X-Gm-Gg: ASbGncsXnStTB8xssHdp4bmfYZo3ksf4EEWK4Szajj0y6qVIbQ5dTLT6unS0ff7IWvR
	to0lycDQ/KtkxX5kgCH1wDU8q1BcU59SQysdDs4AWJ/9bJJvKjGBZKQNgwB17+G43myU/QjZ7rh
	6JJvyd7Lyb8qCZfUhkPdLnreN7k+QsL2kpqkf+xPInMLLEkLnzTPSLiZuhOsRFXnbyXE4u3kYQt
	5UwLrdaDgavA5JWcjhSRvKuvVAt99OBatc8ZhFnkHf9Jpi1JmzlPkwSqjS99BMsEmd3D/4Tljuk
	WridTgawU07xzTuCGzmBncOvLraKPCAFtlEXnprBpb2R7rZE6VHz4w7VH4KEbSxiF2Aory3N2UT
	FFnwz7eBiXEXeylhuP3izaAtGqy16lQ6uZFJ+8FffyE5/TiFemnvYShLHb25eJ50gFEFM0+QcaM
	VZ+v6QprNclY42vw==
X-Google-Smtp-Source: AGHT+IHkUbPggln1iv9t++rVvEyPg/3fraKs8iOEcfbV4j+fBmLidEV+YYZBtW4muM3+kMpJh/cQSQ==
X-Received: by 2002:a05:6402:5242:b0:640:ae02:d7ac with SMTP id 4fb4d7f45d1cf-64350e20a69mr596488a12.14.1763067278589;
        Thu, 13 Nov 2025 12:54:38 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b1dc1sm2250927a12.25.2025.11.13.12.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:54:38 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-icontract: upgrade to 2.7.1
Date: Thu, 13 Nov 2025 21:54:31 +0100
Message-ID: <20251113205431.3489223-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113205431.3489223-1-martin.jansa@gmail.com>
References: <20251113205431.3489223-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 20:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121659

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../{python3-icontract_2.6.6.bb => python3-icontract_2.7.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icontract_2.6.6.bb => python3-icontract_2.7.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-icontract_2.6.6.bb b/meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-icontract_2.6.6.bb
rename to meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb
index 5075a1a6a1..b906be4ac2 100644
--- a/meta-python/recipes-devtools/python/python3-icontract_2.6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb
@@ -7,7 +7,7 @@ PR = "r0"
 
 inherit pypi setuptools3
 PYPI_PACKAGE = "icontract"
-SRC_URI[sha256sum] = "c1fd55c7709ef18a2ee64313fe863be2668b53060828fcca3525051160c92691"
+SRC_URI[sha256sum] = "281ec16f1d09bbcca7a4227e82cd10b4d5fb291f638df77c29b7acf493dd3178"
 
 RDEPENDS:${PN} += "python3-asttokens"
 

