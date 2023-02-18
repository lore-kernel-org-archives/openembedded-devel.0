Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE254C64EC4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 06:38:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.7864.1676702297856486101
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 22:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wkucJtRw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676702298; i=@fujitsu.com;
	bh=v48wPEH74ZPSm0Y6HAKjGUDyS90TnOQG/pGPk+BUzfk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wkucJtRwgBNwmUpQbRE4uZP5pOTAIegiOVVrkIGc6bETbo8jea8NhbC/JtdJXVeGl
	 TPe3uoKI9NNY1MTp6c0ZYPeADfq0Hhgh91nNjcClqJD0TTP4llSoa7tUmCUUyIyb/L
	 UQ9RLNOpiBdrxMfMT5h7wTxZYCzxJGv/ckkyKEMEXsyrBciH0RcrrBzXJUGuB+s6Xa
	 Cj6/YyAegEQ/yu8z/IbVEl9UQcAlc0n03KhrEicaKU/sC042eqwd26SSeppKcrA93P
	 hOoPBMnBncALXtQTm5UexJwNO4Fp2VmpHEh1TlIwLo5moebKl8VoajNhy31puIn2SG
	 Jm2pXCQUf4EvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWTei6EO
  yQeM3S4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPOzf/MBRPUK3r+32BtYNyl1MXIxSEk8JBR
  om/eChYI5wqTxOap/5ghnL2MEhubz7F1MXJysAlISdy4/x/MFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAtcWXiD7A4i4CqxPLDu1lAbF4BJ4mND3YxgtgSAgoSUx6+B6vhFHCWmPLrCROILQRUc3
  BuOzNEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtSovXDLyhbTeLquU3MExgFZyFpn4WkfQE
  j0ypG0+LUorLUIl0zvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzA4E0pZrixg3FO31+9Q4ySHExKoryft71PFuJLyk+pzEgszogvKs1JLT7EKMPBoSTB+
  7PgQ7KQYFFqempFWmYOMJJg0hIcPEoivKfTgdK8xQWJucWZ6RCpU4yKUuK8DKlACQGQREZpHl
  wbLHovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmXQqynSczrwRu+iugxUxAixcwvwVZXJK
  IkJJqYLIuUg5oZVp+8K6+0qT1X1LcXBN4pjlFX2TKy7pSUd5nuHzP8uaMC9cnhWr8D5p2Y1/Z
  97QbdodaI+ZoKdlt3XrkuSMH6zz1tefWnlyySYy1+dCux7vLs39FF3wxU9334TTDQrvfy9JFe
  beqLXQt9ey2qdvX4sKyXnHqr3nNX9JrrCz2Oy/p2LlV4f8Fq+MyPFJpnLHzbkQmXMs+7zH/M/
  8Bhw2XX6zxlMxMzleJNPndOKsgztvJ7bSyYe021kynqTzXGTUEjf7s2ntscfLHqwIa19b7sP7
  ZuWiFd9+sqDj/Q1FBl16Vrva+x5a92llK0jumY8MFMb6efNUdnUlzH4i9ipr5/nrW/yrX6a/e
  xSixFGckGmoxFxUnAgDq7yNCWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1676702296!201512!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24590 invoked from network); 18 Feb 2023 06:38:16 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 06:38:16 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8DE37142
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:16 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 81C1F7C
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 06:38:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libtevent: upgrade 0.13.0 -> 0.14.1
Date: Sat, 18 Feb 2023 14:37:53 +0800
Message-ID: <1676702273-30706-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676702273-30706-1-git-send-email-wangmy@fujitsu.com>
References: <1676702273-30706-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101133

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-configure-options-for-packages.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1-Add-configure-options-for-packages.patch | 25 +++++++++++--------
 ...ibtevent_0.13.0.bb => libtevent_0.14.1.bb} |  3 +--
 2 files changed, 15 insertions(+), 13 deletions(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.13.0.bb => libtevent_0.14.1.bb} (94%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
index d98559b4e..cb66adba9 100644
--- a/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtevent/libtevent/0001-Add-configure-options-for-packages.patch
@@ -21,13 +21,16 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
 Update patch to version 0.10.0
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Update patch to version 0.14.1
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- lib/replace/wscript | 87 ++++++++++++++++++++++++++++++++++-----------
+ lib/replace/wscript | 85 +++++++++++++++++++++++++++++++++++----------
  wscript             |  6 ++++
- 2 files changed, 73 insertions(+), 20 deletions(-)
+ 2 files changed, 73 insertions(+), 18 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 4c774d9..21a746a 100644
+index 5c2b750..28835ac 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
 @@ -25,6 +25,41 @@ def options(opt):
@@ -72,7 +75,7 @@ index 4c774d9..21a746a 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -35,12 +70,25 @@ def configure(conf):
+@@ -38,12 +73,27 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
@@ -82,8 +85,8 @@ index 4c774d9..21a746a 100644
 +    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
      conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
--    conf.CHECK_HEADERS('shadow.h sys/acl.h')
--    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
+     conf.CHECK_HEADERS('shadow.h sys/acl.h')
+     conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
 +    conf.CHECK_HEADERS('shadow.h')
 +    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
 +
@@ -99,10 +102,10 @@ index 4c774d9..21a746a 100644
 +    if Options.options.enable_libcap:
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
-     conf.CHECK_HEADERS('port.h')
      conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
      conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -110,8 +158,9 @@ def configure(conf):
+     conf.CHECK_HEADERS('sys/resource.h sys/security.h sys/shm.h sys/statfs.h sys/statvfs.h sys/termio.h')
+@@ -113,8 +163,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -114,7 +117,7 @@ index 4c774d9..21a746a 100644
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -434,20 +483,18 @@ def configure(conf):
+@@ -436,20 +487,18 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -148,7 +151,7 @@ index 4c774d9..21a746a 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 5c6f02c..75eecd4 100644
+index 0f6e92f..5a54f3a 100644
 --- a/wscript
 +++ b/wscript
 @@ -28,6 +28,12 @@ def options(opt):
@@ -165,5 +168,5 @@ index 5c6f02c..75eecd4 100644
  def configure(conf):
      conf.RECURSE('lib/replace')
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.13.0.bb b/meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb
similarity index 94%
rename from meta-networking/recipes-support/libtevent/libtevent_0.13.0.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb
index 0d898be82..b34c186ca 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.13.0.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.14.1.bb
@@ -17,8 +17,7 @@ SRC_URI:append:libc-musl = " file://cmocka-fix-musl-libc-conflicting-types-error
 
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
-SRC_URI[md5sum] = "9f413f3184f79a4deecd9444242a5dca"
-SRC_URI[sha256sum] = "b9437a917fa55344361beb64ec9e0042e99cae8879882a62dd38f6abe2371d0c"
+SRC_URI[sha256sum] = "ef85fcaa80ffd2351036ba4b347630fef2a1ac3da964a7f1820466bad03cd00d"
 
 inherit pkgconfig ptest waf-samba
 
-- 
2.34.1


