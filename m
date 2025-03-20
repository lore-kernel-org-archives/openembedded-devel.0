Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE911C36002
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 10:34:47 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.4230.1742466877619213107
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 03:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sVXHk51X;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac289147833so123669166b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 03:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742466876; x=1743071676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YHHUHtOwmU/7WdSudG+R/Yu5XXXfsSMQJRAbRXr5yDw=;
        b=sVXHk51X2uNFi7XDChD23gwJlJyQfisaeSnnMphzHLkFSV9B5vqxhvOrOfPLPu/+0W
         TrdiCM9gV/T1TU/7tFwnWLqBgu/uNoq7uabF/9pT46CEVj2M9UeI4SPhfkic10W4w+Ih
         EfQnIk3izxoygMZAn39fpzv5yDvBcpMyGh4mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742466876; x=1743071676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHHUHtOwmU/7WdSudG+R/Yu5XXXfsSMQJRAbRXr5yDw=;
        b=EBXxguuX2GaHUytb/CvTXMQECQdJb770/FrRcwHMNXier/34umvsnaO1EiWquwlE7U
         fZcfI1FWAcZxict9reqoH3xMGIo+CRbDyRjNC7jhOBDzTo/Q94Gm9upzL/7zW58mxOl/
         qnYqeF6Y4WoW9+zSqLOCPHl0u81BGKbnzgFABR8JItclj8ORvROq++x0QCkvrO0CnPyS
         1oh4DtDEg0+MzOwe1d+THqm2SFR6eOeRnJ301iDpVvJFiRGKKa8n1KZaiJ+smFg9DFfv
         gN5Lnq8kTIY3aOqg0gEX9w3iQXwJuEOEj2INaNlcwaBGhaKoTMgaKK6nzSCwnSZcdEWF
         y7lQ==
X-Gm-Message-State: AOJu0Yz7NOLLXfyG7YOsBYK1PKsp+GkUxTxTTz4XWob0mflTbj25ZrBY
	RVrAZ+998Wr6HaT739ip2oel6lVZLe3Jm7RjzCChTiW33WjDvjWQn6/Ib0pTL1+NY0AKq/KHkRu
	r
X-Gm-Gg: ASbGnct2rqNIS1zuw3eGLRxLA/21pn3T721DKgIZZgY3lKAXRQIcvCd9VnABccPrCoM
	hVO1l7PdbRDnfkCatB3FjIpYqww9kRqhOylA8NgZHiN11JdmhjQUDu6AvIqEU1NnKjHT8WRUekJ
	01zKkoJrQnG54fiTpjhMprK6xl0G/NL0rRlQt0oMJqj4rTEx/iD3S5MEos1nv6va6K8ROC1g5Ji
	UKKVNNRHD4ka0f3t4TPC1xh8UHvll3xMRHPwXBlzkNvKPTEMJQ9Vo+rNHL7lzOL+U3EjeYImkol
	GIxcsaKo6X51Wg3XHBPYg+tdS5OxT/j46XZ+A7XG+4+KTAq4NxEwwNSRqkyzOvGCLBtA5A==
X-Google-Smtp-Source: AGHT+IGOBPMcCXo0mikrdP+M8AIbCBhdbA3p4vhvoXZSLxFmi2Annv0/5xv2rpmZL8dTjWj2zxEMpA==
X-Received: by 2002:a17:907:3d90:b0:ac3:3fe7:b254 with SMTP id a640c23a62f3a-ac3b7c49fcdmr571771366b.4.1742466875667;
        Thu, 20 Mar 2025 03:34:35 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3e0e558d4sm52317666b.59.2025.03.20.03.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 03:34:35 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-multidict: Upgrade 6.1.0 -> 6.2.0
Date: Thu, 20 Mar 2025 12:34:31 +0200
Message-Id: <20250320103431.1764785-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 10:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116130

Upgrade to release 6.2.0:

- Fixed in checks throwing an exception instead of returning
  :data:`False` when testing non-strings.
- Fix a leak when the last accessed module in PyInit__multidict
  init is not released.
- Implemented support for the free-threaded build of CPython 3.13
- Started publishing wheels made for the free-threaded build of
  CPython 3.13
- Used stricter typing across the code base, resulting in improved
  typing accuracy across multidict classes. Funded by an NLnet grant.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-multidict_6.1.0.bb => python3-multidict_6.2.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.1.0.bb => python3-multidict_6.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
index ed49b8ff02..8b30574020 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
@@ -8,12 +8,13 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PV .= "+git"
 
-SRCREV = "4140e63780dc6dd600a1837cb9b4c5198c3dcd68"
+SRCREV = "af07d5b2b18bb30e041983db2bea1fcb3e1c4b79"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
 RDEPENDS:${PN}-ptest += " \
     python3-pytest-cov \
+    python3-pytest-codspeed \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


