Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E823C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 13:53:01 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.48223.1718891578937458018
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 06:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mi4Bdjlg;
 spf=pass (domain: konsulko.com, ip: 209.85.208.170, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec0f3b9bb8so9673681fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718891577; x=1719496377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0OZt6mPm8y2vQXtAK1Sai5s4KcT2vA/FezDhlQxBc8=;
        b=mi4Bdjlg4IqC3tbDMCEycbLTLQwZqoqcaJeLnIdvBPGjV0jkA0V36FM97jqnJmJrdC
         revc8Qupt8bgnhgAqasI0TqSxKOtMfOrGlQ2xMGRxDT+EV/hSsH7ZCLEDGf41T9x9qRM
         iphT7qvFWTkMUvUErg41M/7GBwteW5iyXJ/bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718891577; x=1719496377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0OZt6mPm8y2vQXtAK1Sai5s4KcT2vA/FezDhlQxBc8=;
        b=d4QpOWJDyIOlFW7fAzJlxeyC7fqxNrLfIxDEahAxNzxcs2tCCe6Vu6H5eqAeUBxVFO
         A+g2sOI7aidIGS3avAShqmV0SUiNapOeZZsp1cRik4NIg0vlYWzg2zv19fYba0/3sVpX
         Vy6kbztaQxko+Fhe7qkOjoAppWuHC0bMafKLxOT0ifRWkCqoU3eE3fTksFG0/DygrCi+
         GNQufZf6MZXuLnGfQdgKlhE/x1aH3XozHmRC1WKcWweBMIRL2MnqRwWTgAraxc8k0K35
         y/F3gM9ui5s1v02t8GXSyua44TGkgPw4BNh2QHJuBbRlDeXp0V3MTDxXVUpqWZ6a0rn4
         y+Kw==
X-Gm-Message-State: AOJu0YwHgeJQAh8FFSZ9qb8mYp5L57ZKFMOSS2uAehaVRVzblq0gDFiY
	+MFJt0yCXwBivbn9OeywdeJxMFrq3MT1ynul94Fso6NNDYf5Bym99SKrrJdmnzQtuMJmwDssp1o
	0
X-Google-Smtp-Source: AGHT+IH9uowRbbgqiXScI5EbsxkEVDqmK2gtnjfhB6SS720H27xelkl5SM7KPAcvTwfG3n4kFntUOg==
X-Received: by 2002:a2e:7e02:0:b0:2ec:c8:2755 with SMTP id 38308e7fff4ca-2ec3cea151cmr35529481fa.24.1718891576787;
        Thu, 20 Jun 2024 06:52:56 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54besm26353375e9.25.2024.06.20.06.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 06:52:56 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-filelock: Upgrade 3.14.0 -> 3.15.3
Date: Thu, 20 Jun 2024 16:52:51 +0300
Message-Id: <20240620135252.980949-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620135252.980949-1-leon.anavi@konsulko.com>
References: <20240620135252.980949-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 13:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110974

Upgrade to version 3.15.3:

- Add test for virtualenv stability
- Fix TypeError: _CountedFileLock.__init__() got an unexpected
  keyword argument 'timeout'

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-filelock_3.14.0.bb => python3-filelock_3.15.3.bb} | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.14.0.bb => python3-filelock_3.15.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.14.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.15.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-filelock_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.15.3.bb
index d94ad4bf3..3bbf72319 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.15.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "6ea72da3be9b8c82afd3edcf99f2fffbb5076335a5ae4d03248bb5b6c3eae78a"
+SRC_URI[sha256sum] = "e1199bf5194a2277273dacd50269f0d87d0682088a3c561c15674ea9005d8635"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
@@ -14,3 +14,9 @@ inherit pypi python_hatchling
 DEPENDS += "\
     python3-hatch-vcs-native \
 "
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-logging \
+    python3-asyncio \
+"
-- 
2.39.2


