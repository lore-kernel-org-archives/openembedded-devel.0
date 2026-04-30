Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A9CFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:33 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18180.1777549648202619935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bVxsGT0e;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35d95017a68so553612a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549647; x=1778154447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBFNffO31XLa+3brdudI9PQdbBOcD3HR0QLCWdeNmO0=;
        b=bVxsGT0eQ2JBKe+yZyUU91QNspY1mTiCf9LiHXzTXicUnKBN1KWo/N/aJWo3Lpu1H8
         kjKlXyP+x+nPgrZPMwQb99+3tYJZXEIaxxx+VtfoSYm2MDgOeuwnkdEUrOUJMIcfGYXb
         RZFxUTHkrygK4S6P/DzxYWRAeRlOZtIffCoc9iHmb5UGlG6qzFPG9l8XFuosih9EkWzX
         1OQjJSOHbdSEwBQI7h9L6d27ADkYKv91iUveuAIIwa3Y/bRy2CzDxII2QFrgXKYeMODv
         60KVwymZDiwfOCSXJ9mfik8cR8+s4XQMhY8sLDgZAuz6PSvsg51cseYhhGNl98TN/J5m
         MfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549647; x=1778154447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nBFNffO31XLa+3brdudI9PQdbBOcD3HR0QLCWdeNmO0=;
        b=Ov7Ga0JqHRrKwUsP4uAvpsPOZYiMUdMmaQI+IUW99UdJtFICnTeeud0zCwsJftSdYl
         8KfzE8Ei9WlBx4oQxgL6LMM2QthqR57lrUTwZw42r0tpCvmJo4LTwYdpNgjkD2DL5xVD
         hB4tJZgLBpoAN7QGBa2zrrABrpBWCA7yE9g2YO8kpQ3OaKTvWVSaChYwfqw3sAaIKBmv
         C9UrkBa8uT4VCGotGxQrncyOklQc6ZY653dMfQspUPUpTyKkQW5livB6vDy/A4pNpVKt
         g3WSa3G92aNiJv+MOe/7sv164kpAW33S7LpmuirvfNVuScGM5mFSDyn4WNSdOQRR0+aR
         7aag==
X-Gm-Message-State: AOJu0YwXTQlyml/Y9BqtNoZpac4+BYbpO+XiC4YOYEcIX0/AE5fOKUpc
	S+N/ulJwWJbe4V1MXu+/EGeFL2iwwhO6Wldtrl8g1y7To42J5HVC9xE562EEJbgS
X-Gm-Gg: AeBDiev+ombHNHQ4vd3WmFkAVCoBlWfgO5e/7fHon+omOvVxl7olp/JmNyTQOqLPeDv
	kB43Sr7TrvpJ0YMHfzDtVLtJBjD7kWab2GwoQDmYoXbX50Z+QDzbM96sSxQcBIpeEpkQpPNCpyW
	jdxvUInXQ5VoQeJFR2E3YjJBy99WsvsLTDT5yUjwdXprLqjEsRNnJHcrmJncNfZaDjYPQ7FDk7E
	TVmEJkhxtgM5WvW30OXHb6POTiY3mmt53vcToNBuyJU+kNryArrLFxfIAUxp6NsDEtOiFZOvvWp
	o3lUbt9iDXh6876I1/3eemPUxWHkmYmtULn5Jv2nUVLB9J6rYR4xi4cT+wcmHBrUJWhVLrU/iaH
	Rleti1kyMZMvihZ4RC1VbX5/TahMWhb23ecCrdP9pmq3U3kGqMgaFMJtI/sziRd01PF1ohTzLAu
	gnvpDn5GVZL7paALH/0aNDiZE0YmX9Drq/xgkOl2A9DTKi5Zc0vfvfouVXGw==
X-Received: by 2002:a17:90a:d2c8:b0:362:ef2c:65f9 with SMTP id 98e67ed59e1d1-364c311dd18mr2887442a91.27.1777549647325;
        Thu, 30 Apr 2026 04:47:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 10/24] python3-werkzeug: upgrade 3.1.7 -> 3.1.8
Date: Thu, 30 Apr 2026 23:46:33 +1200
Message-ID: <20260430114649.4184890-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126744

From: Wang Mingyu <wangmy@fujitsu.com>

Request.host and get_host return the empty string if the header is missing or has invalid characters.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit d8c310aa52e669ca894d4b343bd83a97cb6eb8d4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-werkzeug_3.1.7.bb => python3-werkzeug_3.1.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.7.bb => python3-werkzeug_3.1.8.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
index 3dae69f7ca..0657c7c3e9 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "fb8c01fe6ab13b9b7cdb46892b99b1d66754e1d7ab8e542e865ec13f526b5351"
+SRC_URI[sha256sum] = "9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44"
 
 inherit pypi python_flit_core
 

