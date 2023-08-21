Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4677BEE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 12:00:44 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.9162.1692619242583434820
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Aug 2023 05:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DNUrq8Bu;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68a410316a2so552161b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 05:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692619242; x=1693224042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49oBqJvEgqIH0Dsd4D7FxNzjvrBcVtY7j+J25qeQlfE=;
        b=DNUrq8BueX7SD+QJL3OZOCxmeY4f4jOoXihvf+Ru86ZmImJGOaM/FujehhDfmOm5X9
         qGgYLWXhU8Kva6x5LRNxa4rm+3M+HnHS4tuF027jEQm8KmHretbu4Jvt1w7xfV76rhqI
         DilTDJBhGEp5a9+mlKhvk938nNiIJcng8mzajOtZ2cnSM+R9WtGEqBeGsZFbzm2N9Jtg
         GoY6HUZ+v/uhWCwm5exEmi+y4OrJlTMZ5QMv94mXmj2AEsXXHAATv3ZEOlhhQ9+wQZnp
         d+Ja3JAlULdJxkgvkdJQV0amPUVvIYBW71t6lDcHD1K0CKFiHgMKC2wmTu2TuDphGja6
         TACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692619242; x=1693224042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49oBqJvEgqIH0Dsd4D7FxNzjvrBcVtY7j+J25qeQlfE=;
        b=OoLogCj3eDglGUNCQfZefIyNlOiIMnMbOSbTOSPpNP7Hpa7hbNEpMYrUjDj5cwtROx
         X04MMM1D0MR8uOUKJ9srm1HdLUxOb8Iq00jDK8NYJW6yT1y+X7UfGV48BOblOQfvxeNr
         ktqETZcSwgZRM/s7DoeVIFpDwxcxrLguyUnPL7TqEDvk/CSP3k2w3OeQX5LPu43GUonC
         DZonAeMLv83Q2VMu463WtzOAnX6X11Son4u193vikqGmc0kqDa1Zs3c/7QeJLk1hn22t
         NNopeWu9ic5GJVNJ8H0YbOesppewPmO1Ps/ywO0D3aOWzEitq+Itqa+vXjij/qAHmT2l
         /uUQ==
X-Gm-Message-State: AOJu0Yxt3dAKIsn0DEmp7ARImAP5OCTcatiSJ85WVccMY7Zyli3l0J7t
	YQ5JJArCqfiUtFk5zyVhS8ps1tHcKTI+kw==
X-Google-Smtp-Source: AGHT+IEwNOUOexSItWpqh/atCLrdgs7TB0QqerIJlLko82gkOkMCpRJouZFKSJUJSHieQjn2nogRjA==
X-Received: by 2002:a05:6a00:1587:b0:686:bd88:6062 with SMTP id u7-20020a056a00158700b00686bd886062mr5256257pfk.24.1692619240236;
        Mon, 21 Aug 2023 05:00:40 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:bdd8:21f7:9051:f166:1be5])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78019000000b0068842ebfd10sm1207715pfi.160.2023.08.21.05.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 05:00:39 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Sourav Pramanik <sourav.pramanik@kpit.com>
Subject: [meta-oe][kirkstone][PATCH] rapidjson: Avoid usage of nobranch=1
Date: Mon, 21 Aug 2023 17:30:15 +0530
Message-Id: <20230821120015.74510-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 12:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104509

From: Sourav Pramanik <sourav.pramanik@kpit.com>

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index b6ff62b91..65294fafa 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
-SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1;protocol=https"
+SRC_URI = "git://github.com/miloyip/rapidjson.git;branch=master;protocol=https"
 
 SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
 
-- 
2.25.1


