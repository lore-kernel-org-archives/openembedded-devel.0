Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422B7C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:11:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.84375.1749553890451157949
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jun 2025 04:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=su1LOTc8;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d6ade159so44805305e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 04:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1749553888; x=1750158688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPLt3mgGuVlVt8TuElcRgZ8zZryLhmodssGdwNElX+c=;
        b=su1LOTc8NesWGuzn3vRNYe8AYCnCaE0qOZD0vu7B/L1DQ++sf4yQER7d7AIVJQXsut
         twEPFGJIWcThgAwN8T9JjSZ09HUcKe3zrWA2xV/obDlemhetQCYwEZDQzy2F2J6enyb3
         7jY1pn5l5m+8qIfMjswyTkYGld97Jdd9EKHCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553888; x=1750158688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPLt3mgGuVlVt8TuElcRgZ8zZryLhmodssGdwNElX+c=;
        b=tSaJ0QevZ0Aq8Fzi+aISD9mIMt5IVVbddL8vUyvHxjo+BE78Zh+CroPpJaDmkA58oG
         49JF/zISvGyBdU2d9Nq0zGJ6LZhs7fiK1OkX7f1oDgM3FrQTassYjVKhtTAsIrStbt6B
         /grs2IRXXCcRATeCqo9t2OpprbYOCksIoN2EtdqMR9w4j3Iw+KSigGEjTn/x0qMHAhbl
         DAePSzTCFEHy5JiZma1mOu+hM70x0yd6SNuLD3+c0eA+fmxDFZEQU1JJL8ud5k/KDQT+
         fh3fpe7Y9ZEBAVD15zrL5tUqKYbLnlN+BjlGmXhv0Hb+AAlSmLprt9JrRau+c88IIHu9
         VQPA==
X-Gm-Message-State: AOJu0YxEvkTvQzFiGc/yN+eQJBAue/s8Q1tYkibkUoS++Vp8o7l5oRGt
	igEE+32DC1by6oN/KXsE1w4oYZD+AQu+tdQHbiDtH33EKiZ5QQ38XgGBBev+97g1HSjuyStlqAa
	T1YxU
X-Gm-Gg: ASbGncvKgfgqIWv5bY/P7dCfN5DK6pUT1ZKOs0ezEYpbsFjNoeAbHpB/1PSEb/LD/N0
	+K2tLtzVGqaaJEu6krF1ns45DEdK/4oJDMUvdUZJRXt/8poNLN4jaU3xqu2Ni27oXsS45C+XxGa
	bU3884F9TPF9CnSLQqPOFxsBfLJ/zh7jC+VFbiscnI18bhwNM+DZ6oKFAgOnk59rGCDQPVhK4km
	PNpjAarGvGqrvl9E5fEoA6FrqzrW/k2CnBpa4inIxSAmAzJmVPg3cgA02CeZfpvA738Kg5LH1jI
	BkVwENuLec36RPWGoMCrOaXSVfLUiIeytG2HYLXp7AqMUbeWuowTgJmC7e+QQ92IDk9JIASVN0n
	Y
X-Google-Smtp-Source: AGHT+IHP7kMCPOOWeBmVqmmHVerRmySW4REIJWxydW0UksGZqZRUBR9heSZE3jxazguhUroSstV2rQ==
X-Received: by 2002:a05:6000:250f:b0:3a4:d02e:84af with SMTP id ffacd0b85a97d-3a5319b5ca5mr12888914f8f.58.1749553888389;
        Tue, 10 Jun 2025 04:11:28 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229dea7sm12267343f8f.12.2025.06.10.04.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:11:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-html2text: Upgrade 2024.2.26 -> 2025.4.15
Date: Tue, 10 Jun 2025 14:11:25 +0300
Message-Id: <20250610111126.2530443-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117863

Upgrade to release 2025.4.15:

- Fix CI for Python 3.12
- ci: publish wheels to pypi
- Upgrade Build Tools to Latest
- Support tri-backquote style code block and fix ordered list indent
- Fix invalid character reference parsing
- Fix a typo in docs/usage.md
- Modernization of wheel building process

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...2text_2024.2.26.bb => python3-html2text_2025.4.15.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-html2text_2024.2.26.bb => python3-html2text_2025.4.15.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb b/meta-python/recipes-devtools/python/python3-html2text_2025.4.15.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
rename to meta-python/recipes-devtools/python/python3-html2text_2025.4.15.bb
index 98e0cde1e5..2734dcbdee 100644
--- a/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
+++ b/meta-python/recipes-devtools/python/python3-html2text_2025.4.15.bb
@@ -4,12 +4,17 @@ HOMEPAGE = "https://github.com/Alir3z4/html2text"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "05f8e367d15aaabc96415376776cdd11afd5127a77fce6e36afc60c563ca2c32"
+SRC_URI[sha256sum] = "948a645f8f0bc3abe7fd587019a2197a12436cd73d0d4908af95bfc8da337588"
 
-inherit pypi setuptools3 ptest-python-pytest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PTEST_PYTEST_DIR = "test"
 
+DEPENDS += " \
+	python3-setuptools-scm-native \
+	python3-toml-native \
+"
+
 RDEPENDS:${PN} += "python3-html"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


