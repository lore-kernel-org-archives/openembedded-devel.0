Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C04DCEDD94
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 12:30:20 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.15103.1728477017110031922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 05:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Zg+TOOqM;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9963e47b69so370004366b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 05:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728477015; x=1729081815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiAu6ufCwvCNfU0NBReylR8CJFvvSOJQ6RiUyGLcXZs=;
        b=Zg+TOOqMuk5AemyGuOeiQg67hL2ts8iQJ/AC2oRifH92gSONJoGGzhS9rhn+DWs3sr
         2Mzv/wQpWVoiRbE9/dLE9maQtwBS7Gyn07x7g1Sk6q/JJprpdmG2mVCqup5CFc3H/7oB
         OARybA8Jedks+S2PRfn4GdByROLfzwMCq5BVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728477015; x=1729081815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiAu6ufCwvCNfU0NBReylR8CJFvvSOJQ6RiUyGLcXZs=;
        b=cZap3pjmeK3wiaBYo1nAOp6+sjVbJIoVgcm6kzY0c/TMpudNC2OyvATOCXCXeOJ01/
         dLnG4fmoO5kjnWIb2ZDhMbGp2YVB/oJLQZbuGxkCoWd9h+lgKDXOV8tzcFF+jZk18C/T
         KPA3xJsXgkkFoTILUJz3lyJShjnX2kOQ+8HrIhc+nbDU+mxpxwS6Bo7txdI2KyNBlPhO
         kQ8JlMDDNsbFE9biyw0WinP9f822YWpCmCjIhRL0o41+pFESebC0FH5GcKkUfauBUmH9
         5lCWPKGlLS3Vg5rKeKFgjXIj6kT9BuXtHdVt9y2UD+jv2g4dvCrdoRvCwR5CNRbC2CAP
         st+Q==
X-Gm-Message-State: AOJu0YwYH+l7OpNqc0tNp1iMEWo6QGaB/BKFrdks/FcLCeomqRaJUP4Y
	0kQg26TUQ7Ild095r4h64Dtz7O+AomD5lXmqD/s7gdYJfhe1zghXt9Ma/m+ocS9bzc3aX7lh548
	z
X-Google-Smtp-Source: AGHT+IGSXFVjYNWAJEroPwT+a4wc5JTSbK5rIesERlC1yZ7XG8a3hhBBTZs6lU7Bv14FvqqEX55qzw==
X-Received: by 2002:a17:907:7f87:b0:a99:65c6:7f34 with SMTP id a640c23a62f3a-a998d0fe9a8mr194089566b.7.1728477015285;
        Wed, 09 Oct 2024 05:30:15 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9944c6d6basm543582266b.145.2024.10.09.05.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:30:14 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-propcache: Add recipe
Date: Wed,  9 Oct 2024 15:30:05 +0300
Message-Id: <20241009123007.1023153-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241009123007.1023153-1-leon.anavi@konsulko.com>
References: <20241009123007.1023153-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 12:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112729

Add recipe for release 0.2.0:

- Fixed loading the C-extensions on Python 3.8
- Improved typing for the :func:`propcache.api.under_cached_property`
  decorator

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-propcache_0.2.0.bb         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
new file mode 100644
index 000000000..01a7c4c05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.2.0.bb
@@ -0,0 +1,24 @@
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
+
+#RDEPENDS:${PN} = "\
+#    python3-multidict \
+#    python3-idna \
+#    python3-io \
+#"
+
+#RDEPENDS:${PN}-ptest += " \
+#    python3-pytest \
+#    python3-unittest-automake-output \
+#"
-- 
2.39.5


