Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D540C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 10:10:02 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.37000.1753092592945111965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 03:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q4D+TAfY;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so7923140a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1753092591; x=1753697391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T67M1SZDX3Swyy5brRdrWESnZ6YMblxSy6foRvLyYtI=;
        b=q4D+TAfYYHWcWhEL/MzLgDBrFD2PXz4KTGXr/8E/LYkg3XVGUPVGRZQ6+rlD1mOcqI
         EEWGow+SwnyCspnUnHP8XLc8OgGo+4TYR6jRRvc9d4KO91a4gda3HbdAsQZ9but2MAlC
         ICOWWEnPtMU6WaEXPcwxdH/ozBgWMDz63mK+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753092591; x=1753697391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T67M1SZDX3Swyy5brRdrWESnZ6YMblxSy6foRvLyYtI=;
        b=UsHCCEaXtLUOngWEVKI3DjNzuF86i7EQEPkv8ncbQ04hkIaswjgPVKZQYdhLT91D7P
         e9Gy2ia6eW3URzLxAZRQKEB/NLm0GxEaec8Vvc4p4DCAYmX6nA+4K9Il6jN+PTG0ove0
         RnXA1yXxXUJJQkIXMNGxJzDUZjZz7hBFp6zxEQUHV+OAOIBzyohgOsUotvVtFeE2s7KZ
         45DOrHm5DrbKZ3B4rMyLf3X0z7sHijg+RTRreylaNUCRboqwY7WgCXaLS860kK6wRroy
         BzSrVdttseg/mAO13N6ETDGTkn0qvr3QvzGAr17Aqt+5i8eF1yyY8kZfDduNmlYBrLNs
         uyHw==
X-Gm-Message-State: AOJu0YxZKvGIi139uOKtAEHxAgG2vQwSVqGI6VM9nd8kYVH05ESz3gDk
	c10NdqBHmqx/sKHBlC6IKNoZ96Tghh9iIQlonVP7pLw7OZzszdzl7zxhW2Hhm/NsPrA5qwdmd7D
	41744
X-Gm-Gg: ASbGncvy6qD6MvxdU7IS6utbE7yadtJpbLsk2k9OQkt0ie4zwU0ONF/vfesL0B9PykV
	Gg6eklb0buAJh3e4MgwfliScIq/+dEWnmLQaAiLPdSJeCakqruG4cbwOi7QbxoNParXHw5g6p29
	unsURzgMYl7mAth4olMixkg9q6xpJv6KlEEZ93H5m//DUWfDLYXWCdZ45HIk+nQHyYPRWFwrILz
	go7MTikSHmyYDal7MITAVBeUre/l5KgRKDYPc9j6JJq6KPUU7nAZx0vz99vGvDHGXNz7Cy9cjnt
	BMkauQZG7jeAL72fLsjzzsyv6RbCdOgixyArGjnYGhYf2FP1FBFh/bDgAJ2Vjhv7x2AeZnKoD6u
	CLIxaqfyzbpU5C4agsj/tv5M6rjRaK+HG0v0M
X-Google-Smtp-Source: AGHT+IHJ+FTVmux4dl4OH2ZLB6CoXUp0sz+D3V9mht2fg8ysVCbhTZObikb9ETC15Lmno07XZYuALQ==
X-Received: by 2002:a05:6402:51ca:b0:612:b572:7079 with SMTP id 4fb4d7f45d1cf-612b57288aemr13328440a12.9.1753092590868;
        Mon, 21 Jul 2025 03:09:50 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c903fbecsm5238184a12.42.2025.07.21.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:09:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-vector: Upgrade 1.6.2 -> 1.6.3
Date: Mon, 21 Jul 2025 13:09:46 +0300
Message-Id: <20250721100947.1181063-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721100947.1181063-1-leon.anavi@konsulko.com>
References: <20250721100947.1181063-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 10:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118657

Upgrade to release 1.6.3:

- feat: numba is now available on python 3.13
- fix: upper pin 3.14 for numba
- fix: uniform type checks in constructors + more tests
- fix: replace nan_to_num with where for CuPy
- docs: update CITATION.cff and add JOSS badge
- docs: move and update contributing guide
- docs: fix rendering of awkward reprs
- docs: update papers and citation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-vector_1.6.2.bb => python3-vector_1.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-vector_1.6.2.bb => python3-vector_1.6.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-vector_1.6.2.bb b/meta-python/recipes-devtools/python/python3-vector_1.6.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-vector_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-vector_1.6.3.bb
index 9452a838b3..912dfb8b85 100644
--- a/meta-python/recipes-devtools/python/python3-vector_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-vector_1.6.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2963f0dc7a24919505850460dd1a785b"
 
 DEPENDS += "python3-hatch-vcs-native"
 
-SRC_URI[sha256sum] = "6e59d9db8b615016fa542a2e8150d0c819046fe6940badd267811a454a7f0eca"
+SRC_URI[sha256sum] = "a85149a62fcaa8a4d95214ca217f3910ea6800d79d65ef1cfb1005720b4f713a"
 
 inherit pypi python_hatchling
 
-- 
2.39.5


