Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50256C77B7C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:43 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.69013.1683477216492377976
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=I8oj61Us;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-55a2cb9788dso53746057b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477215; x=1686069215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoVXRaOQyC8ugbghBG4mYAuBTVze+HFTGrzvqDhwMEc=;
        b=I8oj61UsNZPbspiy0v0HPqojp29MEQdb7d3S9KFgk1KFkK8f4QQPw/7JwK/BKDXdWH
         Pv4KB2bhFZ22M5iTguwn+y6JIqF4qKQhridt0UNQ6l47SVuPlXR7xsWgeWoVo/gE3ZTH
         z+X3FUZoQuJ1rXUOKT2+k39smQ5dX/wb0qpx6ap+UABUTBSgviKc4gvVAyE4hJCByigx
         jY4xf/UJM5538fwSt7nDAoJKZ1U2W/ekEm7ZOBk2+oizR4QkctO+MHUvyOfJLxLOQdtw
         oOzBWif/XzOh4nPWb8zxgKtQmQdWwe1rzWzHhvW2Q/ZPtsE0as6eWWU6NyaPmERXFYsH
         L6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477215; x=1686069215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoVXRaOQyC8ugbghBG4mYAuBTVze+HFTGrzvqDhwMEc=;
        b=QxaoI8hyiMUEbWy41LTkV6gRaFgtmJnfNhR1ENFxd5oAuHN09FbSudxogu9xQAOeia
         5agFpyB1XpQ2eF3iOPpJaXRDgjKI9qILkBVbmoBC8ZfFe+UAatCJKaDyWlQ3HTtILZQ7
         SZlvQcyWbmoBdYN5ySuSh7yV/phNHXDsGLaXYq0jGQ8b13U3E0L7LFLU8JUBOvdvVB4d
         O+/dBVkm0KRkqSSeBCJoc9O12Mw6EBe2lwA/Vq6OO8eJan7u6mQEmKWsiiE7ukk3gpDW
         oXDun6DKDeD1m1s/tfaCy1PAiUATraCz6QoxRg9FD3DSrAHB3KEGPIXxdzo9MNb+Svn6
         6s7A==
X-Gm-Message-State: AC+VfDwbWrckPOcI0Fi/oCcJTt4djRz1lQf5XDNYwlhWvJ5q8j1hTteC
	B6a1eMvwhGWxM65DyOCAw7+ZiqcfAI4=
X-Google-Smtp-Source: ACHHUZ5lRUfmaBy1X8a9B3/k/WRqun/uL+vZKJv7j63RDIoAtKjZ3HXfMfyqTHNAtZr4al8odmLkxg==
X-Received: by 2002:a0d:d888:0:b0:55b:22cd:3ab3 with SMTP id a130-20020a0dd888000000b0055b22cd3ab3mr9544533ywe.50.1683477215481;
        Sun, 07 May 2023 09:33:35 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 27/29] ttf-gentium: Switch to debian archive mirror for SRC_URI
Date: Sun,  7 May 2023 12:33:03 -0400
Message-Id: <20230507163305.3261044-27-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102357

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3c34a8f8ebad5a8e6b6bcf96c3d2196107c1ed66)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index 5e355eefa7..eb13b47b56 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://OFL;md5=33a5bf7b98a9c0ae87430760ba762295 \
 "
 PR = "r8"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/t/ttf-gentium/ttf-gentium_${PV}.orig.tar.gz "
+SRC_URI = "https://archive.debian.org/debian/pool/main/t/ttf-gentium/ttf-gentium_${PV}.orig.tar.gz "
 
 S = "${WORKDIR}/ttf-sil-gentium-${PV}"
 
-- 
2.25.1


