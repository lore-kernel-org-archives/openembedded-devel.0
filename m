Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F6AC001DC
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.1003.1689139863094317335
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=hqPIaksJ;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75EBD60004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139861;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=pNDiWbXzx3q9GkrmXee6JYw710ON1VtdLaCXEPCFqX8=;
	b=hqPIaksJTSS58zuKcMLiAXlq7xUfp90fMdVUTFlAsyQ8y8/drggnXRivqG5L4uWMG1guOG
	v4MTboJ+i4lTGOPfhkY2NCnz5KGcQQ7k2mf9EKf8Czp0zceEzvbnUjDw9wfJyx4Zg/oPI/
	/TaaeZBUPVs5zW4SeCH0QmTBk14M+8MFIBY6dRFxwuqf+PuvK9oppCTqV2LMhLn/82HqSH
	rJbavR4OMnWk/IB98PjW2zDe378f00G0V/MS0XqeewELKNRZtnsA73Y4Fd+Bksz5H6ihjE
	JEtUn/5q8yAcOpCYzcvo6lTGWPLWToxADEzRJpahDQ2AVKb+3sjWjJQ8gQNAXA==
Content-Type: multipart/mixed; boundary="===============0834325248536166363=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-obd: upgrading to 0.7.2 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103782
Message-Id: <20230712053110.75F6AC001DC@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:10 +0000 (UTC)

--===============0834325248536166363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-obd* to *0.7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-obd-upgrade-0.7.1-0.7.2.patch
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
From 89e26bdfb1c49c9e5624a342517581c9efbea9b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:28:43 -0500
Subject: [PATCH] python3-obd: upgrade 0.7.1 -> 0.7.2

---
 ...hon3-obd_0.7.1.bb => python3-obd_0.7.2.bb} | 37 +++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-obd_0.7.1.bb => python3-obd_0.7.2.bb} (21%)

diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
similarity index 21%
rename from meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
index 0cb1b85e5..d661f9a83 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
@@ -1,9 +1,40 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README.md
+# +++ README.md
+# @@ -60,6 +60,18 @@
+#  -   Time since trouble codes cleared
+#  -   Hybrid battery pack remaining life
+#  -   Engine fuel rate
+# +-   Vehicle Identification Number (VIN)
+# +
+# +Common Issues
+# +-------------
+# +
+# +### Bluetooth OBD-II Adapters
+# +
+# +There are sometimes connection issues when using a Bluetooth OBD-II adapter with some devices (the Raspberry Pi is a common problem). This can be fixed by setting the following arguments when setting up the connection:
+# +
+# +```Python
+# +fast=False, timeout=30
+# +```
+#  
+#  License
+#  -------
+# 
+#
+
 DESCRIPTION = "A python module for handling realtime sensor data from OBD-II vehicle ports"HOMEPAGE = "https://github.com/brendan-w/python-OBD"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://README.md;md5=58ba896fa086c96ad23317cebfeab277"
+LIC_FILES_CHKSUM = "file://README.md;md5=176d0f9ad45c10895296260d426fa862"
 
-SRC_URI[md5sum] = "305efcb6c650db7b9583532355ebeb7c"
-SRC_URI[sha256sum] = "8b81ea5896157b6e861af12e173c10b001cb6cca6ebb04db2c01d326812ad77b"
+SRC_URI[sha256sum] = "20d38c9ded3daad1e8affab3ff367a70788d4f29ac77ab7aacddc6a6d2a43d61"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


--===============0834325248536166363==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-obd-upgrade-0.7.1-0.7.2.patch"

From 89e26bdfb1c49c9e5624a342517581c9efbea9b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:28:43 -0500
Subject: [PATCH] python3-obd: upgrade 0.7.1 -> 0.7.2

---
 ...hon3-obd_0.7.1.bb => python3-obd_0.7.2.bb} | 37 +++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-obd_0.7.1.bb => python3-obd_0.7.2.bb} (21%)

diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
similarity index 21%
rename from meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
index 0cb1b85e5..d661f9a83 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
@@ -1,9 +1,40 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- README.md
+# +++ README.md
+# @@ -60,6 +60,18 @@
+#  -   Time since trouble codes cleared
+#  -   Hybrid battery pack remaining life
+#  -   Engine fuel rate
+# +-   Vehicle Identification Number (VIN)
+# +
+# +Common Issues
+# +-------------
+# +
+# +### Bluetooth OBD-II Adapters
+# +
+# +There are sometimes connection issues when using a Bluetooth OBD-II adapter with some devices (the Raspberry Pi is a common problem). This can be fixed by setting the following arguments when setting up the connection:
+# +
+# +```Python
+# +fast=False, timeout=30
+# +```
+#  
+#  License
+#  -------
+# 
+#
+
 DESCRIPTION = "A python module for handling realtime sensor data from OBD-II vehicle ports"HOMEPAGE = "https://github.com/brendan-w/python-OBD"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://README.md;md5=58ba896fa086c96ad23317cebfeab277"
+LIC_FILES_CHKSUM = "file://README.md;md5=176d0f9ad45c10895296260d426fa862"
 
-SRC_URI[md5sum] = "305efcb6c650db7b9583532355ebeb7c"
-SRC_URI[sha256sum] = "8b81ea5896157b6e861af12e173c10b001cb6cca6ebb04db2c01d326812ad77b"
+SRC_URI[sha256sum] = "20d38c9ded3daad1e8affab3ff367a70788d4f29ac77ab7aacddc6a6d2a43d61"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


--===============0834325248536166363==--

