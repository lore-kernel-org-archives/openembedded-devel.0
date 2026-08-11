Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEE7C5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 04:44:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47610.1786421697129779179
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 21:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=WkZUalUt;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786421695; x=1817957695;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u5q8+T4mh3ackHpOZBA3zlwETP0blBfGIff5cw2WbNI=;
  b=WkZUalUtfPi9s6bIA32QwJgDi8A5liuAc+FYGACQf+gDZDspGF6H2wni
   w1iRGXBaxI/iQrboKALqsBp8x/qh1/cwRLONvejiIbut5MqOAKZXFFQMv
   cHvPlkVSVYXcgiL/0NGHHZBeYcxTHBy/1GjTX881OO3wV+7QWgCG9WR6M
   IX34IkpfUbNa9tKVtSjPVmQAS3w8auZbD/n1kWVVlHUDEoTlRh/NQlRxo
   3cWws/vmKVMb+781o7qoLbAQTRkWExdYbh6ThVYa9Lxe2genOGjI4+2WC
   hoQ843nINuKNM4J40MS4JqkkiUGl5EZLTrda/LaBhI0f5V4rqUSdMHtBP
   Q==;
X-CSE-ConnectionGUID: NOZcWiEZStaQj3QWztf8Cw==
X-CSE-MsgGUID: cH+IkcVgR8m6j8ls9f+IGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104478918"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="104478918"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 21:14:54 -0700
X-CSE-ConnectionGUID: rvBWXECGTzaEYSrO/tmO6Q==
X-CSE-MsgGUID: zidbt+qwSquJcJrb/ayIgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="261468919"
Received: from ba38rdl00538.iind.intel.com ([10.49.1.8])
  by orviesa006.jf.intel.com with ESMTP; 10 Aug 2026 21:14:56 -0700
From: preeti.sachan@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] libfastjson: fix rsyslogd segfault crash at load
Date: Tue, 11 Aug 2026 09:46:09 +0530
Message-Id: <20260811041609.239356-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 04:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128907

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


