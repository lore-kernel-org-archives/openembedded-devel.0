Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195F2C54EBE
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:42 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.46805.1673191280498950988
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WUAoF1Z9;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id m7-20020a9d73c7000000b00683e2f36c18so3904024otk.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPUmDJTPj/GD9NvyabU9xgxxLPktLuJ/HIfbiMWzC00=;
        b=WUAoF1Z90Un+vQ1yMOgM/WfpsNUBKtMni+DIPaFZ9+g/1jKaVsvJ5LdG/9sbM42+5L
         DvZHPgzBRxOvvdHWMMRKanxR0a5R9JD/NqHLZ8xcfqyx8PNXXK7nmEsLrkiMy3BE7Cb0
         rUGAoRlLZLghTL0e9fM62O+r1LWiIQeB77dIdOzpGSYp44I9+3fewpPYdERP/1fNpW1X
         aWuTv7ziH52kPcLvPMymEjOTir5qWv6IsHECWK1aGD/W7aPBF21JfAFyPqF1LP1VFZ8h
         vrfM9Zk2YUHUB7B2pUEOMM2PtpTY4sQiWIeberS99NHuwnH7mmGi3CiqAN3jhTkUsL6r
         IJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPUmDJTPj/GD9NvyabU9xgxxLPktLuJ/HIfbiMWzC00=;
        b=FKrfMeziUf4dUXaN4Hg4M3xgaY5rFjc/kAOgv/qOzh/6w7kUlul4VwtCbNj4PYOman
         +2BaBfZ/OuwxY3lQZVs3OMaQwudfzNZoFN5skNUCo5enbg02iIfvmWUoFbIPhV0EQtDC
         i6N/dHrsk4TsrJ+JWZNiIPDc/Jk3eIJ15t6DBq4BM45chBvv9kjj90AZ4FnGXqDZWF0n
         qhmzpZp5E/oL7K2OsJd3On/foYlUh10NS2DNhfiqIX/xFU6Ocf5YsXtTiSt8rnn6HXEB
         OTZhgLgcjWjFHdp1jw03ZdrSiVcvkmS8Pbcyr2n1TCjCamDFmB7fgrOUVDakMgS+eckf
         6wYw==
X-Gm-Message-State: AFqh2ko9TICdlMoMXT+t1774MkVGg/Jwj5x/pytK3qLQS951AWMr+3oJ
	nuowKDlL6wq0SvoPbNmxwTpl3sS3HVc=
X-Google-Smtp-Source: AMrXdXtyvjfOvHEtfsdSFhRXDdh1DsGVY6yt9OgAuH/hGf/ZaGm3dTdTvmOSuLNR2XXuL/M5yYcnwQ==
X-Received: by 2002:a9d:7c8f:0:b0:678:2e59:5a6a with SMTP id q15-20020a9d7c8f000000b006782e595a6amr32950363otn.36.1673191292123;
        Sun, 08 Jan 2023 07:21:32 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 16/26] volume-key: Inherit python3targetconfig
Date: Sun,  8 Jan 2023 10:20:51 -0500
Message-Id: <6d89943abc78d7529ad756e8078aac695c0b38e4.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100461

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


