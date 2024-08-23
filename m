Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611B5C5321E
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 22:43:21 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.2788.1724452998590265330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Aug 2024 15:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=C0iBr3D5;
 spf=pass (domain: konsulko.com, ip: 209.85.210.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7142e4dddbfso2031486b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 15:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1724452997; x=1725057797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+nVHW8UNLNZPTaa3BFJ1Y0MWE/irquS2vmWb/LsFOIo=;
        b=C0iBr3D5qQbJ0O0cX/ZPfJfGEJOG/lrgfVY5EdsgayVei8EpcO/U1755u5iIB3zlAl
         Kcp3pjJyjSbIs1HzXNVLp9MGzDoHFaGVvtlcEntGK2CU26aUXTDx0GqADNE932+oLei3
         Med4vJQE0nlV2ox3/w/TAIAnB3pS+LPij4tzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724452997; x=1725057797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nVHW8UNLNZPTaa3BFJ1Y0MWE/irquS2vmWb/LsFOIo=;
        b=Yc2GmjvmAFyuctTXsA5edkmSQX/aqw5nSnsnO+PKPz5aTYH8yE6U/6iM5/Mm3RoKOT
         LXG98MWwA2C9MhAPZg/UitjDV7Svh0UMyloNbcHRFn1aIapzNmQL3nkQqDht7T79EgBW
         FAnlhhNTybEXKEHoiO2antGdI5tXbF0RzxulDVXpuTwTjbY3TDxqQmZFMrWYlsWir2Mf
         O4uYrgJr4jc7TpR57scjEkJRrA+m0dK3p+JFhWHGMKsRnGjBIOkHNHfY6KxiSNc9RO4Z
         jQQHU21+dDZ/0zSI5dDgXhmgOiXyLb4iGRnZA2RCB3NSjbkE0H7Pv/KEp02gc0N+9R3e
         gpQg==
X-Gm-Message-State: AOJu0Yyp710A0FFa0DjaCcfdHw8FimNe3MUUF4ImKfVQ0xnowfLwzTZe
	i6dOG4Viq1ofRkdyrYuEq8G9ArjCOK+GI0fY0gfnvAmXDR4u+wXhz/EMkZriPz4x2XJP398Hdwc
	IeBk=
X-Google-Smtp-Source: AGHT+IHkSlQUErA5rt+p5juTIyeGOzzbUJAcgOKHLJQko7qPQ0Ypns/EUX/CPib8Haa7j607IuAtrA==
X-Received: by 2002:a05:6a00:3cd1:b0:706:67c9:16d0 with SMTP id d2e1a72fcca58-71445e34721mr4537642b3a.26.1724452997445;
        Fri, 23 Aug 2024 15:43:17 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac99525sm3255976a12.9.2024.08.23.15.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 15:43:16 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-oe][PATCH] python3-psycopg: add v3.2.1
Date: Fri, 23 Aug 2024 15:43:07 -0700
Message-ID: <20240823224307.3199147-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 22:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111916

From: Tim Orling <tim.orling@konsulko.com>

Psycopg 3 is a modern implementation of a PostgreSQL adapter for Python.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-psycopg_3.2.1.bb                | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python3-psycopg_3.2.1.bb

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.1.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.1.bb
new file mode 100644
index 0000000000..09c49c6650
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Psycopg 3 is the implementation of a PostgreSQL adapter for Python."
+DESCRIPTION = "Psycopg is the most popular PostgreSQL adapter for the Python \
+programming language. Its core is a complete implementation of the Python DB \
+API 2.0 specifications. Several extensions allow access to many of the \
+features offered by PostgreSQL."
+
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
+
+SRC_URI[sha256sum] = "dc8da6dc8729dacacda3cc2f17d2c9397a70a66cf0d2b69c91065d60d5f00cb7"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} = "libpq"
-- 
2.46.0


