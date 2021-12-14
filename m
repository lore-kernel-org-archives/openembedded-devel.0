Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623B9C433FE
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 13:34:58 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.25932.1639488897335130350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=TV8DXfLb;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.176, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f176.google.com with SMTP id a37so27242168ljq.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jxav9Han3Fvzia2AEiTs39JO1LKi6z0SG9AQYcBo7f8=;
        b=TV8DXfLbXTPhuxJEs8PdpOMRte3LWuojR7iaEGEVmO+85ebImMfbOc2w24WXZRfK0W
         XEBE/ho41JiQj8TVJTCVR+xW54LlaSuWsuJxmTAACGNNBXAmPfrhMRMk1vM5HoOLsJW+
         WH+DlsQKYpNQGSeLU4iBg5qpFXtCaMmykOP9flP3R3H2hcG8A42vv5yI10w7PtLfKPbB
         Srs3SAtDKCp6NV6/tkYP6xraMIiuKQ7pOgGQRWjZ18wu51KGX+LHFg09D4iMmkEkUl4A
         A/r54JhgmCFx/NsQLuKt2IE0TUfduIK08jk6QADo4D1oqIruwGb6Idc33Ye1qaa+WhPy
         B7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jxav9Han3Fvzia2AEiTs39JO1LKi6z0SG9AQYcBo7f8=;
        b=Nj/UtgiAEDzJ0kHdzVIuyp4zwaRSf2YLNYVZdNtJDkbXZufJVf/yv46f7HjvRFBVOZ
         d8KwsxdiK7MThyxcN8RMBcyHlzQw2yzJ/LSrhiRzlNvSaF4lyKE5m/IOj6Wfr3CMmmVt
         4PyF22KVSnhrX0ObDTyilwL/D4Utmr23BZJvBi6eTRDyKlZ9UrUEfK5l0iX5hwvHEKQR
         6bUFxzzvgFYH2Ea09K0omr+9grK8VEZKlGruCDt9iUngcjshlOE1qPnFq0ZiyWA1Who0
         GXyq1Zom3eMTljEp7NhGMMcrGNiMQ+bXhAcSD1+VyWSd8f20G6Mkxp3EMX973QMAs6rg
         femA==
X-Gm-Message-State: AOAM530Yz1JYKJhk7938/H2rWUHkqClpaLETl76GkgHbKa0rE/sXoFfm
	dvAVLd1jGRjA/cdMl+3IH8+OvJnt6uw8LlXR
X-Google-Smtp-Source: 
 ABdhPJxfpjTdrI8g9zHwxAA+MMq2fW9H810kiPd5UJuEdzLWi/8l7PAQ93sLyy1hjMV7vvxyEKQbIw==
X-Received: by 2002:a2e:9196:: with SMTP id f22mr4819767ljg.444.1639488894726;
        Tue, 14 Dec 2021 05:34:54 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 bp22sm1825613lfb.93.2021.12.14.05.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 05:34:54 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-icu: update to 2.8
Date: Tue, 14 Dec 2021 14:34:52 +0100
Message-Id: <20211214133452.1175163-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 13:34:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94351

License-Update: there is LICENSE file.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-devtools/python/python3-icu_2.7.2.bb  | 13 -------------
 .../recipes-devtools/python/python3-icu_2.8.bb    | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-icu_2.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb b/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
deleted file mode 100644
index 2433a8c9d..000000000
--- a/meta-python/recipes-devtools/python/python3-icu_2.7.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Python extension wrapping the ICU C++ API"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=244;endline=252;md5=3e00c41c6d04310707992b93307a224f"
-
-DEPENDS += "icu"
-
-PYPI_PACKAGE = "PyICU"
-SRC_URI[sha256sum] = "1382869b22d91cc99274f9b525fa7d9199b44d9007ff0036a09747839a01e9dc"
-
-SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
-
-inherit pkgconfig pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.8.bb b/meta-python/recipes-devtools/python/python3-icu_2.8.bb
new file mode 100644
index 000000000..f3dd7a4f5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-icu_2.8.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Python extension wrapping the ICU C++ API"
+HOMEPAGE = "https://gitlab.pyicu.org/main/pyicu"
+BUGTRACKER = "https://gitlab.pyicu.org/main/pyicu/-/issues"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59"
+
+DEPENDS += "icu"
+
+PYPI_PACKAGE = "PyICU"
+SRC_URI[sha256sum] = "3d80de47045a8163db5aebc947c42b4d429eeea4f0c32af4f40b33981fa872b9"
+
+SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
+
+inherit pkgconfig pypi setuptools3
-- 
2.25.1


