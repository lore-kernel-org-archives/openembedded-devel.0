Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA41C5AD55
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 04:44:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47311.1786422161237593784
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 21:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=DKPUIRkz;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786422161; x=1817958161;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u5q8+T4mh3ackHpOZBA3zlwETP0blBfGIff5cw2WbNI=;
  b=DKPUIRkzS1WCwlFB8nBBYdR9NJWt6M/10g1Ha3fa+ONeb4dLeWCbbvSF
   LmCp+gFZyhTu+PNyZQy3liGFJEp3pi5fk8XE6GAlCFMPWJqqwn4+PyWQQ
   ua9mKZFCw5esIhwi/Qmn2LUOopocEjIoY5DLKk9T5khAH8NWRefrudp1n
   6AY6WPvd6gMrzXvTgMfM+dh9OT/cXrwfzkJwfi8Jp4SimS649brbtaEg8
   vPnv1fwTWsVtGW4tv901ccMipgBBKVIUnUiAGHTrBNDpcYXXi2Yj6AS+x
   v7P5dpeoUB2WCjPEc2I2ydJeJSEFjNMp7fDwF5vq34QKLIcrh+3dtILTj
   g==;
X-CSE-ConnectionGUID: vA0keksiSFOH5jcmKITzOA==
X-CSE-MsgGUID: +bIvl69NQxiDu+J3PLEURg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="74480006"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="74480006"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 21:22:41 -0700
X-CSE-ConnectionGUID: xP41HrakTwOx4yS+C2TrAw==
X-CSE-MsgGUID: wPlpkBb1TmKWMuWbnPICkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="257003359"
Received: from ba38rdl00538.iind.intel.com ([10.49.1.8])
  by fmviesa009.fm.intel.com with ESMTP; 10 Aug 2026 21:22:40 -0700
From: preeti.sachan@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][PATCH] libfastjson: fix rsyslogd segfault crash at load
Date: Tue, 11 Aug 2026 09:53:53 +0530
Message-Id: <20260811042353.239543-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 04:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128908

From: Preeti Sachan <preeti.sachan@intel.com>

libfastjson is missing an explicit link dependency on the math library (libm),
which triggers GNU Indirect Function (IFUNC) resolution failure at runtime.

libfastjson internally calls the modf() math function but modf is optimized via
glibc's IFUNC mechanism. Because libfastjson was compiled without -lm, the dynamic
linker (ld.so) cannot safely resolve this dynamic IFUNC redirection, causing rsyslogd
to immediately crash with a segfault error.

rsyslogd boot error:
| starting rsyslogd ... /usr/sbin/rsyslogd: Relink `/usr/lib64/libfastjson.so.4'
| with  `/lib64/libm.so.6' for IFUNC symbol `modf'
| rsyslogd[1311]: segfault at 9c ip

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
index f1235d7b96..324c0cfbe8 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=master
 
 SRCREV = "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
 
+EXTRA_OECONF += "LIBS='-lm'"
 
 CVE_PRODUCT = "rsyslog:libfastjson"
 
-- 
2.34.1


