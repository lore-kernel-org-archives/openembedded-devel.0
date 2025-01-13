Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74FFE7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:49:46 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.17196.1736776183286125903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=l7OYYilc;
 spf=pass (domain: konsulko.com, ip: 209.85.218.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa68b513abcso778289166b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736776181; x=1737380981; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCaZc31HYqKLo4mvraNU/7SRXLOcGNYaAwEWD5flA3U=;
        b=l7OYYilcNhmDC0xSiLY5RI0nvMxKY9e+Nx96TiwChS1xpPbdFI99DsTI6BBqSqaCe7
         E7aiUIYOCjhjPzva5E/mNLic1DWcd8yy6V51ubV2LRxCcAFKp8Kgh6ywv/9Ve+qB8C+i
         fxM5C2itKovnZ1XEUhXcTaWsHmqNsDYAEAc5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736776181; x=1737380981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCaZc31HYqKLo4mvraNU/7SRXLOcGNYaAwEWD5flA3U=;
        b=uZWYxp/4qzZ4ua8u+toBP7jg1ebUQCtAzLpAC/csjaTk8nlxJOp46oRXA3ZCiXSCkP
         OeraURe12WdxkOE/6z4K1F9jqZMM34bvfZ0r0U5Hsp+Z0maxlbA0YVTUdKT2jFMfd96N
         qm3bLMo45KHt0jgW9ZGb0vbugFf1tUHpmXomZ49qOzNPlwj6f9VdsWePI+Mj61OxrNWR
         KAlYPKFIkeoas+SVUYus5qrrBsj1udEKAksJbDSJr59B25FIQSGlTRfOmeCrvG+WZMd/
         evoH9phP2Pr9CS3lwTrNDav8MZ7Ll5McK05jlcBx27UCKZscq+muYiq0I8J8eNb2V6hu
         17nw==
X-Gm-Message-State: AOJu0Yz9MsnPp3YjUvXjqsXzdRClyijyHO3g+BRc37arG+w3IRibxdO8
	5q2JTwHGFczI/sLNmaBZDQPQkKY+mFpBxOqytVs61eT9b531ymSnmhTyaUOzpbmTqxnR08GZ8pf
	R
X-Gm-Gg: ASbGncvgn47hs+8QTgmPc8o168vgISPh0nFPE4XePlxnWxs5tGRLVkfydd8rVH4UvZW
	rlzMBxHnTsD/H5xcuOFAKTX05/SZqFtn6LwUd8xWZrsPyGtxcCOxv09dCa8KQW4HjOSY5FkDHkh
	3mcQL7BnuabvJCJUwWPrK3eMSIpaFEDh2P2xfkJXOq16Oksuzgj9SSBmxMc6tw9Yi+LB5RhWPBs
	wndkxiXe5SHCvLmM2qVMGj40JtGUM8/eEbmldHRcIIF5KdU5B0uar21sssWeRnK/Ufjqvo=
X-Google-Smtp-Source: AGHT+IE+FddIorg7CB70hE42Wgp0XoTULxCGTdRfpA4N7Q4gTED/7yQfr64lzWQ5tNt9lkZ8ovEYkg==
X-Received: by 2002:a17:907:6ea6:b0:aaf:117d:4525 with SMTP id a640c23a62f3a-ab2ab6fda26mr2022454566b.16.1736776181509;
        Mon, 13 Jan 2025 05:49:41 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dad57sm509938366b.66.2025.01.13.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:49:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-bandit: Upgrade 1.8.0 -> 1.8.2
Date: Mon, 13 Jan 2025 15:49:35 +0200
Message-Id: <20250113134936.3594358-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113134936.3594358-1-leon.anavi@konsulko.com>
References: <20250113134936.3594358-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 13:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114835

Upgrade to release 1.8.2:

- Revert "Start testing with 3.14 alphas"
- Bump docker/build-push-action from 6.9.0 to 6.10.0
- Update the bug template with latest bandit version
- Add Mercedes-Benz to sponsor list
- Bump docker/setup-buildx-action from 3.7.1 to 3.8.0
- [pre-commit.ci] pre-commit autoupdate
- Remove lxml (B320 & B410) from blacklist
- Clarify "getting started" docs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-bandit_1.8.0.bb => python3-bandit_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.8.0.bb => python3-bandit_1.8.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.8.0.bb b/meta-python/recipes-devtools/python/python3-bandit_1.8.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.8.2.bb
index 147689309b..4c1ff88a87 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.8.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "b5bfe55a095abd9fe20099178a7c6c060f844bfd4fe4c76d28e35e4c52b9d31e"
+SRC_URI[sha256sum] = "e00ad5a6bc676c0954669fe13818024d66b70e42cf5adb971480cf3b671e835f"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.39.5


