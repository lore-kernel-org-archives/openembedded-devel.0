Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70DFC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:53 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.218945.1704025423395183325
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VFzpaDvx;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a28005f9b9cso8335466b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025422; x=1704630222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsdV/Ju/Bx0eq9Jzd0ylEGBjR+NLOAXneLFS69sGf+g=;
        b=VFzpaDvxLSdRFsvCc4vMOYQ1vx9Uqm5GDJRP45aIvecYm1jKfi6muQtoG4fso21fGu
         PGuCemHujPQReR+kIXonwulZ3uGMBIfMa0LnWH8ZTg3zAslI9G3NYHEH6dgK7JUEvV/E
         c/a8caiv2cEdo/xxhEb2Y8xnkptwZNiO79EQhOwqC6wM1Dh7okqKa999d+EuO0IqIBTP
         FGJKr3EOPpqsykQ2LJ39ADc6WZkIWUVMToUc78Ee243DPbTCSsked6rWiA7Oph7/MOjI
         hJ3Z5C5+etGwKbPAGJlsXMy5FGGSN7qwK3htJpdWyqTu8eIvrZATetMYO743sah9ZuBE
         wx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025422; x=1704630222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GsdV/Ju/Bx0eq9Jzd0ylEGBjR+NLOAXneLFS69sGf+g=;
        b=iz28MaT7weUe+4l85WJm2MJ1gE9PbnVvxrCJoQGku84hzZrvVgb5IC4mzfZf5Sgk6N
         p1oowbsCTftXPpzuelWfV60KI5dRAY6qtobyJirOJuo5t4/qmYjRBmvfJJtnYFBDImpp
         /6OZiXPDqU+okVW1b4tXTj+lI2rWSlRVrdT985irDQlnLBlWye6JRQtg2eOVTS2dfTm2
         2N/I2UgjYvg630+YcbHOk3hILxJfYeRJWVEj3rGrNJP0Zb+w7n8vXhF+SagaGxP80QmZ
         4mJjkG0FQfhWetVhF7spmADstb30PuxU4cBr2D8FThcnHWACukW8qPz4F6AU78LPUrGz
         6Njg==
X-Gm-Message-State: AOJu0YxeKRW3NKEqlhGNYZuOpZVm3CHOxSjdkon3hinQxzMR0EGV+YTO
	8xzs2JpEqHvHu4FCcezmLMEDzgf8NR4=
X-Google-Smtp-Source: AGHT+IEd3d37Dh3kd9hwcxE+iOTUa47dyTM3ZHjfrBKVB0dg2/KeljcX6ezRItareTqAr/rvuf4O5g==
X-Received: by 2002:a17:906:f910:b0:a26:965a:e866 with SMTP id lc16-20020a170906f91000b00a26965ae866mr7340826ejb.111.1704025421874;
        Sun, 31 Dec 2023 04:23:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/23] python3-jsonrpcserver: remove
Date: Sun, 31 Dec 2023 13:23:17 +0100
Message-Id: <20231231122329.405225-11-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107962

No activity in over a year, and depends on oslash, which has had no activity since 2020.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-jsonrpcserver_5.0.9.bb     | 23 -------------------
 2 files changed, 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.9.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 0500ba19e..32e962aff 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -210,7 +210,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-jsonpath-rw \
     python3-jsonpointer \
     python3-jsonref \
-    python3-jsonrpcserver \
     python3-jsonschema \
     python3-jstyleson \
     python3-kconfiglib \
diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.9.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.9.bb
deleted file mode 100644
index 7e058a757..000000000
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_5.0.9.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Library to process JSON-RPC requests"
-HOMEPAGE = "https://github.com/explodinglabs/jsonrpcserver"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=61b63ea9d36f6fb63ddaaaac8265304f"
-
-SRC_URI[sha256sum] = "a71fb2cfa18541c80935f60987f92755d94d74141248c7438847b96eee5c4482"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "\
-    python3-apply-defaults \
-    python3-asyncio \
-    python3-core \
-    python3-json \
-    python3-jsonschema \
-    python3-logging \
-    python3-netclient \
-    python3-pkgutil \
-    python3-oslash \
-    python3-typing-extensions \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


