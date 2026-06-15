Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5364CD98CF
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 15:13:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.131866.1781536404975251896
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 08:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ohLTTXtz;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso45205045e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781536403; x=1782141203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36GCoJnDOC3ShMwA+Ic/9XU9g8fllG0KIJTYXLbyhxk=;
        b=ohLTTXtzTMvSCaznHTiHb1O8tn9LR93EQpfGufY5HJ6oCbzkcJhiheA451fFO2Eanq
         1ZOqrqdzoeGRVhrd41sczl2woNShsw/Ysb5V4Zb9xvy8oRtpd+s+REOkIRxM3E4gUvLF
         XgNVJ0iSDAfdG25eX/uKf8HI7VwSbjZLNrUbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536403; x=1782141203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=36GCoJnDOC3ShMwA+Ic/9XU9g8fllG0KIJTYXLbyhxk=;
        b=TA3yiZUNT4hvI50r3Pndh1P/dis3QJ25NmJ1orSeYpSTm/QKqpiPvMCZfViWwFxJuO
         Y9hW9d6XW2jv8Qak797uAXXs97e5K9glOrfFHEKrzCfNq0CTgNqnml2rb4AzSOAesXvp
         GUYDCkGRmhrxzS6FTVT5ScOavhbnts8S8ZhA0gdP5MaICMRWfak5fRpcL3M20JXyF0rQ
         w0VJg/b70j4+7hG3Buegkq2Sz7uZ4EFxD36hPZa2Gpra5H7pdATzODXnjBgFP28bLzfQ
         Q3/DRRwNd4zJrXJmsuq+OOD5aCbzDh7BtdaZy6CkYIde4Y17B4W7qG3JWu+1KQj8nmzx
         Ud2w==
X-Gm-Message-State: AOJu0YyZlNO3ipLMJ4cAc3dg1GGqw5RQNNnkIJ4o1wi3xMDx/nKeRkmQ
	5ejfDHsgmuj23xiJrpTUoPpwkJI1tZhXPM0BXrcZIS6BkvOlN//erJtIUXmZ1/QbnmWrWeMVFFx
	Hp2od
X-Gm-Gg: Acq92OFl/bPaAvpzh3aslb70W7K6GYX/mJKYB9mVQ25KX4QiXnC425agKYCXAgGgHPX
	bnwsRIkgslSE0eiXFcxkjgBbhH5UUivuMOsQnSvkWHijya/GYnPgYDKntm+v9h+Xp9PSqJyAFbl
	+NLO5YTCFPTVA/4k8aXiSfDi6ZEU51VUTYIymF7QfV9YrIfo3s+660gRCoe3nG8olnyI+2MtqU4
	N5b5zLVVk/ztn+7mkyK5gQhpkjBoyTNElPbEhBtA3dStXfjs6L/zhhNZpG7vUgLKsJHcfJHIx0s
	V4mW9fQ5HEsCV+V4ZTAl17dRddRRp+e7G+W4grDkFCCUIDzDnrYRYumVz5NnO3woSHYg++jKCv6
	VwnbIjBComA+SqOwwK4U2y7Bx2HM+tyXz6cDqygmqEihpXOJp+1fD1T3ee17q9oOfBqIHHyje23
	pDu/8j5ZPEieIFEXOkPO3EmrENNOK8lreqMBso
X-Received: by 2002:a05:600c:8b16:b0:490:ab8b:1bb3 with SMTP id 5b1f17b1804b1-492200db664mr145636035e9.18.1781536403116;
        Mon, 15 Jun 2026 08:13:23 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4b2e8esm219066395e9.0.2026.06.15.08.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:13:22 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-cachetools: Upgrade 7.0.4 -> 7.1.4
Date: Mon, 15 Jun 2026 18:13:15 +0300
Message-ID: <20260615151316.3273340-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615151316.3273340-1-leon.anavi@konsulko.com>
References: <20260615151316.3273340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 15:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127589

Upgrade to release 7.1.4:

- Minor unit test improvements.
- Update build environment.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-cachetools_7.0.4.bb => python3-cachetools_7.1.4.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_7.0.4.bb => python3-cachetools_7.1.4.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_7.0.4.bb b/meta-python/recipes-devtools/python/python3-cachetools_7.1.4.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-cachetools_7.0.4.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_7.1.4.bb
index f6d9d80454..b8aa53b67d 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_7.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_7.1.4.bb
@@ -10,10 +10,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=079933dfba36eb60b5e3512ca0ab61ae"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += " \
+	python3-setuptools-scm-native \
+"
+
 RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "7042c0e4eea87812f04744ce6ee9ed3de457875eb1f82d8a206c46d6e48b6734"
+SRC_URI[sha256sum] = "437f55a4e0c1b01a4f3077cc470e6991d47430970e36fbcb77e2be0df4fc1cd6"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


