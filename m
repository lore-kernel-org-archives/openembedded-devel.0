Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ED4C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 06:40:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.16290.1703054422338840137
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 22:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nh5VWYwK;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c256ffdbcso62568545e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 22:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703054420; x=1703659220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5Ri6+fOFlwFEq0Ub0ZormxuPDwTYIcDJ9EsV07NiTg=;
        b=Nh5VWYwK2/zpAf48UabDZDvunU67shVSoBh5JjXJsSG+x0BX2S3HTqVG+LapmBhp7T
         s+cfbSaVkfzX7jQxHDzRKRVmhc/lGxwPEzcjA/B2uo26APQ2k6i3Yd8uAJv+OqrnYoOv
         rIpk4yxX3BGn36S/pZNkG9AOv5vQ9aDgeDOtuDB0E3DU+rZE1bqKvoPK9hneXywtlj12
         1eeiMozSc3g4yZYwJaIzRfbVWGmKmoCuaCtxiJHRk4XpoSUyhaJpdQEJk83K+BDr8sTb
         Rv4NcKik1t8Mmgwegb42JiMn9aa0wNmscCFzWadvLVc+cnNt3PIjHp97y7+m/tkxh9i9
         ZKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703054420; x=1703659220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5Ri6+fOFlwFEq0Ub0ZormxuPDwTYIcDJ9EsV07NiTg=;
        b=FL+oCm9BImMiVsyHp0DioQULNxZlY3knNl1zqtNl/1VDTFBHr5SrrguzAzK8XaSD+t
         eaULEUF+XnASuC5gsMqxwEG6U8t5tfYXbN6q3VUjdCzIf9fwG34I7d4r2uo2gchd8AfK
         Z/9q04e/PGrVrw96/kVAYyHfb25KJZZDXDLb7DsmiaY4KYcyZie1v1Vm/U6TB/fgmXPt
         nC5LWJAuptPi3IflfklM6536jbB77DXkPksvdJ5mIIFVHdegezfeQrFRX/uHR2FymYYX
         D8jDEF/4l715VRrlOwFWnuPTkqHgIvQMCZ4Af6S7fmr558tdDidDpTgn36pLpHKadxOZ
         bG8A==
X-Gm-Message-State: AOJu0YwkAjqTJmDh9LpUkusTPilKnOLLTC9wjW95VPTqbTPgxQlo+Me1
	V7N0d6MO6/dAZui/AO1OEM0zMMiD5mU1ow==
X-Google-Smtp-Source: AGHT+IElw7v/CqdBuAwT9ADFucNRh4kC1bXopybcLR6qHsPLlhwpeuU+4HRaD1kUskb2c0uANymsMA==
X-Received: by 2002:a05:600c:46c6:b0:40d:1774:b5a5 with SMTP id q6-20020a05600c46c600b0040d1774b5a5mr2890573wmo.163.1703054420191;
        Tue, 19 Dec 2023 22:40:20 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c1d0200b004063c9f68f2sm6058611wms.26.2023.12.19.22.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 22:40:19 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] qpdf: upgrade 11.6.3 -> 11.6.4
Date: Wed, 20 Dec 2023 09:40:12 +0300
Message-Id: <20231220064012.30571-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 06:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107644

Changelog:

* When running ``cmake --install --component dev``, install cmake files, which were previously omitted from the ``dev`` component
* Fix the Linux binary build to use older libraries so it continues to work in AWS Lambda and other older execution environments.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-printing/qpdf/{qpdf_11.6.3.bb => qpdf_11.6.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_11.6.3.bb => qpdf_11.6.4.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.6.4.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_11.6.4.bb
index ceb9f25ae..2dd7b684e 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.6.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main"
-SRCREV = "81823f4032caefd1050bccb207d315839c1c48db"
+SRCREV = "d8371889d070d2f88636434ebd8412708a63e54e"
 
 inherit cmake pkgconfig gettext
 
-- 
2.25.1


