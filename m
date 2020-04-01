Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.2814.1585704798832089525
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 18:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,329,1580745600"; 
   d="scan'208";a="88306256"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Apr 2020 09:33:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6349D49DF126
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Apr 2020 09:22:59 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Apr 2020 09:33:15 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 1 Apr 2020 09:33:24 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] usb-modeswitch: upgrade 2.5.2 -> 2.6.0
Date: Wed, 1 Apr 2020 02:06:45 -0700
Message-ID: <1585732005-8348-7-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585732005-8348-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585732005-8348-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6349D49DF126.A164D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update:
  the followning message is added to COPYING file:
  The files usb_modeswitch.c, usb_modeswitch.h, usb_modeswitch.sh and
  usb_modeswitch_dispatcher.tcl are released under the conditions of
  the GPL 2 (or any later GPL version of your choice).
  The file dispatcher.c is released under the BSD-2-Clause

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{usb-modeswitch_2.5.2.bb => usb-modeswitch_2.6.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.5.2.bb => usb-modeswitch_2.6.0.bb} (78%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.2.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
similarity index 78%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.2.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
index 33e40b36b..baad34090 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.2.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=091556bd6d0154cd4c2d17a1bfc7380a"
 
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "16b9a8efa1bf8fbd7d5612757eae4f26"
-SRC_URI[sha256sum] = "abffac09c87eacd78e101545967dc25af7e989745b4276756d45dbf4008a2ea6"
+SRC_URI[md5sum] = "be73dcc84025794081a1d4d4e5a75e4c"
+SRC_URI[sha256sum] = "c215236e6bada6e659fc195a31d611ea298a4bdb4d57a0d68c553b56585f8ba3"
 
 inherit pkgconfig systemd
 
-- 
2.17.1



