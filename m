Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5580FCD13D2
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27217.1762704051136520534
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aydTEblJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b312a086eso485189f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704049; x=1763308849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6eg+h/wbhTkTicsyDT8fy8NZPGKDPr1iBN0n/C38DE=;
        b=aydTEblJpAd38eXN47ka24HV3FS6Fc2MB7wCoMan2tT6a5FyeoA92sJcG7Bha9jQ4D
         C19CSThdBqrS+4s7lSaVlXEqGo1pZ6oZdr6eS4N6n7UZnJaFZuTBOYvxd3HH1L98IkBw
         bE4vjtIT3IJSJnIjtM/xDdxWEtSYPpyzOf93jq5/nxwVM8cKFXcI/LsdAxwqK4uVfo4c
         xpgWfu79zf6RwAtFQCdKrXMlAM7Tec9U5jIsJyCWXYvPlHh9FvO9ANRDtaB7YPlxNgwl
         9voAYzUqOGacQEUcpu6p6OcOSN8Hia12wUk2/w0NlpXZFQN8W2CBOIuhqS0UU25Mm8WI
         M+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704049; x=1763308849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V6eg+h/wbhTkTicsyDT8fy8NZPGKDPr1iBN0n/C38DE=;
        b=J/QMATKThfWgXbcLP2hw7k1hzPQg1R9gYmqRmXz7ElNbu5noCIHYwuwBjO/ykg743n
         OInE0YthHRACVFC3LH2j53t1zZIqFs3n1CF93cttbd+OloIUdwsamnFcAupYsXR/Hua4
         TZ9jNsIkAQ8W3KT8iWFEw3NpXI7dV4a08nKrmGdjBaRCirG6+urzVTzgeuInmaXSSYcS
         SNo1pQPjPAexOrY/5oDc9DQAn1NuLjDyUBWUoSUo+oa1SMz6fYMlJBSIndb0mNq7U+BJ
         lTz6vGa99Hj0WNLDNQj+/yy1JG4+qfbYmZ/kH+bdtW/MgZqrHTkwFhFxmLKXidIP8WTd
         1SPw==
X-Gm-Message-State: AOJu0YxAZQ7BVanGisoUKpRsRgQCz1OzrCqwZMGzcKpoeaEDHbqINWjd
	bPFgSiAGt130MzeGpxwoO1UfzBAWsSesjMofwkAIaEZOINmab5p/ZoKusjm/AzeV
X-Gm-Gg: ASbGnctxRiq6EM8QIgVaeT+15fUo8g5lE5bORDFI+e9zUt2C2E+5NHKZy3LqhtpjXrl
	3ZLJanY63wGUZVBS/yx2zIG88NplOBjYSbVV2eddiqncW/E2TngJjKZG5w73433tkNjJwGY5h2f
	R3nSutNv5MlIDKIqLKJRXOorfbtv268nYMJa2oZiKX9252v5PNPgokVB1cwhspamYUAlIy+O3ML
	UKAKeEDSDdX+ai1PHwQ1LtlhDxIcQwvzArA2nKhhROWCgBmiNmpz8KNfgL03Gw6AC5kupy4BgpQ
	vRNMMf6iWoc+JO3qJVB5i8PRn5AJ6FjDzOnsc0OSZZ24MjY6/BoysZSzSdWvMCFlsq/5fncmsg7
	CgC6OB9U76lmUEUKK0OPDWiEWfkI8my8NfobT9dWQZ3rsYHExbs4uLo0ikNmY3C9obROQV51f0g
	==
X-Google-Smtp-Source: AGHT+IHpZFb/4xr125AqgvcwIhSsaHBTIoSRkZIQf2BinomqtkpidsDbfHJbp3fR2qxelbRErEp9AQ==
X-Received: by 2002:a05:6000:2384:b0:42b:39d0:63a4 with SMTP id ffacd0b85a97d-42b39d0661amr1267485f8f.29.1762704049456;
        Sun, 09 Nov 2025 08:00:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 25/27] cmpi-bindings: fix SRC_URI branch
Date: Sun,  9 Nov 2025 17:00:17 +0100
Message-ID: <20251109160020.2522353-25-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121441

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
index 781dc83da9..db2ff2c313 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b19ee058d2d5f69af45da98051d91064"
 SECTION = "Development/Libraries"
 DEPENDS = "swig-native sblim-cmpi-devel python3-setuptools-native"
 
-SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=main \
            file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
            file://cmpi-bindings-0.4.17-sblim-sigsegv.patch \
            file://0001-Fix-error.patch \

