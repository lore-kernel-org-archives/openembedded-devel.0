Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8213.1795739718933862524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=u47dVHP1;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38431138772so9741023eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739718; x=1796344518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVQREL7CjIRMYfhl5xvK2gJ4t+JYX9rTRRkI255u1rI=;
        b=u47dVHP1QytOJVe+cxVSj3xuUAAkDcHB1Ai362STAfE2oYl91lWHDlbAEWRqXo25QD
         JsddZskyZdX8KldgDy9gd9m9wHTOvClSiDK9XsejKVyqauc/hxMLXyNdLV2sgjfFcocT
         Ut2H2bUvwCpZA/2Vb+LoFXJySF0uSeqttppUZh2YjGGgtgU8HFlCLP/mMdyJF6zRF7bp
         5GSJtQFmbQBnItKRWqgctA6Z9RouSMlhrQKK1CxH8GGoidIMxYWbBihHCZj/IiBBdmlL
         K95r8aOQXQTZ+LxhKk9UIE/kHPV5o2rHw7UYZczVj9XONzxVEgkYf68YdYZwX7UEUSYw
         eMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739718; x=1796344518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVQREL7CjIRMYfhl5xvK2gJ4t+JYX9rTRRkI255u1rI=;
        b=ZMpc3nX0Wz6fmBLfO9h0TmTKifBiEfymCBSqgn4WRGE2Qp9ofE0CpUySssghzQQkxv
         /B2TcSjF5Car9AfFba1BJjPRl/t/kFVotS+aRz/AD9fVzseJ27QtIkO3b9F+TY3gvK6s
         FRrp073OXaIq2CHkdKvWGc5yeBgD1qFbQlhpyx6nTuD6+nzn3Q8FOupuyWXFxD4j6E3P
         xtpvRgwU6otkS4F5KBfWbEJWkviKNok1Ep2IH/dWPFmKLuZNpnOSkFwy7cA1USWfxFry
         Go3XKL4AGkeDi3+gCVDeP6vEaW3a3rpaESVsH+Zh0lTPh5OUp1Twm3ibd7Fn/oyaP25U
         GIBw==
X-Gm-Message-State: APuU4Z/5ibwiW5Vu7DfFMUkTkA6j2sykBKHV9E9vrEzXd9E1Pvsl+4Kj
	RSOfo5ODIaD4u5kX1z/zixOVjCj3tSwu/Y+fhki5Bc7JaIwIPXjLh7r9SqOc32lS
X-Gm-Gg: AZFdTZehgxuuR5rMe08dPTATH4q30d94FFzuHLmJufuoq8TcxmaG7QH34EmeST+Qo3r
	qx1miSVWkgXQrraLxeKnL8biIlyMmZteSqIo4VteIzdyUKHNo0M+NvCLwhd6E8t44DUBXQBjh26
	s+Tf3aGaW7Rwd35xlr5XC8XNAYmoCH3inr8YDlPUm5pXeuTGOq7RZ7eLL/REfqkq4d/5MVzF2CN
	4U9h45kqY9uWPdLUpH+K0P9u3bvtOCrpzUHjU/4CijV9ml0L4Leq3VPD8jKpz1fp1Ab7wLe1LAr
	zh9fqKqTrsgeKVCyfAqmkpEUliXZUGnrzGr0P+RfBpDusQWBMW2W3C4h8ugnFoJ1B430guEjTz5
	+DJ2eb18xDVSbuI1l2bIPHCWXFbUTAT3XQNtVziE/yf+sy11/1bzvgyg/ie3xY8p42bxBAKbFmd
	lz4XTqaW9ITEoUHNw8tog77LjjEo/kyrqnu2MNfbkindzocn446NB66HIpIHUfnJ3jljQFaS2Vk
	SQZRdUoNq465e6w+ajqhyNefKO6oLckqE5IFymA9KD/y045YYXvpJjqatrxWHoSUf5hzlP6kGfh
	WS1U+n2g0W9ZFNS9QoOfq4s9V0A7+4A99r76h1t6gYOt4HWTm1/mHHsVSRkITCxfO+7MDR2h5aN
	LHi1MBAhqnkJEA0U/3YXmZZA95BV07XdWZKdq3nayH2lYgl5z/KZ85I/IePJY6iuRxEXoFmXUaQ
	SB4VVVUr1WCjyZaiRi7ZILcYZDOJWgY18D2FFHOF0BqdVOLWVJLSTcTXU8elAjZMHn9wgFdAl8a
	PWjuBg0NXPtJDfonxOrF3tK9V7inzTq1fJ1TJ7iUGfwXc/syg/l5Wv04P7rWv5e+khWwslqHfKF
	Vp87
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr25181830eec.2.1795739718155;
        Thu, 26 Nov 2026 16:35:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 46/69] proj: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:02 -0800
Message-ID: <20261127003425.2166632-47-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133146
Content-Type: text/plain; charset="utf-8"

The default regex accepted release candidates such as proj-9.9.0RC1 and
preferred them over the final release. Only match final
proj-<version>.tar.gz tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-navigation/proj/proj_9.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.8.1.bb b/meta-oe/recipes-navigation/proj/proj_9.8.1.bb
index 9f1e03ef59..0ed8db5c39 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.8.1.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.8.1.bb
@@ -8,6 +8,8 @@ DEPENDS = "sqlite3 sqlite3-native"
 SRC_URI = "https://download.osgeo.org/${BPN}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "af5b731c145c1d13c4e3b4eeb7d167e94e845e440f71e3496b4ed8dae0291960"
 
+UPSTREAM_CHECK_REGEX = "proj-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 inherit bash-completion cmake lib_package pkgconfig
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
