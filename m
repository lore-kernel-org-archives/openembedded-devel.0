Return-Path: <rjpdasilva@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CE3BB786BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 15:35:43 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f206so4089237wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=p+K+l44UlwoNqlU90LAWFSfEBU8fNwC3i+GLjM6Jhio=;
	b=MR0kWS+dzXFLoBsmUDetEDGzsI1wb7WVCFh+QvCRSqh9jP0ILwT+oHCokju2nMxyqj
	efj7IgFFbbe7l7wfn8oEQ58VOuvA4hHkBeBsTnKg94+P9gCZn9w7VSKKlVTe0jzeww3x
	G1tCGZbvvXJ74EuT4K0yhaE5f+Wnkd+pvo223m71COv61+XRqyjRvwap5LpMZ4VRYfAq
	IvsKbi07Vr8xoXe8z9DTG06FJTWpRtHHNSV1LHLIovGjQIclNyFcmQ2SxWyWLLjuzpnj
	D3KHfmD12Mqv11cnvKkepEbVLfofBpkDtY4oNdsd50p4EL2lUu2V9o3LHR8H++9nNtVG
	5nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p+K+l44UlwoNqlU90LAWFSfEBU8fNwC3i+GLjM6Jhio=;
	b=CwtaJnDG3sdJAqRkTw9L9hjjfKOMouh6sHknaa6+RXrn9mTJPHMqPIlOWjQ5QHxjhr
	QRwuRyd93FzHYqLVXoDKPZKiFDjY+ujvODRtRWK26PHnzsPGXLWdS5I2W4oeLxg9iR82
	sDPpl/paIMBWBaY7IOTbPlYEpJTI9GvA+Ts2il/dVYzcRv5xZtoUp4MnnXYqjr6sFb7D
	dNDs4V1zvjmIg0b3np3uYBja55xhCMcM2QOeLeHMam+i0T2//+dwBMy8EiLngrcnQr5S
	gscDrLUSzHoY9JFZzK67eXhUMotEAMabDSqlFEQafl+sGd9IF6O6YWJcd2JzRo4b9+Bh
	zMfA==
X-Gm-Message-State: AKGB3mLQedySIA2femkN1jSREBmgz2LkfuhCiyscCdQdG0g+OY18/haS
	mvwrTAdePqLEa4SkXYV9ywiSlA==
X-Google-Smtp-Source: ACJfBotT1iGPDzenWjZMhNSVqvhk6zn8+DXMd0wgjR9LqLPhkdQNHn9xxnyCD0VNQKPL4trZ3RjzxQ==
X-Received: by 10.28.126.201 with SMTP id z192mr4807903wmc.121.1515080144188; 
	Thu, 04 Jan 2018 07:35:44 -0800 (PST)
Received: from localhost.localdomain ([2001:8a0:6606:9100:7f03:4efc:e311:2e44])
	by smtp.googlemail.com with ESMTPSA id
	o107sm7402735wrc.63.2018.01.04.07.35.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 07:35:43 -0800 (PST)
From: Ricardo Silva <rjpdasilva@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 15:35:20 +0000
Message-Id: <20180104153520.20167-1-rjpdasilva@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-python][PATCH] pyinotify: Fix support for different python versions
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
X-List-Received-Date: Thu, 04 Jan 2018 15:35:44 -0000

The runtime dependencies for pyinotify are defined in
python-pyinotify.inc file, which gets included from both the python2 and
the python3 recipes for pyinotify.

Since the include file is used for both python2 and python3 recipes, it
must use the '${PYTHON_PN}-' prefix instead of just 'python-' for
listing the dependencies in RDEPENDS, otherwise it is forcing python2
modules to be selected from a python3 recipe, so fix that.

For example, use '${PYTHON_PN}-threading' instead of 'python-threading'
for specifying a dependency from the 'threading' module.

While at it, also use line separation and indentation on RDEPENDS for
better readability.

Signed-off-by: Ricardo Silva <rjpdasilva@gmail.com>
---
 meta-python/recipes-devtools/python/python-pyinotify.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyinotify.inc b/meta-python/recipes-devtools/python/python-pyinotify.inc
index 0168f1a87..7fcbb1850 100644
--- a/meta-python/recipes-devtools/python/python-pyinotify.inc
+++ b/meta-python/recipes-devtools/python/python-pyinotify.inc
@@ -2,7 +2,13 @@ DESCRIPTION = "Python pyinotify: Linux filesystem events monitoring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab173cade7965b411528464589a08382"
 
-RDEPENDS_${PN} += "python-threading python-io python-subprocess python-misc python-shell"
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-shell \
+"
 
 SRC_URI[md5sum] = "8e580fa1ff3971f94a6f81672b76c406"
 SRC_URI[sha256sum] = "9c998a5d7606ca835065cdabc013ae6c66eb9ea76a00a1e3bc6e0cfe2b4f71f4"
-- 
2.15.1


