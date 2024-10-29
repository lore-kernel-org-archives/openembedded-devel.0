Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CF4D74947
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 22:13:38 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.1145.1730240014238881144
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Oct 2024 15:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Iu2Hzyc6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241029221331209424b5dc70cd7bdf-ts5g6f@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241029221331209424b5dc70cd7bdf
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 29 Oct 2024 23:13:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ussdnyf35sWBgP1uCfdeJwsklwyC2b5P9n4mFTdtwfM=;
 b=Iu2Hzyc6vPMdtPEZx4k2L1f6ioumiIGakDIFu9AFPVjNGhkO5UvL+Dafh6A9zCDW+0gUib
 k0mdaBFsC9xHMf153o/hgKYp10jAkCUf2gz3Z0kESXOn+U2JOckNOVzuj7Z/vo+/rkcNs31S
 YkTIGBIn12CWwvphnCfckX6Bc5CuwxD3RODCUOBWznc0rOiNOE0695N5oNuRYupwu4TSvbYK
 5S5LD7TnA+kL1BTTw9fSJMTCuy8uXMyou9f/EeV60NdqBqVjNMl1eS9cqCO1knKvW2PAEa3R
 elptUesf1Rwle0kjFwMD6Mifq8miXiaSjjIPR24kJwU9qfZtj7F+KtoA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] nss: patch CVE-2024-6602
Date: Tue, 29 Oct 2024 23:12:38 +0100
Message-Id: <20241029221239.198121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 22:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113336

From: Peter Marko <peter.marko@siemens.com>

Pick the same patch as Debian took for bullseye.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nss/nss/CVE-2024-6602.patch               | 65 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.98.bb       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch b/meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch
new file mode 100644
index 0000000000..f75d822d03
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2024-6602.patch
@@ -0,0 +1,65 @@
+From 7804e99346339bb31f801a2fcba63b6fbd8bca4a Mon Sep 17 00:00:00 2001
+From: John Schanck <jschanck@mozilla.com>
+Date: Mon, 20 May 2024 18:46:14 +0000
+Subject: [PATCH] Bug 1895032 - remove redundant AllocItem implementation.
+ r=nss-reviewers,rrelyea
+
+Differential Revision: https://phabricator.services.mozilla.com/D209476
+
+--HG--
+extra : moz-landing-system : lando
+
+CVE: CVE-2024-6602
+Upstream-Status: Backport [https://hg.mozilla.org/projects/nss/rev/f9b22115dc97be76e388dc9d0dca946dde955e64]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ nss/lib/util/secitem.c | 23 ++++-------------------
+ 1 file changed, 4 insertions(+), 19 deletions(-)
+
+diff --git a/nss/lib/util/secitem.c b/nss/lib/util/secitem.c
+index cd6996178..6ba11a551 100644
+--- a/nss/lib/util/secitem.c
++++ b/nss/lib/util/secitem.c
+@@ -238,35 +238,20 @@ SECITEM_ArenaDupItem(PLArenaPool *arena, const SECItem *from)
+     SECItem *to;
+ 
+     if (from == NULL) {
+-        return (NULL);
++        return NULL;
+     }
+ 
+-    if (arena != NULL) {
+-        to = (SECItem *)PORT_ArenaAlloc(arena, sizeof(SECItem));
+-    } else {
+-        to = (SECItem *)PORT_Alloc(sizeof(SECItem));
+-    }
++    to = SECITEM_AllocItem(arena, NULL, from->len);
+     if (to == NULL) {
+-        return (NULL);
++        return NULL;
+     }
+ 
+-    if (arena != NULL) {
+-        to->data = (unsigned char *)PORT_ArenaAlloc(arena, from->len);
+-    } else {
+-        to->data = (unsigned char *)PORT_Alloc(from->len);
+-    }
+-    if (to->data == NULL) {
+-        PORT_Free(to);
+-        return (NULL);
+-    }
+-
+-    to->len = from->len;
+     to->type = from->type;
+     if (to->len) {
+         PORT_Memcpy(to->data, from->data, to->len);
+     }
+ 
+-    return (to);
++    return to;
+ }
+ 
+ SECStatus
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/nss/nss_3.98.bb b/meta-oe/recipes-support/nss/nss_3.98.bb
index 01501362e2..b3ad6133b6 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
+           file://CVE-2024-6602.patch \
            "
 SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
-- 
2.30.2


