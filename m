Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE3FC52D7D
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 11:54:50 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.96161.1723636480369818441
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 04:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gX0rWq8G;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3685b3dbcdcso3939869f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 04:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723636478; x=1724241278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjENT9EfAHwAvzNDyI4ba4OFZvtIQrGGTn6lG/HlQRk=;
        b=gX0rWq8Gqr226mbASg8MARFJXmPmX09nUCAl7tH56AzZW0F9gM+b3JtZu5tQJ8/z/g
         rN/bySaeuPU+jAK/PAY1WWmPGwhoPloyCC+fg3CpKgpfmeb2Urh3ww3dFSwKhyZdZokv
         zir+RZEr0zyVnahnXZdr7dvVPPaek8AG8OIJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636478; x=1724241278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjENT9EfAHwAvzNDyI4ba4OFZvtIQrGGTn6lG/HlQRk=;
        b=Wjnf1r2sZCVtBN3bbAv2Gx+CoeMM9VS/psojn6DYbnR4U77waZrO6rpKW7kgwgpOgL
         3+aXBceIhPv8Qa6+clO4Obb4nHM0dX0Vq7ZZxz0bwDZ5VogB882GF0nWE81Z+QCybBws
         YHjFW75/tP2PXiKCswacTl5psmAKNzvp95Jf2DZRJYFOjOgJExfI2X0yMiSnlXrH1VUO
         p33UDVwyMnmIyz2NIoyk72vMUuE6aoJ8el2L9neaHRPTrWGEB/YRhuF/fOziWEpIm5z2
         FHn0VTWuVJFpZNmkqEPbpo3AKVuEz+2jLtPWNA2rb9GfN9g53j9YhXnW31FEba06YGa3
         +2gQ==
X-Gm-Message-State: AOJu0Yzah1GOqc2jJg5sG2jrFQc2q0ya/ybqEgVJVvUb9PiIxXXxdM7x
	s3yjbCoVe+eU1iXodkeqmVD3QqTUULYsRLurS/E1EBBpfn7jxIDqcr/PHSI+4yRJAaQUS2B04sH
	P
X-Google-Smtp-Source: AGHT+IE/2sJfuS0JWrAaWCPT+WqU5B958wJv5ldE2oEWdRADrbYkAlERPj4V7m7AboB8zf9vfi53HQ==
X-Received: by 2002:adf:fd08:0:b0:367:9614:fb99 with SMTP id ffacd0b85a97d-37177756e49mr2031605f8f.10.1723636478434;
        Wed, 14 Aug 2024 04:54:38 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4cfeeb09sm12700620f8f.51.2024.08.14.04.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 04:54:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-soupsieve: Upgrade 2.5 -> 2.6
Date: Wed, 14 Aug 2024 14:54:34 +0300
Message-Id: <20240814115435.808089-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240814115435.808089-1-leon.anavi@konsulko.com>
References: <20240814115435.808089-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 11:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111802

Upgrade to release 2.6:

- Add official support for Python 3.13.
- Add support for & as scoping root per the CSS Nesting Module,
  Level 1. When & is used outside the context of nesting, it is
  treated as the scoping root (equivalent to :scope).
- Improve error message when an unrecognized pseudo-class is used.

License-Update: Update years.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-soupsieve_2.5.bb => python3-soupsieve_2.6.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.5.bb => python3-soupsieve_2.6.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
index d26a13dfb..6572a6845 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.6.bb
@@ -2,15 +2,20 @@ SUMMARY = "CSS selector library for python-beautifulsoup4"
 HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=520586fa71ed2cbda50b4a8c89621e09"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bdfa4c8e8b6830bcf8e78cba1669e4d"
 
-SRC_URI[sha256sum] = "5663d5a7b3bfaeee0bc4372e7fc48f9cff4940b3eec54a6451cc5299f1097690"
+SRC_URI[sha256sum] = "e2e68417777af359ec65daac1057404a3c8a5455bb8abc36f1a9866ab1a51abb"
 
 inherit pypi python_hatchling python_setuptools_build_meta ptest
 
 SRC_URI += " \
         file://run-ptest \
 "
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-datetime \
+    python3-beautifulsoup4 \
+"
 
 RDEPENDS:${PN}-ptest += " \
     python3-beautifulsoup4 \
-- 
2.39.2


