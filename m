Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064DAED7BB4
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:40 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15862.1776163230775855678
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MkWerJgE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163230; x=1807699230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/w0Ee8lBshsMLyh9muH8KvA1GAmqTaCguYycRxVr7Pk=;
  b=MkWerJgE5aPgkmwXyqb6yIQ77Agq0E9tJPXKur5+lOlSuE4ABntg4dQ/
   YfUZjPaOa+kvn7XX0vKzULGFU/+XR7HshsCtTFvM+axq9hZHs5g3C9vAG
   rynP4PcgiReRi/Kg7x6SAkbu2T66lRdDTZvDLyEmVhpD8u5Gp2Feie2py
   lN+KrnkEBLtp8VBZJHGuvvMxXNDJvxSPGiqI1pQOkCafusTCNSnSuTr44
   oNZNABmojs8qPGu/+iyytExur+XCdD9HdNOAa28RN5UDAmuwv+d2ujE87
   DdaE/N72bUz+k0TgiHSQmY7fjVCHTsINvBGuJTBUEst8zFE6zi4kGvw/M
   A==;
X-CSE-ConnectionGUID: 7oekIsUYRFmYtYphY+8CYw==
X-CSE-MsgGUID: 55OcsTwEQ5G8S9znj9K9GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="224845213"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="224845213"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:29 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 370E11C1C713
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:29 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E200518002C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7AC4914000E2;
	Tue, 14 Apr 2026 10:40:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/32] python3-pymodbus: upgrade 3.12.1 -> 3.13.0
Date: Tue, 14 Apr 2026 18:38:35 +0800
Message-ID: <20260414103845.1728-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126326

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Correct missing types.
- Altherma heat pump control, with Home Assistant and updating server.
- SimDevice, use_bit_address allows different addressing for BITS.
- Remove 3.5char frame time check.
- Fixed Modbus*Context.
- Fix bug in ModbusDeviceContext.
- Fix log level in examples
- Fix CSS lookup for simulator server
- Fix usage docs in examples: add missing option --baudrate
- Doc:Finalice server/simulator narrative
- Fix codespell bug.
- Datastores uses SimData/SimDevice.
- Doc on how to convert to SimData/SimDevice.
- Fix Read Fifo Query RTU Frame Size
- Update server documentation (datstore).
- Update server examples to use SimData/SimDevice.
- Add server.async_get/setValues.
- Solve codeql caching problem.
- Remove unused methods in datastore.
- Remove datastore get/setValues (async_get/set exist)
- Revert "Combine ModbusSparseDataBlock with ModbusSequentialDataBlock."
- Combine ModbusSparseDataBlock with ModbusSequentialDataBlock.
- Remove RemoteDeviceContext datastore.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.12.1.bb => python3-pymodbus_3.13.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.12.1.bb => python3-pymodbus_3.13.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.12.1.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.13.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.12.1.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.13.0.bb
index 7ba7ee78cd..c59e8870b7 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "bcb483381747b3e3aec2c8e01d5df885e5ea43f85b7145dc1907af06aca93a2c"
+SRC_URI[sha256sum] = "da4c87afe772787620594c564cd8aa8a4c58ff9786382aba9550fe0ce8879f32"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


