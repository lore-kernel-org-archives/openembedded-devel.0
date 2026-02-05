Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E98E91279
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:08 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15259.1770274805902625638
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=alMfSPGS;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48068127f00so5078165e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274804; x=1770879604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQA4u+dvwiqOkkhiCnp2dcfLcLwiXx6cJF/W1pbEeWc=;
        b=alMfSPGSZfTmL9iuYYI8TW3U7Z8YSLgGVg8fl2n8V3Xd/88Bdv5ciocz1hse6nTDgx
         DfI9lSEYzB29NoB5tYs+zLEKohlm5WCmLq3fqVy/fdEyvpQv4NuDz+4a3FbtfGbwY2vD
         sFkJYK2qD0miSEVVlt5FSMajg5n5UMVoBWMrXzhXd9mwcIBPmEgfK28b4WuxLHefHt5j
         Cx8xV+QwY0+pBJIz3XWAxMOJhaSFUbafet8rN7hM29oZnj8lZpLYVl4DkIYJDMwLOLWt
         PJZobpQYaa04OxRCdmmm0l8gymxYHWYJIXC+9EuWh6VME5FNYKvlnmfbsBq8g/nQN+uo
         vydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274804; x=1770879604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BQA4u+dvwiqOkkhiCnp2dcfLcLwiXx6cJF/W1pbEeWc=;
        b=N+8iFks3dCqJjq7uGyfyK38bnWJIEkRSJKisEOyEyYNTQmZoheJpeRqgOEu+tx9FAy
         kLBmpZ0BwWLhvONZaiB4cxyUG2Hxzuz5XT6V5Xgh4/nSfMA9c04dAVp5lpKGERUY4CKS
         FdRTuoRBRMysndfVpQQrPJPw11DxP4mFfEdwC68qWoGknYU4moH96fe9LFI/XJLtK3ib
         dXxbsVHGvxaq5RQ3p0erWTt/4OopVVENvtakqstjH5wJAXtrj5Y8JZYjfy8caqjt50qk
         bg5sNWisaXSEac92LDAHYv/p7kxUbKP1sdRHe63suZI0ay8OpxA66flCUb9J23rU+Txc
         142Q==
X-Gm-Message-State: AOJu0YzjLs677xZ0ZaBBRkR68yBJW6MoOQDLMqdUXN0XowIDGia74KIs
	8fdAHz498ZwXVGXVFrFD/XNHBBfH/PkBbjNpzLgeEGLoUDWPBSV3VVoK3p6Wvg==
X-Gm-Gg: AZuq6aK0St/FYDcGvu0RJfkq6Ev3QH1JxcS2CVUi48LwLJJ+FZFQ+VEjvazGU/MANik
	N9A0a5hPiJLZM0B3t+QNL58/QbTbZ0T8GGwU295h1SAal3J2eJz9C8Bg/31po+qUG+5fPUd6OYz
	TARsjmXyVFO29cYpJhNHij3VhqGiOiX8baNhw+WchYWqcVHMcR0UVa+lYuzExMDyyg+8SIj0o3c
	ASBaPWyxk1EfUYtjDDo3C36wrkz33WYs0eNDCgzZqgWkrzQ0B61+C4g25uHLVbsH6/DbCP/+NV4
	aoNkaeuDUzqYhfzS0hFzo0IXTg8eMC9r+mq7PkJ2vz+L7LJ+4c5KgKGvoENiFIYH9VO+qnRDGuk
	m+7scWiZXsDuZXrWei2YN4sNLfHI4aJpl2sh5INtxi/P9HXDTlUTOhwTi6O+lbEV6W78VnVN6lm
	qRo3lmzQ+e
X-Received: by 2002:a05:600c:6383:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-4830e92293dmr67842965e9.1.1770274804153;
        Wed, 04 Feb 2026 23:00:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 11/20] python3-pyjwt: ignore CVE-2025-45768
Date: Thu,  5 Feb 2026 07:59:46 +0100
Message-ID: <20260205065955.1267785-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124187

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-45768

The CVE is disputed: though the vulnerability is there, but it comes
from incorrect configuration of the library by the main application.

Due to this, ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
index d23347878e..3954c526f5 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.10.1.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 SRC_URI[sha256sum] = "3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953"
 
 PYPI_PACKAGE = "pyjwt"
+CVE_STATUS[CVE-2025-45768] = "disputed: vulnerability can be avoided if the library is used correctly"
+
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "\

