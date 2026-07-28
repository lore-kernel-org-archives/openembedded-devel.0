Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EBFC54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:45:49 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9505.1785239147594835137
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 04:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=C8baW8sU;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4728c12ba97so2243273f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 04:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785239146; x=1785843946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxQM8bAhPX/tuODSbHRWKVcIAz5/v9rRUvWtESeF1g0=;
        b=C8baW8sU3+IyDF1iQEAmM9uAfgDZVfhwBCYJwpqNucyt8eOIqYpaU13M4OqW95lU9d
         mDteLCHNkSt0jyWxpwV3O5GIVQGS+EhpjAPTya+/WsyFexmETeFHVgmRSlGiwPEZvCnF
         SmM6HfFiILhybqPE4mGbEy9Np8coFpgNuzano=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239146; x=1785843946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxQM8bAhPX/tuODSbHRWKVcIAz5/v9rRUvWtESeF1g0=;
        b=VBfc3GDyFUgEUupwQs/UUNIIjlLGenm26BdcSLYFUyC6Tyj17HgdZp5VJtxDALMqY7
         bZCU1J2cd9yZ21mGYzti04bPu39feYCEunt8j7M9dOuuSeeANVy4KEJxOBiZtuRR9Jba
         6MRkFB8txTi0PUStgdHMVZvfGIu8ljfMHlIXzoYEqy4TDXKuD55494Zt/jNhU2cDKeTW
         kJSbDOnRSp+um/E79whsjMq6+/Ein4AUmNUu5priQaI/2wY7+13zkCnzjbrmMHQErPSm
         TwsK4xWqv0e0VfYXtmPzxNiNIiYQALPKLDVJ2IJN/84wfi+lCXqiUbQgFgXxuS5Ha9xF
         raeg==
X-Gm-Message-State: AOJu0YwObCf2VKSDUsoXfDE2yz7offPg4DPfw2I1cUO+G+w15vOY6pwI
	6bvdozzSK1o87FDh1IQnO3CXq0/ywI1Oulr2UZO4VszXtQhFGRAZWvhjD4YqfzA2U1qzwjT/VVi
	3FNWT
X-Gm-Gg: AR+sD12ONQnkb4wYSfDUcKCQDF+tUsUJ4hTWyvOncp0/YxUWSVrYbhPJl2v6xNa6FlU
	+3OROvLQTpiulqP/Wg86GB3mEYYR5CF/1og69Gx3pRCi/duIcqrMr+hgvfYLGhxFNjwJtsQ+4JI
	QfySYh9U/dTAngk/joEIQNWrA07fG5PJaEt3GQCEvZIuJe3mfJ/C+vcE1ymcb1aMwDasGB5enOZ
	S8fATn8Upz1wqf5qAKmU9Vmn6Y7C4jgrcTziRmvKsrleYkR6XntZrXviSxnXVNT3b5mjiFMUnGM
	D9oVGYa6X6R/tpF9SCMdavxDS/UGo+8Fp0Zjk52Rbd9QW5ScgpTIhPYkkjgL6GhD0TMWWtmlxM8
	iIvUMPa1SzwTZBsp3fNclOjwcHM7X+C2pK1bpFhWOLMpQ6IqHHAI07VbVNFYC5WEJmr5ta6IiFt
	10sPQXNiPY5dmxhhyq7JOGzbX00NoVwC5YjHwOrGQJVm85wCyhs6iVgteras92qW2wroKUR0y3T
	ez9VhfCLCslW7Vle8Wrur9WmM7r4GA=
X-Received: by 2002:a05:6000:1842:b0:47f:6742:170e with SMTP id ffacd0b85a97d-47fb1f27200mr2407289f8f.54.1785239145860;
        Tue, 28 Jul 2026 04:45:45 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f96b9abc0sm37021654f8f.32.2026.07.28.04.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:45:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-devtools: Add recipe
Date: Tue, 28 Jul 2026 14:45:31 +0300
Message-ID: <20260728114533.1775490-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728114533.1775490-1-leon.anavi@konsulko.com>
References: <20260728114533.1775490-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 11:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128510

Add a recipe for devtools, Python's missing debug print command and
more. Release 0.12.2:

- install debug into builtins via DebugProxy

From release 0.12.1:

- Fix docs publish.

From release 0.12.0:

- build docs on CI
- Update usage to reflect the recent addition of the pytest plugin
- Support dataclasses with slots

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-devtools_0.12.2.bb          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-devtools_0.12.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-devtools_0.12.2.bb b/meta-python/recipes-devtools/python/python3-devtools_0.12.2.bb
new file mode 100644
index 0000000000..25ea7cd11c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-devtools_0.12.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Python's missing debug print command, and more."
+DESCRIPTION = "Python's missing debug print command, and more."
+HOMEPAGE = "https://github.com/samuelcolvin/python-devtools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3c69d58fa5f4ff0b4244368d39546751"
+
+SRC_URI[sha256sum] = "efceab184cb35e3a11fa8e602cc4fadacaa2e859e920fc6f87bf130b69885507"
+
+inherit pypi python_hatchling ptest-python-pytest
+
+RDEPENDS:${PN}-ptest += "\
+    python3-core \
+    python3-executing \
+    python3-numpy \
+    python3-asttokens \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


