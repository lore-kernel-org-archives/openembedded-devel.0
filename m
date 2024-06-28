Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83697C30653
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 00:32:32 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.7073.1719534746471235147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 17:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PxXwNRqd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719534746; x=1751070746;
  h=from:to:cc:subject:date:message-id;
  bh=B9ZT3wmv5guldOnCcxdcm28ON4sFDHRfXH+NHXWA0dw=;
  b=PxXwNRqdS2gF7WxFieJ0e4dkF5pWYNsFNyRf4HenTD1SGn/P5KRIkEzn
   /0lByi4qebIyaCUcgAWKhhnzNB1S4swUsljeA+sCScNy2pZlDZE9vpbQQ
   DUP4vvd6rVYuQYzti8+I5QSrZ/l9r94LVdXPAkYjeIot188n/GeFXlVDs
   GMLnz4WmFCq+hbpPUG6XpK3L9yGqHdfaQk2V+h8blAINPWPCy521Xhmcq
   J8iq9f0pSIxCZYEscCV9gTrvEe8Q+Yfxng+i3mFXMKAFo3grnHHFtU7CE
   Hz80icbrUQs5kyPIdANFs10MIN5xC7scnnaeZ20JYFf5t7nAEXWlXYSqe
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="165156159"
X-IronPort-AV: E=Sophos;i="6.09,167,1716217200"; 
   d="scan'208";a="165156159"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 09:32:23 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA4B5D8001
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 09:32:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 28559D53E3
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 09:32:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2EDB6BF41
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 09:32:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C4E61A000B;
	Fri, 28 Jun 2024 08:32:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcurses-perl: upgrade 1.41 -> 1.45
Date: Fri, 28 Jun 2024 08:32:15 +0800
Message-Id: <1719534735-16932-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28486.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28486.003
X-TMASE-Result: 10--0.234900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/ycA1DjooimoM9avse85ISVrT+1Zj+w66+nYW
	2eXId8+t88cLohcr5LBgRWLzgh5fxi5dDCvWgzCwP0HVIeixJdBr2qJoNIuCjYHowpO8uJQP2d8
	mtRIRsUMppiuzBwGFPsYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgP/Ukuwze0bG/rvCkqsgk0Fxwb
	cSvw9PteLzNWBegCW2U9w4XVXDWCYLbigRnpKlKZx+7GyJjhAU0veVCPdon+DcnIOepukjcfkB8
	Zds3YqqD8XmFoHzRp8wWdlpEGxGH8G9vWh0b/VxbhSFjflAOoBYZa4N7+2k0D8tktHKR+YY7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 00:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111133

From: Wang Mingyu <wangmy@fujitsu.com>

0001-testtyp.c-Use-proper-prototype-for-main-function.patch
refreshed for 1.45

Changelog:
============
- Correct wide character data types to fix compile failure.
- Implement A_ITALIC
- Fix missing file introduced in 1.42 that prevents all builds from working.
- Add missing return type declarations so it works with modern C compilers.
- Rename test.syms program to testsyms, because it is a more conventional
  name format.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-Use-proper-prototype-for-main-function.patch | 16 +++++++---------
 ...urses-perl_1.41.bb => libcurses-perl_1.45.bb} |  2 +-
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta-perl/recipes-perl/libcurses/{libcurses-perl_1.41.bb => libcurses-perl_1.45.bb} (92%)

diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl/0001-testtyp.c-Use-proper-prototype-for-main-function.patch b/meta-perl/recipes-perl/libcurses/libcurses-perl/0001-testtyp.c-Use-proper-prototype-for-main-function.patch
index ab5af3fa8..37c81d9b8 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl/0001-testtyp.c-Use-proper-prototype-for-main-function.patch
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl/0001-testtyp.c-Use-proper-prototype-for-main-function.patch
@@ -17,24 +17,22 @@ int
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- testtyp.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
+ testtyp.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/testtyp.c b/testtyp.c
-index 949c3d4..4042f73 100644
+index 469cc48..6a48a77 100644
 --- a/testtyp.c
 +++ b/testtyp.c
-@@ -7,7 +7,8 @@
- #define _XOPEN_SOURCE_EXTENDED 1  /* We expect wide character functions */
- 
+@@ -10,6 +10,7 @@
  #include "c-config.h"
--
+ 
+ int
 -main() {
-+int
 +main(int argc, char *argv[]) {
    typedef SYM c_sym_t;
 +  return 0;
  }
 -- 
-2.37.3
+2.34.1
 
diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.41.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
similarity index 92%
rename from meta-perl/recipes-perl/libcurses/libcurses-perl_1.41.bb
rename to meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
index 421823d9c..7951e0ddb 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.41.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz \
            file://0001-testtyp.c-Use-proper-prototype-for-main-function.patch \
            "
 
-SRC_URI[sha256sum] = "fb9efea8c7b5ed5f8ea5dee49d35252accfc05ee6e75cb9a37ab7c847cd261d7"
+SRC_URI[sha256sum] = "84221e0013a2d64a0bae6a32bb44b1ae5734d2cb0465fb89af3e3abd6e05aeb2"
 
 S = "${WORKDIR}/Curses-${PV}"
 
-- 
2.34.1


