Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C15CCFA0F
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 23:32:42 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.30764.1727307160084896527
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 16:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZwZQfnmX;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7198cb6bb02so299478b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 16:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727307159; x=1727911959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFbFAakj5sH+nyCkWlvVhM9Mk7A920FaTYa4vCLLSE8=;
        b=ZwZQfnmXm8v/qcz8t/ax7gqdiYYI7AnUImF3OTugux1BL9XuL9oaYUYDuTLUAH6RGx
         s7Ze8UASfu+0Hupa1sW9VeafRJvOq2ZYxNyfRzy+T+cTAcUpKWWCnWzxJxiDCEmQaJYE
         /5nCHi4efxVatf6BWto7XV+BlkkHwqfMTqtP/8FTvQvvtnWG288sC6B7go0n6o+YkU9X
         mA/ovfy98WXzxzMXb1BnaF5fupjcIB9K8qlIpFwfClpFVfF7cGZncmdJRoPJqLvpQ/oU
         ip6ij5T9LOBQjxOzHemF8fywgJ9o3OBb0nMr2Iu0gHKl+ukHPNBJur8SPyK/gqNuuQ46
         rrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307159; x=1727911959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFbFAakj5sH+nyCkWlvVhM9Mk7A920FaTYa4vCLLSE8=;
        b=iS+wlf5PYCMW3gx6aVBRgNDRJNZuUjbIwastUPMIiMtKYgacSpl98hm9dysJJzsFYg
         H6XIW54lTl1Y5MvSniRv2SPoGPzsYDtS+uMF49Lp/EiHzyq1HUtVYm9NODQcYq5FvqRa
         oeki0im3bdMApr2exSx9aR7sl7CDRjiFtK+jAmBkf+PnVpJpoe3Ov7bBJRQ7MOOQkO81
         2w7H/i9393jg8Ek2v4oyLlTCmNV5HH8VYtilmm1bU+LwhcCwdPQWYpAN18DIj/560Eqc
         iq5qCohcrfAFm8hlhJ3wHbNGf4XWwPsftzs0vTPIMn9PECYFuTM3HpfbDn+uB4aK+foJ
         Et6Q==
X-Gm-Message-State: AOJu0Yz9A4HjMlG5A8Cn5PqKfAwnf4iTZkc2+xYtPV5uEIwUVxY6Mx6i
	RB2PN59qerdKCaitj4I9OFzqvxIELPsuGb3oTSa43yZgWULjzH11YPV2x6pQ
X-Google-Smtp-Source: AGHT+IGKEAZjLqAAKXWwBtZwK5JkgN6M6JEe2skIQxeW5GMzotcN26bdxL8Qy5zafeu64yQuNPOvqw==
X-Received: by 2002:a05:6a00:4b52:b0:717:85a0:1ddb with SMTP id d2e1a72fcca58-71b0aaaff6fmr5836200b3a.10.1727307159145;
        Wed, 25 Sep 2024 16:32:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::eea4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc939046sm3243550b3a.107.2024.09.25.16.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:32:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/5] python3-eth-hash: Add packageconfigs and switch to pep517-backend
Date: Wed, 25 Sep 2024 16:32:33 -0700
Message-ID: <20240925233234.1685606-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925233234.1685606-1-raj.khem@gmail.com>
References: <20240925233234.1685606-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 23:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112505

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-eth-hash_0.7.0.bb          | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
index 0f548cf86f..1137e744cf 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.7.0.bb
@@ -1,14 +1,20 @@
-SUMMARY = "The Ethereum hashing function, keccak256, sometimes (erroneously) called sha3."
+SUMMARY = "eth-hash: The Ethereum hashing function, keccak256, sometimes (erroneously) called sha3"
 HOMEPAGE = "https://github.com/ethereum/eth-hash"
-SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
 SRC_URI[sha256sum] = "bacdc705bfd85dadd055ecd35fd1b4f846b671add101427e089a4ca2e8db310a"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-RDEPENDS:${PN} = "\
-	python3-logging \
-	python3-pycryptodome \
-"
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[dev] = ",,,python3-build python3-bumpversion python3-ipython python3-pre-commit python3-pytest python3-pytest-xdist python3-sphinx python3-sphinx_rtd_theme python3-towncrier python3-tox python3-twine python3-wheel"
+PACKAGECONFIG[docs] = ",,,python3-sphinx python3-sphinx_rtd_theme python3-towncrier"
+PACKAGECONFIG[pycryptodome] = ",,,python3-pycryptodome"
+PACKAGECONFIG[pysha3python-version-smaller-3-dot-9] = ",,,python3-pysha3"
+PACKAGECONFIG[pysha3python-version-bigger--equals-3-dot-9] = ",,,python3-safe-pysha3"
+PACKAGECONFIG[test] = ",,,python3-pytest python3-pytest-xdist"
+
+RDEPENDS:${PN} += "python3-core python3-logging python3-pycryptodome"
+
+PYPI_PACKAGE = "eth-hash"

