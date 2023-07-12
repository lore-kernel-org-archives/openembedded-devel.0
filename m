Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65451C001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.1007.1689139868237399961
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=JM0T88Tn;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9936E40005
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139866;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=NQeZx6/ONNGBmdYQHHLVA/tVlR6GYOvvDR3BAsEFstQ=;
	b=JM0T88Tnzglt1z9L9sUVkLHFhRcn/wGwsTpr2PRiu/ggjbLnCoCpm0NVP5Mtl5nPxF7oyc
	NIB9PbI+FoRV+DzTtj7Yji7eQ/Ynu1DJ4+Prpc66cI0OJf1qquxgAVf7KdD60GErH5pjYi
	tXsV8J2yB7+Y0y9bwPa2cVYiUgtAU1Z8maJo6IpAKB8wZFKnEa8VRaMUvMzBi/URxRjirN
	9gsMrxlRfJFaytM8T6keL/LYUnkeuZYPntk6Vhyq4OHY7k6CCMHkoSeBpBSFeJadjDD7Mk
	/Uz+5R9CiFG6dGjkdmPkW+he5b6iZbQ2iIDG8eu1n+9rnnQdL6Epq5O41tgFEg==
Content-Type: multipart/mixed; boundary="===============3185006927024215825=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-path: upgrading to 16.7.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103785
Message-Id: <20230712053110.65451C001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:10 +0000 (UTC)

--===============3185006927024215825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-path* to *16.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-path-upgrade-16.6.0-16.7.1.patch
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
From 63e7b64281303a5a1791d6cd08e1f3c4ed240775 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:56:42 -0500
Subject: [PATCH] python3-path: upgrade 16.6.0 -> 16.7.1

---
 ...-path_16.6.0.bb => python3-path_16.7.1.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-path_16.6.0.bb => python3-path_16.7.1.bb} (43%)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb b/meta-python/recipes-devtools/python/python3-path_16.7.1.bb
similarity index 43%
rename from meta-python/recipes-devtools/python/python3-path_16.6.0.bb
rename to meta-python/recipes-devtools/python/python3-path_16.7.1.bb
index 095f906f0..1ef307085 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.7.1.bb
@@ -1,8 +1,27 @@
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
+# @@ -1,5 +1,3 @@
+# -Copyright Jason R. Coombs
+# -
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to
+#  deal in the Software without restriction, including without limitation the
+# 
+#
+
 SUMMARY = "A module wrapper for os.path"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "bea3816e1d54f4e33aac78d2031a0b0ed2f95e69db85b45d51f17df97071da69"
+SRC_URI[sha256sum] = "2b477f5887033f3cbea1cfd8553ee6a6a498eb2540a19f4aa082822aadcea30a"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.25.1


--===============3185006927024215825==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-path-upgrade-16.6.0-16.7.1.patch"

From 63e7b64281303a5a1791d6cd08e1f3c4ed240775 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Tue, 11 Jul 2023 20:56:42 -0500
Subject: [PATCH] python3-path: upgrade 16.6.0 -> 16.7.1

---
 ...-path_16.6.0.bb => python3-path_16.7.1.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-path_16.6.0.bb => python3-path_16.7.1.bb} (43%)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb b/meta-python/recipes-devtools/python/python3-path_16.7.1.bb
similarity index 43%
rename from meta-python/recipes-devtools/python/python3-path_16.6.0.bb
rename to meta-python/recipes-devtools/python/python3-path_16.7.1.bb
index 095f906f0..1ef307085 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.7.1.bb
@@ -1,8 +1,27 @@
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
+# @@ -1,5 +1,3 @@
+# -Copyright Jason R. Coombs
+# -
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to
+#  deal in the Software without restriction, including without limitation the
+# 
+#
+
 SUMMARY = "A module wrapper for os.path"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "bea3816e1d54f4e33aac78d2031a0b0ed2f95e69db85b45d51f17df97071da69"
+SRC_URI[sha256sum] = "2b477f5887033f3cbea1cfd8553ee6a6a498eb2540a19f4aa082822aadcea30a"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.25.1


--===============3185006927024215825==--

