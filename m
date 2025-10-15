Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E0CCCD192
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 04:22:49 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.8087.1760502167429745767
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 21:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WjUfqI3Z;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso1334354b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 21:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760502166; x=1761106966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RuFc04PbBhsfXOjbleya1Uy17HqZEeqXRtAoyIFy74=;
        b=WjUfqI3Z4t7rynYEABgubDa2MmnYBWajPQNY8z6XinQXHTzFDEalNmnBIJnQM2OCGd
         Vo8Nwuu5umTG56NKhXaitAOCsXw/stSkpqTz/s4QFD/k9a5jdQpq3PIlJbpxlpEwUOem
         R42ACM0jUx9/DnVdfYmn8p5Gglyb96/KxXn4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760502166; x=1761106966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RuFc04PbBhsfXOjbleya1Uy17HqZEeqXRtAoyIFy74=;
        b=BI9rJgWaT1zOHM4JCG2s+F3+hrb9LXR5AInzkLnZQzhzgJfNY7khZbaupHI2KOcD0z
         pG6aFytYKAsW348BZ9kZdOMPw3oC3rpslM0/jRlF3Lusw7THX7vzM4WjIqgONFrEEHxl
         a0KTRQ5PMi1wjWh85C30azUBYM/lhfdFt/1SzoeuebY/0KyEVcuojPOjO/rX8EbQMDN4
         asztN5T0aJaDIVW9i6eIQSEeibXhUh3x9k0XM6QXiL/S5P634hzkg/1jvb7xh+MuXs3R
         SFdZqEXbclRhQhoRIULb7t5oIJcOe7tr0AjaB0DrcVuLFKImoLjMzuU6YLHpeSlf22Mb
         f+4g==
X-Gm-Message-State: AOJu0Yx5Dv/WLj7iL+++7oF2BFp5pK5819mOG/DpDE/NvZyjLZW7O1hJ
	95p0a3d8RFlELBIg5pOgwfykMOJ8kPuWwEBHDKpol0XGx03uDawPBc6JNhGrosPbPQ0ZgSdwEeJ
	NbeC/jgY=
X-Gm-Gg: ASbGncukMRatx+h2EcLuaSjHtnYuZTkqC1dbgSaumpjTtYm9LdOPJONwZ1+AGCb39e4
	eFZTMdYyJHKCkoaOp/VdutAQN/SDM+wNiN0kqNIzhL8KH83825LZB603PW9EBB1amUjpJLilfwi
	JqJrDD9JMY/Ize+sWaz9M8f107DIGARvH5aXGVoZgo/WZBdmteSqBWdxbP0neqVEoX5OkOjNyxb
	nXT1Rf1s49c9LF/1iUQ+88Viglv6a0vWSbd2QVXPmssYn00un5N2Mz2xYpAOL6bq2iNBIwckln7
	VZYZJ/tTl7+Ak4NWXcTlLTP0sW89FwEVPbl5VDFbPcmFg1S8XQeS6tT/o5Mq6gGNTqK6HDejl+0
	vf7elOoApkA5qFDgAT4I2vUzhWxWCELWqF1zAnlmyIG+FZshgaPGggwoz/vEVmg5PNEs=
X-Google-Smtp-Source: AGHT+IE9QdXr0buLnP/R0MxF8co9fFAx+pJWpDqod3XQVpYvLzi+zCd/eAsQlAiUgguO6gevebh4Lw==
X-Received: by 2002:a05:6a21:32a3:b0:303:b64b:e44 with SMTP id adf61e73a8af0-32da83e38bemr34756054637.43.1760502166254;
        Tue, 14 Oct 2025 21:22:46 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:3282:6d6c:6f79:5d45:48d:1d79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060c4esm17067760b3a.14.2025.10.14.21.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:22:45 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/3] redis: upgrade 6.2.18 -> 6.2.20
Date: Wed, 15 Oct 2025 09:52:22 +0530
Message-Id: <20251015042222.121285-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015042222.121285-1-vanusuri@mvista.com>
References: <20251015042222.121285-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 04:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120685

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changelog:

6.2.19:
(CVE-2025-32023) Fix out-of-bounds write in HyperLogLog commands
(CVE-2025-48367) Retry accepting other connections even if the accepted connection reports an error

6.2.20:
(CVE-2025-49844) A Lua script may lead to remote code execution
(CVE-2025-46817) A Lua script may lead to integer overflow and potential RCE
(CVE-2025-46818) A Lua script can be executed in the context of another user
(CVE-2025-46819) LUA out-of-bound read

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1a22715b82584696dec489914d8bb9ccf73b5600)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../recipes-extended/redis/{redis_6.2.18.bb => redis_6.2.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.18.bb => redis_6.2.20.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.18.bb b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.18.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.20.bb
index a5938b641a..6eaf885f2f 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.18.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
 
-SRC_URI[sha256sum] = "470c75bac73d7390be4dd66479c6f29e86371c5d380ce0c7efb4ba2bbda3612d"
+SRC_URI[sha256sum] = "7f8b8a7aed53c445a877adf9e3743cdd323518524170135a58c0702f2dba6ef4"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


