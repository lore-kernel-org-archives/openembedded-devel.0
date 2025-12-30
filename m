Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D80EE4989
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:49:13 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66704.1767109747434065915
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hf7CZkpD;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477aa218f20so62367775e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109746; x=1767714546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZw2f5FnqWqVyvqY9Hulnc7jTT5Z3gnu2FqlRvwapQI=;
        b=hf7CZkpDN4mmM2cGWviHqLTW7+8SrcdMeRQAuFFqmc3sakBGfOoIqFNJF3gMtORB2V
         vlOZYM+yHoR/gLkCShLVj/v4Jgo4I6QfCDidNSK89LGCkzfsiHHvxj8Q9Pj8CnpIfUh2
         pv1KQ0Ezoy2mZ19hAYkBsWPJC2SxBvrjA4iUgYO4O2mF7JOuh25v2xWWXIVOUbYpnoSd
         jiwyMg7ArpsWixeXi4umAVYsiESY7yEaogpTcUzgxY4VAG91+j2AFDAH5euHmjHF3M+u
         vwEbRY+a7YSaRKTzHZyJeedZIL/hImGjJpccNyzPNZlWhvUvrKwdx+/D5w17icjUoY+5
         oltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109746; x=1767714546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jZw2f5FnqWqVyvqY9Hulnc7jTT5Z3gnu2FqlRvwapQI=;
        b=dPt5FRMBturiMFr2Z11na7fOXEYGaRafNI8/Za+t6YXMVUMaeTCkHwp5elpTHO3ojy
         Iep8wSFOK8AgfPyhm/WfWIKeyfxvGNI1IBBmEwlmTvvVET59ey+vV9EW678HUhozcRy1
         aTQQiL8rUMsmJ3EdgZQhaa2jSu+zdunGNrTiyyw+BABTCSp2zJNad/cnl//X4hOly4dB
         yYm+rVmCX+LDXiN+IPXKO8hpYTKy9/KzJmEy3emlgcB/qof1JEZOF0V6znpueDdA2QBv
         ndPumBSLjCBKwND8fBFXpHeJeMeiUCOVLLRZXv6a8H7Rp+lJ2aPBelq527ttHUZ5vLmO
         Q7PQ==
X-Gm-Message-State: AOJu0YzcVOoNgsvauykx/4cAz8OJar4hssR2QXc95+Xx3nf2fL2R60US
	bGLn2iYBobNaphtUQCKfO+srhfRQ005up5qq+61h44ArNgDtNCCDxEe/S2aaTQ==
X-Gm-Gg: AY/fxX5Ntl8xUKrZT/Xxr/yCWN9wufPVPQQ33C/yfnqX7kkCMLIqRhNWG7HHSWa2jyj
	y6boBJZUXr7vUdySdMEWNAeuDVuI/cil8PoTT6xBXjUuPCy0mP57wOWS9SUxiQYd7C0d/rsyP/r
	MFWfGu1gqzkQopgtlEpyAclGl5MIlPx5h8cASwPbtwygmyiA4qi1etw91SeAyt5t0cTYgSp4ryR
	dxi2Nur5/zQr/e/nWEcF1avtkbJcwSKTDDoYic9p68B8t+cBF9Ng5eXMrb+YwoQYv1K7IbUiKVf
	6rRYYfXfA841kepNCOwS/0abBkKHNQCVA/9JoL9xw63k8nIKHQaZUVrWTJx68WkoTGBZWvN8LJ8
	Pn/uim/sxvECIa0C8QkeM2DL49htMNpECqUieAJnA8rAmI1pPWQhQMTHIUAI96Z57Lvw5Ae7Ov0
	jQt6Q3hCW4
X-Google-Smtp-Source: AGHT+IF7cMQZ437oEClJHNNWevHI2j/Srri6MlYBNt9XGX///jogoYjIBonmgXUZws3upFFRG5kzrA==
X-Received: by 2002:a05:600c:c086:b0:47b:e0ff:60f9 with SMTP id 5b1f17b1804b1-47d19577114mr276292625e9.20.1767109745723;
        Tue, 30 Dec 2025 07:49:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm253051225e9.3.2025.12.30.07.49.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:49:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/10] python3-marshmallow: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 16:48:56 +0100
Message-ID: <20251230154903.736590-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230154903.736590-1-skandigraun@gmail.com>
References: <20251230154903.736590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123029

The default python:marshmallow CPE doesn't match the CVEs related to this
product, as they are tracked with marshmallow_project:marshmallow CPE.

See CVE db query:
sqlite> select * from products where PRODUCT like 'marshmallow';
CVE-2018-17175|marshmallow_project|marshmallow|||2.15.1|<
CVE-2018-17175|marshmallow_project|marshmallow|3.0|>=|3.0.0b9|<

Set the CVE_PRODUCT so it matches related CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-marshmallow_4.1.1.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
index 2919897dc3..01eead0cf8 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI[sha256sum] = "550aa14b619072f0a8d8184911b3f1021c5c32587fb27318ddf81ce0d0029c9d"
 
+CVE_PRODUCT = "marshmallow"
+
 inherit python_flit_core pypi ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \

