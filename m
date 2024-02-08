Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7060AC4829C
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 16:51:51 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.308.1707411103716235574
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 08:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WjrsggYE;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so108871a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 08:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707411102; x=1708015902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJh2fGdZTuVIwUjAN6b/29zaGH0lV7zTigdhh753gGw=;
        b=WjrsggYEVA3QBrWlIKxODglJy55wusbKXsRHt4ANbNo2juWVAeShUpOLnSBpd8xdzP
         kXQEZ9Zp15N+4b367E+KktUpwboUNL38Rg0XKAKka2x7N5EhEKMl5R57C6dmmZcWw4c2
         wf+FquTU2IbMavQwjybk3+zgX+UyjyxrBrtyDA8Ce61wFP44zlPqm+A4n0eSJB/eCpQ2
         4YMGtKXpANtWkwz8upYc8Kv80UurQpIs2IMwqOtpChYNYAZ97MCWhYQ8ppY33RjtH8no
         z+j0mP1URTlJGokj4qnm29QkjcYI2r+E/LlGJy3Gfv6bKk9ZXvOB4sk7DlNe/tLYN1Ej
         7Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707411102; x=1708015902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJh2fGdZTuVIwUjAN6b/29zaGH0lV7zTigdhh753gGw=;
        b=JdcmFTknhpC1iwi/VYSaebAixemSSImIP6aNfzNaDY4wmYwYQ28OBaJVpZDS7T+ahP
         2SH28elDRjaTZxcbrj8S9JK9LVDXsxKjMyNtTgEcXplD7TOJ2PL2ljjmHtB8wAP633Nq
         Ds7A4aIswkEJIOzM1QK96z33z1FJg+46sauNdLtt7QzBeyjz4s7nQc22CQfSwXt8xT6K
         a95wXRqc/bFduf+hXwYuyMPGjOTTFL2lbbupjZK00PI2BLhpsv0SU5CtdpFUcG0p/+s9
         MnASrVxb5/ipL4fyn+/IB7BtsP4kfZqn7HA1GwRhHsk0SGd/wUZNXwLblpHUKCFQBAwV
         aIRw==
X-Gm-Message-State: AOJu0YysS2TvA96AZpKQVKy/Lzrqf/nKISEgD6oXZy+mVliz4pwrfLJk
	Syn9pnBkzOeDmyg6ObabO8PfrrrCpVd/da6RXd2VfQYIESXMz5XcboK1mF+q
X-Google-Smtp-Source: AGHT+IH52JTACCb1lo4Af/OlCrqHqES5ObynXUxX6hMR7hO8QpIWjiHpCRiA74NNlArdb0qEFxFr6g==
X-Received: by 2002:a17:906:4a04:b0:a3b:c368:1ffc with SMTP id w4-20020a1709064a0400b00a3bc3681ffcmr824147eju.9.1707411101848;
        Thu, 08 Feb 2024 08:51:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVee7omPkDJmvtqizejFqQvMh8FUVEgjlS/XYdHwr8XAthO32KPpeRYCQu+DkTFmLpXDiGu59xZopmjaWy0q5f//Gt7RtPjhcYpapqYXNvi4FHPSKAVgzlcolsudqoIevXD4EoqPq45twxEED+m4dmQKX4Ra3YqKas=
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id tb20-20020a1709078b9400b00a386ba41957sm228581ejc.106.2024.02.08.08.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 08:51:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: uvv.mail@gmail.com,
	wangmy@fujitsu.com,
	Vyacheslav.Yurkov@bruker.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-filesystems][PATCH 1/2] xfstests: use master branch instead of 'for-next'
Date: Thu,  8 Feb 2024 17:51:34 +0100
Message-ID: <20240208165135.2026155-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 16:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108672

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
index d0237649e9..33d441e41e 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038
 SRCREV = "11914614784735c504f43b5b6baabaa713375984"
 SRCREV_FORMAT = "xfstests_unionmount"
 
-SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=for-next;name=xfstests \
+SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests \
            git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch \
-- 
2.43.0


