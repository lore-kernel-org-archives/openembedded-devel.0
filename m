Return-Path: <nick83ola@gmail.com>
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail.openembedded.org (Postfix) with ESMTP id A5AE56B076
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 08:14:54 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id k25so16576782oiw.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 01:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=to1SPYYjOklzNuvVTaWgh/E6NZm4TRImeO2f3do+3co=;
	b=aLaXNLI9pUGLoK84qAPn+abXiRXYUVKSMYSjk+q2vCEHyYd4sd1GSrsrhm1GDoQdCC
	jiL6ddTRpLiqBOMEE0po+FUKQpLVYQ0iYutYQRhmligkwRnWjKhKtVcDFQ+yn22joE1j
	QPJJI+QHigFOxODrxekh3ojZXQZU0NL3KlD+5aW6cY0xlbG+3UJyhmjLlh8UzhanwrL6
	r/ZJg2tAt6FDMd6t+Cjz4EWan2b5NcXH+xFdoIOwSb/q53FtcOubfydYj4jOnC2jt+6g
	DHs7vgi+Aq1Kb3O8M3KE9li9QggXxZ3rQzlo9ir8DPHC33g5guWMyuXj0+T1hYf8rejc
	qbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=to1SPYYjOklzNuvVTaWgh/E6NZm4TRImeO2f3do+3co=;
	b=QzP2hEANYW1L2AUUDSNgNPYD2lEgHkFjdsva/BUmHeTyrOsbGNvbjsUB49CzmcB78g
	YfFmlOQwAbdLDVVAiyF9i3jHFjYEYUfFYZzs3DsgfOmiG6f07yBUTnhmxCgvX7ES6hmX
	lLsTS4JIhh9I+ePZJUpZN90AVe52Rg5By055L6TLZ1bmYRUnT0HC9rA64b//lGX9CmGi
	Q3QNTOJkkJAzAYtCpH2CG7yD2iTRk61tf5KjB+PDWxMwH/nUFC4FESy6yyn4J1lN2tin
	xopJ+ZgjWlO59yWG7boptANa0tw0a/W2HbJr1ml5dXELh96osMso889QLkkVMI9vJKTB
	cKcA==
X-Gm-Message-State: APjAAAWCVREwHs/0LZSy2qvviz5JZRJuM5H9Lnxv6UmVSvwcbS63H7ci
	8CJyxxv0UNECfDGjovvuonINO03xh0E=
X-Google-Smtp-Source: APXvYqz+uYIjyCAqBUtUhHe/NL9G+TTXzb9y8kiGOFiGVu3b4x2jMlCVGt/tjDWnKVDb+baCAlO0tg==
X-Received: by 2002:a54:478b:: with SMTP id o11mr5211399oic.169.1571818495095; 
	Wed, 23 Oct 2019 01:14:55 -0700 (PDT)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d25sm5360988oic.23.2019.10.23.01.14.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 01:14:53 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 09:14:42 +0100
Message-Id: <20191023081441.18590-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-pyconnman: fix import issues with python3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Oct 2019 08:14:54 -0000
Content-Transfer-Encoding: 8bit

release 0.1.0 of pyconnman is not using relative import so it
crashes when you try to load it with python3.
Add patch from upstream to make it work.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 ...ules-by-relative-path-for-python3-su.patch | 74 +++++++++++++++++++
 .../python3-pyconnman_0.1.0.bb                |  4 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman/0001-Import-local-modules-by-relative-path-for-python3-su.patch

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman/0001-Import-local-modules-by-relative-path-for-python3-su.patch b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman/0001-Import-local-modules-by-relative-path-for-python3-su.patch
new file mode 100644
index 000000000..977b4aacd
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman/0001-Import-local-modules-by-relative-path-for-python3-su.patch
@@ -0,0 +1,74 @@
+From 2e84adb042bfb742eb328220b97f79ddb28db44b Mon Sep 17 00:00:00 2001
+From: Haris Okanovic <haris.okanovic@ni.com>
+Date: Tue, 23 Oct 2018 21:39:56 +0000
+Subject: [PATCH] Import local modules by relative path for python3 support
+
+Upstream-Status: Submitted
+---
+ pyconnman/agent.py      | 2 +-
+ pyconnman/interface.py  | 2 +-
+ pyconnman/manager.py    | 2 +-
+ pyconnman/service.py    | 2 +-
+ pyconnman/technology.py | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/pyconnman/agent.py b/pyconnman/agent.py
+index f72de8d..453d783 100644
+--- a/pyconnman/agent.py
++++ b/pyconnman/agent.py
+@@ -1,5 +1,5 @@
+ from __future__ import unicode_literals
+-from exceptions import ConnCanceledException
++from .exceptions import ConnCanceledException
+ 
+ import dbus.service
+ 
+diff --git a/pyconnman/interface.py b/pyconnman/interface.py
+index 7d82e04..d540c81 100644
+--- a/pyconnman/interface.py
++++ b/pyconnman/interface.py
+@@ -4,7 +4,7 @@ import dbus
+ import types
+ import pprint
+ 
+-from exceptions import ConnSignalNameNotRecognisedException
++from .exceptions import ConnSignalNameNotRecognisedException
+ 
+ 
+ def translate_to_dbus_type(typeof, value):
+diff --git a/pyconnman/manager.py b/pyconnman/manager.py
+index f6f40a8..03244cc 100644
+--- a/pyconnman/manager.py
++++ b/pyconnman/manager.py
+@@ -1,6 +1,6 @@
+ from __future__ import unicode_literals
+ 
+-from interface import ConnInterface
++from .interface import ConnInterface
+ 
+ 
+ class ConnManager(ConnInterface):
+diff --git a/pyconnman/service.py b/pyconnman/service.py
+index bbccced..c6b9241 100644
+--- a/pyconnman/service.py
++++ b/pyconnman/service.py
+@@ -1,6 +1,6 @@
+ from __future__ import unicode_literals
+ 
+-from interface import ConnInterface
++from .interface import ConnInterface
+ 
+ 
+ class ConnService(ConnInterface):
+diff --git a/pyconnman/technology.py b/pyconnman/technology.py
+index 4777229..d25bad6 100644
+--- a/pyconnman/technology.py
++++ b/pyconnman/technology.py
+@@ -1,6 +1,6 @@
+ from __future__ import unicode_literals
+ 
+-from interface import ConnInterface
++from .interface import ConnInterface
+ 
+ 
+ class ConnTechnology(ConnInterface):
diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb
index e0f3fdd75..32bbe8b80 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb
+++ b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.1.0.bb
@@ -2,4 +2,8 @@ require python-pyconnman.inc
 
 inherit setuptools3
 
+SRC_URI_append = " \
+    file://0001-Import-local-modules-by-relative-path-for-python3-su.patch \
+"
+
 RDEPENDS_${PN} += "python3-dbus python3-pprint"
-- 
2.20.1


