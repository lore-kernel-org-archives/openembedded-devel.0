Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B297C44506
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14746.1782634350315682802
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lbZjCsob;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so251030eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634350; x=1783239150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7hveOHVjQlHbDkxD7jHGogDuClaos2iZ5+5AgSGoXs=;
        b=lbZjCsobN6zkLNBP6eHe+/FmoCfLPm9bq0unSuyK+pi6ohZ5gEYGbN2OXDqfee8XDh
         /focdOsfjsLGLHitV9+uMVlekWNM7h6+FBhgEW5D2RViEunj5JlbCnD2PQf6snPHYw1v
         uaHx3MfINGxnQt9NFmrq2cqcCYaW/O6RGvlOA5ZT950Vcx5aIotkF4Udg21DYmKIqK2i
         smxzJaF04a2n7q17Ssl2VYWNvFj3SgpE8t2pzmrnpT8qsZy9cXkVkV5NfbUGhZMbyJoj
         viTj9yfpirhHWdMREPFTd9Z0k3o0zpwtHUDfw/kI4FLo7rvfEs+m+MkuMEIrjPosVwtE
         Mrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634350; x=1783239150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K7hveOHVjQlHbDkxD7jHGogDuClaos2iZ5+5AgSGoXs=;
        b=AKHch/ZL0Nisbs3W0lwJsIxowq3nywFtkAepCjqJTnkD4ANLvWXJNh8z9+4E5noA+y
         Q+fLzEXwi1tduddJmCk1ju7ENrdXv/e8ZbVmpvBE91RCyjU/+W9kvT+UUW8uTN6J6qI4
         kn2YBQTuWXxivQLEKVVkqmpiC8wLb4W6pde2pRxkakeFmRrbhNmQ0fAlNv8z6zN3fBAL
         wD5jpnwy7GgnX2ehh9/S//8enz+2AybMJno6HTimfHEMv1EgGgBmGfXH09CocnWivtGa
         B8VsaPovfjYTSJC9yE/zPqgAnqraajdxAuSXUtwFX9b9SerPF6EB0pNA7ltHiVOuHk0y
         jXKg==
X-Gm-Message-State: AOJu0Yy3wtM9SzYdQbXI5XDY61FwLFSHKgWBPmLg7VC0ocrtP9ys0/YN
	ftFLJO8roke/MhUKWdRvm45gBucg+5Ek3peGWyHaqaVocNqazbDrkqGVBJp+P98mhU1ikw==
X-Gm-Gg: AfdE7cl+ctQH+E1Xs/lMSqG6P4I1TcEegLSAb3eJpU6NKA3O+iAaUWwitlCm6Zy9WaS
	PtnVuyI7uQJ9tViGY/V1Rgi/FtmX+NNH96RdjV29ncONKTsy3lhKwGUd7/aq25kYXDrz2yKpxu2
	731PKb3qcQ1/ujk5njzAwolrrf8evR/y8tW4PiKsia/y3W+sAEL44O0WleIc9u1uczIbllAvT0/
	zVIlrPg8tt7xYgefDLUNFnRO8TRwA5MyIR1ezGqPYOd6Q3qCPAmhsyViDJoqzfMhUX9mfbH5y/d
	3pnYpLNQqqMihmedcLjNHfMFTZWQQV3UKGk7pbscsABii6kblN0pTIoDKoH0iK0XFtub5ZRRMyd
	CZ08G8qsuZQMLy+/ZAwAjeJl4A0Yu3Jc5giOhKAhgfPxRRuhJGGC8XktU5jEre2zO0oPZHWsdM5
	nrsPOQ46SYAACixi8/Q61/Mz/jYOjrnX8/guKJR9q7gpnziPny/nVq/plak1r51kFEe7h/IPfhn
	/CIss9iDsklP62VqEhgJPXPrllWLycE/tt7NEggngBVrJvI8A109c1oQYTyQHpgc9BOaQlRELG4
	HJcTnoHv0UAXwhqooOGotl8dc6Ul0g==
X-Received: by 2002:a05:7300:d517:b0:30c:544f:a861 with SMTP id 5a478bee46e88-30c84eb7d9amr12084119eec.20.1782634349611;
        Sun, 28 Jun 2026 01:12:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 070/128] leptonica: upgrade 1.86.0 -> 1.87.0
Date: Sun, 28 Jun 2026 01:10:21 -0700
Message-ID: <20260628081122.178348-70-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127880

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../leptonica/{leptonica_1.86.0.bb => leptonica_1.87.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/leptonica/{leptonica_1.86.0.bb => leptonica_1.87.0.bb} (89%)

diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.86.0.bb b/meta-oe/recipes-graphics/leptonica/leptonica_1.87.0.bb
similarity index 89%
rename from meta-oe/recipes-graphics/leptonica/leptonica_1.86.0.bb
rename to meta-oe/recipes-graphics/leptonica/leptonica_1.87.0.bb
index 11adbc7125..1e6edfd138 100644
--- a/meta-oe/recipes-graphics/leptonica/leptonica_1.86.0.bb
+++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.87.0.bb
@@ -7,7 +7,7 @@ UPSTREAM_CHECK_URI = "https://github.com/DanBloomberg/leptonica/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 SRC_URI = "http://www.leptonica.org/source/leptonica-${PV}.tar.gz"
-SRC_URI[sha256sum] = "1fa08e40bb37fd45802d5e6e7b43927449a5c47d4608ef99d3bd3f0fa76baedc"
+SRC_URI[sha256sum] = "c73363397f96eb1295602bf44d708a994ad42046c791bf03ea0505d829bdb6a7"
 
 EXTRA_OECONF += " \
     --without-libwebp \

