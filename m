Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FBEC5DF76
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28711.1773581757548694864
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Crbc7mx5;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1109; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YsrcR46X14DPaX5MYZNA9qrqflrhprfGPUJBl9tLpAg=;
  b=Crbc7mx5wg9CbF9R7u1Syq9s1VbLGKeErokSYsmtXdp/EGjgSR9LlCCV
   4P5TJ5EVcdI2yzxyLXo5VKEWxmWnrQHtUQ6THvgUMPOHs8Gm20JTcGz4a
   ZPXHlkm0R2CtA1gVy/conMEFI9LhjfIdCPiP7V83eyq5AQcaltctcj+Gb
   wtE3Hg1Bo84sp1PRxzouThUKreH55IRGuZpNOmNA7rr5EhdN2XnLESixC
   MGw8aREiC8h2Yh9Dnff4uPMElJMkugy9Dc3+3MKlf5zsYMNjPtwffWNNu
   C2cEPrO0xsPMBpuVlqdEenbHEYRmAPcu6gcfJtFlHDraoIlh9R2/pXGe7
   Q==;
X-CSE-ConnectionGUID: lB/37aMiSvm7rgY/Tj43rQ==
X-CSE-MsgGUID: z9uZcKYkQXCs2Jq7W/BShQ==
X-IPAS-Result: =?us-ascii?q?A0DaBQAatbZp/4z/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbF9giyBAYMoAYFT2?=
 =?us-ascii?q?yYBCxQBgTiFPIgZdIR6JxsbgXKEB3aECoEGhXcEgiKBDoF/kS1IgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWFGg+IcnRtgRODLQMLGA1IESw3F?=
 =?us-ascii?q?BsEPm4HjXo9gjMBPVEBgUZoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaDyBW?=
 =?us-ascii?q?XAVgyIJSRkPjl/MfSM1AjsBAQcCBw0DC4FokACBfQEB?=
IronPort-Data: A9a23:QPHSLa6v+qIlq1NUI2xHoAxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mccD22BPPeJZzH1Kt1+bdy/oBxXupbWnNE3HlZurCE2Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2QqajlNtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eOadfobl+JGB16
 /lHMj88KSyB27ms+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEXUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGISEIozXGJ0Fzi50o
 ErUrnnLCTIrN+Wv4iHf0GvzuajlpiPCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cFXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:U0WtNayAInkMBJ8BOfBXKrPwLb1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 uJt8NFebvN5Z8Qt7ec3DWF
X-Talos-CUID: =?us-ascii?q?9a23=3Ai/QZEWl6SBJ7lFI0HtqKOQAW22fXOXn3iyyPKmq?=
 =?us-ascii?q?5MnhsF6eaeBis+v8/ifM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AgOaj5AxjuewB56QAlUb6Snzm/xuaqLb/FXIGsqQ?=
 =?us-ascii?q?FgvmvLnZSImiiyx6MQrZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690855088"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:56 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 72E1318000583
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 1CEB7CC1633; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 02/24] libisoburn: extend recipe for nativesdk builds
Date: Sun, 15 Mar 2026 06:34:19 -0700
Message-Id: <20260315133441.3034831-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125223

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require libisoburn to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
nativesdk variant for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
index 3982eae63c..f3c25e5a84 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.6.bb
@@ -24,4 +24,4 @@ do_install:append() {
 PACKAGE_BEFORE_PN = "xorriso"
 FILES:xorriso = "${bindir}"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


