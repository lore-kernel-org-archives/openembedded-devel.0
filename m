Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769D0C5321D
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 17:42:15 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.565.1724434929789538168
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Aug 2024 10:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EXGvo1cm;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bed83488b6so2907325a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 10:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724434928; x=1725039728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYtb1Y9bSo9pGfdn9iyPg7f7iD+Rl1TFlkb64Izh4uM=;
        b=EXGvo1cmYY0Dt5mV/Irt1gLiYLm0WoszTHW7auoIf/ibqRyVm2TXn6T0QykFfMFfMi
         l6KmOEyrosxp1REhGywfMJ29M7lO5aAemtr57tMk658/iaVmRMWqxAxlBQYhhDEDTTw6
         LSEumg9OoGgI/Z/xsS50ZKrwAd3kNa8KiMbd1rz9guid5LxmMWdLq1eV3lucoT0eCzdp
         PMQNZfFYf5oj2u849Q5VaUVZcPdmnyoUiKRaLUB9tWt8KvD4iEiHvhGASCGB2zJVbYMl
         DjzbReZe1EU3hEqnQ4jPIU1eEC6rGbaIUaJZUUCWpNGJdjDqxEDtynYkB5/x/KZNUPRg
         Ixeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724434928; x=1725039728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYtb1Y9bSo9pGfdn9iyPg7f7iD+Rl1TFlkb64Izh4uM=;
        b=ZG+vqeAkDBYCdW4S6EeUBc9lnoa8Fhewqa9ZDC8LUqSfgXVqCcT3P8slIPzwmw4oPn
         +h6pR22VxjLBzY7ML98n2b33KqyG+9JbRnVLJtCMV8YC0EXZmdVmp8OOUEsefXQiwsmL
         XqhEqW+cHdGsGWa/cZXvHLKfDO7+lwr7pmFSZiW0H4jWXQNNErxF/FHyvi9N92LFT30I
         rowkrZBicNICC2eD4C8hYZAnBqzMz8rE+EsD/KFtH/SM3Fn1na8yW4QZilPOfc6/CzfR
         O7zh+3lGKHA0qVHqprGqEkaLyr+r63FkgCL+TN1kQLUmg2UX4HbYPQu0ldqG3i9hZ9AT
         Sc7Q==
X-Gm-Message-State: AOJu0YxDTYEyIbOypHdnQa+nA4SZ6wk1aQdoufflpIChU56slVrZKKKh
	rUUpNL8xKwK7o/nhzQM0G7dLN56AxABrW+7DpL2clnK/eyE5dXdniwV91w==
X-Google-Smtp-Source: AGHT+IE0oeKp5mQnqUwZSpsOmTogx5FHG8EbwbGNo+/RgBxaQ7O8UF2iI4Jzkkm2ut/+Vk8uHKjOlg==
X-Received: by 2002:a17:907:6d17:b0:a86:851e:3a2e with SMTP id a640c23a62f3a-a86a52ccba2mr217869666b.30.1724434927239;
        Fri, 23 Aug 2024 10:42:07 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f47c68bsm285748166b.155.2024.08.23.10.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 10:42:06 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-automat: upgrade 22.10.0 -> 24.8.1
Date: Fri, 23 Aug 2024 17:41:52 +0000
Message-Id: <20240823174152.4262-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 17:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111914

There is no changelog but there are few improvements relevant for the build:
- python3-six and python3-attrs are no longer dependencies
- We can start using python_setuptools_build_meta
- PYPI_PACKAGE doesn't need to be overridden since the default is now the correct ('automat' instead of 'Automat')

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...hon3-automat_22.10.0.bb => python3-automat_24.8.1.bb} | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-automat_22.10.0.bb => python3-automat_24.8.1.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-automat_22.10.0.bb b/meta-python/recipes-devtools/python/python3-automat_24.8.1.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-automat_22.10.0.bb
rename to meta-python/recipes-devtools/python/python3-automat_24.8.1.bb
index 9e33fe783..e2a31bea1 100644
--- a/meta-python/recipes-devtools/python/python3-automat_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-automat_24.8.1.bb
@@ -3,14 +3,9 @@ HOMEPAGE = "https://github.com/glyph/Automat"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
 
-SRC_URI[sha256sum] = "e56beb84edad19dcc11d30e8d9b895f75deeb5ef5e96b84a467066b3b84bb04e"
+SRC_URI[sha256sum] = "b34227cf63f6325b8ad2399ede780675083e439b20c323d376373d8ee6306d88"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-PYPI_PACKAGE = "Automat"
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} += "\
-   python3-attrs \
-   python3-six \
-"
-- 
2.34.1


