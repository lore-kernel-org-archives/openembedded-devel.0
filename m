Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586E1C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:30 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27818.1786651820507195423
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EET3Dony;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso168197b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651820; x=1787256620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxZxtxxsnUxJIvOGS2kMPPn2OqHRqlE+p7M/ZA7BCuo=;
        b=EET3DonyUUW5j47LgTLJnRzy/olTpnsQBJejj5wCBKa4uEJ/8u+L9yU+oFuKt/35fK
         2k5N8IOswRZF9/Pa54enONGPh+Tg2FIKiaSnEplRPr8RiXuyYeON5hc1oFYAEKr0KCIC
         B7fgx/c6zzNIvd2ki8JuUROqAw0zHmc4YTLDMP7CoKa4ynTCnhWJDnmKBlrsb4+B1062
         ljB0cne0MpS94LF3TYhLXbDdywHukS0v6XnEukYxVOylkN5otgMWS/RCBHJiNOf00ywC
         7GbcmgH1ZrygzgNcMQsx2znJYQC63kqfBjUL+L4ZmDi9NA8L+xqR1zJLJSzoUrUqwhwB
         I7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651820; x=1787256620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cxZxtxxsnUxJIvOGS2kMPPn2OqHRqlE+p7M/ZA7BCuo=;
        b=CGD20Umt8lkKCXU1ce0MBkbP+G8Wm+RYQuSW0FerzdLRN6bynOXJ8nQgdwW2DOsSfD
         O095DKx5C3KgJEvncSQgx+nEAqH3jbvHFm1kdqm5W9mP5bmwV+DcFg88K2VBoVhSR0pO
         gsMPXlsQ9WDz7HInDRC6XOHxWU3Mk2lDsKUFfCBktDMHqwfIh76yMjVJCTMJGZZJcCD+
         XOdOtbOG1lDs2pajdfhwbRqYNs0Q3N9AnqheR3gxOKql9lummL099jIzS+vzndNJWY/Q
         2D3XzMOVgUxKAPtW96AtVrpicJMQq9jugHrYegoxSofnU0lwi+HMbN+c2vZRbweJEmkf
         MLNA==
X-Gm-Message-State: AOJu0YzeVb68UCqwxV2DEhLqyhkA+84NO8EfdUGZWjNugaRT7OJ8HLl+
	d6rzKu8sDibm0lx6G/m6cISMAqUZAMahR8jARmDH0s4m+nPpX7Zsp6jMdVXnAib2
X-Gm-Gg: AR+sD117fiUMUYDNzg0e6MkHbK3T/s4ZBXkNrPFBJKqfCNLhl+tKxzUttA/R4e4tO8S
	FZ57PiSaavLNkYFVJY0CtgX+NzwDQk4iQH0xX+MV3UUhixTc3w+r03EtT3AUy9n+hsfQLbfhzqX
	7yX/IlGLLzYl8lUMxUOTUvZwqrrzfqwXydqZWxGW0AZqytubEI8Fu7W4TBxn9p3/M+hXB2IBp/P
	t0Krqg/WAsVwQXLF9fi9AoyjCqV6Sv2EiK0SfiNXkppLEhWmo3wl51eALLI4ujJLMWbTFN6tRsY
	YwDagTsS7Uge57FkdMj1cUDO0gMHSU+WbwYttmNWkO8ZHabtvHNRx1AqxOUnudMzwstlNx+5o+F
	/yCZhY6SqzijoOthjLO2wXYOASUc5eAg/TTEn6YYrHsr1mY8aaqOyaDo7+ZwA6KijwfArD27ArQ
	Bt9kksSUim8Kr2JLISikf1FvhsHaEYiyOel3S/Y2GjywoLWQFTWOBolQqChdoBXUuHUyQm/08Cy
	ClD1qep9JbAtIi30fMDzkjJqF2hFZui045EnYA0doEiuVfmmRNbVIBFGGB5io96VBfWBKUsIwNu
	sC9O8rLp0VMgFb1ccYxiaDiNzONHhUzqB89qB09z4HrHP2jrynCLvew86dXGo/9t1v/KvE8ALc8
	9XuguV+43rVJk3z+IRTwP0tXcvouC/CHA7F8rBoz6nFT0Gg==
X-Received: by 2002:a05:6a21:2291:b0:3c3:9aff:7a46 with SMTP id adf61e73a8af0-3cc71dcd499mr305267637.32.1786651819777;
        Thu, 13 Aug 2026 13:10:19 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 56/80] python3-pyproj: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:10 -0700
Message-ID: <20260813200834.1302829-56-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129000

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
index 576e4a5535..d2cce709cb 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
@@ -9,7 +9,7 @@ SRC_URI += "file://rpath.patch"
 
 SRC_URI[sha256sum] = "39a0cf1ecc7e282d1d30f36594ebd55c9fae1fda8a2622cee5d100430628f88c"
 
-DEPENDS = "proj proj-native"
+DEPENDS = "proj proj-native python3-wheel-native"
 
 RDEPENDS:${PN} = " \
     python3-certifi \

