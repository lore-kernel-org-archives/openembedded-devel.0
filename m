Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B17C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:23:14 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.6277.1692865389303819706
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="117556646"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="117556646"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:23:06 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A0941D29E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:23:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CD56ED8BC0
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:23:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 056B66BECF;
	Thu, 24 Aug 2023 17:23:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] weechat: upgrade 4.0.3 -> 4.0.4
Date: Thu, 24 Aug 2023 16:22:39 +0800
Message-Id: <1692865359-3186-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.006
X-TMASE-Result: 10--1.305700-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrG24YVeuZGmN4YeSlHZYFor5f
	5ESu6yq/PwLvC4teLcdYpzPYxTjsZvXNEkgZOg/OPPov5T+l6PGUq+GQ/zyJdLfYIuZsOQ0s0EF
	5bRA2V8p3jugY9H2JvCbKA4TVSrUqQFyUHk5F1aKU6U60E/qMVGmQExgOfwV4V+Wy/X6EXDCcOr
	Zw4Ev/BbxCOIWkboHE9OIwD6WVVjc9d1nHWxkekPLeH1FBnhK01cuIRwt/4MiysPB8dBBorb8FH
	rw7frlurwUHN2woBLB6mL4lViyFysCiHTNtFGyJ3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTKYOc
	jnHaFYKOhzOa6g8KrbaLFsEfZ7JQRWGpbxBZSpx7DFHAP9ei7cZuOsBQ6XadeZG7ive14p0SjZk
	wKGMJCrrxFERH9MnvDK2cSDO2tNjWuKu6NwDT/x0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEV
	M/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104586

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Bug fixes::
-----------
  * core: fix integer overflow when setting integer option with '++N' or '--N'
  * core: fix increment/decrement of options weechat.notify.*
  * irc: add missing tags on multiline messages (issue #1987)
  * irc: fix redirection of command '/list' when the reply doesn't start with message 321 (start of /list)
  * irc: fix wrong time displayed for CTCP messages received from self nick (issue #2000)
  * logger: remove trailing empty line in display of backlog (issue #2002)
  * perl: fix display of non-ASCII chars after load of a script with Perl >= 5.38 (issue #1996)
  * script: adjust scroll after command '/script go N'
  * scripts: fix function string_parse_size on 32-bit systems (python and ruby) (issue #1999)
  * xfer: fix conversion of string to IPv4 on 32-bit systems (issue #1999)

Tests::
------------
  * irc: fix tests on function irc_join_compare_join_channel (issue #1997)
  * scripts: fix tests of functions print_date_tag, print_y_date_tags and hook_timer on 32-bit systems 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-irc/weechat/{weechat_4.0.3.bb => weechat_4.0.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.0.3.bb => weechat_4.0.4.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.0.3.bb b/meta-networking/recipes-irc/weechat/weechat_4.0.4.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_4.0.3.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.0.4.bb
index f78fd4fc90..d13764e4c7 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.0.3.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.0.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
 
-SRC_URI[sha256sum] = "880dbdce8e73b3f4802a082c4a1a7c61943dbc5867d7a95695e4e463c6535a92"
+SRC_URI[sha256sum] = "ae5f4979b5ada0339b84e741d5f7e481ee91e3fecd40a09907b64751829eb6f6"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


