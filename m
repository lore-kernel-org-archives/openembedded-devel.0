Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67258C4332F
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 12:59:49 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.2339.1668257986314669791
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 04:59:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=KCiET6jK;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668257986;
  x=1699793986;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=A04zZrLY11PAwnt1IeQtlistBfkqqHNNz/UuiElDXhk=;
  b=KCiET6jKXAxAsO0n6NPJzNo2GBwAsSfvYO0PJ5L6pnjqwWMe9DiMOMsn
   uGT8hjCaddFqVK6Lc7VfEgiVzmLXhsTVIpsG5ap6AfKTn6AIZTVBQGZ6D
   71jjrYvz5KgEwc9vG8XZGAUvVdTJ6IzXk4eMYJ3mCXkl9jdrtacbOZTXs
   qmvJ/oU5DruxaEavIeuNYjk/Xa6x9rXfCto2SbLPACueIG1sCrrzBCELA
   1tgBPWCl2+r8kvSDUAbILr6ugeFMYErb+GktfUaEcejZqIaSuXAHI3L0Z
   pliq5kLOOGZWoZDsMfVu/MSRIc1KL5sn5RSfG4r9RdLixhdGQQhSe1yiN
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 2/2] chrony: Remove the libcap and nss PACKAGECONFIGs
Date: Sat, 12 Nov 2022 13:59:39 +0100
Message-ID: <20221112125939.2258996-2-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221112125939.2258996-1-pkj@axis.com>
References: <20221112125939.2258996-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Nov 2022 12:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99560

There is no need for these configs on their own and they would only mess
up the sechash and privdrop configs. To actually enable sechash one also
had to enable nss, and to enable privdrop one also had to enable libcap.

This also avoids passing --with-libcap if privdrop is enabled since the
option does not exist.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-support/chrony/chrony_4.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.3.bb b/meta-networking/recipes-support/chrony/chrony_4.3.bb
index b09a58b08..420cc78ca 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.3.bb
@@ -64,11 +64,9 @@ PACKAGECONFIG ??= "editline \
 "
 PACKAGECONFIG[editline] = ",--without-editline,libedit"
 PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
-PACKAGECONFIG[privdrop] = "--with-libcap,--disable-privdrop --without-libcap,libcap"
+PACKAGECONFIG[privdrop] = ",--disable-privdrop,libcap"
 PACKAGECONFIG[scfilter] = "--enable-scfilter,--without-seccomp,libseccomp"
 PACKAGECONFIG[ipv6] = ",--disable-ipv6,"
-PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
-PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 
 # --disable-static isn't supported by chrony's configure script.
 DISABLE_STATIC = ""

