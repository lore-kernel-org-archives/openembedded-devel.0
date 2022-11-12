Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768C3C433FE
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 13:10:09 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.2382.1668258599531237297
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 05:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ij4yeGZe;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668258600;
  x=1699794600;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Q0KzJ2bu2qhPl42oVGIqblvw1Uve+zy90v3Y2+ZKFlE=;
  b=ij4yeGZeN4EqBz7BM+afuBWqNLMYSu8n2PZZYtoDoXy6pqzyKNRMb5B9
   9kqsP88/8pauOR7wkOgx948hnRKmY0pFf8YoPoDi0DF2jrUyiNjz4Lam4
   ei7N129yFSlOgo2zh2G2pR4QY+kTYrA43yYIxPwKMxpb5xXA8rFrQUe0v
   chPA8x3/KI/AjB6mPn40d4ilDFPciQ+pLYdtjA3TZVbVptYUblu53XZAb
   dLWRYUq4cKovbDyij+fnKcgBdkKmaHXx00d7rG4s12CRkZzJMJEHbjqTp
   Z/xB3R8tckxGXO2luk7Sh/pr2LM2No4cG+J2DBZuYnMy+y9V8h6JcRJh6
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][langdale][PATCH 2/2] chrony: Remove the libcap and nss PACKAGECONFIGs
Date: Sat, 12 Nov 2022 14:09:52 +0100
Message-ID: <20221112130952.2260933-2-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221112130952.2260933-1-pkj@axis.com>
References: <20221112130952.2260933-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Nov 2022 13:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99563

There is no need for these configs on their own and they would only mess
up the sechash and privdrop configs. To actually enable sechash one also
had to enable nss, and to enable privdrop one also had to enable libcap.

This also avoids passing --with-libcap if privdrop is enabled since the
option does not exist.

Change-Id: I64a49741f61385e87ddbc83b9e87213a6fc7668e
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-support/chrony/chrony_4.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.3.bb b/meta-networking/recipes-support/chrony/chrony_4.3.bb
index dad09f826..870c9d8d6 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.3.bb
@@ -64,14 +64,14 @@ PACKAGECONFIG ??= "editline \
 "
 PACKAGECONFIG[editline] = ",--without-editline,libedit"
 PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
-PACKAGECONFIG[privdrop] = "--with-libcap,--disable-privdrop --without-libcap,libcap"
+PACKAGECONFIG[privdrop] = ",--disable-privdrop,libcap"
 PACKAGECONFIG[scfilter] = "--enable-scfilter,--without-seccomp,libseccomp"
 PACKAGECONFIG[ipv6] = ",--disable-ipv6,"
-PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
-PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 
-# This is left for backwards compatibility, to avoid breaking existing
+# These are left for backwards compatibility, to avoid breaking existing
 # configurations.
+PACKAGECONFIG[libcap] = ""
+PACKAGECONFIG[nss] = ""
 PACKAGECONFIG[readline] = ""
 
 # --disable-static isn't supported by chrony's configure script.

