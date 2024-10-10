Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E520CF11C5
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 09:58:58 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.39784.1728554337237078067
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 02:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Dke0wRlF;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a994ecf79e7so120210566b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728554335; x=1729159135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ylCx1OVFhqP6wh0PkKG8AuCTj8FwMvtbMeE6QKDOVMY=;
        b=Dke0wRlFZOndxQF68V4b62snBjk1Kkqv6F+T4YajFOv4/1htA+T4jwHplXx0dO/RHQ
         EcetAEwGfqEMHkHCNzhd6OQ0c/Zu+akCO/WoZ3X91Kp0lcoxIyrU9kg8ZUc92/dg1pmL
         xz/U8P0tECJX1zvapbXpE5S9SmxAuQd5KQnYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554335; x=1729159135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylCx1OVFhqP6wh0PkKG8AuCTj8FwMvtbMeE6QKDOVMY=;
        b=D88jqubVDH2yTGBzWz4GvX+KSxfvT9DnOf/ObcdHpaBTeHQ/MCi3p18Bc/bt/1Kbua
         CZRBB/rJjVvlxIlP9sCCZFtCosFiEsfoPixg6+Jm4845aOQOVOxLPsLsH77exuYteXEw
         EfXdP7J8yuNEBa9UY6Alnq5V7v4MgE6Qydo1d2KGMX8OcBXOjjZ3PYS0Ii5Ji3NcQoev
         lynZwf7TusfWNA8XEPvtNgLDSEztP30kjnT74hVZvI0V/spEAgGZbEz5I7vv24b9afR7
         KMe2wjn3rcXQ19uLrmdhGuLVfyx4yOf3P4D6Y4uyv4v0AuNzn8YnbBY7BaKKZkWSCyjt
         9c+A==
X-Gm-Message-State: AOJu0YxIaYdlgR6JWiWF6f7iHC8aTZB7eoJdI1d29va9Sdno8wUiFLwA
	PHvPrnh/d1yA9Iigj+oUb8TPNpGEJ9lI723qXkowqPhBit29HmXdiH52iUKLFfoHMdoCCFyY15W
	w
X-Google-Smtp-Source: AGHT+IHRhtoMpWi9HrO1iw3pdGi4SeuroyUVlLW7XAO8il46JAJnGHtW9iajFjwfHwhhRX4rjW1TOw==
X-Received: by 2002:a17:907:f745:b0:a99:63bb:b86b with SMTP id a640c23a62f3a-a998d259239mr503287766b.39.1728554335180;
        Thu, 10 Oct 2024 02:58:55 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80dc36bsm64686466b.157.2024.10.10.02.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 02:58:54 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-propcache: Add recipe
Date: Thu, 10 Oct 2024 12:58:52 +0300
Message-Id: <20241010095852.40243-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 09:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112774

Add recipe for release 0.2.0:

- Fixed loading the C-extensions on Python 3.8
- Improved typing for the :func:`propcache.api.under_cached_property`
  decorator

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-propcache_0.2.0.bb               | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
new file mode 100644
index 000000000..874c9fd8e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Fast property caching"
+HOMEPAGE = "https://github.com/aio-libs/propcache"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[sha256sum] = "df81779732feb9d01e5d513fad0122efb3d53bbc75f61b2a4f29a020bc985e70"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+    python3-expandvars-native \
+    python3-cython-native \
+"
-- 
2.39.5


