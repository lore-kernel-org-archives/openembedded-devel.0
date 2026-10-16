Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7FECCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 04:07:55 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14394.1792123673249282942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eXVsJOqs;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8246b13cbso44338735ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123672; x=1792728472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ev1Z07yrt5SrPEdbQ8xsJv8z32jQAnvxspHgYKT5Ieo=;
        b=eXVsJOqslvJIlgEcgnMyeZnhcIbYXkJ2S+HSxZtVvbDNvv23S98wkQMa/PDswMK65K
         OPh/Uexv7U4ykzaM2l5HXXPNHnq4u2wSykL0KwRbMk8WGZshcnA19JC6ovXl1wr81pkq
         ED+GeEvLVTXmsnr2N7xg3L+vmSNS9dZh3o9Ju1HS4Ib9mx5ebFHi+9fcs9shaoDPmQiS
         knoMll2soN8GbZ7VWmvbsZ1UU/WnEVo2IoTLO1Mvr27AmdnoYrGPjDbWMpNOD+Xtg0lN
         BsN+n4P+p6dtBw6516q5lyDHbk8w2U7CXqhSs/b6kQCgbCsatB2FPgsbpDjupXoAvnuj
         soAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123672; x=1792728472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ev1Z07yrt5SrPEdbQ8xsJv8z32jQAnvxspHgYKT5Ieo=;
        b=AC0+2ShAXT/QvVPzGZIGXhikE3Dd0egu+5DXoRt+FMx8qLGgalIs9u69hfjKLuFDmv
         ftVFRCTLmGZcD87lwkaDpG2KvoAo/Soym5RNYI2w7q7ZeN8GYQRbpTjdD1GNDiDtfIuq
         4qEYeCgthuGST3YB75a4xPqLyMvBwni1XQZJcSoRp+8iPR/NL7t8h/AQA4yhj0S/OisB
         c6LCfuVC8ZeQ+4wnZF+A3ExFDu0ToCOpZ2a7KLxf4cm5/YrhDDFxLUqgyg9dnAaLUc0t
         8R07VC6bYuKh4gAuQeKVovhgM9VlGgOs/CEbbu1J841a3+g6LC5HzF0F0doWTzrHT0tt
         6N7A==
X-Gm-Message-State: AFq9FYKZU3NKhg/2ErmZPP+SfCs3yUpsKpC+gICvrg7gATKIzwLYgLbU
	A7j8KZ3LBC4iiMl+BWdjh1yHMn1PbkBID73Koc7zmImceldxzdae50gyhlQT2Q==
X-Gm-Gg: AYBFou0MYxmLEzVQDlmoMkJEVr+Kx8kLkjf5Rct0pflyG+lRsIp0iKW5+S307ycdW9i
	hsPXLSSTInCYbLhpP7Oajt9416wECIxGC5VXbtgBTFlzp28TCVatSovJyBDnboKEip3wuA2+xD/
	D0v9Jphmq7Fq0mRp4ZOMudFETnYiIdpoajgRpQRJ4kJPpfVU57s+iAlgXWdUnXvnXrLwB0cD21v
	leGYAcd71AlcDbqN6IUTMBCmWx4N1IDOuSwsHNLljxU4lGvooxNe1HkIpeKNXwhppNXqhNek6GM
	ENK1zzy+k/6pdyptgd87AL66Z0qtKDgqestU5h1ebWIytQceH38cpIgORUIev+H1001vVUThOcr
	eoyZSNrJd0SO9LCtCUwXRYUJboTeI8aTn9qRUGJqpMxeqgiaeilCI9oGd09WDsyJHHNlr1GgxWv
	Nu8kybrrGxIWBbbmOkS5ZD7pFzB7qdHcQvDkv3VJA2Ew6IP7gXQhDQ3fbSaj1mfZRVrd/yWTvcm
	OwrWXz6NhbHD1oXQphM00zck1EBlHEafqUiiBs=
X-Received: by 2002:a17:903:1251:b0:2e9:7ff5:545a with SMTP id d9443c01a7336-2e97ff55a08mr12729205ad.32.1792123672410;
        Thu, 15 Oct 2026 21:07:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm3796335ad.35.2026.10.15.21.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:07:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 5/10] python3-charset-normalizer: upgrade 3.5.1 -> 3.5.2
Date: Fri, 16 Oct 2026 17:07:29 +1300
Message-ID: <20261016040734.1499287-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
References: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 04:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131041

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/jawah/charset_normalizer/releases/tag/3.5.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-normalizer_3.5.1.bb => python3-charset-normalizer_3.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.5.1.bb => python3-charset-normalizer_3.5.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.1.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.2.bb
index 3b56ad3860..1d02fd7fca 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.5.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
 SRC_URI += "file://0001-pyproject.toml-relax-setuptools-upper-bound.patch"
-SRC_URI[sha256sum] = "6117b84ea48435e5356dc737f5121485c30920ba43375fa7b434fd753df0eac3"
+SRC_URI[sha256sum] = "39de2a259fc954455c57274dc94c79d5842774e1247a016aff30bc0efed0f4ef"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
 

