Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A3CC79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 16:32:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12059.1788885116802921876
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 09:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=FZaFYyWz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C26A1476
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Sep 2026 09:31:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BDABF3F7B4
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Sep 2026 09:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788885116; bh=nSENLglB2WR1SNJa1DsuZLGKHwY902NRAGKhwPJvVMs=;
	h=From:To:Subject:Date:From;
	b=FZaFYyWzSDzZL8BC/DTF07+uCsyIX0zX5JBzIqus3HxfRBrUYzZg+oiX3uF3TYVe8
	 a7fiVwVBEeX/FGCv2A1ZQFrwieZKg1cIwFhbv3Hc8r0FU20XW+tRe8dAALgJJJBrey
	 uG6Swudbx6m8mqdpUXkl8nhLCdX0ga0twVMpM2g0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] packagegroup-meta-python: remove python3-booleanpy
Date: Tue,  8 Sep 2026 17:31:49 +0100
Message-ID: <20260908163149.3473229-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 16:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129865

This was moved into oe-core, but it's entry in the packagegroup remained.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index f58f8a0f29..d9a9151276 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -53,7 +53,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-bitstruct \
     python3-blinker \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-blivet",=
 "", d)} \
-    python3-booleanpy \
     python3-cachecontrol \
     python3-cached-property \
     python3-cachetools \
--=20
2.43.0


