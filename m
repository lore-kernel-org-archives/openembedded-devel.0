Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FD1D2B95A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.19602.1730817409626232442
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQip/M3o;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ea11b32ab4so36752917b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817409; x=1731422209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDixlagmybOA11+yWFYlbtpqXlmZXIj+ia0oMsRnVy4=;
        b=JQip/M3o64igOJYA1wQIMMMphdieQX9/s6uRrGkWtABV/xyShRS9LQaCQB+JQjmJrn
         k3n+TpHuPwlCl5Txhq7dgn+HdpmiS+tpUFeQAx70kZd/WBwHY+4MWVADmga+kyohQiMF
         TnNu+Y9/fwa28hZGbYhIPZL9TzflYu/rcpIqgO+B+eTSnszhH27G8E3Bm1Fcfa54UAqz
         16LRSTyKvZ2lPcDAvqb0YabCqbdPOYgQR3fhBTOArL1WQ2cOeteLrjTmaoMvsUDJ86BF
         HXdpAwUtDwpNetiETIUVBBWLk7DIjqH+rqzZ8aHjVZidyyraTVay708/5Svm+wiJXloa
         xbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817409; x=1731422209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDixlagmybOA11+yWFYlbtpqXlmZXIj+ia0oMsRnVy4=;
        b=pFWyiAbvOzIvuctYAHFLSLErkbybag6dBAZA3AVhx9TTwir9LTkCvwoH5USPlQPdyW
         l/OEzBS9HYqtTxH6KCQnhZ2GgqAeQj1+tPIqcM5tii5yz1O5axwsI/oxzr77q/SAhiwH
         jjTAHwrBfV12hheyp2R9gWgXEhH9Jj2+7OUeW0qwDwKA42NkBZ6JgfVohX57FvdLlNsw
         Ta/rIE6WF/Dh18f+38uA2KaP52AykOMq5+DxrlMRCE8Ai+THnme3rO5i4gHBs/bfihzj
         AJ3pAS+790b0ZlUb0bp0OglwPFKlW++oN8ehNcB0HAyNf23BN0jAXe4T0LMkHeGhidli
         yb8A==
X-Gm-Message-State: AOJu0YxCYGI1c0p+7JqVnw5Y+xVJawcQjyyVyceIifBRHc13ygxeUGK/
	Ohscg8FH9zo5qUbteYdVOyj2J/P58tHpmR0Fug6Mu8nzhwTmqEYLNx6iMQ==
X-Google-Smtp-Source: AGHT+IGATPnpUKUNYMX13uoUwKaVRTDLpYpWwy6q8kZ2GDFxsvMenl6fio9JTEZtoN4PpuawbsPx+A==
X-Received: by 2002:a05:690c:67c5:b0:6ea:6f5b:cdbd with SMTP id 00721157ae682-6ea778974a8mr107535507b3.14.1730817408498;
        Tue, 05 Nov 2024 06:36:48 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 20/90] python3-regex: upgrade 2024.7.24 -> 2024.9.11
Date: Tue,  5 Nov 2024 09:34:45 -0500
Message-ID: <20241105143638.2301245-21-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113438

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Updated to Unicode 16.0.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-regex_2024.7.24.bb => python3-regex_2024.9.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2024.7.24.bb => python3-regex_2024.9.11.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb b/meta-python/recipes-devtools/python/python3-regex_2024.9.11.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
rename to meta-python/recipes-devtools/python/python3-regex_2024.9.11.bb
index b6e09fc83e..8fbae0cdcc 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2024.7.24.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2024.9.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9cfd009eed1a46b27c14039ad5bbc5e71b6367c5b2e6d5f5da0ea91600817506"
+SRC_URI[sha256sum] = "6c188c307e8433bcb63dc1915022deb553b4203a70722fc542c363bf120a01fd"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


