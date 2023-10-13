Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6512CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:08:11 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.44366.1697216884790746777
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 10:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2t5hG8IP;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7757523362fso152003485a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697216884; x=1697821684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KEzerSLwIi0lw5kHtAK6LdSqnuznOhUAXRX73nu5SVM=;
        b=2t5hG8IPUoN/gWyWdUuDZCTFw4RSIEs466SFu/MZPcwRuGPgVHDjUm6nYsM/DmHTDY
         oGJWdPkt1BotmgyShI9d32oxrpUXRKpVWKx2FbF1+ZpMYtP6RQJjT9BMPLtr7caAo8FY
         sz0Gxambw3wgA0ks0oy4E09sQbxkz81726aDAj0bYuOpuxB9KQCxzLcRT8mvi8ZtYwfP
         kwxH5bMVCs94ynbYzLs5zq3OUGcQEHceLH9eeEmyZA8tK2fRszhMsWRGn/SiGQIGgRTj
         OtGpLl7yyy8ER3y4Ql+92HC6UAHy3IlCa9iIEqw7RlBSh3BHhRq9zxBHWp7y48mw3Ke6
         jygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697216884; x=1697821684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KEzerSLwIi0lw5kHtAK6LdSqnuznOhUAXRX73nu5SVM=;
        b=XOTWSIIuFmuc7rL38OaIXNutYWJMcTipH+YxwySBl20lBHwJ9emcCSt3n05OQGXJsu
         cS7bntSD5EF7bOZWZFVUHIXRWhXDFpA68pDWk5K8Hf0JqVR325XTnf7oWcgEVH0rtjwq
         bLEiy/4L4CodpwCptGIVRYqy6rwfS6hu71u5faOKxGMQ/5hrEfMIOtsidh6vX6EUEHdN
         EP+XKpPH8wvl7Dy6jez0On1hogqKE6Zfnrhm8QG0CIWzdjqu/yksQkq62DttK6xmLBdh
         ESxXWycO+0TKyRtSoaTZspwsaKCkgOfz76PdbaB+vpMZHvQ8f+21b9yOmOux83daemPI
         mepA==
X-Gm-Message-State: AOJu0Yw8WKut1gxl5+gzSOCQ6uXm4Q94QLap0f1PFisIQowkmxPsUT7f
	5b/OpiBi5y2IEOattMrZ2bqtK4/ZfESAyfnBnGhPXQ==
X-Google-Smtp-Source: AGHT+IEgLt+DaEI9H5w1HKtNI4qj2ifc6hBAkgAyLrnPmGMXi+0WKwQAvhbfI7g3YUSI/ceOBCG39Q==
X-Received: by 2002:a05:620a:c8a:b0:773:d86f:ec88 with SMTP id q10-20020a05620a0c8a00b00773d86fec88mr25009930qki.35.1697216883658;
        Fri, 13 Oct 2023 10:08:03 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id oo22-20020a05620a531600b00767dba7a4d3sm781068qkn.109.2023.10.13.10.08.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 10:08:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/4] python-git-pw: add from meta-patchtest
Date: Fri, 13 Oct 2023 13:07:58 -0400
Message-ID: <20231013170801.3966008-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 17:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105480

git-pw is a tool for integrating Git with Patchwork instances.  Add it
to meta-python from meta-patchtest so that more workflows can take
advantage of it.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/python3-git-pw_2.5.0.bb            | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-git-pw_2.5.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-git-pw_2.5.0.bb b/meta-python/recipes-devtools/python/python3-git-pw_2.5.0.bb
new file mode 100644
index 0000000000..d060a922b7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-git-pw_2.5.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A tool for integrating Git with Patchwork"
+HOMEPAGE = "https://github.com/getpatchwork/git-pw"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=26e1a171d943c64f00c51f90c256b9d4"
+
+SRC_URI[sha256sum] = "c60169f9566bd6710f9c0985a005a0c326460b739d3f2b5c5c71e85211584590"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+    python3-pbr-native \
+"
+
+RDEPENDS:${PN} += " \
+    python3-arrow \
+    python3-click \
+    python3-pyyaml \
+    python3-requests \
+    python3-tabulate \
+"
-- 
2.41.0


