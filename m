Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A41BC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:34:08 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.2270.1646166847463974986
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UHelFUdU;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id c9so14460024pll.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sCi0lQKe0QFPSsZ6gkxmKjin0fuebgLf6KYNlo2dIYo=;
        b=UHelFUdU8xlNIGsOy2GOifsI/4QyXzJrlN+yx58h3gwLusxMMc4yL5d+skHRe9OugA
         up1gb3G4Ld++964DokSuV2/ele0t9DSQWVbuAmgr2xi8SGui6i+tZHjtFVHZKx+Pv/Z6
         HtVCfyUuRcgCBs7jfAbcjdKzjjBDdFQRQAOX9b0LUhNirdOC/Hv53jTbL0mVNav1qu3W
         BU7LhB2JdyfklEYFJfYkHOT1lsX+ZtU3TpfLfmAX8ZIqbe0QdI/O7KN60Pgx9cKgJD4D
         lVcCkwvMxFKkd73iGKsiq42/mmSYOQD6YBbla2mqCTiKW0I0QAv2zwY8VALF1c9KSYt4
         jyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sCi0lQKe0QFPSsZ6gkxmKjin0fuebgLf6KYNlo2dIYo=;
        b=TloajJ5iFxNzQoGnUg9WIUx3Mvo0AMdn/vmEZ+pyVgs1CtRWadHE/W01YybBdqRvPT
         t1ueasqHbLIlkBob59ejRrcobrvaeIZisMZPgQcVVVLMS74QrQSarkr/gqc4+stRqltb
         GkjSR9wSbRq7tjbieubbW5McFJfq4MPKtPi9Dk6ZtRaAl5QKWPyp6r6ncip1slEb7j1B
         qe77/fXK4DG1AQb/Dtgxp+HI0u1hlp7dgi1NEWydXKmF8aYj8mvBLIHoMIC3+aVKzODc
         md0IqlMRrXD5oSXvbg0ybPL6y41IJZSFhVjj7Sp2jkJu/ERndJ4iMTydGcbICi6QQbm/
         tPTg==
X-Gm-Message-State: AOAM533lZ/RhihXXy7vCJLly3Z/4dRbybTxG8K1bVF4Yb5+5tb/WNeDW
	cWO+pt7trkUkJob1cw8CAlwwyEqTxQY=
X-Google-Smtp-Source: 
 ABdhPJwMI7AmagThj4CMftI7b1cqefSn17ZAhfzAsseSY2TFwI+a5CER7PQPD9z81cHLUat4SZYXhA==
X-Received: by 2002:a17:902:b405:b0:150:2523:9e8a with SMTP id
 x5-20020a170902b40500b0015025239e8amr23633837plr.109.1646166846459;
        Tue, 01 Mar 2022 12:34:06 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a17090ad20600b001b8d01566ccsm2896968pju.8.2022.03.01.12.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 12:34:05 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 5/9] python3-iso8601: inherit poetry_core
Date: Tue,  1 Mar 2022 12:33:50 -0800
Message-Id: <20220301203354.3839755-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301203354.3839755-1-tim.orling@konsulko.com>
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 20:34:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95652

Use PEP-517 build-backend instead of setuptools3.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb b/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
index 474c2a8140..aabc47d69b 100644
--- a/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-iso8601_1.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b05625f2336fa024e8d57e65c6595844"
 
 SRC_URI[sha256sum] = "27f503220e6845d9db954fb212b95b0362d8b7e6c1b2326a87061c3de93594b1"
 
-inherit pypi setuptools3
+inherit pypi poetry_core
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
-- 
2.30.2


