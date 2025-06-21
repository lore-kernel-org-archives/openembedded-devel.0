Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C53C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 09:09:42 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.4239.1750496975987012407
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 02:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NV8ngjUa;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b82f3767so2299179e87.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 02:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750496973; x=1751101773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0PR6OXan/JgmG9/3onxhDoSgJJ52Wh4S5bWgckYd3s=;
        b=NV8ngjUagCKLra5mPQMvOMvq149Usahsz0vVka9ONcIGHKiwaY85SxVZpl+f5GMm/c
         U5+kFi8Ni6cXJUNf0ng+1tbcdUtBg/aHl739aFKcN3RzP7FRpaS8c/vSzF15/akEIwoN
         ZHwAxfJ36oTnJdRHuquQgXzyxMOTGLW1BgDmmqHE7bq/PJnbnlM2Xrel+f7MnTGw+pPD
         uU2ivOKxVdsxHfqlOZSz9SLE6nYf1quga0CCm3Mj3GZ1Qw3wp8mZGPNg5SFUQzImK9Wh
         cx7NFwJpHfnNI/bSQf9j+KzNa+kYSOIX17t1TdmPD+vR/ng3HJM+v1Q+wYIYlseamIsh
         H5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750496973; x=1751101773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0PR6OXan/JgmG9/3onxhDoSgJJ52Wh4S5bWgckYd3s=;
        b=VmBsJGvM6rt3lzsu+LfTaWppIzKv8N1lzg0ddlBtjml10A4bffQ5N6dHre33Ekog0m
         GFIbZczXu4I+ZD4lQraWj5+etnUAi4zvIc5hszQ6iC6CzFZdt80PjgtZ8W8U/GF2+K2D
         bVexo+Fr1FssvYmLrlDdSvsjwo+85ajK2xq6ipnHIdW2fLd6Qe807dZxtqeera7b+njO
         Lkat5+7LT005z+aTYoPFhDLGguGOadieh3k5VBOP6/80ZEVhYDS7WjztnFDz1gA3l5uu
         1cJq363lffjKMftGePRb3MZwucVPp4WaD4LwEpwrODSRDdh/GCUowyenRomawJcUF7NN
         meuA==
X-Gm-Message-State: AOJu0YwAR6yoAjnO/4D2PygWT6WKaiF0XCLoV0XSPcse0SblsY2aQR86
	q6xq0w40rCMLhLT/mKDGbCYLlYx2LeOHIKsTDphJVgXK8iOed5D2JflCgj8VUxL+
X-Gm-Gg: ASbGnctrs1dgYkd3sll2d5dmHmHMvSNJl0ka9D9FcmJ6aiEUJdEynH1jHKa1AFvpCV7
	y+NY4PSOAnkH6CIEA0viZDWbyrn7kaasn00Ny50Xiv68BniL0fk8iOWTqj40sY1C+CJ1wTUmI8l
	h4Lv+gu9/QpfexV33UwBJzXf59HUJ1DAMEz8D3gpWeNIlg7IgZ3myfDe4E0Auj+BQMFskTgiRxX
	xLY10G3krEo5kHGcdPJwUscQuKLKeOI16EueEsy7EmWJpROG4bif4R4NBvEZLCz58hPYlBaVYT3
	nSNDWry2INCTpYZ6tvy7Kh7snE96L09JznFGep9pv/9Sam6g0auLwViG4SB/ETNRG71cTaXeY0d
	PQd0=
X-Google-Smtp-Source: AGHT+IFmnXJUwl6MMl4JFjGpFrUA7HjpPm9vQ677k13dHJnrYfmZLIm+ML4BB+X16vbUp3SRGEYQeQ==
X-Received: by 2002:a05:6512:3086:b0:553:2ce7:a1f3 with SMTP id 2adb3069b0e04-553e3c07c2fmr2325536e87.43.1750496973149;
        Sat, 21 Jun 2025 02:09:33 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cc78sm601353e87.63.2025.06.21.02.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 02:09:32 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] crucible: Allow network access during do_compile
Date: Sat, 21 Jun 2025 12:09:26 +0300
Message-ID: <20250621090926.1466318-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 09:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117992

Allow network access during do_compile to let Go modules be fetched at build time and avoid network unreachable errors.

ERROR: crucible-2023.11.02-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/crucible/2023.11.02/temp/run.do_compile.1454' failed with exit code 1

| fusemap/yaml.go:15:2: github.com/ghodss/yaml@v1.0.0: Get "https://proxy.golang.org/github.com/ghodss/yaml/@v/v1.0.0.zip": dial tcp: lookup proxy.golang.org on 77.88.8.1:53: dial udp 77.88.8.1:53: connect: network is unreachable
| cmd/habtool/habtool_gcp.go:14:2: cloud.google.com/go/kms@v1.15.6: Get "https://proxy.golang.org/cloud.google.com/go/kms/@v/v1.15.6.zip": dial tcp: lookup proxy.golang.org on 77.88.8.1:53: dial udp 77.88.8.1:53: connect: network is unreachable
| cmd/habtool/habtool_gcp.go:15:2: cloud.google.com/go/kms@v1.15.6: Get "https://proxy.golang.org/cloud.google.com/go/kms/@v/v1.15.6.zip": dial tcp: lookup proxy.golang.org on 77.88.8.1:53: dial udp 77.88.8.1:53: connect: network is unreachable
| cmd/habtool/habtool_gcp.go:16:2: cloud.google.com/go/security@v1.15.5: Get "https://proxy.golang.org/cloud.google.com/go/security/@v/v1.15.5.zip": dial tcp: lookup proxy.golang.org on 77.88.8.1:53: dial udp 77.88.8.1:53: connect: network is unreachable
| cmd/habtool/habtool_gcp.go:17:2: cloud.google.com/go/security@v1.15.5: Get "https://proxy.golang.org/cloud.google.com/go/security/@v/v1.15.5.zip": dial tcp: lookup proxy.golang.org on 77.88.8.1:53: dial udp 77.88.8.1:53: connect: network is unreachable
| hab/crypto.go:23:2: github.com/smallstep/pkcs7@v0.0.0-20231107075624-be1870d87d13: Get "https://proxy.golang.org/github.com/smallstep/pkcs7/@v/v0.0.0-20231107075624-be1870d87d13.zip": dial tcp: lookup proxy.golang.org on 77.88.8.1:53: dial udp 77.88.8.1:53: connect: network is unreachable

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-support/crucible/crucible_2023.11.02.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
index 132395e023..47d10c515a 100644
--- a/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
+++ b/meta-oe/recipes-support/crucible/crucible_2023.11.02.bb
@@ -9,6 +9,7 @@ require ${BPN}-go-mods.inc
 
 SRCREV = "dec27cd4e0e0db106c0a21d429c04ca8d36bbdd5"
 
+do_compile[network] = "1"
 
 GO_IMPORT = "github.com/usbarmory/crucible"
 GO_INSTALL = "\
-- 
2.43.0


