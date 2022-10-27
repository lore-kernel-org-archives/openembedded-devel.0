Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DF6FA3741
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 07:26:17 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.3893.1666855568444128785
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 00:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E+yDAqOb;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id sc25so1999770ejc.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 00:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIqqEQitfmKucH7L7mp8ya+dmh6x2Q7+4UoSwseKTCc=;
        b=E+yDAqObkH8Wx0UrPl2UvUwLzW6fksJrSS2dO1lIM6fI6EwsdNUVvxLD3oScn0bKh1
         Osd0LqZagz0Wcv66rrpu5XRl0Ms0OLYzuLIk2uPdJv8Dj5f2gLPB7UIWrzlQCThA2jvN
         0WhRGE4zQGKcM1XOysD4/5pWbF0ebI6YSTP6mRm4+ykgIJJd04qwArLqqbzwnt9UAs45
         3AUbhQLJh3QpWcb8T1LC3LxJzhtc4bvDlc2EdVqhI32140DUlmWTchPxZr5MgN/NxuK0
         VvzAlxSsAt9jGG6aPlUEFg/J4ULS9UQIDYppzinHDnDURRHkLgNFGk1yu6e6LNItmFKx
         xSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIqqEQitfmKucH7L7mp8ya+dmh6x2Q7+4UoSwseKTCc=;
        b=xfJqBSIfKg1Y5FpPFkh+CZmGqSJSVFABWX1AdHuQ59c9720gA+PdZ5ghDY224lH5pJ
         sSp4gl4TacTkSz8/dA8ZydiecokOIompVgc0+7VLMdloEXkPfw26FWcDYoU6XkUcOplI
         9T943wj6FzFeE3M7JaEi0E5NKk1YI9nMDWjbjuLEToq0i9LnZJnJPLz2y5KVqD28Isff
         5RNMN/1cSZLa/76hSpzFEya23/GMtz9SBN3wb/5+EyXlB3uA0WMi6ZOctJ72BkvvSJgZ
         OVoqkPKZXrxoAkrnEdWY1iViu+M9lLNlTl9TT5h7v4ED7RFsyJsgydRnitDvl8HfSw4N
         aVAg==
X-Gm-Message-State: ACrzQf003c8vgkJlszGmIm/OH0+9t90K+nvUiSAe/svGXT9hRH2z4Obt
	gIK6tpJzMakYTYyRhu5zdh29SJ6Aixo=
X-Google-Smtp-Source: AMsMyM6FGcj7k1KbRXU6h1K9OXk4mKpRq8pXpy16xpKTsev/EYWuG1tDdE95bhzY7hyvd4Ikk5n0Fg==
X-Received: by 2002:a17:907:728c:b0:78e:2856:7fed with SMTP id dt12-20020a170907728c00b0078e28567fedmr40853099ejc.2.1666855567029;
        Thu, 27 Oct 2022 00:26:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id f22-20020a170906561600b0078d9c2c8250sm356238ejq.84.2022.10.27.00.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 00:26:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] python3-yappi: mark as incompatible with python 3.11
Date: Thu, 27 Oct 2022 09:25:49 +0200
Message-Id: <20221027072549.3525217-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027072549.3525217-1-alex@linutronix.de>
References: <20221027072549.3525217-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 07:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99317

A request to release a new version is here:
https://github.com/sumerc/yappi/issues/122

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb
index 2f2444319..526af346b 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.6.bb
@@ -32,3 +32,5 @@ do_install_ptest() {
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
     cp -f ${S}/yappi/yappi.py ${D}/${PTEST_PATH}/
 }
+
+SKIP_RECIPE[python3-yappi] ?= "Not compatible with py3.11; needs a new release"
-- 
2.30.2


