Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F5CD2C12E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.19547.1730817424182358757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NpTxjNPC;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e30d821c3e0so5594468276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817423; x=1731422223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlYETZu8ImG0k3xDSQzBf0M9KR/dvTRfZVT+00tHCU0=;
        b=NpTxjNPCu12Ob2IkbM4F8yjSZFcFbOulOnENKHZfsfzZdtjHyfY7XXFe71tFnpPZv5
         SSTHf181+SgrNID/DQ37YHdYAiLcEpoQqwqE/yYyypM6IO1cr5kQT1OfECShQwEWeoUd
         Ywzq+ylA5USYQB/p3oNqbBkdtkQxF01+P5mphaxlPBgV4r82CDju2jAlSTEpAQeB5Ddd
         uKVH2B58+OkryIh3jWjQvUdVSTEzf8LnYQqaCvQGjQ21zUzF+Nsw6zavzNog9lZ7ElyW
         FQvTRM4xZeS1fhkR896gaV1Vahdf7FMNx+4fhBR/ztR61CLhU89OCWdshQs8V2aYYjye
         t9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817423; x=1731422223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlYETZu8ImG0k3xDSQzBf0M9KR/dvTRfZVT+00tHCU0=;
        b=uT1QlfGam+gQbK5T+3d+htmhiENObSake5LRuqm5NSq/IdzefOHQPz//nPTlQNsh5e
         XAMsAXL9r25t3ONCpVpiotaPfn5WHXjzOPYGlh7Ora7rdlzbLqabQ0XaJ7H9d6GarNwR
         BhlSy0DTkgKbN/nIY3tGEHu6OQU1L0cJAWsLN10i+dQnv7nogd80m5jhEctaKhOb4Yv7
         A2jKpdQz8VYR1ltk5WnMRWyprsxf/Dkzn1rQLrTyMJuKFyb3popGo6EwWmMjZQ2y9U1Y
         PyimrOIhG14zLVvKHJ5xawX4Nw5Umm4U4spS+2nv2kNRfBYb10gx5PMrGzvCiwtjzsiF
         XIXQ==
X-Gm-Message-State: AOJu0Yxw7guUnaPh1guRgSwpZezyc7mzqyjArRYWvNKJfzY9lWTe6OPE
	6i74jhXsSFPfgYiOVRcf6ZPweSepS3IHzI/ShGzkuuSKlZIC4ptip12l1Q==
X-Google-Smtp-Source: AGHT+IHyjZz4AJmL/ImrC75djuYGhLqR9y5gEoYTxHnNo/ZSEoKCIi86nnAQZAkwZ9DHFVpI9IEUWA==
X-Received: by 2002:a05:690c:9b10:b0:6db:e280:a3ae with SMTP id 00721157ae682-6ea64b10af2mr169385657b3.23.1730817423257;
        Tue, 05 Nov 2024 06:37:03 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 53/90] python3-sqlparse: Add missing rdep on mypy module for ptests
Date: Tue,  5 Nov 2024 09:35:18 -0500
Message-ID: <20241105143638.2301245-54-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113471

From: Khem Raj <raj.khem@gmail.com>

This is needed for fixing

Failed ptests:
{'python3-sqlparse': ['tests/test_cli.py:test_encoding_stdout[encoding_gbk.sql-gbk]',
                      'tests/test_cli.py:test_encoding_output_file[encoding_gbk.sql-gbk]',
                      'tests/test_cli.py:test_encoding_stdin[encoding_gbk.sql-gbk]']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
index 62de2327cb..daf67607f7 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.1.bb
@@ -16,6 +16,7 @@ export HOST_SYS
 inherit pypi ptest python_hatchling
 
 RDEPENDS:${PN}-ptest += "\
+    python3-mypy \
     python3-pytest \
     python3-unittest-automake-output \
     python3-unixadmin \
-- 
2.43.0


