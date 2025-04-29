Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B61C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 09:04:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.14199.1745917471356904193
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 02:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SqYSNl01;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745917471; x=1777453471;
  h=from:to:cc:subject:date:message-id;
  bh=Rm4rNonfuqlZ57s+EbUjkqovc/vAGBo00xbk1SUK9D4=;
  b=SqYSNl01nnO66lkUSzXVlYRAJPyltTTp9uV2VAivrcT1zHxzTHINLDrE
   XOw8a5VZ4UMgXMQ+esmxrFkySYrKq0yUQ6qBO2xUKeoVHYcqUCDRcXz/X
   fJ4RzJsDG2eS0alVlacB/pIcsboWDxS86XEx49sdtxufJToBpnBmlAMy+
   zqQEt/zs5re+m7meZETRUQDGsTunvbK152BxKcFlwOS5Ajh0LPWQphgxV
   8QNmzBCRovek2omlvf/mwfe1KwBe5puRzYNCohbLgRbJ61eW8TWWQdw/J
   ZzfQwlKhMVjIbNg62DMMoDBTOejQ5uvo7B1LqulAB7AWia7lx2+vpsmPe
   w==;
X-CSE-ConnectionGUID: 97+qr3BpSYO9tEfLuKd04Q==
X-CSE-MsgGUID: oO7YVCibQ0y62y872bgZdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="176897071"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="176897071"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 18:04:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E414AD4C39
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 18:04:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9ACDCBF49B
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 18:04:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EB0881A0071;
	Tue, 29 Apr 2025 17:04:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] procmail: Add -Wno-implicit-int to fix error of do_compile
Date: Tue, 29 Apr 2025 17:04:19 +0800
Message-Id: <1745917459-28198-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117235

From: Wang Mingyu <wangmy@fujitsu.com>

Without the option -Wno-implicit-int , the following error will occur and the command  procmail will not be installed to target.
lmtp.c:54:8: error: type defaults to 'int' in declaration of 'ctopfd' [-Wimplicit-int]
   54 | static ctopfd;
      |        ^~~~~~
make[1]: [Makefile:239: lmtp.o] Error 1 (ignored)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 32fc12c7da..86d75e8c7c 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -37,7 +37,7 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
+    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
 }
 
 do_install() {
-- 
2.43.0


