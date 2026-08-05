Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC07C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:05:21 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33661.1785906315058076196
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eewwsfoL;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1260; q=dns/txt;
  s=iport01; t=1785906315; x=1787115915;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U9FvXfSyQPpUgHRU3Inz/75t76JojsQ4FDaZ17McKI8=;
  b=eewwsfoLVU/X0JJa+XSxyITiVH+H4Yd53xenvwLMJ0yC1su+hauvOZTX
   gBZ4cGitMrs05gSjH/R//tue78YIwkzV5A0wA9RkpqPAhvy3goNtwfl5Q
   aI+GpH4lAi8jz6ZF68RunvNvof7vW1ah7dYWdDs/NxoIInslhj+gmH3t7
   vf87yREZIB/Zqj/xNjz0LIqwpj8lKUz4810yIyMkzKXAOLkMRYr1W4OBY
   ekAVu4wqGQaRjXX33GQ/Jh9I4QJVxvXGFYLJzj8X7nieJOj355dQECKnv
   Xej7IwkYtVGvEtfH7HOpFroSfMyZHpPiQAlcRR2IngJ3j+NQmAS6tvEIV
   A==;
X-CSE-ConnectionGUID: ZmECBntVSaOuZ7pON8z9PQ==
X-CSE-MsgGUID: ltomZSwdQ1q7gFexCldI+w==
X-IPAS-Result: =?us-ascii?q?A0BDAgDrwnJq/5UQJK1aglmCV3ReQ0mTWQGOV5I3gX4PA?=
 =?us-ascii?q?QEBDz0UBAEBhD9GjWgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXTYBGAEtMFELRIMCAYI6AzcDEbxbgiyBAYMoATEFgR7YSQ2CW?=
 =?us-ascii?q?AELFAEFgTOFP4J+hSOFcicbG4FyhH6CH0IBAYEngQaFViIEgiJ6EpJRSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKIRtIxk2fIEJXoEtK?=
 =?us-ascii?q?mQBEheBCYJ7AoJ6bwsYDUgRLDcUGQQ+bgeNaCCCQFM7LII9pWWgHnEKKIN1j?=
 =?us-ascii?q?CGPPoV8GjOEBKZoLphaglmLMYQJkkeEaYFoPIFHCwdwFYMiCUoZD5IjgX/KO?=
 =?us-ascii?q?icyAjsCBwIHDgMLkWiBfgEB?=
IronPort-Data: A9a23:8ddpZK6+mxPIr0F5v3yOVgxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mMYXzvXbKyJa2ChctwlYYW+9EJUv5eHn941QVFpqCkyZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJMt/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eD4g10cxxHV91/
 NsFGm8VSTbTlbOO+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0wn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYIKOIoLaFZgN9qqej
 mba+GHLOQ4WDYWGljWr/2KHguPu3jyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:oEpzqqOmBxs+scBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:l4iyYm2KViixgtYDmE4rsrxfKMUIWVfb0EnrKmilOzlxb5vFWw6owfYx
X-Talos-MUID: =?us-ascii?q?9a23=3AhykaGwwWuLiT1+6+SHx/1WQwpxmaqKCyD0U/qoo?=
 =?us-ascii?q?KgpCdaiNeNie2iDiWAZByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,205,1779148800"; 
   d="scan'208";a="803068850"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 05:05:14 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 1FA2318000162;
	Wed,  5 Aug 2026 05:05:14 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id B1A8FCC12A6; Tue,  4 Aug 2026 22:05:13 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-filesystems][scarthgap][PATCH] fuse: Add "fuse:fuse" to CVE_PRODUCT
Date: Tue,  4 Aug 2026 22:05:13 -0700
Message-Id: <20260805050513.1744296-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 05:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128791

From: s-tokumoto <s-tokumoto@fujitsu.com>

Since there are vulnerabilities that cannot be detected by the existing
CVE_PRODUCT, add "fuse:fuse" to CVE_PRODUCT.

https://nvd.nist.gov/vuln/detail/CVE-2010-0789
https://nvd.nist.gov/vuln/detail/CVE-2005-1858

Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a223dd3557cd565596e231106c260ea33234e3f6)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index cee4879eee..809410cc84 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
 
-CVE_PRODUCT = "fuse_project:fuse"
+CVE_PRODUCT = "fuse_project:fuse fuse:fuse"
 
 inherit autotools pkgconfig update-rc.d systemd
 
-- 
2.35.6


