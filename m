Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78908C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:27:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.6073.1659446855234277633
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MyWbjBsw;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id m13so13959332wrq.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JojbAd259+aKGZXC+VLmoRCO+kadPT48FH55PBkTVew=;
        b=MyWbjBsw/jIRl9pFpPbOfj7uBzkbSzK+JyIUHwiIjTMjevHh/599T8dVm98VY6er11
         THdMHBGltyx9gk3MNtduarXyVy5IMBubxk/eD9s5R7cElSeSNQVcHS/DDyxL8kcpXnwU
         kARvIQC9MedZnPP3zyfBYKIDcv6R59y7zBm/kLWk3oPzfsON39ZQ0Clixxk+Kaonzem9
         hYDDwZociAkO2D6WFuqIebM+9G4kB30WnP2Zvc4WHnc+Eqp798xzmtqi0ROvdEvLVbfY
         8t4T2beP4gIHaOQ/BWN0dcP+eRVFUGdLorFOUwbsRtfFWGw6XWPASiavNbKIqI80nb5H
         BXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JojbAd259+aKGZXC+VLmoRCO+kadPT48FH55PBkTVew=;
        b=aegWSKCaB3NPqyZOBNWw6nH6c7hwp+ujqDdkxrxAplIBmXDPkvadxBUSvXupP8KWPr
         1fcNV/XdSxu/3LD5nmmtbKaPcb0p4egROb7HyPC3+lM2kPZJXUfChAv82hSKr7bU8Ikw
         q/xmHI1TkO5Rjfcba8QC1bn1M4E2TbZUyn4AAOVRM883M7pjgUCcZhCD1iO1oWzy0S1M
         Rmi1jFt99BVo2n2cJpSsbGT3Ej5E88+Ss8CXTm+Nigp90VaAA+fxTrKUPXljPnXDrFG5
         vLdWRjJEzi0JUhzKXNwRg+ZZiOqQUO+qPAcKo7xZ5St3jZj9P3X8OGNKHO29NSxCVtu9
         Oyww==
X-Gm-Message-State: ACgBeo183xh1agfVEIkMKb4GgDXpe8XQzEpC/PhHLIAJ6Qm0y2T7MUNX
	qImzNApAcSSuvNRxLVfEgbNZAWhF4A==
X-Google-Smtp-Source: 
 AA6agR6wK4iK62T7kD5c9BLUr+eIgGUJpjltkrG82uBO5J7ylzkmaHSm3AEoCYd3shdMWdf3YmDWoA==
X-Received: by 2002:adf:f905:0:b0:21d:f460:1acf with SMTP id
 b5-20020adff905000000b0021df4601acfmr12868719wrr.108.1659446853099;
        Tue, 02 Aug 2022 06:27:33 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id
 i2-20020a1c5402000000b003a2cf1535aasm18780829wmb.17.2022.08.02.06.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 06:27:32 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-python][PATCH] python3-jsonrpcserver: add patch to use
 importlib.resources instead of pkg_resources
Date: Tue,  2 Aug 2022 15:27:27 +0200
Message-Id: <20220802132727.1505-1-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:27:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98082

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

Currently jsonrpcserver has a runtime dependency to setuptools because
it uses pkg_resources. Setuptools however is not listed in the RDEPENDS
of python3-jsonrpcserver. We could add setuptools to RDEPENDS but since
pkg_resources is discouraged anyway [1], I posted a patch upstream to
replace pkg_resources by importlib.resources.

Until the upstream patch is accepted and released, add it here as a
patch so python3-jsonrpcserver is usable without the setuptools
dependency.

Upstream-Status: Submitted [https://github.com/explodinglabs/jsonrpcserver/pull/235]
Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 ...b.resources-instead-of-pkg_resources.patch | 44 +++++++++++++++++++
 .../python/python3-jsonrpcserver_%.bbappend   |  5 +++
 2 files changed, 49 insertions(+)
 create mode 100644 recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resources-instead-of-pkg_resources.patch
 create mode 100644 recipes-devtools/python/python3-jsonrpcserver_%.bbappend

diff --git a/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resources-instead-of-pkg_resources.patch b/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resources-instead-of-pkg_resources.patch
new file mode 100644
index 0000000..2d1a8c9
--- /dev/null
+++ b/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resources-instead-of-pkg_resources.patch
@@ -0,0 +1,44 @@
+From 4220c6a02bc03ff8c6cc4b3bee168a1351a3ce39 Mon Sep 17 00:00:00 2001
+From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
+Date: Fri, 29 Jul 2022 15:53:37 +0200
+Subject: [PATCH] Use importlib.resources instead of pkg_resources
+
+From the setuptools website [1]:
+
+Use of pkg_resources is discouraged in favor of importlib.resources,
+importlib.metadata, and their backports (importlib_resources,
+importlib_metadata). Please consider using those libraries instead of
+pkg_resources.
+
+[1]: https://setuptools.pypa.io/en/latest/pkg_resources.html
+
+Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
+---
+ jsonrpcserver/main.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/jsonrpcserver/main.py b/jsonrpcserver/main.py
+index 0397a58..ac1855f 100644
+--- a/jsonrpcserver/main.py
++++ b/jsonrpcserver/main.py
+@@ -13,7 +13,7 @@ from typing import Any, Callable, Dict, List, Optional, Union, cast
+ import json
+ 
+ from jsonschema.validators import validator_for  # type: ignore
+-from pkg_resources import resource_string
++import importlib.resources
+ 
+ from .dispatcher import dispatch_to_response_pure, Deserialized
+ from .methods import Methods, global_methods
+@@ -26,7 +26,7 @@ default_deserializer = json.loads
+ 
+ # Prepare the jsonschema validator. This is global so it loads only once, not every
+ # time dispatch is called.
+-schema = json.loads(resource_string(__name__, "request-schema.json"))
++schema = json.loads(importlib.resources.read_text(__package__, "request-schema.json"))
+ klass = validator_for(schema)
+ klass.check_schema(schema)
+ default_validator = klass(schema).validate
+-- 
+2.34.1
+
diff --git a/recipes-devtools/python/python3-jsonrpcserver_%.bbappend b/recipes-devtools/python/python3-jsonrpcserver_%.bbappend
new file mode 100644
index 0000000..23cdf07
--- /dev/null
+++ b/recipes-devtools/python/python3-jsonrpcserver_%.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+SRC_URI = "\
+        file://0001-Use-importlib.resources-instead-of-pkg_resources.patch \
+"
-- 
2.34.1


