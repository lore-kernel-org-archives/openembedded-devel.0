Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D0ACCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:37:57 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13702.1762853868956494209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kWMat16z;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b55517e74e3so3503446a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853868; x=1763458668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqLm7Wnh9WIqvekj/+RMwdz1TOPFR8NX1T4wxMaf5bA=;
        b=kWMat16zDJw81fHFXo+Y2PqMVLC0xQ1auua9LRZ0KujmCCH6cI9MZkY+9Hd12LI0lZ
         GtBJ3oI5Ctly/yrBd7q8/h/pgfSdmkova7T84JX+5I4EYC9yUVR5AJBGbTmVOfFVNSqL
         QXyiYG8h2oC9IhBEZ3ro03X/C0kVD65pTSCGqhcU8tA+r4tVpj9PfTFIYCSm4ZHKh3ty
         kSWGXxJyK/KJCOXMIycs2LN7Kd9SrxRpOyVczLmMLkytx9vsAG0c8R+3KWm2c7Whiixw
         ovEQs0CeXeIq5f4H8WtZ/T6fZFN8XzMI8GUkfmaiRdJ1vqNazy8WRd15d0WfyfRWK38a
         7FMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853868; x=1763458668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cqLm7Wnh9WIqvekj/+RMwdz1TOPFR8NX1T4wxMaf5bA=;
        b=K+xxHb7ZMfCWpUfItIF7DxI/wpqfIlP/NTNctr0Ic4uNMWKgzphqnNuTa/AVsMzrx8
         7KotRdsfes/o1VHKLVeI5U5pqyu2sf9I6Ff9VM8MfCRaW/RqehU+pheHSaOKXm7FVxzy
         81cZK5wfTcjhv2QU/PIUzVUfXEB33lWVg51Ixc4W+TFrmVsck3tMq8EVSEe4ljT4eXyc
         +qRYlUbV5EbVP3rqB5UIFU7qp1X/K0hh54g/BWfKlfgdWl24ODgeLTdj97KOeu52rajj
         vVitrdt0uadlcSqqwbh5/SbQlYc1vyUUNgRwOD4jb+m4yCGm8ujOAc2Ylmf0+5Kn+3PY
         ho8w==
X-Gm-Message-State: AOJu0YwpOkxRMbpzUszv2pHrWbKPOP5qxHkP3G4TnNgEZtsO6hAiZHiV
	MLHLjjpVFPB74OhCPqHqJjK9tv+GnDpMSXPcY0mdwhDakxc/DbPotAjwl+e4aHz8KMk=
X-Gm-Gg: ASbGnctCXHswOBKILknLJXvF84mpVaBI44j6tnc4GfPH3MT6xAFcrYeGH9YZtpiiZx1
	6czPedJcLlSoDoXHjd/oCwKkGtNAwCtHXspzuEl/gtLIp5SakdwF1faMCvslwh2Vi5hqxPLqC0M
	muEOChkNiw+pWJDJJHApligNM2pYfv05pIcimlc2Qy6ei3heUrFUERQabbzwIlKtCLWOaYsoAda
	3+veAetd0C8AzK6ASp4rqeXqOWStMAISUyAnNTuozajr2+41GOpHXgBNXZY9S+AtYA88oMF5IaZ
	iiVvD0w9qgR0CW5h1Y4JKYNoD0Hud6BQDxVXF0FDTL2/yYCePsU+rFNlNom22XQeBZxcB5yQqoZ
	vqUiXA5WG5wZl+642eC+PzOzRIX9ZmEP0uV0N2OfFh1LMOjdvhPjhuadTYPWUvKaTPwvLDTLrlp
	qeAQWl2gGcJQYrIg0geVgfiPAn
X-Google-Smtp-Source: AGHT+IGTus90RH3Qp5HSkgxCdheCmua7HeeETPYffLl0w5hPuMWJ4g3f8VxBURf7AkEH7kOKDXOYQw==
X-Received: by 2002:a17:902:e78f:b0:28d:18d3:46ca with SMTP id d9443c01a7336-297e56df08emr155078615ad.49.1762853868089;
        Tue, 11 Nov 2025 01:37:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:37:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 03/18] libldb: upgrade 2.8.1 -> 2.8.2
Date: Tue, 11 Nov 2025 22:37:18 +1300
Message-ID: <20251111093733.1393568-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121506

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e48e7e48a2f6db337579100ed93d79213c3318e0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libldb/{libldb_2.8.1.bb => libldb_2.8.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.8.1.bb => libldb_2.8.2.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.1.bb b/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_2.8.1.bb
rename to meta-networking/recipes-support/libldb/libldb_2.8.2.bb
index 29ff2cf6f2..d5d83bfbc1 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.2.bb
@@ -9,7 +9,7 @@ RDEPENDS:pyldb += "python3"
 export PYTHONHASHSEED="1"
 export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
 
-SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
+SRC_URI = "https://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://0001-do-not-import-target-module-while-cross-compile.patch \
            file://0002-ldb-Add-configure-options-for-packages.patch \
            file://0003-Fix-pyext_PATTERN-for-cross-compilation.patch \
@@ -34,7 +34,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[sha256sum] = "b68ce6eb0ccd2870fa3c8c334f2028b5d16606fd41308696c17b71959f7bf59f"
+SRC_URI[sha256sum] = "0e9aeb657aedbd048b1c0de4afe5b01a8dd33c24a6adb8361a0829374a2fc016"
 
 inherit pkgconfig waf-samba ptest
 

