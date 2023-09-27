Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D368E80A8E
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 05:41:26 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.11574.1695793279669667218
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 22:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: straka.derek@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-41368601e92so57666681cf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 22:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695793278; x=1696398078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZY9TXrF0ceDtDHGW3nw6UyvvPbFN8PQGB286oNzfeU=;
        b=gXmB9Tnth/Qse47pIYCPdPT9g3neP/0mLqfqOpn6cTF9FXLX8/cqss8s9kUX4O9Cm7
         vZoQa3HlsPbdVdwqARJSzLisSj+rmwhsIULfSxhmYTHZf5mPKRINLxVdYfcLqLA8twl+
         QKLvjvmGFvmnnOPYAgWVG1T2qZGIPPnvuw30NgGjXbrk+2r32JpwXCXqt9zR36Upq615
         vK51AIMTI5HC1KV64ITw8gsFxCm3tadiQb19NaLLKR0F+pJg8QxURT2VBvlDwWGLqBXg
         eOcPYTf1hTZBxymuBC8fQN5Yiw/xv9Be+hiYkj+uf39hjgCQ8nCMAcu6p0vtVGU8B3d6
         cc2A==
X-Gm-Message-State: AOJu0YwChV/i6LbJZHLKEGtvN91+apnkFZVkGCnU+rJ7n4goDpCBd/7+
	kDP9fMnyKs9daZY87FU1fKvGrs8JFvl8yA==
X-Google-Smtp-Source: AGHT+IFFEoklJSCCVfbaCwJ0vSyM7QMg62P2GDIkFrsMbzT9Tvjv2hdBFfdFomJBz/xZFHXzjWwjIw==
X-Received: by 2002:ac8:5907:0:b0:417:b026:7940 with SMTP id 7-20020ac85907000000b00417b0267940mr1027044qty.22.1695793278302;
        Tue, 26 Sep 2023 22:41:18 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id d8-20020ac81188000000b00411fcc18cc1sm5138184qtj.64.2023.09.26.22.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 22:41:17 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-prettytable: update version 3.6.0 -> 3.9.0
Date: Wed, 27 Sep 2023 05:41:09 +0000
Message-Id: <20230927054109.1702384-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 05:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105169

Removed unneeded UPSTREAM_* variables
Verified license terms and updated location

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...3-prettytable_3.6.0.bb => python3-prettytable_3.9.0.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.6.0.bb => python3-prettytable_3.9.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.6.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.9.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.9.0.bb
index 0c0692b14..c1e394d9b 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.9.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Python library for displaying tabular data in a ASCII table format"
 HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "2e0026af955b4ea67b22122f310b90eae890738c08cb0458693a49b6221530ac"
+SRC_URI[sha256sum] = "f4ed94803c23073a90620b201965e5dc0bccf1760b7a7eaf3158cab8aaffdf34"
 
 do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
@@ -12,9 +12,6 @@ do_install:append() {
     done
 }
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
-UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
-
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi ptest python_hatchling
 
-- 
2.34.1


