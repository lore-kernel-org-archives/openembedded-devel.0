Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81001C636CB
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:36 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.44966.1674653488668886893
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KP2JkuKa;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id c145-20020a4a4f97000000b004f505540a20so3146298oob.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZk6tN/i47xLOG3LY8hEtzAtQnW73ogVQ31Z+DMT6kU=;
        b=KP2JkuKat93tSM2HbL49q6bNfcutNxD/F0wi4S15+0pYsBeYp/kk49Np35spyNb67F
         GExnBS+YxueXjVIDxaUU/g0Cp73UgVQ9uBKZVjmbErzJWkCrBAD1ZLg+HCWeK3ycq4UX
         Qdn2576BIgHA4tPuvf3fapJZPcRdI0j6QozujNwgKiv70y1ZsCRMeEFdX1+J9fHVxPh9
         +1aEAEyNoH1Zksa/7ogpL2wdQkKWzAE85MShwWLQhZ3hQZdgBE1YhYen9/bVrehQV2B/
         On6IOF8bTnVmDiNvWnHWExMZckLiqsRnWkl7I26+kmgH+sLYUuXrVxPYDol33Ekp7/IJ
         DcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZk6tN/i47xLOG3LY8hEtzAtQnW73ogVQ31Z+DMT6kU=;
        b=gWlzQs9MF6bG7eHwVosuqGe5t7p9/W6+Y1f44Aop7W4Y/0hM9dyLrTi+zTIu2obmxK
         bQh4xji3wrYTgDw0J4NpkxpJiMNy7bDYbVVeZvd1Bs4lPQdm69SMYUc1WM5g1mvctPmL
         /3MFprpLj1Z1kwpWYYKrXmYcM3t6ZpWk/Tohn3XoXkYwiCJ9t1vlGryyRmvuyhD2Nf2o
         4Zs7vzrJ3eSvzyPCdwZ7BaEWgb3iKKtdBW0PKF/32QlAwvYROnpryDNEcQ1kOlPgwGcH
         08KJM27VS8WT3ocG9K0PTDMHygUlj/3w2tQrEI/TfS8GZPwl3Z+M6TeN/Oh/wlJPHH/I
         n/kQ==
X-Gm-Message-State: AO0yUKVDe013Rudo87O9SWWnYxBvMcMjrqZ9t5we+5W04B3v7Cy/7Wn/
	A4Kw+ML6GBvTPYuR2/KGv5t38Syv2VU=
X-Google-Smtp-Source: AK7set/avsRjrG+Bzx4mUstdukKkQeO5gzQw4pTr91RZhdTE7ioRar6YKuGHpgeqqBQG4tTvlTPhsw==
X-Received: by 2002:a4a:e7cb:0:b0:511:56e5:2423 with SMTP id y11-20020a4ae7cb000000b0051156e52423mr1002827oov.3.1674653487894;
        Wed, 25 Jan 2023 05:31:27 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 01/41] blueman: add RDEPEND on python3-fcntl
Date: Wed, 25 Jan 2023 08:30:43 -0500
Message-Id: <d5645959de5e874ba877b770c28562645bf3d539.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100736

From: Markus Volk <f_l_k@t-online.de>

After updating current poky master python3-fcntl is not installed
into my image anymore. Blueman-applet fails to run with
Error: No module named 'fcntl''Module fcntl not found'

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 25c38607014f2d325884ad003c96237906aefa48)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
index c3cde1f27a..2822e8713a 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
@@ -26,6 +26,7 @@ RDEPENDS:${PN} += " \
     python3-dbus \
     python3-pygobject \
     python3-terminal \
+    python3-fcntl \
     packagegroup-tools-bluetooth \
 "
 
-- 
2.25.1


