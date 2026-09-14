Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84833C88E5C
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 03:13:22 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12168.1789355600986256010
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 20:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ocE2dd9P;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so3793730b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 20:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355600; x=1789960400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2wov4LNR+9JHZ9tSqO7xI23YXIvlafWyPRq3Xw2sSw=;
        b=ocE2dd9P6cwkM6DEnXMxE8iodxA3JeTSWiTuvgqWaRAWhnEMqvYVBsIVG5GQh+wlFV
         6qJzDLAEa/ajH/F1lTvZ06StgyA9aHVF+45miIOuHdLRLzUPz069oIKvfzuppKnBfx+D
         T+GZJzV5Kfz9rpK5CFcecoRyTTX11z41G+ODwv+f0CkZCHIUOgRsHGbH8Ly+NUPfW3kJ
         mXv71RSqGw/Sy0axic5Q7fmvYearPloP5fmCaQMxJSLbstJQJz9YVvkevl5jQD2JsrDr
         VsJeErH1LPAh0S6hkGiBLO9fE0WnrrYbIXN574bGIJoAylrejQrZ7/tLZnJY3yNTm61Q
         0spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355600; x=1789960400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2wov4LNR+9JHZ9tSqO7xI23YXIvlafWyPRq3Xw2sSw=;
        b=kiMoUMl4VruiN8RuV6OH9MHqHXGiVD1N62gOA/VbNC3PcUcxDGr5jH16sralZWLxfa
         Th8zFAbQgEnSmKzXTzMTyqFY77kMEH1pdWhZPB3Uf679wBgq4u7hNCfpomO4BY0hu7RT
         EUWQbBG+JWxlsIObIclCBBRKnucCxkmx09oZTcE35DUPoqENApvgQNX48XfaX8e8+Oas
         +xJGBbXQqx8vgDPRdEIplJ1oHMiPIlKZNOyDCBHz83/vz5u7lSGIECNZCReziMEXSgvC
         BMlbpilDMkZNVFztDTkI/9kbtU75FadXzzK8mSk/ucWabAifk7BVH2ZuATDrSccXvelZ
         SzPQ==
X-Gm-Message-State: AFuF++kLOZidW72akXuc6+jSLKxlFkpJqNhdOEC1g0xbVZedhz2owlIq
	bl60CYGjCqPBZIniDU7EH8rsP4PHR/JdW2Z45hc44qR40DYTq7xygu42FZwdoT9i
X-Gm-Gg: AYBFou3/rMD7MsbJvPm14Y65qgJfd0y/LoJu/gdCK9amKZ2fszUjGn9vtgWzxVtOC37
	MpFJHMgUrasPSeRA1FSjtv8X+KYtpPaVTTWGPhz1YlZ5v1quf1FMCKrGDF9L52WKKHpBcTeFeS5
	193Duw5gTt2gxFsRtbtqFcuGtWMLxxzX3LaVJjYU/zQt0Pw5+MSaBkIXzQG/YCtvMUV0r2e52HQ
	Zz2nS5aWkAIQG4T6LbBkFylO3VaFVC0QOIlJHLUXAl9B0Wxx6Uk31LLK9jAtzueD754Pkj5ClQJ
	T27CyUHKS+TAHgvQWhtj/iVjmNOo4t1PlIOOsTOKOuyLDqDURVPmeKAMe3hb/1AeJFE1jQ2+2MV
	yhL5qRoccHtOuKlxuim37UEEoGmUx0rVK6tAgUWWi8SKdUIncLpo36xOxodFLEs43WuxepFM5I3
	47yVBQGQDMcy2w00+bpSaC8wLc8qoxAfJSHIYjiXZ0xm9TADoRg0EMJ47iIH7+uFZyPeIuUfXyr
	AcbCZKxyCXf5d0rl7G6
X-Received: by 2002:a05:6a00:438d:b0:85f:2f32:7a53 with SMTP id d2e1a72fcca58-86f85ae9d18mr1819828b3a.17.1789355600378;
        Sun, 13 Sep 2026 20:13:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([202.170.174.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm3712425b3a.52.2026.09.13.20.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:13:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 5/10] python3-marshmallow: mark CVE-2025-68480 fixed
Date: Mon, 14 Sep 2026 15:12:53 +1200
Message-ID: <20260914031300.3677365-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
References: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 03:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130013

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-68480

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-devtools/python/python3-marshmallow_4.3.0.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.3.0.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.3.0.bb
index 169726e527..402cedf459 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.3.0.bb
@@ -32,3 +32,5 @@ RDEPENDS:${PN} += " \
         python3-pprint \
         python3-packaging \
 "
+
+CVE_STATUS[CVE-2025-68480] = "fixed-version: fixed since v4.1.2"

