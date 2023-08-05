Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFECEB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.2182.1691221189042828506
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=eHvcI/dU;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.200, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6622820004
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221187;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=034C6r8ijrfmwTIhtgoCk4lsKJY7nBJgO7PhuchZTxk=;
	b=eHvcI/dUyao89p843fhH/4Q3hBWPxC37CErCbtYZARjcWW59/RWqq2XLxBERwS63CLgjsb
	XnWmMsmE1j1tlhBg5bOEFIJm+96tgU5RgiF2Jxne6uhp/g0sxUqHJejupDLdInpoc4Myuk
	j0Oawcx4VSKV/g2HSlTw0tb/RddeVcD3mdb4poNMyBBysTb2bjLi0w80xmSoAWZg5iVxfj
	rG74FgqbyrwQFTWeiUI3qUPF0/lkpAQfBd5katYhI5OUNIpn4i2N+QHrPq6ca90lKxInfR
	p5jiiy4quX2chddBOHRKAi4oBLkz12qNwMuIA501Txzc3pcQX485k3yrUTVh7Q==
Content-Type: multipart/mixed; boundary="===============1995300007789525074=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-wxgtk4: upgrading to 4.2.1 SUCCEEDED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104278
Message-Id: <20230805073949.9CFECEB64DD@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:49 +0000 (UTC)

--===============1995300007789525074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wxgtk4* to *4.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wxgtk4-upgrade-4.2.0-4.2.1.patch
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
From 3b6c6d66eb6ea8fed2ee2c23558b9e0fa66fbd5b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:09:06 -0500
Subject: [PATCH] python3-wxgtk4: upgrade 4.2.0 -> 4.2.1

---
 ...eplace-deprecated-inspect.getargspec.patch | 65 -------------------
 ...xgtk4_4.2.0.bb => python3-wxgtk4_4.2.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 67 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
 rename meta-python/recipes-devtools/python3-wxgtk4/{python3-wxgtk4_4.2.0.bb => python3-wxgtk4_4.2.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
deleted file mode 100644
index 9bec4c5ba..000000000
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Backport [https://github.com/wxWidgets/Phoenix/commit/9986a0d5]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 9986a0d5c24b5d45ddf571d60351f68765a8a9be Mon Sep 17 00:00:00 2001
-From: Scott Talbert <swt@techie.net>
-Date: Mon, 8 Aug 2022 22:35:58 -0400
-Subject: [PATCH] pypubsub: Replace deprecated inspect.getargspec
-
-inspect.getargspec was removed in Python 3.11.  This is a backport of:
-https://github.com/schollii/pypubsub/commit/089c7a73f85c76a3aa22e4b10c71db1bf65a8637
----
- wx/lib/pubsub/core/callables.py | 23 +++++++++++++++--------
- 1 file changed, 15 insertions(+), 8 deletions(-)
-
-diff --git a/wx/lib/pubsub/core/callables.py b/wx/lib/pubsub/core/callables.py
-index 65eb1ebe..7e798c54 100644
---- a/wx/lib/pubsub/core/callables.py
-+++ b/wx/lib/pubsub/core/callables.py
-@@ -12,7 +12,7 @@ CallArgsInfo regarding its autoTopicArgName data member.
- 
- """
- 
--from inspect import getargspec, ismethod, isfunction
-+from inspect import ismethod, isfunction, signature, Parameter
- 
- from .. import py2and3
- 
-@@ -133,19 +133,26 @@ class CallArgsInfo:
-         self.autoTopicArgName = None."""
- 
-         #args, firstArgIdx, defaultVals, acceptsAllKwargs
--        (allParams, varParamName, varOptParamName, defaultVals) = getargspec(func)
--        if defaultVals is None:
--            defaultVals = []
--        else:
--            defaultVals = list(defaultVals)
-+        allParams = []
-+        defaultVals = []
-+        varParamName = None
-+        varOptParamName = None
-+        for argName, param in signature(func).parameters.items():
-+            if param.default != Parameter.empty:
-+                defaultVals.append(param.default)
-+            if param.kind == Parameter.VAR_POSITIONAL:
-+                varParamName = argName
-+            elif param.kind == Parameter.VAR_KEYWORD:
-+                varOptParamName = argName
-+            else:
-+                allParams.append(argName)
- 
-         self.acceptsAllKwargs      = (varOptParamName is not None)
-         self.acceptsAllUnnamedArgs = (varParamName    is not None)
--
-         self.allParams = allParams
--        del self.allParams[0:firstArgIdx] # does nothing if firstArgIdx == 0
- 
-         self.numRequired = len(self.allParams) - len(defaultVals)
-+        assert len(self.allParams) >= len(defaultVals)
-         assert self.numRequired >= 0
- 
-         # if listener wants topic, remove that arg from args/defaultVals
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
rename to meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
index bf87b0a73..fb011cb71 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
@@ -13,10 +13,9 @@ PYPI_PACKAGE = "wxPython"
 SRC_URI += "file://add-back-option-build-base.patch \
            file://wxgtk-fixup-build-scripts.patch \
            file://not-overwrite-cflags-cxxflags.patch \
-           file://0001-pypubsub-Replace-deprecated-inspect.getargspec.patch \
            file://0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch \
            "
-SRC_URI[sha256sum] = "663cebc4509d7e5d113518865fe274f77f95434c5d57bc386ed58d65ceed86c7"
+SRC_URI[sha256sum] = "e48de211a6606bf072ec3fa778771d6b746c00b7f4b970eb58728ddf56d13d5c"
 
 S = "${WORKDIR}/wxPython-${PV}"
 
-- 
2.25.1


--===============1995300007789525074==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-wxgtk4-upgrade-4.2.0-4.2.1.patch"

From 3b6c6d66eb6ea8fed2ee2c23558b9e0fa66fbd5b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@moto-timo.dev>
Date: Sat, 5 Aug 2023 02:09:06 -0500
Subject: [PATCH] python3-wxgtk4: upgrade 4.2.0 -> 4.2.1

---
 ...eplace-deprecated-inspect.getargspec.patch | 65 -------------------
 ...xgtk4_4.2.0.bb => python3-wxgtk4_4.2.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 67 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
 rename meta-python/recipes-devtools/python3-wxgtk4/{python3-wxgtk4_4.2.0.bb => python3-wxgtk4_4.2.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
deleted file mode 100644
index 9bec4c5ba..000000000
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Backport [https://github.com/wxWidgets/Phoenix/commit/9986a0d5]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 9986a0d5c24b5d45ddf571d60351f68765a8a9be Mon Sep 17 00:00:00 2001
-From: Scott Talbert <swt@techie.net>
-Date: Mon, 8 Aug 2022 22:35:58 -0400
-Subject: [PATCH] pypubsub: Replace deprecated inspect.getargspec
-
-inspect.getargspec was removed in Python 3.11.  This is a backport of:
-https://github.com/schollii/pypubsub/commit/089c7a73f85c76a3aa22e4b10c71db1bf65a8637
----
- wx/lib/pubsub/core/callables.py | 23 +++++++++++++++--------
- 1 file changed, 15 insertions(+), 8 deletions(-)
-
-diff --git a/wx/lib/pubsub/core/callables.py b/wx/lib/pubsub/core/callables.py
-index 65eb1ebe..7e798c54 100644
---- a/wx/lib/pubsub/core/callables.py
-+++ b/wx/lib/pubsub/core/callables.py
-@@ -12,7 +12,7 @@ CallArgsInfo regarding its autoTopicArgName data member.
- 
- """
- 
--from inspect import getargspec, ismethod, isfunction
-+from inspect import ismethod, isfunction, signature, Parameter
- 
- from .. import py2and3
- 
-@@ -133,19 +133,26 @@ class CallArgsInfo:
-         self.autoTopicArgName = None."""
- 
-         #args, firstArgIdx, defaultVals, acceptsAllKwargs
--        (allParams, varParamName, varOptParamName, defaultVals) = getargspec(func)
--        if defaultVals is None:
--            defaultVals = []
--        else:
--            defaultVals = list(defaultVals)
-+        allParams = []
-+        defaultVals = []
-+        varParamName = None
-+        varOptParamName = None
-+        for argName, param in signature(func).parameters.items():
-+            if param.default != Parameter.empty:
-+                defaultVals.append(param.default)
-+            if param.kind == Parameter.VAR_POSITIONAL:
-+                varParamName = argName
-+            elif param.kind == Parameter.VAR_KEYWORD:
-+                varOptParamName = argName
-+            else:
-+                allParams.append(argName)
- 
-         self.acceptsAllKwargs      = (varOptParamName is not None)
-         self.acceptsAllUnnamedArgs = (varParamName    is not None)
--
-         self.allParams = allParams
--        del self.allParams[0:firstArgIdx] # does nothing if firstArgIdx == 0
- 
-         self.numRequired = len(self.allParams) - len(defaultVals)
-+        assert len(self.allParams) >= len(defaultVals)
-         assert self.numRequired >= 0
- 
-         # if listener wants topic, remove that arg from args/defaultVals
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
rename to meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
index bf87b0a73..fb011cb71 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.1.bb
@@ -13,10 +13,9 @@ PYPI_PACKAGE = "wxPython"
 SRC_URI += "file://add-back-option-build-base.patch \
            file://wxgtk-fixup-build-scripts.patch \
            file://not-overwrite-cflags-cxxflags.patch \
-           file://0001-pypubsub-Replace-deprecated-inspect.getargspec.patch \
            file://0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch \
            "
-SRC_URI[sha256sum] = "663cebc4509d7e5d113518865fe274f77f95434c5d57bc386ed58d65ceed86c7"
+SRC_URI[sha256sum] = "e48de211a6606bf072ec3fa778771d6b746c00b7f4b970eb58728ddf56d13d5c"
 
 S = "${WORKDIR}/wxPython-${PV}"
 
-- 
2.25.1


--===============1995300007789525074==--

