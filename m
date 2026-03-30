Return-Path: <paolo.barbolini@m4ss.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABA0FF495F
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 08:05:06 +0000 (UTC)
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46058.1774857898097985996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 01:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@m4ss.net header.s=MBO0001 header.b=hm1eZiPp;
 spf=pass (domain: m4ss.net, ip: 195.10.208.52, mailfrom: paolo.barbolini@m4ss.net)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4fkkLZ22Y7z9t5p;
	Mon, 30 Mar 2026 10:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m4ss.net; s=MBO0001;
	t=1774857894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vqfMEduHNmkF10fzF3TWZtKUfo43qgUKha8hkL4CthI=;
	b=hm1eZiPpTPm4oSWYaYB0rZHrar/ybDn95hUgWv5NZ+9v0TeAkfT3sN/yrYgq3AST006h4+
	z2hsX+73gGHp5+Un/6g07Z8GyZ3WYnREq61eRJKHlvC9d5yO+Lxjfe3QsnmXhWqqo5bqqA
	Y9hrn6tjXznbPja2YbJf66nHp5qN15ppTrZC8EPRCnRf07M6ItGnwWK6K80MCjHC19UJ1O
	Ucpy+/RvBtjoGEccWWQCT+inN8xTWyEs10RTChB47bRCgKJib+16kwGbdIQRDt7Bxm22Jy
	+kxTzLAqFb5K19o0mf8Nfoh/EdObuJNYLljjekTOVwtUi54h2B2xnojwpF+G+g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of paolo.barbolini@m4ss.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=paolo.barbolini@m4ss.net
From: Paolo Barbolini <paolo.barbolini@m4ss.net>
To: openembedded-devel@lists.openembedded.org
Cc: Paolo Barbolini <paolo.barbolini@m4ss.net>
Subject: [meta-oe][PATCH] nmap: make python3 RDEPENDS conditional on ndiff
Date: Mon, 30 Mar 2026 10:04:49 +0200
Message-ID: <20260330080449.446406-1-paolo.barbolini@m4ss.net>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4fkkLZ22Y7z9t5p
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 08:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125836

When ndiff was disabled by default in 51e070301e ("nmap: disable
ndiff"), the python3 RDEPENDS were left unconditional on the main
package. This causes python3-difflib, python3-asyncio and python3-xml
to be pulled into every image that includes nmap, even though ndiff is
not built and the core nmap binary (C++) does not need Python.

Gate the RDEPENDS behind the ndiff PACKAGECONFIG so that Python is only
required when ndiff is actually enabled.

Signed-off-by: Paolo Barbolini <paolo.barbolini@m4ss.net>
---
 meta-oe/recipes-security/nmap/nmap_7.92.bb | 6 +-----
 meta-oe/recipes-security/nmap/nmap_7.95.bb | 6 +-----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.92.bb b/meta-oe/recipes=
-security/nmap/nmap_7.92.bb
index 98969fe001..33767dfb96 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.92.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.92.bb
@@ -59,8 +59,4 @@ do_install:append() {
=20
 FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
=20
-RDEPENDS:${PN} +=3D " \
-    python3-difflib \
-    python3-asyncio \
-    python3-xml \
-"
+RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ndiff', 'pyt=
hon3-difflib python3-asyncio python3-xml', '', d)}"
diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes=
-security/nmap/nmap_7.95.bb
index a892c1e910..8841a8cd78 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
@@ -59,8 +59,4 @@ do_install:append() {
=20
 FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
=20
-RDEPENDS:${PN} +=3D " \
-    python3-difflib \
-    python3-asyncio \
-    python3-xml \
-"
+RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ndiff', 'pyt=
hon3-difflib python3-asyncio python3-xml', '', d)}"
--=20
2.53.0


