Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C6BC5DF77
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28885.1773581757740886233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E6rZSHiw;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=986; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zVZh6h++t/2pKre4tgsIUZPDEsUbCqM9VgPHyEli10I=;
  b=E6rZSHiw7uX2ErmnOmlt9EjPPDZ0SPNFLoZF0Lw+MRUfgMXSfA8//jZA
   ywVpc2N2+FVv1F/SFEdfyzmPQjglc/mC/2CDIWOPDmHYbYAIjOz30Nz8S
   8d6ulT5qFlfC+mN158gHPPS+qJv710E2fu7t3LF76Csw+v5n3oa+08cko
   kzMRCLMfmtVjSMTpNM4xjVCfaO5G6i+8Fi9Q5kClVdM1fcwhCDcHYV35+
   5kvYCbdobbND1h/Pynob6Jd4CgLYAsFbl544ygfXI52G2sflNQZVI0PC4
   Cp4A/7tBdLkOjaNLtAwga2+8bbgxvdKSs5rogDrwh19Y1FvhAFEBqaPN0
   g==;
X-CSE-ConnectionGUID: swf+hVstQveJe1iJCPtjmQ==
X-CSE-MsgGUID: sYhmwi1HQIOyhts00bi0Xw==
X-IPAS-Result: =?us-ascii?q?A0AjBwAatbZp/4r/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbF9giyBAYMoAYFT2?=
 =?us-ascii?q?yYBCxQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6BeQaRLUiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYUaD4hydG2BE4MtAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeNej2CMwE9UQGBRmgBphyhDgoog3SMHpU6GjOqa5kGpFmEaIFpATqBW?=
 =?us-ascii?q?XAVgyIJSRkPjl/MfSM1AjsBAQcCBw0DC4FokX0BAQ?=
IronPort-Data: A9a23:klIpBa6+uTx0+TWnhR7mNAxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mcZUDrQOv3Yambxcopxbo61oEpQvZ+AnNAySwttqCg8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2QqajlNtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eJpIWueZJGn136
 /E6JWkMTDu7m+Cz+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYfUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGISFKobVFZkLxC50o
 ErdzmT8HRBDFOW+7iuF7mn03uXOxRPkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:IFuUXa0PeBrDHhgYpUWMuAqjBLMkLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddm2wUMqyXMbC85vyKhzWFLw==
X-Talos-CUID: 9a23:UTXdsW4A4iBfhveVwdss71EaWcAbaWHk0nryLha5K01RVL+QcArF
X-Talos-MUID: 9a23:LeBL2Ajf8jM7x5yxAkNs18MpL/Zo5ruvUWA0sLIXu9WfbXR6Om+tk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="688278462"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id D1C8018000284
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 34470CC8CDD; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 08/24] libyang: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:25 -0700
Message-Id: <20260315133441.3034831-9-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125226

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require libyang to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-oe/recipes-extended/libyang/libyang_3.13.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
index 822c30ba24..122262e73e 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
@@ -45,3 +45,4 @@ do_install_ptest () {
 }
 
 FILES:${PN} += "${datadir}/yang/*"
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


