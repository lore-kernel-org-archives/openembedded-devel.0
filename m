Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BFFCA1012
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 06:48:37 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.2407.1757141316432782201
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 23:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vf0IybJb;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62205eb63f9so2068414a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 23:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757141314; x=1757746114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8kwC1nAZCHGHA4Uo9w3h9vBqqtq1+h6kjthFLL4/z1o=;
        b=Vf0IybJbGp+XDPn/MlVdgglwChk8GYSscDVqi7icN8k0jHwNMRf6Vxeu7WGd/zVvIz
         Kr29QOUVpskDKME+FD71ZdUY3hR+AzA1Eo1/yjaolgJQREpHmJpoNHXdFSbp0n/6PzU4
         tMD6y3D3VQQekLgGBs7JL1QGE19y5LLnmSXr6cf2mfThQPSHpG4Wm5rcjKa4BggSvBc2
         IwuIp9YcCDFJaPHo68qwErktLk1ejTzYoPSBT6bg0crcopVLWEXoQMLn5OX9fdxGdQxI
         tfRQOgXgpG+hrtLVoSwkfOIm1iOmklq8u7P/tsQhXU5OENQ8MqN3NfrZ6/ysIR63bGqV
         D4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757141314; x=1757746114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kwC1nAZCHGHA4Uo9w3h9vBqqtq1+h6kjthFLL4/z1o=;
        b=gvg3xMthK3z7ooc0TgFUnfLIs07AzbmHXAutHdM20ZwWU/48oXp9mmudSi/lgoG7uq
         LUxuq0tbRicli/yLfycBW5O6yHtWOz4b4MZ+ngpYL/6xlZGGeBcYiBOYMIuCVGysTW5m
         kye++HmZY8xNtAA0quUBhCUqT9CC+qpM8ZkY283boejs5Omt4NkTgarMwM+oU8rakkiz
         8bLc330GEMTwAFOfMIbqI4UB9st5gttgn2Vy2/ve0Ao3JMgouk8a4/vUOTBVfP9JsgdF
         oIzxR57IBZBVXg6H9zO+R4oC6M+BuEtSzMcvHkU4Jwo9gP5oPtPLUr6lN4NhTXkqQVgv
         hxNA==
X-Gm-Message-State: AOJu0Yw4j05FvWfTJzefcE926aAsFZE4f3FzTxtxR03oe6JD1DbbzZuN
	oJ6/Tqz/MRYDlwo6pXOmb9fu6AoosiXOXIcC5QOJlhxJt1NsmyFK11eqMO9Vxw==
X-Gm-Gg: ASbGnctbVBJFX04BLlwUZEprxxg4QuOz50PEryimZ4rzahyEvY4hUIT045s4Zn17mc0
	Ev7E9RipLDW9bxP5q726y1xngWCP/XlraDnJSbqSEQTecQz8HcBqpmmhAtiLfGZVa1EgulLxh8T
	td9Y522JPCEpKNz0lUbncIcKxHNY13myzibNErXQLCe2IfyAVlPCFhFVYi+O6294kuUCdMgMrPv
	bJBHveclKGSEjY3LU0HJAKQB2Cmf3wbM72Una3Hu95VlIG/5MdM/1DjAhq+bndegXj1lTg6Fbqn
	+L08AcI3gSH62UI1QrJRqnhASxOCbW9bxBwK6c6ikqU/vH1u5biT6DSL4HKW2OTAmvGAMhPQb0Z
	3TxkE44dMY1Ajr96ZkBcOu2BS3I3Ly9Y=
X-Google-Smtp-Source: AGHT+IFNMHPsPGv2TK7rqebsyl9wc6jXdrIUCvk5HwjuD4/ZYivMU8fgtxBuCFhsRl6DQCE19sdMrw==
X-Received: by 2002:a17:906:7956:b0:b04:8d6c:5066 with SMTP id a640c23a62f3a-b04b13fe7eemr118104266b.3.1757141314175;
        Fri, 05 Sep 2025 23:48:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041800e89esm1534278466b.30.2025.09.05.23.48.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 23:48:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] hunspell-disctionaries: fix SRC_URI
Date: Sat,  6 Sep 2025 08:48:33 +0200
Message-ID: <20250906064833.3944361-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 06:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119322

The master branch has been renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
index 047acf28db..eb444b3ada 100644
--- a/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell-dictionaries.bb
@@ -135,7 +135,7 @@ RDEPENDS:${PN} = "hunspell"
 
 PV = "0.0.0+git${SRCPV}"
 SRCREV = "820a65e539e34a3a8c2a855d2450b84745c624ee"
-SRC_URI = "git://github.com/wooorm/dictionaries.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/wooorm/dictionaries.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 

