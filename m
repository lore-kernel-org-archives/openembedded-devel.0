Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD65BC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:52 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3368.1787132211868230073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bn48tbGz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132215; x=1818668215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EOw0w6lGNy6XA7UBW5z04hi1puxyAH/dFGK/g6IFuik=;
  b=bn48tbGzTApNNW8nahTrt3NL9iKTTALQCFImR1fmHOkYDNwFsCx5yxKJ
   lglYSBssg/56289xRX2BXibz9Y8NvR/Xlmb95NF+1+9//ZkUwLv0YUyME
   JSlwdmCV10rZzIml6Yj3PDFl3+7AY+MREpZEkzDWPWtQVYbtgE5qR7umz
   S4hNqqOQsCSS8wHrcVJAFKOoJs7gmadBZwdW0a06ilG+7teYBtOphK2X+
   BH7KExDjMAg59ssSSuAJlB1XOvFHpzoUofMXhkCjQki2L7wQQ+YzrPaPG
   7eBpNR6ORTOLSi4EXFe+zSyWCy8FU7f9hLnwzpzXlpKv7paTtFdP2LeS1
   w==;
X-CSE-ConnectionGUID: KW5N8B7OTxue9aTWTYImVg==
X-CSE-MsgGUID: wu3ehQeNRl6AG0quNXw1IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251862690"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251862690"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:53 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 11D6E406EF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:50 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BB18310003A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B09931801C0F;
	Wed, 19 Aug 2026 09:36:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 51/70] python3-pymodbus: upgrade 3.14.0 -> 3.15.0
Date: Wed, 19 Aug 2026 17:34:55 +0800
Message-ID: <20260819093514.1101-51-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129321

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Control count in bit/register PDUs. (#2997)
- FrameSize bug in Fifo queue ressponse. (#2996)
- NullModem only support async clientes (#2995)
- Propagate known request identity on ModbusIOException (#2993)
- Fix unknown function-code exception identity (#2992)
- Fix max recv length to 1.024bytes. (#2991)
- Update doc of SimDevice.action (#2989)
- SimAction is a coroutine (#2988)
- Fix missing comma in devcontainer.json (#2987)
- allow uv automatic dev install (#2982)
- Add uv cache. (#2986)
- Accept any Sequence[int] in convert_from_registers (#2985)
- Add --all-groups flag to uv sync in ci.yml (#2984)
- Correct SimAction doc. (#2983)
- Fix validate byte count in file_message.py (#2980)
- Ruff complains over None. (#2979)
- Catch struct.error.
- Fix: validate register write byte counts (#2977)
- Fix write multiple coils byte count validation (#2974)
- Reject unknown specific device identification objects (#2976)
- Fix routing of unsupported MEI types (#2975)
- Fix sync disconnect counter reset after successful response. (#2973)
- set timeout on sync recv, avoid endless loop (#2971)
- Do not allow old server context. (#2970)
- Remove AI training with codeql. (#2969)
- Remove uv cache. (#2968)
- Remove unnecessary casting of self.simdata (#2965)
- Cleanup ModbusSerialServer.__init__ kwargs (#2962)
- Disable pylint too-many-arguments (#2964)
- Correct generate_ssl (demand certfile). (#2963)
- Correct stopbit parameter doc (only 1 or 2 are supported).
- Apply docstring fix in sync serial client from #1850 (#2958)
- Fix pack_bitstring input mutation (#2959)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.14.0.bb => python3-pymodbus_3.15.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.14.0.bb => python3-pymodbus_3.15.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.14.0.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.15.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.15.0.bb
index 7923b14b82..0c70d91cd6 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.15.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "f1f486ec45b77b7565c5168c9609e244a4a6428d386f3cff56eb85a2297cd10c"
+SRC_URI[sha256sum] = "4c5f715128bfeba59f4c9fb3542b0c32a8afd4b90081111e39c12f7af0c89aae"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


