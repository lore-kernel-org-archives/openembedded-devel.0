Return-Path: <nick83ola@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id CC3AF6B076
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:36:23 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id i16so16794103oie.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 02:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kgs9BizitfjDaBbO3n2SKsLJu+95VgTGI50bRAyY3CU=;
	b=dGFlngEIeyLPtgdsqx67CYGlCimkDew/6UpNL+fjV1iFvZbgEXvFoZabUGltWl9tk1
	x/DZuWEdDrA43CB4jF/UKO0B4fU93ZhcBhsCKDoVvMOvfl4Z0kS/7hDaZRpJQxwcfU2U
	rFQEvsX5upUt/O0WwB9JZmfafzkcZ7vKRFeWmYTP04u2czN9aWA7NXu3i8DvlfARbGI+
	BXDzRUBzZSpwOQmMvYgurAb/wHIr5mefHa3LyE35b+OQBLtePirSXypjSdZV8RaX77zD
	9L4Tx1VTbE44CKSNnUvKUNs8lPAq8jPm8qB3YFHBHwRqldQ7zCwQY0WAt/gDkd1HndIs
	Pelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kgs9BizitfjDaBbO3n2SKsLJu+95VgTGI50bRAyY3CU=;
	b=ZML0ct6VIpJnsOkwBaUcIxHYnzVvhLS5Dnd9fl0vxlbEMFSXUCjZ+U6zBYpeaa1Kxl
	iGp3QC6lJDyV+Pr0vHbqAYcYm7qJ9e8qoyRm8ks4FIrBXDfJ9qGUFM1iXv62n8pwcFaQ
	V4/lirCx/VjHX+ZX9dEUgBOQTgAUWxJJ6JLRHfNLnhaSZmm9wChBjOBM4P3fEYEj0kpq
	rVqggqDfxr7Orrf1bZ4+EpeGGziEXki/xlSngLv/35mG80jXP1PxMpAPt0b2jiA6ztjc
	H5ZNUrNhMzxXh2wcFVv7lfxDYpmSlf3UjEKpObe7DKbUTGr4sTXLGEk/RvQpZHP2qsYr
	xACw==
X-Gm-Message-State: APjAAAXA8znZq7jhkp3H/8aNVAB9fJnd6BpTIKi7+7TyGqTeY+/h9shP
	/NDDibvhMakPNAlMVsovC6YyBg2kPN4=
X-Google-Smtp-Source: APXvYqwUH80stqeoiYD30bJYEaZNb4bDAbnmdxN6q8VClQweK6K0XsJQRkJ+wsOO61NLb35svU/Bow==
X-Received: by 2002:aca:b154:: with SMTP id a81mr6855175oif.142.1571823384309; 
	Wed, 23 Oct 2019 02:36:24 -0700 (PDT)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id o5sm716091otl.73.2019.10.23.02.36.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 02:36:23 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 10:36:01 +0100
Message-Id: <20191023093600.30161-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-dbus-next: first commit of dbus-next 0.1.2
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
X-List-Received-Date: Wed, 23 Oct 2019 09:36:24 -0000
Content-Transfer-Encoding: 8bit

From pypi page:

python-dbus-next plans to improve over other DBus libraries for Python in the
following ways:

 * Zero dependencies and pure Python 3.
 * Support for multiple IO backends including asyncio and the GLib main loop.
 * Nonblocking IO suitable for GUI development.
 * Target the latest language features of Python for beautiful services and
   clients.
 * Complete implementation of the DBus type system without ever guessing types.
 * Integration tests for all features of the library.
 * Completely documented public API.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python3-dbus-next/python3-dbus-next_0.1.2.bb      | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dbus-next/python3-dbus-next_0.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-dbus-next/python3-dbus-next_0.1.2.bb b/meta-python/recipes-devtools/python/python3-dbus-next/python3-dbus-next_0.1.2.bb
new file mode 100644
index 000000000..967163ab7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dbus-next/python3-dbus-next_0.1.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A zero-dependency DBus library for Python with asyncio support"
+HOMEPAGE = "https://github.com/acrisci/python-dbus-next"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b32e18a71bcdd072bce21f204629a104"
+
+SRC_URI[md5sum] = "df838d695284dd1775860f9691a8663f"
+SRC_URI[sha256sum] = "a567d845ceed5feac48dda7faeb9ff2571f9a434a3c32b9b363f763e82368762"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


