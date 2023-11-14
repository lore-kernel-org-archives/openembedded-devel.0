Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CAFC4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 12:10:01 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.11096.1699963793246219118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 04:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R4nVNqyu;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53dd752685fso8447120a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 04:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699963791; x=1700568591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Deqyu/VDNATWZh8EMXgAOgYv/OqhFMv16djBCyR6UKo=;
        b=R4nVNqyugNn9mlnZXcn9svEh7dUQyNu5HyV2z0B0/phdMpj7vB2DbcW/6sgKpZ0PLs
         Z1Cr+WIINsfiM81MkuEPe3IA6dii9K+V56OYqJTlyUYDU8iXbe3GrY6Gn92BOGByDuDB
         bHwHMt/kXCEIGwJxqdw8HloZ1T082DrDJlv2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699963791; x=1700568591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Deqyu/VDNATWZh8EMXgAOgYv/OqhFMv16djBCyR6UKo=;
        b=lneCDYM1vZO3nsmyedxd68F3iOh3/fU3r+/xxtSNAzeIKFnQJiH8XOwbZ86oeHKs1r
         2Ml4EGVA0ymJ1V7UpRH2FBWfZZ6T07322/ppgdp+cVOcYXp/HaxYR8nk2tC1Ol4tYDwM
         NWmGI6pkvx7ICDSPBcjfthFoJAgY/HnlZo9xjdl+ZU4Mcqk0Ue7ME5wnjCLdS92QZJLE
         F18vkdZ42SjwhkbB+ejCG4yCGop7Hukhnhk+J7SeYEyAyMKb1bAFssDaG7+KQcg9ciDI
         0QFjJ8z4KzmhZ4LXJnvgGziqpKlEp0dIRNnIVNpnwaltpav7QE066U7pv8ohb86VUhUY
         XVYA==
X-Gm-Message-State: AOJu0Yw2YRxYrgxY3aMngBgQPHf/RFsvnNNoV6eY/uBfVd1fKtpVYXQE
	wvgTULAQUUv0zDDbDMEbaTwJkWYhf5oBviFx6v0=
X-Google-Smtp-Source: AGHT+IETPF+gI5kJWFH8yjAOBEUbAZd+g2dcXJ6B/qADmgchzGy5lVr6IeQDayf9EFYgpo1RAfpQZA==
X-Received: by 2002:aa7:c9d9:0:b0:534:8bdf:a258 with SMTP id i25-20020aa7c9d9000000b005348bdfa258mr6977804edt.31.1699963791626;
        Tue, 14 Nov 2023 04:09:51 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id o5-20020aa7c505000000b00532eba07773sm4946958edq.25.2023.11.14.04.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 04:09:50 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pystemd: upgrade 0.10.0 -> 0.13.2
Date: Tue, 14 Nov 2023 14:09:44 +0200
Message-Id: <20231114120944.3741068-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114120944.3741068-1-leon.anavi@konsulko.com>
References: <20231114120944.3741068-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 12:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106713

Added runtime dependencies. Upgrade to release 0.13.2:

- adding coverage information
- changes tests to pystes
- adding support for pyproject.toml
- adding extra properties for unit

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pystemd_0.10.0.bb => python3-pystemd_0.13.2.bb} | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.10.0.bb => python3-pystemd_0.13.2.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
index da22a43de..d31f45131 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.13.2.bb
@@ -2,10 +2,17 @@ SUMMARY = "Python bindings for interacting with systemd over DBus"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "d74a814bfda01085db1a8ad90be3cb27daf23a51ab6b03e7e29ec811fa2ae859"
+SRC_URI[sha256sum] = "4dcfa4b13a55685c49d3d17c10631eca18c33770f66316f8ef2337b8951cc144"
 
 DEPENDS = "systemd python3-cython-native"
-RDEPENDS:${PN} += "python3-xml python3-pprint"
+RDEPENDS:${PN} += "\
+    ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-lxml \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-io \
+"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 inherit pypi setuptools3 features_check pkgconfig
-- 
2.39.2


