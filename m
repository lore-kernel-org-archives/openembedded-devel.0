Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8237.1795739786017746160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Z/F9dNkO;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso50973635ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739785; x=1796344585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3v+v/AuvU+OkZq/UVHZFHUI1rob/FHDcIX/uN8kLoNo=;
        b=Z/F9dNkOlhVpGOy1OkdUT1DeCvWoY5SG69Ls6+KaFcUbQHDVH0kQxANLyedFvK7+vl
         H5Vl4HjJUqy3zLOgItNwuT5oGVTSebAhqvwzb7QJeRiLdqccfRZ4buGjJfyDCGNe9LZJ
         9p2vqlzyaHdVg+vfEf1jAkal+0uftYZbzNFWUaRY1Qte3xmjSwCY3vhdc57ndFz24Ell
         YVcYKKvGUMj3lXMMm/0puoFKXGMYO6enjSWfxFd7Of4ymatEyUS8PEis7nRLenY33UvB
         QS68re8YDn327zkyJMuBl6CwwL5JJcNLS9YG6GrjBzlUO3FQCqjkfjTa2kSVf3ihBDaF
         EKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739785; x=1796344585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3v+v/AuvU+OkZq/UVHZFHUI1rob/FHDcIX/uN8kLoNo=;
        b=hvCcHNhBJz+LXWeMdw6VYMPz0Ro6m244D1U0ndHRrIotmwjY4vgimKwabogRJgqP0M
         2rFhN9e60zeuCE7TRjnI617S2rXJy1fSSWaumgxWzjx4oQ9F0lRHo7yI3UIfxfvKf+5H
         acfAHSxQzYBppImuA9yXOatxo40AIsxtD5+KzFFyCDAeSyTwW5F9BxPJmfkiYpyoWooR
         03FXpKpwKoAp0PIMtSRhUavtU3UikgdRuNvSp+Rv5iSflcbjbNZuKTKovJiZOJXliQrh
         3peTEuBREl6sdRUQrCE+kdovmpZ6yOzHImt1TxSY22DqT3UD33eKRDo/E8gUgRCUgL39
         WKjQ==
X-Gm-Message-State: APuU4Z+lYv10IrkMOzgAQJU+Y8CGGjcDhAGP15YRhJjhwfmI5bFMtswQ
	CE35qHN1DP+7m8z4Xk+FFDZpDpF9WGnR6FcZoAAinbe2npd2OPTvXBlFFMgnrw==
X-Gm-Gg: AZFdTZdfBTVw7XvfscmVPJdbDrnr+5scB9p+EGyvyKPlj5ULvgiTSEVag5U2L4pa2Pt
	1nDsxFv0SW3B7nvPmomXOLMLJl5rzmhT39P5sU+LodAFhbYDHcxQ+LCfSARFJGIhA6f8TDjPf/u
	t7ao4iwjPet6TPG+su6T5ofvu7dX7qdn0H6LC5IBiSwZJ2S4pGWKNTr8UxP/UODfUqHkA9DVKGA
	j24nASKcgWUlqg5jRRpgyj22YABkX1kjsm1GE3hr1iiO8PsZdnaBIluLZ3h4uNjLjMo7Ym6Rryq
	zaXE5G8/2BRfBWoCtOA65fcL2KibV+85zqsc0fXkoYxZBGARbNP37BlTVAayuvYkK/PW8mB26Er
	9+FZa0tVKrl1z6sKo2MRu6QYxXM0upxvf5Xa5p7OPD+eTIpEdprehePowMnoLfkBUwm398gXyYj
	KgQtA7j5x9a1I0bH4r/rmBMirJd2sqOFkwpEQewfxW6lPF+phcSFQieevwikAQn2p+djjrmgNdk
	Q45h77hgtRJcplPCJyRwfT5HeITXnY6NQ8ambg9/uIf/kmNInqQIl3QU4GgBiSgdtMqek/q/f1A
	MeVrciKZWDgHpi1a2PdQ4B46isJ+VGhmpSAYdXU47HuSMVdZ0lBsKanQ0ecO4lgGkoplP5O9ryC
	/g1WY9TUuRwFAexltvPR8GpV63khYNR/2Xy1cPjlQ+jiqaYaZdGOKGskuIz6Zy0GCfkoyH2K7Pd
	j5CDtoaqlpF0zCitNn7dPL2SA/P3PU9xgXSxRJCRbkb3Zf4CAJoWQfEG1/+Kih4WEncN7mXEGSy
	ZiQF7oylPrk6sKVrf1yCpD0hfoHTSWWb6eqnB1xQasrc9XI7eW5kLQZd97PPcd4b62H0QJydTV8
	P567
X-Received: by 2002:a17:902:e5c5:b0:2e9:528c:b9ea with SMTP id d9443c01a7336-2f03f18ed69mr171491945ad.11.1795739785368;
        Thu, 26 Nov 2026 16:36:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 17/39] jwt-cpp: upgrade 0.7.2 -> 0.7.3
Date: Thu, 26 Nov 2026 16:35:21 -0800
Message-ID: <20261127003543.2167775-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133187
Content-Type: text/plain; charset="utf-8"

- Fix unbounded recursion in count_padding (base64 decoding).
- Cast data size to unsigned int to avoid a narrowing warning.
- Support Ed25519 with LibreSSL 3.7.1+.
- Add JSON traits for Glaze and reflect-cpp.

Add UPSTREAM_CHECK_GITTAGREGEX so only release tags are considered.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../jwt-cpp/{jwt-cpp_0.7.2.bb => jwt-cpp_0.7.3.bb}             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jwt-cpp/{jwt-cpp_0.7.2.bb => jwt-cpp_0.7.3.bb} (82%)

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.3.bb
similarity index 82%
rename from meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
rename to meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.3.bb
index fa4698b2b3..b15b9667c5 100644
--- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.2.bb
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.7.3.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8325a5ce4414c65ffdda392e0d96a9ff"
 SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https;tag=v${PV} \
             "
 
-SRCREV = "b0ea29a58fc852a67d4e896d266880c2c63b0c4c"
+SRCREV = "f573f993c9a85cd919a430a5a7a2b7bbb9036a93"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 DEPENDS = "openssl"
 
