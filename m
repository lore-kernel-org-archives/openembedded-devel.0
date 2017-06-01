Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4387C77D2A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:43:09 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 9so31957570pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KOfidlRA4CduCMXghZfWYlj17ZbrNWsuVB5QRhg872I=;
	b=uUyKvvAM4gqHH1xRrtN6Aqz6pigBklloPIAErO4WMX7pUqOivYT1C8SVoAaAdfPJBh
	kY8KxmqNmM06Tc4wBWB4E/API5QhsouxclJlzwkHHMa771fZKdiSa1lcK36xKTAch3Dt
	31MRGzSak24ZTGeaXEc/mGDJEVPrVpGKf0ZX78SV0zbaeBCD/jVYlU2O7VFYzKaWuBQa
	36gbbRFuoc0IZ8B/fKNySi9/knD8TdStZPm8ahmPK7NAqX5PK8CDnDgVVN3hz2ROMbX1
	f6x8ff1mkoa7SBH7R0CchlqQ1zRb6XBpmxOJyyKFCqOeOaN8bXMsri18OhK8te+cT6tM
	Gl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KOfidlRA4CduCMXghZfWYlj17ZbrNWsuVB5QRhg872I=;
	b=THmCXxwOKH8agXCxsyXJE1C/J5CC4wMktJpkMvr9t6BlszhRb4Zdg1MrqEONL66QEe
	XSsC3shPHF0w9KnbsyhD9TINqrKsdvm9Dt53ZKx2eaPq+/70/qdBX1R++0fvHlZseh6/
	awEW8BXNpj+XHmzOaOc5E039W7sh8Iymwp0DtQ0CbatILc3D2FsBL29LK9BuYxHG+7On
	hovWoEZ2bCaq8XPr7yeWl04zHI1b4U8Wgo8eA2hCLOJ8OSctqqE+A87norcoyfqmdVYO
	Jy6tRcve9wIpCyMoc/qUlMYPp0s6v6OV+kK54z1/tGm7P6q4wWKlKtWgdQ4Erhmsge+x
	bWhw==
X-Gm-Message-State: AODbwcAKA5kpRB9fQOXPRkl6TWxADQIg2PQiWKP57kfYg3HV5WxfHc5+
	57aBwyqq5neEBXFZmLfw7Q==
X-Received: by 10.98.201.15 with SMTP id k15mr1913195pfg.14.1496335390496;
	Thu, 01 Jun 2017 09:43:10 -0700 (PDT)
Received: from tyrael.ni.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	19sm30635779pfz.39.2017.06.01.09.43.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 09:43:09 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 09:42:49 -0700
Message-Id: <1496335374-25575-3-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
References: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 3/8] python-msgpack: Add support for python3
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
X-List-Received-Date: Thu, 01 Jun 2017 16:43:09 -0000

Extend recipe to support python3

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 meta-python/recipes-devtools/python/python-msgpack.inc       |  9 +++++++++
 meta-python/recipes-devtools/python/python-msgpack_0.4.8.bb  | 11 ++---------
 meta-python/recipes-devtools/python/python3-msgpack_0.4.8.bb |  2 ++
 3 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-msgpack.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-msgpack_0.4.8.bb

diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
new file mode 100644
index 0000000..228ce59
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-msgpack.inc
@@ -0,0 +1,9 @@
+SUMMARY = "MessagePack (de)serializer"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
+
+SRC_URI[md5sum] = "dcd854fb41ee7584ebbf35e049e6be98"
+SRC_URI[sha256sum] = "1a2b19df0f03519ec7f19f826afb935b202d8979b0856c6fb3dc28955799f886"
+
+PYPI_PACKAGE = "msgpack-python"
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.8.bb b/meta-python/recipes-devtools/python/python-msgpack_0.4.8.bb
index 8a0ad8f..2c2c8f2 100644
--- a/meta-python/recipes-devtools/python/python-msgpack_0.4.8.bb
+++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.8.bb
@@ -1,9 +1,2 @@
-SUMMARY = "MessagePack (de)serializer"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
-
-SRC_URI[md5sum] = "dcd854fb41ee7584ebbf35e049e6be98"
-SRC_URI[sha256sum] = "1a2b19df0f03519ec7f19f826afb935b202d8979b0856c6fb3dc28955799f886"
-
-PYPI_PACKAGE = "msgpack-python"
-inherit pypi setuptools
+require python-msgpack.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-msgpack_0.4.8.bb b/meta-python/recipes-devtools/python/python3-msgpack_0.4.8.bb
new file mode 100644
index 0000000..096d7dd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-msgpack_0.4.8.bb
@@ -0,0 +1,2 @@
+require python-msgpack.inc
+inherit setuptools3
-- 
2.7.4


