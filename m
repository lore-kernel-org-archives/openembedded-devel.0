Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833DCC0218C
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 10:58:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.9327.1737716331448851206
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 02:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=epBcbzQ8;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso342106166b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 02:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737716330; x=1738321130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3JnWEfWmtFIvCZugAGkc6fKF8vwChO/Vi/lzZLxm0s=;
        b=epBcbzQ8S+MhYD2IspkPIqfkBi6FuVQxHbEgDs7L5JweXsbF4fcilQ0cPKfktUsiQm
         l1BZzaiPd4quywMK9QkUQSfjBNZciLF8si4u75Po4ppp5Oy/9Lv5gLc8u9DIBt8o8TtE
         yAU7Z/xAvC/dKiduvtJukeXs6qRt2qzYSxtWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716330; x=1738321130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3JnWEfWmtFIvCZugAGkc6fKF8vwChO/Vi/lzZLxm0s=;
        b=B2go5cKa4Bk+O4RSaK63Cavrhcxgdaq9vPwSAKmQuQ3Lta/yDuqBCuTz1BHA4AURDE
         HjmJ7cmfyO1vl+zWo6S23wyoa/YNkaoIwV4p/VB3WlySDeIx/aiHfpNXmy4236o2bQQZ
         RJ6EaloBOOCkOtSRJmvkr0PdkN6WYcHDV6iYtnpE5qvipGm15q+/Q9igYkOLd1lNXaUC
         kCsmC1Sw27XCBdevGCqq4Y2CVjrNz3qs/oKf0ushQ8VMsNy+M2rRFPRfUEFZEH31ZTxY
         7DDKoQIxQ4WFtUzF1MMIJMVaR9rwVPZB1KbV/kYK1JVeqDHULtwHLCEFwL5m04G/28nu
         TcKQ==
X-Gm-Message-State: AOJu0YwNgLgD8PpMLlXZNPZ3s1sssxWqe29z/0a5JqCPHAubZ4RBgT8f
	GCrpE1ZeEhtGOnWh9Kd3DmaRU8TWF6jRbU5JmQrTl3k7Ho0oBXDiv5S2QC+UktGO9fEs1XnEl7A
	i
X-Gm-Gg: ASbGncuY0kqEFVO3hyPGiZ0Qi62XEj6lXxGrDmT/Nq/cr7ty0iwd+ZCFpfy2mbAua72
	n/oqwles08urWfq1f/wD0qVN+kMtqfBzLH4ROUbQGwWq84/WedGro2h7LkyiqxcutfydOyzOUOH
	MbHzGtkqNkrX0R+IKI1DcRbL+UQHFCmj+IZaEppIXSrmGVWobjqc9BR0umrFPl4MO7PILuod20G
	OYm3mV/A5qC7g6oHV5mKqhknWf1IuvQpfFoBW75i3WL2JQBVt2n4gB3yYn+QRbg7wvclFHgRsiL
	p2j/VCBUqHSYZr74n3ZORQKShSXmAg==
X-Google-Smtp-Source: AGHT+IH9pbiHUs3GVGkO2rDRslnRxJudjY6jwr8VKUk1WAqY+4tMs7VDSw7Ar5jjl3uEUFZDwoCn2A==
X-Received: by 2002:a17:907:3f23:b0:aae:e784:55c5 with SMTP id a640c23a62f3a-ab38b2a3eb9mr2603231866b.33.1737716329581;
        Fri, 24 Jan 2025 02:58:49 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676117260sm107842766b.185.2025.01.24.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:58:49 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-hyperframe: Upgrade 6.0.1 -> 6.1.0
Date: Fri, 24 Jan 2025 12:58:43 +0200
Message-Id: <20250124105843.2035512-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250124105843.2035512-1-leon.anavi@konsulko.com>
References: <20250124105843.2035512-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 10:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115056

Upgrade to release 6.1.0:

API Changes (Backward Incompatible)

- Support for Python 3.6 has been removed.
- Support for Python 3.7 has been removed.
- Support for Python 3.8 has been removed.

API Changes (Backward Compatible)

- Support for Python 3.10 has been added.
- Support for Python 3.11 has been added.
- Support for Python 3.12 has been added.
- Support for Python 3.13 has been added.
- Updated packaging and testing infrastructure.
- Code cleanup and linting.
- Improved type hints.

Fixes:
WARNING: python3-hyperframe-6.1.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-hyperframe_6.0.1.bb => python3-hyperframe_6.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-hyperframe/{python3-hyperframe_6.0.1.bb => python3-hyperframe_6.1.0.bb} (60%)

diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.1.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.1.0.bb
similarity index 60%
rename from meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.1.bb
rename to meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.1.0.bb
index 2d46e96112..0d4bfcc584 100644
--- a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.1.bb
+++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.1.0.bb
@@ -4,6 +4,6 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
 
-SRC_URI[sha256sum] = "ae510046231dc8e9ecb1a6586f63d2347bf4c8905914aa84ba585ae85f28a914"
+SRC_URI[sha256sum] = "f630908a00854a7adeabd6382b43923a4c4cd4b821fcb527e6ab9e15382a3b08"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
-- 
2.39.5


