Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514BEC6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 14:02:20 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.38664.1681912936775753556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Apr 2023 07:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Pcbc2g6J;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20230419140213fd993eed8ad741103a-7xlgpw@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20230419140213fd993eed8ad741103a
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 19 Apr 2023 16:02:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=U7TA3aS5Xl7D/iize09dZS7oOXHgrQGNGmYYML1Ap3U=;
 b=Pcbc2g6JeJGskouCO0hFZbqk+wIhCFaDOG74fY+P/rTKs6AxxaAYpTElUPWildbjeBQzqy
 vofTTamDEdmFQC6Ylf+3l1g5fd1jzdAC/pDK51eO7vBB4CPwF33nx0rQafcMmFLhsy1L6IaS
 aN4ni0MIhRlpZSbI3tcY73S7MatOk=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>,
	Armin Kuster <akuster808@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][master][mickledore][langdale][kirkstone][PATCH 2/2] p7zip: Fix for CVE-2016-9296
Date: Wed, 19 Apr 2023 16:01:09 +0200
Message-Id: <20230419140109.58115-3-peter.marko@siemens.com>
In-Reply-To: <20230419140109.58115-1-peter.marko@siemens.com>
References: <20230419140109.58115-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Apr 2023 14:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102136

From: Virendra Thakur <virendra.thakur@kpit.com>

Add patch to fix CVE-2016-9296

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../p7zip/files/CVE-2016-9296.patch           | 27 +++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
new file mode 100644
index 000000000..98e186cbf
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
@@ -0,0 +1,27 @@
+p7zip: Update CVE-2016-9296 patch URL.
+From: Robert Luberda <robert@debian.org>
+Date: Sat, 19 Nov 2016 08:48:08 +0100
+Subject: Fix nullptr dereference (CVE-2016-9296)
+
+Patch taken from https://sourceforge.net/p/p7zip/bugs/185/
+This patch file taken from Debian's patch set for p7zip
+
+Upstream-Status: Backport [https://sourceforge.net/p/p7zip/bugs/185/]
+CVE: CVE-2016-9296
+
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+Index: p7zip_16.02/CPP/7zip/Archive/7z/7zIn.cpp
+===================================================================
+--- p7zip_16.02.orig/CPP/7zip/Archive/7z/7zIn.cpp
++++ p7zip_16.02/CPP/7zip/Archive/7z/7zIn.cpp
+@@ -1097,7 +1097,8 @@ HRESULT CInArchive::ReadAndDecodePackedS
+       if (CrcCalc(data, unpackSize) != folders.FolderCRCs.Vals[i])
+         ThrowIncorrect();
+   }
+-  HeadersSize += folders.PackPositions[folders.NumPackStreams];
++  if (folders.PackPositions)
++      HeadersSize += folders.PackPositions[folders.NumPackStreams];
+   return S_OK;
+ }
+ 
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 88cb13488..e795482eb 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
            file://change_numMethods_from_bool_to_unsigned.patch \
            file://CVE-2018-5996.patch \
+           file://CVE-2016-9296.patch \
            "
 
 SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
-- 
2.30.2


