Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3972CC4829C
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 05:42:24 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.11832.1707370935747389391
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 21:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sq7dmGdD;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a28a6cef709so191069866b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 21:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707370933; x=1707975733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=INZCVQ2NYHkCRQu3QIjqcIG0JqAy1pnjaSvPHQ3fLE4=;
        b=Sq7dmGdDmE17ZJNTyDpgOxYwq34M31l6vUAd6SDjuQjv0h89v/qqcpURSJg42xBIiH
         qqDBSKHv98USBo0Y94hNqOhag30y5Gowl3luL0YqXvgU/y21W0lkLeeBFczZNpYoJbPn
         519FXSjwus/1jglWwqN82GRgvGWI0EvWlezDTe9qAlHRPSTBAy9bpT13FoBDWdivm6Ax
         S9xA7BFnBWAq95mZCRMR5r3c8caZqZuMJV9ApjwmrY4oeGL7eRwJUrcrMTMxcVDrxBc+
         wY6tNqk4e7dH8hSb2PVtaybrtiOA4BTfV/yy3TC6JgZdH9alnKM8UIQJoaY6g5nNtZ42
         +PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707370933; x=1707975733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INZCVQ2NYHkCRQu3QIjqcIG0JqAy1pnjaSvPHQ3fLE4=;
        b=LEVuIiWVXuE59jim5649fDRex5rfe6vQvvX40NRGaqT0LXhJ9XshKnWJ0vJ9ZW7UAL
         Zydqazjh53dNnu4zQvjkWiR5lnxNOatxkw6zCHdLPlUt/hcZuSwQnkVAZZiTr2CFaRdm
         /BPVZ3kJVcRMgShn0ICsoszn5MaDFyZUv5aKSc4pHBCiEzckNSAfkkEkg+P7cFl52GSz
         eDW4CbnEd7mQfN+raKWbTIAUN8wcGUyYArx9PyCan6orC/FJXJJD/bqVk9+DSbvuRh1o
         AiJkTWAOEU1SSxkg/dz1A5T20JwnKRovFxHPQLItJ2DFLwYCbU/uzj0D4xbDNcNkhORM
         dnTQ==
X-Gm-Message-State: AOJu0YxJQx0i/OFWZLFVNNP2E1cuk+jx7w4l8uHlbuhYzbFHWvmFMHHh
	RtEl3QRYIXfTahUZDhrmCu4MZ5PPhvkLhz9rsYu8RvgE93k5Xf0QipVaHiUAvV0=
X-Google-Smtp-Source: AGHT+IG8zNHE3FaPNpG9JV24dAnwoZBOwN75A1292PVM7hC8H8jCwDpXx/okZduW3H8VlD65e4Rfyw==
X-Received: by 2002:a17:906:755:b0:a3a:7f9c:d4d with SMTP id z21-20020a170906075500b00a3a7f9c0d4dmr638203ejb.54.1707370933407;
        Wed, 07 Feb 2024 21:42:13 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090633c800b00a381a3a7081sm1504203eja.156.2024.02.07.21.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 21:42:12 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-strenum: add recipe
Date: Thu,  8 Feb 2024 08:42:08 +0300
Message-Id: <20240208054208.39929-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 05:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108655

StrEnum is a Python enum.Enum that inherits from str to complement enum.IntEnum in the standard library

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-strenum_0.4.15.bb                 | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb

diff --git a/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
new file mode 100644
index 000000000..1d2def79a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-strenum_0.4.15.bb
@@ -0,0 +1,12 @@
+SUMMARY = "An Enum that inherits from str"
+HOMEPAGE = "https://github.com/irgeek/StrEnum"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ba0eb3de1df70bde0ed48488cfd81269"
+
+DEPENDS = "${PYTHON_PN}-pytest-runner-native"
+
+SRC_URI[sha256sum] = "878fb5ab705442070e4dd1929bb5e2249511c0bcf2b0eeacf3bcd80875c82eff"
+
+PYPI_PACKAGE = "StrEnum"
+
+inherit pypi python_setuptools_build_meta
-- 
2.25.1


