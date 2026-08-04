Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ECBC561E6
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:41 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24976.1785872435312842699
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jbmr0oXv;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc61541f8cso17181145ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872435; x=1786477235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWjU/Lc86VqXBsH3CiXPyGdGs4sYXX0HyXloUhGQUEo=;
        b=Jbmr0oXv21UfhflwB9KTMzNQcdjcsml2Y+WtFBlzGlcLYrDx0j0ZH2P84wo2fyeqA2
         52Nhyi13so1Hu+YGUsITWn2uiyv6FlqjKYl21Ishg2u1BmLTpeO5V2rMa0aLVFw/0svQ
         Dvaht0nJ5aeUOpc2beGUABSCDpfcxwBToc9keTalQC1uK52pHYDJUJ4IpMe5XkcKJSBl
         68Spg9CQzo/J5LMxC+4GgSDmYvL/7BPGLOtwj3Y3/nkfVrDiPAS+xMHjewXI9ePs0xUY
         5DoznbG96MUmOW78j5IpqGNeLcwP9Gw2+ZXV+eYy/WFgWWemSkcX6gPbwK8Suzay0sl0
         ulxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872435; x=1786477235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWjU/Lc86VqXBsH3CiXPyGdGs4sYXX0HyXloUhGQUEo=;
        b=WCI52ofvXXBlGLBGNYsnoSOvApW8Yyr+xKqlQ7hEiJ7Yk8QAg43AeM6s5lonULkK1W
         7N2UReZLDXkA5xRyDZuA0VfyGEaoRjRaLQNM3Nlh1c7eiW2j3YWiseI0hcuZFhTcU2gJ
         HCtXmx9q1OR+apbMFVW+d92yy5wEr6HosN3XdiqrJgicfUF7pXJGCaIEHXDoBUUKPSIV
         WMW7p4mtySDlE76MxzMi05s1IJ9bqEpjIns1yK3RHX/2v1QYqFE/9uxXf71TWh3eJ2pt
         14pZjGrgORKZ8m78/tVtwB23562szJKZech3HPQOF/Pgy98sQRDCOfxRECO4c8TatPnj
         +HDQ==
X-Gm-Message-State: AOJu0YwOu1mCvQ0PerHBXipf5pJ3pATZkKq1HM5W3bU3V6sLH3BrXINt
	/Y3vQXHCkoURI2pYe4XXeZsH+GOU3mIrsOEGpWSDosEq6zVApKDxsUOu3ywm2PaT
X-Gm-Gg: AR+sD12UE27A5yHJ+mPjNyE//vZ04/+81z9SwFwrCcn1OIpJV/CePGUMB7445qWGy0e
	CQ0XTH76UWC8IK8ttmrxYu8ZmgigFxDV0RQZtYIGGfrARNoRLZEp7FwSpR9UiCqzezxO0Ho9m2U
	sg2BonvcQKAaM20Y8NgfrcAiGzVr29fn8cUQ0tvGuBFKU0SDxgJFv0l0grXjxP1ZofkMOOy9WvQ
	Qdfkage0jaM6h02ECYIhfAJDybSdEajlBccsQzWmHKVEg15s7cAGAfvj+MM6zWZTs4rfXcQwZwl
	KhzEg4JzWEsGIW+gSNISkYzI2dMvcG+LtliuwZScxsdUFW38xJHE4zPZVQUFRfO1t5vcdJUEHGN
	Lpax4ecYsW3Un3eBJvO4tR8Q4CvWRUk9ubYvmtq2UaOWvTz5qJMxxV/7OaU5F2UGXZaUSvjQQX4
	rMyM5QhJg1MnJCEQkquHFxwSGZcugwVf3ZY+WmmUEYAwtHvyJZTnpliclvLVwEJSDdebMQ8tdRn
	w==
X-Received: by 2002:a17:902:d486:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d08aa64855mr55737205ad.9.1785872434695;
        Tue, 04 Aug 2026 12:40:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:34 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 10/36] libopus: upgrade 1.6 -> 1.6.1
Date: Wed,  5 Aug 2026 07:39:37 +1200
Message-ID: <20260804194003.3158916-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128757

From: Khem Raj <khem.raj@oss.qualcomm.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit e1afa99e211ed41fdd2fc368ab87986b6a1411f2)

Release Note:
https://www.opus-codec.org/release/stable/2026/01/14/libopus-1_6_1.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libopus/{libopus_1.6.bb => libopus_1.6.1.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.6.bb => libopus_1.6.1.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.6.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.6.1.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.6.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.6.1.bb
index 0e2bf09898..14c1cbe0cd 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.6.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.6.1.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b365c2155d66e550e1447075d6744a5"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b7637334527201fdfd6dd6a02e67aceffb0e5e60155bbd89175647a80301c92c"
+SRC_URI[sha256sum] = "6ffcb593207be92584df15b32466ed64bbec99109f007c82205f0194572411a1"
 
 S = "${UNPACKDIR}/opus-${PV}"
 

