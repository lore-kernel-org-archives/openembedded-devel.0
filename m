Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DCCC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:25:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.51747.1699017899188668897
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=e6b+BOZ2;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40906fc54fdso16098375e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 06:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699017897; x=1699622697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YD9ISSW6FPlw8KcS6prPcfJ1fop/JcrRx9uLOpvBdsc=;
        b=e6b+BOZ2eGs0eSOQDRKiPCo4vMkVTOIGkk0Gw8hWj9vefVgaXlWta3A8S//MWnxG9B
         Lq4wpmqQKxcQmT2g/rxCy8X+yx/Pc4sbQhH1BshQ5JE9Vs2vbhJ9wOI+mh28jZRRN/o9
         3HnvlUcoxtkXNL1o4V0JwAqoa/viwEY+oPVz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699017897; x=1699622697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YD9ISSW6FPlw8KcS6prPcfJ1fop/JcrRx9uLOpvBdsc=;
        b=fPREzg9Oo/WPFgdUDUvcsODjpp1ZaU9IvqPcXGrbLNQ2yR2cdnypXaD9/g6OW1Bxod
         Lhrbc+kzy0fF0+G3iKxBHzr1TYz0Gy7jelOO4QByAjxlzDi8ihRiBZOQYu+c2hmqVLNF
         VZDqo2iCmuXva2xn6aNvplvxwP9trTK0s2VoVkqze+PhmfR7Js+fCcnUqicgcUjtkbtW
         mnYfwEj76n8t1ANJf48xIE46Lwhe2QwfaqLs6b4imQubJoauyJ86fzPQ2yai0l1piv/t
         N/uF0t4l+Lb9YD2Fxrohb/0C0adfbg0Bm0JRJPHZGIMJZ1bHYiDgLxsHk5gb79em4ep/
         RSDg==
X-Gm-Message-State: AOJu0YyWYS8XwyijNYqQmjD0vsdcMTEIFnv0POsluVBxb7oc+P2TSXc7
	pz96Yq3krUd+gQTPowi5FAXtfDAYUbvVCgAGKoM=
X-Google-Smtp-Source: AGHT+IHqSYH6mccz42uOyuKJb3rmnjXISIiYTXXOrUV7F6B4v4Ss78Cb9b0fSOJeC3or80+5Ekf1YQ==
X-Received: by 2002:adf:d1c9:0:b0:32d:8094:f4c8 with SMTP id b9-20020adfd1c9000000b0032d8094f4c8mr18047763wrd.19.1699017897181;
        Fri, 03 Nov 2023 06:24:57 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d4ec6000000b0032f79e55eb8sm1869754wrv.16.2023.11.03.06.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 06:24:56 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-screeninfo: add recipe
Date: Fri,  3 Nov 2023 15:24:52 +0200
Message-Id: <20231103132453.3853904-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105861

Add screeninfo, fetch location and size of physical screens.
Versions 0.8.1 and 0.8.0 changelog:

- Added typing information
- Started tracking changes
- Switched to poetry
- Added ignoring of enumerators that work, but return no valid
  monitors
- Added ScreenInfoError to list of top-level symbols

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-screeninfo_0.8.1.bb           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb b/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
new file mode 100644
index 000000000..0fb3f3a22
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-screeninfo_0.8.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Fetch location and size of physical screens."
+HOMEPAGE = "https://github.com/rr-/screeninfo"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a23813181e06852d377bc25ae5563a97"
+
+PYPI_PACKAGE = "screeninfo"
+
+SRC_URI[sha256sum] = "9983076bcc7e34402a1a9e4d7dabf3729411fd2abb3f3b4be7eba73519cd2ed1"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-profile \
+"
-- 
2.39.2


