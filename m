Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14843CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 07:10:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14468.1781075406425045783
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2026 00:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CNWMO+kn;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: nmjain23@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso3794744a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781075406; x=1781680206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ABfrwGVhUpWDgchYj2TiREMdJLgDroG3pHBs2h5cyTY=;
        b=CNWMO+knmnftlPSVWYBARTKoZGhDqi2Tf8pgYIa7+O++O6q5vArvu+U0Cn1cPKclst
         nQENnlFWHNuItXc5pVQxSKCCSHABZrgXQVdMLIuC+JtIJc9qKTURKny/3iob1EXF3733
         EMPsePxtQvnAb+61l0C9JdlbPMoPEEWYgwrF8W7tdtf6iCGdlV4CHZqHyGskcQUiEilw
         24OzdzNKpmiVZ8AVTQ3C/XuLsYlWgt0tJ3hBfYAFGAjyHzQTddOZx7F/W6JTLAnSls79
         OuifvV7znCm3pa9Wc1insIPzbxUo95B8H25TGH1CdppxA3G8eCvdoNL4QW8og4Zhp0O+
         jHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075406; x=1781680206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABfrwGVhUpWDgchYj2TiREMdJLgDroG3pHBs2h5cyTY=;
        b=SL5ZS9Z4q/4lpfeZKPVzzb4UUmlKqt/X+DEKlD6E2Fddy/l1nVOCi3UFrLgATvC3ep
         LirSAj2TViWl1n34TfjHEJZP8ghpAaGB2quS7oHkVdxevtH4/Z3/+1AVDDHAN+DYg1la
         +rGl0fI4SGu8Rv/92Y+5jDLKp/VRavU+kDlo57+/TGIz/w3GZ0qXXszqFBnJ/zbK8nZh
         T4pLnaIQvToEcTenN78SzsFsN5Bef511QGKSg2KcV0cMSe2+Danp+7ReYyyipog+Tj09
         WKQuk9pSUVwm0TjK58GXKGCxvga3xkJ8oxbTtH7BJxViNk9WfigQwscuYXndunJ4pf9L
         TlYQ==
X-Gm-Message-State: AOJu0YwtcpWsGtheqvT9tp5C6GbHNyLVREY76/pxARSpItH7mBZDsS9p
	w7RlsELc0DDkQc8vkdHnEDl22p7daCHpXyy7UwEkbj4Qo+Ax4buWPzcZ9wiJNA==
X-Gm-Gg: Acq92OEgIL5v088qm9tH2P3vecoY3F1L5u5oh2kHS/d8W76082V9F7mzao1IKTMxnkW
	NgsyxwCIz88s9klW/52geY9MdBwpahU5Pn94IwOq33OfYiGiyj36y0DBjX2r6eedMfwAxF7IeKb
	+CUxIQIGqvbdsiQ+zQv9KIRDsS1LJZ1ITRA0G4Cx3+nhqt8g8hO4b7dDTFcdW1uaBO5IgwG6VTJ
	s0UVr+pPcrVcOR26pFSw9VUVmDnH4Ps3rnKQ8F9cfSKfgRNfwExp3dwaQg+uE63KJE2TfzdpgNv
	j+vOMHeVjr39wz/Vi+4lagIAQLDiAE54mQZlvrrwCwBfVTWREcsQ3ANj7xeLsa9kA/d2PFy2RM9
	lGTXGIyBy7p9XBo4ZYBGvsjIqE+QM4WiolNcppbk/w7hn0hT+ABAWoOubxSC8ddfe+V+5QwH+nl
	osJ9Pg8EJNonNyUsvtULQ9iLRW9/ZZKwHvwpOQbCWwPflsEJEWTm4czCGwDJjeu6OxJefcAZ6ao
	XGFM6nK4ITaN50tMq8WjQ==
X-Received: by 2002:a17:90b:54d0:b0:36e:2106:dedc with SMTP id 98e67ed59e1d1-370f0c5060fmr24826900a91.22.1781075405769;
        Wed, 10 Jun 2026 00:10:05 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm231220255ad.40.2026.06.10.00.10.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:10:05 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][wrynose][PATCH] nftables: Conditionally add ${PN}-python as RDEPENDS for ptest
Date: Wed, 10 Jun 2026 12:39:52 +0530
Message-Id: <20260610070952.791345-1-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 07:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127508

From: Naman Jain <namanj1@kpit.com>

This commit updates the RDEPENDS for the ptest package to include
${PN}-python only when the 'python' PACKAGECONFIG option is enabled.

This change will ensure that we dont get below failure when ptest is enabled in the distro features,
and packageconfig is not set.
It causes this error-
ERROR: Nothing RPROVIDES 'nftables-python' (meta-openembedded/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nftables-python' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nftables-python']
ERROR: Required build target 'nftables' has no buildable providers.
Missing or unbuildable dependency chain was: ['nftables', 'nftables-python']

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.1.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
index cc57db3c81..b0d410f378 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
@@ -68,7 +68,10 @@ do_install() {
     fi
 }
 
-RDEPENDS:${PN}-ptest += " ${PN}-python bash coreutils make iproute2 iputils-ping procps python3-core python3-ctypes python3-json python3-misc sed util-linux"
+RDEPENDS:${PN}-ptest += " \
+	bash coreutils make iproute2 iputils-ping procps python3-core python3-ctypes python3-json python3-misc sed util-linux \
+	${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)} \
+"
 
 
 # For ptests compile the kernel with CONFIG_NFT_TPROXY
-- 
2.34.1


