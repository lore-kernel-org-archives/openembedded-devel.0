Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324DDC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:20:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2546.1788421416582807960
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 00:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@missingno.tech header.s=google header.b=Coo0O/EY;
 spf=pass (domain: missingno.tech, ip: 209.85.128.49, mailfrom: leo@missingno.tech)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so12845535e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=missingno.tech; s=google; t=1788421415; x=1789026215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qBWOrT79NeuNh+9ntueaGdV3KkWAbWndrTSMxG5+SKo=;
        b=Coo0O/EYQdDOr3h5OevM4czRKdbuSHbnOCk3E75+3mL3yi+g2Ibmp8X3xpq/PflI9h
         2YYZJj7QfUWPICI/Mlsiq2HjR4yaSKleqUObUFpLKFMsDVwSux3YHeSqnBY6DQtojm6W
         py7cCh9YYdd2Ox7hNI636REOpoRL9BGqgjLhbtquPPo/XfO1vgJIcyHkH0lEZj4LL6OS
         KEz2ZtymW3RP+lEStK3gGMUQXbI163maBqcDYDPhGdZZAw6eyqsRt3xuVQtrchc+PMMf
         e3rNwjmNmopWtv4LUq6MSaVQPX+pJPp44z9cCf/xOTcFWhCyg11m8zI7Azne6qOXfQR3
         Fgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421415; x=1789026215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBWOrT79NeuNh+9ntueaGdV3KkWAbWndrTSMxG5+SKo=;
        b=Kvhp1Q4zdVfQnePXbSzQMOJ7gVUtVIn+PcdTjtgutu+9Kjpl0GLbvW2rTGIi7311cV
         yFpj9S2DchPk5IgWHbWMhBtWR773NN/qmNaGvmtEQKo5xxCa0/fepKgVgb/5a9LeQvAU
         rsmZ8uKzH3uu2N8HeggT6bF4JxqPy2xNvw/uey++81l1jJEl4jx48raWrrCRnS+rbXgw
         zt+kQnVE1LG2g++J2BIkR7LYQ8fIVOy2zzef4Hc/1zJg1Lnfc+NdSJhj9UH1SmxYdX+P
         Fi4MSHIGDq83xOqzgLehG2rMcfgmbqPKFZjgd5jjP0GayTI4SfTLSetuLw83n25oOnVQ
         xZ4g==
X-Gm-Message-State: AFuF++mJjAw7KYpndr0Mvhxt/R/e4KUBHf+dwWLHL/uufWvv/57uRCle
	lrPxSQNgZk32YQkrGvmHA7WbBIWFt5Rku73wfCVbeE8QsOvF3P/AdAxCxehGk+qDUbuLBriQQEc
	8GuSe
X-Gm-Gg: AYBFou3wjGlu2aON6HntCWysRoXZJuNkjPdv0BHmtp0xZTbnrxbdo4L6xXB+Gpb3yVI
	blO5jOaotL5jg9MSdwN9WGq7Zd/0wzlWOCUC4D7+yIXjdt2M0ZmPt1lCOeqRG0ITMQPheLC5afp
	ZV9qbW3xH6XndFra8xBVY2+GmAfw6xxQhYAY50QHbyNMaIm77kQW/20jkDkCgbRzFIG33uplZP+
	V5WCkwDsQhk55dMLLjxiaydFf+dQJagKoyDoGOuoDJYfmQnJR7YquvCMfARue6srBS81rQvBuS/
	bVYTwVd3qGbu7c9aoY/H/dZEjrHr+xykVJxDsoXdY5owPaN1siy+J3Kq2Oy+wdZf7gkFzpaavUE
	IeBghaYOnDzdzJKTH6CDwn4vVIP5tnEw4oWeUzRJqi0nEhunPd1ejFl5lD+VYiyVDnmAqsCG968
	ck9Mz/67aL5GExWxE+0WPGDc3HaVwWT97h8Kj9/GEc8Z19bJImViJzug==
X-Received: by 2002:a05:600c:a40f:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cedfed584mr79017535e9.10.1788421414050;
        Thu, 03 Sep 2026 00:43:34 -0700 (PDT)
Received: from horous.lan ([185.119.171.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60bae6sm60229335e9.9.2026.09.03.00.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:43:33 -0700 (PDT)
From: leo@missingno.tech
To: openembedded-devel@lists.openembedded.org
Cc: leo@missingno.tech
Subject: [meta-oe][PATCH] image_types_sparse: use .sparse extension to create subimage link
Date: Thu,  3 Sep 2026 09:43:03 +0200
Message-Id: <20260903074303.306722-1-leo@missingno.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 08:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129709

If the image extension (.simg) does not match the CONVERSIONTYPE
(sparse), the function create_symlinks() in oe-core image.bbclass
fails to create the image link for this subimage.
Using the .sparse extension for images produced by the
ext2simg_android tool fixes this and generates a usable image link.

Signed-off-by: Leo Sartre <leo@missingno.tech>
---
 meta-oe/classes/image_types_sparse.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index 5c1d92bd18..b2a58b8757 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -16,7 +16,7 @@ CONVERSION_CMD:sparse = " \
     case '${type}' in \
         ext*) \
             bbnote 'Running e2fsprogs-derived ext2simg_android..' ; \
-            ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.simg' || bberror 'ext2simg_android failed' \
+            ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.sparse' || bberror 'ext2simg_android failed' \
             ;; \
         *) \
             bbnote 'Generating sparse image for non-ext filesystem...'; \
-- 
2.34.1


