Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8EEC54EAA
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:46 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.44975.1674653502896370890
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hb1HKYqL;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-15eec491b40so21326134fac.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPUmDJTPj/GD9NvyabU9xgxxLPktLuJ/HIfbiMWzC00=;
        b=hb1HKYqLH6ZxTCQKhvpqorjeAzcTjs1Bz5YKELxY58bW2BkC3PlhLl8QwMCAg0TMJL
         0YdhRUhQC9qcF68j5KB7kXDC1iUq7B2NOutWavyqztXfMjmiqzHwDM1yBGnehSeSlnwT
         eIud1m9sizIyR49hfVnV7BLBK7IW745Rung529B4s0yj7QU4TWNhVXO8levNyiHOWQsw
         zjGDSPGlx+vftsDzoppLXtco6YWErKkRAwqpAJ9kPR+xGIdriCxxDheMOk/jvwlk8rx5
         mWgyAfCs3+e4ph6N0qKH/KSw2Ily0MWLHINTYZx5irooTk/kYGN4bHKkxupr9kcTPYUE
         1QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPUmDJTPj/GD9NvyabU9xgxxLPktLuJ/HIfbiMWzC00=;
        b=w072u49QA8gaiYTTyI2fU8ySn7nE5yiC7EKkftIpqE4zPpUdIxNDbkfnB5RakuhnzT
         0qkeUWgWYBEspyrUpeGscyYl3q065SIawSzNwUbeO2fAuuCLkafG3cVibjL+WVfv9UP+
         /FpbTNsaXbCvBxOf6RJ+KwtluRd4jOIXjL6yHR5ga+UFgCzS6EA4H5O6KJq4Qj4kzRvy
         TUm6GdIhGIl8/S5+OdRwlCEEF8813hHrb77nSWNb2MsUNEHGaWJuDyluahjwcOhZc9Dn
         VBV6jDviOYd7GYdb8d9VOlLHa2ITJs7u0K+HSuU1F/poNgB3PMpydz8ccM2vAyAa/i4W
         2WfA==
X-Gm-Message-State: AFqh2kpV2QYBVAoIPffSVtxeAxUX4cxNM8Y4c6kss+5T8LX8BQqxGhFo
	Hbi1t7r51J1FtyaDsSpWH+bcJdwWnzg=
X-Google-Smtp-Source: AMrXdXstbFBOHkQGzj17BDa/Z7+6nKZSatcOgS8+O88UNl7vlEaiKRj51QtZt69twGcu0lu1kYjM3w==
X-Received: by 2002:a05:6870:15d5:b0:15e:ceb9:9b67 with SMTP id k21-20020a05687015d500b0015eceb99b67mr18400473oad.52.1674653502089;
        Wed, 25 Jan 2023 05:31:42 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 16/41] volume-key: Inherit python3targetconfig
Date: Wed, 25 Jan 2023 08:30:58 -0500
Message-Id: <6d89943abc78d7529ad756e8078aac695c0b38e4.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100751

From: Khem Raj <raj.khem@gmail.com>

It uses python3-config during build to grok the python specific
includedirs, therefore its important to ensure that target specific
python3-config is used, otherwise currently it defaults to native
python3-config which ends up adding native python3 include paths
which might work out ok but is exposed when target is 32bit + lfs
enabled, the headers don't match between native and target python
and compile fails e.g.

| In file included from /mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/volume-key/0.3.12-r0/recipe-sysroot-native/usr/include/python3.11/Python.h:38:
| /mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/volume-key/0.3.12-r0/recipe-sysroot-native/usr/include/python3.11/pyport.h:601:2: error: "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
| #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
|  ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 44384179db0db8bbf489dbe0524a5e5aa2853603)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index faf8dd362d..aff555ad54 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "6ca3748fc1dad22c450bbf6601d4e706cb11c5e662d11bb4aeb473a9cd
 SRCNAME = "volume_key"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit autotools python3native gettext pkgconfig
+inherit autotools python3native python3targetconfig gettext pkgconfig
 
 DEPENDS += " \
     util-linux \
-- 
2.25.1


