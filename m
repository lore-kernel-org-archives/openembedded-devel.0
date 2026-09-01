Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C676CC61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 07:13:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2334.1788246815474167261
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 00:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KH+EIej5;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so34647105e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 00:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246814; x=1788851614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+fC/eT2JnKkz5B3XfImtctX79YyQVrnp/98wsPaaY0o=;
        b=KH+EIej5GtfBs9jfAJi75TUD4WoL0WhTvnPv7Dwa1QKHe8zTOR1nBnFPLurIFSVFLU
         2h2gJcpQGnWfeozYrs14E+gO5HJlxTYNIm/Wb1r7JOV7zjT71/JyaDDU/QQsgzvbbPAG
         vC2oXHP1UmPgIRc6S6ZCy9wGddAx/F2OB8TyKcRH1ZtYLhhe3S2+mUwTDUCjL80Shuem
         oCkL+cXuqcbwdio/JAruxYlna9LyzQ1kBlHT9mCKq6XUWai5DjZTws4Par7E/uXalKD/
         5QCxbJho/Wuk/ZSWZUGuoTE6r6GMQ+fcRtj+czpILCOJoRg0jFNxnXlaqpWF0B7caUMx
         zV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246814; x=1788851614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fC/eT2JnKkz5B3XfImtctX79YyQVrnp/98wsPaaY0o=;
        b=URtrIpERNBXqLglJM9uK0I50aSI+6wXWJ7GLBG00Ucx9gwVNycr7Xy1+dtRkPf2tm5
         C3Gn1r6CJFodXgjpPgUqTsxFKATz5ZkrGEqYv1N7ub/mLTYxc90lmAXkMT2aowha2/Oh
         45RgvsjngctiXk+DBr2IbzARetSdOWlPykkNiSELJ2MG+QIbMYrjUY7zzO0/gp/Url9p
         KR9xLJQ75/FHZpBM8sbdQyvyy1Hdb46/BzBwKIchXSXV2DeuOFSIMT2r+Tlfnd7eQPMk
         jj7/OeqkXhgWgGnNS9rqI+U5H332MlRtPCFw7bXKWfF0Vh7KUg90vFWEPb8OxHB23siT
         pdVA==
X-Gm-Message-State: AFuF++m0vpnxRAxusNomv7jgpBKWc/UsqhD0MfddxFIyXEqsV56NG5Zy
	y1P3A3Pi18euJAMoyDePeie0/cNUnSjZYrYOcxcglXZdA80ZWPin1lv7qxbjjw==
X-Gm-Gg: AR+sD12ZUrHFSvEpxB6kKtVF2nj4EqY86HOzH/rnJOk/PMZtJ3bq/Yp24ksZpinib+R
	Je7Y3zO0UKCGbu0CuBt64Yd+Ejc+kKF7uq3SO4SdEsyGjBEskqhN3+qaKRSvl/ieyO9k6ripmnJ
	jRXJhYAc7MNwrcpR8bqOmNAkz5hk/zj9VK5DP+FzGpxTwBf7/dp6R4APjnd4TmsjNpmOAn1j8UX
	/F4mX0x5IUN7Qhev7aO40qr+TOC9iDqsvne630xUQvQMLKucgeERrZVWk/Cdc0hvZcWgFdx/sHQ
	WCAXrBMppEMR6T7X96M5gvotITDK6GqZRSifb6wB4pVxgE11YtEsqqpU2FPISGrefirvY7fo0+J
	bJpwLSZ0KrBDgkKTXXkmyjqZ+6mZYWhn1GXbmQHyAwQ/p10zAbutepFVgA2rRNRQ93cpnBVLTxS
	chKUtZAnm8rVeJkeRKi6VDw5ywrL2d7lBwfTAUX3HXSCY31r6fntACy3HU1KhuENrHLh2aIRqIz
	NXHam5GPcaDEHlWYZCSafcb9/ewiP0ppNa4+lVlbgeZ7rc/0Q==
X-Received: by 2002:a05:600c:8107:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cd26ad005mr290639475e9.15.1788246813496;
        Tue, 01 Sep 2026 00:13:33 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce4a804sm52866595e9.15.2026.09.01.00.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:13:32 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-python][PATCH] python3-qrcode: Convert optional dependencies into PACKAGECONFIG
Date: Tue,  1 Sep 2026 08:13:08 +0100
Message-ID: <20260901071307.741947-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 07:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129618

Both python3-pillow and python3-pypng are optional, make them
PACKAGECONFIG entries and enable both so that the default stays the
same. Drop python3-six which was removed in 4d80a78 ("Remove six").

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-python/recipes-devtools/python/python3-qrcode_8.2.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_8.2.bb b/meta-python/recipes-devtools/python/python3-qrcode_8.2.bb
index 1671864c1f6e..78532d9cec9f 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_8.2.bb
@@ -7,9 +7,10 @@ SRC_URI[sha256sum] = "35c3f2a4172b33136ab9f6b3ef1c00260dd2f66f858f24d88418a015f4
 
 inherit pypi python_poetry_core
 
+PACKAGECONFIG ?= "pillow png"
+PACKAGECONFIG[pillow] = ",,,python3-pillow"
+PACKAGECONFIG[png] = ",,,python3-pypng"
+
 RDEPENDS:${PN} = " \
-    python3-six \
-    python3-pillow \
-    python3-pypng \
     python3-typing-extensions \
 "

