Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C2CC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 00:51:15 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.24910.1647823874228084396
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ob0H6bAi;
 spf=pass (domain: konsulko.com, ip: 209.85.219.42,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f42.google.com with SMTP id kl29so4206424qvb.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ES5heCFolnL5/X6ENzxuSiW7Qn/Gx9HdeWZlxVDwzY0=;
        b=Ob0H6bAiqeLI4z6jYROedwYwhHfAo9JEqpYMnP1hUCjwZl+4zzbp72i8Uf+YkAnfpZ
         WNN8XPI0moZWFWzbDnhZVOGFhXWPsa/fJVQ4y2AukYX5DKbQmApgTTmPaCO4XPQr59Ve
         3ZN3KN3RtCVl10ICiejf7EbP+gZw/VlsKC0t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ES5heCFolnL5/X6ENzxuSiW7Qn/Gx9HdeWZlxVDwzY0=;
        b=8N9+JPPT9Z9P3VvCRz5O8cQHXl309732PKYvEtaH1v+Ise3K3KkLNX0RE89ccDzqkB
         Jz7svZDKUlxqd/snTNaVOOqr4soJaDZAOzj53b4oceMVyZa1KF6oqrr4Usm0rtKqgDvz
         ILhXOWxp4OenErC6MCNvYTFhiZ3alWfLWzcikeZ/HhSFRy/1Mz/kS/e/CK/Gj8Fk+Brk
         x1DNH2NQ1wBAA74R23QcQrNPZUfse83Nor4diL7d38O3uL7QlNw4UfrWgqQ21ytmCIsN
         ZZQvzxwP/RuqSWb9LRlHDIb7m4HAL/D+GwXOaVJlzce/atQvNBJJk6f+IUswZ8KzXt9p
         7TWg==
X-Gm-Message-State: AOAM533c6V/MTSBWPJ5Cg/7Ts91TUeGeAvJIuF2ZSiF+k4XsvE3/332i
	fPhnYneLA3wDnfTN5gxOlTJOHsvokQs/lg==
X-Google-Smtp-Source: 
 ABdhPJxzGX4oQkP/8hKyEahxFl1Lks2CRvA43qucyf74xQgNVbCI82smRCR/7GsNlDnYimlhHVI7Wg==
X-Received: by 2002:a05:6214:cac:b0:441:672:cce8 with SMTP id
 s12-20020a0562140cac00b004410672cce8mr8449502qvs.64.1647823872850;
        Sun, 20 Mar 2022 17:51:12 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm10493790qtx.15.2022.03.20.17.51.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 17:51:12 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/8] python3-requests: Remove
Date: Sun, 20 Mar 2022 20:50:41 -0400
Message-Id: 
 <75c50d42531d20ccbf083c4002540e221779ef52.1647823458.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647823458.git.scott.murray@konsulko.com>
References: <cover.1647823458.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 00:51:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96098

This recipe has been moved to oe-core.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-requests_2.27.1.bb         | 25 -------------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-requests_2.27.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 1f78c7dc9..260687aa5 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -354,7 +354,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-rdflib \
     python3-redis \
     python3-regex \
-    python3-requests \
     python3-requests-file \
     python3-requests-ftp \
     python3-requests-futures \
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.27.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.27.1.bb
deleted file mode 100644
index af52b7caf..000000000
--- a/meta-python/recipes-devtools/python/python3-requests_2.27.1.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Python HTTP for Humans."
-HOMEPAGE = "http://python-requests.org"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
-
-SRC_URI[sha256sum] = "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-json \
-    ${PYTHON_PN}-ndg-httpsclient \
-    ${PYTHON_PN}-netserver \
-    ${PYTHON_PN}-pyasn1 \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-pysocks \
-    ${PYTHON_PN}-urllib3 \
-    ${PYTHON_PN}-chardet \
-    ${PYTHON_PN}-idna \
-"
-
-CVE_PRODUCT = "requests"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


