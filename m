Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC327EE4981
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:49:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66709.1767109751730899385
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dt7FDRNG;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so50622965e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109750; x=1767714550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apyBYuUjwDWCMFCqVuTuP/YJ8ArVR5hOb+Sjnf1KOAE=;
        b=Dt7FDRNGWd+LAbhRAkeK9X2KcPd1R4y72E5ix2lOSpvISnaAbk20t29hj1crb847pP
         uOeHkB74FKWZ0+Y1HrBeOrkiZ3MZy1P3kO/TDl/uYk9rfCnasP+DCKlAFn/ynXRwBXKZ
         zFfdGzgxYb6rZFqgPkUoEOatVT20i2QYuTv2OZsPaMXwblSbzDs8cS4cO8EK0/dH2Va+
         MHLsF4Jr0g2WPHfZ6aHw+49j2jZij86qemdLKGe3g+2tpsUlSmXgJd4e6pv8gB/Fli9S
         Wzu8azFoTGQKD/4YgtEsliNDczCfF8tfWfW/CUWZYlrENaJwLTOKFR66CT0LsKXH1pu0
         AIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109750; x=1767714550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=apyBYuUjwDWCMFCqVuTuP/YJ8ArVR5hOb+Sjnf1KOAE=;
        b=vgWg6O802tHrAR9s4qR/R85etosWZmPv8MZTHTCFmiwBqo3Rcx9odDYoC3dX4ZFXRP
         1lCbutQRr3TNT47J61Kjn769GzXrbf9x+x7dWAR7UNN2VlqhmcPhIiLFr9VZpyFF/JhW
         2DQq88g9yzx4azhPJFXxHUZJgN1HASv9/MYl3STVR+XNiYahRwdpS6iq4VyXx5U1qCPm
         PGa3n03sGgWyp71WTl7vTKMMisOBVJWmyHcclISuPZgE97HA7U4vFR05NVgxJ72WYHfD
         DyE8edAjEhe339Tno3Egz+n6se+xOM+Je+9o4kdDv8UxLXF/Jsez251f+aeVbRMiacLh
         lRgA==
X-Gm-Message-State: AOJu0YwsKtaIVo3O7Wj3wCZxfom7SSj8Z+MaUYVdjgq2V8mtXjl34HRB
	Oz9HWSyy65aEF3tXcxL1I1bDC2Uzebza6WgJBgmSIR9/W0l2IrywYVMRYx+sIw==
X-Gm-Gg: AY/fxX5a82AWZrGhPX2LF4jjo2NMSQlB3ivOhgabkp4tYnzZtAHMtC+BkP9E+L1bTrM
	6YlzjW4k3PjPOv/v1ziaP3aK2ccgkJVUrlx1YQrEPj3k68hCOwP7x6yWwa6tn/Tq6kxQ8UGp11+
	SarpgfhPV9ESrfFatXVYWWih7qS83cDiyJDrCZxNeCUK5Uy3VZKYeIkfOkIiweRFtZhZQapoBNw
	wsiX53mVpa2x4HYmRcoHO4cVahbzIW6sKdJy3ZcPOcasa0mjqVL4rPi9HoLHFyH1czElQCuYQsT
	9Uxrll4GCvstwDaLbaaWkR5LNklkKikrWhLcex/K7fwJa8+GG91pWKQYFsczMdqvk5QZjfr4x4p
	1I5yLtIZPVOrmnWs399CXUkrVqcnvNPs/h+rjWMe4ztwNQ7E/xdHaz7eqHk6dvse4EkWRskoa3M
	0l4l1Z6RYL
X-Google-Smtp-Source: AGHT+IFM1AmeyDSQn20dq3t1CBHs+9PCHD+muz0o4wp69wFrEXNkqmtcsXH7AYx+q9mtM/jsR5q+Eg==
X-Received: by 2002:a05:600c:3106:b0:47a:829a:ebb with SMTP id 5b1f17b1804b1-47d1957b115mr381383355e9.19.1767109746348;
        Tue, 30 Dec 2025 07:49:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm253051225e9.3.2025.12.30.07.49.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:49:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/10] python3-parso: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 16:48:57 +0100
Message-ID: <20251230154903.736590-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230154903.736590-1-skandigraun@gmail.com>
References: <20251230154903.736590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123033

There is one related CVE tracked by nist, using the parso_project:parso CPE,
which doesn't match the default python:parso CPE.

See CVE db query:
sqlite> select * from products where PRODUCT like 'parso';
CVE-2019-12760|parso_project|parso|||0.4.0|<=

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-parso_0.8.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.8.5.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.5.bb
index e609a4ad73..2bde8c3f40 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.5.bb
@@ -7,6 +7,8 @@ PYPI_PACKAGE = "parso"
 
 SRC_URI[sha256sum] = "034d7354a9a018bdce352f48b2a8a450f05e9d6ee85db84764e9b6bd96dafe5a"
 
+CVE_PRODUCT = "parso"
+
 inherit setuptools3 pypi
 
 RDEPENDS:${PN} = " \

