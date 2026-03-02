Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CCEEA4E0F
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 14:56:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162188.1772463368365525627
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 06:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hfoKKjuT;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4398f8e2837so3966044f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 06:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772463366; x=1773068166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/soyfJ1+PGr0RuK12K2R/Hlr5ArZCm73xfPr4pzgUk=;
        b=hfoKKjuTJg4+nJY7HvhLTJ7r/TdhS6NsKJzcBAyY+WJZbcXHKuRQuWwxi92oSRqFhc
         k/vmLgKp2I0gstTXs4RvnCN5//uP0H+u3NpZXL5vlQl9AANsT1vkaNx95j2q6zsJeGCO
         G8tLVE0TpL1Y602GP2oat3wAVQeeyDyZNjQMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463366; x=1773068166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/soyfJ1+PGr0RuK12K2R/Hlr5ArZCm73xfPr4pzgUk=;
        b=qQnHBxRnevRDhWXJYRY7c/xJKYMoo27ToQDrqfua48jyXTYMtxz6y+Oo4lPLRXAx/H
         FHbdWdzz7zZ9wWP3swyO1kSWkmt8JKw43ssaA8/vfRdp5ye+b3ttaWaZ7i9jJeERsUi7
         H+2f61OfohG3arEQJaDGz2vgAnO92BXLt0d3v5Dh3ok1G5Ao6lMwrBRxiqBmGdr9bnst
         DX1kBC3vgei00Y/xG53AeyPTL+qcD/KYJMTI6K5rWgkI25VAQRCZba+RwRNjyh3e0yKZ
         AmRL9d/xBslaBnP/N5OePRa+JlsR5Wn60JNjvxpoRzcOJ9T8R14BOGkGQiZYxpzcdf71
         Hr9A==
X-Gm-Message-State: AOJu0Yxxz6bcXi8GeC8aEqx2hULFgBfkardTQydr8vhj/NhLY8OIKffX
	zPsz767T+QwZrDafkVNwR4BfFPGBeVcgvX2Sk0vv0OqjEVoIbsyQnINBghmS9xNw6IYYqW169UB
	gHmpE
X-Gm-Gg: ATEYQzxSNmoRoy7kYKUdspJkiiFT3YjFdPZVRe5ukuZ9kqYij2ca6gU0zIl9bnN/IZ/
	T5VwpBFRUXvttEG+e46Dz3a46ykrEr7+lGkvm1obvXQ0tUFkb8eZxBYD4kB1smP/XNJFha1ouyJ
	Ho3aZy7QLQ6oaL9YQplQQUK49KEj11usQ8L1L9SGZPOf87wv+lmn1PPIDXshGko3rJBFuqIiBgJ
	1CbSOlxffhrYlQSCKZO2whZausnB6yXlS7/Gk9hBcH9mMklEgd3DLs+Xcqyjq812N3K0GKdKcvL
	xumIEFcqrLBOmiB1WElKpj9Kqf1afsXMbn3sVaON3dp54CRK/IQBAfY3clMCnf0Tw0iiKRdWHEC
	LPN6OOKHrnJhO94VGGiCmQJ2bZdLLGeU9fxfL3Q0IpeSIU3PYhuRG8GPHoJsBRTuWh0wt1OLumU
	BeGQ3ChSQ1MnMshBQbNPkxco5M5PCh3VJ2J8wT
X-Received: by 2002:a05:6000:26c5:b0:439:ba69:101d with SMTP id ffacd0b85a97d-439ba6912e2mr4297628f8f.1.1772463366087;
        Mon, 02 Mar 2026 06:56:06 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a25dsm27445295f8f.21.2026.03.02.06.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:56:05 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-rich: Upgrade 14.3.2 -> 14.3.3
Date: Mon,  2 Mar 2026 16:56:00 +0200
Message-ID: <20260302145602.1385229-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 14:56:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124807

Upgrade to release 14.3.3:

- Fixed infinite loop with cells.split_graphemes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-rich_14.3.2.bb => python3-rich_14.3.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_14.3.2.bb => python3-rich_14.3.3.bb} (88%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_14.3.2.bb b/meta-python/recipes-extended/python-rich/python3-rich_14.3.3.bb
similarity index 88%
rename from meta-python/recipes-extended/python-rich/python3-rich_14.3.2.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_14.3.3.bb
index 302b1fb862..a2af61840f 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_14.3.2.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_14.3.3.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "e712f11c1a562a11843306f5ed999475f09ac31ffb64281f73ab29ffdda8b3b8"
+SRC_URI[sha256sum] = "b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b"
 
 inherit pypi python_poetry_core
 
-- 
2.47.3


