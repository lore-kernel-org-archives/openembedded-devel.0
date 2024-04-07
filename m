Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57EDCD128A
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 21:25:57 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.92290.1712525152933887030
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NF0YmoTX;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51d83fafa8so17997766b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 14:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712525151; x=1713129951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1T7Ji+/DX5FViXlTAuorBbWDHcPODXQINDiDpPadnqA=;
        b=NF0YmoTXASbeZ36Gq4DVUesIDlJZe88nutf6SpbxJ5yg4Snw2oPOO53O9pa2nyo3Yw
         U8kNjXtVRVlqrNyaiwZwi7HjwnZW5D+EvOfOZ9amRtBioLNd6pmMVHfHLEcYNuN16pwa
         holNVtV+YHPH95oqOCbozJZxLncExKEPI3sO0pwvsw1jbQmx5aMupy3EstEvGq7Kh34U
         NPQtnvfsOB/27fXg5w55VXTasGVbFHf+DiVtsqWqMCBl9ge7qRr8CK+QGTJzYeIbUGlm
         k0EQQJ02s+GTVkvyEo/5wN6fagvCKc8LNJFGm0cuF8uxUIUX3DSj+GXxCOtGCHIe4LSz
         xNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712525151; x=1713129951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1T7Ji+/DX5FViXlTAuorBbWDHcPODXQINDiDpPadnqA=;
        b=TkJLI/CUK9q/8stdW1AnVrCgUaxTuikzZBeQtPjcnsNRShuFbXDGLv7kYsWkRQWVY9
         qxhSUGgE2oAFQewu/nKXwWiq3NgH/N80RaLImxHFFy+TMtwe0s0VCkDm6pArQqMRioEY
         1V9J8HxVMalmr9nkRmE9qY8xpVsmIqMZ4KWp2NwT+VwOL/aBCBUSpjZ+dl2KD/+QtsoX
         L5qEC5WWNzej+4m8haubtSst9U9cgRz+rfigDommODJPfZTJnoasO31U1DV96wsSRsJd
         jgwq8KZbzrIA0LcamATYSS5sDZwP+wnY1BKmE48qUGfFFe5AGVgVb0jzRKjlDL/J4Vow
         VG7Q==
X-Gm-Message-State: AOJu0Yz4B2GmRY8xnntWq0HSh7x6dEPXA/33D9045NQ+ngFFAde7tjsE
	A3RAA/S/Woxq/7A71sbUWCmZP6hwiKcUqV4P0hoyCrkhO2ysE2zaSOnoxXIueuI=
X-Google-Smtp-Source: AGHT+IECK8e2Gknwbe15Nini+/fL9JncRQE0wypRgQunzE5ohFAXwaLq+qTXHpjiRrQC8HVIU3JjKA==
X-Received: by 2002:a17:906:565a:b0:a4e:1109:9007 with SMTP id v26-20020a170906565a00b00a4e11099007mr4677405ejr.19.1712525150656;
        Sun, 07 Apr 2024 14:25:50 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id dr20-20020a170907721400b00a518c69c4e3sm3560974ejc.23.2024.04.07.14.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 14:25:50 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-sqlalchemy: upgrade 2.0.25 --> 2.0.27
Date: Sun,  7 Apr 2024 21:24:44 +0000
Message-Id: <20240407212445.667665-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407212445.667665-1-t.f.g.geelen@gmail.com>
References: <20240407212445.667665-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 21:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109854

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 ...ython3-sqlalchemy_2.0.25.bb => python3-sqlalchemy_2.0.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.25.bb => python3-sqlalchemy_2.0.27.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb
index 35011553c..e5a837659 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.25.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.27.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "a2c69a7664fb2d54b8682dd774c3b54f67f84fa123cf84dda2a5f40dcaa04e08"
+SRC_URI[sha256sum] = "86a6ed69a71fe6b88bf9331594fa390a2adda4a49b5c06f98e47bf0d392534f8"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


