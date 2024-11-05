Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448D7D2B95C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.19603.1730817409847921994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cWb8oKtr;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea339a41f1so47484727b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817409; x=1731422209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YEThlVmbvpaoMOGceU6tUa2H8pKU3AjwD14LJ3V1p0=;
        b=cWb8oKtrBoXAuJEuDYHIN3TY5hVheGzPAXhtfjMTGPJH9DqAu8FDRK0DRDIX3/sHGZ
         PYG37hm+f4rSOD4Zt9ddEaPGssSh8/PRC7zJEYjflj96m5KQia350sv26dt/PUd+c4Vz
         Tl9tEPiw8Z/8X8DpPr3dzSY3LA8S8q/HtGTM54SvYdX5cpY6dBJalC0n73YwRfn+4Ln1
         t4jEwaQtm+kikYs7vToh9qAnBoh7bp6CsB1QEaBK6TYHox95ays4GENNVu65zbAJYytz
         emDL1U9HKNzg15FnoS5LgOO4Hr6txlWBV2afakBjoKWeq5htbIU9lg2Gv5VElJzdK2RR
         bZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817409; x=1731422209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YEThlVmbvpaoMOGceU6tUa2H8pKU3AjwD14LJ3V1p0=;
        b=qnK55bDCuFz0+TYies9QJTWXQ1KCd/PGur3l78/hLRtHUvSyajX2L87t4emT7qRndT
         Z/+RN4Uovp5HvXmuQJLtkaZTkiH0USuRnwcrjezGYv076dyTNvcz7FoIs5uZgLuOYVYz
         LKRnm7rsSeg6GowFlMTwF2t+7Yp0VaCS49PvPTEx69HTsyGf+sNvPG/Mj8DD+B9jgqhD
         qUKwIdaEGsNfTZfxwcssCqVJKOo/Kha3NJJNDzpJZVR2PkR6rlveZpwrprNFD03zaxhv
         Gw6v5Gw6okjSKh5UA7x8ArhD9KEg0tSccjRnvOO/99YPu2TUSu1gUnhGBaiS4Dg6bC9f
         BJvw==
X-Gm-Message-State: AOJu0YxCgfcZHhgr+6OdvjIKddcRYGxYUNisHMHQ0nw09HyK3pvhlJKx
	ElKtb86b9NzIiYzKSC2gUQT/qhh1+izpRmzvK7qs+TZRuXB9vnDqCEMdDA==
X-Google-Smtp-Source: AGHT+IGPGmwv81FnruBaRs8zm6SOP65mXN+5KN447Rw1s/dKBQ60O5wqV7i6LvJm4TH3KnCTTr9UJA==
X-Received: by 2002:a81:b554:0:b0:6dd:d0fa:15a8 with SMTP id 00721157ae682-6ea52520ba4mr144440047b3.35.1730817408903;
        Tue, 05 Nov 2024 06:36:48 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 21/90] python3-rich: upgrade 13.8.0 -> 13.8.1
Date: Tue,  5 Nov 2024 09:34:46 -0500
Message-ID: <20241105143638.2301245-22-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113439

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added support for Python 3.13
- Fixed infinite loop when appending Text to same instance

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-rich_13.8.0.bb => python3-rich_13.8.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.8.0.bb => python3-rich_13.8.1.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.8.0.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.8.1.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.8.0.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.8.1.bb
index ee66c35541..10ce1987bd 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.8.0.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.8.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "a5ac1f1cd448ade0d59cc3356f7db7a7ccda2c8cbae9c7a90c28ff463d3e91f4"
+SRC_URI[sha256sum] = "8260cda28e3db6bf04d2d1ef4dbc03ba80a824c88b0e7668a0f23126a424844a"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


