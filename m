Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E75C433FE
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 05:29:41 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.30011.1642310976481002380
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cOZctCjb;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id i65so6684809pfc.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k6v8jBfOm8qLx4Aplarh5BphwE3vT9v2v4yCEvlepsQ=;
        b=cOZctCjbay65gw4GCIGe/z6KH7PXc7G/xso2Ea2v9b7dzCPDTVwGFAI8GRxDbgV5KB
         Jc7bA2Yt+xEcdR/dSTnW4aFQ3nFmPDLj6P4XDn5SmaoRa0S/pn2Hj+PpMsQL3IYdWwmo
         H746ZII1J6hhWV3ZpUgwZ1uo5hZ8Nag3RkwHw+ijd4tBZCKJU5dJCeSZ1CV7sXY9IvKm
         La2rseMfhXVFrhYBrpDulmZ2eFoowkODUKPU3ya3vWXb+KAGB9BNI/Q3H5+ePqH7TZaa
         ZPh5A0hSyhWhT9tSLuRee9WM2pHVRNOE2h0URPJgjjuLyir0W+UX1UffpHl7Da6xqXVG
         0XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k6v8jBfOm8qLx4Aplarh5BphwE3vT9v2v4yCEvlepsQ=;
        b=P9kXN8du9yT+gyOWlh4VggXIYUh0Sz962knzzyvYVh3w8WZlNUfBv+49q5xOAWHsLG
         EWqwFVRQWMGa3oO+SY43ujMIP+8xu9O11kroKaUxz8DGAXj4c1LZvUmu/g4RnprtOKUj
         7g/Gd4oM9/ndwIEjSANOBSR7YZP5q7ZwYfgzB13i8RLAQIj9otamT7oPjlTKAIN2WBYD
         CLXPTXeGsWWL7IRg60k9LSeuEQxrN/lR+H+aT9cutQkQPLn9uyijP8gWm81u+hDqEW7f
         pmjIcCx/T+l09YMrHfe3yXPj+de1fT6hPqAckFYPE3UQVD2+tRAp2cszxrSdBzxMOU2Q
         NjEg==
X-Gm-Message-State: AOAM532PCWBC8tz4OsAeJD0B3GrChsNqlXwvLrAJIv+4TNzTqb4+9nQC
	u91utmRCLPDXqbURO3PkrCPeXGyL0dwIXQ==
X-Google-Smtp-Source: 
 ABdhPJyBYnLjzKuShgP4XrdUrx3GY9bCoYWlHGYvINsnhRu9DEi0JqxndeC98hR/f1lT6czRQPx5dw==
X-Received: by 2002:a63:8bca:: with SMTP id
 j193mr14041091pge.227.1642310975762;
        Sat, 15 Jan 2022 21:29:35 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bfd3:7196:2716:eb37])
        by smtp.gmail.com with ESMTPSA id
 l11sm10062146pfu.115.2022.01.15.21.29.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 21:29:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 6/7] python3-cryptography-vectors: upgrade 35.0.0
 => 36.0.1
Date: Sat, 15 Jan 2022 21:29:03 -0800
Message-Id: 
 <be66b745dfd4b567f138bc1f6aa023f5c124ee61.1642309436.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1642309436.git.tim.orling@konsulko.com>
References: <cover.1642309436.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 05:29:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94881

Add note to remind contributors to keep this recipe in lock-step with
python3-cryptography. They must be at the same version.

5bd0c10d allow parsing of nonstandard country name and jurisdiction country name (#6641)
78c2dd8a add AES SIV vectors (#6608)
c451c1df add AES OCB3 test vectors (#6606)
4da2a681 Allow parsing CSR extensions with the critical bit having an explicitly encoded default (#6600)
bb05d4b5 allow multiple identical pem blocks (#6551)
f4871a21 add accvraiz1 bmpstring test vector (#6503)
667e7a5f Add new PKCS12 test vectors (#6383)
703de3af Accept combined PEM files with multiple sections (#6365)
51221b2c support legacy PEM headers for certificate and CSR (#6356)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...tors_35.0.0.bb => python3-cryptography-vectors_36.0.1.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_35.0.0.bb => python3-cryptography-vectors_36.0.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_35.0.0.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_35.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
index c0ab9c85c1..b9e6b811c3 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_35.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                     file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
                     file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b"
 
-SRC_URI[sha256sum] = "978ad96822c0e007a0a3d8187eb0eafbd9eb1d67b50cfac70277175e74957bfc"
+# NOTE: Make sure to keep this recipe at the same version as python3-cryptography
+#       Upgrade both recipes at the same time
+
+SRC_URI[sha256sum] = "fc8490afd5424342b868215435bd174dcd76ab396b4ea9435498be5721dcd598"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.30.2


