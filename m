Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113B5C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 18:49:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.1455.1645555774036148547
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=diElzNlG;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 m1-20020a17090a668100b001bc023c6f34so408133pjj.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TDkEy7NE/r5aE3/wQeq7uAFJ+XZzWcn39+NngvuQPas=;
        b=diElzNlGsNi01Glv433VcTJmY0KdqxdLZajm1XPCvUYFEiMDyDo8yxR5TCQnDyASNv
         kndBTHaN1j3JYmwJwd2bPsWtTPhtE63HELAXFbLxO+GP5Q1enohOl3yA/IS3fP395kGN
         17hUu404JRqt7PbsJAM8P5ewFCOdhmgZgUEWOD4ofJVg1QWQbqgU6Wls7L9mfYn9VGwL
         s2yQIRoflj00Tj7m3td/gKirnC93ErLcccEjf10zKMxLmjYIBVmpm5wUNsLeOHix1rn2
         GuTiXLkloy/ExG9S8hrZST0NnWJesagxTPhqQLFAbS9z44vVwS9nZwXhNMGql9JtLKx3
         217g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TDkEy7NE/r5aE3/wQeq7uAFJ+XZzWcn39+NngvuQPas=;
        b=CbpsNctmdAeXqus5iAi1+583CSnsDlNDSK8cQAtu/XeIozaO5gxV2oBsdwEzcyNghL
         4wMUW5pfz2tBzd4VmfeMUP3UAvF9E9f9eB+DVi/NDyNpj5Gu6s22iBdx20dVEhkp546u
         7UuFwGjSEoCCbCXYNAFtJNl1ur4JL7QIRo//CxIcKsiux4Tu20JwgD47vHlN2F+pe7r3
         fvTL+TJwVZzuiyKWJXVVDREB2A0pl9svftHYVMUO77qVcltkZzboMquLnUw9N9VvYEtW
         cmLZxWCch0ggUcfCm79g3ECBUfJO46xS63S26AMHMSV3Z5NK9bV37exB9gSsJZEbEQDC
         bB4g==
X-Gm-Message-State: AOAM5307pU6URkFMxIO0u9BMWZN/k3c4i5jRQ2Ll3mOmLS+WLy8muBU1
	ZTp95QuLd6DZi3jS/HZd1MCjptpLk7VDnQ==
X-Google-Smtp-Source: 
 ABdhPJzHECVzqde7VUG0q8KdGV0LB5OH1uOWxxkKOP5M571C93qEMAa+pTDi6saXYIcpCxMICd4qCQ==
X-Received: by 2002:a17:90b:4ac4:b0:1ba:3b4:d3c with SMTP id
 mh4-20020a17090b4ac400b001ba03b40d3cmr5469106pjb.201.1645555773122;
        Tue, 22 Feb 2022 10:49:33 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 g126sm21422514pgc.31.2022.02.22.10.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 10:49:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-wheel: drop; moved to oe-core
Date: Tue, 22 Feb 2022 10:49:20 -0800
Message-Id: <20220222184920.2310391-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 18:49:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95449

Because of layer priority, this recipe must be dropped before a build
with the new PEP-517 packaging can proceed due to dependency loops.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-wheel_0.37.1.bb  | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb
deleted file mode 100644
index 6c7a31db9e..0000000000
--- a/meta-python/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "The official binary distribution format for Python "
-HOMEPAGE = "https://github.com/pypa/wheel"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a0148f94f483f3e1489"
-
-SRC_URI[sha256sum] = "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native"
-
-- 
2.30.2


