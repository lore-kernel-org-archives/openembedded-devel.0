Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AA2C7EE39
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:33 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.11451.1685531606408285446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SFIX1oi2;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-565eaf83853so47765137b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531605; x=1688123605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Z8+Ir7Etv3S+eeODzvZT5lJRtDz3QZq++zPJ094T9Y=;
        b=SFIX1oi2f5IuXJHCgvSFVTexk9eEe9KLSB9nGbh5bDs4+cGYUNqdwgHFJyxZbVncDb
         /PZuI2IPPyESUIjDdRRzKl6wu42hRHJcgIFQyj64MaUGTAHmFL3KknGq7LsviJvkJq/F
         W4Utus8c0turKQCWjRR6HHSb+RdNvIaYaM1EK5I3EVELkQiRX02ZjsIdvZn+Gn56udsy
         fMEslaKZWZEe9ZOphuhL+qGbH4aGisFiWDLblLc+ycPaBGBZIjdxJh/KTXlVvEW6IRQu
         a5hFYhMh4XaRQra86ffwrCy4gRXGsfwR/EdAKiu/8dkNhf9HYAHyUMNFhyRv6Xgn2hHC
         LIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531605; x=1688123605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Z8+Ir7Etv3S+eeODzvZT5lJRtDz3QZq++zPJ094T9Y=;
        b=JpgN3d7LN+p+EDtfnTGqxL4gPsFoVH2lOE4HNLLBYD39Dh0udhS84wg+6jovDlPxn1
         m9+C8qlA/KTFzPEDrkAD8jyB89uUe90nu/CmVlyC3Qip7E3Sdldv/dIdapcmwkq+r0qf
         cxleo9NtxT856wfP4jONVs3RlKNpcK7236TA8qnisCv0lGYPOhNFDF3+Fb97rE+74M5F
         h9G0/0+rJdirFY0w6o4MhaGsuUhWrKyXifKye6JQiihOi7KSoQ5Fa/PI2riuI7zRQMyA
         TRwlKjkTvS2JNyloO9qNmxbBjktYF3y+SIoN07SlUmxKC6Xa1hJaS4GzyEWC3Q//RfhQ
         v3iQ==
X-Gm-Message-State: AC+VfDxh0BDk80SrjWY48C1NqjvWLoWHGydLLZAFCK6wG1LuEq6M0P7R
	6YCmC/5+fzJYahnE6LBXeU4HO6uruZQ=
X-Google-Smtp-Source: ACHHUZ4k4UHVotTMAniKZ1y3j/o6xp68qQEd9vw+Polcu3oDEQwNB0aFPElKa0m3UfHdFvNvXfDM3A==
X-Received: by 2002:a0d:d888:0:b0:565:9e48:2597 with SMTP id a130-20020a0dd888000000b005659e482597mr5551211ywe.50.1685531605342;
        Wed, 31 May 2023 04:13:25 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 17/36] lirc: Define SH_PATH=/bin/sh
Date: Wed, 31 May 2023 07:12:50 -0400
Message-Id: <20230531111309.2454603-17-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103046

From: Khem Raj <raj.khem@gmail.com>

It points to sh provided by HOSTTOOLS in the build systems path

Fixes
WARNING: lirc-0.10.2-r0 do_package_qa: QA Issue: File /usr/include/lirc/config.h in package lirc-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d112323521083a4369bd8c80e1f860f1ca8ebe8d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
index fcb347a2e5..3d474305d7 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)} \
 "
-CACHED_CONFIGUREVARS = "HAVE_WORKING_POLL=yes"
+CACHED_CONFIGUREVARS = "HAVE_WORKING_POLL=yes SH_PATH=/bin/sh"
 
 #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
 
-- 
2.25.1


