Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556CAC2BA1A
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 13:53:01 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.48030.1718891577924220927
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 06:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mBR3ChcC;
 spf=pass (domain: konsulko.com, ip: 209.85.167.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso1039559e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718891576; x=1719496376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1IaalXf2EbvBUPDNHAi5iKG/MMlaRemsgf0cylAgeE=;
        b=mBR3ChcCwUJtKCnbObIOvxxxUQN+woeuPGljXVifzcEsssdX8WoYMv/FULwbKq1TTM
         vVkwjal+JEJ44qQIYCOhjNi0E973OdVD9BKMRiI4f+3PXc+sosMbwZypwLUUWUU5F6fE
         3+Y56l42R+viNEnXFVIVAChZXcnn27cKzBRyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718891576; x=1719496376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1IaalXf2EbvBUPDNHAi5iKG/MMlaRemsgf0cylAgeE=;
        b=Z97C/fTowq+kNjwdG/LYpfoGiFv9lbMl4x0ilBIs9n1AEUje/iy7+6g2bnTsc/wM1r
         q3Qp7meCqbNxbzQ74wg7zxMpuYpo2ju8HXiLXsipVO4ebSYRid+GA8HO6gbeGvSIxOoN
         hmKkDrdwvLuZNWuSEG9Qd0rOAhkJ6RtHfhEzTc5TZ9DdOI3Bm4x9y8uPQCafyggIaS0m
         NYdzOuTpRqHMau4wH5wAVNyrqM/NgUBaCeftHMfQwfb7sBLfoC40DXhAvLiWADCjbtQa
         XB1WNLtHBtldPGefCkqx/yNQvoAikNNC1VcfWQJZg30Z+alK6zAEprdZYPKhDLJDF+cH
         AWFA==
X-Gm-Message-State: AOJu0Yz8PP3kNrXEjK02i7okV9gEQ2JqdEulKKfoxfO5557fc3Gse/84
	wc8xBE+fz2iQR6RPm0nYYfTknKlPwY7y1CvGr/mekF+DB7PBa4WaYMP/r+zkM87Lf09ghXqD/B0
	m
X-Google-Smtp-Source: AGHT+IFOgdQD1U91N5+QUY9gtOB8D7SC2H9jcHNq8YxnRitazq15LknUTg1hr/qGKrxYJmOp7GVkgw==
X-Received: by 2002:a05:6512:3490:b0:52c:a9ba:d7f2 with SMTP id 2adb3069b0e04-52ccaa92835mr3219143e87.45.1718891575828;
        Thu, 20 Jun 2024 06:52:55 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54besm26353375e9.25.2024.06.20.06.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 06:52:55 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-requests-file: Upgrade 1.5.1 -> 2.1.0
Date: Thu, 20 Jun 2024 16:52:50 +0300
Message-Id: <20240620135252.980949-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620135252.980949-1-leon.anavi@konsulko.com>
References: <20240620135252.980949-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 13:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110973

Upgrade to release 2.1.0:

- Correct a typo in requests_file.py
- Remove dependency on six
- Move metadata to pyproject.toml
- Correct homepage link in pyproject.toml
- Fix black formatting
- Set the request property in the returned Response object

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ests-file_1.5.1.bb => python3-requests-file_2.1.0.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-file_1.5.1.bb => python3-requests-file_2.1.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb b/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
index 7ff984a93..4e0adc39f 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_2.1.0.bb
@@ -3,15 +3,18 @@ HOMEPAGE = "http://github.com/dashea/requests-file"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
 
-SRC_URI[md5sum] = "c96daf6b0c56687556e8a52748fd896c"
-SRC_URI[sha256sum] = "07d74208d3389d01c38ab89ef403af0cfec63957d53a0081d8eca738d0247d8e"
+SRC_URI[sha256sum] = "0f549a3f3b0699415ac04d167e9cb39bccfb730cb832b4d20be3d9867356e658"
 
-inherit pypi setuptools3 ptest
+PYPI_PACKAGE = "requests_file"
+
+inherit pypi python_setuptools_build_meta ptest
 
 SRC_URI += " \
         file://run-ptest \
 "
 
+DEPENDS += "python3-setuptools-scm-native"
+
 RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-unittest-automake-output \
-- 
2.39.2


