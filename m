Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7217BC433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 18:40:57 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.8166.1646505656740148965
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 10:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pywe9kNo;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id q11so10476227pln.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 10:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nt0UEgXiQXHjJo3fTCakiWnPdFLFvWXEEx7ojmgMSWs=;
        b=Pywe9kNoNY7uFkxMjkrd1nEVolFh/nZRqi3trrYsvB4z2kMf3xqXQLI1TXvBkA97En
         AxzEsvS/NA/IyX27I63GfVYt8jY+D87R6mEmbaXP5gfPN242OAwIzL060OFDdbLd71dT
         dlhjHOlUwW8lQILpOgViBPk6DQ+7Ac7ziyUt5JYP3SamezzyHxtzuqIDmU1UAymr1RNg
         /3juU3gPm0glHlSJFLgQzyG7+bh/JsKiZEOhRYMAAY8Ku0lQgLup/TzqQsfrmU0yDC+k
         3rP0awmS2X4TlZbQ/KbBywyJtRMSGd9DnuuyzEUZUu6N15AKTO0P53PrLlExtJrmrjd2
         WdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nt0UEgXiQXHjJo3fTCakiWnPdFLFvWXEEx7ojmgMSWs=;
        b=mFavwdX/psXLJjM1mb6wNpyVaR04ZVhgsx3W26tBZhpcH/V+UHRt5MaceliknztT5F
         E+V51+/OkLB0QXBtr2fGpF98nWP8eBU2d1A5h2mYPmI4MQ8RyPYU/Uttb7XPf2dRfYgJ
         wodwa1TsFnncMi6RFaF9/+lEjpcMvb3HovRRcVKNYClD9a/2ge13VJs5MlIi39etR8kL
         STYaEMtEgmWjhka1twB5R1MM32OlzFsCJDwkopa0LKPjoe82OBa2jSFzsOKx2zv6j+uI
         sIDo+fyA6kY74yR3m4pGWfK78h2vx2RYmWb3Bkjh5cdxOnaWJXrM+xXrS3q2Z28QNpCQ
         SOwg==
X-Gm-Message-State: AOAM530TWkRhfMvqNI/TlnB6RdCq/JuICiZCrwxd17bjs1z77Ka9QPYd
	3FtW+WBuX6WwjN+DtARKjJEoGS7ddDc=
X-Google-Smtp-Source: 
 ABdhPJxCXRLStH1biJDBelj129Gd0GLYQmMWY8FO8VtP8M8oU9kbmUnVQEPd2JBS4sOpPcjeRx5+5Q==
X-Received: by 2002:a17:90a:de96:b0:1be:e427:8745 with SMTP id
 n22-20020a17090ade9600b001bee4278745mr4945996pjv.175.1646505655889;
        Sat, 05 Mar 2022 10:40:55 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:2999:fd67:72a5:6dc5])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a056a00218600b004f65315bb37sm10359465pfi.13.2022.03.05.10.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 10:40:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH] pw-am.sh: update to new patcwork system
Date: Sat,  5 Mar 2022 10:40:54 -0800
Message-Id: <20220305184054.4010037-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 18:40:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95801

Point to patchwork.yoctoproject.org

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8b8bfbcadf188cd5b234358590764e20d03d7861)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/pw-am.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/pw-am.sh b/contrib/pw-am.sh
index 8987eee8eb..d9d1187b0b 100755
--- a/contrib/pw-am.sh
+++ b/contrib/pw-am.sh
@@ -9,7 +9,7 @@
 
 for patchnumber in $@;
 do
-	wget -nv http://patches.openembedded.org/patch/$patchnumber/mbox/ -O pw-am-$patchnumber.patch
+	wget -nv http://patchwork.yoctoproject.org/patch/$patchnumber/mbox/ -O pw-am-$patchnumber.patch
 	git am -s pw-am-$patchnumber.patch
 	rm pw-am-$patchnumber.patch
 done
-- 
2.25.1


