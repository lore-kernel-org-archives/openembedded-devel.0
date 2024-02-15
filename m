Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A90C48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 14:17:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.14681.1708006660472265693
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 06:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VsfGh1fh;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so177869166b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 06:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708006658; x=1708611458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av0rShtaaRp+iuzBvazk/jicZXIMU4khxbv9SgzwnCk=;
        b=VsfGh1fhXzsay2QcfuLmaVapUs1KuRRWCW0HvPde30FgnhPc5kCfx78/JU2lcbB8D8
         XevB1fLP3OVuydxDTeJ046YCQgwqUpUUGhd3GMMHJuQVf2Q3ZsmSQ6+f4aGl/DXdVpCU
         86zrOc3zbS6b6pMyytxr/rBQuyxc5xvDZKVZSv3SZyorKwTWS8vIUvY9fWJhDAhTAE0O
         bqZqKLiQ/eagLsX+2ye/Y+ODYRjegwUIzTVxjhuDvpdfKApU/aE893YOBzlRM5e55SOZ
         GNgrlkAEimAUR38+JoObSMTdAO0jTZXz3FoIGGsRmHuwKdIuYITsggI1lefPYyReAd/A
         uU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708006658; x=1708611458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=av0rShtaaRp+iuzBvazk/jicZXIMU4khxbv9SgzwnCk=;
        b=jS4G3CU6EHNn9a3kEN0CAsBfpqpnfFk2ZsiP07QkuNHVqVqOgb3ehK6OiEq1Bw9MwJ
         RlwOMgKpfR3l4jN+TdRc5jKDvnQ0kgjcyd2g+95fIcHY2C4HFFe+rooOaSL+pF7vvbvb
         t53q9hVHXaZVHxeFzT+Xn92eJjxN/rYAGGcGyy7Gjfye10AXL1LI4qgJU6ZY11wCKzRJ
         Ly9As1ble1jy1xrZeVZI6M7qGd8OwV/zxpbWL312UKrAHSd5zOkG+1Adr71W3CPumiJ4
         t5nUYgFGWy9/WgsDGccqOfFv5CFHeVKenpXeJ+EDt5DBw3nHqyctrr0ULour0+n5YHrt
         c4Gw==
X-Gm-Message-State: AOJu0Yy1VEii+nk1W5M7AItTqZkG9GB7PbVm94lPQqlhq//gG2SbRJU3
	pdy8y+Jn6Twyx0H2pNTkbhPmdN1UU8nW4qPhTDeBBYZi9S9N74u6e85oKVhZ
X-Google-Smtp-Source: AGHT+IEiuNgv9XEM7BUSsUSRmWTXWWoDwZS7nzzQy3+zflDbyo530Fpw7GapZoQmmme5gkk1qUkozQ==
X-Received: by 2002:a17:906:4a9a:b0:a3c:c323:2069 with SMTP id x26-20020a1709064a9a00b00a3cc3232069mr1706640eju.28.1708006658362;
        Thu, 15 Feb 2024 06:17:38 -0800 (PST)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id st8-20020a170907c08800b00a3cf6edb590sm594209ejc.26.2024.02.15.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:17:38 -0800 (PST)
From: max.oss.09@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 2/2] libusbgx: uprev to the latest commit
Date: Thu, 15 Feb 2024 15:17:08 +0100
Message-ID: <20240215141708.2108422-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240215141708.2108422-1-max.oss.09@gmail.com>
References: <20240215141708.2108422-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108755

From: Max Krummenacher <max.krummenacher@toradex.com>

Uprev libusbgx to ec0b01c to get following fixes:
```
ec0b01c Merge pull request #83 from mgrzeschik/uac2-controls
cbf1750 uac2: add additional configuration controls
81d7c05 load libcomposite kernel module
caad244 Fix: Memory leak config label
51abbfd Automake: fix distclean of tests
3cc5af7 Added printer function header to installed headers
adc45af Added missing extern C closing brace
```

Refresh 0001-fix-stack-buffer-overflow-in-usbg_f_foo_attr_val-pro.patch.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

V2:
- added the changed patch file to commit

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 484110561..a20ff4eea 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
 PV = "0.2.0+git"
-SRCREV = "721e3a1cbd7e2b6361bb439d3959e7403e4f0092"
+SRCREV = "ec0b01c03fdc7893997b7b32ec1c12c6103f62f3"
 SRCBRANCH = "master"
 SRC_URI = " \
     git://github.com/libusbgx/libusbgx.git;branch=${SRCBRANCH};protocol=https \
-- 
2.42.0


