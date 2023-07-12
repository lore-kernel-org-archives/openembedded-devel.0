Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C876C001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:32:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1002.1689139919277536354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=c3X04bhz;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A16801BF20A
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139917;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=3SzuLYMNkV2FKqjaKiMXEXlVoi0fQkddx9eCOyUhAsw=;
	b=c3X04bhzcRkNJQ98rFWAwz5y2iZ/qlPTzkk6LDyDxNie3ybpe53pKdU8ImFP4a9lbfgqf2
	mbC9ytRCWlIwhPWM6ZeYJxq9hKcokeJ+teqvz1BSca1Urrp8cYyg2Aolk6Bgs6JkaC/wbg
	UfE93Er3lIF3hIWM0knle5B67g8OEef11yFHd2KT3V1dOFo2LbiSwfF6jXSrL41NBoD9rl
	AAOeBsj6lEMalYr5oFYSs7BFPRNZlbzSZjNL/86cdfza30j8hwklDZiaUXuO6eE4+GA9+d
	qmLQ5xW93zjYkvuflDsdkxqzz2+puCSTRFmYXRf8VZWRWimaCaXYF/t5pls+tQ==
Content-Type: multipart/mixed; boundary="===============2513484993049621563=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-websocket-client: upgrading to 1.6.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103815
Message-Id: <20230712053200.6C876C001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:32:00 +0000 (UTC)

--===============2513484993049621563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-websocket-client* to *1.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-websocket-client-upgrade-1.5.3-1.6.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From f884d9dc9904a9d67d4afce1f8bac8953e6a8a5b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:37:38 -0500
Subject: [PATCH] python3-websocket-client: upgrade 1.5.3 -> 1.6.1

---
 ...3.bb => python3-websocket-client_1.6.1.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.5.3.bb => python3-websocket-client_1.6.1.bb} (30%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.6.1.bb
similarity index 30%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.6.1.bb
index f7650f9bb..1a4fab2d0 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.6.1.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -187,7 +187,7 @@
+#        same "printed page" as the copyright notice for easier
+#        identification within third-party archives.
+#  
+# -   Copyright 2022 engn33r
+# +   Copyright 2023 engn33r
+#  
+#     Licensed under the Apache License, Version 2.0 (the "License");
+#     you may not use this file except in compliance with the License.
+# 
+#
+
 SUMMARY = "websocket client for python"
 DESCRIPTION = "\
 websocket-client module is WebSocket client for python. \
@@ -5,9 +27,9 @@ This provide the low level APIs for WebSocket. All APIs \
 are the synchronous functions."
 HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6eae3bb7247ccb2c3a087ea8de759c01"
 
-SRC_URI[sha256sum] = "b96f3bce3e54e3486ebe6504bc22bd4c140392bd2eb71764db29be8f2639aa65"
+SRC_URI[sha256sum] = "c951af98631d24f8df89ab1019fc365f2227c0892f12fd150e935607c79dd0dd"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============2513484993049621563==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-websocket-client-upgrade-1.5.3-1.6.1.patch"

From f884d9dc9904a9d67d4afce1f8bac8953e6a8a5b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 23:37:38 -0500
Subject: [PATCH] python3-websocket-client: upgrade 1.5.3 -> 1.6.1

---
 ...3.bb => python3-websocket-client_1.6.1.bb} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.5.3.bb => python3-websocket-client_1.6.1.bb} (30%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.6.1.bb
similarity index 30%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.6.1.bb
index f7650f9bb..1a4fab2d0 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.6.1.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -187,7 +187,7 @@
+#        same "printed page" as the copyright notice for easier
+#        identification within third-party archives.
+#  
+# -   Copyright 2022 engn33r
+# +   Copyright 2023 engn33r
+#  
+#     Licensed under the Apache License, Version 2.0 (the "License");
+#     you may not use this file except in compliance with the License.
+# 
+#
+
 SUMMARY = "websocket client for python"
 DESCRIPTION = "\
 websocket-client module is WebSocket client for python. \
@@ -5,9 +27,9 @@ This provide the low level APIs for WebSocket. All APIs \
 are the synchronous functions."
 HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6eae3bb7247ccb2c3a087ea8de759c01"
 
-SRC_URI[sha256sum] = "b96f3bce3e54e3486ebe6504bc22bd4c140392bd2eb71764db29be8f2639aa65"
+SRC_URI[sha256sum] = "c951af98631d24f8df89ab1019fc365f2227c0892f12fd150e935607c79dd0dd"
 
 inherit pypi setuptools3
 
-- 
2.25.1


--===============2513484993049621563==--

