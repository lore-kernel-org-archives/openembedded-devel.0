Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C86C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 22:13:36 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.7248.1705097614224362051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 14:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3606eb704edso28814325ab.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705097612; x=1705702412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKrtW6doJpcaHYGOB+y+3G+YVzBb50USAJgfuus5xn8=;
        b=erWlsdFvtk97Zkp9w4oSb5kVGmmjYGQBVF/B4d9i1TyRISiaQoKhqQdewKeZLybxSw
         a74YOLP7DlVB2hjzgrP9ADZcLpLqQUnAWvQpBylMSQwwfvh31dNZwMgZWjMjcH20quLE
         +iudqS6zRsmE+g6opNgLZAvCgFRZ6Z9fbMbHrXXbdj23BX7bl4CYL2+Uwlx2amp50+j4
         +fzYNd2yX0+VLzGoRepgy8v4p3pVSlxRvaYtmrj27r/M89EQQy/2WgXKjYbm49250lH3
         DAveKcoEeV5/Y623yPjsC7NE3VPfiFFIR6zdbwDIPW+ufVd1D+pcDTut3gnfJFHJ6HCJ
         Rkgg==
X-Gm-Message-State: AOJu0Yxnf3Ju1de64/Hgl8HfuBYwMreKbqOLqpZtaaq+iJotz9augOGM
	1c5EALHypNpbKvVS3OsbJnBJOp3strgPNQ==
X-Google-Smtp-Source: AGHT+IFYuSkx2M6FgVc65NyWbNcozV5xIkqSvB3e9sYEwenG68G6HSxjIRlOWKVWjyD1sno+Jf0ocQ==
X-Received: by 2002:a05:6e02:1448:b0:35f:fc75:ef03 with SMTP id p8-20020a056e02144800b0035ffc75ef03mr2133573ilo.40.1705097612531;
        Fri, 12 Jan 2024 14:13:32 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id d15-20020a056e021c4f00b0035faecac7e5sm1206971ilg.35.2024.01.12.14.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 14:13:32 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-google-auth: update to version 2.26.2
Date: Fri, 12 Jan 2024 22:13:26 +0000
Message-Id: <20240112221326.3039576-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 22:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108260

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...hon3-google-auth_2.26.1.bb => python3-google-auth_2.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.26.1.bb => python3-google-auth_2.26.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.26.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.26.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.26.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.26.2.bb
index 1a4913b71..9bd0926ca 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.26.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.26.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "54385acca5c0fbdda510cd8585ba6f3fcb06eeecf8a6ecca39d3ee148b092590"
+SRC_URI[sha256sum] = "97327dbbf58cccb58fc5a1712bba403ae76668e64814eb30f7316f7e27126b81"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


