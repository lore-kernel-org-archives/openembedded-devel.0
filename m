Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B57CCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:25 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17887.1763014816167494276
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z9y59c8c;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso301466b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014815; x=1763619615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxjiEi96y69eUaQP3m4r9nJC1YEcNqr5ZHt1XtjPq70=;
        b=Z9y59c8c/QcX80XdXp/N+K3GmDtHLYqzFtl9MsDcNv9hCSGXIQK4n7r/NE/IHUhmF+
         yWiO7FTdtd5x3Rzd5KWQFJVBmNqWOrV++INao7sYC9W0guMIjoiRSDEIjH6cHlZWowBr
         uABNaUdQGQmv1m+oe60UlJJF/coTMiuUQTiARONOddJGnV0KXieTtODOekYeT/jUo/qA
         rPw97AFJQH161a5ziUCwMGDGXADH5QAT9+bRdWMEyCfVbziKrhJakXngPfZffJDUwfhR
         7uYX+COJdkhxa4+JwMknmOIPak7WudDHOvpW5phS9y3Qx4QBdgHNz8LJuiQav9fWwr2p
         +sow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014815; x=1763619615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxjiEi96y69eUaQP3m4r9nJC1YEcNqr5ZHt1XtjPq70=;
        b=lR6nMZwGuuquN+O2+FPz99z/jg0H6mSYtCMd5Up9e/tic5sUfjjWlDy/oOEBK3FRmC
         WGcU7DX7u5+D40ueTzLRBdskMuqc5fBN0KSLjGqx93byaQyCR4rx6cQumE5jv/er7+Td
         336NvxXCTP+PLlYcKhqFna+vpNNV4vg9JIpkOJaRcD03T7wpNMF2U1pJwHGYZ/15XFr8
         /ScPXmSqMi7/rZID/lla3eL93rG+2JeYtDv2FW7oAbsG4ZF5SpRpPwmmQa+A9m4XZ887
         5eKKaE+hu3rpOXWQCXj+gPy1bsCxxqOJjUHetNP3SOXfsj/j0DR0X8ZIlY05mxKpjO5Q
         tTYQ==
X-Gm-Message-State: AOJu0YxX7IIm5gLCasQ1Ty216/YCKsI/vOBPG/fRI1k4Vywyv30ZX/9z
	tA0qBhtZwBEPAWbL83vykFvgDFu0f1RovFKzYBx6X3+Gc2cqW5x3O5HbZer4WA==
X-Gm-Gg: ASbGncuyswhniNKxUGR48dH3V5C61cHThWJzrj9Hx5fDCpfBChdIM5TdybVnbLf6AFm
	X6ZqEuQqDf78EtNR76P/4F4iIYOrhx08lL3n2++/3TpaICaZJ6SpX/PXJpj3t8gNwIT+NsqGJE6
	Bmmsvxq1CvGQj4/HfHRWN1PBFlicaM3jPDYKh+rSC/hfT4z/EyPDtuytiiIx2mz5GTE10qZ8cOH
	DuMua06PQCFSWQNNNavQYPCvqyRGuFy609yB1KRBy48iOgYPrSy4DRcSwhXBWpwaFgO4ZEtKEZc
	kstM8dUsVF4CDmgsV7HWK7Zzb2wlDcOqSVi5HX6E8Btpu00VhahIyRsMCdsG82cuUyx68fSbtu6
	of7FxIffz3Way1NcJv+CdFn3AN7/2f6iPXAVcnIkjRI/LmEwn9aPDKDo/qJh3u07MS9i2zvmhbF
	67VSqlaYuCl+zX8A==
X-Google-Smtp-Source: AGHT+IEUpLnSswtq8GZ5M/kh+pTkSQK8pz6tgm477OWV2yI2w1ugwpQLOJ2drdjklWlbTG5k+mmRZQ==
X-Received: by 2002:a05:6a00:2d18:b0:7aa:bd80:f4db with SMTP id d2e1a72fcca58-7b7a27a2ee3mr6057946b3a.5.1763014815420;
        Wed, 12 Nov 2025 22:20:15 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 15/38] libiodbc: upgrade 3.52.15 -> 3.52.16
Date: Thu, 13 Nov 2025 19:18:50 +1300
Message-ID: <20251113061914.3756301-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121613

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2023.

Changelog:
https://github.com/openlink/iODBC/blob/v3.52.16/NEWS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ffe09ae8e01a26a9d2b51dbedd19d0eb2c2f3c5b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiodbc/{libiodbc_3.52.15.bb => libiodbc_3.52.16.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libiodbc/{libiodbc_3.52.15.bb => libiodbc_3.52.16.bb} (82%)

diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
similarity index 82%
rename from meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
rename to meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
index ff976ed975..95c3ec49e2 100644
--- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
@@ -9,11 +9,11 @@ HOMEPAGE = "http://www.iodbc.org/"
 
 LICENSE = "LGPL-2.0-only | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=8c0138a8701f0e1282f5c8b2c7d39114 \
-                    file://LICENSE.BSD;md5=ff3a66a194e500df485da930da7f2c62 \
+                    file://LICENSE.BSD;md5=5b36348a404e1d65b57df8d33fd6e414 \
                     "
 
 SRC_URI = "https://github.com/openlink/iODBC/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "c74541e3327fc9a1c7ccf103645471c67bc014542d70f572476eb07c0b2dd43c"
+SRC_URI[sha256sum] = "3898b32d07961360f6f2cf36db36036b719a230e476469258a80f32243e845fa"
 
 inherit autotools
 

