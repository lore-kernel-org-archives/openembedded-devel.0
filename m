Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10831C624D4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:21:24 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3582.1788427276948961727
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sECcVDWF;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso31237395e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788427275; x=1789032075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=js2S+5WH5iUnuTtt2FI3u/L+7g/akCah7oGg7qx43E8=;
        b=sECcVDWFnp7GGIbamHgtXbyRzhzLTtKKwktRWuX1nKcRG0hL1vzwAiWFA3pe6b3T50
         +e4CgrttVUpVMHjkisgF72P4QLBB4GwGEtO/z7097yRRH0Ne6b62X36n6jdbRv+JQ9XB
         niCHRQw9VEHybu42DFUOoLJr1Hwpgp7LW1NFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427275; x=1789032075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=js2S+5WH5iUnuTtt2FI3u/L+7g/akCah7oGg7qx43E8=;
        b=oVtRJn6b0Iw4m0Adleu+QzPJfYgpTS8FLZa9RvTsG4uwag5YQEfQj1pmG99wUAcApP
         H7HcWRYATZxjbrb3iSELbDtTeF6jmj2GIZ5LnQqskyZ4Ald2FTxC3d3bvoHjNXothMdz
         LocbMz8sHa6sONxTAwzR2xN12DAaFU01wh+jdPTZm+IMflTjLsmYQU7qn/gyu3yW84KW
         fKH9zg1z73xuKfLe2/ygArqLM0t6r+ibFJ2Nt/NoBVzmyF+H6WyaGeU/hTx8ZEtlOt7W
         9MO/o/17T/7XAyT6EUYHtohtNLhn2Lyw3DuIYjffzZqRdd5/BNdfe3luTQd76p28tgU+
         13lg==
X-Gm-Message-State: AFuF++mSP/jVw0io0H3s4ZeUYTqryNbYy4oJ9LNGfBomwbc/pz8hNl4+
	/7oKBFx6NfIhv65fZXfmnRPKF2kSPR+hV6xBDgKSNe3GMwEGodMTcMMpdXxGd4moRZB2a7yd4MK
	1vO9a
X-Gm-Gg: AYBFou01kN2eSzUMhpFSVB+jR8L/1/Y1NUhGpKDoBzY7t2fYsfWMTJacW8XJ/j8XBBW
	kgsrW0gr023/zjxtIejnwAaoyaYqtikLQIe3Jdk3ttxUXSZmUg76lJQHhmJvRgSsfeVQMdgHReg
	pFia0XcxH/VbgUH296IXt91lDyTB6NS/jwvtTmYEdtJiLbS39ED6aywDCKqFHAG8/NMnTC4hxz4
	lZOOzO5Jl6Qp5gPUR9JOMR8KAFz1ZXJpefs3ivCgxLTuXCX2ZIyhNxkNnnlDfTpfSSn66tFw3Z9
	VGIh9n22oogS5ufvv5kcNGuFTD5PlgZDGDZlPkQCeO6bVMvMxyW5EGL3Hv9hFWSKLGX0IpWOeFY
	18dmujs5ETRBFXuj3o/2iPTeuONvRNNcWr0IZc6HrJ3Ri0R+MZHE7UMlsk6OlVORL7awNneMbbL
	2FXeHYmzbCwabtsk3Yb6IpJ/GmgHkip4vTtLX+NAR/LywmD/1587H7UtrXUdhKRXX3QVgMkIt1w
	dkAvp4S9XOlkhhDWgCPCfOVVPxUWebmZdtpMqk1r5P+TZdh6pMrwrIrUYAO5ojBugjfneRo4ye6
	aqNUdMgCnIcN0y7NGTaGOCiN
X-Received: by 2002:a05:600c:c16d:b0:49b:47b3:d6d with SMTP id 5b1f17b1804b1-49ce5842737mr217643355e9.10.1788427274440;
        Thu, 03 Sep 2026 02:21:14 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d2019sm55305085e9.2.2026.09.03.02.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:21:13 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-nocasedict: Upgrade 2.2.0 -> 2.2.1
Date: Thu,  3 Sep 2026 12:21:09 +0300
Message-ID: <20260903092109.1641069-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903092109.1641069-1-leon.anavi@konsulko.com>
References: <20260903092109.1641069-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129716

Upgrade to release 2.2.1:

- Fixed safety issues up to 2026-08-23.
- Development: Tolerate premature deletion of local release/start
  branches.
- Docs: Migrated from our own support for generating summary tables
  in the documentation to using autodocsumm to fix an import error
  with Sphinx 9.
- Development: Added a GitHub Actions workflow named 'backport'
  that creates a backport PR to the latest stable branch stable_M.N
  when a PR labeled with the 'backport' label is merged.
- Development: Upgraded GitHub Actions plugins to versions that use
  node.js 24.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-nocasedict_2.2.0.bb => python3-nocasedict_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_2.2.0.bb => python3-nocasedict_2.2.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_2.2.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_2.2.1.bb
index 54514a3f83..027b61c8b3 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "6f2b608602b0568cd06ff46e2a0f231d2a0c247d6dc120672c381cb29169e1e7"
+SRC_URI[sha256sum] = "ebe159ca847304949120650aabef6698ff26c4528c55760487759283632ce7e8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


