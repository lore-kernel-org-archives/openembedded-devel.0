Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C94C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 05:50:17 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.915.1707717009975522617
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Feb 2024 21:50:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=leHXBR4A;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a28a6cef709so369526266b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Feb 2024 21:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707717008; x=1708321808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPmApLisfGtBWX0pUpcp5rRcyHu923KByoIaMFZoixs=;
        b=leHXBR4A5PKX/V0i4Pdm3wcEbksvoFB/Apr59ggH8bodZJpa1kmUyTvYR9bDdBXVKK
         I7CA3r3k6VPuzRDQlIpb02kNbcb4jPZxHN3Vh5Kp/4IX+MUTw12EUAVkXq/SC89ToF2e
         9x9bswmy1ZzhvaSN3c1tUwC3bmq4m6EYwQMYmlPCOCACd6HGTEtxhmxULYvfURR74EUe
         bBCLj35bzUIsJaNc1ziwAQZyOBAnzvxbixBNfYiKcAdrvXLCiqSp8ZlXVY7Psbby5AnK
         kS/1bf3FXCqkJV+EMMGPCjbiGtVJrzed3ETIB/g6T0AvLHBu3H2v6JMXr6LKubCWOKHP
         Velg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707717008; x=1708321808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPmApLisfGtBWX0pUpcp5rRcyHu923KByoIaMFZoixs=;
        b=Yb6CphiEz108ydTCuqp51+V89my/DXNOSfCSaAnS2kOdNc5KVJlRmD4paPDUyEIO+g
         MWKkee9qDQH57BzF9hJMoFpYc218YKWq+yZKUM+PNpPzMCPhdvEgbJKpoTgZrih6xFmT
         N64+rtEU2T5skhzDGNLLulADRFyMH+M66YNja+Ytbb7No9z5k7RCAOq+Q1yHRBOpFlwh
         qqqPP9YxjWPazP/o2LF+3jzDY8aHa7HUNag+hLeeY6zsTjN8H5f9nWdU0Gn16Hi6RNwV
         KdwTJUXAv3tEIMEGLz8y1ufBDHbpb2tUF2Ih7ooSgmEfikwMZtasw1GoMeoLTPp/7Vqb
         wv/g==
X-Gm-Message-State: AOJu0YzkdOg72M5vYW1HZ86YZrYRHDApRXB9TQCRydVI9c7jw9DjYuUt
	clJmoJVtSpnnM7T7iONmB1Gcb7T7phJcyckuFewzThvcnN+EXoGOL/kXg3U9J8o=
X-Google-Smtp-Source: AGHT+IH+8koDzAEVi96+ZBuhEFnsxB1OgbIB1HPSzc5WJ0z1lAR582t2DlYkpIrLRtJeGcczR6V9AQ==
X-Received: by 2002:a17:906:cf8b:b0:a30:8c7e:5f7e with SMTP id um11-20020a170906cf8b00b00a308c7e5f7emr3800832ejb.28.1707717007766;
        Sun, 11 Feb 2024 21:50:07 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id rf19-20020a1709076a1300b00a3743142429sm3507899ejc.39.2024.02.11.21.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 21:50:07 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-imageio: upgrade 2.33.1 -> 2.34.0
Date: Mon, 12 Feb 2024 08:50:03 +0300
Message-Id: <20240212055003.16116-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 05:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108704

Changelog:

	Forward constructor kwargs to PyAV

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../{python3-imageio_2.33.1.bb => python3-imageio_2.34.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.33.1.bb => python3-imageio_2.34.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.33.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.34.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-imageio_2.33.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.34.0.bb
index 32b4472c6..8653983ca 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.33.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.34.0.bb
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "78722d40b137bd98f5ec7312119f8aea9ad2049f76f434748eb306b6937cc1ce"
+SRC_URI[sha256sum] = "ae9732e10acf807a22c389aef193f42215718e16bd06eed0c5bb57e1034a4d53"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "python3-numpy python3-pillow"
+RDEPENDS:${PN} = "${PYTHON_PN}-numpy ${PYTHON_PN}-pillow"
-- 
2.25.1


