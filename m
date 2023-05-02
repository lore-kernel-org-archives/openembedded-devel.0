Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F43DC7EE26
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:50:14 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.1308.1683046210442137901
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 09:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=FXpEhn8B;
 spf=pass (domain: baylibre.com, ip: 209.85.219.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-61a35fdf61dso13199686d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683046209; x=1685638209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgWg5MGjg4fwjM1wnWpAgj9huAH9usshZd2b4rAAy5o=;
        b=FXpEhn8BR8804Sjj5W+WAJKO/CSXNDv8ueoC1z1lx3ejqsIGTXGQpP2wlwv7pLjam+
         hymgtln0KnD6US+/KwcECLkYPR2vIi2c4hXr2oEolZ2Eei2iBQa0jeqKr9HxPhrjpFsO
         L2PV7vq6QsySpI5BrDYtDGkGmCI9Ch5Q22+KttHImAN7HcZYJCjOV2yT6Iq0mQOKdPmI
         KAaZnMk/zTJLd+JqjoWsdb7YZ4TPQ8oGzWRK1bgaX4mU3EX2L3BDZfgnVZBfBOkMijx9
         8DYxNalthZ71QUdj58bgFsBFL3sFo83U7wy4K20pVt51C+sfOE9FM+hpbjZbWc50NIFK
         yeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683046209; x=1685638209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgWg5MGjg4fwjM1wnWpAgj9huAH9usshZd2b4rAAy5o=;
        b=ZR6wJlv2SuI/4MhRHwvJ5UgFBVB7RNI0z6lxFm+skMRhTwavrpl+cS5Y2votDNCiwD
         QawAs4zPVTqJ7qNhhgyfmSsqFoSkfxKDf+tzLb1frGLSbI7N+pxW3fzK4xtNxhsSY8dz
         pzuKSPcQNdmgwQfwGAffLTZomHkVLQ5Hao0nmrJzuZmrJyahHHYkwdUx3I/phYktwjRg
         zo3Zo1AEYivIAIru7aTBxW/SNQ3eTp8CkN2NumET+OYGDBcZ7EoBjWmW29JGESuE29O1
         CIufpNhvK3owkr7EEhcpdGz/wnsYC9EgZjJy714TJrYeadmxH6rO0l+UTzY0lbkwZbrG
         rIOA==
X-Gm-Message-State: AC+VfDzIvNB3SnxkJB6w5D4yKLvHeaX2b5g5WyIo0A/HIa09y2MfOmN4
	/2WGQrgcrLxugnwrMH5FLQZ43Qi420B+9E6JOD4=
X-Google-Smtp-Source: ACHHUZ667thSTZ4Q6i/EjuSW4NJmVtiyIZw794aw1C436Xbd+ps545ZH8Yq6xpaWGGHHZw2HUnX++w==
X-Received: by 2002:a05:6214:ca1:b0:5e8:ea1c:69fe with SMTP id s1-20020a0562140ca100b005e8ea1c69femr6228938qvs.42.1683046209325;
        Tue, 02 May 2023 09:50:09 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id u9-20020a0cf889000000b0061b5afbd8e8sm1531777qvn.52.2023.05.02.09.50.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 09:50:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/6] python3-pylint: upgrade 2.14.5 -> 2.17.3
Date: Tue,  2 May 2023 12:50:03 -0400
Message-Id: <20230502165005.880470-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502165005.880470-1-tgamblin@baylibre.com>
References: <20230502165005.880470-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 16:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102269

Change pylint to inherit python_setuptools_build_meta instead of
setuptools3. Also add a patch to remove hard-coded version depdendencies
for wheel and setuptools from the pyproject.toml, otherwise the
following error occurs during do_compile:

| ERROR Missing dependencies:
|       wheel~=0.37.1
|       setuptools~=62.6

Release note links:
2.17.x: https://pylint.readthedocs.io/en/latest/whatsnew/2/2.17/index.html
2.16.x: https://pylint.readthedocs.io/en/latest/whatsnew/2/2.16/index.html
2.15.x: https://pylint.readthedocs.io/en/latest/whatsnew/2/2.15/index.html
2.14.x: https://pylint.readthedocs.io/en/latest/whatsnew/2/2.14/index.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ....toml-Remove-hard-coded-dependencies.patch | 30 +++++++++++++++++++
 ...int_2.14.5.bb => python3-pylint_2.17.3.bb} |  5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
 rename meta-python/recipes-devtools/python/{python3-pylint_2.14.5.bb => python3-pylint_2.17.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
new file mode 100644
index 000000000..55d42b101
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
@@ -0,0 +1,30 @@
+From 843d050f1bf889b81fa8fc3e7a1350385c8348ec Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 1 May 2023 11:32:24 -0400
+Subject: [PATCH] pyproject.toml: Remove hard-coded dependencies
+
+The upstream pyproject.toml has hard-coded dependencies on specific
+versions of wheel and setuptools. This breaks builds of pylint 
+2.17.3, so patch it to remove the pinned versions.
+
+Upstream-Status: Pending
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index e4b63c660..0ee21e0eb 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools~=62.6", "wheel~=0.37.1"]
++requires = ["setuptools", "wheel"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
+-- 
+2.40.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb b/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
index 738b9250c..b85f77503 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.14.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
@@ -3,9 +3,10 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI[sha256sum] = "487ce2192eee48211269a0e976421f334cf94de1806ca9d0a99449adcdf0285e"
+SRC_URI += "file://0001-pyproject.toml-Remove-hard-coded-dependencies.patch"
+SRC_URI[sha256sum] = "761907349e699f8afdcd56c4fe02f3021ab5b3a0fc26d19a9bfdc66c7d0d5cd5"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "${PYTHON_PN}-astroid \
                    ${PYTHON_PN}-isort \
-- 
2.40.0


