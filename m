Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AF8C2BBCA
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 13:53:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.48224.1718891579410291560
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jun 2024 06:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=a5f21fhK;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42108856c33so12746395e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718891578; x=1719496378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QE3umQGgDxkVLGam0iyhBiyKEbe+Ov4S6ajg+C6Yd6s=;
        b=a5f21fhKhk4tMrnYBcT/dqOnVnhYs7UJm40kDpkeHbrdNMKZWEFUMJUZHvix6Z7BQv
         L1IddAB9tqzs5ROd//9KQAYuayGdevME9tqkrmQr2aM1Xo2rGCkG3GwWc3n/RDiRiCWL
         7tRC0JK7mot3uM/gbdu8pXErDEmMT34iiq+Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718891578; x=1719496378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QE3umQGgDxkVLGam0iyhBiyKEbe+Ov4S6ajg+C6Yd6s=;
        b=rBgU+5AwvTvPCIgSdAktm9ad7zRScb+I+qLLhW9MVaNnZC2sd93vTSNFHTWV6xwAAS
         5Y2yk+qCNNNA4CgA5SACYkYK6rXoq1jk/AGkJB3vmNQ7zpgK/SL40pw502twpt2DxrNh
         8RHhQST4sc+Bbf9ykD6hHAH7+mHYqJaWIYpMnvFv3aXfZmcyy+APqH9dRwyPT+oI2nel
         ijCGR0CpWh4FBQIwrW+0vKT7PfzuP4gKBeXroJn81vGw5MGo3iciqn+siBOVNZBoYhu0
         GKo4gpG9qXM/IPm/PodvA59wy31uC03E/WqgrBxHSLrJP2z+88BGgPIlCbRd4KcLCVu1
         ZImw==
X-Gm-Message-State: AOJu0YyfaEOY7IQS9xjw4JlVlLei4d0WSTU817bBZxhQ4Olj5bYjkw4p
	c6FUWqOzKykKJ3sldSI2YH1gS2Sa23rfSwyOZxQrlWQG6XwpmFHUJdBe+aWPXRD4FJYAg4c8BDM
	y
X-Google-Smtp-Source: AGHT+IGNvLK3UszMsAOfJFz+/5NN2o4v8vN1TBrZ+Gr43eL95G7ej5Ka10triPTVXVBfNZST2OWEUQ==
X-Received: by 2002:a05:600c:4207:b0:424:7443:e6d8 with SMTP id 5b1f17b1804b1-42474d1edf0mr57704615e9.9.1718891577714;
        Thu, 20 Jun 2024 06:52:57 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54besm26353375e9.25.2024.06.20.06.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 06:52:57 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-hexbytes: Upgrade 1.2.0 -> 1.2.1
Date: Thu, 20 Jun 2024 16:52:52 +0300
Message-Id: <20240620135252.980949-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620135252.980949-1-leon.anavi@konsulko.com>
References: <20240620135252.980949-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jun 2024 13:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110975

Upgrade to release 1.2.1:

- Update docs structure, adding Contribution and Code of Conduct
  sections
- Drop ``bumpversion`` for ``bump-my-version`` and add ``make
  package-test`` to build and test the package before pushing to
  pypi.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-hexbytes_1.2.0.bb => python3-hexbytes_1.2.1.bb} | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-hexbytes_1.2.0.bb => python3-hexbytes_1.2.1.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-hexbytes_1.2.0.bb b/meta-python/recipes-devtools/python/python3-hexbytes_1.2.1.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-hexbytes_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-hexbytes_1.2.1.bb
index b75f7794a..c8e34fc40 100644
--- a/meta-python/recipes-devtools/python/python3-hexbytes_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hexbytes_1.2.1.bb
@@ -4,6 +4,12 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=16ffc86adf4293d4cfb204e77d62cfe6"
 
-SRC_URI[sha256sum] = "965f1cc712e7b263c41fdf3fb36cf671ba6f59b895937cf33941a5c996ec3a5c"
+SRC_URI[sha256sum] = "515f00dddf31053db4d0d7636dd16061c1d896c3109b8e751005db4ca46bcca7"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-email \
+    python3-compression \
+"
-- 
2.39.2


