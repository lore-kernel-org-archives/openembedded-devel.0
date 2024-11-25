Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33EED58D46
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 13:32:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.18532.1732541532860334551
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 05:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=IGdL5F9m;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-382442b7d9aso3407718f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 05:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732541531; x=1733146331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v20TG2EPBdPutDhZatrL1c5NGSZhVpDfHvMWsssF6U0=;
        b=IGdL5F9mc3jk/K7MMFNJva9RPxBrzTrDoUotAJz4RAMGuN5Xw4C1qIIFyRNnnlVo0i
         WjCuBS7vLheN6RTPsEeXY19mvcwblc0XgemT8qF6vjzm7q7Q5NVz+UFPGIGIhTzVtvaE
         H0dIHoagWO0DRSMVsMNWvfwz2J8mRBrODik7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541531; x=1733146331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v20TG2EPBdPutDhZatrL1c5NGSZhVpDfHvMWsssF6U0=;
        b=XKDkKlitH1BPmuK5hjR/pMG10UyhF+ljCXij5x0FtxG870J9KXWxhH04VJbihM++jN
         Cbdc3fEmrW3mJQsFj4OMBRugK9EpF5/eZbCmPehKbE0AvWlpGXzts6JFSKQeWIr4hR1N
         l1GGmD2UTZ0Way5Ysi9HKujpR5LPelPeG2uGfrJF+HExRXqUfIsO7vGUkj0XBI9c2WDm
         g+6he3eAbxS2ehXQXAQ0JPbKMp5himjelF9g8/gssOUZnBKu9bmbiYy+UTLlT225r4oJ
         qJ9FL94LPcyrLBJ9XAsgAumXkJl/YgotwfN3+dw1wTX0GgraL4iDRfy5KFkVsCML6Qby
         l0vA==
X-Gm-Message-State: AOJu0YxxAhARXGOGxguQlVfHZXgieADt7TgmVnOa9RcmBnepigofgesT
	50ZPfipQ2NPlDkgtT/wWZ/iakQfxz5IjiTCYXkr9eO/BIwMSOh0lkZQ/D65U7tmwUPBfapRfUfE
	V
X-Gm-Gg: ASbGncskagYJW8pNwv/dVudO1CaeA/8fH4y4VUMX9hJ7zhjy9vuLtrOkzyiWwFaYCIK
	0hUzttdOiFd0U9icHQ9bwS9wKuKeuAtMaAlBIa6LIUL1tU+3pRG4EGnuKnNZbOgGt8jD1F0zQL7
	UahntxfhXqaRi3zTSxmDddWXgxCDYsHPZ1oUUku4RWFVQBmktr/Hgpc+/YDbZkfqHDk24PPRTFh
	kH4F6d56/0/qbNG5wwPyIyC25WSIxlxjKPVGeVs5tVMFvfMhi4tFrOvMvzdB4xf
X-Google-Smtp-Source: AGHT+IFNqazgWeuz3uX0lsdn/K4QzuT++OTu1EYBBkZIUEe2ZZug8oIk+6sqbcVdNl1EWY1GC3zIxA==
X-Received: by 2002:a05:6000:2807:b0:382:372a:572d with SMTP id ffacd0b85a97d-38260b71395mr7418160f8f.27.1732541531058;
        Mon, 25 Nov 2024 05:32:11 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad60e5sm10741023f8f.3.2024.11.25.05.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 05:32:10 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-zeroconf: Upgrade 0.136.0 -> 0.136.2
Date: Mon, 25 Nov 2024 15:32:01 +0200
Message-Id: <20241125133204.31594-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125133204.31594-1-leon.anavi@konsulko.com>
References: <20241125133204.31594-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 13:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114034

Upgrade to release 0.136.2:

- fix: retrigger release from failed github workflow
- fix(ci): run release workflow only on main repository
- fix(docs): update python to 3.8

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-zeroconf_0.136.0.bb => python3-zeroconf_0.136.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.136.0.bb => python3-zeroconf_0.136.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.136.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.136.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.136.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.136.2.bb
index 7173149a4f..43c3276e70 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.136.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.136.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=e77986dc8e2ee22d44a7c863e96852ae"
 
-SRC_URI[sha256sum] = "7a82c7bd0327266ef9f04a5272b0bb79812ddcefccf944320b5f3519586bbc82"
+SRC_URI[sha256sum] = "37d223febad4569f0d14563eb8e80a9742be35d0419847b45d84c37fc4224bb4"
 
 inherit pypi python_poetry_core cython
 
-- 
2.39.5


