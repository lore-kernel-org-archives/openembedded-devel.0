Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C90CD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 10:02:26 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150598.1781604145253590233
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 03:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cXGfxfp7;
 spf=pass (domain: konsulko.com, ip: 209.85.167.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa63daf2a5so3186904e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 03:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781604143; x=1782208943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEkomw+Vo0ZoBEDYDKDp/NvL2zk4utF5QgdlHQ+uhEA=;
        b=cXGfxfp7KL8l/TdDHv+kSlDjMZ2KcbO63Fk7LXkQWp1okiHs0j3L+7tZkH37I+LXMu
         Ga/aAXItnuxyBn/EP2GmhM2AwoGR1k/efm0XqeuIXc/VG+wf0woV93Zl4OacYUS8iH8K
         qtLrLrXQ93Maw74u/tAEJuhimIxr3gkw/jbHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604143; x=1782208943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dEkomw+Vo0ZoBEDYDKDp/NvL2zk4utF5QgdlHQ+uhEA=;
        b=SQcorbcSxZ5/HW2f5PpihjRxXEfsXDXUBMbsXLvzjgTAy5t2WjloYQ28ctbMDPTut/
         nGtEoIcvvYnAKbdPeLIIY5WNFEndCdX0VgB3F07HkJyD4jeIQQ4Hx97n+I/XduWxwN/I
         FDPm4Hj22Tm8J7ExxVBva232Nq4PXXUOY6GmbGSQCFwoJVApzHX9tzLW3ROkEWxXyngK
         ec/vFar7GW/LkH080ZySyDyfpHhLH2jqVgjRbGRN2yWi/5bdhYWb+lFvoyjTK7JNWpN7
         M2xdWDfbpNf8IapuodW7rivReqaCOCNiqNn8E1/do5yBojv+RmdKT3k/Ds3tGxtMGbAr
         CzHw==
X-Gm-Message-State: AOJu0YxqCggY9bzMkNYB5m5UGgJCY4K0pi0hdCtyTriEWeitIj5WpX2/
	dl1mSWXQgYIHKYryEE+YAjHfI24vW88QJ+k6DvK5so9gbtWUa2GC+R9lYR79hQlw7GGxsuoEsQD
	ZtSWp
X-Gm-Gg: Acq92OF1ErLXfq091XZw/zcxe6mbBN8GCuBOxadTMftkf+u//K2/cLXGG8HYGdOM04E
	GgVnWDP4C4FcdxHxP6AWXbWwR0yggQDLhOAW4kZjAMjj/gtd01e+9dKzbshnR2r6+C4VzSE8Q+i
	REYLeDPm0AnrZK5wTB/5YZIYOOy9QGo5ez3KSSV1zXQOKMcUm/LpPviEFOCrH6kINDXyn0QDmaE
	CcDh1grUBfXrCzYzoNAZojTQfFT+OraQasndM9dgBTd36olxEV4gtUxrbsLdiL0AStmMlnR4ltQ
	stp6YRq27EgeN/oMmYvfXclIsoLldR/WUn7ro6/4LFTkxicdQNjOcE7lJgt8tMvS7+J5LGfS2mQ
	U4pMPtlXGQ36bhZOAkGXvSgFZwtoZv75grC1uhXwdyMBAEtVabt76a702ZPfObhq6dWUo5w8d2X
	BoSzCHLskdwubZDjtquxVma0Wg/jHqIV19djoP
X-Received: by 2002:a05:6512:3128:b0:5aa:6b70:325b with SMTP id 2adb3069b0e04-5ad43313658mr726710e87.7.1781604141958;
        Tue, 16 Jun 2026 03:02:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2d9becsm40940932f8f.34.2026.06.16.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:02:21 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-virtualenv: Upgrade 21.4.2 -> 21.5.0
Date: Tue, 16 Jun 2026 13:02:15 +0300
Message-ID: <20260616100215.3640011-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616100215.3640011-1-leon.anavi@konsulko.com>
References: <20260616100215.3640011-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 10:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127618

Upgrade to release 21.5.0:

- Set git identity in upgrade changelog rename step
- Upgrade embedded pip/setuptools/wheel
- feat: drop Python 3.8 support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-virtualenv_21.4.2.bb => python3-virtualenv_21.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.4.2.bb => python3-virtualenv_21.5.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.4.2.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.5.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.4.2.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.5.0.bb
index de4c20f7c4..e21575ac16 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.5.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "38e6ee0a555615c0ea9da2ac7e9998fe8dc3b911dd33ad8eaad2020957653b0c"
+SRC_URI[sha256sum] = "98847aadf5e2037e0e4d2e19528eb3aca6f23906422e59a510bff231a6d32fce"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.47.3


