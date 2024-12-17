Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239C8E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:56 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.77388.1734426112249572980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UgUZOWUJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426113; x=1765962113;
  h=from:to:cc:subject:date:message-id;
  bh=ypvUViKpQdmlQDgm1xdFN76DvNNQxTjEWf/eww/yYlE=;
  b=UgUZOWUJfXwhDjd5cnVl7wCu0gvOzQ0bDW0MGYUVHUdIVKGZN4K/z5oG
   v1+BCGhwb6smubJqHuELP+/h5wf6iStztb4MqDULsw1PPNVDsxu1ttQHK
   GtT5H/kCr4NlFJ6DZn8pzIUFGObHsS0scR/sS5CVcxZ1FQcY3ZyzTjc8V
   5/4xVklGKHusP9VFhDut4eZxQ7cbtLqvhs5RFiDzcMk9fiQ8Adz2E3HFI
   knlzC40LdENGrkXDgNnL0gA2JqeQR1nz4QD5cYulGrqUMQAzplqTN6ISw
   sZ4tx9XDWrafql594QeNMDgXpsf3I7uWppDD4eM1V3cWbJArG5iNhLjBd
   A==;
X-CSE-ConnectionGUID: NIZ2g/PxQzu0+kNpQD81Ag==
X-CSE-MsgGUID: +zy71eTTQ0anWmj8fwvx9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="183207099"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="183207099"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:50 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CB2C6D6EAA
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CA90D971B
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34F666B5DE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:47 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AAE231A000B;
	Tue, 17 Dec 2024 17:01:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/17] ace: update 8.0.1 -> 8.0.2
Date: Tue, 17 Dec 2024 17:01:20 +0800
Message-Id: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--7.251300-10.000000
X-TMASE-MatchedRID: ndt4s9/dZzCvbHkumykHIxIRh9wkXSlFMx/Xynyqsrskt9BigJAcVkXK
	3zSCIcxkZoy+MSdGAHe3hqOHWQsaxVnGEjlsas2yBApSYI86Y6gnhzAhgvoq599RlPzeVuQQgg8
	W5tsFXID7tBxFpWhryf+1065WI2+4L/tBTZzO5Q25x7uAXGEprZiQDIJsDspXof6W0W/Hq1OIwP
	rAH8iLMlOIGpHp3GAOXgGaSZV93LfIY6JevWs4vp4CIKY/Hg3AaZGo0EeYG96O8R6rqACRhmqSJ
	e3/DJB6C24oEZ6SpSkj80Za3RRg8BfZxcEflXlqBUEZTO4mEwbFlcInT0vJ/cYXMMEiNHUpOsn2
	BWT1UWg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114350

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Changelog:
============
- Removed ACE_make_checked_array_iterator that used deprecated stdext::checked_array_iterator
- Embarcadero C++ Builder bcc64x compiler support has been updated to match the C++Builder 12.2 release
- Added support for Linux platforms that use musl-libc instead of glibc
- Improved QNX support
- Add support for std::string_view to CDR classes
- Define ACE_HAS_CPP23 when we have a C++23 capable C++ compiler

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-connectivity/ace/{ace_8.0.1.bb => ace_8.0.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ace/{ace_8.0.1.bb => ace_8.0.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
rename to meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
index c79fba323c..64a4e7575f 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.1.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d2c090e9c730fd91677782d8e2091d77"
 
 DEPENDS += "openssl gperf-native"
 
-SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-8_0_1/ACE-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-8_0_2/ACE-${PV}.tar.bz2 \
            file://ace_config.patch \
            file://no_sysctl.patch \
           "
-SRC_URI[sha256sum] = "8d379f37d56db33f3ae447725b632d48b1c13e887593547ac3568e3b428c28f0"
+SRC_URI[sha256sum] = "dba38a905858ec4a44c04b4bbaef42b891adf061e8c0bbdaa1dce2c04fcccb7f"
 
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


