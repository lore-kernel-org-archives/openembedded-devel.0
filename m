Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EE4CAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 18:07:23 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.4501.1757614038215723515
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 11:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jMAGNMBg;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so164155466b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 11:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757614036; x=1758218836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iL9VciZB3rXWrUK1Bd9HfpFWrKVciUdiagntwcLcNNo=;
        b=jMAGNMBg38l/HOS7usmccCPurpoBRM54VODBmhfuwiZQVSJgirXflWjhnzzOLO7/XD
         ducYNt+xvVxERQO4BFqRQskkUXV8he07pEmmupHD7eP6t/lx7kWsepdJyZs9pL6E8Xaw
         jsgjJEx2iOh20Sk1W29lV/UVn1umZL2vnCa23jK2cmGRgDhxYOI/mLnjONZ+kbVVuNNO
         KjMChgIQvUlkbaSaqmoLjoR91pqCEXTD93JfSl4v3xpT2jg8Fq4yrvSPQ7ovfo/1SAex
         d/qDj8vJjMvvnHY+bvYaxcCGh0WhKon6r9icln9Cwn9FYlGSeWPOMijMs8hFgNkh52ph
         bIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757614036; x=1758218836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iL9VciZB3rXWrUK1Bd9HfpFWrKVciUdiagntwcLcNNo=;
        b=i3BCsVCkyGjKIg/lQvVatcn/2DPx7dpM2hghFsKPVXRmyzL9/DB3GisxgZxxi0E70+
         3cK3Zc275M+oDOBzWQB4gOLinE+uKJlv1Gd22DZOrMayFflsSGHtN8gFxfgs/lf6EvYO
         o4+7EgEnjQIAr15l5vgDiQBwqGEMaoEM529UQMw8f2KiU1ETCRg03vvTS7jAJF0757Mm
         1ulw5Qcdj2sLhGykWVibbr0ralUFpTYZirnhxYPqxBNp0H+Vl9q++glYC5oBJNWrdwA1
         9mUr3Htb791h7nrg4dJqCibGMzVAx+frQPu5g+DVW4y3j7qWfD6dLAy/V55Iuf4Ilzp5
         F01Q==
X-Gm-Message-State: AOJu0Yxp25NyiWPs46G+TGqvzciWcIV0oyLFUKfNmeXnhLISvQkSoUpi
	XC8sKibBFYlaeqo7JzDsQrSejBucyAJZnEkDbnYNcLBEIzReaufhJCUhOUOZdA==
X-Gm-Gg: ASbGncsTbRNYx9VuEYnjFYMdTT5wkXz2BRxzV3dwfmO2wOIBQk9UUSHvKT4HfhpHb7K
	OYaFCuX6QSzdBEWXlYQVJfb3Ouufzm3W76sfqE29UvNOGMei1fXzlKsEV6t46ppyDmWZWfgRl1W
	gcp6yGSzmxvgJ9hVvzCxT/LAwOy8BncrtEyhDMQky8ZOHKWVSwgq0/sdMgJLWO2SIhMTQLbXsWh
	RltHL9M9RpILcBYxCq7/PzX+2qsFiCKO80Mc2SCfTFhiqjWycJ0/mrJfMU2yRCkLqAyAn61SXRn
	lVP82uG72o8aabzxj3izMOFnYjv+RQCMarnaXTMlOfg/6Br5lj38N6cfZbf0uR5GNFI+PtLQrjz
	Ip7m6PjCr3cMYbjFohOgTCTg05KswNps=
X-Google-Smtp-Source: AGHT+IFa9qhNq24aUcq/itFedT40P3EJhgjbEtLV5ddG83fUZzrKfZG54Dwx5F3+WS7EzVkpPYwlyw==
X-Received: by 2002:a17:907:d25:b0:b04:c11c:8214 with SMTP id a640c23a62f3a-b07c353ec2bmr8135966b.11.1757614036410;
        Thu, 11 Sep 2025 11:07:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f21adsm180601466b.82.2025.09.11.11.07.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:07:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] python3-apt: upgrade 2.5.3 -> 3.0.0
Date: Thu, 11 Sep 2025 20:07:15 +0200
Message-ID: <20250911180715.3282747-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 18:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119370

This version was not tagged for some reason - but the commit message
makes it clear that this is 3.0.0.

Changelog:
https://salsa.debian.org/apt-team/python-apt/-/blob/main/debian/changelog

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/{python3-apt_2.5.3.bb => python3-apt_3.0.0.bb}   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-apt_2.5.3.bb => python3-apt_3.0.0.bb} (73%)

diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb b/meta-oe/recipes-devtools/python/python3-apt_3.0.0.bb
similarity index 73%
rename from meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
rename to meta-oe/recipes-devtools/python/python3-apt_3.0.0.bb
index d5c440f413..cba4144eea 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_2.5.3.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_3.0.0.bb
@@ -5,7 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 SRC_URI = "git://salsa.debian.org/apt-team/python-apt.git;protocol=https;branch=main"
 
-SRCREV = "3252935b6224b3bd2e2250894b9559b47c61b2e1"
+# this is env var is used by setup.py - if not present, it
+# tries to run dpkg to get this info
+export DEBVER = "${PV}"
+
+SRCREV = "626bf176c1844b63973d39bcceb0202ad36da797"
 
 
 inherit setuptools3

