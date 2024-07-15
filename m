Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206A9C52CDA
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.33824.1721034176768112774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BVYgw7t+;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034179; x=1752570179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W5EUwSO74+2be3Gst7Q0Yu4JnZDk2a3qMcuSXBQ7PTQ=;
  b=BVYgw7t+3Eamm6594ytQHyYE+TM5kwQCzoD/sbRtWwwCXL///ZRM/xrC
   NDxz6AcibOJGQhQG5NSRQYfY/e3aYwpdoxH3pUTTMH/pX5IPgwd+SLsJB
   H6q1LYl840MjnPKsO5Cohqc5UG8iV9AZSzElYSf5XsA3958xVCoFEewWg
   2OH87fT634QWTghsYm8pjocvQS13gc+va0dh020hk2fufIEsofHX6AXaH
   j8P/LXa9WmoV6gC0u0Oj/JQif+IEJTOElfuvyV/wAwjQ+9bEUw/qZM3pT
   flgtvQocUpyUHDTQH5G1FHZfc5iCDkaOM+h2pYoL4xe2m+i41soeVpw69
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="145974556"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="145974556"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:58 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D153CD6DE
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A15FD5083
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A979F6BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5A1AD1A000A;
	Mon, 15 Jul 2024 17:02:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/38] nano: upgrade 8.0 -> 8.1
Date: Mon, 15 Jul 2024 17:02:06 +0800
Message-Id: <1721034151-540-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10-2.438100-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrF2jIWUnlRQz+Aw16GgqpO0p2
	GcT5C1HO+22wfzAcyDNbfyRJXs6an2kMNGMkhniYuLt50vtxBA7UtXfJ7mutAUYx760ONDcW7v0
	MlFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q0D2WXLXdz+AQK0ZgbTOeKUdHKsyp8aef06SI
	YaJ07sj9SlINImIiLn+9AI+LLwgRy/WXZS/HqJ2gtuKBGekqUpnH7sbImOEBQzKjbVinVLBqUJV
	LynRNf7dS5BRB55WQEKkDUR43oRaZ/j/lrSxaab8XeIRu/i9v4HIGcVlqguM5AjDRrKQANG2cUX
	LaoQ8JzVRirBk7dv0usjkYn56VGqDVGHlX3Atkd4mTaDVMyoFGA7bUFBqh2V
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111334

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
• The idiom 'nano filename:linenumber' is understood only when the
  option --colonparsing (or 'set colonparsing') is used.
• Modern bindings are *not* activated when nano's invocation name
  starts with "e", as it jars with Debian's alternatives system.
• New bindable function 'cycle' first centers the current row,
  then moves it to the top of the viewport, then to the bottom.
  It is bound by default to ^L.
• Option --listsyntaxes/-z lists the names of available syntaxes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_8.0.bb => nano_8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.0.bb => nano_8.1.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_8.0.bb b/meta-oe/recipes-support/nano/nano_8.1.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_8.0.bb
rename to meta-oe/recipes-support/nano/nano_8.1.bb
index 56aa47f64..b060da3ff 100644
--- a/meta-oe/recipes-support/nano/nano_8.0.bb
+++ b/meta-oe/recipes-support/nano/nano_8.1.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c17f43fc0e37336b33ee50a209c701d5beb808adc2d9f089ca831b40539c9ac4"
+SRC_URI[sha256sum] = "93b3e3e9155ae389fe9ccf9cb7ab380eac29602835ba3077b22f64d0f0cbe8cb"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.34.1


