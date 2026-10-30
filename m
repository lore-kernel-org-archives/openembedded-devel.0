Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8903.1793358198402741857
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oXmUIe6V;
 spf=pass (domain: konsulko.com, ip: 209.85.208.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso714868a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358197; x=1793962997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbLi5TLWG/dVgl1gL+5nUzR1RBpFO2C5fmNRCsro/NU=;
        b=oXmUIe6VaGtHtLPzZlHNfnYhpejqzsRs0DDYlVz4RfQZcAvGzsZv8LJu+T8qxyH6MK
         0fgTlWlPuh4992FLWhM9J5ErqM21uTJGkev3kzl9pbPZBqY32MugN0VAdS8BLR92HdJ3
         /sYtjZFZv4MBwv7SNdqtsNXWJRfK3wQKiGFK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358197; x=1793962997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WbLi5TLWG/dVgl1gL+5nUzR1RBpFO2C5fmNRCsro/NU=;
        b=1QuuRCjoU5enjAc6IYV9RZ3gGm2PlzikXrkKKWONhbx0ChuhowRt285biq9LaFqlSA
         C17+CcABCHXkTq1c9mzfnK9I1i6JoYlIRRdtiunQbTa8Fr+N4IP8bCMWsdB5CnCI98qU
         twi0h06sWhLazgKUH4+LX0bd2EP2MQdroI1YdMdER7Bf55FZPHPSXA12xRHr/EDlxWoc
         CRJmtq1GsgR8/QWDNW0486ALS4ajBmy481BF68YdV+ryAVj0bvfHSCo/afULBe3Er9pi
         uj70EFFM5bmbUBvsLN8ZtUKnmPm/QU0ZF73t84T+HaBnMAWBErjcdKc2ztxYhIfk1C+K
         e9CA==
X-Gm-Message-State: AFq9FYJFPRuAuHBBjhYX5sftHPS1ID98alThAgZbZhPoyTHiXiZ5fTYm
	hlOMowBJe5QjB/VH1g1q2RjsToHDcl8E1hNgVU99ytQkrsgdiJn0gwRqCGQN5+WiGb8PMJtq6Bw
	QIrOO
X-Gm-Gg: AYBFou2Ze+4S8DK84D44FJA705uajzS2uK+gi28rL2ZHTHRWRNR9DzTFN5PWAP7tHDL
	0wCzesCI6YK5K8asHyHl81PLNGDMB5CzxFpx0RFgudleLZ91VfYVIMPPeq4yuqh8kl/jdCKo8A0
	EFdCZVnOe7AfRPv9R+ZIUR+u636TI+DVVWi/1ypPvD5/ANks4LkTgtw9UIXZ1yPTU5vnnadawFt
	/5yeimaTlpjBXAtwkutI0Gikz4zdoZkleSsjs4ufHDh95bFcUJWIL+GuVTnC3D6feA205yrZ+A0
	cUqXZAYwfcSCcUR4Pt4zpuOw6PAGOQaUJ4geHcqXLDb6lJyZnZoyZXaf11i0BnBkQh1K8DfQyeu
	hTSY6ECqTU2F/H20HgndifrTtISO2SBdaR78f1dWXA/kkDGZH7iHS4xsuVOEwgfT2x8dlLxUXoR
	gvqGuUErzJdxmoOEtE26jC5orR8h9TYjucIboGhAFKocswsQoGv6wuLknhYc7GWOQjIWeUgmbDx
	KtX7Nr2IXOrhQageUemTD9MRSouSWVmFqF/nkqPC0LsYjL2bs8jtQ3XddrBhZ/+U8JOqD9EAJjZ
	ubIoXnYF03o6j4NKEOoard0tOkUN3IWYvPye2hIRnnmm0D2xqCzbE9ZoZAsUIx17ChIexslRZ1L
	TKQoCbv/YkZozMTHREALOH1Kgb1VgN7LrXkYPWBjfHe5Yr9ecyAjZcg==
X-Received: by 2002:a05:6402:c50e:10b0:6b1:c7d9:b622 with SMTP id 4fb4d7f45d1cf-6b4d4d74bf2mr1022691a12.26.1793358195730;
        Fri, 30 Oct 2026 04:03:15 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:15 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/25] python3-cantools: Upgrade 45.1.0 -> 45.1.2
Date: Fri, 30 Oct 2026 13:02:46 +0200
Message-ID: <20261030110309.1124614-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131684
Content-Type: text/plain; charset="utf-8"

Upgrade to release 45.1.2:

- Revert "When parsing DBC, make sure there are no unused VAL_ and
  SIG_VALTYPE_ entries" due to regressions
- sym: refuse to write a message with more than one multiplexer

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cantools_45.1.0.bb => python3-cantools_45.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_45.1.0.bb => python3-cantools_45.1.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_45.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_45.1.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cantools_45.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_45.1.2.bb
index f5c9e1a76d..1ec1866f3e 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_45.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_45.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "ea1619f3d6108a1c3ecd0f81c952ff2dffd023b244704f6f7a17c4f4dca75f73"
+SRC_URI[sha256sum] = "c9f9059ae9028902065d5fc4478728749e27815f5548e6b249f963350d812e8e"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3

