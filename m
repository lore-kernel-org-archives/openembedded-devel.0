Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A36C4332F
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 13:10:39 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.2388.1668258634004989568
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 05:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=cepkPaQb;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668258634;
  x=1699794634;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Rai9PdGV97lS0xHtnggDfcK8bP4L51Wq9pg3iIvttn4=;
  b=cepkPaQbgRIw5IQi+syb4gkVozimZnxXSXlX2zGmNonAuAbLM6XPV2fk
   z5co11C+eP+W+r6t9mh6b6SkgzftHHDaiRrXKBu/SAmnD+ptHRC6nBUT2
   qF2sjmqpZtFTTzmvmS1NBixrRIkqYj7opw6gIHJOnFR1GOEJ+gOvlpBby
   YFuftNxAvhRUOeCEJx2m43kQ1OYF3XVB3NuwO88qHerlXIp/H4p7r7y4p
   wyx8T96cX3Hqxe36Cq8nVJRR3KnjxiXcORALVVgG6Ak1DWnXiUBU0HsbP
   NZquk3T8zogTSmE9vy+ful7oVn1Mg4d0FD2ATufthPLJpT3gMG3zxjMBU
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][kirkstone][PATCH 2/2] chrony: Remove the libcap and nss PACKAGECONFIGs
Date: Sat, 12 Nov 2022 14:10:28 +0100
Message-ID: <20221112131028.2261126-2-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221112131028.2261126-1-pkj@axis.com>
References: <20221112131028.2261126-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Nov 2022 13:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99564

There is no need for these configs on their own and they would only mess
up the sechash and privdrop configs. To actually enable sechash one also
had to enable nss, and to enable privdrop one also had to enable libcap.

This also avoids passing --with-libcap if privdrop is enabled since the
option does not exist.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-support/chrony/chrony_4.2.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.2.bb b/meta-networking/recipes-support/chrony/chrony_4.2.bb
index dfa1ed86f..8d12cc75e 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.2.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.2.bb
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

