Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970B6C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:11:01 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28169.1786651852005779353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g92/Ubfs;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c999f162c9aso122183a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651851; x=1787256651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/RP2dzwjBwWLOywD0caY032kt5EKmS1BsWZtRvaUFc=;
        b=g92/UbfsNXiNHUCi/ItcgOnf7z9pI2GV5n4CQcFBYPRiAxFrpHqG5FIJsT1SysCnYy
         W5JqpGaSsCFjJFGC9PCmvp+jLBoaINkiGbYdG1sF81f3ZZjHgmetgDWcSYDnl1YAr0NV
         oXMEgbTreUAIwoYlqkCODDh/EGP/+7RmHSlZUzzO/NacLcp/j72fJJ+5AgYoY106X2o+
         D+MibOXTNPYWS+cNaXkJITiX+FZ7f/veKfD12rwkG/uRU88sr5AXbjcHXzxixmHXSnFZ
         F4yKRjWNJxWTdXeUWBt+4uBRBihEZqjDxUI7Ht1sin6PIgDk76wjRmoaTkvy+CpRxwk6
         V4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651851; x=1787256651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/RP2dzwjBwWLOywD0caY032kt5EKmS1BsWZtRvaUFc=;
        b=g8RZAC+2jFvBGj4dOi8/alN9YrCGiDS3lkDMeVW+H+0KpdsZo8GdTtOS6UK9P7CJMk
         9RZEKDGmtdBxq6fOyZdNgYdMvp7TS5+vQUkO6+9tbg/03QCoWBA5QwbbSNyxUCjOXOAE
         2ECgYB7rrZyv/ngoJhuE8uPxLtDHQA4fsYtUp/i+q2OSgjynxtcPZy87KDE3MEokY68/
         CssmKJpPPXZs8KUUWDliCeGht8qOgTylcTRNhcZNbbLN2dCylqsHpp7LtjDMHFmbB3x5
         iQSBAbq5TxLAdWrOXVDHQ8ipE+XC/iyDMlKH67lpCXaXwb+MwDpsubxw8U3f1PP/QqSz
         c5dA==
X-Gm-Message-State: AOJu0YyNtkhX0mo7nbFoOhAfbFfjPPOL6T6hEypSgy15mAaxWoLdZxa3
	nGfjcVC5UpRT8/OFtCKEn+bCTYc9UggMPgZ/yX7dlM0Pkx7wI/WucsgOARzNUmQI
X-Gm-Gg: AR+sD13xtBvJL9/K7bnWgqQ6DH+QMbtwtXB7enBPN0z3RsRJjvLnHAlYx8g2ZXbQmn2
	OgK1ttnqT/OFs7b/OXHIm/IWtVh5RCyIEQlM33J4EGmTA8ALLJq81EWapuquaGgxTY2dym5fVQq
	UNNhyF7iETgObeMhCEsw3E7Am/5jMMZK++2lCQKCzL7s0FvwLWr2/zgTwg25osESf7V/i2urED8
	HzpZJ8vz4gcuaIc0WNdAIKrLb+gCUN76W9/SgF1Pz1SzjoQfU04WukpdPOiKTyjCSCoLPfVaUAt
	8nC+wc11WBSpmwCNOCXFOIJylf3HGDqnZFQQuRQpJ3qDhjnXPcaoBSRUaO9AKnMvM6VaCjO14jI
	4RauzygLs0tH9Z5+MxjWpeyO0Dy8QeCbl9BJoVQaqaAYCW0P7UdDYgnyP/TfHKzor+uIdapQDWz
	oUzLCGoqbEBKWpIRRS0vQu5SvQdNykIMiucfynlfMuT0IkUqBfbLFxwONQ12M0qNQBybVdCMSis
	T6xMlgCAHUfw9UjnCilPLZhNkQuHvxRxOhJjfnVpOcK6Y6JlATeq6DlnPEulMBGHqURsq721WCx
	D/gvJj2KNcx8CHAT6oDXL7X2g4D21LKJSuFkQQSWwY+oBW+z5WwZrzWEzuRV7h+NzjoRWqqu2k7
	M6whlhnrWB4IgKKngxXq7uwFlGKuZkXfmwJAADY9slWtAncPdwq8uYqpq8w==
X-Received: by 2002:a05:6a20:12d2:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cc71de3b8dmr274770637.28.1786651851324;
        Thu, 13 Aug 2026 13:10:51 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 76/80] python3-xmodem: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:30 -0700
Message-ID: <20260813200834.1302829-76-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129020

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
 meta-python/recipes-devtools/python/python3-xmodem_0.5.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-xmodem_0.5.0.bb b/meta-python/recipes-devtools/python/python3-xmodem_0.5.0.bb
index 55305c6cb9..a00b8a6fac 100644
--- a/meta-python/recipes-devtools/python/python3-xmodem_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmodem_0.5.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "a1a818f31c29412f1cab0cd69deccd7be77bc1feb516723af990d00161
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 do_install:append() {
     install -d ${D}${docdir}/${PN}
     mv ${D}${prefix}/doc/* ${D}${docdir}/${PN}/

