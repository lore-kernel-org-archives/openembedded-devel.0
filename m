Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6B3C3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 21:04:53 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.34308.1722805483126421023
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Aug 2024 14:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bVZpgkBS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202408042104395cf03e14ddf962dffc-bt6bpb@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202408042104395cf03e14ddf962dffc
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 04 Aug 2024 23:04:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=epDJOGdYqLUjdgQ+dSdCV2goaxcffzZQhShiC0zSBNk=;
 b=bVZpgkBSfUgqnQH2h0zCBSJVpe2XU/OUUfR16dWTtUxUUnS9wF7yTQVNDWqfYRLNm1mte2
 0AfZdcJP2/cJzUrxXGhpYw/GDAjer+1mOygPX2wOUtf6NGKKNngsagWIsRmLpbdMzCNcRGma
 V/saKNdm26YkSmce+MOl+xXE3oDYOvCUGCvLV/qYIIzKe364JCx9uVPSDCspBXMzSctMw2nU
 D0lFGuq8BNN2HuBK2lh8DFa2VCtJVOz0ssB4h5EGDVeDKlenK31Zr9zPBbhIYAyApa52Emdy
 2T2gXfoPrUAzWnlWip/nVyIHhvXRtp8rRyIdtKBtJ7wM27zsR3EXJtdA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH] squid: patch CVE-2024-37894
Date: Sun,  4 Aug 2024 23:03:51 +0200
Message-Id: <20240804210351.1650471-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Aug 2024 21:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111508

From: Peter Marko <peter.marko@siemens.com>

Reference: https://github.com/squid-cache/squid/security/advisories/GHSA-wgvf-q977-9xjg

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2024-37894.patch          | 36 +++++++++++++++++++
 .../recipes-daemons/squid/squid_6.9.bb        |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2024-37894.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2024-37894.patch b/meta-networking/recipes-daemons/squid/files/CVE-2024-37894.patch
new file mode 100644
index 0000000000..ba12b71d6f
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2024-37894.patch
@@ -0,0 +1,36 @@
+From 920563e7a080155fae3ced73d6198781e8b0ff04 Mon Sep 17 00:00:00 2001
+From: Francesco Chemolli <5175948+kinkie@users.noreply.github.com>
+Date: Sun, 2 Jun 2024 14:41:16 +0000
+Subject: [PATCH] Bug 5378: type mismatch in libTrie (#1830)
+
+TrieNode::add() incorrectly computed an offset of an internal data
+structure, resulting in out-of-bounds memory accesses that could cause
+corruption or crashes.
+
+This bug was discovered and detailed by Joshua Rogers at
+https://megamansec.github.io/Squid-Security-Audit/esi-underflow.html
+where it was filed as "Buffer Underflow in ESI".
+
+CVE: CVE-2024-37894
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/920563e7a080155fae3ced73d6198781e8b0ff04]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/libTrie/TrieNode.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/libTrie/TrieNode.cc b/lib/libTrie/TrieNode.cc
+index 0f991a06d..d417e0f54 100644
+--- a/lib/libTrie/TrieNode.cc
++++ b/lib/libTrie/TrieNode.cc
+@@ -32,7 +32,7 @@ TrieNode::add(char const *aString, size_t theLength, void *privatedata, TrieChar
+     /* We trust that privatedata and existent keys have already been checked */
+ 
+     if (theLength) {
+-        int index = transform ? (*transform)(*aString): *aString;
++        const unsigned char index = transform ? (*transform)(*aString): *aString;
+ 
+         if (!internal[index])
+             internal[index] = new TrieNode;
+-- 
+2.30.2
+
diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb b/meta-networking/recipes-daemons/squid/squid_6.9.bb
index 33d286e122..61fc6027b3 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.9.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://volatiles.03_squid \
            file://0002-squid-make-squid-conf-tests-run-on-target-device.patch \
            file://squid.nm \
+           file://CVE-2024-37894.patch \
            "
 
 SRC_URI[sha256sum] = "1ad72d46e1cb556e9561214f0fb181adb87c7c47927ef69bc8acd68a03f61882"
-- 
2.30.2


