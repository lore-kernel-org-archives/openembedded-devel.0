Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FEAD116FB
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 03:05:02 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.4206.1729911900370770204
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Oct 2024 20:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N3Eqzqvn;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2e87153a3so1904665a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 20:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729911899; x=1730516699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUetoHG3U15Ev19L+SlNVmudAROJDfaV/cLOcVIac3g=;
        b=N3Eqzqvn+NxYSzkzjMrnqMIovYn+7jUt5WqQCZU5bp2HQO+SZQT+XZxKXCdKWxrbnf
         2vxVxN4EdSKcs8KQJVgA6HJgIHgabrLEEkBKkOcgbOv3Jj51jwt0NbyEHEb6EIfbYCsb
         CT17/di1uDkBGQLprCxyvvOb+BwddS5Ee64MaRTZUWAJXPLAC64axwaJPxQmmNwiy98q
         2DU6bFrKu6aTL8njHP0Qyk6RDw2663xSvD6t7ViyWGUAQHawb7g2ujkx5gJYvLJ/nUXD
         EQWpcaEuPuDnuKZWPoxs+3tleSjy4w0grZ71gVDPNtbPz5rp3w8mYFoyLT92HDxXiBUe
         u6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729911899; x=1730516699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUetoHG3U15Ev19L+SlNVmudAROJDfaV/cLOcVIac3g=;
        b=nPTURu72nFvkxvl3SDVOc+hCUkQ70pNdWgAi5KXUny/zSEt4nVU7yvICEFH5IHmwqo
         SZsG6yrFgY2ThDC6vEakmtFJwIIruWulP5cKBjTzKMCcPjzGJbUCTHA2d7ls2+4VEpr8
         lgtaiJdv/vMNeRFlOe9SgH0oMTmqv3O+pXBxSXkmi2+KQHbkld4lG1l4h0CFTSoYgHX1
         rIlyAss8KGi2qfQcIa8U4mftg0JFOWTRYKIW0h98kS4CwRDcq+QGon2WibZFC4udnGOx
         VfyxE2NVGtuDNpHfH3QuXh0HsUiUaeUks2A5u8XHFReMvD9AUjVrCUovPjKwmKOF/n2L
         XlLg==
X-Gm-Message-State: AOJu0YzP5XZPQ0i2adBHYwYgfMd5qwai0vr9XzZDCpr91JvijWdEcY2x
	mBAIU5ueEk+Ng7tBrvCn1F5cnASYcZdBcxnNEBNTSvVby0aUloauCE1Pz43J
X-Google-Smtp-Source: AGHT+IEPqbXidDavanY23fPmHAwX2/Z4K4yC7TGquXr0k2WdYfTUZINoo1EYQLFzCk+rusdBRyVTwg==
X-Received: by 2002:a17:90a:9cf:b0:2e2:b922:48a with SMTP id 98e67ed59e1d1-2e8f10723bdmr1955991a91.18.1729911899504;
        Fri, 25 Oct 2024 20:04:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7c83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3771a1fsm2307317a91.57.2024.10.25.20.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 20:04:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-aioresponses: Add recipe
Date: Fri, 25 Oct 2024 20:04:53 -0700
Message-ID: <20241026030453.2517894-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241026030453.2517894-1-raj.khem@gmail.com>
References: <20241026030453.2517894-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 03:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113234

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-aioresponses_0.7.6.bb      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aioresponses_0.7.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-aioresponses_0.7.6.bb b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.6.bb
new file mode 100644
index 0000000000..a99c80f592
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.6.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Mock out requests made by ClientSession from aiohttp package"
+HOMEPAGE = "https://github.com/pnuckowski/aioresponses"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b22b40d5974300051216633098387c57"
+
+SRC_URI[sha256sum] = "f795d9dbda2d61774840e7e32f5366f45752d1adc1b74c9362afd017296c7ee1"
+
+DEPENDS += "python3-pbr-native"
+
+inherit setuptools3 pypi
+
+RDEPENDS:${PN} += "python3-aiohttp \
+                   python3-asyncio \
+                   python3-core \
+                   python3-json \
+                   python3-math \
+                   python3-multidict \
+                   python3-netclient \
+                   python3-packaging \
+                   python3-unittest \
+                   python3-yarl"
+
+# optionally needs asynctest asynctest.case ddt but recipes do not exist for them
+
+PYPI_PACKAGE = "aioresponses"

