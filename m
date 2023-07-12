Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4B5C001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:32:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.1008.1689139924247373411
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Pn6RAsML;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C3CB1C0009
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139922;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=MLS3IWmZKtxIIpbpWglXHpbOdeqgKIru51v9Cw6QP3Q=;
	b=Pn6RAsMLgl2ALdVYXS9FXeMR/CavbSOJZGUpxKnUeYoN/x9+WLUQhhG2xB3tAzV1VpFhB4
	oB+3ZWb2kOpmgFDxctXgX9F4HDaal2J7Un7x8E71kCVV0YUlfqV1XnaQCYVMWXK40yQRTr
	sYpJVeh0yKFCTIeJi1y1Yr38I/Y4b4i6/9wlH4VTC0m4ha0Hd/nUL4pvaWIJIcwzehJg0S
	iyQVYttciGLAbDWyNCFBCfO2sUZL0sZpAWxv4EOtWel5NAYoaFJl7b2f4IBN69x4pp+1QN
	1RDKWWrJK8/azIGsIv9JzyskjQgT/+318Gmuo9W18O25hIERiPw7d8GcTwwvEQ==
Content-Type: multipart/mixed; boundary="===============8701343552056380584=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-xstatic-font-awesome: upgrading to 6.2.1.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103818
Message-Id: <20230712053210.6B4B5C001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:32:10 +0000 (UTC)

--===============8701343552056380584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-xstatic-font-awesome* to *6.2.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-xstatic-font-awesome-upgrade-4.7.0.0-6.2.1.1.patch
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
From d86575d6e1b79864e88efcfd498df7fbae9d57c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Wed, 12 Jul 2023 00:23:02 -0500
Subject: [PATCH] python3-xstatic-font-awesome: upgrade 4.7.0.0 -> 6.2.1.1

---
 ...> python3-xstatic-font-awesome_6.2.1.1.bb} | 65 ++++++++++++++++++-
 1 file changed, 62 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xstatic-font-awesome_4.7.0.0.bb => python3-xstatic-font-awesome_6.2.1.1.bb} (12%)

diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
similarity index 12%
rename from meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
rename to meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
index ccd1cd787..a7b7a3e5f 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
@@ -1,13 +1,72 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- PKG-INFO
+# +++ PKG-INFO
+# @@ -1,24 +1,25 @@
+# -Metadata-Version: 1.0
+# +Metadata-Version: 2.1
+#  Name: XStatic-Font-Awesome
+# -Version: 4.7.0.0
+# -Summary: Font-Awesome 4.7.0 (XStatic packaging standard)
+# -Home-page: https://fortawesome.github.io/Font-Awesome/
+# -Author: Rob Cresswell
+# -Author-email: robert.cresswell@outlook.com
+# -License: SIL OFL 1.1
+# -Description: XStatic-Font-Awesome
+# -        --------------
+# -        
+# -        Font Awesome icons packaged for setuptools (easy_install) / pip.
+# -        
+# -        This package is intended to be used by **any** project that needs these files.
+# -        
+# -        It intentionally does **not** provide any extra code except some metadata
+# -        **nor** has any extra requirements. You MAY use some minimal support code from
+# -        the XStatic base package, if you like.
+# -        
+# -        You can find more info about the xstatic packaging way in the package `XStatic`.
+# -        
+# -        
+# +Version: 6.2.1.1
+# +Summary: Font-Awesome 6.2.1 (XStatic packaging standard)
+# +Home-page: https://github.com/FortAwesome/Font-Awesome
+# +Maintainer: Reimar Bauer
+# +Maintainer-email: rb.proj@gmail.com
+# +License: (same as Font-Awesome)
+# +Project-URL: Repository, https://github.com/xstatic-py/xstatic-font-awesome
+#  Keywords: font_awesome xstatic
+#  Platform: any
+# +
+# +XStatic-Font-Awesome
+# +--------------------
+# +
+# +Font Awesome packaged for setuptools (easy_install) / pip.
+# +
+# +This package is intended to be used by **any** project that needs these files.
+# +
+# +It intentionally does **not** provide any extra code except some metadata
+# +**nor** has any extra requirements. You MAY use some minimal support code from
+# +the XStatic base package, if you like.
+# +
+# +You can find more info about the xstatic packaging way in the package `XStatic`.
+# +
+# 
+#
+
 DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=313d021898694cd2b0ea6508bdfe51a2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f1a2fe131dcb2fc6243c26cf05ecdb36"
 
 PYPI_PACKAGE = "XStatic-Font-Awesome"
 
-SRC_URI[md5sum] = "141a0e9a7e21e82f922573a00ae0c166"
-SRC_URI[sha256sum] = "e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b685816d220e685f6c"
+SRC_URI[sha256sum] = "f075871096128638f2e1539020d8227754c3d885dd68e7ee6de9a01235076828"
 
 DEPENDS += " \
     ${PYTHON_PN}-xstatic \
-- 
2.25.1


--===============8701343552056380584==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-xstatic-font-awesome-upgrade-4.7.0.0-6.2.1.1.patch"

From d86575d6e1b79864e88efcfd498df7fbae9d57c5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Wed, 12 Jul 2023 00:23:02 -0500
Subject: [PATCH] python3-xstatic-font-awesome: upgrade 4.7.0.0 -> 6.2.1.1

---
 ...> python3-xstatic-font-awesome_6.2.1.1.bb} | 65 ++++++++++++++++++-
 1 file changed, 62 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xstatic-font-awesome_4.7.0.0.bb => python3-xstatic-font-awesome_6.2.1.1.bb} (12%)

diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
similarity index 12%
rename from meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
rename to meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
index ccd1cd787..a7b7a3e5f 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_6.2.1.1.bb
@@ -1,13 +1,72 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- PKG-INFO
+# +++ PKG-INFO
+# @@ -1,24 +1,25 @@
+# -Metadata-Version: 1.0
+# +Metadata-Version: 2.1
+#  Name: XStatic-Font-Awesome
+# -Version: 4.7.0.0
+# -Summary: Font-Awesome 4.7.0 (XStatic packaging standard)
+# -Home-page: https://fortawesome.github.io/Font-Awesome/
+# -Author: Rob Cresswell
+# -Author-email: robert.cresswell@outlook.com
+# -License: SIL OFL 1.1
+# -Description: XStatic-Font-Awesome
+# -        --------------
+# -        
+# -        Font Awesome icons packaged for setuptools (easy_install) / pip.
+# -        
+# -        This package is intended to be used by **any** project that needs these files.
+# -        
+# -        It intentionally does **not** provide any extra code except some metadata
+# -        **nor** has any extra requirements. You MAY use some minimal support code from
+# -        the XStatic base package, if you like.
+# -        
+# -        You can find more info about the xstatic packaging way in the package `XStatic`.
+# -        
+# -        
+# +Version: 6.2.1.1
+# +Summary: Font-Awesome 6.2.1 (XStatic packaging standard)
+# +Home-page: https://github.com/FortAwesome/Font-Awesome
+# +Maintainer: Reimar Bauer
+# +Maintainer-email: rb.proj@gmail.com
+# +License: (same as Font-Awesome)
+# +Project-URL: Repository, https://github.com/xstatic-py/xstatic-font-awesome
+#  Keywords: font_awesome xstatic
+#  Platform: any
+# +
+# +XStatic-Font-Awesome
+# +--------------------
+# +
+# +Font Awesome packaged for setuptools (easy_install) / pip.
+# +
+# +This package is intended to be used by **any** project that needs these files.
+# +
+# +It intentionally does **not** provide any extra code except some metadata
+# +**nor** has any extra requirements. You MAY use some minimal support code from
+# +the XStatic base package, if you like.
+# +
+# +You can find more info about the xstatic packaging way in the package `XStatic`.
+# +
+# 
+#
+
 DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=313d021898694cd2b0ea6508bdfe51a2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f1a2fe131dcb2fc6243c26cf05ecdb36"
 
 PYPI_PACKAGE = "XStatic-Font-Awesome"
 
-SRC_URI[md5sum] = "141a0e9a7e21e82f922573a00ae0c166"
-SRC_URI[sha256sum] = "e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b685816d220e685f6c"
+SRC_URI[sha256sum] = "f075871096128638f2e1539020d8227754c3d885dd68e7ee6de9a01235076828"
 
 DEPENDS += " \
     ${PYTHON_PN}-xstatic \
-- 
2.25.1


--===============8701343552056380584==--

