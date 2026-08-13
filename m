Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAED4C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:09 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27809.1786651804357423949
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BbvaFkiA;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so212531a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651804; x=1787256604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYNjZAzx/8CpQ9fKVutVq6Uwu5yAmoMimtBEp4Mma68=;
        b=BbvaFkiAfZYbEKQ2Sh+qEB54BFxetUG3jerpM11Ro+btQxJJUIn8PbSQh2sICBCpdV
         kWAUe5kj3kWxu8sgONa/AbYuOdtYC+ImCY5Tem2x1EVcH/xSTmRgQ1CesunqlDss99vw
         +h3B06+pMi+p/wPi1do5i1ZXTH6UBXIfwkoNLO2VXUi4rMtdJr4NIOysl5YM+y2p4HLY
         bi2IVoq6Sryptvi6jMM/ZRAoyh8LIr6K8ZX8lG+4EbwP7lURenh1s6GU2CaDjqFiNooF
         Fh1UWQBQWGmr80ewOslpl0SjnOZKOoyIBmXU6eEObGKSFmfCKzU3ikm0ZZKe0qAAG58q
         wydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651804; x=1787256604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DYNjZAzx/8CpQ9fKVutVq6Uwu5yAmoMimtBEp4Mma68=;
        b=S+B/l6E5rxhrHmi/bZv2SjQvmK+z3ynhwmHV17feIIo2Y0QZLU6amPcNPI8cHuyB1O
         ntOjnwz9PFOOaSlzOLgBmL8gWuNHeccgo/i3r4nTgsd/O64kQZ3sghPN6StDYOgf8wqV
         JDHnUXGaTliXn0nH5iCum1NhZNc1CjZfdYCo5fB5zq8I5Oh9Jb/v0TlBR91H5vbnm85P
         jo7tzwSQ8qwhux+eFHokqbzR7Z0FQCHWjrXQqJn8EylOaox0ZeLA6jsWJR+LfhXvV3FC
         TXSRw6iMhFXzrv2Uw3St+O06chTJGZeD0ishXuJ+khtV9HHYumRtyTXaaulBvEL7649f
         j5GA==
X-Gm-Message-State: AOJu0YxKUyJnz3cYwYvFO7BMfVxpRRQZ2bqYU2z0LjB3J5x/jvxjvjId
	u/EsjDWXRr0yysxG+ylhcISi5YD3kY47GkoQ0pvc145Uw/akNu0+MwQUng4yA9i4
X-Gm-Gg: AR+sD10w3LwJ9ibwsjw0SvIc/2pzfcf9wxr7HkVgpZ8s25tfmpJQx6Rz84efLvIcji+
	D/h6NFqjyG3HELBzkUl5pYiei1tOLI0ed9Aaju26z6lekYeO9nIUOPM3nTwLDZGvGAobPvZXHdv
	ciryZ1o6EqP7LCMgoMDR+PdmHvzebvuEUwWCm0p4t19XZN7Xb/bGWyBv6OOsJKLhx18GFa3sVYN
	SSCSSHKKUZl1fKY0Q03E8vwGxnivMsBDNUAu4Jv/ZA6I5ko5OlZNYk2SGJvo146pEXY9pw8ZbDh
	bNMW9n2fqsz/oTgIxklPbxZoMe9wI7qjd77mGaDvf5HqaD3fC7erPkpV99QcTg7CQJcs8v/jlBk
	JTIhI8pUIF2bPzyZz7v18lgVknhEt0far/peZeSzZKC/APIcdgnMlBNekbtvtkEsgdVBcJRKB3G
	iUNOFJMxh2VPeKMIdIhhLRltNcnHqiK2PXVpoqVHxod+D4uf47zXhG6300o15qBGRfDJSSPitG4
	2vN661fZBfUBr3f3Np6RLsYuLSFT3RnHXiFBSyPOmTLECOiSpkP4FqjGGeBw/J139fvksaODs0+
	4wkAE+NFW4woyJgUT+tvCB9k0O7VN+lyFj4ADgbgO83/Jaofly5mVS+rXqHk7Jqlppa5M/yHsVi
	FUsASR+Q/sa0R38xN7xxqhjNdPijAGwLzvnBhf65JJSTbSQ==
X-Received: by 2002:a17:90b:44:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-3933b717765mr595120a91.3.1786651803549;
        Thu, 13 Aug 2026 13:10:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 47/80] python3-pure-eval: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:01 -0700
Message-ID: <20260813200834.1302829-47-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128991

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
 meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
index 63212346c6..5dbc8b203a 100644
--- a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
@@ -9,6 +9,8 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "5f4e983f40564c576c7c8635ae88db5956bb2229d7e9237d03b3c0b0190eaf42"
 
 RDEPENDS:${PN} += " \

