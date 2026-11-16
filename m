Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23232.1794814544572074884
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QQgUbLZU;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so4695155e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814543; x=1795419343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lA7kPXyC1dCg/QKayo41vl0TxQWQ2QxWISFJFD1epi4=;
        b=QQgUbLZUU/XpsNsSU6umj7WeYYSCTVj529GPyK3x2jTHL8m/nM5iMxla9xTDR8whUI
         oGE8hFR8i1FVNV30SH/jPqF1nU/47+oN+m6VJmEihL24BAFw+dydjGycKfR+uPuEN4Ui
         71bHb8JH93RYDsXK/mAB2jypR8nRwSta9yP9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814543; x=1795419343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lA7kPXyC1dCg/QKayo41vl0TxQWQ2QxWISFJFD1epi4=;
        b=UMJhgaA1Y5q4mvW7Yh7Nmryh6pqK/S617SSnOneVEomPGWnk/O8hyVdXQB5GbblZRG
         GKNtG6cbuv1sjo1qellpDM+mGPoLGzQztcvbJ0Yryv8ugj3EmzTaHqwkFXOR49194iRw
         Kvd5vdIiWsePeXmri2E3p8FqaI1eTuHOCDlNq38EvNxyQNtbJYRSsmBMI8cQMgZCW13h
         xg5gHaZOgYQPduQs/x7TUqXfVMUJwIkdQ/qb28vIZOAwe+Z6yhaqscnQyDFNvcV5OLwp
         UIC+t7prRxaKwRUdVNpCUQeDqEFDHJVMuSmW+X/hyH1Zp6/oOEUONbhxhhfMWNN+QvBz
         tC7g==
X-Gm-Message-State: APuU4Z9gapg9J4rR4me9aTQ3RcjXnyY5Rbtp/lXGQemgFBajGvh0DBQy
	ahgwTR5XGLnDEskJTmzNKcAPXOXmpIjFsjsHogpgVMRGMV6OZn0cqkK6J1NserBrI68eW2Ul0Cc
	SjQhn
X-Gm-Gg: AYBFou1L9CNUFTtOkkb3578Bkjc5sJDZ5vqDY7789t1zgyl+Ecx1Co4e+oNybGkap/D
	UGDOx81xst7g1sbBJPX5iUonBwrCg/sx+u/Xo+ITQBb51MnXv2vaOXH1OUHYXCfrcxk4UpD1JJL
	pdEO5eQqx17Buj+7iN1krgXRUWFEufwooGwhUHoDX9BhtUMrRKKuoJg03JA0/whcbhw/1apYX5X
	3unYLQbGxK71zzgBRbr6y3MM4hzOsSN/DpkPzQOseMi9zwKT+6g1FA6Ir93vhYJonHjQAi2i/2X
	CCAyTVDQUz+uqVBfwa1I3rbLVRCLIs53Rf6VN2v2WTqd+Uq+Mk3Jvpds2yUckn0zuVt3W+5s3R/
	uVWjbw+EFODP9cPQ3UaEKEKkcl2nB8T+8B8wNtkm/KjF2ggylAROQg/52HILd88O0SKni8ImcmC
	nHIspKDmSDfJztPenaWdc9QeIOoyKgfAmN2iCWwSllFr5DFXIGlG/XxTRW0j3/4JbNY8VaJiBNX
	uuvgFGRLCZhzGJT29NoXqgj0awr6WBozHHE/r1Ge6cfdhpcAJ85UM5WwYZd3u9Pkjrz2jSY4M4D
	sDvvQoHIcx7ZwyZERJOZfea0FR3GRjY2wSNYfhKArIOofbhBCLNXWmMRlkRtLaJDhU+beYMPmv7
	dD4phyvgDi7+IuoRa2+TsDganZ4zEHiA7rdhUUWoh5jy4DXf2nxysQZsXkOJ+xwZ5kBPa03x5Ur
	k=
X-Received: by 2002:a05:600c:3496:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb6de43047mr59789555e9.20.1794814542829;
        Sun, 15 Nov 2026 23:35:42 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/24] python3-polyline: Upgrade 2.0.4 -> 2.0.5
Date: Mon, 16 Nov 2026 09:35:17 +0200
Message-ID: <20261116073532.880420-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132438
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.0.5:

- Add support for py.typed file
- Return an empty string when encoding an empty list
- Add Python 3.15 build target

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-polyline_2.0.4.bb => python3-polyline_2.0.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-polyline_2.0.4.bb => python3-polyline_2.0.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb b/meta-python/recipes-devtools/python/python3-polyline_2.0.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-polyline_2.0.5.bb
index 1b156ad53b..f5b233bd26 100644
--- a/meta-python/recipes-devtools/python/python3-polyline_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-polyline_2.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/frederickjansen/polyline"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1fb8d1dc685695195bb3c1e48adfef48"
 
-SRC_URI[sha256sum] = "f05ade694522bf1720febebe1672f820f43a13c6a1664751e7769d47e8ca9b1b"
+SRC_URI[sha256sum] = "92deedee05d52918e83cf7607011ba1cc52907932e7228ba6e28f4a0a8c6370d"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3

