Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C28CCD1BD
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 18:32:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.20644.1761071530716849294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 11:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YrL/4+2P;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso5460818f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 11:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761071529; x=1761676329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtLHg0wCDLMYgiR+FQ8a1uPfkIOJUC42p9HauUnOOd0=;
        b=YrL/4+2PfQHJ/na5dPcbpdC8uVFPAqAEUVveXrQEnP0NUpn2XyhjRNfkRYqMDzD/Ad
         wsX8lcIjXl8wEx0FK+DsuUNT64+OarbWIDoHf8JIiu1MiBWhfPARoUmy5zQOJpeZwKvS
         udnK/RIZAZO5pYOD9DrnAiroAfvuSnX4RAULaUquEyOLaAonhjMK6T3qZOhHUu1MY/yX
         knnD5qBWsTMlQNcNShn0jdn78babTmKoBTlFMnvIYUKgM4B9Q9TLQhShQkDImuWieZc7
         hP7iHNllu529u1gjjs2fvL1lWh7lFsLV8Q7QWprYroFiY1hIWzH+tzUNblEWZ9B14i0s
         +WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761071529; x=1761676329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtLHg0wCDLMYgiR+FQ8a1uPfkIOJUC42p9HauUnOOd0=;
        b=ro7MDivBC6HMnnBg/QO9gScXDpWq4hwB/0VHriYzGn20QHeEq7IzedQhpVVCfpM3c+
         pF+ynJbzTdBlAMAaXBURJ6lnjPNfdZOeoj6uXrrYZkgv4nfldrjiC3dPjvmQ9EGVI6I+
         dDdtj5NpAMY6i6iedlodkADX1DCXJsqlifcATj8npZKCF8Lxm7Zyh5VBGtbTNwG/rMLy
         o0QlSfXSmFceOBNTGenW7x305bgLGADZH2qmEuj3BwvczTy/mRjIZ1h0PpGrP1MJRJZT
         tHRCQGWd0Yvz7IGODlQZu/cVwCU0BXfIqlQPEQorJydWeOuk6CVAu1gfh89btGN3cONB
         MqXw==
X-Gm-Message-State: AOJu0YyIFu+A5LAq2yR8bY7ySlk+8sowy6YNawnHOI1Epfh5ozXZ0j1/
	YhpkNeEBB6fCsljidW9bUu20yF/xI3Qb/vY6mKLLEGpUGxRIj7nXRuwlcd7PIg==
X-Gm-Gg: ASbGncubFNdVIhkTKjLHLYjIAONgkocd+JmxNNA3kjgiSmpsCDllgpjQfCignn64JMQ
	PeUNo52+THrr+XqCMI2T2ABhJhJLnDlp/efYAjgKX0laytYjsHJ+qLwHjLzbJV8AruLD7rmdSRK
	7QnJVqYDBLg1fax4fb3MSnz8Zw1b3VKQZ3ERJkM0rsJ/LKT9UjqZvw6MVy77LtDq9bX74cEhys/
	WnYnOoauf0dTR5rmZq85Qt72KodsHTQAWrTBUVrp3ngK2Hq1uqTPCRD1Aqwkd80zta/9iie7vFk
	cl0llO+Y4URiLQFtfmMAZPZ5v7Rxa5BGkfYH4TlAnQdFtAxGsVRpLKlRiBtAWraIGQr03qqAYf3
	WiYr66PrAE1vot6Z/R5lKWw+awrcAxGynjZdTPYjW2I78WRdqZZNkvG4zb2XX538NWWJAFYU/vV
	ps+q8QZIUo
X-Google-Smtp-Source: AGHT+IFhHUrsqZi+O/SbavByrdG3n1Ixd1SCo6cOUYibOTBUdUAyNA7t6F2CcmFuoDh57wFFY/NAlQ==
X-Received: by 2002:a05:6000:402c:b0:428:1475:6a26 with SMTP id ffacd0b85a97d-42814756c20mr9494708f8f.56.1761071529064;
        Tue, 21 Oct 2025 11:32:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496cf3b45sm20984535e9.7.2025.10.21.11.32.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:32:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 6/6] squid: fix esi PACKAGECONFIG
Date: Tue, 21 Oct 2025 20:32:04 +0200
Message-ID: <20251021183204.269102-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251021183204.269102-1-skandigraun@gmail.com>
References: <20251021183204.269102-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 18:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120846

libxml has derecated the "xmlSetFeature" call, and hid is behind a special
config flag (--with-legacy), which is not used by default in oe-core.

This makes compilation fail, when "esi" PACKAGECONFIG is enabled:

Libxml2Parser.cc:94:5: error: 'xmlSetFeature' was not declared in this scope; did you mean 'xmlHasFeature'?

This backported patch fixes this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ct-and-unnecessary-xmlSetFeature-cal.patch | 35 +++++++++++++++++++
 .../recipes-daemons/squid/squid_4.15.bb       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-ESI-Drop-incorrect-and-unnecessary-xmlSetFeature-cal.patch

diff --git a/meta-networking/recipes-daemons/squid/files/0001-ESI-Drop-incorrect-and-unnecessary-xmlSetFeature-cal.patch b/meta-networking/recipes-daemons/squid/files/0001-ESI-Drop-incorrect-and-unnecessary-xmlSetFeature-cal.patch
new file mode 100644
index 0000000000..6f467258b9
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0001-ESI-Drop-incorrect-and-unnecessary-xmlSetFeature-cal.patch
@@ -0,0 +1,35 @@
+From c312f7fa80371cc6db583590258381ebc7cd18f6 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sun, 20 Feb 2022 19:42:40 +0000
+Subject: [PATCH] ESI: Drop incorrect and unnecessary xmlSetFeature() call
+ (#988)
+
+xmlSetFeature() has been deprecated for 10+ years and will eventually be
+removed from libxml2. Squid calls xmlSetFeature() with the wrong
+argument: a nil `value` pointer instead of a pointer to a zero value.
+When called with a nil `value`, the function does nothing but returning
+an error. Squid does not check whether xmlSetFeature() call is
+successful, and the bug went unnoticed since libxml2 support was added
+in commit 964b44c.
+
+Since libxml2 does not substitute entities by default, the call can be
+removed to achieve the intended effect.
+
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/5db4df2c6f83b5c26357f4439d28b92ef7071cd5]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/esi/Libxml2Parser.cc | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/esi/Libxml2Parser.cc b/src/esi/Libxml2Parser.cc
+index 2b9ba0a..0301b77 100644
+--- a/src/esi/Libxml2Parser.cc
++++ b/src/esi/Libxml2Parser.cc
+@@ -91,7 +91,6 @@ ESILibxml2Parser::ESILibxml2Parser(ESIParserClient *aClient) : theClient (aClien
+ 
+     /* TODO: grab the document encoding from the headers */
+     parser = xmlCreatePushParserCtxt(&sax, static_cast<void *>(this), NULL, 0, NULL);
+-    xmlSetFeature(parser, "substitute entities", 0);
+ 
+     if (entity_doc == NULL)
+         entity_doc = htmlNewDoc(NULL, NULL);
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index ae3b66c7af..575ad76ad3 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -38,6 +38,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://CVE-2022-41318.patch \
            file://CVE-2023-46724.patch \
            file://CVE-2025-59362.patch \
+           file://0001-ESI-Drop-incorrect-and-unnecessary-xmlSetFeature-cal.patch \
            "
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"

