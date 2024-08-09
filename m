Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44163C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.88295.1723221147786018303
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OVAh3Njf;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-368712acb8dso1301091f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221146; x=1723825946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gluzN/cTJyYHDHtW04Hxq33HyHceABm/rL+czDCVAs=;
        b=OVAh3NjfGgqh0oF4RJ7Zz9KT6R0yabF4xSOKFKGv1T6nYpJdo8fGhexQIg0pQbi7Ef
         Z5m7zzNqA7d5CStLR0qc8Tcyq6wZtUSWXKc1FZ5mHVFt+unddrL4Al/LcTNiPke0vMiv
         UkeCZ9TzVfrrn2su9E6ER4rtzSlEm7F/fSLYpARhn3YOfk1tx41zALlgHF9q4mZuWmOt
         hL7hh+usvLkBHpMHHJPymOf8Oxegywu3NlgY/47OuVT+oWPPsrbzHg/mve+SzCorJ8Wy
         cF9gLIierGKA0KEcLMxBItCBwoGAtgCiJq2vQvw88nE+YC5jO56LI4YQeUjVrnS3UKBN
         lOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221146; x=1723825946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/gluzN/cTJyYHDHtW04Hxq33HyHceABm/rL+czDCVAs=;
        b=dIIk7oPOnyjhE9Yjuo0w9wlnvqmlevE4opnFwDPw39sfVVM+uMeLetW1UqmXnVg9wv
         PI7vy2fNbCRaitpamyXz7P+boxeDhIiVcec+t8mBejchEAkS0st/gNctzXBubgYniv+R
         EKwwp6i2/4yp2MmJf+UXrUqTsTGxXc2PNwDuVhwyqN5cO2pPvW84DjlC1izI8JIG1RfP
         GS+xt6kaASwo73vRASice7LJ2W7nSXcevsvic70HJZA/3uRz0ZEuase35UkifvQl1aEq
         Q1f9kYU6uXO3OtyL70IHhLBUtoXZifPSl6QfdxIKYAq2trYHavZ3aNalpuIgjCJlQAqq
         btgQ==
X-Gm-Message-State: AOJu0YzMroT4dusW9F2F2ZPbMF+1jMd50dXJQKIbOqR5gT36UhxbNHYV
	PZSIKK3qFO8BYFlIhqiA4RkEcvSEmFQq5GT2TwD/XUhMsQkPdPTHtILhKTBC
X-Google-Smtp-Source: AGHT+IFdCnckp2fP2QEAPqG8hFektA4jDD2avyNCaAT6fszdD1TEkYeZOJiOJvGBr5Q4XGNg4pyh2A==
X-Received: by 2002:a5d:4204:0:b0:368:4b61:7197 with SMTP id ffacd0b85a97d-36d5e3d69d6mr1456202f8f.24.1723221145532;
        Fri, 09 Aug 2024 09:32:25 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:24 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 12/12] python3-gevent: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:31:01 +0300
Message-Id: <20240809163101.8416-12-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111723

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-gevent-24.2.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
index 806e09391..e44972178 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
@@ -4,7 +4,7 @@ a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
 LICENSE = "MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65"
-DEPENDS += "python3-greenlet libev libuv c-ares python3-cython-native"
+DEPENDS += "python3-greenlet-native python3-greenlet libev libuv python3-cython-native python3-cffi-native"
 
 RDEPENDS:${PN} = "python3-greenlet \
 		  python3-mime \
@@ -18,7 +18,7 @@ SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch \
 
 SRC_URI[sha256sum] = "432fc76f680acf7cf188c2ee0f5d3ab73b63c1f03114c7cd8a34cebbe5aa2056"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 # Don't embed libraries, link to the system provided libs instead
 export GEVENTSETUP_EMBED_CARES = "0"
-- 
2.25.1


