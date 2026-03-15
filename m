Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F7BD58B36
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:02 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28886.1773581757778989745
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RgMboO4M;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1048; q=dns/txt;
  s=iport01; t=1773581758; x=1774791358;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0BtTo5lnTM7dQ6aG807tvyFblFhTWV4/htolMdopL2w=;
  b=RgMboO4MelHckRdoyBaSx6bws6hWMQHEUqSYfz5cs0eYzSPoX0dkxnH0
   iSDkNfcNx557OP3XDbIM4ejdbHj7jTBW8b8JA4q6zA+iA9t7dPjZqZDpa
   oTTu8/bevnYXkoWYXAxZwQIl0/neFht0HbrbEPZ+v/ycg0PYJ4tnKEcda
   HjBo8ikkjYp6pjJc21bshpUWRJm9jH3+ms84E2/rmMvAn+SDl5/bkY1UP
   jeUOKb8AerOm1dBeDMXpAlohN2qtflicnZ7QyQS4wGA3X0GqR4Y4upXcW
   47qZfd98S9b5M/JdMEpNz7DYNaiBPAI0gaqyxKJSyjpajicPVgaUb/Qdf
   Q==;
X-CSE-ConnectionGUID: XFBPUViXTROeOY84z7BvmQ==
X-CSE-MsgGUID: 45BmoXH8SXS6iwp9E9YRhg==
X-IPAS-Result: =?us-ascii?q?A0AlBwCjtLZp/43/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAmCysrGYMCAYJzAgGxfIIsgQGDKAHce?=
 =?us-ascii?q?QELFAGBOIU8iBl0hHonGxuBcoQHdoUQhXcEgiKBDoF/kS1IgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQsbBwWFGg+IcnRtgRODLQMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HjXo9gjMBPVGBRzUzAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaQE6gVlwF?=
 =?us-ascii?q?YMiCUkZD45fzH0jNQI7AQEHAgcNAwuBaJF9AQE?=
IronPort-Data: A9a23:1hcHcq6xIHAJycQxHzuEawxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mMYCzuHM6zYMDbzetkgPNnio0kD75LWnNdnSAI+qnxmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2QqajlNtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eDaMywttJAFFyz
 9sVDwFdMgLcrfyz+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGISEIIbTGZ0Lwi50o
 Eqaok78BSE6ZOev8mSE7Wr9q77+pyP0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cEnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:0zgeLaBuhQ5Pw0PlHemt55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefygaYvp
 0QFZSXz7bLfD9Hsfo=
X-Talos-CUID: 9a23:yDRBP2DBFsd5dXb6ExlJ3nYpJMEVTkf6wVDhcxOqVkx3TYTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AY2Q1pg2XbQbwQVT5nV0MZf8TqDUjv/mEDUc9scU?=
 =?us-ascii?q?9i/LaNDNoahrMvQ63Tdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="692214064"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 451F8180001B7
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 6DA6ECC8D6F; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 22/24] python3-tabulate: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:39 -0700
Message-Id: <20260315133441.3034831-23-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125233

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-tabulate to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
index 75e97355f5..a340ffa47b 100644
--- a/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
@@ -19,3 +19,4 @@ RDEPENDS:${PN} += " \
 	python3-math \
 	python3-profile \
 "
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


