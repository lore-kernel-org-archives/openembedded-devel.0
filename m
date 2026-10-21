Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7501.1792574967592416130
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=je4JQf3V;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-18cdcfc05ffso501612c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574967; x=1793179767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrJMNcGZHCA2dnWbt7JzXk2YA1A3mKdG0q5nJaYh+ds=;
        b=je4JQf3Vsj5MADYpJcWfYMTHEJVkUXtpNeB137wdKXZEHDIBNB3ZEr2KES+Um5kjjl
         5v+rEhHA/mMZuUyCQspYgGZ15MlCa0vHbctbdGm/dDVEVgQUtVrYU5XucGbzANVuFVyv
         rEHwLVDniTzCjXxja1oBxW8qd4wafzFHi0ebG6y/NHsT3Gj83Fzg8J6/RYqYKpUUhZ4b
         y4kclbIE1DOxcjYYqPEUtAMDyBMvwmBra92AMIr9gHgwIisWa7C2yDx9XxBGYrTNNLdf
         rZ0r9UAOgXn9prthY59wwmbJw6rkvPEKWsPD0tCMKha/1dVpkPhAl8pBvD4nO0mEOlTq
         L4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574967; x=1793179767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrJMNcGZHCA2dnWbt7JzXk2YA1A3mKdG0q5nJaYh+ds=;
        b=fW7SpQjjJscrJ7Php3gxq6zD/uuMMPR8IaYWLe4XkYwghuXV/Ykd0yyF4hLwMdhBbX
         WQFjMY6FY+b4tHO7JI1sQBn6qQ3Uf9ca2VuZuSHM/uOxoKHZXTEVbxS+eO4ulyMndNix
         mLsRrbLg/uOQvCboW8mdphPhGVtYvGEXoI1wgVNxzw+YoAG0/MmGjEhOD1bcwVWF4Nuq
         0x7Ms1HCKaYcNg+WF1GoLzEUctxToFyW0uXdpeP1tA4yJNUol4wMWaXrjz798goj0lvY
         83s8iUUrfG/9Ae/iWCVBettKxtKlQ8ADQO4mhbQSM+zX1kd0v5LFvydcUPHdrolmfxYA
         DyKg==
X-Gm-Message-State: AFq9FYLhzHHpDMWkX1cEFX191rBzxfy0F1CGHnMpATCPtvk5aJiIEuqP
	VsI/nrWdZdtko9aJX3DiqzVl33autP9UuToiKZujHN/fr7RkXn1Tbkt/bWDRvw==
X-Gm-Gg: AYBFou1wk8mgEvq11JLTq6hYrbDYbohYjQ3lc/VIwfh1DDV/16giIBkoE/V5lSVLvGz
	z8D97knm1B+aGQgekmGQ2RvQw7K7wWfU6fhR8Bars32PePwsQiUUCZ0UVp9cxzB/9q5XsbatPos
	d+LBKp86cuI0yG4pgpMVv76AiwUBzXaXuTBfp+HTkNDCdQOYS5nmp9QvJWaW+cBxYDpgDnfQJgw
	ppHMx3+AgRZS0pIhbHeYHBXaCktpbRDEf9BbYjkg9DFthsT6UaVGvUv2QmBlhTKBYnGQs4jVare
	dCtFesjFf04sQs4aWQXtAXUgXGF752XEAEY/uwikIYiAZnzxAWQh1RoyMmCr5peQth7erFWpYd8
	vvh0fwuf+9CTU2CFou4yDgCLGnRy01/qstpdZAXg6pTvkoFB6pYg0nFYHrtydExSoXzx+mRDQH3
	dRVX42Wzgm5aMeVpoORvaHrLt45AKlZhh6aEeeSFPV9+9uRJrHM4lHV/LaEKgZwkFpWPnTdWMNY
	Nx2JvhCJwr16aWaaD4NIA97xMFOrUyHk7mAUZZB+naEgsieMsDmpPrU+X0uOu4M1sAeQkvZ4bt+
	6LPVCBV6Q+Y/LMP6+Anuo12Amod/yZUqNHC6K/mf7ZYELSmM2ke6
X-Received: by 2002:a05:7022:f512:b0:187:efba:9ba2 with SMTP id a92af1059eb24-190a84c55a9mr1616002c88.44.1792574966939;
        Wed, 21 Oct 2026 02:29:26 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 10/44] libspdm: upgrade 3.8.2 -> 3.8.3
Date: Wed, 21 Oct 2026 22:28:23 +1300
Message-ID: <20261021092857.3585453-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131197
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/DMTF/libspdm/releases/tag/3.8.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libspdm/{libspdm_3.8.2.bb => libspdm_3.8.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libspdm/{libspdm_3.8.2.bb => libspdm_3.8.3.bb} (98%)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb b/meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
similarity index 98%
rename from meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
rename to meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
index f77057d9fd..3ab77a5cfe 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8f9b59a81a88da8e812af43728b72dd7"
 DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/DMTF/libspdm.git;branch=release-3.8;protocol=https;tag=${PV}"
-SRCREV = "f55cf6d48ec69b4ac60a63903e9c6a2cb0fd155d"
+SRCREV = "98253fee253c9e0b4313e64b373af3c7614c90e5"
 
 inherit cmake
 
