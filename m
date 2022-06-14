Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9DAC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 08:38:24 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.3758.1655195902477924718
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 01:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RHVSZnnk;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id v25so10557166eda.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 01:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kkNAMV7ebnKzpyqL36e8d+Vc0+d9LPMlUsJy7rbjjY=;
        b=RHVSZnnkXCemELo72PdyyCOIeQ/gsD/7Dc2+hbXH1/A7QDsaPrFOWbizU8m7jSV2Xa
         XvBB5MZc5XNf3AfXq3eCZzwrtr3HL8VOkCvriJl8HsAavy2Sqz4ypwMkCBhpkt+xS/Qy
         /Fy1BumT3DZHSmwamgQ73VU7UX8EMhJcJG7UciRY2QWbEeXxV+ARjBbQMIoZgLS3XS3A
         MTArILP0Wqv1hmM0b25Vm2/AbF+cDVcJb+yx+FlvXxtXB+FZr3Bxq4nL2iuVK5y/Bxhf
         yqa84rgr1Pon/x+eVCCMyfKupmp6gxvNgBWCvnR2n6wGL+K4wmeXf7GtFuQX4FkyCZDS
         qkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8kkNAMV7ebnKzpyqL36e8d+Vc0+d9LPMlUsJy7rbjjY=;
        b=Q6DB5T1gjclQdfxsex5o23Trs4VgzR/YYB3ENTCSDrw36dqGkxzeDhqBoKKAnegV4t
         cxLYTyuvvY1BR/vvac7H4aCAeeqkJD0BrVFRyk5B7VDzstPyeR7B3y655eMz20VA2zQX
         7yj6VlmgLpYjltSz79MSlWjluzXRRr2I0JRn9yLnZE+8XtT44g5MhSHCcH9Gru70UQFr
         P9mwvYhjYvtdBBZsFgbHTzvwpveWysMn5qE6PK59ZhDWZ5fqf7IVweGtnqIDjX0D+wKA
         /cO5ey8vFbgnyNnIMdYOLXUFUmBom+J7jbPkINxzlE3CU5S7ADLX8W9GxQh5TRjIGtjs
         f1vA==
X-Gm-Message-State: AOAM532TroDQnL2w9riDjngz28awa5x8jls2n3DRDCBcKjVcWtiId/K3
	rjrxamw78KyFftl61m9oBOUMpoeXrn0=
X-Google-Smtp-Source: 
 ABdhPJzwROqmNDIscbGW0AYRfkDiqK4hJGWbRSVyyfo2UDV8uvtG/klcl5d3ekinDKFL0/l8yyZ0dA==
X-Received: by 2002:a05:6402:3490:b0:42f:b592:f364 with SMTP id
 v16-20020a056402349000b0042fb592f364mr4528365edc.66.1655195900878;
        Tue, 14 Jun 2022 01:38:20 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 q23-20020a1709060e5700b00705cdfec71esm4790200eji.7.2022.06.14.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 01:38:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][kirkstone][master][PATCH] tesseract-lang: switch from
 master branch to main
Date: Tue, 14 Jun 2022 10:38:14 +0200
Message-Id: <20220614083814.2508677-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 08:38:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97507

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
index 2f7fcac784..0d45ee765c 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "4767ea922bcc460e70b87b1d303ebdfed0897da8"
-SRC_URI = "git://github.com/tesseract-ocr/tessdata.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/tesseract-ocr/tessdata.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.1


