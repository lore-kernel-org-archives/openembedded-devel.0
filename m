Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E78CC6B3C
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32840.1792043078642179242
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dthIUtTa;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e86dce4510so24893125ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043078; x=1792647878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pyAS73C4CY/oRDyagHMj90yapEnPT7ieYY8JHkn7hHs=;
        b=dthIUtTa3a8ih5v3/9pQCbx7OdgN/vRTyqB/kMUMqbyTZi4Sv5BAMDDMEN+OmAOABv
         uE/8m3x1/sO4HYKlwIu54xTPrngvKT8CE6yUmc733gPeGrAmrBUK6R31TX1tuYjVMDXR
         g751642jV0Udb4P/1stRnqlHtq2Gv/xpiGyG9X17nlxgJGuuc/Qlu8k8rCE16Zfnm4EH
         pTeCEYD1wG6DchzrHxj2mZfQtEHdWC3XqP0zTawMxf85f60UqyiqbpUgcQvEtfAEeuDW
         2qJO7GnvE4Th7VFWsrKkma2UQC4wlu3Q/g7+Yd6dER+6eI9gU6nbnJ7Fz/B9xj05O8+T
         g+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043078; x=1792647878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pyAS73C4CY/oRDyagHMj90yapEnPT7ieYY8JHkn7hHs=;
        b=RrdUX7LRA24gitZ6XUYEtEcQ+XdXmHahFyZHE14gTQLkiwasd57N2cKmWkDAHluK0K
         pLOCNDoxd6B6+c6yhAh6WD752qLK+UcBBw8Btv9B/517d47pCbciMfBtNghQ8a+3zYwa
         339kFHli2ZMQpmiesL425su58YB9KKWaWB1CCluGc+c0TlMZPK4XyZkKTFDeSQ5zEXAE
         QybWW7c9w7F5xStvNNMH0HZeMIxMUcrG16CvI6ItmdCMUfuYkpxRkU0bDI+LA+sw3ugF
         rHQA6cp+us9LHDH0Yd8lmo8XEkjw3DSrxmpma2HORLb5kkQ8nwCIN2ZG1EQTodtOPKnO
         ZFmg==
X-Gm-Message-State: AFq9FYKLyRCHyG8g4nRrzQQmuEq1PRS+JeZJzaZUkMLZwGGGPuuNYcoq
	FiJW+1d3meNcTDEAQQxIYoq2T/txm+zl2dsqWjbpW0yrIIRB+k3QbdzPkSi7RA==
X-Gm-Gg: AYBFou2rlyq6ktwcE9SuNnrEAbvR78x0L5SlNvcxsgKS5MkmlGdbZM22KevBob8AnH6
	HjqTMPka8j4XNk50N25NjWb/Qg5XVLFYMD2u8FMOnEu42Auh7WbrAbaMzvnEPWG3IqenYpmCF8t
	euKJ4xg9UQHuDJDEP7UaRaIceXMnbtDWPiyvkEIHwjdNJorfI9U5tb88zlLbHhQDUloX4wRzOnN
	95V8PbSf2BcX7H79IsJXpHJBJLO6/R7+FaRTUMyEJhTwx5ORT1pvvy4txRD6svovjtbDX4tc9YE
	X4RaKEB1LnYqbc2QpkDa1qVgWzXjVdvZGHcBtA7RXXkirsRRktY6wO5I0TnMB+KiAAxuPhGSCN3
	ZlcSbTPpX2T+Kerqhn0OdvbI38DHRNdmAEdgvneCp6j35jsf7vWI0XAIyrAcawOqhQHkBf2FV7+
	pSaU7P7KZDY43q8Kgjy1Hqw58WFt9yOXcF9U01B746SHvmd/dCHNdx/ivID5r+dNtnGCLjcibmQ
	C4idlwAIEDfUc7DSvX5Zac=
X-Received: by 2002:a17:903:2f87:b0:2e3:598:75d5 with SMTP id d9443c01a7336-2e842f24cefmr127538105ad.74.1792043078001;
        Wed, 14 Oct 2026 22:44:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 50/82] python3-werkzeug: upgrade 3.1.8 -> 3.1.9
Date: Thu, 15 Oct 2026 18:41:38 +1300
Message-ID: <ff9a42b633c1e5188e73ac39132dd59f7f0d8bf8.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130970

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pallets/werkzeug/releases/tag/3.1.9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0d101e1633262c35907fde6fd2708c0317eedbb5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-werkzeug_3.1.8.bb => python3-werkzeug_3.1.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.8.bb => python3-werkzeug_3.1.9.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
index fae4de2a3f..d3b1598f78 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44"
+SRC_URI[sha256sum] = "55ca7c70a75689be937aa27f8ff4b018f06ff4838fc73045560bf0f5a1291060"
 
 CVE_PRODUCT = "pallets:werkzeug palletsprojects:werkzeug"
 

