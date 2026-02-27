Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD8BFD7F73
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92456.1772187289154838772
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O/7EcSXr;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187289; x=1803723289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wGC/gGg3XbtcaCmJV1HNjPRiTlOR5n1KuJL8/KSserQ=;
  b=O/7EcSXrfICXI1RAAQhPXemo7iOtauYM52ROVwshRO/10SUfdbyVWnaT
   aPgMNTKuG78D9fhddpgP/kPyr+HsV0FnVyJto8mz1/rjViAzf8oajJdz+
   KwLakkTSMocjHBTVdHeyteHLeXp3YBOejkkjpZ4/wqjF9Zm6ETdJgeSXo
   XFkeIoEmLEHvpDxcj3xADvrghgIJmMjyRspHxvkZC0omKFOadyIiW8Hj9
   /NW5cYeFibVoab0dHhtWooWsnwztWdmsiSlE49Q50LX51P/LpsuXzXZmS
   8YqX91bNQNT25KOv1EOg+VusqRJsWyLAOu1/B++1OU38H3fBhhV/gfX2K
   A==;
X-CSE-ConnectionGUID: vAjePE64QB2Il0D09Edxbg==
X-CSE-MsgGUID: jKdwOUNsRfqNhGKGDLJ09g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="218740575"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="218740575"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id AE3D01002B98
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:47 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 617EA180A321
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 77E8818005A1;
	Fri, 27 Feb 2026 10:14:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/52] python3-pymodbus: upgrade 3.11.4 -> 3.12.1
Date: Fri, 27 Feb 2026 18:13:01 +0800
Message-ID: <20260227101327.1432-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124726

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- SimDevice / SimRuntime fixes.
- No inter_frame_time check for baudrate > 38000.
- Fix smaller bugs in test, part 2.
- simulator startup armoring and update 3.x docs
- Fix smaller bugs in test, part 1.
- Update README.rst.
- Coverage limit is 99.95% (to allow a little margin).
- Removed simulator README, due to unused.
- fix: add warning log when using internal default simulator config
- Document simulator entrypoint in README
- Upgrade library versions installed by pip.
- SimData/Device integrate in server.
- Add bind to ModbusUdpClient.
- Solve Zuban problem.
- Fix wrong parameter name in function docstring. Fix set_values does not accept tuple.
- Add context.async_get/setValues with device_id.
- SimData/SimDevice ready for server integration.
- Reactivate pytest coverage.
- No blank issue template.
- Update issue templates
- Fix ReadFifoQueueResponse count
- Limited support for multiple devices on RS485.
- Simulator DataBlock docstring corrections
- fix README.rst and troubleshooting
- Solve DoS vulnerability.
- server handle_local_echo only in comm_params.
- di is for discrete input
- Allow any dev_id, when requesting dev_id 0.
- Allow response transaction_id 0.
- Use relative import.
- ModbusServerContext.device_ids() docstring
- Include ModbusSequentialDataBlock into the documentation
- Fix Modbus TCP protocol ID validation in FramerSocket
- Remove idle_time() from sync client, which anyhow was void.
- Correct check_ci.sh.
- Replace mypy with zuban
- Fix monitoring of functions
- Improve types
- dicts have preserved insertion order since 3.7
- asyncio.iscoroutinefunction() is deprecated
- Remove pypi-alias.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.11.4.bb => python3-pymodbus_3.12.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.11.4.bb => python3-pymodbus_3.12.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.11.4.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.12.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.11.4.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.12.1.bb
index 6d961fda1a..7ba7ee78cd 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.11.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.12.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "6910e385cb6b2f983cd457e9ecee2ff580dbb23cf3d84aefec0845e71edd606a"
+SRC_URI[sha256sum] = "bcb483381747b3e3aec2c8e01d5df885e5ea43f85b7145dc1907af06aca93a2c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


