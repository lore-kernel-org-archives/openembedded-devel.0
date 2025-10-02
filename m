Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B04CCD188
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:37 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.7549.1759409975366607404
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jSNB/v3G;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so191616666b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409974; x=1760014774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=An451gvuNOVEqhSbDiza99CSpFYfy1jUwQqFb9JbW7w=;
        b=jSNB/v3Gc+VzFl7CBt14oZn0yKtKqtNXKZCeHyiIrAfHxrpCcRmhXro1cwpo7F7sXF
         kwgphLqJhG/UUguTroCPrtMWJiUiiiwz7edMYAoJLcIFN2wtsuGRbHFr1cGGzmyICURB
         tnqrTmChdUeDah1BiPNPzCyZgTWymlsjrzpItjDzPs0IwHf/mYyA/YKmUkHVFG+ej+fZ
         wOPtNZUQgVTLJXZRMWrrP7KhfJ353M4nX+/hsYqhsI22eytoagVnrRB0zxu28+dpmLPM
         qgTb2skYaElKyU4jBd0ArCYm8wyv+xUXs0Zw5Dyz0oNag3MtDssCnXUX/wfrWvwDKGgD
         tvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409974; x=1760014774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=An451gvuNOVEqhSbDiza99CSpFYfy1jUwQqFb9JbW7w=;
        b=O8ZVSSnfX8O6tWcc0H3lgmYNfj7JtVq/B+bWk9mySBQI8ZLJxWCVWvOGKeBi9WNiCH
         fgBFvsKD9/tzS+e4/m9CJUYNxXqIDdXisTVfsoOfRjmmqA+xNlTZvgGEW8bwb3Vgf+1o
         TcquLHalp/AF6SkBNpfCavRx15Tr1Gbl769equnMv08OaH49E7JCk85MnvDmaUZQmme5
         T0MooAgXFzQo+EW0zpfBkcwmmozBTQ3iq2vuAVlUtpnhiyz/3lbuY5Kw92+O72vZIqWZ
         lhXLotMl1i6K5XBwfeBQcj6Nf8PfjC/xQixW9kc1W5bC1H4s0+SfqLcCd2QVeC6roTES
         jiHQ==
X-Gm-Message-State: AOJu0Yya+pwqcTOKU17sGUA8owFbWmLgd9spoirrDXlU2XettQRck4n4
	/Q55ec7shGXcxaQjwFUcQTBweITeL8jBiEPGkwsBTA4qA7srCxjy6vf/C5HUSw==
X-Gm-Gg: ASbGnct/dgxQBP5XWBOEbvdi7CFtSjbRFc0eZ+STXSxXc5HEHntWWwx74vXn/t3NPjJ
	3Qrluf+0GyzDNczst+r9R3L/wX/0loCT5kyeUAS816SmZqNkmF8+TmQMCkl7639N5UJbrJAt2ry
	rAT6SWkO+Jwo8XnPu0GkAuACIDmK10Nx4K99wNTuFF5ghgpGsCBFSnPLyrijOMCXELquIb7nM2p
	KRx+q4Zkv8uPYSQN4bGYWNoE2Q7mNa6jYSiSIXb8M6JxKOW/kWMxP2SREIY0sSv0/AMZV2JQXBO
	a5qRZWijHDs99OjayEJqUwfecPVvYuCfvEdXwBY6TqJhy7WwkcDd+A7Le5FjjyRET770oJ6ME55
	xxSsJq6A7ZZeIWs60qGONay+STFzUsOEZ82A47SlNi54TSLNB1PDawfs=
X-Google-Smtp-Source: AGHT+IHjvfk8ly/kacorMYKf01ac91cWWVNhaxYnI05yTbiWYx47mbF9uPjt0N5SdefehzJPxSZozA==
X-Received: by 2002:a17:906:7312:b0:b44:fb0c:5c43 with SMTP id a640c23a62f3a-b46e985e163mr937474866b.57.1759409973672;
        Thu, 02 Oct 2025 05:59:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 08/26] ne10: append +git instead of gitr+
Date: Thu,  2 Oct 2025 14:59:08 +0200
Message-ID: <20251002125926.2624522-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120177

From: Martin Jansa <martin.jansa@gmail.com>

* looks like a typo introduced in:
  https://git.openembedded.org/meta-openembedded/commit/?id=6e431331d18ded23a78e238ed40d03434e7719d9
* use +git as most other recipes are using

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
(cherry picked from commit 10703e5c6a51ef14b357c5c2021979ecedcaeb13)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index 0e16b15c97..9d0db23bf8 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/projectNe10/Ne10.git;branch=master;protocol=https \
 SRCREV = "18c4c982a595dad069cd8df4932aefb1d257591f"
 
 S = "${WORKDIR}/git"
-PV .= "gitr+${SRCPV}"
+PV .= "+git${SRCPV}"
 
 inherit cmake
 

