Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DEFC5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:07 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28087.1786651743319100434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Op5jO+nQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedf318752so157275a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651743; x=1787256543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SdGYjcUf+2z/maXs9lvWYHR7AMKMXyIWcn80EtaJPc=;
        b=Op5jO+nQ/9zO7hdeCW/kUXEQhMSP3QafpMmO7ymh6zkN4ukqMkWjIckHbGUwZfqTaj
         A/Z1NzdbpIrtYjv3zOWLcpdp4awWlcXHIbxut/dXzkZssHQAg75GUrG2YN+Aret4poLw
         5IVBGaeXrrOr7WAPQwPpkgw/eyJhmyX7JOmXFRJ6sF7P2cK9oIFTC2nVoLDge4k/iSv1
         TdTy5k7+1Br8SNxJv7/KZYUX5yulicRdr4aA4VuwJbjHbcdPz/YjXatsQVB84D0vnkkY
         jXSlGglJuI8McJTGWbXwEfWf47CH15SLiewZ/QL4vALXynfNPoJdZBMk09JJoLIXta53
         Iwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651743; x=1787256543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SdGYjcUf+2z/maXs9lvWYHR7AMKMXyIWcn80EtaJPc=;
        b=i+8q2ui83mnsZb7UDlXRyhjUhhCgSMKll8lJAxcnP+spI0EogZg3kZvsLrk5UTwyKq
         enQeaPdd/iCp7gAhdB+tQ+NSLFSikizX4K/M+lFe2OgqocpkbaRlGL0kK+Kc47mq6DZk
         3/fZQv9DlD1Z5XpiFzbG/3OK/fuLBuFxryQ5aFBI/f5OcDayAwHj48s8CyEsQ9KWNqbd
         CA20W27tPOUOaGKgPA/WzlvysZOsDqHC1w9erUM4ytzvqUPO2ddUDgY+9yWKuIv/yTN+
         R6vLmjYAkyA9GoPKsloUGdU6tEH3CSXh/ZwSAIw4f9BvFpNSLhFEGPn94exrXKgSX2D8
         8U/A==
X-Gm-Message-State: AOJu0Yw8//mrW2nJgj6DO11wpwZZ+q154zcSPMJe7/VCjzg3n+on+35E
	8Frg0PNYNo1168OkkYwrXl4lgIVVGuG8YQrxIsigyFMvXNa/WzydmTvns5UCF6T0
X-Gm-Gg: AR+sD100criVIjaC1kaJg6oyxYQo7mcAkTR+7EP54fFxn8FFAXyhLHLKW5R8Mh8KuXW
	sN526F0cNXEzdyZc00qByi+rX1dqwo0JiVRFyUK4NjFTE0S6BQ8JqVy9OKNqvnXKxb+Ib9t8yjS
	1fFCUtDXqFq5484Xq+3n95Ple+F7/X+zkxK1Tm4iNOyQDwJ5kLypJTNpVmOdGmeDr0jQbj5UhyJ
	7LHIaoGWk5vRdVz5VQ6BZvweHloT2+JA/grpG/pRdfCR4ThF7TGmIT8NDiFNRamezSuMY/QmlmM
	GEbn8rYPr0pzIyMsi9RmcjkehElxjTc5zldVqrNenmcApaPNTvrIGT6VnJ8j8iyxiSnPcf7M1st
	GBfGVzNRMdjPU1vTGc+2P/+BZDGxA/vf3yYrNDn732z9x6fCHqbzV6nvj/e+J9MLXm7O0M3gIXY
	FAzdrZdFjVKRG/k25HbyiP7hPdplev0w+39vUWrMW0Q+6L0g0xJbg71Rp+YxFlEVn5lSACGDctP
	I/UFVnbwwJ3Ixf/WMc1oz4inhsvIlZpSxZdzevy/giXC+1lcwmSZDeUbZrspI2vKw8nLn3oLCz5
	V8INNbACge1To+nXfkb7JZHqbmUuAlLQXz/tMrKHv/ittdoZ0JdrPhqUM6rs00gWsr077iZe8ZC
	jGZPw2lGD307ya+zjf5fAZJs4dCdxOoqFA9UrujZ2tnFFpA==
X-Received: by 2002:a05:6a20:d495:b0:3c6:3c5b:fe5f with SMTP id adf61e73a8af0-3cc719fe46amr440501637.2.1786651742502;
        Thu, 13 Aug 2026 13:09:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 13/80] python3-click-repl: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:27 -0700
Message-ID: <20260813200834.1302829-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128957

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
 meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
index 46cf1b3784..b0844ed5a2 100644
--- a/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.3.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "17849c23dba3d667247dc4defe1757fff98694e90fe37474f3feebb69c
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += " \
 	python3-click \
 	python3-prompt-toolkit \

